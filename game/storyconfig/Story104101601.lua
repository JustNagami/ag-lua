return {
	Play410161001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 410161001
		arg_1_1.duration_ = 13.633

		local var_1_0 = {
			ja = 13.633,
			CriLanguages = 8.733,
			zh = 8.733
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
				arg_1_0:Play410161002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "STblack"

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
				local var_4_5 = arg_1_1.bgs_.STblack

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
					if iter_4_0 ~= "STblack" then
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
			local var_4_23 = 0.166666666666667

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.3
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building", "bgm_activity_2_8_story_tara_building.awb")
			end

			local var_4_30 = 0
			local var_4_31 = 1

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "effect"

				arg_1_1:AudioAction(var_4_32, var_4_33, "se_story_122_01", "se_story_122_01_dizzy_loop", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.875

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

				local var_4_37 = arg_1_1:FormatText(StoryNameCfg[596].name)

				arg_1_1.leftNameTxt_.text = var_4_37

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_38 = arg_1_1:GetWordFromCfg(410161001)
				local var_4_39 = arg_1_1:FormatText(var_4_38.content)

				arg_1_1.text_.text = var_4_39

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_40 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161001", "story_v_out_410161.awb") ~= 0 then
					local var_4_43 = manager.audio:GetVoiceLength("story_v_out_410161", "410161001", "story_v_out_410161.awb") / 1000

					if var_4_43 + var_4_34 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_43 + var_4_34
					end

					if var_4_38.prefab_name ~= "" and arg_1_1.actors_[var_4_38.prefab_name] ~= nil then
						local var_4_44 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_38.prefab_name].transform, "story_v_out_410161", "410161001", "story_v_out_410161.awb")

						arg_1_1:RecordAudio("410161001", var_4_44)
						arg_1_1:RecordAudio("410161001", var_4_44)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_410161", "410161001", "story_v_out_410161.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_410161", "410161001", "story_v_out_410161.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_45 = var_4_34 + 0.3
			local var_4_46 = math.max(var_4_35, arg_1_1.talkMaxDuration)

			if var_4_45 <= arg_1_1.time_ and arg_1_1.time_ < var_4_45 + var_4_46 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_45) / var_4_46

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_45 + var_4_46 and arg_1_1.time_ < var_4_45 + var_4_46 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play410161002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 410161002
		arg_7_1.duration_ = 8.233

		local var_7_0 = {
			ja = 8.233,
			CriLanguages = 6.633,
			zh = 6.633
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
				arg_7_0:Play410161003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.75

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[600].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(410161002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161002", "story_v_out_410161.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_410161", "410161002", "story_v_out_410161.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_410161", "410161002", "story_v_out_410161.awb")

						arg_7_1:RecordAudio("410161002", var_10_9)
						arg_7_1:RecordAudio("410161002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_410161", "410161002", "story_v_out_410161.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_410161", "410161002", "story_v_out_410161.awb")
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
	Play410161003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 410161003
		arg_11_1.duration_ = 8.166

		local var_11_0 = {
			ja = 8.166,
			CriLanguages = 5.433,
			zh = 5.433
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
				arg_11_0:Play410161004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.35

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[596].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(410161003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161003", "story_v_out_410161.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_410161", "410161003", "story_v_out_410161.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_410161", "410161003", "story_v_out_410161.awb")

						arg_11_1:RecordAudio("410161003", var_14_9)
						arg_11_1:RecordAudio("410161003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_410161", "410161003", "story_v_out_410161.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_410161", "410161003", "story_v_out_410161.awb")
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
	Play410161004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 410161004
		arg_15_1.duration_ = 2.366

		local var_15_0 = {
			ja = 1.3,
			CriLanguages = 2.366,
			zh = 2.366
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
				arg_15_0:Play410161005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.075

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[612].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1061_split_4")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(410161004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161004", "story_v_out_410161.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_410161", "410161004", "story_v_out_410161.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_410161", "410161004", "story_v_out_410161.awb")

						arg_15_1:RecordAudio("410161004", var_18_9)
						arg_15_1:RecordAudio("410161004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_410161", "410161004", "story_v_out_410161.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_410161", "410161004", "story_v_out_410161.awb")
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
	Play410161005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 410161005
		arg_19_1.duration_ = 7

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play410161006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "ST67"

			if arg_19_1.bgs_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(arg_19_1.paintGo_)

				var_22_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_0)
				var_22_1.name = var_22_0
				var_22_1.transform.parent = arg_19_1.stage_.transform
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_0] = var_22_1
			end

			local var_22_2 = 0

			if var_22_2 < arg_19_1.time_ and arg_19_1.time_ <= var_22_2 + arg_22_0 then
				local var_22_3 = manager.ui.mainCamera.transform.localPosition
				local var_22_4 = Vector3.New(0, 0, 10) + Vector3.New(var_22_3.x, var_22_3.y, 0)
				local var_22_5 = arg_19_1.bgs_.ST67

				var_22_5.transform.localPosition = var_22_4
				var_22_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_6 = var_22_5:GetComponent("SpriteRenderer")

				if var_22_6 and var_22_6.sprite then
					local var_22_7 = (var_22_5.transform.localPosition - var_22_3).z
					local var_22_8 = manager.ui.mainCameraCom_
					local var_22_9 = 2 * var_22_7 * Mathf.Tan(var_22_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_10 = var_22_9 * var_22_8.aspect
					local var_22_11 = var_22_6.sprite.bounds.size.x
					local var_22_12 = var_22_6.sprite.bounds.size.y
					local var_22_13 = var_22_10 / var_22_11
					local var_22_14 = var_22_9 / var_22_12
					local var_22_15 = var_22_14 < var_22_13 and var_22_13 or var_22_14

					var_22_5.transform.localScale = Vector3.New(var_22_15, var_22_15, 0)
				end

				for iter_22_0, iter_22_1 in pairs(arg_19_1.bgs_) do
					if iter_22_0 ~= "ST67" then
						iter_22_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_22_16 = 0

			if var_22_16 < arg_19_1.time_ and arg_19_1.time_ <= var_22_16 + arg_22_0 then
				arg_19_1.mask_.enabled = true
				arg_19_1.mask_.raycastTarget = true

				arg_19_1:SetGaussion(false)
			end

			local var_22_17 = 2

			if var_22_16 <= arg_19_1.time_ and arg_19_1.time_ < var_22_16 + var_22_17 then
				local var_22_18 = (arg_19_1.time_ - var_22_16) / var_22_17
				local var_22_19 = Color.New(0, 0, 0)

				var_22_19.a = Mathf.Lerp(1, 0, var_22_18)
				arg_19_1.mask_.color = var_22_19
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				local var_22_20 = Color.New(0, 0, 0)
				local var_22_21 = 0

				arg_19_1.mask_.enabled = false
				var_22_20.a = var_22_21
				arg_19_1.mask_.color = var_22_20
			end

			local var_22_22 = "ST67_blur"

			if arg_19_1.bgs_[var_22_22] == nil then
				local var_22_23 = Object.Instantiate(arg_19_1.blurPaintGo_)
				local var_22_24 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_22_22)

				var_22_23:GetComponent("SpriteRenderer").sprite = var_22_24
				var_22_23.name = var_22_22
				var_22_23.transform.parent = arg_19_1.stage_.transform
				var_22_23.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.bgs_[var_22_22] = var_22_23
			end

			local var_22_25 = 0
			local var_22_26 = arg_19_1.bgs_[var_22_22]

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				local var_22_27 = manager.ui.mainCamera.transform.localPosition
				local var_22_28 = Vector3.New(0, 0, 10) + Vector3.New(var_22_27.x, var_22_27.y, 0)

				var_22_26.transform.localPosition = var_22_28
				var_22_26.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_22_29 = var_22_26:GetComponent("SpriteRenderer")

				if var_22_29 and var_22_29.sprite then
					local var_22_30 = (var_22_26.transform.localPosition - var_22_27).z
					local var_22_31 = manager.ui.mainCameraCom_
					local var_22_32 = 2 * var_22_30 * Mathf.Tan(var_22_31.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_22_33 = var_22_32 * var_22_31.aspect
					local var_22_34 = var_22_29.sprite.bounds.size.x
					local var_22_35 = var_22_29.sprite.bounds.size.y
					local var_22_36 = var_22_33 / var_22_34
					local var_22_37 = var_22_32 / var_22_35
					local var_22_38 = var_22_37 < var_22_36 and var_22_36 or var_22_37

					var_22_26.transform.localScale = Vector3.New(var_22_38, var_22_38, 0)
				end
			end

			local var_22_39 = 0.2

			if var_22_25 <= arg_19_1.time_ and arg_19_1.time_ < var_22_25 + var_22_39 then
				local var_22_40 = (arg_19_1.time_ - var_22_25) / var_22_39
				local var_22_41 = Color.New(1, 1, 1)

				var_22_41.a = Mathf.Lerp(0, 1, var_22_40)

				var_22_26:GetComponent("SpriteRenderer").material:SetColor("_Color", var_22_41)
			end

			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_42 = 2
			local var_22_43 = 0.975

			if var_22_42 < arg_19_1.time_ and arg_19_1.time_ <= var_22_42 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_44 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_44:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_45 = arg_19_1:GetWordFromCfg(410161005)
				local var_22_46 = arg_19_1:FormatText(var_22_45.content)

				arg_19_1.text_.text = var_22_46

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_47 = 39
				local var_22_48 = utf8.len(var_22_46)
				local var_22_49 = var_22_47 <= 0 and var_22_43 or var_22_43 * (var_22_48 / var_22_47)

				if var_22_49 > 0 and var_22_43 < var_22_49 then
					arg_19_1.talkMaxDuration = var_22_49
					var_22_42 = var_22_42 + 0.3

					if var_22_49 + var_22_42 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_49 + var_22_42
					end
				end

				arg_19_1.text_.text = var_22_46
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_50 = var_22_42 + 0.3
			local var_22_51 = math.max(var_22_43, arg_19_1.talkMaxDuration)

			if var_22_50 <= arg_19_1.time_ and arg_19_1.time_ < var_22_50 + var_22_51 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_50) / var_22_51

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_50 + var_22_51 and arg_19_1.time_ < var_22_50 + var_22_51 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play410161006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 410161006
		arg_25_1.duration_ = 12.266

		local var_25_0 = {
			ja = 12.266,
			CriLanguages = 8.9,
			zh = 8.9
		}
		local var_25_1 = manager.audio:GetLocalizationFlag()

		if var_25_0[var_25_1] ~= nil then
			arg_25_1.duration_ = var_25_0[var_25_1]
		end

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play410161007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 1

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[596].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, true)
				arg_25_1.iconController_:SetSelectedState("hero")

				arg_25_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10059_split_2")

				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(410161006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 40
				local var_28_6 = utf8.len(var_28_4)
				local var_28_7 = var_28_5 <= 0 and var_28_1 or var_28_1 * (var_28_6 / var_28_5)

				if var_28_7 > 0 and var_28_1 < var_28_7 then
					arg_25_1.talkMaxDuration = var_28_7

					if var_28_7 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_7 + var_28_0
					end
				end

				arg_25_1.text_.text = var_28_4
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161006", "story_v_out_410161.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_410161", "410161006", "story_v_out_410161.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_410161", "410161006", "story_v_out_410161.awb")

						arg_25_1:RecordAudio("410161006", var_28_9)
						arg_25_1:RecordAudio("410161006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_410161", "410161006", "story_v_out_410161.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_410161", "410161006", "story_v_out_410161.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_10 = math.max(var_28_1, arg_25_1.talkMaxDuration)

			if var_28_0 <= arg_25_1.time_ and arg_25_1.time_ < var_28_0 + var_28_10 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_0) / var_28_10

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_0 + var_28_10 and arg_25_1.time_ < var_28_0 + var_28_10 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play410161007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 410161007
		arg_29_1.duration_ = 9.633

		local var_29_0 = {
			ja = 9.633,
			CriLanguages = 9.366,
			zh = 9.366
		}
		local var_29_1 = manager.audio:GetLocalizationFlag()

		if var_29_0[var_29_1] ~= nil then
			arg_29_1.duration_ = var_29_0[var_29_1]
		end

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play410161008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = 0
			local var_32_1 = 0.875

			if var_32_0 < arg_29_1.time_ and arg_29_1.time_ <= var_32_0 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_2 = arg_29_1:FormatText(StoryNameCfg[600].name)

				arg_29_1.leftNameTxt_.text = var_32_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, true)
				arg_29_1.iconController_:SetSelectedState("hero")

				arg_29_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062")

				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_3 = arg_29_1:GetWordFromCfg(410161007)
				local var_32_4 = arg_29_1:FormatText(var_32_3.content)

				arg_29_1.text_.text = var_32_4

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_5 = 35
				local var_32_6 = utf8.len(var_32_4)
				local var_32_7 = var_32_5 <= 0 and var_32_1 or var_32_1 * (var_32_6 / var_32_5)

				if var_32_7 > 0 and var_32_1 < var_32_7 then
					arg_29_1.talkMaxDuration = var_32_7

					if var_32_7 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_7 + var_32_0
					end
				end

				arg_29_1.text_.text = var_32_4
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161007", "story_v_out_410161.awb") ~= 0 then
					local var_32_8 = manager.audio:GetVoiceLength("story_v_out_410161", "410161007", "story_v_out_410161.awb") / 1000

					if var_32_8 + var_32_0 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_8 + var_32_0
					end

					if var_32_3.prefab_name ~= "" and arg_29_1.actors_[var_32_3.prefab_name] ~= nil then
						local var_32_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_3.prefab_name].transform, "story_v_out_410161", "410161007", "story_v_out_410161.awb")

						arg_29_1:RecordAudio("410161007", var_32_9)
						arg_29_1:RecordAudio("410161007", var_32_9)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_410161", "410161007", "story_v_out_410161.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_410161", "410161007", "story_v_out_410161.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_10 = math.max(var_32_1, arg_29_1.talkMaxDuration)

			if var_32_0 <= arg_29_1.time_ and arg_29_1.time_ < var_32_0 + var_32_10 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_0) / var_32_10

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_0 + var_32_10 and arg_29_1.time_ < var_32_0 + var_32_10 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play410161008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 410161008
		arg_33_1.duration_ = 9

		local var_33_0 = {
			ja = 9,
			CriLanguages = 7.533,
			zh = 7.533
		}
		local var_33_1 = manager.audio:GetLocalizationFlag()

		if var_33_0[var_33_1] ~= nil then
			arg_33_1.duration_ = var_33_0[var_33_1]
		end

		SetActive(arg_33_1.tipsGo_, false)

		function arg_33_1.onSingleLineFinish_()
			arg_33_1.onSingleLineUpdate_ = nil
			arg_33_1.onSingleLineFinish_ = nil
			arg_33_1.state_ = "waiting"
		end

		function arg_33_1.playNext_(arg_35_0)
			if arg_35_0 == 1 then
				arg_33_0:Play410161009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = 0
			local var_36_1 = 0.725

			if var_36_0 < arg_33_1.time_ and arg_33_1.time_ <= var_36_0 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_2 = arg_33_1:FormatText(StoryNameCfg[600].name)

				arg_33_1.leftNameTxt_.text = var_36_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, true)
				arg_33_1.iconController_:SetSelectedState("hero")

				arg_33_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10062_split_1")

				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_3 = arg_33_1:GetWordFromCfg(410161008)
				local var_36_4 = arg_33_1:FormatText(var_36_3.content)

				arg_33_1.text_.text = var_36_4

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_5 = 29
				local var_36_6 = utf8.len(var_36_4)
				local var_36_7 = var_36_5 <= 0 and var_36_1 or var_36_1 * (var_36_6 / var_36_5)

				if var_36_7 > 0 and var_36_1 < var_36_7 then
					arg_33_1.talkMaxDuration = var_36_7

					if var_36_7 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_7 + var_36_0
					end
				end

				arg_33_1.text_.text = var_36_4
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161008", "story_v_out_410161.awb") ~= 0 then
					local var_36_8 = manager.audio:GetVoiceLength("story_v_out_410161", "410161008", "story_v_out_410161.awb") / 1000

					if var_36_8 + var_36_0 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_8 + var_36_0
					end

					if var_36_3.prefab_name ~= "" and arg_33_1.actors_[var_36_3.prefab_name] ~= nil then
						local var_36_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_3.prefab_name].transform, "story_v_out_410161", "410161008", "story_v_out_410161.awb")

						arg_33_1:RecordAudio("410161008", var_36_9)
						arg_33_1:RecordAudio("410161008", var_36_9)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_410161", "410161008", "story_v_out_410161.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_410161", "410161008", "story_v_out_410161.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_10 = math.max(var_36_1, arg_33_1.talkMaxDuration)

			if var_36_0 <= arg_33_1.time_ and arg_33_1.time_ < var_36_0 + var_36_10 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_0) / var_36_10

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_0 + var_36_10 and arg_33_1.time_ < var_36_0 + var_36_10 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play410161009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 410161009
		arg_37_1.duration_ = 6.2

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play410161010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 1

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				local var_40_2 = "stop"
				local var_40_3 = "effect"

				arg_37_1:AudioAction(var_40_2, var_40_3, "se_story_122_01", "se_story_122_01_dizzy", "")
			end

			local var_40_4 = "10059"

			if arg_37_1.actors_[var_40_4] == nil then
				local var_40_5 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_40_4), arg_37_1.canvasGo_.transform)

				var_40_5.transform:SetSiblingIndex(1)

				var_40_5.name = var_40_4
				var_40_5.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_37_1.actors_[var_40_4] = var_40_5
			end

			local var_40_6 = arg_37_1.actors_["10059"]
			local var_40_7 = 0

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 and arg_37_1.var_.actorSpriteComps10059 == nil then
				arg_37_1.var_.actorSpriteComps10059 = var_40_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_8 = 0.034

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_8 then
				local var_40_9 = (arg_37_1.time_ - var_40_7) / var_40_8

				if arg_37_1.var_.actorSpriteComps10059 then
					for iter_40_0, iter_40_1 in pairs(arg_37_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_40_1 then
							local var_40_10 = Mathf.Lerp(iter_40_1.color.r, 0.5, var_40_9)

							iter_40_1.color = Color.New(var_40_10, var_40_10, var_40_10)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_7 + var_40_8 and arg_37_1.time_ < var_40_7 + var_40_8 + arg_40_0 and arg_37_1.var_.actorSpriteComps10059 then
				local var_40_11 = 0.5

				for iter_40_2, iter_40_3 in pairs(arg_37_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_40_3 then
						iter_40_3.color = Color.New(var_40_11, var_40_11, var_40_11)
					end
				end

				arg_37_1.var_.actorSpriteComps10059 = nil
			end

			local var_40_12 = "10062"

			if arg_37_1.actors_[var_40_12] == nil then
				local var_40_13 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_40_12), arg_37_1.canvasGo_.transform)

				var_40_13.transform:SetSiblingIndex(1)

				var_40_13.name = var_40_12
				var_40_13.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_37_1.actors_[var_40_12] = var_40_13
			end

			local var_40_14 = arg_37_1.actors_["10062"]
			local var_40_15 = 0

			if var_40_15 < arg_37_1.time_ and arg_37_1.time_ <= var_40_15 + arg_40_0 and arg_37_1.var_.actorSpriteComps10062 == nil then
				arg_37_1.var_.actorSpriteComps10062 = var_40_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_16 = 0.034

			if var_40_15 <= arg_37_1.time_ and arg_37_1.time_ < var_40_15 + var_40_16 then
				local var_40_17 = (arg_37_1.time_ - var_40_15) / var_40_16

				if arg_37_1.var_.actorSpriteComps10062 then
					for iter_40_4, iter_40_5 in pairs(arg_37_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_40_5 then
							local var_40_18 = Mathf.Lerp(iter_40_5.color.r, 0.5, var_40_17)

							iter_40_5.color = Color.New(var_40_18, var_40_18, var_40_18)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_15 + var_40_16 and arg_37_1.time_ < var_40_15 + var_40_16 + arg_40_0 and arg_37_1.var_.actorSpriteComps10062 then
				local var_40_19 = 0.5

				for iter_40_6, iter_40_7 in pairs(arg_37_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_40_7 then
						iter_40_7.color = Color.New(var_40_19, var_40_19, var_40_19)
					end
				end

				arg_37_1.var_.actorSpriteComps10062 = nil
			end

			local var_40_20 = 0

			if var_40_20 < arg_37_1.time_ and arg_37_1.time_ <= var_40_20 + arg_40_0 then
				arg_37_1.mask_.enabled = true
				arg_37_1.mask_.raycastTarget = true

				arg_37_1:SetGaussion(false)
			end

			local var_40_21 = 1

			if var_40_20 <= arg_37_1.time_ and arg_37_1.time_ < var_40_20 + var_40_21 then
				local var_40_22 = (arg_37_1.time_ - var_40_20) / var_40_21
				local var_40_23 = Color.New(0, 0, 0)

				var_40_23.a = Mathf.Lerp(0, 1, var_40_22)
				arg_37_1.mask_.color = var_40_23
			end

			if arg_37_1.time_ >= var_40_20 + var_40_21 and arg_37_1.time_ < var_40_20 + var_40_21 + arg_40_0 then
				local var_40_24 = Color.New(0, 0, 0)

				var_40_24.a = 1
				arg_37_1.mask_.color = var_40_24
			end

			local var_40_25 = 1

			if var_40_25 < arg_37_1.time_ and arg_37_1.time_ <= var_40_25 + arg_40_0 then
				arg_37_1.mask_.enabled = true
				arg_37_1.mask_.raycastTarget = true

				arg_37_1:SetGaussion(false)
			end

			local var_40_26 = 1.5

			if var_40_25 <= arg_37_1.time_ and arg_37_1.time_ < var_40_25 + var_40_26 then
				local var_40_27 = (arg_37_1.time_ - var_40_25) / var_40_26
				local var_40_28 = Color.New(0, 0, 0)

				var_40_28.a = Mathf.Lerp(1, 0, var_40_27)
				arg_37_1.mask_.color = var_40_28
			end

			if arg_37_1.time_ >= var_40_25 + var_40_26 and arg_37_1.time_ < var_40_25 + var_40_26 + arg_40_0 then
				local var_40_29 = Color.New(0, 0, 0)
				local var_40_30 = 0

				arg_37_1.mask_.enabled = false
				var_40_29.a = var_40_30
				arg_37_1.mask_.color = var_40_29
			end

			if arg_37_1.frameCnt_ <= 1 then
				arg_37_1.dialog_:SetActive(false)
			end

			local var_40_31 = 1.2
			local var_40_32 = 0.95

			if var_40_31 < arg_37_1.time_ and arg_37_1.time_ <= var_40_31 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0

				arg_37_1.dialog_:SetActive(true)

				local var_40_33 = LeanTween.value(arg_37_1.dialog_, 0, 1, 0.3)

				var_40_33:setOnUpdate(LuaHelper.FloatAction(function(arg_41_0)
					arg_37_1.dialogCg_.alpha = arg_41_0
				end))
				var_40_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_37_1.dialog_)
					var_40_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_37_1.duration_ = arg_37_1.duration_ + 0.3

				SetActive(arg_37_1.leftNameGo_, false)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_34 = arg_37_1:GetWordFromCfg(410161009)
				local var_40_35 = arg_37_1:FormatText(var_40_34.content)

				arg_37_1.text_.text = var_40_35

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_36 = 38
				local var_40_37 = utf8.len(var_40_35)
				local var_40_38 = var_40_36 <= 0 and var_40_32 or var_40_32 * (var_40_37 / var_40_36)

				if var_40_38 > 0 and var_40_32 < var_40_38 then
					arg_37_1.talkMaxDuration = var_40_38
					var_40_31 = var_40_31 + 0.3

					if var_40_38 + var_40_31 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_38 + var_40_31
					end
				end

				arg_37_1.text_.text = var_40_35
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)
				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_39 = var_40_31 + 0.3
			local var_40_40 = math.max(var_40_32, arg_37_1.talkMaxDuration)

			if var_40_39 <= arg_37_1.time_ and arg_37_1.time_ < var_40_39 + var_40_40 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_39) / var_40_40

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_39 + var_40_40 and arg_37_1.time_ < var_40_39 + var_40_40 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play410161010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 410161010
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play410161011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = "ST67_blur"

			if arg_43_1.bgs_[var_46_0] == nil then
				local var_46_1 = Object.Instantiate(arg_43_1.blurPaintGo_)
				local var_46_2 = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_46_0)

				var_46_1:GetComponent("SpriteRenderer").sprite = var_46_2
				var_46_1.name = var_46_0
				var_46_1.transform.parent = arg_43_1.stage_.transform
				var_46_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_43_1.bgs_[var_46_0] = var_46_1
			end

			local var_46_3 = 0
			local var_46_4 = arg_43_1.bgs_[var_46_0]

			if var_46_3 < arg_43_1.time_ and arg_43_1.time_ <= var_46_3 + arg_46_0 then
				local var_46_5 = manager.ui.mainCamera.transform.localPosition
				local var_46_6 = Vector3.New(0, 0, 10) + Vector3.New(var_46_5.x, var_46_5.y, 0)

				var_46_4.transform.localPosition = var_46_6
				var_46_4.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_46_7 = var_46_4:GetComponent("SpriteRenderer")

				if var_46_7 and var_46_7.sprite then
					local var_46_8 = (var_46_4.transform.localPosition - var_46_5).z
					local var_46_9 = manager.ui.mainCameraCom_
					local var_46_10 = 2 * var_46_8 * Mathf.Tan(var_46_9.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_46_11 = var_46_10 * var_46_9.aspect
					local var_46_12 = var_46_7.sprite.bounds.size.x
					local var_46_13 = var_46_7.sprite.bounds.size.y
					local var_46_14 = var_46_11 / var_46_12
					local var_46_15 = var_46_10 / var_46_13
					local var_46_16 = var_46_15 < var_46_14 and var_46_14 or var_46_15

					var_46_4.transform.localScale = Vector3.New(var_46_16, var_46_16, 0)
				end
			end

			local var_46_17 = 1

			if var_46_3 <= arg_43_1.time_ and arg_43_1.time_ < var_46_3 + var_46_17 then
				local var_46_18 = (arg_43_1.time_ - var_46_3) / var_46_17
				local var_46_19 = Color.New(1, 1, 1)

				var_46_19.a = Mathf.Lerp(1, 0, var_46_18)

				var_46_4:GetComponent("SpriteRenderer").material:SetColor("_Color", var_46_19)
			end

			local var_46_20 = 0
			local var_46_21 = 1.775

			if var_46_20 < arg_43_1.time_ and arg_43_1.time_ <= var_46_20 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_22 = arg_43_1:GetWordFromCfg(410161010)
				local var_46_23 = arg_43_1:FormatText(var_46_22.content)

				arg_43_1.text_.text = var_46_23

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_24 = 71
				local var_46_25 = utf8.len(var_46_23)
				local var_46_26 = var_46_24 <= 0 and var_46_21 or var_46_21 * (var_46_25 / var_46_24)

				if var_46_26 > 0 and var_46_21 < var_46_26 then
					arg_43_1.talkMaxDuration = var_46_26

					if var_46_26 + var_46_20 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_26 + var_46_20
					end
				end

				arg_43_1.text_.text = var_46_23
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_27 = math.max(var_46_21, arg_43_1.talkMaxDuration)

			if var_46_20 <= arg_43_1.time_ and arg_43_1.time_ < var_46_20 + var_46_27 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_20) / var_46_27

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_20 + var_46_27 and arg_43_1.time_ < var_46_20 + var_46_27 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play410161011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 410161011
		arg_47_1.duration_ = 4.6

		local var_47_0 = {
			ja = 4.6,
			CriLanguages = 2.133,
			zh = 2.133
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
				arg_47_0:Play410161012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["10062"].transform
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 then
				arg_47_1.var_.moveOldPos10062 = var_50_0.localPosition
				var_50_0.localScale = Vector3.New(1, 1, 1)

				arg_47_1:CheckSpriteTmpPos("10062", 4)

				local var_50_2 = var_50_0.childCount

				for iter_50_0 = 0, var_50_2 - 1 do
					local var_50_3 = var_50_0:GetChild(iter_50_0)

					if var_50_3.name == "split_2" or not string.find(var_50_3.name, "split") then
						var_50_3.gameObject:SetActive(true)
					else
						var_50_3.gameObject:SetActive(false)
					end
				end
			end

			local var_50_4 = 0.001

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_4 then
				local var_50_5 = (arg_47_1.time_ - var_50_1) / var_50_4
				local var_50_6 = Vector3.New(370, -390, -290)

				var_50_0.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos10062, var_50_6, var_50_5)
			end

			if arg_47_1.time_ >= var_50_1 + var_50_4 and arg_47_1.time_ < var_50_1 + var_50_4 + arg_50_0 then
				var_50_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_50_7 = arg_47_1.actors_["10062"]
			local var_50_8 = 0

			if var_50_8 < arg_47_1.time_ and arg_47_1.time_ <= var_50_8 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 == nil then
				arg_47_1.var_.actorSpriteComps10062 = var_50_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_50_9 = 0.034

			if var_50_8 <= arg_47_1.time_ and arg_47_1.time_ < var_50_8 + var_50_9 then
				local var_50_10 = (arg_47_1.time_ - var_50_8) / var_50_9

				if arg_47_1.var_.actorSpriteComps10062 then
					for iter_50_1, iter_50_2 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_50_2 then
							local var_50_11 = Mathf.Lerp(iter_50_2.color.r, 1, var_50_10)

							iter_50_2.color = Color.New(var_50_11, var_50_11, var_50_11)
						end
					end
				end
			end

			if arg_47_1.time_ >= var_50_8 + var_50_9 and arg_47_1.time_ < var_50_8 + var_50_9 + arg_50_0 and arg_47_1.var_.actorSpriteComps10062 then
				local var_50_12 = 1

				for iter_50_3, iter_50_4 in pairs(arg_47_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_50_4 then
						iter_50_4.color = Color.New(var_50_12, var_50_12, var_50_12)
					end
				end

				arg_47_1.var_.actorSpriteComps10062 = nil
			end

			local var_50_13 = 0
			local var_50_14 = 0.633333333333333

			if var_50_13 < arg_47_1.time_ and arg_47_1.time_ <= var_50_13 + arg_50_0 then
				local var_50_15 = "stop"
				local var_50_16 = "effect"

				arg_47_1:AudioAction(var_50_15, var_50_16, "se_story_122_01", "se_story_122_01_dizzy_loop", "")
			end

			local var_50_17 = 0
			local var_50_18 = 0.125

			if var_50_17 < arg_47_1.time_ and arg_47_1.time_ <= var_50_17 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_19 = arg_47_1:FormatText(StoryNameCfg[600].name)

				arg_47_1.leftNameTxt_.text = var_50_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_20 = arg_47_1:GetWordFromCfg(410161011)
				local var_50_21 = arg_47_1:FormatText(var_50_20.content)

				arg_47_1.text_.text = var_50_21

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_22 = 5
				local var_50_23 = utf8.len(var_50_21)
				local var_50_24 = var_50_22 <= 0 and var_50_18 or var_50_18 * (var_50_23 / var_50_22)

				if var_50_24 > 0 and var_50_18 < var_50_24 then
					arg_47_1.talkMaxDuration = var_50_24

					if var_50_24 + var_50_17 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_24 + var_50_17
					end
				end

				arg_47_1.text_.text = var_50_21
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161011", "story_v_out_410161.awb") ~= 0 then
					local var_50_25 = manager.audio:GetVoiceLength("story_v_out_410161", "410161011", "story_v_out_410161.awb") / 1000

					if var_50_25 + var_50_17 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_25 + var_50_17
					end

					if var_50_20.prefab_name ~= "" and arg_47_1.actors_[var_50_20.prefab_name] ~= nil then
						local var_50_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_20.prefab_name].transform, "story_v_out_410161", "410161011", "story_v_out_410161.awb")

						arg_47_1:RecordAudio("410161011", var_50_26)
						arg_47_1:RecordAudio("410161011", var_50_26)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_410161", "410161011", "story_v_out_410161.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_410161", "410161011", "story_v_out_410161.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_27 = math.max(var_50_18, arg_47_1.talkMaxDuration)

			if var_50_17 <= arg_47_1.time_ and arg_47_1.time_ < var_50_17 + var_50_27 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_17) / var_50_27

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_17 + var_50_27 and arg_47_1.time_ < var_50_17 + var_50_27 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play410161012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 410161012
		arg_51_1.duration_ = 2.666

		local var_51_0 = {
			ja = 1.2,
			CriLanguages = 2.666,
			zh = 2.666
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
				arg_51_0:Play410161013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = "1061"

			if arg_51_1.actors_[var_54_0] == nil then
				local var_54_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_54_0), arg_51_1.canvasGo_.transform)

				var_54_1.transform:SetSiblingIndex(1)

				var_54_1.name = var_54_0
				var_54_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_51_1.actors_[var_54_0] = var_54_1
			end

			local var_54_2 = arg_51_1.actors_["1061"].transform
			local var_54_3 = 0

			if var_54_3 < arg_51_1.time_ and arg_51_1.time_ <= var_54_3 + arg_54_0 then
				arg_51_1.var_.moveOldPos1061 = var_54_2.localPosition
				var_54_2.localScale = Vector3.New(1, 1, 1)

				arg_51_1:CheckSpriteTmpPos("1061", 2)

				local var_54_4 = var_54_2.childCount

				for iter_54_0 = 0, var_54_4 - 1 do
					local var_54_5 = var_54_2:GetChild(iter_54_0)

					if var_54_5.name == "split_5" or not string.find(var_54_5.name, "split") then
						var_54_5.gameObject:SetActive(true)
					else
						var_54_5.gameObject:SetActive(false)
					end
				end
			end

			local var_54_6 = 0.001

			if var_54_3 <= arg_51_1.time_ and arg_51_1.time_ < var_54_3 + var_54_6 then
				local var_54_7 = (arg_51_1.time_ - var_54_3) / var_54_6
				local var_54_8 = Vector3.New(-390, -490, 18)

				var_54_2.localPosition = Vector3.Lerp(arg_51_1.var_.moveOldPos1061, var_54_8, var_54_7)
			end

			if arg_51_1.time_ >= var_54_3 + var_54_6 and arg_51_1.time_ < var_54_3 + var_54_6 + arg_54_0 then
				var_54_2.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_54_9 = arg_51_1.actors_["1061"]
			local var_54_10 = 0

			if var_54_10 < arg_51_1.time_ and arg_51_1.time_ <= var_54_10 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 == nil then
				arg_51_1.var_.actorSpriteComps1061 = var_54_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_11 = 0.034

			if var_54_10 <= arg_51_1.time_ and arg_51_1.time_ < var_54_10 + var_54_11 then
				local var_54_12 = (arg_51_1.time_ - var_54_10) / var_54_11

				if arg_51_1.var_.actorSpriteComps1061 then
					for iter_54_1, iter_54_2 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_54_2 then
							local var_54_13 = Mathf.Lerp(iter_54_2.color.r, 1, var_54_12)

							iter_54_2.color = Color.New(var_54_13, var_54_13, var_54_13)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_10 + var_54_11 and arg_51_1.time_ < var_54_10 + var_54_11 + arg_54_0 and arg_51_1.var_.actorSpriteComps1061 then
				local var_54_14 = 1

				for iter_54_3, iter_54_4 in pairs(arg_51_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_54_4 then
						iter_54_4.color = Color.New(var_54_14, var_54_14, var_54_14)
					end
				end

				arg_51_1.var_.actorSpriteComps1061 = nil
			end

			local var_54_15 = arg_51_1.actors_["10062"]
			local var_54_16 = 0

			if var_54_16 < arg_51_1.time_ and arg_51_1.time_ <= var_54_16 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 == nil then
				arg_51_1.var_.actorSpriteComps10062 = var_54_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_54_17 = 0.034

			if var_54_16 <= arg_51_1.time_ and arg_51_1.time_ < var_54_16 + var_54_17 then
				local var_54_18 = (arg_51_1.time_ - var_54_16) / var_54_17

				if arg_51_1.var_.actorSpriteComps10062 then
					for iter_54_5, iter_54_6 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_54_6 then
							local var_54_19 = Mathf.Lerp(iter_54_6.color.r, 0.5, var_54_18)

							iter_54_6.color = Color.New(var_54_19, var_54_19, var_54_19)
						end
					end
				end
			end

			if arg_51_1.time_ >= var_54_16 + var_54_17 and arg_51_1.time_ < var_54_16 + var_54_17 + arg_54_0 and arg_51_1.var_.actorSpriteComps10062 then
				local var_54_20 = 0.5

				for iter_54_7, iter_54_8 in pairs(arg_51_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_54_8 then
						iter_54_8.color = Color.New(var_54_20, var_54_20, var_54_20)
					end
				end

				arg_51_1.var_.actorSpriteComps10062 = nil
			end

			local var_54_21 = 0
			local var_54_22 = 0.1

			if var_54_21 < arg_51_1.time_ and arg_51_1.time_ <= var_54_21 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_23 = arg_51_1:FormatText(StoryNameCfg[612].name)

				arg_51_1.leftNameTxt_.text = var_54_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_24 = arg_51_1:GetWordFromCfg(410161012)
				local var_54_25 = arg_51_1:FormatText(var_54_24.content)

				arg_51_1.text_.text = var_54_25

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_26 = 4
				local var_54_27 = utf8.len(var_54_25)
				local var_54_28 = var_54_26 <= 0 and var_54_22 or var_54_22 * (var_54_27 / var_54_26)

				if var_54_28 > 0 and var_54_22 < var_54_28 then
					arg_51_1.talkMaxDuration = var_54_28

					if var_54_28 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_28 + var_54_21
					end
				end

				arg_51_1.text_.text = var_54_25
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161012", "story_v_out_410161.awb") ~= 0 then
					local var_54_29 = manager.audio:GetVoiceLength("story_v_out_410161", "410161012", "story_v_out_410161.awb") / 1000

					if var_54_29 + var_54_21 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_29 + var_54_21
					end

					if var_54_24.prefab_name ~= "" and arg_51_1.actors_[var_54_24.prefab_name] ~= nil then
						local var_54_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_24.prefab_name].transform, "story_v_out_410161", "410161012", "story_v_out_410161.awb")

						arg_51_1:RecordAudio("410161012", var_54_30)
						arg_51_1:RecordAudio("410161012", var_54_30)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_410161", "410161012", "story_v_out_410161.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_410161", "410161012", "story_v_out_410161.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_31 = math.max(var_54_22, arg_51_1.talkMaxDuration)

			if var_54_21 <= arg_51_1.time_ and arg_51_1.time_ < var_54_21 + var_54_31 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_21) / var_54_31

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_21 + var_54_31 and arg_51_1.time_ < var_54_21 + var_54_31 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play410161013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 410161013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play410161014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1061"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.actorSpriteComps1061 == nil then
				arg_55_1.var_.actorSpriteComps1061 = var_58_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_58_2 = 0.034

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.actorSpriteComps1061 then
					for iter_58_0, iter_58_1 in pairs(arg_55_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_58_1 then
							local var_58_4 = Mathf.Lerp(iter_58_1.color.r, 0.5, var_58_3)

							iter_58_1.color = Color.New(var_58_4, var_58_4, var_58_4)
						end
					end
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.actorSpriteComps1061 then
				local var_58_5 = 0.5

				for iter_58_2, iter_58_3 in pairs(arg_55_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_58_3 then
						iter_58_3.color = Color.New(var_58_5, var_58_5, var_58_5)
					end
				end

				arg_55_1.var_.actorSpriteComps1061 = nil
			end

			local var_58_6 = 0
			local var_58_7 = 1.35

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, false)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_8 = arg_55_1:GetWordFromCfg(410161013)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 54
				local var_58_11 = utf8.len(var_58_9)
				local var_58_12 = var_58_10 <= 0 and var_58_7 or var_58_7 * (var_58_11 / var_58_10)

				if var_58_12 > 0 and var_58_7 < var_58_12 then
					arg_55_1.talkMaxDuration = var_58_12

					if var_58_12 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_9
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)
				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_13 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_13 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_13

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_13 and arg_55_1.time_ < var_58_6 + var_58_13 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play410161014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 410161014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play410161015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.075

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

				local var_62_2 = arg_59_1:GetWordFromCfg(410161014)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 43
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
	Play410161015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 410161015
		arg_63_1.duration_ = 17.9

		local var_63_0 = {
			ja = 17.9,
			CriLanguages = 7.4,
			zh = 7.4
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
				arg_63_0:Play410161016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["10062"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos10062 = var_66_0.localPosition
				var_66_0.localScale = Vector3.New(1, 1, 1)

				arg_63_1:CheckSpriteTmpPos("10062", 4)

				local var_66_2 = var_66_0.childCount

				for iter_66_0 = 0, var_66_2 - 1 do
					local var_66_3 = var_66_0:GetChild(iter_66_0)

					if var_66_3.name == "" or not string.find(var_66_3.name, "split") then
						var_66_3.gameObject:SetActive(true)
					else
						var_66_3.gameObject:SetActive(false)
					end
				end
			end

			local var_66_4 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_4 then
				local var_66_5 = (arg_63_1.time_ - var_66_1) / var_66_4
				local var_66_6 = Vector3.New(370, -390, -290)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos10062, var_66_6, var_66_5)
			end

			if arg_63_1.time_ >= var_66_1 + var_66_4 and arg_63_1.time_ < var_66_1 + var_66_4 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_66_7 = arg_63_1.actors_["10062"]
			local var_66_8 = 0

			if var_66_8 < arg_63_1.time_ and arg_63_1.time_ <= var_66_8 + arg_66_0 and arg_63_1.var_.actorSpriteComps10062 == nil then
				arg_63_1.var_.actorSpriteComps10062 = var_66_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_66_9 = 0.034

			if var_66_8 <= arg_63_1.time_ and arg_63_1.time_ < var_66_8 + var_66_9 then
				local var_66_10 = (arg_63_1.time_ - var_66_8) / var_66_9

				if arg_63_1.var_.actorSpriteComps10062 then
					for iter_66_1, iter_66_2 in pairs(arg_63_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_66_2 then
							local var_66_11 = Mathf.Lerp(iter_66_2.color.r, 1, var_66_10)

							iter_66_2.color = Color.New(var_66_11, var_66_11, var_66_11)
						end
					end
				end
			end

			if arg_63_1.time_ >= var_66_8 + var_66_9 and arg_63_1.time_ < var_66_8 + var_66_9 + arg_66_0 and arg_63_1.var_.actorSpriteComps10062 then
				local var_66_12 = 1

				for iter_66_3, iter_66_4 in pairs(arg_63_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_66_4 then
						iter_66_4.color = Color.New(var_66_12, var_66_12, var_66_12)
					end
				end

				arg_63_1.var_.actorSpriteComps10062 = nil
			end

			local var_66_13 = 0
			local var_66_14 = 0.775

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_15 = arg_63_1:FormatText(StoryNameCfg[600].name)

				arg_63_1.leftNameTxt_.text = var_66_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_16 = arg_63_1:GetWordFromCfg(410161015)
				local var_66_17 = arg_63_1:FormatText(var_66_16.content)

				arg_63_1.text_.text = var_66_17

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_18 = 31
				local var_66_19 = utf8.len(var_66_17)
				local var_66_20 = var_66_18 <= 0 and var_66_14 or var_66_14 * (var_66_19 / var_66_18)

				if var_66_20 > 0 and var_66_14 < var_66_20 then
					arg_63_1.talkMaxDuration = var_66_20

					if var_66_20 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_20 + var_66_13
					end
				end

				arg_63_1.text_.text = var_66_17
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161015", "story_v_out_410161.awb") ~= 0 then
					local var_66_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161015", "story_v_out_410161.awb") / 1000

					if var_66_21 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_21 + var_66_13
					end

					if var_66_16.prefab_name ~= "" and arg_63_1.actors_[var_66_16.prefab_name] ~= nil then
						local var_66_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_16.prefab_name].transform, "story_v_out_410161", "410161015", "story_v_out_410161.awb")

						arg_63_1:RecordAudio("410161015", var_66_22)
						arg_63_1:RecordAudio("410161015", var_66_22)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_410161", "410161015", "story_v_out_410161.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_410161", "410161015", "story_v_out_410161.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_23 = math.max(var_66_14, arg_63_1.talkMaxDuration)

			if var_66_13 <= arg_63_1.time_ and arg_63_1.time_ < var_66_13 + var_66_23 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_13) / var_66_23

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_13 + var_66_23 and arg_63_1.time_ < var_66_13 + var_66_23 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play410161016 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 410161016
		arg_67_1.duration_ = 15.666

		local var_67_0 = {
			ja = 15.666,
			CriLanguages = 10.433,
			zh = 10.433
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
				arg_67_0:Play410161017(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = arg_67_1.actors_["10062"].transform
			local var_70_1 = 0

			if var_70_1 < arg_67_1.time_ and arg_67_1.time_ <= var_70_1 + arg_70_0 then
				arg_67_1.var_.moveOldPos10062 = var_70_0.localPosition
				var_70_0.localScale = Vector3.New(1, 1, 1)

				arg_67_1:CheckSpriteTmpPos("10062", 4)

				local var_70_2 = var_70_0.childCount

				for iter_70_0 = 0, var_70_2 - 1 do
					local var_70_3 = var_70_0:GetChild(iter_70_0)

					if var_70_3.name == "" or not string.find(var_70_3.name, "split") then
						var_70_3.gameObject:SetActive(true)
					else
						var_70_3.gameObject:SetActive(false)
					end
				end
			end

			local var_70_4 = 0.001

			if var_70_1 <= arg_67_1.time_ and arg_67_1.time_ < var_70_1 + var_70_4 then
				local var_70_5 = (arg_67_1.time_ - var_70_1) / var_70_4
				local var_70_6 = Vector3.New(370, -390, -290)

				var_70_0.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10062, var_70_6, var_70_5)
			end

			if arg_67_1.time_ >= var_70_1 + var_70_4 and arg_67_1.time_ < var_70_1 + var_70_4 + arg_70_0 then
				var_70_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_70_7 = arg_67_1.actors_["10062"]
			local var_70_8 = 0

			if var_70_8 < arg_67_1.time_ and arg_67_1.time_ <= var_70_8 + arg_70_0 and arg_67_1.var_.actorSpriteComps10062 == nil then
				arg_67_1.var_.actorSpriteComps10062 = var_70_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_70_9 = 0.034

			if var_70_8 <= arg_67_1.time_ and arg_67_1.time_ < var_70_8 + var_70_9 then
				local var_70_10 = (arg_67_1.time_ - var_70_8) / var_70_9

				if arg_67_1.var_.actorSpriteComps10062 then
					for iter_70_1, iter_70_2 in pairs(arg_67_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_70_2 then
							local var_70_11 = Mathf.Lerp(iter_70_2.color.r, 1, var_70_10)

							iter_70_2.color = Color.New(var_70_11, var_70_11, var_70_11)
						end
					end
				end
			end

			if arg_67_1.time_ >= var_70_8 + var_70_9 and arg_67_1.time_ < var_70_8 + var_70_9 + arg_70_0 and arg_67_1.var_.actorSpriteComps10062 then
				local var_70_12 = 1

				for iter_70_3, iter_70_4 in pairs(arg_67_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_70_4 then
						iter_70_4.color = Color.New(var_70_12, var_70_12, var_70_12)
					end
				end

				arg_67_1.var_.actorSpriteComps10062 = nil
			end

			local var_70_13 = 0
			local var_70_14 = 1

			if var_70_13 < arg_67_1.time_ and arg_67_1.time_ <= var_70_13 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_15 = arg_67_1:FormatText(StoryNameCfg[600].name)

				arg_67_1.leftNameTxt_.text = var_70_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_16 = arg_67_1:GetWordFromCfg(410161016)
				local var_70_17 = arg_67_1:FormatText(var_70_16.content)

				arg_67_1.text_.text = var_70_17

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_18 = 40
				local var_70_19 = utf8.len(var_70_17)
				local var_70_20 = var_70_18 <= 0 and var_70_14 or var_70_14 * (var_70_19 / var_70_18)

				if var_70_20 > 0 and var_70_14 < var_70_20 then
					arg_67_1.talkMaxDuration = var_70_20

					if var_70_20 + var_70_13 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_20 + var_70_13
					end
				end

				arg_67_1.text_.text = var_70_17
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161016", "story_v_out_410161.awb") ~= 0 then
					local var_70_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161016", "story_v_out_410161.awb") / 1000

					if var_70_21 + var_70_13 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_21 + var_70_13
					end

					if var_70_16.prefab_name ~= "" and arg_67_1.actors_[var_70_16.prefab_name] ~= nil then
						local var_70_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_16.prefab_name].transform, "story_v_out_410161", "410161016", "story_v_out_410161.awb")

						arg_67_1:RecordAudio("410161016", var_70_22)
						arg_67_1:RecordAudio("410161016", var_70_22)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_410161", "410161016", "story_v_out_410161.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_410161", "410161016", "story_v_out_410161.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_23 = math.max(var_70_14, arg_67_1.talkMaxDuration)

			if var_70_13 <= arg_67_1.time_ and arg_67_1.time_ < var_70_13 + var_70_23 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_13) / var_70_23

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_13 + var_70_23 and arg_67_1.time_ < var_70_13 + var_70_23 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play410161017 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 410161017
		arg_71_1.duration_ = 5

		SetActive(arg_71_1.tipsGo_, false)

		function arg_71_1.onSingleLineFinish_()
			arg_71_1.onSingleLineUpdate_ = nil
			arg_71_1.onSingleLineFinish_ = nil
			arg_71_1.state_ = "waiting"
		end

		function arg_71_1.playNext_(arg_73_0)
			if arg_73_0 == 1 then
				arg_71_0:Play410161018(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = arg_71_1.actors_["10062"]
			local var_74_1 = 0

			if var_74_1 < arg_71_1.time_ and arg_71_1.time_ <= var_74_1 + arg_74_0 and arg_71_1.var_.actorSpriteComps10062 == nil then
				arg_71_1.var_.actorSpriteComps10062 = var_74_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_74_2 = 0.034

			if var_74_1 <= arg_71_1.time_ and arg_71_1.time_ < var_74_1 + var_74_2 then
				local var_74_3 = (arg_71_1.time_ - var_74_1) / var_74_2

				if arg_71_1.var_.actorSpriteComps10062 then
					for iter_74_0, iter_74_1 in pairs(arg_71_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_74_1 then
							local var_74_4 = Mathf.Lerp(iter_74_1.color.r, 0.5, var_74_3)

							iter_74_1.color = Color.New(var_74_4, var_74_4, var_74_4)
						end
					end
				end
			end

			if arg_71_1.time_ >= var_74_1 + var_74_2 and arg_71_1.time_ < var_74_1 + var_74_2 + arg_74_0 and arg_71_1.var_.actorSpriteComps10062 then
				local var_74_5 = 0.5

				for iter_74_2, iter_74_3 in pairs(arg_71_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_74_3 then
						iter_74_3.color = Color.New(var_74_5, var_74_5, var_74_5)
					end
				end

				arg_71_1.var_.actorSpriteComps10062 = nil
			end

			local var_74_6 = 0
			local var_74_7 = 0.95

			if var_74_6 < arg_71_1.time_ and arg_71_1.time_ <= var_74_6 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, false)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(410161017)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 38
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_7 or var_74_7 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_7 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_6 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_6
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)
				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_13 = math.max(var_74_7, arg_71_1.talkMaxDuration)

			if var_74_6 <= arg_71_1.time_ and arg_71_1.time_ < var_74_6 + var_74_13 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_6) / var_74_13

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_6 + var_74_13 and arg_71_1.time_ < var_74_6 + var_74_13 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play410161018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 410161018
		arg_75_1.duration_ = 11.233

		local var_75_0 = {
			ja = 11.233,
			CriLanguages = 10.666,
			zh = 10.666
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
				arg_75_0:Play410161019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1061"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1061 = var_78_0.localPosition
				var_78_0.localScale = Vector3.New(1, 1, 1)

				arg_75_1:CheckSpriteTmpPos("1061", 2)

				local var_78_2 = var_78_0.childCount

				for iter_78_0 = 0, var_78_2 - 1 do
					local var_78_3 = var_78_0:GetChild(iter_78_0)

					if var_78_3.name == "split_5" or not string.find(var_78_3.name, "split") then
						var_78_3.gameObject:SetActive(true)
					else
						var_78_3.gameObject:SetActive(false)
					end
				end
			end

			local var_78_4 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_4 then
				local var_78_5 = (arg_75_1.time_ - var_78_1) / var_78_4
				local var_78_6 = Vector3.New(-390, -490, 18)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1061, var_78_6, var_78_5)
			end

			if arg_75_1.time_ >= var_78_1 + var_78_4 and arg_75_1.time_ < var_78_1 + var_78_4 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_78_7 = arg_75_1.actors_["1061"]
			local var_78_8 = 0

			if var_78_8 < arg_75_1.time_ and arg_75_1.time_ <= var_78_8 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 == nil then
				arg_75_1.var_.actorSpriteComps1061 = var_78_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_78_9 = 0.034

			if var_78_8 <= arg_75_1.time_ and arg_75_1.time_ < var_78_8 + var_78_9 then
				local var_78_10 = (arg_75_1.time_ - var_78_8) / var_78_9

				if arg_75_1.var_.actorSpriteComps1061 then
					for iter_78_1, iter_78_2 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_78_2 then
							local var_78_11 = Mathf.Lerp(iter_78_2.color.r, 1, var_78_10)

							iter_78_2.color = Color.New(var_78_11, var_78_11, var_78_11)
						end
					end
				end
			end

			if arg_75_1.time_ >= var_78_8 + var_78_9 and arg_75_1.time_ < var_78_8 + var_78_9 + arg_78_0 and arg_75_1.var_.actorSpriteComps1061 then
				local var_78_12 = 1

				for iter_78_3, iter_78_4 in pairs(arg_75_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_78_4 then
						iter_78_4.color = Color.New(var_78_12, var_78_12, var_78_12)
					end
				end

				arg_75_1.var_.actorSpriteComps1061 = nil
			end

			local var_78_13 = 0
			local var_78_14 = 0.9

			if var_78_13 < arg_75_1.time_ and arg_75_1.time_ <= var_78_13 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, true)

				local var_78_15 = arg_75_1:FormatText(StoryNameCfg[612].name)

				arg_75_1.leftNameTxt_.text = var_78_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_75_1.leftNameTxt_.transform)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1.leftNameTxt_.text)
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_16 = arg_75_1:GetWordFromCfg(410161018)
				local var_78_17 = arg_75_1:FormatText(var_78_16.content)

				arg_75_1.text_.text = var_78_17

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_18 = 36
				local var_78_19 = utf8.len(var_78_17)
				local var_78_20 = var_78_18 <= 0 and var_78_14 or var_78_14 * (var_78_19 / var_78_18)

				if var_78_20 > 0 and var_78_14 < var_78_20 then
					arg_75_1.talkMaxDuration = var_78_20

					if var_78_20 + var_78_13 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_20 + var_78_13
					end
				end

				arg_75_1.text_.text = var_78_17
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161018", "story_v_out_410161.awb") ~= 0 then
					local var_78_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161018", "story_v_out_410161.awb") / 1000

					if var_78_21 + var_78_13 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_21 + var_78_13
					end

					if var_78_16.prefab_name ~= "" and arg_75_1.actors_[var_78_16.prefab_name] ~= nil then
						local var_78_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_75_1.actors_[var_78_16.prefab_name].transform, "story_v_out_410161", "410161018", "story_v_out_410161.awb")

						arg_75_1:RecordAudio("410161018", var_78_22)
						arg_75_1:RecordAudio("410161018", var_78_22)
					else
						arg_75_1:AudioAction("play", "voice", "story_v_out_410161", "410161018", "story_v_out_410161.awb")
					end

					arg_75_1:RecordHistoryTalkVoice("story_v_out_410161", "410161018", "story_v_out_410161.awb")
				end

				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_23 = math.max(var_78_14, arg_75_1.talkMaxDuration)

			if var_78_13 <= arg_75_1.time_ and arg_75_1.time_ < var_78_13 + var_78_23 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_13) / var_78_23

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_13 + var_78_23 and arg_75_1.time_ < var_78_13 + var_78_23 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play410161019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 410161019
		arg_79_1.duration_ = 22.233

		local var_79_0 = {
			ja = 22.233,
			CriLanguages = 8.3,
			zh = 8.3
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
				arg_79_0:Play410161020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["10062"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos10062 = var_82_0.localPosition
				var_82_0.localScale = Vector3.New(1, 1, 1)

				arg_79_1:CheckSpriteTmpPos("10062", 4)

				local var_82_2 = var_82_0.childCount

				for iter_82_0 = 0, var_82_2 - 1 do
					local var_82_3 = var_82_0:GetChild(iter_82_0)

					if var_82_3.name == "split_2" or not string.find(var_82_3.name, "split") then
						var_82_3.gameObject:SetActive(true)
					else
						var_82_3.gameObject:SetActive(false)
					end
				end
			end

			local var_82_4 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_4 then
				local var_82_5 = (arg_79_1.time_ - var_82_1) / var_82_4
				local var_82_6 = Vector3.New(370, -390, -290)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos10062, var_82_6, var_82_5)
			end

			if arg_79_1.time_ >= var_82_1 + var_82_4 and arg_79_1.time_ < var_82_1 + var_82_4 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_82_7 = arg_79_1.actors_["10062"]
			local var_82_8 = 0

			if var_82_8 < arg_79_1.time_ and arg_79_1.time_ <= var_82_8 + arg_82_0 and arg_79_1.var_.actorSpriteComps10062 == nil then
				arg_79_1.var_.actorSpriteComps10062 = var_82_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_9 = 0.034

			if var_82_8 <= arg_79_1.time_ and arg_79_1.time_ < var_82_8 + var_82_9 then
				local var_82_10 = (arg_79_1.time_ - var_82_8) / var_82_9

				if arg_79_1.var_.actorSpriteComps10062 then
					for iter_82_1, iter_82_2 in pairs(arg_79_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_82_2 then
							local var_82_11 = Mathf.Lerp(iter_82_2.color.r, 1, var_82_10)

							iter_82_2.color = Color.New(var_82_11, var_82_11, var_82_11)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_8 + var_82_9 and arg_79_1.time_ < var_82_8 + var_82_9 + arg_82_0 and arg_79_1.var_.actorSpriteComps10062 then
				local var_82_12 = 1

				for iter_82_3, iter_82_4 in pairs(arg_79_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_82_4 then
						iter_82_4.color = Color.New(var_82_12, var_82_12, var_82_12)
					end
				end

				arg_79_1.var_.actorSpriteComps10062 = nil
			end

			local var_82_13 = arg_79_1.actors_["1061"]
			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 and arg_79_1.var_.actorSpriteComps1061 == nil then
				arg_79_1.var_.actorSpriteComps1061 = var_82_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_82_15 = 0.034

			if var_82_14 <= arg_79_1.time_ and arg_79_1.time_ < var_82_14 + var_82_15 then
				local var_82_16 = (arg_79_1.time_ - var_82_14) / var_82_15

				if arg_79_1.var_.actorSpriteComps1061 then
					for iter_82_5, iter_82_6 in pairs(arg_79_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_82_6 then
							local var_82_17 = Mathf.Lerp(iter_82_6.color.r, 0.5, var_82_16)

							iter_82_6.color = Color.New(var_82_17, var_82_17, var_82_17)
						end
					end
				end
			end

			if arg_79_1.time_ >= var_82_14 + var_82_15 and arg_79_1.time_ < var_82_14 + var_82_15 + arg_82_0 and arg_79_1.var_.actorSpriteComps1061 then
				local var_82_18 = 0.5

				for iter_82_7, iter_82_8 in pairs(arg_79_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_82_8 then
						iter_82_8.color = Color.New(var_82_18, var_82_18, var_82_18)
					end
				end

				arg_79_1.var_.actorSpriteComps1061 = nil
			end

			local var_82_19 = 0
			local var_82_20 = 0.7

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[600].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(410161019)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 28
				local var_82_25 = utf8.len(var_82_23)
				local var_82_26 = var_82_24 <= 0 and var_82_20 or var_82_20 * (var_82_25 / var_82_24)

				if var_82_26 > 0 and var_82_20 < var_82_26 then
					arg_79_1.talkMaxDuration = var_82_26

					if var_82_26 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_26 + var_82_19
					end
				end

				arg_79_1.text_.text = var_82_23
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161019", "story_v_out_410161.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161019", "story_v_out_410161.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_410161", "410161019", "story_v_out_410161.awb")

						arg_79_1:RecordAudio("410161019", var_82_28)
						arg_79_1:RecordAudio("410161019", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_410161", "410161019", "story_v_out_410161.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_410161", "410161019", "story_v_out_410161.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_29 = math.max(var_82_20, arg_79_1.talkMaxDuration)

			if var_82_19 <= arg_79_1.time_ and arg_79_1.time_ < var_82_19 + var_82_29 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_19) / var_82_29

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_19 + var_82_29 and arg_79_1.time_ < var_82_19 + var_82_29 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play410161020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 410161020
		arg_83_1.duration_ = 13.2

		local var_83_0 = {
			ja = 13.2,
			CriLanguages = 7.1,
			zh = 7.1
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
				arg_83_0:Play410161021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1061"].transform
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 then
				arg_83_1.var_.moveOldPos1061 = var_86_0.localPosition
				var_86_0.localScale = Vector3.New(1, 1, 1)

				arg_83_1:CheckSpriteTmpPos("1061", 2)

				local var_86_2 = var_86_0.childCount

				for iter_86_0 = 0, var_86_2 - 1 do
					local var_86_3 = var_86_0:GetChild(iter_86_0)

					if var_86_3.name == "split_5" or not string.find(var_86_3.name, "split") then
						var_86_3.gameObject:SetActive(true)
					else
						var_86_3.gameObject:SetActive(false)
					end
				end
			end

			local var_86_4 = 0.001

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_4 then
				local var_86_5 = (arg_83_1.time_ - var_86_1) / var_86_4
				local var_86_6 = Vector3.New(-390, -490, 18)

				var_86_0.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1061, var_86_6, var_86_5)
			end

			if arg_83_1.time_ >= var_86_1 + var_86_4 and arg_83_1.time_ < var_86_1 + var_86_4 + arg_86_0 then
				var_86_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_86_7 = arg_83_1.actors_["1061"]
			local var_86_8 = 0

			if var_86_8 < arg_83_1.time_ and arg_83_1.time_ <= var_86_8 + arg_86_0 and arg_83_1.var_.actorSpriteComps1061 == nil then
				arg_83_1.var_.actorSpriteComps1061 = var_86_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_9 = 0.034

			if var_86_8 <= arg_83_1.time_ and arg_83_1.time_ < var_86_8 + var_86_9 then
				local var_86_10 = (arg_83_1.time_ - var_86_8) / var_86_9

				if arg_83_1.var_.actorSpriteComps1061 then
					for iter_86_1, iter_86_2 in pairs(arg_83_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_86_2 then
							local var_86_11 = Mathf.Lerp(iter_86_2.color.r, 1, var_86_10)

							iter_86_2.color = Color.New(var_86_11, var_86_11, var_86_11)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_8 + var_86_9 and arg_83_1.time_ < var_86_8 + var_86_9 + arg_86_0 and arg_83_1.var_.actorSpriteComps1061 then
				local var_86_12 = 1

				for iter_86_3, iter_86_4 in pairs(arg_83_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_86_4 then
						iter_86_4.color = Color.New(var_86_12, var_86_12, var_86_12)
					end
				end

				arg_83_1.var_.actorSpriteComps1061 = nil
			end

			local var_86_13 = arg_83_1.actors_["10062"]
			local var_86_14 = 0

			if var_86_14 < arg_83_1.time_ and arg_83_1.time_ <= var_86_14 + arg_86_0 and arg_83_1.var_.actorSpriteComps10062 == nil then
				arg_83_1.var_.actorSpriteComps10062 = var_86_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_86_15 = 0.034

			if var_86_14 <= arg_83_1.time_ and arg_83_1.time_ < var_86_14 + var_86_15 then
				local var_86_16 = (arg_83_1.time_ - var_86_14) / var_86_15

				if arg_83_1.var_.actorSpriteComps10062 then
					for iter_86_5, iter_86_6 in pairs(arg_83_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_86_6 then
							local var_86_17 = Mathf.Lerp(iter_86_6.color.r, 0.5, var_86_16)

							iter_86_6.color = Color.New(var_86_17, var_86_17, var_86_17)
						end
					end
				end
			end

			if arg_83_1.time_ >= var_86_14 + var_86_15 and arg_83_1.time_ < var_86_14 + var_86_15 + arg_86_0 and arg_83_1.var_.actorSpriteComps10062 then
				local var_86_18 = 0.5

				for iter_86_7, iter_86_8 in pairs(arg_83_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_86_8 then
						iter_86_8.color = Color.New(var_86_18, var_86_18, var_86_18)
					end
				end

				arg_83_1.var_.actorSpriteComps10062 = nil
			end

			local var_86_19 = 0
			local var_86_20 = 0.75

			if var_86_19 < arg_83_1.time_ and arg_83_1.time_ <= var_86_19 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_21 = arg_83_1:FormatText(StoryNameCfg[612].name)

				arg_83_1.leftNameTxt_.text = var_86_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_22 = arg_83_1:GetWordFromCfg(410161020)
				local var_86_23 = arg_83_1:FormatText(var_86_22.content)

				arg_83_1.text_.text = var_86_23

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_24 = 30
				local var_86_25 = utf8.len(var_86_23)
				local var_86_26 = var_86_24 <= 0 and var_86_20 or var_86_20 * (var_86_25 / var_86_24)

				if var_86_26 > 0 and var_86_20 < var_86_26 then
					arg_83_1.talkMaxDuration = var_86_26

					if var_86_26 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_26 + var_86_19
					end
				end

				arg_83_1.text_.text = var_86_23
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161020", "story_v_out_410161.awb") ~= 0 then
					local var_86_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161020", "story_v_out_410161.awb") / 1000

					if var_86_27 + var_86_19 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_27 + var_86_19
					end

					if var_86_22.prefab_name ~= "" and arg_83_1.actors_[var_86_22.prefab_name] ~= nil then
						local var_86_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_22.prefab_name].transform, "story_v_out_410161", "410161020", "story_v_out_410161.awb")

						arg_83_1:RecordAudio("410161020", var_86_28)
						arg_83_1:RecordAudio("410161020", var_86_28)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_410161", "410161020", "story_v_out_410161.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_410161", "410161020", "story_v_out_410161.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_29 = math.max(var_86_20, arg_83_1.talkMaxDuration)

			if var_86_19 <= arg_83_1.time_ and arg_83_1.time_ < var_86_19 + var_86_29 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_19) / var_86_29

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_19 + var_86_29 and arg_83_1.time_ < var_86_19 + var_86_29 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play410161021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 410161021
		arg_87_1.duration_ = 3.066

		local var_87_0 = {
			ja = 3.066,
			CriLanguages = 1.933,
			zh = 1.933
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
				arg_87_0:Play410161022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["10062"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos10062 = var_90_0.localPosition
				var_90_0.localScale = Vector3.New(1, 1, 1)

				arg_87_1:CheckSpriteTmpPos("10062", 4)

				local var_90_2 = var_90_0.childCount

				for iter_90_0 = 0, var_90_2 - 1 do
					local var_90_3 = var_90_0:GetChild(iter_90_0)

					if var_90_3.name == "split_4" or not string.find(var_90_3.name, "split") then
						var_90_3.gameObject:SetActive(true)
					else
						var_90_3.gameObject:SetActive(false)
					end
				end
			end

			local var_90_4 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_4 then
				local var_90_5 = (arg_87_1.time_ - var_90_1) / var_90_4
				local var_90_6 = Vector3.New(370, -390, -290)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10062, var_90_6, var_90_5)
			end

			if arg_87_1.time_ >= var_90_1 + var_90_4 and arg_87_1.time_ < var_90_1 + var_90_4 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_90_7 = arg_87_1.actors_["10062"]
			local var_90_8 = 0

			if var_90_8 < arg_87_1.time_ and arg_87_1.time_ <= var_90_8 + arg_90_0 and arg_87_1.var_.actorSpriteComps10062 == nil then
				arg_87_1.var_.actorSpriteComps10062 = var_90_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_9 = 0.034

			if var_90_8 <= arg_87_1.time_ and arg_87_1.time_ < var_90_8 + var_90_9 then
				local var_90_10 = (arg_87_1.time_ - var_90_8) / var_90_9

				if arg_87_1.var_.actorSpriteComps10062 then
					for iter_90_1, iter_90_2 in pairs(arg_87_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_90_2 then
							local var_90_11 = Mathf.Lerp(iter_90_2.color.r, 1, var_90_10)

							iter_90_2.color = Color.New(var_90_11, var_90_11, var_90_11)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_8 + var_90_9 and arg_87_1.time_ < var_90_8 + var_90_9 + arg_90_0 and arg_87_1.var_.actorSpriteComps10062 then
				local var_90_12 = 1

				for iter_90_3, iter_90_4 in pairs(arg_87_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_90_4 then
						iter_90_4.color = Color.New(var_90_12, var_90_12, var_90_12)
					end
				end

				arg_87_1.var_.actorSpriteComps10062 = nil
			end

			local var_90_13 = arg_87_1.actors_["1061"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 == nil then
				arg_87_1.var_.actorSpriteComps1061 = var_90_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_90_15 = 0.034

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.actorSpriteComps1061 then
					for iter_90_5, iter_90_6 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_90_6 then
							local var_90_17 = Mathf.Lerp(iter_90_6.color.r, 0.5, var_90_16)

							iter_90_6.color = Color.New(var_90_17, var_90_17, var_90_17)
						end
					end
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.actorSpriteComps1061 then
				local var_90_18 = 0.5

				for iter_90_7, iter_90_8 in pairs(arg_87_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_90_8 then
						iter_90_8.color = Color.New(var_90_18, var_90_18, var_90_18)
					end
				end

				arg_87_1.var_.actorSpriteComps1061 = nil
			end

			local var_90_19 = 0
			local var_90_20 = 0.125

			if var_90_19 < arg_87_1.time_ and arg_87_1.time_ <= var_90_19 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_21 = arg_87_1:FormatText(StoryNameCfg[600].name)

				arg_87_1.leftNameTxt_.text = var_90_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_22 = arg_87_1:GetWordFromCfg(410161021)
				local var_90_23 = arg_87_1:FormatText(var_90_22.content)

				arg_87_1.text_.text = var_90_23

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_24 = 5
				local var_90_25 = utf8.len(var_90_23)
				local var_90_26 = var_90_24 <= 0 and var_90_20 or var_90_20 * (var_90_25 / var_90_24)

				if var_90_26 > 0 and var_90_20 < var_90_26 then
					arg_87_1.talkMaxDuration = var_90_26

					if var_90_26 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_26 + var_90_19
					end
				end

				arg_87_1.text_.text = var_90_23
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161021", "story_v_out_410161.awb") ~= 0 then
					local var_90_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161021", "story_v_out_410161.awb") / 1000

					if var_90_27 + var_90_19 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_27 + var_90_19
					end

					if var_90_22.prefab_name ~= "" and arg_87_1.actors_[var_90_22.prefab_name] ~= nil then
						local var_90_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_22.prefab_name].transform, "story_v_out_410161", "410161021", "story_v_out_410161.awb")

						arg_87_1:RecordAudio("410161021", var_90_28)
						arg_87_1:RecordAudio("410161021", var_90_28)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_410161", "410161021", "story_v_out_410161.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_410161", "410161021", "story_v_out_410161.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_29 = math.max(var_90_20, arg_87_1.talkMaxDuration)

			if var_90_19 <= arg_87_1.time_ and arg_87_1.time_ < var_90_19 + var_90_29 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_19) / var_90_29

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_19 + var_90_29 and arg_87_1.time_ < var_90_19 + var_90_29 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play410161022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 410161022
		arg_91_1.duration_ = 6.1

		local var_91_0 = {
			ja = 6.1,
			CriLanguages = 3.7,
			zh = 3.7
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
				arg_91_0:Play410161023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["10062"]
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 and arg_91_1.var_.actorSpriteComps10062 == nil then
				arg_91_1.var_.actorSpriteComps10062 = var_94_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_2 = 0.034

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2

				if arg_91_1.var_.actorSpriteComps10062 then
					for iter_94_0, iter_94_1 in pairs(arg_91_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_94_1 then
							local var_94_4 = Mathf.Lerp(iter_94_1.color.r, 0.5, var_94_3)

							iter_94_1.color = Color.New(var_94_4, var_94_4, var_94_4)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 and arg_91_1.var_.actorSpriteComps10062 then
				local var_94_5 = 0.5

				for iter_94_2, iter_94_3 in pairs(arg_91_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_94_3 then
						iter_94_3.color = Color.New(var_94_5, var_94_5, var_94_5)
					end
				end

				arg_91_1.var_.actorSpriteComps10062 = nil
			end

			local var_94_6 = arg_91_1.actors_["1061"]
			local var_94_7 = 0

			if var_94_7 < arg_91_1.time_ and arg_91_1.time_ <= var_94_7 + arg_94_0 and arg_91_1.var_.actorSpriteComps1061 == nil then
				arg_91_1.var_.actorSpriteComps1061 = var_94_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_94_8 = 0.034

			if var_94_7 <= arg_91_1.time_ and arg_91_1.time_ < var_94_7 + var_94_8 then
				local var_94_9 = (arg_91_1.time_ - var_94_7) / var_94_8

				if arg_91_1.var_.actorSpriteComps1061 then
					for iter_94_4, iter_94_5 in pairs(arg_91_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_94_5 then
							local var_94_10 = Mathf.Lerp(iter_94_5.color.r, 1, var_94_9)

							iter_94_5.color = Color.New(var_94_10, var_94_10, var_94_10)
						end
					end
				end
			end

			if arg_91_1.time_ >= var_94_7 + var_94_8 and arg_91_1.time_ < var_94_7 + var_94_8 + arg_94_0 and arg_91_1.var_.actorSpriteComps1061 then
				local var_94_11 = 1

				for iter_94_6, iter_94_7 in pairs(arg_91_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_94_7 then
						iter_94_7.color = Color.New(var_94_11, var_94_11, var_94_11)
					end
				end

				arg_91_1.var_.actorSpriteComps1061 = nil
			end

			local var_94_12 = 0
			local var_94_13 = 0.425

			if var_94_12 < arg_91_1.time_ and arg_91_1.time_ <= var_94_12 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_14 = arg_91_1:FormatText(StoryNameCfg[612].name)

				arg_91_1.leftNameTxt_.text = var_94_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_15 = arg_91_1:GetWordFromCfg(410161022)
				local var_94_16 = arg_91_1:FormatText(var_94_15.content)

				arg_91_1.text_.text = var_94_16

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_17 = 17
				local var_94_18 = utf8.len(var_94_16)
				local var_94_19 = var_94_17 <= 0 and var_94_13 or var_94_13 * (var_94_18 / var_94_17)

				if var_94_19 > 0 and var_94_13 < var_94_19 then
					arg_91_1.talkMaxDuration = var_94_19

					if var_94_19 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_19 + var_94_12
					end
				end

				arg_91_1.text_.text = var_94_16
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161022", "story_v_out_410161.awb") ~= 0 then
					local var_94_20 = manager.audio:GetVoiceLength("story_v_out_410161", "410161022", "story_v_out_410161.awb") / 1000

					if var_94_20 + var_94_12 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_20 + var_94_12
					end

					if var_94_15.prefab_name ~= "" and arg_91_1.actors_[var_94_15.prefab_name] ~= nil then
						local var_94_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_15.prefab_name].transform, "story_v_out_410161", "410161022", "story_v_out_410161.awb")

						arg_91_1:RecordAudio("410161022", var_94_21)
						arg_91_1:RecordAudio("410161022", var_94_21)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_410161", "410161022", "story_v_out_410161.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_410161", "410161022", "story_v_out_410161.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_22 = math.max(var_94_13, arg_91_1.talkMaxDuration)

			if var_94_12 <= arg_91_1.time_ and arg_91_1.time_ < var_94_12 + var_94_22 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_12) / var_94_22

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_12 + var_94_22 and arg_91_1.time_ < var_94_12 + var_94_22 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play410161023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 410161023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play410161024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1061"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 == nil then
				arg_95_1.var_.actorSpriteComps1061 = var_98_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_2 = 0.034

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.actorSpriteComps1061 then
					for iter_98_0, iter_98_1 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_98_1 then
							local var_98_4 = Mathf.Lerp(iter_98_1.color.r, 0.5, var_98_3)

							iter_98_1.color = Color.New(var_98_4, var_98_4, var_98_4)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.actorSpriteComps1061 then
				local var_98_5 = 0.5

				for iter_98_2, iter_98_3 in pairs(arg_95_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_98_3 then
						iter_98_3.color = Color.New(var_98_5, var_98_5, var_98_5)
					end
				end

				arg_95_1.var_.actorSpriteComps1061 = nil
			end

			local var_98_6 = arg_95_1.actors_["10062"]
			local var_98_7 = 0

			if var_98_7 < arg_95_1.time_ and arg_95_1.time_ <= var_98_7 + arg_98_0 and arg_95_1.var_.actorSpriteComps10062 == nil then
				arg_95_1.var_.actorSpriteComps10062 = var_98_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_98_8 = 0.034

			if var_98_7 <= arg_95_1.time_ and arg_95_1.time_ < var_98_7 + var_98_8 then
				local var_98_9 = (arg_95_1.time_ - var_98_7) / var_98_8

				if arg_95_1.var_.actorSpriteComps10062 then
					for iter_98_4, iter_98_5 in pairs(arg_95_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_98_5 then
							local var_98_10 = Mathf.Lerp(iter_98_5.color.r, 0.5, var_98_9)

							iter_98_5.color = Color.New(var_98_10, var_98_10, var_98_10)
						end
					end
				end
			end

			if arg_95_1.time_ >= var_98_7 + var_98_8 and arg_95_1.time_ < var_98_7 + var_98_8 + arg_98_0 and arg_95_1.var_.actorSpriteComps10062 then
				local var_98_11 = 0.5

				for iter_98_6, iter_98_7 in pairs(arg_95_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_98_7 then
						iter_98_7.color = Color.New(var_98_11, var_98_11, var_98_11)
					end
				end

				arg_95_1.var_.actorSpriteComps10062 = nil
			end

			local var_98_12 = 0
			local var_98_13 = 1.6

			if var_98_12 < arg_95_1.time_ and arg_95_1.time_ <= var_98_12 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_14 = arg_95_1:GetWordFromCfg(410161023)
				local var_98_15 = arg_95_1:FormatText(var_98_14.content)

				arg_95_1.text_.text = var_98_15

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_16 = 64
				local var_98_17 = utf8.len(var_98_15)
				local var_98_18 = var_98_16 <= 0 and var_98_13 or var_98_13 * (var_98_17 / var_98_16)

				if var_98_18 > 0 and var_98_13 < var_98_18 then
					arg_95_1.talkMaxDuration = var_98_18

					if var_98_18 + var_98_12 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_18 + var_98_12
					end
				end

				arg_95_1.text_.text = var_98_15
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_19 = math.max(var_98_13, arg_95_1.talkMaxDuration)

			if var_98_12 <= arg_95_1.time_ and arg_95_1.time_ < var_98_12 + var_98_19 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_12) / var_98_19

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_12 + var_98_19 and arg_95_1.time_ < var_98_12 + var_98_19 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play410161024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 410161024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play410161025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 1.475

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

				local var_102_2 = arg_99_1:GetWordFromCfg(410161024)
				local var_102_3 = arg_99_1:FormatText(var_102_2.content)

				arg_99_1.text_.text = var_102_3

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_4 = 59
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
	Play410161025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 410161025
		arg_103_1.duration_ = 5

		SetActive(arg_103_1.tipsGo_, false)

		function arg_103_1.onSingleLineFinish_()
			arg_103_1.onSingleLineUpdate_ = nil
			arg_103_1.onSingleLineFinish_ = nil
			arg_103_1.state_ = "waiting"
		end

		function arg_103_1.playNext_(arg_105_0)
			if arg_105_0 == 1 then
				arg_103_0:Play410161026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 1.625

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, false)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_2 = arg_103_1:GetWordFromCfg(410161025)
				local var_106_3 = arg_103_1:FormatText(var_106_2.content)

				arg_103_1.text_.text = var_106_3

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_4 = 65
				local var_106_5 = utf8.len(var_106_3)
				local var_106_6 = var_106_4 <= 0 and var_106_1 or var_106_1 * (var_106_5 / var_106_4)

				if var_106_6 > 0 and var_106_1 < var_106_6 then
					arg_103_1.talkMaxDuration = var_106_6

					if var_106_6 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_6 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_3
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)
				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_7 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_7 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_7

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_7 and arg_103_1.time_ < var_106_0 + var_106_7 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play410161026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 410161026
		arg_107_1.duration_ = 1.366

		local var_107_0 = {
			ja = 1.3,
			CriLanguages = 1.366,
			zh = 1.366
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
				arg_107_0:Play410161027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1061"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1061 = var_110_0.localPosition
				var_110_0.localScale = Vector3.New(1, 1, 1)

				arg_107_1:CheckSpriteTmpPos("1061", 2)

				local var_110_2 = var_110_0.childCount

				for iter_110_0 = 0, var_110_2 - 1 do
					local var_110_3 = var_110_0:GetChild(iter_110_0)

					if var_110_3.name == "split_9" or not string.find(var_110_3.name, "split") then
						var_110_3.gameObject:SetActive(true)
					else
						var_110_3.gameObject:SetActive(false)
					end
				end
			end

			local var_110_4 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_4 then
				local var_110_5 = (arg_107_1.time_ - var_110_1) / var_110_4
				local var_110_6 = Vector3.New(-390, -490, 18)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1061, var_110_6, var_110_5)
			end

			if arg_107_1.time_ >= var_110_1 + var_110_4 and arg_107_1.time_ < var_110_1 + var_110_4 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_110_7 = arg_107_1.actors_["1061"]
			local var_110_8 = 0

			if var_110_8 < arg_107_1.time_ and arg_107_1.time_ <= var_110_8 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 == nil then
				arg_107_1.var_.actorSpriteComps1061 = var_110_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_110_9 = 0.034

			if var_110_8 <= arg_107_1.time_ and arg_107_1.time_ < var_110_8 + var_110_9 then
				local var_110_10 = (arg_107_1.time_ - var_110_8) / var_110_9

				if arg_107_1.var_.actorSpriteComps1061 then
					for iter_110_1, iter_110_2 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_110_2 then
							local var_110_11 = Mathf.Lerp(iter_110_2.color.r, 1, var_110_10)

							iter_110_2.color = Color.New(var_110_11, var_110_11, var_110_11)
						end
					end
				end
			end

			if arg_107_1.time_ >= var_110_8 + var_110_9 and arg_107_1.time_ < var_110_8 + var_110_9 + arg_110_0 and arg_107_1.var_.actorSpriteComps1061 then
				local var_110_12 = 1

				for iter_110_3, iter_110_4 in pairs(arg_107_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_110_4 then
						iter_110_4.color = Color.New(var_110_12, var_110_12, var_110_12)
					end
				end

				arg_107_1.var_.actorSpriteComps1061 = nil
			end

			local var_110_13 = 0
			local var_110_14 = 0.1

			if var_110_13 < arg_107_1.time_ and arg_107_1.time_ <= var_110_13 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_15 = arg_107_1:FormatText(StoryNameCfg[612].name)

				arg_107_1.leftNameTxt_.text = var_110_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_16 = arg_107_1:GetWordFromCfg(410161026)
				local var_110_17 = arg_107_1:FormatText(var_110_16.content)

				arg_107_1.text_.text = var_110_17

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_18 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161026", "story_v_out_410161.awb") ~= 0 then
					local var_110_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161026", "story_v_out_410161.awb") / 1000

					if var_110_21 + var_110_13 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_21 + var_110_13
					end

					if var_110_16.prefab_name ~= "" and arg_107_1.actors_[var_110_16.prefab_name] ~= nil then
						local var_110_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_16.prefab_name].transform, "story_v_out_410161", "410161026", "story_v_out_410161.awb")

						arg_107_1:RecordAudio("410161026", var_110_22)
						arg_107_1:RecordAudio("410161026", var_110_22)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_410161", "410161026", "story_v_out_410161.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_410161", "410161026", "story_v_out_410161.awb")
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
	Play410161027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 410161027
		arg_111_1.duration_ = 11.1

		local var_111_0 = {
			ja = 11.1,
			CriLanguages = 7,
			zh = 7
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
				arg_111_0:Play410161028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10062"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos10062 = var_114_0.localPosition
				var_114_0.localScale = Vector3.New(1, 1, 1)

				arg_111_1:CheckSpriteTmpPos("10062", 4)

				local var_114_2 = var_114_0.childCount

				for iter_114_0 = 0, var_114_2 - 1 do
					local var_114_3 = var_114_0:GetChild(iter_114_0)

					if var_114_3.name == "split_4" or not string.find(var_114_3.name, "split") then
						var_114_3.gameObject:SetActive(true)
					else
						var_114_3.gameObject:SetActive(false)
					end
				end
			end

			local var_114_4 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_4 then
				local var_114_5 = (arg_111_1.time_ - var_114_1) / var_114_4
				local var_114_6 = Vector3.New(370, -390, -290)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos10062, var_114_6, var_114_5)
			end

			if arg_111_1.time_ >= var_114_1 + var_114_4 and arg_111_1.time_ < var_114_1 + var_114_4 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_114_7 = arg_111_1.actors_["10062"]
			local var_114_8 = 0

			if var_114_8 < arg_111_1.time_ and arg_111_1.time_ <= var_114_8 + arg_114_0 and arg_111_1.var_.actorSpriteComps10062 == nil then
				arg_111_1.var_.actorSpriteComps10062 = var_114_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_9 = 0.034

			if var_114_8 <= arg_111_1.time_ and arg_111_1.time_ < var_114_8 + var_114_9 then
				local var_114_10 = (arg_111_1.time_ - var_114_8) / var_114_9

				if arg_111_1.var_.actorSpriteComps10062 then
					for iter_114_1, iter_114_2 in pairs(arg_111_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_114_2 then
							local var_114_11 = Mathf.Lerp(iter_114_2.color.r, 1, var_114_10)

							iter_114_2.color = Color.New(var_114_11, var_114_11, var_114_11)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_8 + var_114_9 and arg_111_1.time_ < var_114_8 + var_114_9 + arg_114_0 and arg_111_1.var_.actorSpriteComps10062 then
				local var_114_12 = 1

				for iter_114_3, iter_114_4 in pairs(arg_111_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_114_4 then
						iter_114_4.color = Color.New(var_114_12, var_114_12, var_114_12)
					end
				end

				arg_111_1.var_.actorSpriteComps10062 = nil
			end

			local var_114_13 = arg_111_1.actors_["1061"]
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 and arg_111_1.var_.actorSpriteComps1061 == nil then
				arg_111_1.var_.actorSpriteComps1061 = var_114_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_15 = 0.034

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15

				if arg_111_1.var_.actorSpriteComps1061 then
					for iter_114_5, iter_114_6 in pairs(arg_111_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_114_6 then
							local var_114_17 = Mathf.Lerp(iter_114_6.color.r, 0.5, var_114_16)

							iter_114_6.color = Color.New(var_114_17, var_114_17, var_114_17)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 and arg_111_1.var_.actorSpriteComps1061 then
				local var_114_18 = 0.5

				for iter_114_7, iter_114_8 in pairs(arg_111_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_114_8 then
						iter_114_8.color = Color.New(var_114_18, var_114_18, var_114_18)
					end
				end

				arg_111_1.var_.actorSpriteComps1061 = nil
			end

			local var_114_19 = 0
			local var_114_20 = 0.625

			if var_114_19 < arg_111_1.time_ and arg_111_1.time_ <= var_114_19 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_21 = arg_111_1:FormatText(StoryNameCfg[600].name)

				arg_111_1.leftNameTxt_.text = var_114_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_22 = arg_111_1:GetWordFromCfg(410161027)
				local var_114_23 = arg_111_1:FormatText(var_114_22.content)

				arg_111_1.text_.text = var_114_23

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_24 = 25
				local var_114_25 = utf8.len(var_114_23)
				local var_114_26 = var_114_24 <= 0 and var_114_20 or var_114_20 * (var_114_25 / var_114_24)

				if var_114_26 > 0 and var_114_20 < var_114_26 then
					arg_111_1.talkMaxDuration = var_114_26

					if var_114_26 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_26 + var_114_19
					end
				end

				arg_111_1.text_.text = var_114_23
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161027", "story_v_out_410161.awb") ~= 0 then
					local var_114_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161027", "story_v_out_410161.awb") / 1000

					if var_114_27 + var_114_19 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_27 + var_114_19
					end

					if var_114_22.prefab_name ~= "" and arg_111_1.actors_[var_114_22.prefab_name] ~= nil then
						local var_114_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_22.prefab_name].transform, "story_v_out_410161", "410161027", "story_v_out_410161.awb")

						arg_111_1:RecordAudio("410161027", var_114_28)
						arg_111_1:RecordAudio("410161027", var_114_28)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_410161", "410161027", "story_v_out_410161.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_410161", "410161027", "story_v_out_410161.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_29 = math.max(var_114_20, arg_111_1.talkMaxDuration)

			if var_114_19 <= arg_111_1.time_ and arg_111_1.time_ < var_114_19 + var_114_29 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_19) / var_114_29

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_19 + var_114_29 and arg_111_1.time_ < var_114_19 + var_114_29 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play410161028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 410161028
		arg_115_1.duration_ = 13.433

		local var_115_0 = {
			ja = 13.433,
			CriLanguages = 5.333,
			zh = 5.333
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
				arg_115_0:Play410161029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1061"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1061 = var_118_0.localPosition
				var_118_0.localScale = Vector3.New(1, 1, 1)

				arg_115_1:CheckSpriteTmpPos("1061", 2)

				local var_118_2 = var_118_0.childCount

				for iter_118_0 = 0, var_118_2 - 1 do
					local var_118_3 = var_118_0:GetChild(iter_118_0)

					if var_118_3.name == "split_5" or not string.find(var_118_3.name, "split") then
						var_118_3.gameObject:SetActive(true)
					else
						var_118_3.gameObject:SetActive(false)
					end
				end
			end

			local var_118_4 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_4 then
				local var_118_5 = (arg_115_1.time_ - var_118_1) / var_118_4
				local var_118_6 = Vector3.New(-390, -490, 18)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1061, var_118_6, var_118_5)
			end

			if arg_115_1.time_ >= var_118_1 + var_118_4 and arg_115_1.time_ < var_118_1 + var_118_4 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_118_7 = arg_115_1.actors_["1061"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 == nil then
				arg_115_1.var_.actorSpriteComps1061 = var_118_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_9 = 0.034

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.actorSpriteComps1061 then
					for iter_118_1, iter_118_2 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_118_2 then
							local var_118_11 = Mathf.Lerp(iter_118_2.color.r, 1, var_118_10)

							iter_118_2.color = Color.New(var_118_11, var_118_11, var_118_11)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.actorSpriteComps1061 then
				local var_118_12 = 1

				for iter_118_3, iter_118_4 in pairs(arg_115_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_118_4 then
						iter_118_4.color = Color.New(var_118_12, var_118_12, var_118_12)
					end
				end

				arg_115_1.var_.actorSpriteComps1061 = nil
			end

			local var_118_13 = arg_115_1.actors_["10062"]
			local var_118_14 = 0

			if var_118_14 < arg_115_1.time_ and arg_115_1.time_ <= var_118_14 + arg_118_0 and arg_115_1.var_.actorSpriteComps10062 == nil then
				arg_115_1.var_.actorSpriteComps10062 = var_118_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_15 = 0.034

			if var_118_14 <= arg_115_1.time_ and arg_115_1.time_ < var_118_14 + var_118_15 then
				local var_118_16 = (arg_115_1.time_ - var_118_14) / var_118_15

				if arg_115_1.var_.actorSpriteComps10062 then
					for iter_118_5, iter_118_6 in pairs(arg_115_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_118_6 then
							local var_118_17 = Mathf.Lerp(iter_118_6.color.r, 0.5, var_118_16)

							iter_118_6.color = Color.New(var_118_17, var_118_17, var_118_17)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_14 + var_118_15 and arg_115_1.time_ < var_118_14 + var_118_15 + arg_118_0 and arg_115_1.var_.actorSpriteComps10062 then
				local var_118_18 = 0.5

				for iter_118_7, iter_118_8 in pairs(arg_115_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_118_8 then
						iter_118_8.color = Color.New(var_118_18, var_118_18, var_118_18)
					end
				end

				arg_115_1.var_.actorSpriteComps10062 = nil
			end

			local var_118_19 = 0
			local var_118_20 = 0.625

			if var_118_19 < arg_115_1.time_ and arg_115_1.time_ <= var_118_19 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_21 = arg_115_1:FormatText(StoryNameCfg[612].name)

				arg_115_1.leftNameTxt_.text = var_118_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_22 = arg_115_1:GetWordFromCfg(410161028)
				local var_118_23 = arg_115_1:FormatText(var_118_22.content)

				arg_115_1.text_.text = var_118_23

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_24 = 25
				local var_118_25 = utf8.len(var_118_23)
				local var_118_26 = var_118_24 <= 0 and var_118_20 or var_118_20 * (var_118_25 / var_118_24)

				if var_118_26 > 0 and var_118_20 < var_118_26 then
					arg_115_1.talkMaxDuration = var_118_26

					if var_118_26 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_26 + var_118_19
					end
				end

				arg_115_1.text_.text = var_118_23
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161028", "story_v_out_410161.awb") ~= 0 then
					local var_118_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161028", "story_v_out_410161.awb") / 1000

					if var_118_27 + var_118_19 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_27 + var_118_19
					end

					if var_118_22.prefab_name ~= "" and arg_115_1.actors_[var_118_22.prefab_name] ~= nil then
						local var_118_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_22.prefab_name].transform, "story_v_out_410161", "410161028", "story_v_out_410161.awb")

						arg_115_1:RecordAudio("410161028", var_118_28)
						arg_115_1:RecordAudio("410161028", var_118_28)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_410161", "410161028", "story_v_out_410161.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_410161", "410161028", "story_v_out_410161.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_29 = math.max(var_118_20, arg_115_1.talkMaxDuration)

			if var_118_19 <= arg_115_1.time_ and arg_115_1.time_ < var_118_19 + var_118_29 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_19) / var_118_29

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_19 + var_118_29 and arg_115_1.time_ < var_118_19 + var_118_29 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play410161029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 410161029
		arg_119_1.duration_ = 14.766

		local var_119_0 = {
			ja = 14.766,
			CriLanguages = 9.933,
			zh = 9.933
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
				arg_119_0:Play410161030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["10062"].transform
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 then
				arg_119_1.var_.moveOldPos10062 = var_122_0.localPosition
				var_122_0.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("10062", 4)

				local var_122_2 = var_122_0.childCount

				for iter_122_0 = 0, var_122_2 - 1 do
					local var_122_3 = var_122_0:GetChild(iter_122_0)

					if var_122_3.name == "split_1_1" or not string.find(var_122_3.name, "split") then
						var_122_3.gameObject:SetActive(true)
					else
						var_122_3.gameObject:SetActive(false)
					end
				end
			end

			local var_122_4 = 0.001

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_4 then
				local var_122_5 = (arg_119_1.time_ - var_122_1) / var_122_4
				local var_122_6 = Vector3.New(370, -390, -290)

				var_122_0.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10062, var_122_6, var_122_5)
			end

			if arg_119_1.time_ >= var_122_1 + var_122_4 and arg_119_1.time_ < var_122_1 + var_122_4 + arg_122_0 then
				var_122_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_122_7 = arg_119_1.actors_["10062"]
			local var_122_8 = 0

			if var_122_8 < arg_119_1.time_ and arg_119_1.time_ <= var_122_8 + arg_122_0 and arg_119_1.var_.actorSpriteComps10062 == nil then
				arg_119_1.var_.actorSpriteComps10062 = var_122_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_9 = 0.034

			if var_122_8 <= arg_119_1.time_ and arg_119_1.time_ < var_122_8 + var_122_9 then
				local var_122_10 = (arg_119_1.time_ - var_122_8) / var_122_9

				if arg_119_1.var_.actorSpriteComps10062 then
					for iter_122_1, iter_122_2 in pairs(arg_119_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_122_2 then
							local var_122_11 = Mathf.Lerp(iter_122_2.color.r, 1, var_122_10)

							iter_122_2.color = Color.New(var_122_11, var_122_11, var_122_11)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_8 + var_122_9 and arg_119_1.time_ < var_122_8 + var_122_9 + arg_122_0 and arg_119_1.var_.actorSpriteComps10062 then
				local var_122_12 = 1

				for iter_122_3, iter_122_4 in pairs(arg_119_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_122_4 then
						iter_122_4.color = Color.New(var_122_12, var_122_12, var_122_12)
					end
				end

				arg_119_1.var_.actorSpriteComps10062 = nil
			end

			local var_122_13 = arg_119_1.actors_["1061"]
			local var_122_14 = 0

			if var_122_14 < arg_119_1.time_ and arg_119_1.time_ <= var_122_14 + arg_122_0 and arg_119_1.var_.actorSpriteComps1061 == nil then
				arg_119_1.var_.actorSpriteComps1061 = var_122_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_122_15 = 0.034

			if var_122_14 <= arg_119_1.time_ and arg_119_1.time_ < var_122_14 + var_122_15 then
				local var_122_16 = (arg_119_1.time_ - var_122_14) / var_122_15

				if arg_119_1.var_.actorSpriteComps1061 then
					for iter_122_5, iter_122_6 in pairs(arg_119_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_122_6 then
							local var_122_17 = Mathf.Lerp(iter_122_6.color.r, 0.5, var_122_16)

							iter_122_6.color = Color.New(var_122_17, var_122_17, var_122_17)
						end
					end
				end
			end

			if arg_119_1.time_ >= var_122_14 + var_122_15 and arg_119_1.time_ < var_122_14 + var_122_15 + arg_122_0 and arg_119_1.var_.actorSpriteComps1061 then
				local var_122_18 = 0.5

				for iter_122_7, iter_122_8 in pairs(arg_119_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_122_8 then
						iter_122_8.color = Color.New(var_122_18, var_122_18, var_122_18)
					end
				end

				arg_119_1.var_.actorSpriteComps1061 = nil
			end

			local var_122_19 = 0
			local var_122_20 = 0.825

			if var_122_19 < arg_119_1.time_ and arg_119_1.time_ <= var_122_19 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_21 = arg_119_1:FormatText(StoryNameCfg[600].name)

				arg_119_1.leftNameTxt_.text = var_122_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_22 = arg_119_1:GetWordFromCfg(410161029)
				local var_122_23 = arg_119_1:FormatText(var_122_22.content)

				arg_119_1.text_.text = var_122_23

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_24 = 33
				local var_122_25 = utf8.len(var_122_23)
				local var_122_26 = var_122_24 <= 0 and var_122_20 or var_122_20 * (var_122_25 / var_122_24)

				if var_122_26 > 0 and var_122_20 < var_122_26 then
					arg_119_1.talkMaxDuration = var_122_26

					if var_122_26 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_26 + var_122_19
					end
				end

				arg_119_1.text_.text = var_122_23
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161029", "story_v_out_410161.awb") ~= 0 then
					local var_122_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161029", "story_v_out_410161.awb") / 1000

					if var_122_27 + var_122_19 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_27 + var_122_19
					end

					if var_122_22.prefab_name ~= "" and arg_119_1.actors_[var_122_22.prefab_name] ~= nil then
						local var_122_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_22.prefab_name].transform, "story_v_out_410161", "410161029", "story_v_out_410161.awb")

						arg_119_1:RecordAudio("410161029", var_122_28)
						arg_119_1:RecordAudio("410161029", var_122_28)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_410161", "410161029", "story_v_out_410161.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_410161", "410161029", "story_v_out_410161.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_29 = math.max(var_122_20, arg_119_1.talkMaxDuration)

			if var_122_19 <= arg_119_1.time_ and arg_119_1.time_ < var_122_19 + var_122_29 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_19) / var_122_29

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_19 + var_122_29 and arg_119_1.time_ < var_122_19 + var_122_29 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play410161030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 410161030
		arg_123_1.duration_ = 5.833

		local var_123_0 = {
			ja = 5.833,
			CriLanguages = 3.5,
			zh = 3.5
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
				arg_123_0:Play410161031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1061"].transform
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 then
				arg_123_1.var_.moveOldPos1061 = var_126_0.localPosition
				var_126_0.localScale = Vector3.New(1, 1, 1)

				arg_123_1:CheckSpriteTmpPos("1061", 2)

				local var_126_2 = var_126_0.childCount

				for iter_126_0 = 0, var_126_2 - 1 do
					local var_126_3 = var_126_0:GetChild(iter_126_0)

					if var_126_3.name == "split_5" or not string.find(var_126_3.name, "split") then
						var_126_3.gameObject:SetActive(true)
					else
						var_126_3.gameObject:SetActive(false)
					end
				end
			end

			local var_126_4 = 0.001

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_4 then
				local var_126_5 = (arg_123_1.time_ - var_126_1) / var_126_4
				local var_126_6 = Vector3.New(-390, -490, 18)

				var_126_0.localPosition = Vector3.Lerp(arg_123_1.var_.moveOldPos1061, var_126_6, var_126_5)
			end

			if arg_123_1.time_ >= var_126_1 + var_126_4 and arg_123_1.time_ < var_126_1 + var_126_4 + arg_126_0 then
				var_126_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_126_7 = arg_123_1.actors_["1061"]
			local var_126_8 = 0

			if var_126_8 < arg_123_1.time_ and arg_123_1.time_ <= var_126_8 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 == nil then
				arg_123_1.var_.actorSpriteComps1061 = var_126_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_9 = 0.034

			if var_126_8 <= arg_123_1.time_ and arg_123_1.time_ < var_126_8 + var_126_9 then
				local var_126_10 = (arg_123_1.time_ - var_126_8) / var_126_9

				if arg_123_1.var_.actorSpriteComps1061 then
					for iter_126_1, iter_126_2 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_126_2 then
							local var_126_11 = Mathf.Lerp(iter_126_2.color.r, 1, var_126_10)

							iter_126_2.color = Color.New(var_126_11, var_126_11, var_126_11)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_8 + var_126_9 and arg_123_1.time_ < var_126_8 + var_126_9 + arg_126_0 and arg_123_1.var_.actorSpriteComps1061 then
				local var_126_12 = 1

				for iter_126_3, iter_126_4 in pairs(arg_123_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_126_4 then
						iter_126_4.color = Color.New(var_126_12, var_126_12, var_126_12)
					end
				end

				arg_123_1.var_.actorSpriteComps1061 = nil
			end

			local var_126_13 = arg_123_1.actors_["10062"]
			local var_126_14 = 0

			if var_126_14 < arg_123_1.time_ and arg_123_1.time_ <= var_126_14 + arg_126_0 and arg_123_1.var_.actorSpriteComps10062 == nil then
				arg_123_1.var_.actorSpriteComps10062 = var_126_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_126_15 = 0.034

			if var_126_14 <= arg_123_1.time_ and arg_123_1.time_ < var_126_14 + var_126_15 then
				local var_126_16 = (arg_123_1.time_ - var_126_14) / var_126_15

				if arg_123_1.var_.actorSpriteComps10062 then
					for iter_126_5, iter_126_6 in pairs(arg_123_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_126_6 then
							local var_126_17 = Mathf.Lerp(iter_126_6.color.r, 0.5, var_126_16)

							iter_126_6.color = Color.New(var_126_17, var_126_17, var_126_17)
						end
					end
				end
			end

			if arg_123_1.time_ >= var_126_14 + var_126_15 and arg_123_1.time_ < var_126_14 + var_126_15 + arg_126_0 and arg_123_1.var_.actorSpriteComps10062 then
				local var_126_18 = 0.5

				for iter_126_7, iter_126_8 in pairs(arg_123_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_126_8 then
						iter_126_8.color = Color.New(var_126_18, var_126_18, var_126_18)
					end
				end

				arg_123_1.var_.actorSpriteComps10062 = nil
			end

			local var_126_19 = 0
			local var_126_20 = 0.25

			if var_126_19 < arg_123_1.time_ and arg_123_1.time_ <= var_126_19 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_21 = arg_123_1:FormatText(StoryNameCfg[612].name)

				arg_123_1.leftNameTxt_.text = var_126_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_22 = arg_123_1:GetWordFromCfg(410161030)
				local var_126_23 = arg_123_1:FormatText(var_126_22.content)

				arg_123_1.text_.text = var_126_23

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_24 = 10
				local var_126_25 = utf8.len(var_126_23)
				local var_126_26 = var_126_24 <= 0 and var_126_20 or var_126_20 * (var_126_25 / var_126_24)

				if var_126_26 > 0 and var_126_20 < var_126_26 then
					arg_123_1.talkMaxDuration = var_126_26

					if var_126_26 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_26 + var_126_19
					end
				end

				arg_123_1.text_.text = var_126_23
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161030", "story_v_out_410161.awb") ~= 0 then
					local var_126_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161030", "story_v_out_410161.awb") / 1000

					if var_126_27 + var_126_19 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_27 + var_126_19
					end

					if var_126_22.prefab_name ~= "" and arg_123_1.actors_[var_126_22.prefab_name] ~= nil then
						local var_126_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_22.prefab_name].transform, "story_v_out_410161", "410161030", "story_v_out_410161.awb")

						arg_123_1:RecordAudio("410161030", var_126_28)
						arg_123_1:RecordAudio("410161030", var_126_28)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_410161", "410161030", "story_v_out_410161.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_410161", "410161030", "story_v_out_410161.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_29 = math.max(var_126_20, arg_123_1.talkMaxDuration)

			if var_126_19 <= arg_123_1.time_ and arg_123_1.time_ < var_126_19 + var_126_29 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_19) / var_126_29

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_19 + var_126_29 and arg_123_1.time_ < var_126_19 + var_126_29 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play410161031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 410161031
		arg_127_1.duration_ = 13.233

		local var_127_0 = {
			ja = 13.233,
			CriLanguages = 8.933,
			zh = 8.933
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
				arg_127_0:Play410161032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["10062"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos10062 = var_130_0.localPosition
				var_130_0.localScale = Vector3.New(1, 1, 1)

				arg_127_1:CheckSpriteTmpPos("10062", 4)

				local var_130_2 = var_130_0.childCount

				for iter_130_0 = 0, var_130_2 - 1 do
					local var_130_3 = var_130_0:GetChild(iter_130_0)

					if var_130_3.name == "split_1_1" or not string.find(var_130_3.name, "split") then
						var_130_3.gameObject:SetActive(true)
					else
						var_130_3.gameObject:SetActive(false)
					end
				end
			end

			local var_130_4 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_4 then
				local var_130_5 = (arg_127_1.time_ - var_130_1) / var_130_4
				local var_130_6 = Vector3.New(370, -390, -290)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos10062, var_130_6, var_130_5)
			end

			if arg_127_1.time_ >= var_130_1 + var_130_4 and arg_127_1.time_ < var_130_1 + var_130_4 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_130_7 = arg_127_1.actors_["10062"]
			local var_130_8 = 0

			if var_130_8 < arg_127_1.time_ and arg_127_1.time_ <= var_130_8 + arg_130_0 and arg_127_1.var_.actorSpriteComps10062 == nil then
				arg_127_1.var_.actorSpriteComps10062 = var_130_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_9 = 0.034

			if var_130_8 <= arg_127_1.time_ and arg_127_1.time_ < var_130_8 + var_130_9 then
				local var_130_10 = (arg_127_1.time_ - var_130_8) / var_130_9

				if arg_127_1.var_.actorSpriteComps10062 then
					for iter_130_1, iter_130_2 in pairs(arg_127_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_130_2 then
							local var_130_11 = Mathf.Lerp(iter_130_2.color.r, 1, var_130_10)

							iter_130_2.color = Color.New(var_130_11, var_130_11, var_130_11)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_8 + var_130_9 and arg_127_1.time_ < var_130_8 + var_130_9 + arg_130_0 and arg_127_1.var_.actorSpriteComps10062 then
				local var_130_12 = 1

				for iter_130_3, iter_130_4 in pairs(arg_127_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_130_4 then
						iter_130_4.color = Color.New(var_130_12, var_130_12, var_130_12)
					end
				end

				arg_127_1.var_.actorSpriteComps10062 = nil
			end

			local var_130_13 = arg_127_1.actors_["1061"]
			local var_130_14 = 0

			if var_130_14 < arg_127_1.time_ and arg_127_1.time_ <= var_130_14 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 == nil then
				arg_127_1.var_.actorSpriteComps1061 = var_130_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_130_15 = 0.034

			if var_130_14 <= arg_127_1.time_ and arg_127_1.time_ < var_130_14 + var_130_15 then
				local var_130_16 = (arg_127_1.time_ - var_130_14) / var_130_15

				if arg_127_1.var_.actorSpriteComps1061 then
					for iter_130_5, iter_130_6 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_130_6 then
							local var_130_17 = Mathf.Lerp(iter_130_6.color.r, 0.5, var_130_16)

							iter_130_6.color = Color.New(var_130_17, var_130_17, var_130_17)
						end
					end
				end
			end

			if arg_127_1.time_ >= var_130_14 + var_130_15 and arg_127_1.time_ < var_130_14 + var_130_15 + arg_130_0 and arg_127_1.var_.actorSpriteComps1061 then
				local var_130_18 = 0.5

				for iter_130_7, iter_130_8 in pairs(arg_127_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_130_8 then
						iter_130_8.color = Color.New(var_130_18, var_130_18, var_130_18)
					end
				end

				arg_127_1.var_.actorSpriteComps1061 = nil
			end

			local var_130_19 = 0
			local var_130_20 = 0.75

			if var_130_19 < arg_127_1.time_ and arg_127_1.time_ <= var_130_19 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_21 = arg_127_1:FormatText(StoryNameCfg[600].name)

				arg_127_1.leftNameTxt_.text = var_130_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_22 = arg_127_1:GetWordFromCfg(410161031)
				local var_130_23 = arg_127_1:FormatText(var_130_22.content)

				arg_127_1.text_.text = var_130_23

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_24 = 30
				local var_130_25 = utf8.len(var_130_23)
				local var_130_26 = var_130_24 <= 0 and var_130_20 or var_130_20 * (var_130_25 / var_130_24)

				if var_130_26 > 0 and var_130_20 < var_130_26 then
					arg_127_1.talkMaxDuration = var_130_26

					if var_130_26 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_26 + var_130_19
					end
				end

				arg_127_1.text_.text = var_130_23
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161031", "story_v_out_410161.awb") ~= 0 then
					local var_130_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161031", "story_v_out_410161.awb") / 1000

					if var_130_27 + var_130_19 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_27 + var_130_19
					end

					if var_130_22.prefab_name ~= "" and arg_127_1.actors_[var_130_22.prefab_name] ~= nil then
						local var_130_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_22.prefab_name].transform, "story_v_out_410161", "410161031", "story_v_out_410161.awb")

						arg_127_1:RecordAudio("410161031", var_130_28)
						arg_127_1:RecordAudio("410161031", var_130_28)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_410161", "410161031", "story_v_out_410161.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_410161", "410161031", "story_v_out_410161.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_29 = math.max(var_130_20, arg_127_1.talkMaxDuration)

			if var_130_19 <= arg_127_1.time_ and arg_127_1.time_ < var_130_19 + var_130_29 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_19) / var_130_29

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_19 + var_130_29 and arg_127_1.time_ < var_130_19 + var_130_29 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play410161032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 410161032
		arg_131_1.duration_ = 17

		local var_131_0 = {
			ja = 17,
			CriLanguages = 11,
			zh = 11
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
				arg_131_0:Play410161033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = arg_131_1.actors_["10062"].transform
			local var_134_1 = 0

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.var_.moveOldPos10062 = var_134_0.localPosition
				var_134_0.localScale = Vector3.New(1, 1, 1)

				arg_131_1:CheckSpriteTmpPos("10062", 4)

				local var_134_2 = var_134_0.childCount

				for iter_134_0 = 0, var_134_2 - 1 do
					local var_134_3 = var_134_0:GetChild(iter_134_0)

					if var_134_3.name == "split_1_1" or not string.find(var_134_3.name, "split") then
						var_134_3.gameObject:SetActive(true)
					else
						var_134_3.gameObject:SetActive(false)
					end
				end
			end

			local var_134_4 = 0.001

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_4 then
				local var_134_5 = (arg_131_1.time_ - var_134_1) / var_134_4
				local var_134_6 = Vector3.New(370, -390, -290)

				var_134_0.localPosition = Vector3.Lerp(arg_131_1.var_.moveOldPos10062, var_134_6, var_134_5)
			end

			if arg_131_1.time_ >= var_134_1 + var_134_4 and arg_131_1.time_ < var_134_1 + var_134_4 + arg_134_0 then
				var_134_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_134_7 = arg_131_1.actors_["10062"]
			local var_134_8 = 0

			if var_134_8 < arg_131_1.time_ and arg_131_1.time_ <= var_134_8 + arg_134_0 and arg_131_1.var_.actorSpriteComps10062 == nil then
				arg_131_1.var_.actorSpriteComps10062 = var_134_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_9 = 0.034

			if var_134_8 <= arg_131_1.time_ and arg_131_1.time_ < var_134_8 + var_134_9 then
				local var_134_10 = (arg_131_1.time_ - var_134_8) / var_134_9

				if arg_131_1.var_.actorSpriteComps10062 then
					for iter_134_1, iter_134_2 in pairs(arg_131_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_134_2 then
							local var_134_11 = Mathf.Lerp(iter_134_2.color.r, 1, var_134_10)

							iter_134_2.color = Color.New(var_134_11, var_134_11, var_134_11)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_8 + var_134_9 and arg_131_1.time_ < var_134_8 + var_134_9 + arg_134_0 and arg_131_1.var_.actorSpriteComps10062 then
				local var_134_12 = 1

				for iter_134_3, iter_134_4 in pairs(arg_131_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_134_4 then
						iter_134_4.color = Color.New(var_134_12, var_134_12, var_134_12)
					end
				end

				arg_131_1.var_.actorSpriteComps10062 = nil
			end

			local var_134_13 = arg_131_1.actors_["1061"]
			local var_134_14 = 0

			if var_134_14 < arg_131_1.time_ and arg_131_1.time_ <= var_134_14 + arg_134_0 and arg_131_1.var_.actorSpriteComps1061 == nil then
				arg_131_1.var_.actorSpriteComps1061 = var_134_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_134_15 = 0.034

			if var_134_14 <= arg_131_1.time_ and arg_131_1.time_ < var_134_14 + var_134_15 then
				local var_134_16 = (arg_131_1.time_ - var_134_14) / var_134_15

				if arg_131_1.var_.actorSpriteComps1061 then
					for iter_134_5, iter_134_6 in pairs(arg_131_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_134_6 then
							local var_134_17 = Mathf.Lerp(iter_134_6.color.r, 0.5, var_134_16)

							iter_134_6.color = Color.New(var_134_17, var_134_17, var_134_17)
						end
					end
				end
			end

			if arg_131_1.time_ >= var_134_14 + var_134_15 and arg_131_1.time_ < var_134_14 + var_134_15 + arg_134_0 and arg_131_1.var_.actorSpriteComps1061 then
				local var_134_18 = 0.5

				for iter_134_7, iter_134_8 in pairs(arg_131_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_134_8 then
						iter_134_8.color = Color.New(var_134_18, var_134_18, var_134_18)
					end
				end

				arg_131_1.var_.actorSpriteComps1061 = nil
			end

			local var_134_19 = 0
			local var_134_20 = 1.025

			if var_134_19 < arg_131_1.time_ and arg_131_1.time_ <= var_134_19 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_21 = arg_131_1:FormatText(StoryNameCfg[600].name)

				arg_131_1.leftNameTxt_.text = var_134_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_22 = arg_131_1:GetWordFromCfg(410161032)
				local var_134_23 = arg_131_1:FormatText(var_134_22.content)

				arg_131_1.text_.text = var_134_23

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_24 = 41
				local var_134_25 = utf8.len(var_134_23)
				local var_134_26 = var_134_24 <= 0 and var_134_20 or var_134_20 * (var_134_25 / var_134_24)

				if var_134_26 > 0 and var_134_20 < var_134_26 then
					arg_131_1.talkMaxDuration = var_134_26

					if var_134_26 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_26 + var_134_19
					end
				end

				arg_131_1.text_.text = var_134_23
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161032", "story_v_out_410161.awb") ~= 0 then
					local var_134_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161032", "story_v_out_410161.awb") / 1000

					if var_134_27 + var_134_19 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_27 + var_134_19
					end

					if var_134_22.prefab_name ~= "" and arg_131_1.actors_[var_134_22.prefab_name] ~= nil then
						local var_134_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_22.prefab_name].transform, "story_v_out_410161", "410161032", "story_v_out_410161.awb")

						arg_131_1:RecordAudio("410161032", var_134_28)
						arg_131_1:RecordAudio("410161032", var_134_28)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_410161", "410161032", "story_v_out_410161.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_410161", "410161032", "story_v_out_410161.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_29 = math.max(var_134_20, arg_131_1.talkMaxDuration)

			if var_134_19 <= arg_131_1.time_ and arg_131_1.time_ < var_134_19 + var_134_29 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_19) / var_134_29

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_19 + var_134_29 and arg_131_1.time_ < var_134_19 + var_134_29 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play410161033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 410161033
		arg_135_1.duration_ = 5

		SetActive(arg_135_1.tipsGo_, false)

		function arg_135_1.onSingleLineFinish_()
			arg_135_1.onSingleLineUpdate_ = nil
			arg_135_1.onSingleLineFinish_ = nil
			arg_135_1.state_ = "waiting"
		end

		function arg_135_1.playNext_(arg_137_0)
			if arg_137_0 == 1 then
				arg_135_0:Play410161034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["10062"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.actorSpriteComps10062 == nil then
				arg_135_1.var_.actorSpriteComps10062 = var_138_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_2 = 0.034

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.actorSpriteComps10062 then
					for iter_138_0, iter_138_1 in pairs(arg_135_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_138_1 then
							local var_138_4 = Mathf.Lerp(iter_138_1.color.r, 0.5, var_138_3)

							iter_138_1.color = Color.New(var_138_4, var_138_4, var_138_4)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.actorSpriteComps10062 then
				local var_138_5 = 0.5

				for iter_138_2, iter_138_3 in pairs(arg_135_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_138_3 then
						iter_138_3.color = Color.New(var_138_5, var_138_5, var_138_5)
					end
				end

				arg_135_1.var_.actorSpriteComps10062 = nil
			end

			local var_138_6 = arg_135_1.actors_["1061"]
			local var_138_7 = 0

			if var_138_7 < arg_135_1.time_ and arg_135_1.time_ <= var_138_7 + arg_138_0 and arg_135_1.var_.actorSpriteComps1061 == nil then
				arg_135_1.var_.actorSpriteComps1061 = var_138_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_138_8 = 0.034

			if var_138_7 <= arg_135_1.time_ and arg_135_1.time_ < var_138_7 + var_138_8 then
				local var_138_9 = (arg_135_1.time_ - var_138_7) / var_138_8

				if arg_135_1.var_.actorSpriteComps1061 then
					for iter_138_4, iter_138_5 in pairs(arg_135_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_138_5 then
							local var_138_10 = Mathf.Lerp(iter_138_5.color.r, 0.5, var_138_9)

							iter_138_5.color = Color.New(var_138_10, var_138_10, var_138_10)
						end
					end
				end
			end

			if arg_135_1.time_ >= var_138_7 + var_138_8 and arg_135_1.time_ < var_138_7 + var_138_8 + arg_138_0 and arg_135_1.var_.actorSpriteComps1061 then
				local var_138_11 = 0.5

				for iter_138_6, iter_138_7 in pairs(arg_135_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_138_7 then
						iter_138_7.color = Color.New(var_138_11, var_138_11, var_138_11)
					end
				end

				arg_135_1.var_.actorSpriteComps1061 = nil
			end

			local var_138_12 = 0
			local var_138_13 = 1.525

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, false)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_14 = arg_135_1:GetWordFromCfg(410161033)
				local var_138_15 = arg_135_1:FormatText(var_138_14.content)

				arg_135_1.text_.text = var_138_15

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_16 = 61
				local var_138_17 = utf8.len(var_138_15)
				local var_138_18 = var_138_16 <= 0 and var_138_13 or var_138_13 * (var_138_17 / var_138_16)

				if var_138_18 > 0 and var_138_13 < var_138_18 then
					arg_135_1.talkMaxDuration = var_138_18

					if var_138_18 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_18 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_15
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)
				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_19 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_19 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_19

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_19 and arg_135_1.time_ < var_138_12 + var_138_19 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play410161034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 410161034
		arg_139_1.duration_ = 5

		SetActive(arg_139_1.tipsGo_, false)

		function arg_139_1.onSingleLineFinish_()
			arg_139_1.onSingleLineUpdate_ = nil
			arg_139_1.onSingleLineFinish_ = nil
			arg_139_1.state_ = "waiting"
		end

		function arg_139_1.playNext_(arg_141_0)
			if arg_141_0 == 1 then
				arg_139_0:Play410161035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0
			local var_142_1 = 1

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, false)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_2 = arg_139_1:GetWordFromCfg(410161034)
				local var_142_3 = arg_139_1:FormatText(var_142_2.content)

				arg_139_1.text_.text = var_142_3

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_4 = 40
				local var_142_5 = utf8.len(var_142_3)
				local var_142_6 = var_142_4 <= 0 and var_142_1 or var_142_1 * (var_142_5 / var_142_4)

				if var_142_6 > 0 and var_142_1 < var_142_6 then
					arg_139_1.talkMaxDuration = var_142_6

					if var_142_6 + var_142_0 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_6 + var_142_0
					end
				end

				arg_139_1.text_.text = var_142_3
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)
				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_7 = math.max(var_142_1, arg_139_1.talkMaxDuration)

			if var_142_0 <= arg_139_1.time_ and arg_139_1.time_ < var_142_0 + var_142_7 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_0) / var_142_7

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_0 + var_142_7 and arg_139_1.time_ < var_142_0 + var_142_7 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play410161035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 410161035
		arg_143_1.duration_ = 5

		SetActive(arg_143_1.tipsGo_, false)

		function arg_143_1.onSingleLineFinish_()
			arg_143_1.onSingleLineUpdate_ = nil
			arg_143_1.onSingleLineFinish_ = nil
			arg_143_1.state_ = "waiting"
		end

		function arg_143_1.playNext_(arg_145_0)
			if arg_145_0 == 1 then
				arg_143_0:Play410161036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.375

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

				local var_146_2 = arg_143_1:GetWordFromCfg(410161035)
				local var_146_3 = arg_143_1:FormatText(var_146_2.content)

				arg_143_1.text_.text = var_146_3

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_4 = 15
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
	Play410161036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 410161036
		arg_147_1.duration_ = 11.733

		local var_147_0 = {
			ja = 10.833,
			CriLanguages = 11.733,
			zh = 11.733
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
				arg_147_0:Play410161037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = arg_147_1.actors_["10062"].transform
			local var_150_1 = 0

			if var_150_1 < arg_147_1.time_ and arg_147_1.time_ <= var_150_1 + arg_150_0 then
				arg_147_1.var_.moveOldPos10062 = var_150_0.localPosition
				var_150_0.localScale = Vector3.New(1, 1, 1)

				arg_147_1:CheckSpriteTmpPos("10062", 4)

				local var_150_2 = var_150_0.childCount

				for iter_150_0 = 0, var_150_2 - 1 do
					local var_150_3 = var_150_0:GetChild(iter_150_0)

					if var_150_3.name == "split_2" or not string.find(var_150_3.name, "split") then
						var_150_3.gameObject:SetActive(true)
					else
						var_150_3.gameObject:SetActive(false)
					end
				end
			end

			local var_150_4 = 0.001

			if var_150_1 <= arg_147_1.time_ and arg_147_1.time_ < var_150_1 + var_150_4 then
				local var_150_5 = (arg_147_1.time_ - var_150_1) / var_150_4
				local var_150_6 = Vector3.New(370, -390, -290)

				var_150_0.localPosition = Vector3.Lerp(arg_147_1.var_.moveOldPos10062, var_150_6, var_150_5)
			end

			if arg_147_1.time_ >= var_150_1 + var_150_4 and arg_147_1.time_ < var_150_1 + var_150_4 + arg_150_0 then
				var_150_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_150_7 = arg_147_1.actors_["10062"]
			local var_150_8 = 0

			if var_150_8 < arg_147_1.time_ and arg_147_1.time_ <= var_150_8 + arg_150_0 and arg_147_1.var_.actorSpriteComps10062 == nil then
				arg_147_1.var_.actorSpriteComps10062 = var_150_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_9 = 0.034

			if var_150_8 <= arg_147_1.time_ and arg_147_1.time_ < var_150_8 + var_150_9 then
				local var_150_10 = (arg_147_1.time_ - var_150_8) / var_150_9

				if arg_147_1.var_.actorSpriteComps10062 then
					for iter_150_1, iter_150_2 in pairs(arg_147_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_150_2 then
							local var_150_11 = Mathf.Lerp(iter_150_2.color.r, 1, var_150_10)

							iter_150_2.color = Color.New(var_150_11, var_150_11, var_150_11)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_8 + var_150_9 and arg_147_1.time_ < var_150_8 + var_150_9 + arg_150_0 and arg_147_1.var_.actorSpriteComps10062 then
				local var_150_12 = 1

				for iter_150_3, iter_150_4 in pairs(arg_147_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_150_4 then
						iter_150_4.color = Color.New(var_150_12, var_150_12, var_150_12)
					end
				end

				arg_147_1.var_.actorSpriteComps10062 = nil
			end

			local var_150_13 = arg_147_1.actors_["1061"]
			local var_150_14 = 0

			if var_150_14 < arg_147_1.time_ and arg_147_1.time_ <= var_150_14 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 == nil then
				arg_147_1.var_.actorSpriteComps1061 = var_150_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_150_15 = 0.034

			if var_150_14 <= arg_147_1.time_ and arg_147_1.time_ < var_150_14 + var_150_15 then
				local var_150_16 = (arg_147_1.time_ - var_150_14) / var_150_15

				if arg_147_1.var_.actorSpriteComps1061 then
					for iter_150_5, iter_150_6 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_150_6 then
							local var_150_17 = Mathf.Lerp(iter_150_6.color.r, 0.5, var_150_16)

							iter_150_6.color = Color.New(var_150_17, var_150_17, var_150_17)
						end
					end
				end
			end

			if arg_147_1.time_ >= var_150_14 + var_150_15 and arg_147_1.time_ < var_150_14 + var_150_15 + arg_150_0 and arg_147_1.var_.actorSpriteComps1061 then
				local var_150_18 = 0.5

				for iter_150_7, iter_150_8 in pairs(arg_147_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_150_8 then
						iter_150_8.color = Color.New(var_150_18, var_150_18, var_150_18)
					end
				end

				arg_147_1.var_.actorSpriteComps1061 = nil
			end

			local var_150_19 = 0
			local var_150_20 = 0.85

			if var_150_19 < arg_147_1.time_ and arg_147_1.time_ <= var_150_19 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_21 = arg_147_1:FormatText(StoryNameCfg[600].name)

				arg_147_1.leftNameTxt_.text = var_150_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_22 = arg_147_1:GetWordFromCfg(410161036)
				local var_150_23 = arg_147_1:FormatText(var_150_22.content)

				arg_147_1.text_.text = var_150_23

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_24 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161036", "story_v_out_410161.awb") ~= 0 then
					local var_150_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161036", "story_v_out_410161.awb") / 1000

					if var_150_27 + var_150_19 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_27 + var_150_19
					end

					if var_150_22.prefab_name ~= "" and arg_147_1.actors_[var_150_22.prefab_name] ~= nil then
						local var_150_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_22.prefab_name].transform, "story_v_out_410161", "410161036", "story_v_out_410161.awb")

						arg_147_1:RecordAudio("410161036", var_150_28)
						arg_147_1:RecordAudio("410161036", var_150_28)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_410161", "410161036", "story_v_out_410161.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_410161", "410161036", "story_v_out_410161.awb")
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
	Play410161037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 410161037
		arg_151_1.duration_ = 1.4

		local var_151_0 = {
			ja = 1,
			CriLanguages = 1.4,
			zh = 1.4
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
				arg_151_0:Play410161038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1061"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1061 = var_154_0.localPosition
				var_154_0.localScale = Vector3.New(1, 1, 1)

				arg_151_1:CheckSpriteTmpPos("1061", 2)

				local var_154_2 = var_154_0.childCount

				for iter_154_0 = 0, var_154_2 - 1 do
					local var_154_3 = var_154_0:GetChild(iter_154_0)

					if var_154_3.name == "" or not string.find(var_154_3.name, "split") then
						var_154_3.gameObject:SetActive(true)
					else
						var_154_3.gameObject:SetActive(false)
					end
				end
			end

			local var_154_4 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_4 then
				local var_154_5 = (arg_151_1.time_ - var_154_1) / var_154_4
				local var_154_6 = Vector3.New(-390, -490, 18)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1061, var_154_6, var_154_5)
			end

			if arg_151_1.time_ >= var_154_1 + var_154_4 and arg_151_1.time_ < var_154_1 + var_154_4 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_154_7 = arg_151_1.actors_["1061"]
			local var_154_8 = 0

			if var_154_8 < arg_151_1.time_ and arg_151_1.time_ <= var_154_8 + arg_154_0 and arg_151_1.var_.actorSpriteComps1061 == nil then
				arg_151_1.var_.actorSpriteComps1061 = var_154_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_9 = 0.034

			if var_154_8 <= arg_151_1.time_ and arg_151_1.time_ < var_154_8 + var_154_9 then
				local var_154_10 = (arg_151_1.time_ - var_154_8) / var_154_9

				if arg_151_1.var_.actorSpriteComps1061 then
					for iter_154_1, iter_154_2 in pairs(arg_151_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_154_2 then
							local var_154_11 = Mathf.Lerp(iter_154_2.color.r, 1, var_154_10)

							iter_154_2.color = Color.New(var_154_11, var_154_11, var_154_11)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_8 + var_154_9 and arg_151_1.time_ < var_154_8 + var_154_9 + arg_154_0 and arg_151_1.var_.actorSpriteComps1061 then
				local var_154_12 = 1

				for iter_154_3, iter_154_4 in pairs(arg_151_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_154_4 then
						iter_154_4.color = Color.New(var_154_12, var_154_12, var_154_12)
					end
				end

				arg_151_1.var_.actorSpriteComps1061 = nil
			end

			local var_154_13 = arg_151_1.actors_["10062"]
			local var_154_14 = 0

			if var_154_14 < arg_151_1.time_ and arg_151_1.time_ <= var_154_14 + arg_154_0 and arg_151_1.var_.actorSpriteComps10062 == nil then
				arg_151_1.var_.actorSpriteComps10062 = var_154_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_154_15 = 0.034

			if var_154_14 <= arg_151_1.time_ and arg_151_1.time_ < var_154_14 + var_154_15 then
				local var_154_16 = (arg_151_1.time_ - var_154_14) / var_154_15

				if arg_151_1.var_.actorSpriteComps10062 then
					for iter_154_5, iter_154_6 in pairs(arg_151_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_154_6 then
							local var_154_17 = Mathf.Lerp(iter_154_6.color.r, 0.5, var_154_16)

							iter_154_6.color = Color.New(var_154_17, var_154_17, var_154_17)
						end
					end
				end
			end

			if arg_151_1.time_ >= var_154_14 + var_154_15 and arg_151_1.time_ < var_154_14 + var_154_15 + arg_154_0 and arg_151_1.var_.actorSpriteComps10062 then
				local var_154_18 = 0.5

				for iter_154_7, iter_154_8 in pairs(arg_151_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_154_8 then
						iter_154_8.color = Color.New(var_154_18, var_154_18, var_154_18)
					end
				end

				arg_151_1.var_.actorSpriteComps10062 = nil
			end

			local var_154_19 = 0
			local var_154_20 = 0.05

			if var_154_19 < arg_151_1.time_ and arg_151_1.time_ <= var_154_19 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_21 = arg_151_1:FormatText(StoryNameCfg[612].name)

				arg_151_1.leftNameTxt_.text = var_154_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_22 = arg_151_1:GetWordFromCfg(410161037)
				local var_154_23 = arg_151_1:FormatText(var_154_22.content)

				arg_151_1.text_.text = var_154_23

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_24 = 2
				local var_154_25 = utf8.len(var_154_23)
				local var_154_26 = var_154_24 <= 0 and var_154_20 or var_154_20 * (var_154_25 / var_154_24)

				if var_154_26 > 0 and var_154_20 < var_154_26 then
					arg_151_1.talkMaxDuration = var_154_26

					if var_154_26 + var_154_19 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_26 + var_154_19
					end
				end

				arg_151_1.text_.text = var_154_23
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161037", "story_v_out_410161.awb") ~= 0 then
					local var_154_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161037", "story_v_out_410161.awb") / 1000

					if var_154_27 + var_154_19 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_27 + var_154_19
					end

					if var_154_22.prefab_name ~= "" and arg_151_1.actors_[var_154_22.prefab_name] ~= nil then
						local var_154_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_22.prefab_name].transform, "story_v_out_410161", "410161037", "story_v_out_410161.awb")

						arg_151_1:RecordAudio("410161037", var_154_28)
						arg_151_1:RecordAudio("410161037", var_154_28)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_410161", "410161037", "story_v_out_410161.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_410161", "410161037", "story_v_out_410161.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_29 = math.max(var_154_20, arg_151_1.talkMaxDuration)

			if var_154_19 <= arg_151_1.time_ and arg_151_1.time_ < var_154_19 + var_154_29 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_19) / var_154_29

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_19 + var_154_29 and arg_151_1.time_ < var_154_19 + var_154_29 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play410161038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 410161038
		arg_155_1.duration_ = 5.6

		local var_155_0 = {
			ja = 5.6,
			CriLanguages = 4.633,
			zh = 4.633
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
				arg_155_0:Play410161039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["10059"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos10059 = var_158_0.localPosition
				var_158_0.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10059", 4)

				local var_158_2 = var_158_0.childCount

				for iter_158_0 = 0, var_158_2 - 1 do
					local var_158_3 = var_158_0:GetChild(iter_158_0)

					if var_158_3.name == "split_5" or not string.find(var_158_3.name, "split") then
						var_158_3.gameObject:SetActive(true)
					else
						var_158_3.gameObject:SetActive(false)
					end
				end
			end

			local var_158_4 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_4 then
				local var_158_5 = (arg_155_1.time_ - var_158_1) / var_158_4
				local var_158_6 = Vector3.New(390, -530, 35)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10059, var_158_6, var_158_5)
			end

			if arg_155_1.time_ >= var_158_1 + var_158_4 and arg_155_1.time_ < var_158_1 + var_158_4 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_158_7 = arg_155_1.actors_["10062"].transform
			local var_158_8 = 0

			if var_158_8 < arg_155_1.time_ and arg_155_1.time_ <= var_158_8 + arg_158_0 then
				arg_155_1.var_.moveOldPos10062 = var_158_7.localPosition
				var_158_7.localScale = Vector3.New(1, 1, 1)

				arg_155_1:CheckSpriteTmpPos("10062", 7)

				local var_158_9 = var_158_7.childCount

				for iter_158_1 = 0, var_158_9 - 1 do
					local var_158_10 = var_158_7:GetChild(iter_158_1)

					if var_158_10.name == "" or not string.find(var_158_10.name, "split") then
						var_158_10.gameObject:SetActive(true)
					else
						var_158_10.gameObject:SetActive(false)
					end
				end
			end

			local var_158_11 = 0.001

			if var_158_8 <= arg_155_1.time_ and arg_155_1.time_ < var_158_8 + var_158_11 then
				local var_158_12 = (arg_155_1.time_ - var_158_8) / var_158_11
				local var_158_13 = Vector3.New(0, -2000, -290)

				var_158_7.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos10062, var_158_13, var_158_12)
			end

			if arg_155_1.time_ >= var_158_8 + var_158_11 and arg_155_1.time_ < var_158_8 + var_158_11 + arg_158_0 then
				var_158_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_158_14 = arg_155_1.actors_["10059"]
			local var_158_15 = 0

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 and arg_155_1.var_.actorSpriteComps10059 == nil then
				arg_155_1.var_.actorSpriteComps10059 = var_158_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_16 = 0.034

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_16 then
				local var_158_17 = (arg_155_1.time_ - var_158_15) / var_158_16

				if arg_155_1.var_.actorSpriteComps10059 then
					for iter_158_2, iter_158_3 in pairs(arg_155_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_158_3 then
							local var_158_18 = Mathf.Lerp(iter_158_3.color.r, 1, var_158_17)

							iter_158_3.color = Color.New(var_158_18, var_158_18, var_158_18)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_15 + var_158_16 and arg_155_1.time_ < var_158_15 + var_158_16 + arg_158_0 and arg_155_1.var_.actorSpriteComps10059 then
				local var_158_19 = 1

				for iter_158_4, iter_158_5 in pairs(arg_155_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_158_5 then
						iter_158_5.color = Color.New(var_158_19, var_158_19, var_158_19)
					end
				end

				arg_155_1.var_.actorSpriteComps10059 = nil
			end

			local var_158_20 = arg_155_1.actors_["10062"]
			local var_158_21 = 0

			if var_158_21 < arg_155_1.time_ and arg_155_1.time_ <= var_158_21 + arg_158_0 and arg_155_1.var_.actorSpriteComps10062 == nil then
				arg_155_1.var_.actorSpriteComps10062 = var_158_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_22 = 0.034

			if var_158_21 <= arg_155_1.time_ and arg_155_1.time_ < var_158_21 + var_158_22 then
				local var_158_23 = (arg_155_1.time_ - var_158_21) / var_158_22

				if arg_155_1.var_.actorSpriteComps10062 then
					for iter_158_6, iter_158_7 in pairs(arg_155_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_158_7 then
							local var_158_24 = Mathf.Lerp(iter_158_7.color.r, 0.5, var_158_23)

							iter_158_7.color = Color.New(var_158_24, var_158_24, var_158_24)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_21 + var_158_22 and arg_155_1.time_ < var_158_21 + var_158_22 + arg_158_0 and arg_155_1.var_.actorSpriteComps10062 then
				local var_158_25 = 0.5

				for iter_158_8, iter_158_9 in pairs(arg_155_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_158_9 then
						iter_158_9.color = Color.New(var_158_25, var_158_25, var_158_25)
					end
				end

				arg_155_1.var_.actorSpriteComps10062 = nil
			end

			local var_158_26 = arg_155_1.actors_["1061"]
			local var_158_27 = 0

			if var_158_27 < arg_155_1.time_ and arg_155_1.time_ <= var_158_27 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 == nil then
				arg_155_1.var_.actorSpriteComps1061 = var_158_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_158_28 = 0.034

			if var_158_27 <= arg_155_1.time_ and arg_155_1.time_ < var_158_27 + var_158_28 then
				local var_158_29 = (arg_155_1.time_ - var_158_27) / var_158_28

				if arg_155_1.var_.actorSpriteComps1061 then
					for iter_158_10, iter_158_11 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_158_11 then
							local var_158_30 = Mathf.Lerp(iter_158_11.color.r, 0.5, var_158_29)

							iter_158_11.color = Color.New(var_158_30, var_158_30, var_158_30)
						end
					end
				end
			end

			if arg_155_1.time_ >= var_158_27 + var_158_28 and arg_155_1.time_ < var_158_27 + var_158_28 + arg_158_0 and arg_155_1.var_.actorSpriteComps1061 then
				local var_158_31 = 0.5

				for iter_158_12, iter_158_13 in pairs(arg_155_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_158_13 then
						iter_158_13.color = Color.New(var_158_31, var_158_31, var_158_31)
					end
				end

				arg_155_1.var_.actorSpriteComps1061 = nil
			end

			local var_158_32 = 0
			local var_158_33 = 0.45

			if var_158_32 < arg_155_1.time_ and arg_155_1.time_ <= var_158_32 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_34 = arg_155_1:FormatText(StoryNameCfg[596].name)

				arg_155_1.leftNameTxt_.text = var_158_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_35 = arg_155_1:GetWordFromCfg(410161038)
				local var_158_36 = arg_155_1:FormatText(var_158_35.content)

				arg_155_1.text_.text = var_158_36

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_37 = 18
				local var_158_38 = utf8.len(var_158_36)
				local var_158_39 = var_158_37 <= 0 and var_158_33 or var_158_33 * (var_158_38 / var_158_37)

				if var_158_39 > 0 and var_158_33 < var_158_39 then
					arg_155_1.talkMaxDuration = var_158_39

					if var_158_39 + var_158_32 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_39 + var_158_32
					end
				end

				arg_155_1.text_.text = var_158_36
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161038", "story_v_out_410161.awb") ~= 0 then
					local var_158_40 = manager.audio:GetVoiceLength("story_v_out_410161", "410161038", "story_v_out_410161.awb") / 1000

					if var_158_40 + var_158_32 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_40 + var_158_32
					end

					if var_158_35.prefab_name ~= "" and arg_155_1.actors_[var_158_35.prefab_name] ~= nil then
						local var_158_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_35.prefab_name].transform, "story_v_out_410161", "410161038", "story_v_out_410161.awb")

						arg_155_1:RecordAudio("410161038", var_158_41)
						arg_155_1:RecordAudio("410161038", var_158_41)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_410161", "410161038", "story_v_out_410161.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_410161", "410161038", "story_v_out_410161.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_42 = math.max(var_158_33, arg_155_1.talkMaxDuration)

			if var_158_32 <= arg_155_1.time_ and arg_155_1.time_ < var_158_32 + var_158_42 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_32) / var_158_42

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_32 + var_158_42 and arg_155_1.time_ < var_158_32 + var_158_42 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play410161039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 410161039
		arg_159_1.duration_ = 7.9

		local var_159_0 = {
			ja = 7.9,
			CriLanguages = 2.833,
			zh = 2.833
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
				arg_159_0:Play410161040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["10059"].transform
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 then
				arg_159_1.var_.moveOldPos10059 = var_162_0.localPosition
				var_162_0.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("10059", 7)

				local var_162_2 = var_162_0.childCount

				for iter_162_0 = 0, var_162_2 - 1 do
					local var_162_3 = var_162_0:GetChild(iter_162_0)

					if var_162_3.name == "split_1" or not string.find(var_162_3.name, "split") then
						var_162_3.gameObject:SetActive(true)
					else
						var_162_3.gameObject:SetActive(false)
					end
				end
			end

			local var_162_4 = 0.001

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_4 then
				local var_162_5 = (arg_159_1.time_ - var_162_1) / var_162_4
				local var_162_6 = Vector3.New(0, -2000, 35)

				var_162_0.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10059, var_162_6, var_162_5)
			end

			if arg_159_1.time_ >= var_162_1 + var_162_4 and arg_159_1.time_ < var_162_1 + var_162_4 + arg_162_0 then
				var_162_0.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_162_7 = arg_159_1.actors_["10059"]
			local var_162_8 = 0

			if var_162_8 < arg_159_1.time_ and arg_159_1.time_ <= var_162_8 + arg_162_0 and arg_159_1.var_.actorSpriteComps10059 == nil then
				arg_159_1.var_.actorSpriteComps10059 = var_162_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_9 = 0.034

			if var_162_8 <= arg_159_1.time_ and arg_159_1.time_ < var_162_8 + var_162_9 then
				local var_162_10 = (arg_159_1.time_ - var_162_8) / var_162_9

				if arg_159_1.var_.actorSpriteComps10059 then
					for iter_162_1, iter_162_2 in pairs(arg_159_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_162_2 then
							local var_162_11 = Mathf.Lerp(iter_162_2.color.r, 0.5, var_162_10)

							iter_162_2.color = Color.New(var_162_11, var_162_11, var_162_11)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_8 + var_162_9 and arg_159_1.time_ < var_162_8 + var_162_9 + arg_162_0 and arg_159_1.var_.actorSpriteComps10059 then
				local var_162_12 = 0.5

				for iter_162_3, iter_162_4 in pairs(arg_159_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_162_4 then
						iter_162_4.color = Color.New(var_162_12, var_162_12, var_162_12)
					end
				end

				arg_159_1.var_.actorSpriteComps10059 = nil
			end

			local var_162_13 = arg_159_1.actors_["10062"].transform
			local var_162_14 = 0

			if var_162_14 < arg_159_1.time_ and arg_159_1.time_ <= var_162_14 + arg_162_0 then
				arg_159_1.var_.moveOldPos10062 = var_162_13.localPosition
				var_162_13.localScale = Vector3.New(1, 1, 1)

				arg_159_1:CheckSpriteTmpPos("10062", 4)

				local var_162_15 = var_162_13.childCount

				for iter_162_5 = 0, var_162_15 - 1 do
					local var_162_16 = var_162_13:GetChild(iter_162_5)

					if var_162_16.name == "split_1_1" or not string.find(var_162_16.name, "split") then
						var_162_16.gameObject:SetActive(true)
					else
						var_162_16.gameObject:SetActive(false)
					end
				end
			end

			local var_162_17 = 0.001

			if var_162_14 <= arg_159_1.time_ and arg_159_1.time_ < var_162_14 + var_162_17 then
				local var_162_18 = (arg_159_1.time_ - var_162_14) / var_162_17
				local var_162_19 = Vector3.New(370, -390, -290)

				var_162_13.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos10062, var_162_19, var_162_18)
			end

			if arg_159_1.time_ >= var_162_14 + var_162_17 and arg_159_1.time_ < var_162_14 + var_162_17 + arg_162_0 then
				var_162_13.localPosition = Vector3.New(370, -390, -290)
			end

			local var_162_20 = arg_159_1.actors_["10062"]
			local var_162_21 = 0

			if var_162_21 < arg_159_1.time_ and arg_159_1.time_ <= var_162_21 + arg_162_0 and arg_159_1.var_.actorSpriteComps10062 == nil then
				arg_159_1.var_.actorSpriteComps10062 = var_162_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_162_22 = 0.034

			if var_162_21 <= arg_159_1.time_ and arg_159_1.time_ < var_162_21 + var_162_22 then
				local var_162_23 = (arg_159_1.time_ - var_162_21) / var_162_22

				if arg_159_1.var_.actorSpriteComps10062 then
					for iter_162_6, iter_162_7 in pairs(arg_159_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_162_7 then
							local var_162_24 = Mathf.Lerp(iter_162_7.color.r, 1, var_162_23)

							iter_162_7.color = Color.New(var_162_24, var_162_24, var_162_24)
						end
					end
				end
			end

			if arg_159_1.time_ >= var_162_21 + var_162_22 and arg_159_1.time_ < var_162_21 + var_162_22 + arg_162_0 and arg_159_1.var_.actorSpriteComps10062 then
				local var_162_25 = 1

				for iter_162_8, iter_162_9 in pairs(arg_159_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_162_9 then
						iter_162_9.color = Color.New(var_162_25, var_162_25, var_162_25)
					end
				end

				arg_159_1.var_.actorSpriteComps10062 = nil
			end

			local var_162_26 = 0
			local var_162_27 = 0.175

			if var_162_26 < arg_159_1.time_ and arg_159_1.time_ <= var_162_26 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_28 = arg_159_1:FormatText(StoryNameCfg[600].name)

				arg_159_1.leftNameTxt_.text = var_162_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_29 = arg_159_1:GetWordFromCfg(410161039)
				local var_162_30 = arg_159_1:FormatText(var_162_29.content)

				arg_159_1.text_.text = var_162_30

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_31 = 7
				local var_162_32 = utf8.len(var_162_30)
				local var_162_33 = var_162_31 <= 0 and var_162_27 or var_162_27 * (var_162_32 / var_162_31)

				if var_162_33 > 0 and var_162_27 < var_162_33 then
					arg_159_1.talkMaxDuration = var_162_33

					if var_162_33 + var_162_26 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_33 + var_162_26
					end
				end

				arg_159_1.text_.text = var_162_30
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161039", "story_v_out_410161.awb") ~= 0 then
					local var_162_34 = manager.audio:GetVoiceLength("story_v_out_410161", "410161039", "story_v_out_410161.awb") / 1000

					if var_162_34 + var_162_26 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_34 + var_162_26
					end

					if var_162_29.prefab_name ~= "" and arg_159_1.actors_[var_162_29.prefab_name] ~= nil then
						local var_162_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_29.prefab_name].transform, "story_v_out_410161", "410161039", "story_v_out_410161.awb")

						arg_159_1:RecordAudio("410161039", var_162_35)
						arg_159_1:RecordAudio("410161039", var_162_35)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_410161", "410161039", "story_v_out_410161.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_410161", "410161039", "story_v_out_410161.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_36 = math.max(var_162_27, arg_159_1.talkMaxDuration)

			if var_162_26 <= arg_159_1.time_ and arg_159_1.time_ < var_162_26 + var_162_36 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_26) / var_162_36

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_26 + var_162_36 and arg_159_1.time_ < var_162_26 + var_162_36 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play410161040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 410161040
		arg_163_1.duration_ = 5

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play410161041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["10062"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.actorSpriteComps10062 == nil then
				arg_163_1.var_.actorSpriteComps10062 = var_166_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_166_2 = 0.034

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.actorSpriteComps10062 then
					for iter_166_0, iter_166_1 in pairs(arg_163_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_166_1 then
							local var_166_4 = Mathf.Lerp(iter_166_1.color.r, 0.5, var_166_3)

							iter_166_1.color = Color.New(var_166_4, var_166_4, var_166_4)
						end
					end
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.actorSpriteComps10062 then
				local var_166_5 = 0.5

				for iter_166_2, iter_166_3 in pairs(arg_163_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_166_3 then
						iter_166_3.color = Color.New(var_166_5, var_166_5, var_166_5)
					end
				end

				arg_163_1.var_.actorSpriteComps10062 = nil
			end

			local var_166_6 = 0
			local var_166_7 = 0.725

			if var_166_6 < arg_163_1.time_ and arg_163_1.time_ <= var_166_6 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, false)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_8 = arg_163_1:GetWordFromCfg(410161040)
				local var_166_9 = arg_163_1:FormatText(var_166_8.content)

				arg_163_1.text_.text = var_166_9

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_10 = 29
				local var_166_11 = utf8.len(var_166_9)
				local var_166_12 = var_166_10 <= 0 and var_166_7 or var_166_7 * (var_166_11 / var_166_10)

				if var_166_12 > 0 and var_166_7 < var_166_12 then
					arg_163_1.talkMaxDuration = var_166_12

					if var_166_12 + var_166_6 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_12 + var_166_6
					end
				end

				arg_163_1.text_.text = var_166_9
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)
				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_13 = math.max(var_166_7, arg_163_1.talkMaxDuration)

			if var_166_6 <= arg_163_1.time_ and arg_163_1.time_ < var_166_6 + var_166_13 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_6) / var_166_13

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_6 + var_166_13 and arg_163_1.time_ < var_166_6 + var_166_13 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play410161041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 410161041
		arg_167_1.duration_ = 9.7

		local var_167_0 = {
			ja = 9.7,
			CriLanguages = 5.9,
			zh = 5.9
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
				arg_167_0:Play410161042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["10059"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos10059 = var_170_0.localPosition
				var_170_0.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10059", 4)

				local var_170_2 = var_170_0.childCount

				for iter_170_0 = 0, var_170_2 - 1 do
					local var_170_3 = var_170_0:GetChild(iter_170_0)

					if var_170_3.name == "split_5" or not string.find(var_170_3.name, "split") then
						var_170_3.gameObject:SetActive(true)
					else
						var_170_3.gameObject:SetActive(false)
					end
				end
			end

			local var_170_4 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_4 then
				local var_170_5 = (arg_167_1.time_ - var_170_1) / var_170_4
				local var_170_6 = Vector3.New(390, -530, 35)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10059, var_170_6, var_170_5)
			end

			if arg_167_1.time_ >= var_170_1 + var_170_4 and arg_167_1.time_ < var_170_1 + var_170_4 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_170_7 = arg_167_1.actors_["10062"].transform
			local var_170_8 = 0

			if var_170_8 < arg_167_1.time_ and arg_167_1.time_ <= var_170_8 + arg_170_0 then
				arg_167_1.var_.moveOldPos10062 = var_170_7.localPosition
				var_170_7.localScale = Vector3.New(1, 1, 1)

				arg_167_1:CheckSpriteTmpPos("10062", 7)

				local var_170_9 = var_170_7.childCount

				for iter_170_1 = 0, var_170_9 - 1 do
					local var_170_10 = var_170_7:GetChild(iter_170_1)

					if var_170_10.name == "" or not string.find(var_170_10.name, "split") then
						var_170_10.gameObject:SetActive(true)
					else
						var_170_10.gameObject:SetActive(false)
					end
				end
			end

			local var_170_11 = 0.001

			if var_170_8 <= arg_167_1.time_ and arg_167_1.time_ < var_170_8 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_8) / var_170_11
				local var_170_13 = Vector3.New(0, -2000, -290)

				var_170_7.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos10062, var_170_13, var_170_12)
			end

			if arg_167_1.time_ >= var_170_8 + var_170_11 and arg_167_1.time_ < var_170_8 + var_170_11 + arg_170_0 then
				var_170_7.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_170_14 = arg_167_1.actors_["10059"]
			local var_170_15 = 0

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 and arg_167_1.var_.actorSpriteComps10059 == nil then
				arg_167_1.var_.actorSpriteComps10059 = var_170_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_16 = 0.034

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_16 then
				local var_170_17 = (arg_167_1.time_ - var_170_15) / var_170_16

				if arg_167_1.var_.actorSpriteComps10059 then
					for iter_170_2, iter_170_3 in pairs(arg_167_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_170_3 then
							local var_170_18 = Mathf.Lerp(iter_170_3.color.r, 1, var_170_17)

							iter_170_3.color = Color.New(var_170_18, var_170_18, var_170_18)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_15 + var_170_16 and arg_167_1.time_ < var_170_15 + var_170_16 + arg_170_0 and arg_167_1.var_.actorSpriteComps10059 then
				local var_170_19 = 1

				for iter_170_4, iter_170_5 in pairs(arg_167_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_170_5 then
						iter_170_5.color = Color.New(var_170_19, var_170_19, var_170_19)
					end
				end

				arg_167_1.var_.actorSpriteComps10059 = nil
			end

			local var_170_20 = arg_167_1.actors_["10062"]
			local var_170_21 = 0

			if var_170_21 < arg_167_1.time_ and arg_167_1.time_ <= var_170_21 + arg_170_0 and arg_167_1.var_.actorSpriteComps10062 == nil then
				arg_167_1.var_.actorSpriteComps10062 = var_170_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_170_22 = 0.034

			if var_170_21 <= arg_167_1.time_ and arg_167_1.time_ < var_170_21 + var_170_22 then
				local var_170_23 = (arg_167_1.time_ - var_170_21) / var_170_22

				if arg_167_1.var_.actorSpriteComps10062 then
					for iter_170_6, iter_170_7 in pairs(arg_167_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_170_7 then
							local var_170_24 = Mathf.Lerp(iter_170_7.color.r, 0.5, var_170_23)

							iter_170_7.color = Color.New(var_170_24, var_170_24, var_170_24)
						end
					end
				end
			end

			if arg_167_1.time_ >= var_170_21 + var_170_22 and arg_167_1.time_ < var_170_21 + var_170_22 + arg_170_0 and arg_167_1.var_.actorSpriteComps10062 then
				local var_170_25 = 0.5

				for iter_170_8, iter_170_9 in pairs(arg_167_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_170_9 then
						iter_170_9.color = Color.New(var_170_25, var_170_25, var_170_25)
					end
				end

				arg_167_1.var_.actorSpriteComps10062 = nil
			end

			local var_170_26 = 0
			local var_170_27 = 0.45

			if var_170_26 < arg_167_1.time_ and arg_167_1.time_ <= var_170_26 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_28 = arg_167_1:FormatText(StoryNameCfg[596].name)

				arg_167_1.leftNameTxt_.text = var_170_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_29 = arg_167_1:GetWordFromCfg(410161041)
				local var_170_30 = arg_167_1:FormatText(var_170_29.content)

				arg_167_1.text_.text = var_170_30

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_31 = 18
				local var_170_32 = utf8.len(var_170_30)
				local var_170_33 = var_170_31 <= 0 and var_170_27 or var_170_27 * (var_170_32 / var_170_31)

				if var_170_33 > 0 and var_170_27 < var_170_33 then
					arg_167_1.talkMaxDuration = var_170_33

					if var_170_33 + var_170_26 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_33 + var_170_26
					end
				end

				arg_167_1.text_.text = var_170_30
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161041", "story_v_out_410161.awb") ~= 0 then
					local var_170_34 = manager.audio:GetVoiceLength("story_v_out_410161", "410161041", "story_v_out_410161.awb") / 1000

					if var_170_34 + var_170_26 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_34 + var_170_26
					end

					if var_170_29.prefab_name ~= "" and arg_167_1.actors_[var_170_29.prefab_name] ~= nil then
						local var_170_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_29.prefab_name].transform, "story_v_out_410161", "410161041", "story_v_out_410161.awb")

						arg_167_1:RecordAudio("410161041", var_170_35)
						arg_167_1:RecordAudio("410161041", var_170_35)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_410161", "410161041", "story_v_out_410161.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_410161", "410161041", "story_v_out_410161.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_36 = math.max(var_170_27, arg_167_1.talkMaxDuration)

			if var_170_26 <= arg_167_1.time_ and arg_167_1.time_ < var_170_26 + var_170_36 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_26) / var_170_36

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_26 + var_170_36 and arg_167_1.time_ < var_170_26 + var_170_36 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play410161042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 410161042
		arg_171_1.duration_ = 8.8

		local var_171_0 = {
			ja = 8.8,
			CriLanguages = 3.566,
			zh = 3.566
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
				arg_171_0:Play410161043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1061"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1061 = var_174_0.localPosition
				var_174_0.localScale = Vector3.New(1, 1, 1)

				arg_171_1:CheckSpriteTmpPos("1061", 2)

				local var_174_2 = var_174_0.childCount

				for iter_174_0 = 0, var_174_2 - 1 do
					local var_174_3 = var_174_0:GetChild(iter_174_0)

					if var_174_3.name == "split_1" or not string.find(var_174_3.name, "split") then
						var_174_3.gameObject:SetActive(true)
					else
						var_174_3.gameObject:SetActive(false)
					end
				end
			end

			local var_174_4 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_4 then
				local var_174_5 = (arg_171_1.time_ - var_174_1) / var_174_4
				local var_174_6 = Vector3.New(-390, -490, 18)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1061, var_174_6, var_174_5)
			end

			if arg_171_1.time_ >= var_174_1 + var_174_4 and arg_171_1.time_ < var_174_1 + var_174_4 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_174_7 = arg_171_1.actors_["1061"]
			local var_174_8 = 0

			if var_174_8 < arg_171_1.time_ and arg_171_1.time_ <= var_174_8 + arg_174_0 and arg_171_1.var_.actorSpriteComps1061 == nil then
				arg_171_1.var_.actorSpriteComps1061 = var_174_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_9 = 0.034

			if var_174_8 <= arg_171_1.time_ and arg_171_1.time_ < var_174_8 + var_174_9 then
				local var_174_10 = (arg_171_1.time_ - var_174_8) / var_174_9

				if arg_171_1.var_.actorSpriteComps1061 then
					for iter_174_1, iter_174_2 in pairs(arg_171_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_174_2 then
							local var_174_11 = Mathf.Lerp(iter_174_2.color.r, 1, var_174_10)

							iter_174_2.color = Color.New(var_174_11, var_174_11, var_174_11)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_8 + var_174_9 and arg_171_1.time_ < var_174_8 + var_174_9 + arg_174_0 and arg_171_1.var_.actorSpriteComps1061 then
				local var_174_12 = 1

				for iter_174_3, iter_174_4 in pairs(arg_171_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_174_4 then
						iter_174_4.color = Color.New(var_174_12, var_174_12, var_174_12)
					end
				end

				arg_171_1.var_.actorSpriteComps1061 = nil
			end

			local var_174_13 = arg_171_1.actors_["10059"]
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 and arg_171_1.var_.actorSpriteComps10059 == nil then
				arg_171_1.var_.actorSpriteComps10059 = var_174_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_174_15 = 0.034

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15

				if arg_171_1.var_.actorSpriteComps10059 then
					for iter_174_5, iter_174_6 in pairs(arg_171_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_174_6 then
							local var_174_17 = Mathf.Lerp(iter_174_6.color.r, 0.5, var_174_16)

							iter_174_6.color = Color.New(var_174_17, var_174_17, var_174_17)
						end
					end
				end
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 and arg_171_1.var_.actorSpriteComps10059 then
				local var_174_18 = 0.5

				for iter_174_7, iter_174_8 in pairs(arg_171_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_174_8 then
						iter_174_8.color = Color.New(var_174_18, var_174_18, var_174_18)
					end
				end

				arg_171_1.var_.actorSpriteComps10059 = nil
			end

			local var_174_19 = 0
			local var_174_20 = 0.425

			if var_174_19 < arg_171_1.time_ and arg_171_1.time_ <= var_174_19 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_21 = arg_171_1:FormatText(StoryNameCfg[612].name)

				arg_171_1.leftNameTxt_.text = var_174_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_22 = arg_171_1:GetWordFromCfg(410161042)
				local var_174_23 = arg_171_1:FormatText(var_174_22.content)

				arg_171_1.text_.text = var_174_23

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_24 = 17
				local var_174_25 = utf8.len(var_174_23)
				local var_174_26 = var_174_24 <= 0 and var_174_20 or var_174_20 * (var_174_25 / var_174_24)

				if var_174_26 > 0 and var_174_20 < var_174_26 then
					arg_171_1.talkMaxDuration = var_174_26

					if var_174_26 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_26 + var_174_19
					end
				end

				arg_171_1.text_.text = var_174_23
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161042", "story_v_out_410161.awb") ~= 0 then
					local var_174_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161042", "story_v_out_410161.awb") / 1000

					if var_174_27 + var_174_19 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_27 + var_174_19
					end

					if var_174_22.prefab_name ~= "" and arg_171_1.actors_[var_174_22.prefab_name] ~= nil then
						local var_174_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_22.prefab_name].transform, "story_v_out_410161", "410161042", "story_v_out_410161.awb")

						arg_171_1:RecordAudio("410161042", var_174_28)
						arg_171_1:RecordAudio("410161042", var_174_28)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_410161", "410161042", "story_v_out_410161.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_410161", "410161042", "story_v_out_410161.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_29 = math.max(var_174_20, arg_171_1.talkMaxDuration)

			if var_174_19 <= arg_171_1.time_ and arg_171_1.time_ < var_174_19 + var_174_29 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_19) / var_174_29

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_19 + var_174_29 and arg_171_1.time_ < var_174_19 + var_174_29 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play410161043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 410161043
		arg_175_1.duration_ = 11.033

		local var_175_0 = {
			ja = 11.033,
			CriLanguages = 7.3,
			zh = 7.3
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
				arg_175_0:Play410161044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10059"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos10059 = var_178_0.localPosition
				var_178_0.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("10059", 2)

				local var_178_2 = var_178_0.childCount

				for iter_178_0 = 0, var_178_2 - 1 do
					local var_178_3 = var_178_0:GetChild(iter_178_0)

					if var_178_3.name == "split_2" or not string.find(var_178_3.name, "split") then
						var_178_3.gameObject:SetActive(true)
					else
						var_178_3.gameObject:SetActive(false)
					end
				end
			end

			local var_178_4 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_4 then
				local var_178_5 = (arg_175_1.time_ - var_178_1) / var_178_4
				local var_178_6 = Vector3.New(-390, -530, 35)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos10059, var_178_6, var_178_5)
			end

			if arg_175_1.time_ >= var_178_1 + var_178_4 and arg_175_1.time_ < var_178_1 + var_178_4 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_178_7 = arg_175_1.actors_["1061"].transform
			local var_178_8 = 0

			if var_178_8 < arg_175_1.time_ and arg_175_1.time_ <= var_178_8 + arg_178_0 then
				arg_175_1.var_.moveOldPos1061 = var_178_7.localPosition
				var_178_7.localScale = Vector3.New(1, 1, 1)

				arg_175_1:CheckSpriteTmpPos("1061", 7)

				local var_178_9 = var_178_7.childCount

				for iter_178_1 = 0, var_178_9 - 1 do
					local var_178_10 = var_178_7:GetChild(iter_178_1)

					if var_178_10.name == "" or not string.find(var_178_10.name, "split") then
						var_178_10.gameObject:SetActive(true)
					else
						var_178_10.gameObject:SetActive(false)
					end
				end
			end

			local var_178_11 = 0.001

			if var_178_8 <= arg_175_1.time_ and arg_175_1.time_ < var_178_8 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_8) / var_178_11
				local var_178_13 = Vector3.New(0, -2000, 18)

				var_178_7.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1061, var_178_13, var_178_12)
			end

			if arg_175_1.time_ >= var_178_8 + var_178_11 and arg_175_1.time_ < var_178_8 + var_178_11 + arg_178_0 then
				var_178_7.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_178_14 = arg_175_1.actors_["10059"]
			local var_178_15 = 0

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 and arg_175_1.var_.actorSpriteComps10059 == nil then
				arg_175_1.var_.actorSpriteComps10059 = var_178_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_16 = 0.034

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_16 then
				local var_178_17 = (arg_175_1.time_ - var_178_15) / var_178_16

				if arg_175_1.var_.actorSpriteComps10059 then
					for iter_178_2, iter_178_3 in pairs(arg_175_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_178_3 then
							local var_178_18 = Mathf.Lerp(iter_178_3.color.r, 1, var_178_17)

							iter_178_3.color = Color.New(var_178_18, var_178_18, var_178_18)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_15 + var_178_16 and arg_175_1.time_ < var_178_15 + var_178_16 + arg_178_0 and arg_175_1.var_.actorSpriteComps10059 then
				local var_178_19 = 1

				for iter_178_4, iter_178_5 in pairs(arg_175_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_178_5 then
						iter_178_5.color = Color.New(var_178_19, var_178_19, var_178_19)
					end
				end

				arg_175_1.var_.actorSpriteComps10059 = nil
			end

			local var_178_20 = arg_175_1.actors_["1061"]
			local var_178_21 = 0

			if var_178_21 < arg_175_1.time_ and arg_175_1.time_ <= var_178_21 + arg_178_0 and arg_175_1.var_.actorSpriteComps1061 == nil then
				arg_175_1.var_.actorSpriteComps1061 = var_178_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_178_22 = 0.034

			if var_178_21 <= arg_175_1.time_ and arg_175_1.time_ < var_178_21 + var_178_22 then
				local var_178_23 = (arg_175_1.time_ - var_178_21) / var_178_22

				if arg_175_1.var_.actorSpriteComps1061 then
					for iter_178_6, iter_178_7 in pairs(arg_175_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_178_7 then
							local var_178_24 = Mathf.Lerp(iter_178_7.color.r, 0.5, var_178_23)

							iter_178_7.color = Color.New(var_178_24, var_178_24, var_178_24)
						end
					end
				end
			end

			if arg_175_1.time_ >= var_178_21 + var_178_22 and arg_175_1.time_ < var_178_21 + var_178_22 + arg_178_0 and arg_175_1.var_.actorSpriteComps1061 then
				local var_178_25 = 0.5

				for iter_178_8, iter_178_9 in pairs(arg_175_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_178_9 then
						iter_178_9.color = Color.New(var_178_25, var_178_25, var_178_25)
					end
				end

				arg_175_1.var_.actorSpriteComps1061 = nil
			end

			local var_178_26 = 0
			local var_178_27 = 0.675

			if var_178_26 < arg_175_1.time_ and arg_175_1.time_ <= var_178_26 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_28 = arg_175_1:FormatText(StoryNameCfg[596].name)

				arg_175_1.leftNameTxt_.text = var_178_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_29 = arg_175_1:GetWordFromCfg(410161043)
				local var_178_30 = arg_175_1:FormatText(var_178_29.content)

				arg_175_1.text_.text = var_178_30

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_31 = 27
				local var_178_32 = utf8.len(var_178_30)
				local var_178_33 = var_178_31 <= 0 and var_178_27 or var_178_27 * (var_178_32 / var_178_31)

				if var_178_33 > 0 and var_178_27 < var_178_33 then
					arg_175_1.talkMaxDuration = var_178_33

					if var_178_33 + var_178_26 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_33 + var_178_26
					end
				end

				arg_175_1.text_.text = var_178_30
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161043", "story_v_out_410161.awb") ~= 0 then
					local var_178_34 = manager.audio:GetVoiceLength("story_v_out_410161", "410161043", "story_v_out_410161.awb") / 1000

					if var_178_34 + var_178_26 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_34 + var_178_26
					end

					if var_178_29.prefab_name ~= "" and arg_175_1.actors_[var_178_29.prefab_name] ~= nil then
						local var_178_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_29.prefab_name].transform, "story_v_out_410161", "410161043", "story_v_out_410161.awb")

						arg_175_1:RecordAudio("410161043", var_178_35)
						arg_175_1:RecordAudio("410161043", var_178_35)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_410161", "410161043", "story_v_out_410161.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_410161", "410161043", "story_v_out_410161.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_36 = math.max(var_178_27, arg_175_1.talkMaxDuration)

			if var_178_26 <= arg_175_1.time_ and arg_175_1.time_ < var_178_26 + var_178_36 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_26) / var_178_36

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_26 + var_178_36 and arg_175_1.time_ < var_178_26 + var_178_36 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play410161044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 410161044
		arg_179_1.duration_ = 5.9

		local var_179_0 = {
			ja = 5.9,
			CriLanguages = 2.733,
			zh = 2.733
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
				arg_179_0:Play410161045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10062"].transform
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 then
				arg_179_1.var_.moveOldPos10062 = var_182_0.localPosition
				var_182_0.localScale = Vector3.New(1, 1, 1)

				arg_179_1:CheckSpriteTmpPos("10062", 4)

				local var_182_2 = var_182_0.childCount

				for iter_182_0 = 0, var_182_2 - 1 do
					local var_182_3 = var_182_0:GetChild(iter_182_0)

					if var_182_3.name == "" or not string.find(var_182_3.name, "split") then
						var_182_3.gameObject:SetActive(true)
					else
						var_182_3.gameObject:SetActive(false)
					end
				end
			end

			local var_182_4 = 0.001

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_4 then
				local var_182_5 = (arg_179_1.time_ - var_182_1) / var_182_4
				local var_182_6 = Vector3.New(370, -390, -290)

				var_182_0.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10062, var_182_6, var_182_5)
			end

			if arg_179_1.time_ >= var_182_1 + var_182_4 and arg_179_1.time_ < var_182_1 + var_182_4 + arg_182_0 then
				var_182_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_182_7 = arg_179_1.actors_["10062"]
			local var_182_8 = 0

			if var_182_8 < arg_179_1.time_ and arg_179_1.time_ <= var_182_8 + arg_182_0 and arg_179_1.var_.actorSpriteComps10062 == nil then
				arg_179_1.var_.actorSpriteComps10062 = var_182_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_9 = 0.034

			if var_182_8 <= arg_179_1.time_ and arg_179_1.time_ < var_182_8 + var_182_9 then
				local var_182_10 = (arg_179_1.time_ - var_182_8) / var_182_9

				if arg_179_1.var_.actorSpriteComps10062 then
					for iter_182_1, iter_182_2 in pairs(arg_179_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_182_2 then
							local var_182_11 = Mathf.Lerp(iter_182_2.color.r, 1, var_182_10)

							iter_182_2.color = Color.New(var_182_11, var_182_11, var_182_11)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_8 + var_182_9 and arg_179_1.time_ < var_182_8 + var_182_9 + arg_182_0 and arg_179_1.var_.actorSpriteComps10062 then
				local var_182_12 = 1

				for iter_182_3, iter_182_4 in pairs(arg_179_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_182_4 then
						iter_182_4.color = Color.New(var_182_12, var_182_12, var_182_12)
					end
				end

				arg_179_1.var_.actorSpriteComps10062 = nil
			end

			local var_182_13 = arg_179_1.actors_["10059"]
			local var_182_14 = 0

			if var_182_14 < arg_179_1.time_ and arg_179_1.time_ <= var_182_14 + arg_182_0 and arg_179_1.var_.actorSpriteComps10059 == nil then
				arg_179_1.var_.actorSpriteComps10059 = var_182_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_182_15 = 0.034

			if var_182_14 <= arg_179_1.time_ and arg_179_1.time_ < var_182_14 + var_182_15 then
				local var_182_16 = (arg_179_1.time_ - var_182_14) / var_182_15

				if arg_179_1.var_.actorSpriteComps10059 then
					for iter_182_5, iter_182_6 in pairs(arg_179_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_182_6 then
							local var_182_17 = Mathf.Lerp(iter_182_6.color.r, 0.5, var_182_16)

							iter_182_6.color = Color.New(var_182_17, var_182_17, var_182_17)
						end
					end
				end
			end

			if arg_179_1.time_ >= var_182_14 + var_182_15 and arg_179_1.time_ < var_182_14 + var_182_15 + arg_182_0 and arg_179_1.var_.actorSpriteComps10059 then
				local var_182_18 = 0.5

				for iter_182_7, iter_182_8 in pairs(arg_179_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_182_8 then
						iter_182_8.color = Color.New(var_182_18, var_182_18, var_182_18)
					end
				end

				arg_179_1.var_.actorSpriteComps10059 = nil
			end

			local var_182_19 = 0
			local var_182_20 = 0.275

			if var_182_19 < arg_179_1.time_ and arg_179_1.time_ <= var_182_19 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_21 = arg_179_1:FormatText(StoryNameCfg[600].name)

				arg_179_1.leftNameTxt_.text = var_182_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_22 = arg_179_1:GetWordFromCfg(410161044)
				local var_182_23 = arg_179_1:FormatText(var_182_22.content)

				arg_179_1.text_.text = var_182_23

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_24 = 11
				local var_182_25 = utf8.len(var_182_23)
				local var_182_26 = var_182_24 <= 0 and var_182_20 or var_182_20 * (var_182_25 / var_182_24)

				if var_182_26 > 0 and var_182_20 < var_182_26 then
					arg_179_1.talkMaxDuration = var_182_26

					if var_182_26 + var_182_19 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_26 + var_182_19
					end
				end

				arg_179_1.text_.text = var_182_23
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161044", "story_v_out_410161.awb") ~= 0 then
					local var_182_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161044", "story_v_out_410161.awb") / 1000

					if var_182_27 + var_182_19 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_27 + var_182_19
					end

					if var_182_22.prefab_name ~= "" and arg_179_1.actors_[var_182_22.prefab_name] ~= nil then
						local var_182_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_22.prefab_name].transform, "story_v_out_410161", "410161044", "story_v_out_410161.awb")

						arg_179_1:RecordAudio("410161044", var_182_28)
						arg_179_1:RecordAudio("410161044", var_182_28)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_410161", "410161044", "story_v_out_410161.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_410161", "410161044", "story_v_out_410161.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_29 = math.max(var_182_20, arg_179_1.talkMaxDuration)

			if var_182_19 <= arg_179_1.time_ and arg_179_1.time_ < var_182_19 + var_182_29 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_19) / var_182_29

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_19 + var_182_29 and arg_179_1.time_ < var_182_19 + var_182_29 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play410161045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 410161045
		arg_183_1.duration_ = 6.266

		local var_183_0 = {
			ja = 6.266,
			CriLanguages = 5.433,
			zh = 5.433
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
				arg_183_0:Play410161046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10059"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10059 = var_186_0.localPosition
				var_186_0.localScale = Vector3.New(1, 1, 1)

				arg_183_1:CheckSpriteTmpPos("10059", 2)

				local var_186_2 = var_186_0.childCount

				for iter_186_0 = 0, var_186_2 - 1 do
					local var_186_3 = var_186_0:GetChild(iter_186_0)

					if var_186_3.name == "" or not string.find(var_186_3.name, "split") then
						var_186_3.gameObject:SetActive(true)
					else
						var_186_3.gameObject:SetActive(false)
					end
				end
			end

			local var_186_4 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_4 then
				local var_186_5 = (arg_183_1.time_ - var_186_1) / var_186_4
				local var_186_6 = Vector3.New(-390, -530, 35)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10059, var_186_6, var_186_5)
			end

			if arg_183_1.time_ >= var_186_1 + var_186_4 and arg_183_1.time_ < var_186_1 + var_186_4 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_186_7 = arg_183_1.actors_["10059"]
			local var_186_8 = 0

			if var_186_8 < arg_183_1.time_ and arg_183_1.time_ <= var_186_8 + arg_186_0 and arg_183_1.var_.actorSpriteComps10059 == nil then
				arg_183_1.var_.actorSpriteComps10059 = var_186_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_9 = 0.034

			if var_186_8 <= arg_183_1.time_ and arg_183_1.time_ < var_186_8 + var_186_9 then
				local var_186_10 = (arg_183_1.time_ - var_186_8) / var_186_9

				if arg_183_1.var_.actorSpriteComps10059 then
					for iter_186_1, iter_186_2 in pairs(arg_183_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_186_2 then
							local var_186_11 = Mathf.Lerp(iter_186_2.color.r, 1, var_186_10)

							iter_186_2.color = Color.New(var_186_11, var_186_11, var_186_11)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_8 + var_186_9 and arg_183_1.time_ < var_186_8 + var_186_9 + arg_186_0 and arg_183_1.var_.actorSpriteComps10059 then
				local var_186_12 = 1

				for iter_186_3, iter_186_4 in pairs(arg_183_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_186_4 then
						iter_186_4.color = Color.New(var_186_12, var_186_12, var_186_12)
					end
				end

				arg_183_1.var_.actorSpriteComps10059 = nil
			end

			local var_186_13 = arg_183_1.actors_["10062"]
			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 and arg_183_1.var_.actorSpriteComps10062 == nil then
				arg_183_1.var_.actorSpriteComps10062 = var_186_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_186_15 = 0.034

			if var_186_14 <= arg_183_1.time_ and arg_183_1.time_ < var_186_14 + var_186_15 then
				local var_186_16 = (arg_183_1.time_ - var_186_14) / var_186_15

				if arg_183_1.var_.actorSpriteComps10062 then
					for iter_186_5, iter_186_6 in pairs(arg_183_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_186_6 then
							local var_186_17 = Mathf.Lerp(iter_186_6.color.r, 0.5, var_186_16)

							iter_186_6.color = Color.New(var_186_17, var_186_17, var_186_17)
						end
					end
				end
			end

			if arg_183_1.time_ >= var_186_14 + var_186_15 and arg_183_1.time_ < var_186_14 + var_186_15 + arg_186_0 and arg_183_1.var_.actorSpriteComps10062 then
				local var_186_18 = 0.5

				for iter_186_7, iter_186_8 in pairs(arg_183_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_186_8 then
						iter_186_8.color = Color.New(var_186_18, var_186_18, var_186_18)
					end
				end

				arg_183_1.var_.actorSpriteComps10062 = nil
			end

			local var_186_19 = 0
			local var_186_20 = 0.7

			if var_186_19 < arg_183_1.time_ and arg_183_1.time_ <= var_186_19 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_21 = arg_183_1:FormatText(StoryNameCfg[596].name)

				arg_183_1.leftNameTxt_.text = var_186_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_22 = arg_183_1:GetWordFromCfg(410161045)
				local var_186_23 = arg_183_1:FormatText(var_186_22.content)

				arg_183_1.text_.text = var_186_23

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_24 = 28
				local var_186_25 = utf8.len(var_186_23)
				local var_186_26 = var_186_24 <= 0 and var_186_20 or var_186_20 * (var_186_25 / var_186_24)

				if var_186_26 > 0 and var_186_20 < var_186_26 then
					arg_183_1.talkMaxDuration = var_186_26

					if var_186_26 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_26 + var_186_19
					end
				end

				arg_183_1.text_.text = var_186_23
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161045", "story_v_out_410161.awb") ~= 0 then
					local var_186_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161045", "story_v_out_410161.awb") / 1000

					if var_186_27 + var_186_19 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_27 + var_186_19
					end

					if var_186_22.prefab_name ~= "" and arg_183_1.actors_[var_186_22.prefab_name] ~= nil then
						local var_186_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_22.prefab_name].transform, "story_v_out_410161", "410161045", "story_v_out_410161.awb")

						arg_183_1:RecordAudio("410161045", var_186_28)
						arg_183_1:RecordAudio("410161045", var_186_28)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_410161", "410161045", "story_v_out_410161.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_410161", "410161045", "story_v_out_410161.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_29 = math.max(var_186_20, arg_183_1.talkMaxDuration)

			if var_186_19 <= arg_183_1.time_ and arg_183_1.time_ < var_186_19 + var_186_29 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_19) / var_186_29

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_19 + var_186_29 and arg_183_1.time_ < var_186_19 + var_186_29 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play410161046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 410161046
		arg_187_1.duration_ = 11.866

		local var_187_0 = {
			ja = 11.866,
			CriLanguages = 5.166,
			zh = 5.166
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
				arg_187_0:Play410161047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10059"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos10059 = var_190_0.localPosition
				var_190_0.localScale = Vector3.New(1, 1, 1)

				arg_187_1:CheckSpriteTmpPos("10059", 2)

				local var_190_2 = var_190_0.childCount

				for iter_190_0 = 0, var_190_2 - 1 do
					local var_190_3 = var_190_0:GetChild(iter_190_0)

					if var_190_3.name == "" or not string.find(var_190_3.name, "split") then
						var_190_3.gameObject:SetActive(true)
					else
						var_190_3.gameObject:SetActive(false)
					end
				end
			end

			local var_190_4 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_4 then
				local var_190_5 = (arg_187_1.time_ - var_190_1) / var_190_4
				local var_190_6 = Vector3.New(-390, -530, 35)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10059, var_190_6, var_190_5)
			end

			if arg_187_1.time_ >= var_190_1 + var_190_4 and arg_187_1.time_ < var_190_1 + var_190_4 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_190_7 = arg_187_1.actors_["10059"]
			local var_190_8 = 0

			if var_190_8 < arg_187_1.time_ and arg_187_1.time_ <= var_190_8 + arg_190_0 and arg_187_1.var_.actorSpriteComps10059 == nil then
				arg_187_1.var_.actorSpriteComps10059 = var_190_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_190_9 = 0.034

			if var_190_8 <= arg_187_1.time_ and arg_187_1.time_ < var_190_8 + var_190_9 then
				local var_190_10 = (arg_187_1.time_ - var_190_8) / var_190_9

				if arg_187_1.var_.actorSpriteComps10059 then
					for iter_190_1, iter_190_2 in pairs(arg_187_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_190_2 then
							local var_190_11 = Mathf.Lerp(iter_190_2.color.r, 1, var_190_10)

							iter_190_2.color = Color.New(var_190_11, var_190_11, var_190_11)
						end
					end
				end
			end

			if arg_187_1.time_ >= var_190_8 + var_190_9 and arg_187_1.time_ < var_190_8 + var_190_9 + arg_190_0 and arg_187_1.var_.actorSpriteComps10059 then
				local var_190_12 = 1

				for iter_190_3, iter_190_4 in pairs(arg_187_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_190_4 then
						iter_190_4.color = Color.New(var_190_12, var_190_12, var_190_12)
					end
				end

				arg_187_1.var_.actorSpriteComps10059 = nil
			end

			local var_190_13 = 0
			local var_190_14 = 0.7

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_15 = arg_187_1:FormatText(StoryNameCfg[596].name)

				arg_187_1.leftNameTxt_.text = var_190_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_16 = arg_187_1:GetWordFromCfg(410161046)
				local var_190_17 = arg_187_1:FormatText(var_190_16.content)

				arg_187_1.text_.text = var_190_17

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_18 = 28
				local var_190_19 = utf8.len(var_190_17)
				local var_190_20 = var_190_18 <= 0 and var_190_14 or var_190_14 * (var_190_19 / var_190_18)

				if var_190_20 > 0 and var_190_14 < var_190_20 then
					arg_187_1.talkMaxDuration = var_190_20

					if var_190_20 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_20 + var_190_13
					end
				end

				arg_187_1.text_.text = var_190_17
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161046", "story_v_out_410161.awb") ~= 0 then
					local var_190_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161046", "story_v_out_410161.awb") / 1000

					if var_190_21 + var_190_13 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_21 + var_190_13
					end

					if var_190_16.prefab_name ~= "" and arg_187_1.actors_[var_190_16.prefab_name] ~= nil then
						local var_190_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_16.prefab_name].transform, "story_v_out_410161", "410161046", "story_v_out_410161.awb")

						arg_187_1:RecordAudio("410161046", var_190_22)
						arg_187_1:RecordAudio("410161046", var_190_22)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_410161", "410161046", "story_v_out_410161.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_410161", "410161046", "story_v_out_410161.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_23 = math.max(var_190_14, arg_187_1.talkMaxDuration)

			if var_190_13 <= arg_187_1.time_ and arg_187_1.time_ < var_190_13 + var_190_23 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_13) / var_190_23

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_13 + var_190_23 and arg_187_1.time_ < var_190_13 + var_190_23 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play410161047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 410161047
		arg_191_1.duration_ = 5.2

		local var_191_0 = {
			ja = 5.2,
			CriLanguages = 2.733,
			zh = 2.733
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
				arg_191_0:Play410161048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["10062"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos10062 = var_194_0.localPosition
				var_194_0.localScale = Vector3.New(1, 1, 1)

				arg_191_1:CheckSpriteTmpPos("10062", 4)

				local var_194_2 = var_194_0.childCount

				for iter_194_0 = 0, var_194_2 - 1 do
					local var_194_3 = var_194_0:GetChild(iter_194_0)

					if var_194_3.name == "split_3" or not string.find(var_194_3.name, "split") then
						var_194_3.gameObject:SetActive(true)
					else
						var_194_3.gameObject:SetActive(false)
					end
				end
			end

			local var_194_4 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_4 then
				local var_194_5 = (arg_191_1.time_ - var_194_1) / var_194_4
				local var_194_6 = Vector3.New(370, -390, -290)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos10062, var_194_6, var_194_5)
			end

			if arg_191_1.time_ >= var_194_1 + var_194_4 and arg_191_1.time_ < var_194_1 + var_194_4 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(370, -390, -290)
			end

			local var_194_7 = arg_191_1.actors_["10062"]
			local var_194_8 = 0

			if var_194_8 < arg_191_1.time_ and arg_191_1.time_ <= var_194_8 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 == nil then
				arg_191_1.var_.actorSpriteComps10062 = var_194_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_9 = 0.034

			if var_194_8 <= arg_191_1.time_ and arg_191_1.time_ < var_194_8 + var_194_9 then
				local var_194_10 = (arg_191_1.time_ - var_194_8) / var_194_9

				if arg_191_1.var_.actorSpriteComps10062 then
					for iter_194_1, iter_194_2 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_194_2 then
							local var_194_11 = Mathf.Lerp(iter_194_2.color.r, 1, var_194_10)

							iter_194_2.color = Color.New(var_194_11, var_194_11, var_194_11)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_8 + var_194_9 and arg_191_1.time_ < var_194_8 + var_194_9 + arg_194_0 and arg_191_1.var_.actorSpriteComps10062 then
				local var_194_12 = 1

				for iter_194_3, iter_194_4 in pairs(arg_191_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_194_4 then
						iter_194_4.color = Color.New(var_194_12, var_194_12, var_194_12)
					end
				end

				arg_191_1.var_.actorSpriteComps10062 = nil
			end

			local var_194_13 = arg_191_1.actors_["10059"]
			local var_194_14 = 0

			if var_194_14 < arg_191_1.time_ and arg_191_1.time_ <= var_194_14 + arg_194_0 and arg_191_1.var_.actorSpriteComps10059 == nil then
				arg_191_1.var_.actorSpriteComps10059 = var_194_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_194_15 = 0.034

			if var_194_14 <= arg_191_1.time_ and arg_191_1.time_ < var_194_14 + var_194_15 then
				local var_194_16 = (arg_191_1.time_ - var_194_14) / var_194_15

				if arg_191_1.var_.actorSpriteComps10059 then
					for iter_194_5, iter_194_6 in pairs(arg_191_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_194_6 then
							local var_194_17 = Mathf.Lerp(iter_194_6.color.r, 0.5, var_194_16)

							iter_194_6.color = Color.New(var_194_17, var_194_17, var_194_17)
						end
					end
				end
			end

			if arg_191_1.time_ >= var_194_14 + var_194_15 and arg_191_1.time_ < var_194_14 + var_194_15 + arg_194_0 and arg_191_1.var_.actorSpriteComps10059 then
				local var_194_18 = 0.5

				for iter_194_7, iter_194_8 in pairs(arg_191_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_194_8 then
						iter_194_8.color = Color.New(var_194_18, var_194_18, var_194_18)
					end
				end

				arg_191_1.var_.actorSpriteComps10059 = nil
			end

			local var_194_19 = 0
			local var_194_20 = 0.25

			if var_194_19 < arg_191_1.time_ and arg_191_1.time_ <= var_194_19 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_21 = arg_191_1:FormatText(StoryNameCfg[600].name)

				arg_191_1.leftNameTxt_.text = var_194_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_22 = arg_191_1:GetWordFromCfg(410161047)
				local var_194_23 = arg_191_1:FormatText(var_194_22.content)

				arg_191_1.text_.text = var_194_23

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_24 = 10
				local var_194_25 = utf8.len(var_194_23)
				local var_194_26 = var_194_24 <= 0 and var_194_20 or var_194_20 * (var_194_25 / var_194_24)

				if var_194_26 > 0 and var_194_20 < var_194_26 then
					arg_191_1.talkMaxDuration = var_194_26

					if var_194_26 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_26 + var_194_19
					end
				end

				arg_191_1.text_.text = var_194_23
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161047", "story_v_out_410161.awb") ~= 0 then
					local var_194_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161047", "story_v_out_410161.awb") / 1000

					if var_194_27 + var_194_19 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_27 + var_194_19
					end

					if var_194_22.prefab_name ~= "" and arg_191_1.actors_[var_194_22.prefab_name] ~= nil then
						local var_194_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_22.prefab_name].transform, "story_v_out_410161", "410161047", "story_v_out_410161.awb")

						arg_191_1:RecordAudio("410161047", var_194_28)
						arg_191_1:RecordAudio("410161047", var_194_28)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_410161", "410161047", "story_v_out_410161.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_410161", "410161047", "story_v_out_410161.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_29 = math.max(var_194_20, arg_191_1.talkMaxDuration)

			if var_194_19 <= arg_191_1.time_ and arg_191_1.time_ < var_194_19 + var_194_29 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_19) / var_194_29

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_19 + var_194_29 and arg_191_1.time_ < var_194_19 + var_194_29 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play410161048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 410161048
		arg_195_1.duration_ = 7.333

		local var_195_0 = {
			ja = 7.333,
			CriLanguages = 3.766,
			zh = 3.766
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
				arg_195_0:Play410161049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10059"].transform
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.var_.moveOldPos10059 = var_198_0.localPosition
				var_198_0.localScale = Vector3.New(1, 1, 1)

				arg_195_1:CheckSpriteTmpPos("10059", 2)

				local var_198_2 = var_198_0.childCount

				for iter_198_0 = 0, var_198_2 - 1 do
					local var_198_3 = var_198_0:GetChild(iter_198_0)

					if var_198_3.name == "split_3" or not string.find(var_198_3.name, "split") then
						var_198_3.gameObject:SetActive(true)
					else
						var_198_3.gameObject:SetActive(false)
					end
				end
			end

			local var_198_4 = 0.001

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_4 then
				local var_198_5 = (arg_195_1.time_ - var_198_1) / var_198_4
				local var_198_6 = Vector3.New(-390, -530, 35)

				var_198_0.localPosition = Vector3.Lerp(arg_195_1.var_.moveOldPos10059, var_198_6, var_198_5)
			end

			if arg_195_1.time_ >= var_198_1 + var_198_4 and arg_195_1.time_ < var_198_1 + var_198_4 + arg_198_0 then
				var_198_0.localPosition = Vector3.New(-390, -530, 35)
			end

			local var_198_7 = arg_195_1.actors_["10059"]
			local var_198_8 = 0

			if var_198_8 < arg_195_1.time_ and arg_195_1.time_ <= var_198_8 + arg_198_0 and arg_195_1.var_.actorSpriteComps10059 == nil then
				arg_195_1.var_.actorSpriteComps10059 = var_198_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_9 = 0.034

			if var_198_8 <= arg_195_1.time_ and arg_195_1.time_ < var_198_8 + var_198_9 then
				local var_198_10 = (arg_195_1.time_ - var_198_8) / var_198_9

				if arg_195_1.var_.actorSpriteComps10059 then
					for iter_198_1, iter_198_2 in pairs(arg_195_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_198_2 then
							local var_198_11 = Mathf.Lerp(iter_198_2.color.r, 1, var_198_10)

							iter_198_2.color = Color.New(var_198_11, var_198_11, var_198_11)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_8 + var_198_9 and arg_195_1.time_ < var_198_8 + var_198_9 + arg_198_0 and arg_195_1.var_.actorSpriteComps10059 then
				local var_198_12 = 1

				for iter_198_3, iter_198_4 in pairs(arg_195_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_198_4 then
						iter_198_4.color = Color.New(var_198_12, var_198_12, var_198_12)
					end
				end

				arg_195_1.var_.actorSpriteComps10059 = nil
			end

			local var_198_13 = arg_195_1.actors_["10062"]
			local var_198_14 = 0

			if var_198_14 < arg_195_1.time_ and arg_195_1.time_ <= var_198_14 + arg_198_0 and arg_195_1.var_.actorSpriteComps10062 == nil then
				arg_195_1.var_.actorSpriteComps10062 = var_198_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_198_15 = 0.034

			if var_198_14 <= arg_195_1.time_ and arg_195_1.time_ < var_198_14 + var_198_15 then
				local var_198_16 = (arg_195_1.time_ - var_198_14) / var_198_15

				if arg_195_1.var_.actorSpriteComps10062 then
					for iter_198_5, iter_198_6 in pairs(arg_195_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_198_6 then
							local var_198_17 = Mathf.Lerp(iter_198_6.color.r, 0.5, var_198_16)

							iter_198_6.color = Color.New(var_198_17, var_198_17, var_198_17)
						end
					end
				end
			end

			if arg_195_1.time_ >= var_198_14 + var_198_15 and arg_195_1.time_ < var_198_14 + var_198_15 + arg_198_0 and arg_195_1.var_.actorSpriteComps10062 then
				local var_198_18 = 0.5

				for iter_198_7, iter_198_8 in pairs(arg_195_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_198_8 then
						iter_198_8.color = Color.New(var_198_18, var_198_18, var_198_18)
					end
				end

				arg_195_1.var_.actorSpriteComps10062 = nil
			end

			local var_198_19 = 0
			local var_198_20 = 0.375

			if var_198_19 < arg_195_1.time_ and arg_195_1.time_ <= var_198_19 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_21 = arg_195_1:FormatText(StoryNameCfg[596].name)

				arg_195_1.leftNameTxt_.text = var_198_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_22 = arg_195_1:GetWordFromCfg(410161048)
				local var_198_23 = arg_195_1:FormatText(var_198_22.content)

				arg_195_1.text_.text = var_198_23

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_24 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161048", "story_v_out_410161.awb") ~= 0 then
					local var_198_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161048", "story_v_out_410161.awb") / 1000

					if var_198_27 + var_198_19 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_27 + var_198_19
					end

					if var_198_22.prefab_name ~= "" and arg_195_1.actors_[var_198_22.prefab_name] ~= nil then
						local var_198_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_22.prefab_name].transform, "story_v_out_410161", "410161048", "story_v_out_410161.awb")

						arg_195_1:RecordAudio("410161048", var_198_28)
						arg_195_1:RecordAudio("410161048", var_198_28)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_410161", "410161048", "story_v_out_410161.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_410161", "410161048", "story_v_out_410161.awb")
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
	Play410161049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 410161049
		arg_199_1.duration_ = 5

		SetActive(arg_199_1.tipsGo_, false)

		function arg_199_1.onSingleLineFinish_()
			arg_199_1.onSingleLineUpdate_ = nil
			arg_199_1.onSingleLineFinish_ = nil
			arg_199_1.state_ = "waiting"
		end

		function arg_199_1.playNext_(arg_201_0)
			if arg_201_0 == 1 then
				arg_199_0:Play410161050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10062"].transform
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1.var_.moveOldPos10062 = var_202_0.localPosition
				var_202_0.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10062", 3)

				local var_202_2 = var_202_0.childCount

				for iter_202_0 = 0, var_202_2 - 1 do
					local var_202_3 = var_202_0:GetChild(iter_202_0)

					if var_202_3.name == "" or not string.find(var_202_3.name, "split") then
						var_202_3.gameObject:SetActive(true)
					else
						var_202_3.gameObject:SetActive(false)
					end
				end
			end

			local var_202_4 = 0.001

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_4 then
				local var_202_5 = (arg_199_1.time_ - var_202_1) / var_202_4
				local var_202_6 = Vector3.New(0, -390, -290)

				var_202_0.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10062, var_202_6, var_202_5)
			end

			if arg_199_1.time_ >= var_202_1 + var_202_4 and arg_199_1.time_ < var_202_1 + var_202_4 + arg_202_0 then
				var_202_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_202_7 = arg_199_1.actors_["10059"].transform
			local var_202_8 = 0

			if var_202_8 < arg_199_1.time_ and arg_199_1.time_ <= var_202_8 + arg_202_0 then
				arg_199_1.var_.moveOldPos10059 = var_202_7.localPosition
				var_202_7.localScale = Vector3.New(1, 1, 1)

				arg_199_1:CheckSpriteTmpPos("10059", 7)

				local var_202_9 = var_202_7.childCount

				for iter_202_1 = 0, var_202_9 - 1 do
					local var_202_10 = var_202_7:GetChild(iter_202_1)

					if var_202_10.name == "" or not string.find(var_202_10.name, "split") then
						var_202_10.gameObject:SetActive(true)
					else
						var_202_10.gameObject:SetActive(false)
					end
				end
			end

			local var_202_11 = 0.001

			if var_202_8 <= arg_199_1.time_ and arg_199_1.time_ < var_202_8 + var_202_11 then
				local var_202_12 = (arg_199_1.time_ - var_202_8) / var_202_11
				local var_202_13 = Vector3.New(0, -2000, 35)

				var_202_7.localPosition = Vector3.Lerp(arg_199_1.var_.moveOldPos10059, var_202_13, var_202_12)
			end

			if arg_199_1.time_ >= var_202_8 + var_202_11 and arg_199_1.time_ < var_202_8 + var_202_11 + arg_202_0 then
				var_202_7.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_202_14 = arg_199_1.actors_["10062"]
			local var_202_15 = 0

			if var_202_15 < arg_199_1.time_ and arg_199_1.time_ <= var_202_15 + arg_202_0 and arg_199_1.var_.actorSpriteComps10062 == nil then
				arg_199_1.var_.actorSpriteComps10062 = var_202_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_16 = 0.034

			if var_202_15 <= arg_199_1.time_ and arg_199_1.time_ < var_202_15 + var_202_16 then
				local var_202_17 = (arg_199_1.time_ - var_202_15) / var_202_16

				if arg_199_1.var_.actorSpriteComps10062 then
					for iter_202_2, iter_202_3 in pairs(arg_199_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_202_3 then
							local var_202_18 = Mathf.Lerp(iter_202_3.color.r, 0.5, var_202_17)

							iter_202_3.color = Color.New(var_202_18, var_202_18, var_202_18)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_15 + var_202_16 and arg_199_1.time_ < var_202_15 + var_202_16 + arg_202_0 and arg_199_1.var_.actorSpriteComps10062 then
				local var_202_19 = 0.5

				for iter_202_4, iter_202_5 in pairs(arg_199_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_202_5 then
						iter_202_5.color = Color.New(var_202_19, var_202_19, var_202_19)
					end
				end

				arg_199_1.var_.actorSpriteComps10062 = nil
			end

			local var_202_20 = arg_199_1.actors_["10059"]
			local var_202_21 = 0

			if var_202_21 < arg_199_1.time_ and arg_199_1.time_ <= var_202_21 + arg_202_0 and arg_199_1.var_.actorSpriteComps10059 == nil then
				arg_199_1.var_.actorSpriteComps10059 = var_202_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_202_22 = 0.034

			if var_202_21 <= arg_199_1.time_ and arg_199_1.time_ < var_202_21 + var_202_22 then
				local var_202_23 = (arg_199_1.time_ - var_202_21) / var_202_22

				if arg_199_1.var_.actorSpriteComps10059 then
					for iter_202_6, iter_202_7 in pairs(arg_199_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_202_7 then
							local var_202_24 = Mathf.Lerp(iter_202_7.color.r, 0.5, var_202_23)

							iter_202_7.color = Color.New(var_202_24, var_202_24, var_202_24)
						end
					end
				end
			end

			if arg_199_1.time_ >= var_202_21 + var_202_22 and arg_199_1.time_ < var_202_21 + var_202_22 + arg_202_0 and arg_199_1.var_.actorSpriteComps10059 then
				local var_202_25 = 0.5

				for iter_202_8, iter_202_9 in pairs(arg_199_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_202_9 then
						iter_202_9.color = Color.New(var_202_25, var_202_25, var_202_25)
					end
				end

				arg_199_1.var_.actorSpriteComps10059 = nil
			end

			local var_202_26 = 0
			local var_202_27 = 0.8

			if var_202_26 < arg_199_1.time_ and arg_199_1.time_ <= var_202_26 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, false)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_28 = arg_199_1:GetWordFromCfg(410161049)
				local var_202_29 = arg_199_1:FormatText(var_202_28.content)

				arg_199_1.text_.text = var_202_29

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_30 = 32
				local var_202_31 = utf8.len(var_202_29)
				local var_202_32 = var_202_30 <= 0 and var_202_27 or var_202_27 * (var_202_31 / var_202_30)

				if var_202_32 > 0 and var_202_27 < var_202_32 then
					arg_199_1.talkMaxDuration = var_202_32

					if var_202_32 + var_202_26 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_32 + var_202_26
					end
				end

				arg_199_1.text_.text = var_202_29
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)
				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_33 = math.max(var_202_27, arg_199_1.talkMaxDuration)

			if var_202_26 <= arg_199_1.time_ and arg_199_1.time_ < var_202_26 + var_202_33 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_26) / var_202_33

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_26 + var_202_33 and arg_199_1.time_ < var_202_26 + var_202_33 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play410161050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 410161050
		arg_203_1.duration_ = 15.333

		local var_203_0 = {
			ja = 14.3,
			CriLanguages = 15.333,
			zh = 15.333
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
				arg_203_0:Play410161051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["10062"].transform
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.var_.moveOldPos10062 = var_206_0.localPosition
				var_206_0.localScale = Vector3.New(1, 1, 1)

				arg_203_1:CheckSpriteTmpPos("10062", 3)

				local var_206_2 = var_206_0.childCount

				for iter_206_0 = 0, var_206_2 - 1 do
					local var_206_3 = var_206_0:GetChild(iter_206_0)

					if var_206_3.name == "split_1_1" or not string.find(var_206_3.name, "split") then
						var_206_3.gameObject:SetActive(true)
					else
						var_206_3.gameObject:SetActive(false)
					end
				end
			end

			local var_206_4 = 0.001

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_4 then
				local var_206_5 = (arg_203_1.time_ - var_206_1) / var_206_4
				local var_206_6 = Vector3.New(0, -390, -290)

				var_206_0.localPosition = Vector3.Lerp(arg_203_1.var_.moveOldPos10062, var_206_6, var_206_5)
			end

			if arg_203_1.time_ >= var_206_1 + var_206_4 and arg_203_1.time_ < var_206_1 + var_206_4 + arg_206_0 then
				var_206_0.localPosition = Vector3.New(0, -390, -290)
			end

			local var_206_7 = arg_203_1.actors_["10062"]
			local var_206_8 = 0

			if var_206_8 < arg_203_1.time_ and arg_203_1.time_ <= var_206_8 + arg_206_0 and arg_203_1.var_.actorSpriteComps10062 == nil then
				arg_203_1.var_.actorSpriteComps10062 = var_206_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_206_9 = 0.034

			if var_206_8 <= arg_203_1.time_ and arg_203_1.time_ < var_206_8 + var_206_9 then
				local var_206_10 = (arg_203_1.time_ - var_206_8) / var_206_9

				if arg_203_1.var_.actorSpriteComps10062 then
					for iter_206_1, iter_206_2 in pairs(arg_203_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_206_2 then
							local var_206_11 = Mathf.Lerp(iter_206_2.color.r, 1, var_206_10)

							iter_206_2.color = Color.New(var_206_11, var_206_11, var_206_11)
						end
					end
				end
			end

			if arg_203_1.time_ >= var_206_8 + var_206_9 and arg_203_1.time_ < var_206_8 + var_206_9 + arg_206_0 and arg_203_1.var_.actorSpriteComps10062 then
				local var_206_12 = 1

				for iter_206_3, iter_206_4 in pairs(arg_203_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_206_4 then
						iter_206_4.color = Color.New(var_206_12, var_206_12, var_206_12)
					end
				end

				arg_203_1.var_.actorSpriteComps10062 = nil
			end

			local var_206_13 = 0
			local var_206_14 = 1.325

			if var_206_13 < arg_203_1.time_ and arg_203_1.time_ <= var_206_13 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_15 = arg_203_1:FormatText(StoryNameCfg[600].name)

				arg_203_1.leftNameTxt_.text = var_206_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_16 = arg_203_1:GetWordFromCfg(410161050)
				local var_206_17 = arg_203_1:FormatText(var_206_16.content)

				arg_203_1.text_.text = var_206_17

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_18 = 53
				local var_206_19 = utf8.len(var_206_17)
				local var_206_20 = var_206_18 <= 0 and var_206_14 or var_206_14 * (var_206_19 / var_206_18)

				if var_206_20 > 0 and var_206_14 < var_206_20 then
					arg_203_1.talkMaxDuration = var_206_20

					if var_206_20 + var_206_13 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_20 + var_206_13
					end
				end

				arg_203_1.text_.text = var_206_17
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161050", "story_v_out_410161.awb") ~= 0 then
					local var_206_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161050", "story_v_out_410161.awb") / 1000

					if var_206_21 + var_206_13 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_21 + var_206_13
					end

					if var_206_16.prefab_name ~= "" and arg_203_1.actors_[var_206_16.prefab_name] ~= nil then
						local var_206_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_16.prefab_name].transform, "story_v_out_410161", "410161050", "story_v_out_410161.awb")

						arg_203_1:RecordAudio("410161050", var_206_22)
						arg_203_1:RecordAudio("410161050", var_206_22)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_410161", "410161050", "story_v_out_410161.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_410161", "410161050", "story_v_out_410161.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_23 = math.max(var_206_14, arg_203_1.talkMaxDuration)

			if var_206_13 <= arg_203_1.time_ and arg_203_1.time_ < var_206_13 + var_206_23 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_13) / var_206_23

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_13 + var_206_23 and arg_203_1.time_ < var_206_13 + var_206_23 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play410161051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 410161051
		arg_207_1.duration_ = 9

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play410161052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = "L04f"

			if arg_207_1.bgs_[var_210_0] == nil then
				local var_210_1 = Object.Instantiate(arg_207_1.paintGo_)

				var_210_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_210_0)
				var_210_1.name = var_210_0
				var_210_1.transform.parent = arg_207_1.stage_.transform
				var_210_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_207_1.bgs_[var_210_0] = var_210_1
			end

			local var_210_2 = 2

			if var_210_2 < arg_207_1.time_ and arg_207_1.time_ <= var_210_2 + arg_210_0 then
				local var_210_3 = manager.ui.mainCamera.transform.localPosition
				local var_210_4 = Vector3.New(0, 0, 10) + Vector3.New(var_210_3.x, var_210_3.y, 0)
				local var_210_5 = arg_207_1.bgs_.L04f

				var_210_5.transform.localPosition = var_210_4
				var_210_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_210_6 = var_210_5:GetComponent("SpriteRenderer")

				if var_210_6 and var_210_6.sprite then
					local var_210_7 = (var_210_5.transform.localPosition - var_210_3).z
					local var_210_8 = manager.ui.mainCameraCom_
					local var_210_9 = 2 * var_210_7 * Mathf.Tan(var_210_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_210_10 = var_210_9 * var_210_8.aspect
					local var_210_11 = var_210_6.sprite.bounds.size.x
					local var_210_12 = var_210_6.sprite.bounds.size.y
					local var_210_13 = var_210_10 / var_210_11
					local var_210_14 = var_210_9 / var_210_12
					local var_210_15 = var_210_14 < var_210_13 and var_210_13 or var_210_14

					var_210_5.transform.localScale = Vector3.New(var_210_15, var_210_15, 0)
				end

				for iter_210_0, iter_210_1 in pairs(arg_207_1.bgs_) do
					if iter_210_0 ~= "L04f" then
						iter_210_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_210_16 = 0

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 then
				arg_207_1.mask_.enabled = true
				arg_207_1.mask_.raycastTarget = true

				arg_207_1:SetGaussion(false)
			end

			local var_210_17 = 2

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_16) / var_210_17
				local var_210_19 = Color.New(0, 0, 0)

				var_210_19.a = Mathf.Lerp(0, 1, var_210_18)
				arg_207_1.mask_.color = var_210_19
			end

			if arg_207_1.time_ >= var_210_16 + var_210_17 and arg_207_1.time_ < var_210_16 + var_210_17 + arg_210_0 then
				local var_210_20 = Color.New(0, 0, 0)

				var_210_20.a = 1
				arg_207_1.mask_.color = var_210_20
			end

			local var_210_21 = 2

			if var_210_21 < arg_207_1.time_ and arg_207_1.time_ <= var_210_21 + arg_210_0 then
				arg_207_1.mask_.enabled = true
				arg_207_1.mask_.raycastTarget = true

				arg_207_1:SetGaussion(false)
			end

			local var_210_22 = 2

			if var_210_21 <= arg_207_1.time_ and arg_207_1.time_ < var_210_21 + var_210_22 then
				local var_210_23 = (arg_207_1.time_ - var_210_21) / var_210_22
				local var_210_24 = Color.New(0, 0, 0)

				var_210_24.a = Mathf.Lerp(1, 0, var_210_23)
				arg_207_1.mask_.color = var_210_24
			end

			if arg_207_1.time_ >= var_210_21 + var_210_22 and arg_207_1.time_ < var_210_21 + var_210_22 + arg_210_0 then
				local var_210_25 = Color.New(0, 0, 0)
				local var_210_26 = 0

				arg_207_1.mask_.enabled = false
				var_210_25.a = var_210_26
				arg_207_1.mask_.color = var_210_25
			end

			local var_210_27 = arg_207_1.actors_["10062"].transform
			local var_210_28 = 2

			if var_210_28 < arg_207_1.time_ and arg_207_1.time_ <= var_210_28 + arg_210_0 then
				arg_207_1.var_.moveOldPos10062 = var_210_27.localPosition
				var_210_27.localScale = Vector3.New(1, 1, 1)

				arg_207_1:CheckSpriteTmpPos("10062", 7)

				local var_210_29 = var_210_27.childCount

				for iter_210_2 = 0, var_210_29 - 1 do
					local var_210_30 = var_210_27:GetChild(iter_210_2)

					if var_210_30.name == "" or not string.find(var_210_30.name, "split") then
						var_210_30.gameObject:SetActive(true)
					else
						var_210_30.gameObject:SetActive(false)
					end
				end
			end

			local var_210_31 = 0.001

			if var_210_28 <= arg_207_1.time_ and arg_207_1.time_ < var_210_28 + var_210_31 then
				local var_210_32 = (arg_207_1.time_ - var_210_28) / var_210_31
				local var_210_33 = Vector3.New(0, -2000, -290)

				var_210_27.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos10062, var_210_33, var_210_32)
			end

			if arg_207_1.time_ >= var_210_28 + var_210_31 and arg_207_1.time_ < var_210_28 + var_210_31 + arg_210_0 then
				var_210_27.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_210_34 = arg_207_1.actors_["10062"]
			local var_210_35 = 2

			if var_210_35 < arg_207_1.time_ and arg_207_1.time_ <= var_210_35 + arg_210_0 and arg_207_1.var_.actorSpriteComps10062 == nil then
				arg_207_1.var_.actorSpriteComps10062 = var_210_34:GetComponentsInChildren(typeof(Image), true)
			end

			local var_210_36 = 0.034

			if var_210_35 <= arg_207_1.time_ and arg_207_1.time_ < var_210_35 + var_210_36 then
				local var_210_37 = (arg_207_1.time_ - var_210_35) / var_210_36

				if arg_207_1.var_.actorSpriteComps10062 then
					for iter_210_3, iter_210_4 in pairs(arg_207_1.var_.actorSpriteComps10062:ToTable()) do
						if iter_210_4 then
							local var_210_38 = Mathf.Lerp(iter_210_4.color.r, 0.5, var_210_37)

							iter_210_4.color = Color.New(var_210_38, var_210_38, var_210_38)
						end
					end
				end
			end

			if arg_207_1.time_ >= var_210_35 + var_210_36 and arg_207_1.time_ < var_210_35 + var_210_36 + arg_210_0 and arg_207_1.var_.actorSpriteComps10062 then
				local var_210_39 = 0.5

				for iter_210_5, iter_210_6 in pairs(arg_207_1.var_.actorSpriteComps10062:ToTable()) do
					if iter_210_6 then
						iter_210_6.color = Color.New(var_210_39, var_210_39, var_210_39)
					end
				end

				arg_207_1.var_.actorSpriteComps10062 = nil
			end

			if arg_207_1.frameCnt_ <= 1 then
				arg_207_1.dialog_:SetActive(false)
			end

			local var_210_40 = 4
			local var_210_41 = 0.825

			if var_210_40 < arg_207_1.time_ and arg_207_1.time_ <= var_210_40 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0

				arg_207_1.dialog_:SetActive(true)

				local var_210_42 = LeanTween.value(arg_207_1.dialog_, 0, 1, 0.3)

				var_210_42:setOnUpdate(LuaHelper.FloatAction(function(arg_211_0)
					arg_207_1.dialogCg_.alpha = arg_211_0
				end))
				var_210_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_207_1.dialog_)
					var_210_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_207_1.duration_ = arg_207_1.duration_ + 0.3

				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_43 = arg_207_1:GetWordFromCfg(410161051)
				local var_210_44 = arg_207_1:FormatText(var_210_43.content)

				arg_207_1.text_.text = var_210_44

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_45 = 33
				local var_210_46 = utf8.len(var_210_44)
				local var_210_47 = var_210_45 <= 0 and var_210_41 or var_210_41 * (var_210_46 / var_210_45)

				if var_210_47 > 0 and var_210_41 < var_210_47 then
					arg_207_1.talkMaxDuration = var_210_47
					var_210_40 = var_210_40 + 0.3

					if var_210_47 + var_210_40 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_47 + var_210_40
					end
				end

				arg_207_1.text_.text = var_210_44
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_48 = var_210_40 + 0.3
			local var_210_49 = math.max(var_210_41, arg_207_1.talkMaxDuration)

			if var_210_48 <= arg_207_1.time_ and arg_207_1.time_ < var_210_48 + var_210_49 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_48) / var_210_49

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_48 + var_210_49 and arg_207_1.time_ < var_210_48 + var_210_49 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play410161052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 410161052
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play410161053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = 0
			local var_216_1 = 1.1

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

				local var_216_2 = arg_213_1:GetWordFromCfg(410161052)
				local var_216_3 = arg_213_1:FormatText(var_216_2.content)

				arg_213_1.text_.text = var_216_3

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_4 = 44
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
	Play410161053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 410161053
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play410161054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = 0
			local var_220_1 = 1.325

			if var_220_0 < arg_217_1.time_ and arg_217_1.time_ <= var_220_0 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, false)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_2 = arg_217_1:GetWordFromCfg(410161053)
				local var_220_3 = arg_217_1:FormatText(var_220_2.content)

				arg_217_1.text_.text = var_220_3

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_4 = 53
				local var_220_5 = utf8.len(var_220_3)
				local var_220_6 = var_220_4 <= 0 and var_220_1 or var_220_1 * (var_220_5 / var_220_4)

				if var_220_6 > 0 and var_220_1 < var_220_6 then
					arg_217_1.talkMaxDuration = var_220_6

					if var_220_6 + var_220_0 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_6 + var_220_0
					end
				end

				arg_217_1.text_.text = var_220_3
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)
				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_7 = math.max(var_220_1, arg_217_1.talkMaxDuration)

			if var_220_0 <= arg_217_1.time_ and arg_217_1.time_ < var_220_0 + var_220_7 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_0) / var_220_7

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_0 + var_220_7 and arg_217_1.time_ < var_220_0 + var_220_7 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play410161054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 410161054
		arg_221_1.duration_ = 2.9

		local var_221_0 = {
			ja = 1.566,
			CriLanguages = 2.9,
			zh = 2.9
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
				arg_221_0:Play410161055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10059"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos10059 = var_224_0.localPosition
				var_224_0.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10059", 4)

				local var_224_2 = var_224_0.childCount

				for iter_224_0 = 0, var_224_2 - 1 do
					local var_224_3 = var_224_0:GetChild(iter_224_0)

					if var_224_3.name == "" or not string.find(var_224_3.name, "split") then
						var_224_3.gameObject:SetActive(true)
					else
						var_224_3.gameObject:SetActive(false)
					end
				end
			end

			local var_224_4 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_4 then
				local var_224_5 = (arg_221_1.time_ - var_224_1) / var_224_4
				local var_224_6 = Vector3.New(390, -530, 35)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10059, var_224_6, var_224_5)
			end

			if arg_221_1.time_ >= var_224_1 + var_224_4 and arg_221_1.time_ < var_224_1 + var_224_4 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_224_7 = arg_221_1.actors_["1061"].transform
			local var_224_8 = 0

			if var_224_8 < arg_221_1.time_ and arg_221_1.time_ <= var_224_8 + arg_224_0 then
				arg_221_1.var_.moveOldPos1061 = var_224_7.localPosition
				var_224_7.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("1061", 2)

				local var_224_9 = var_224_7.childCount

				for iter_224_1 = 0, var_224_9 - 1 do
					local var_224_10 = var_224_7:GetChild(iter_224_1)

					if var_224_10.name == "" or not string.find(var_224_10.name, "split") then
						var_224_10.gameObject:SetActive(true)
					else
						var_224_10.gameObject:SetActive(false)
					end
				end
			end

			local var_224_11 = 0.001

			if var_224_8 <= arg_221_1.time_ and arg_221_1.time_ < var_224_8 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_8) / var_224_11
				local var_224_13 = Vector3.New(-390, -490, 18)

				var_224_7.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1061, var_224_13, var_224_12)
			end

			if arg_221_1.time_ >= var_224_8 + var_224_11 and arg_221_1.time_ < var_224_8 + var_224_11 + arg_224_0 then
				var_224_7.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_224_14 = arg_221_1.actors_["10059"]
			local var_224_15 = 0

			if var_224_15 < arg_221_1.time_ and arg_221_1.time_ <= var_224_15 + arg_224_0 and arg_221_1.var_.actorSpriteComps10059 == nil then
				arg_221_1.var_.actorSpriteComps10059 = var_224_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_16 = 0.034

			if var_224_15 <= arg_221_1.time_ and arg_221_1.time_ < var_224_15 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_15) / var_224_16

				if arg_221_1.var_.actorSpriteComps10059 then
					for iter_224_2, iter_224_3 in pairs(arg_221_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_224_3 then
							local var_224_18 = Mathf.Lerp(iter_224_3.color.r, 1, var_224_17)

							iter_224_3.color = Color.New(var_224_18, var_224_18, var_224_18)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_15 + var_224_16 and arg_221_1.time_ < var_224_15 + var_224_16 + arg_224_0 and arg_221_1.var_.actorSpriteComps10059 then
				local var_224_19 = 1

				for iter_224_4, iter_224_5 in pairs(arg_221_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_224_5 then
						iter_224_5.color = Color.New(var_224_19, var_224_19, var_224_19)
					end
				end

				arg_221_1.var_.actorSpriteComps10059 = nil
			end

			local var_224_20 = arg_221_1.actors_["1061"]
			local var_224_21 = 0

			if var_224_21 < arg_221_1.time_ and arg_221_1.time_ <= var_224_21 + arg_224_0 and arg_221_1.var_.actorSpriteComps1061 == nil then
				arg_221_1.var_.actorSpriteComps1061 = var_224_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_22 = 0.034

			if var_224_21 <= arg_221_1.time_ and arg_221_1.time_ < var_224_21 + var_224_22 then
				local var_224_23 = (arg_221_1.time_ - var_224_21) / var_224_22

				if arg_221_1.var_.actorSpriteComps1061 then
					for iter_224_6, iter_224_7 in pairs(arg_221_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_224_7 then
							local var_224_24 = Mathf.Lerp(iter_224_7.color.r, 0.5, var_224_23)

							iter_224_7.color = Color.New(var_224_24, var_224_24, var_224_24)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_21 + var_224_22 and arg_221_1.time_ < var_224_21 + var_224_22 + arg_224_0 and arg_221_1.var_.actorSpriteComps1061 then
				local var_224_25 = 0.5

				for iter_224_8, iter_224_9 in pairs(arg_221_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_224_9 then
						iter_224_9.color = Color.New(var_224_25, var_224_25, var_224_25)
					end
				end

				arg_221_1.var_.actorSpriteComps1061 = nil
			end

			local var_224_26 = 0
			local var_224_27 = 0.325

			if var_224_26 < arg_221_1.time_ and arg_221_1.time_ <= var_224_26 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_28 = arg_221_1:FormatText(StoryNameCfg[596].name)

				arg_221_1.leftNameTxt_.text = var_224_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_29 = arg_221_1:GetWordFromCfg(410161054)
				local var_224_30 = arg_221_1:FormatText(var_224_29.content)

				arg_221_1.text_.text = var_224_30

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_31 = 13
				local var_224_32 = utf8.len(var_224_30)
				local var_224_33 = var_224_31 <= 0 and var_224_27 or var_224_27 * (var_224_32 / var_224_31)

				if var_224_33 > 0 and var_224_27 < var_224_33 then
					arg_221_1.talkMaxDuration = var_224_33

					if var_224_33 + var_224_26 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_33 + var_224_26
					end
				end

				arg_221_1.text_.text = var_224_30
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161054", "story_v_out_410161.awb") ~= 0 then
					local var_224_34 = manager.audio:GetVoiceLength("story_v_out_410161", "410161054", "story_v_out_410161.awb") / 1000

					if var_224_34 + var_224_26 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_34 + var_224_26
					end

					if var_224_29.prefab_name ~= "" and arg_221_1.actors_[var_224_29.prefab_name] ~= nil then
						local var_224_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_29.prefab_name].transform, "story_v_out_410161", "410161054", "story_v_out_410161.awb")

						arg_221_1:RecordAudio("410161054", var_224_35)
						arg_221_1:RecordAudio("410161054", var_224_35)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_410161", "410161054", "story_v_out_410161.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_410161", "410161054", "story_v_out_410161.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_36 = math.max(var_224_27, arg_221_1.talkMaxDuration)

			if var_224_26 <= arg_221_1.time_ and arg_221_1.time_ < var_224_26 + var_224_36 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_26) / var_224_36

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_26 + var_224_36 and arg_221_1.time_ < var_224_26 + var_224_36 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play410161055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 410161055
		arg_225_1.duration_ = 9.966

		local var_225_0 = {
			ja = 9.966,
			CriLanguages = 6.033,
			zh = 6.033
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
				arg_225_0:Play410161056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1061"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1061 = var_228_0.localPosition
				var_228_0.localScale = Vector3.New(1, 1, 1)

				arg_225_1:CheckSpriteTmpPos("1061", 2)

				local var_228_2 = var_228_0.childCount

				for iter_228_0 = 0, var_228_2 - 1 do
					local var_228_3 = var_228_0:GetChild(iter_228_0)

					if var_228_3.name == "split_5" or not string.find(var_228_3.name, "split") then
						var_228_3.gameObject:SetActive(true)
					else
						var_228_3.gameObject:SetActive(false)
					end
				end
			end

			local var_228_4 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_4 then
				local var_228_5 = (arg_225_1.time_ - var_228_1) / var_228_4
				local var_228_6 = Vector3.New(-390, -490, 18)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1061, var_228_6, var_228_5)
			end

			if arg_225_1.time_ >= var_228_1 + var_228_4 and arg_225_1.time_ < var_228_1 + var_228_4 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_228_7 = arg_225_1.actors_["1061"]
			local var_228_8 = 0

			if var_228_8 < arg_225_1.time_ and arg_225_1.time_ <= var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps1061 == nil then
				arg_225_1.var_.actorSpriteComps1061 = var_228_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_9 = 0.034

			if var_228_8 <= arg_225_1.time_ and arg_225_1.time_ < var_228_8 + var_228_9 then
				local var_228_10 = (arg_225_1.time_ - var_228_8) / var_228_9

				if arg_225_1.var_.actorSpriteComps1061 then
					for iter_228_1, iter_228_2 in pairs(arg_225_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_228_2 then
							local var_228_11 = Mathf.Lerp(iter_228_2.color.r, 1, var_228_10)

							iter_228_2.color = Color.New(var_228_11, var_228_11, var_228_11)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_8 + var_228_9 and arg_225_1.time_ < var_228_8 + var_228_9 + arg_228_0 and arg_225_1.var_.actorSpriteComps1061 then
				local var_228_12 = 1

				for iter_228_3, iter_228_4 in pairs(arg_225_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_228_4 then
						iter_228_4.color = Color.New(var_228_12, var_228_12, var_228_12)
					end
				end

				arg_225_1.var_.actorSpriteComps1061 = nil
			end

			local var_228_13 = arg_225_1.actors_["10059"]
			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 and arg_225_1.var_.actorSpriteComps10059 == nil then
				arg_225_1.var_.actorSpriteComps10059 = var_228_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_15 = 0.034

			if var_228_14 <= arg_225_1.time_ and arg_225_1.time_ < var_228_14 + var_228_15 then
				local var_228_16 = (arg_225_1.time_ - var_228_14) / var_228_15

				if arg_225_1.var_.actorSpriteComps10059 then
					for iter_228_5, iter_228_6 in pairs(arg_225_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_228_6 then
							local var_228_17 = Mathf.Lerp(iter_228_6.color.r, 0.5, var_228_16)

							iter_228_6.color = Color.New(var_228_17, var_228_17, var_228_17)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_14 + var_228_15 and arg_225_1.time_ < var_228_14 + var_228_15 + arg_228_0 and arg_225_1.var_.actorSpriteComps10059 then
				local var_228_18 = 0.5

				for iter_228_7, iter_228_8 in pairs(arg_225_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_228_8 then
						iter_228_8.color = Color.New(var_228_18, var_228_18, var_228_18)
					end
				end

				arg_225_1.var_.actorSpriteComps10059 = nil
			end

			local var_228_19 = 0
			local var_228_20 = 0.55

			if var_228_19 < arg_225_1.time_ and arg_225_1.time_ <= var_228_19 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_21 = arg_225_1:FormatText(StoryNameCfg[612].name)

				arg_225_1.leftNameTxt_.text = var_228_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_22 = arg_225_1:GetWordFromCfg(410161055)
				local var_228_23 = arg_225_1:FormatText(var_228_22.content)

				arg_225_1.text_.text = var_228_23

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_24 = 22
				local var_228_25 = utf8.len(var_228_23)
				local var_228_26 = var_228_24 <= 0 and var_228_20 or var_228_20 * (var_228_25 / var_228_24)

				if var_228_26 > 0 and var_228_20 < var_228_26 then
					arg_225_1.talkMaxDuration = var_228_26

					if var_228_26 + var_228_19 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_26 + var_228_19
					end
				end

				arg_225_1.text_.text = var_228_23
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161055", "story_v_out_410161.awb") ~= 0 then
					local var_228_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161055", "story_v_out_410161.awb") / 1000

					if var_228_27 + var_228_19 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_27 + var_228_19
					end

					if var_228_22.prefab_name ~= "" and arg_225_1.actors_[var_228_22.prefab_name] ~= nil then
						local var_228_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_22.prefab_name].transform, "story_v_out_410161", "410161055", "story_v_out_410161.awb")

						arg_225_1:RecordAudio("410161055", var_228_28)
						arg_225_1:RecordAudio("410161055", var_228_28)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_410161", "410161055", "story_v_out_410161.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_410161", "410161055", "story_v_out_410161.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_29 = math.max(var_228_20, arg_225_1.talkMaxDuration)

			if var_228_19 <= arg_225_1.time_ and arg_225_1.time_ < var_228_19 + var_228_29 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_19) / var_228_29

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_19 + var_228_29 and arg_225_1.time_ < var_228_19 + var_228_29 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play410161056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 410161056
		arg_229_1.duration_ = 7.8

		local var_229_0 = {
			ja = 7.8,
			CriLanguages = 7.233,
			zh = 7.233
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
				arg_229_0:Play410161057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10059"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos10059 = var_232_0.localPosition
				var_232_0.localScale = Vector3.New(1, 1, 1)

				arg_229_1:CheckSpriteTmpPos("10059", 4)

				local var_232_2 = var_232_0.childCount

				for iter_232_0 = 0, var_232_2 - 1 do
					local var_232_3 = var_232_0:GetChild(iter_232_0)

					if var_232_3.name == "" or not string.find(var_232_3.name, "split") then
						var_232_3.gameObject:SetActive(true)
					else
						var_232_3.gameObject:SetActive(false)
					end
				end
			end

			local var_232_4 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_4 then
				local var_232_5 = (arg_229_1.time_ - var_232_1) / var_232_4
				local var_232_6 = Vector3.New(390, -530, 35)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10059, var_232_6, var_232_5)
			end

			if arg_229_1.time_ >= var_232_1 + var_232_4 and arg_229_1.time_ < var_232_1 + var_232_4 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_232_7 = arg_229_1.actors_["10059"]
			local var_232_8 = 0

			if var_232_8 < arg_229_1.time_ and arg_229_1.time_ <= var_232_8 + arg_232_0 and arg_229_1.var_.actorSpriteComps10059 == nil then
				arg_229_1.var_.actorSpriteComps10059 = var_232_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_9 = 0.034

			if var_232_8 <= arg_229_1.time_ and arg_229_1.time_ < var_232_8 + var_232_9 then
				local var_232_10 = (arg_229_1.time_ - var_232_8) / var_232_9

				if arg_229_1.var_.actorSpriteComps10059 then
					for iter_232_1, iter_232_2 in pairs(arg_229_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_232_2 then
							local var_232_11 = Mathf.Lerp(iter_232_2.color.r, 1, var_232_10)

							iter_232_2.color = Color.New(var_232_11, var_232_11, var_232_11)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_8 + var_232_9 and arg_229_1.time_ < var_232_8 + var_232_9 + arg_232_0 and arg_229_1.var_.actorSpriteComps10059 then
				local var_232_12 = 1

				for iter_232_3, iter_232_4 in pairs(arg_229_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_232_4 then
						iter_232_4.color = Color.New(var_232_12, var_232_12, var_232_12)
					end
				end

				arg_229_1.var_.actorSpriteComps10059 = nil
			end

			local var_232_13 = arg_229_1.actors_["1061"]
			local var_232_14 = 0

			if var_232_14 < arg_229_1.time_ and arg_229_1.time_ <= var_232_14 + arg_232_0 and arg_229_1.var_.actorSpriteComps1061 == nil then
				arg_229_1.var_.actorSpriteComps1061 = var_232_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_15 = 0.034

			if var_232_14 <= arg_229_1.time_ and arg_229_1.time_ < var_232_14 + var_232_15 then
				local var_232_16 = (arg_229_1.time_ - var_232_14) / var_232_15

				if arg_229_1.var_.actorSpriteComps1061 then
					for iter_232_5, iter_232_6 in pairs(arg_229_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_232_6 then
							local var_232_17 = Mathf.Lerp(iter_232_6.color.r, 0.5, var_232_16)

							iter_232_6.color = Color.New(var_232_17, var_232_17, var_232_17)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_14 + var_232_15 and arg_229_1.time_ < var_232_14 + var_232_15 + arg_232_0 and arg_229_1.var_.actorSpriteComps1061 then
				local var_232_18 = 0.5

				for iter_232_7, iter_232_8 in pairs(arg_229_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_232_8 then
						iter_232_8.color = Color.New(var_232_18, var_232_18, var_232_18)
					end
				end

				arg_229_1.var_.actorSpriteComps1061 = nil
			end

			local var_232_19 = 0
			local var_232_20 = 0.775

			if var_232_19 < arg_229_1.time_ and arg_229_1.time_ <= var_232_19 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_21 = arg_229_1:FormatText(StoryNameCfg[596].name)

				arg_229_1.leftNameTxt_.text = var_232_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_22 = arg_229_1:GetWordFromCfg(410161056)
				local var_232_23 = arg_229_1:FormatText(var_232_22.content)

				arg_229_1.text_.text = var_232_23

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_24 = 31
				local var_232_25 = utf8.len(var_232_23)
				local var_232_26 = var_232_24 <= 0 and var_232_20 or var_232_20 * (var_232_25 / var_232_24)

				if var_232_26 > 0 and var_232_20 < var_232_26 then
					arg_229_1.talkMaxDuration = var_232_26

					if var_232_26 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_26 + var_232_19
					end
				end

				arg_229_1.text_.text = var_232_23
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161056", "story_v_out_410161.awb") ~= 0 then
					local var_232_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161056", "story_v_out_410161.awb") / 1000

					if var_232_27 + var_232_19 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_27 + var_232_19
					end

					if var_232_22.prefab_name ~= "" and arg_229_1.actors_[var_232_22.prefab_name] ~= nil then
						local var_232_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_22.prefab_name].transform, "story_v_out_410161", "410161056", "story_v_out_410161.awb")

						arg_229_1:RecordAudio("410161056", var_232_28)
						arg_229_1:RecordAudio("410161056", var_232_28)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_410161", "410161056", "story_v_out_410161.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_410161", "410161056", "story_v_out_410161.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_29 = math.max(var_232_20, arg_229_1.talkMaxDuration)

			if var_232_19 <= arg_229_1.time_ and arg_229_1.time_ < var_232_19 + var_232_29 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_19) / var_232_29

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_19 + var_232_29 and arg_229_1.time_ < var_232_19 + var_232_29 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play410161057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 410161057
		arg_233_1.duration_ = 8.8

		local var_233_0 = {
			ja = 7.4,
			CriLanguages = 8.8,
			zh = 8.8
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
				arg_233_0:Play410161058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10059"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos10059 = var_236_0.localPosition
				var_236_0.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("10059", 4)

				local var_236_2 = var_236_0.childCount

				for iter_236_0 = 0, var_236_2 - 1 do
					local var_236_3 = var_236_0:GetChild(iter_236_0)

					if var_236_3.name == "" or not string.find(var_236_3.name, "split") then
						var_236_3.gameObject:SetActive(true)
					else
						var_236_3.gameObject:SetActive(false)
					end
				end
			end

			local var_236_4 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_4 then
				local var_236_5 = (arg_233_1.time_ - var_236_1) / var_236_4
				local var_236_6 = Vector3.New(390, -530, 35)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10059, var_236_6, var_236_5)
			end

			if arg_233_1.time_ >= var_236_1 + var_236_4 and arg_233_1.time_ < var_236_1 + var_236_4 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_236_7 = arg_233_1.actors_["10059"]
			local var_236_8 = 0

			if var_236_8 < arg_233_1.time_ and arg_233_1.time_ <= var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps10059 == nil then
				arg_233_1.var_.actorSpriteComps10059 = var_236_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_9 = 0.034

			if var_236_8 <= arg_233_1.time_ and arg_233_1.time_ < var_236_8 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_8) / var_236_9

				if arg_233_1.var_.actorSpriteComps10059 then
					for iter_236_1, iter_236_2 in pairs(arg_233_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_236_2 then
							local var_236_11 = Mathf.Lerp(iter_236_2.color.r, 1, var_236_10)

							iter_236_2.color = Color.New(var_236_11, var_236_11, var_236_11)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_8 + var_236_9 and arg_233_1.time_ < var_236_8 + var_236_9 + arg_236_0 and arg_233_1.var_.actorSpriteComps10059 then
				local var_236_12 = 1

				for iter_236_3, iter_236_4 in pairs(arg_233_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_236_4 then
						iter_236_4.color = Color.New(var_236_12, var_236_12, var_236_12)
					end
				end

				arg_233_1.var_.actorSpriteComps10059 = nil
			end

			local var_236_13 = 0
			local var_236_14 = 0.95

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_15 = arg_233_1:FormatText(StoryNameCfg[596].name)

				arg_233_1.leftNameTxt_.text = var_236_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_16 = arg_233_1:GetWordFromCfg(410161057)
				local var_236_17 = arg_233_1:FormatText(var_236_16.content)

				arg_233_1.text_.text = var_236_17

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_18 = 38
				local var_236_19 = utf8.len(var_236_17)
				local var_236_20 = var_236_18 <= 0 and var_236_14 or var_236_14 * (var_236_19 / var_236_18)

				if var_236_20 > 0 and var_236_14 < var_236_20 then
					arg_233_1.talkMaxDuration = var_236_20

					if var_236_20 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_20 + var_236_13
					end
				end

				arg_233_1.text_.text = var_236_17
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161057", "story_v_out_410161.awb") ~= 0 then
					local var_236_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161057", "story_v_out_410161.awb") / 1000

					if var_236_21 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_13
					end

					if var_236_16.prefab_name ~= "" and arg_233_1.actors_[var_236_16.prefab_name] ~= nil then
						local var_236_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_16.prefab_name].transform, "story_v_out_410161", "410161057", "story_v_out_410161.awb")

						arg_233_1:RecordAudio("410161057", var_236_22)
						arg_233_1:RecordAudio("410161057", var_236_22)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_410161", "410161057", "story_v_out_410161.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_410161", "410161057", "story_v_out_410161.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_23 = math.max(var_236_14, arg_233_1.talkMaxDuration)

			if var_236_13 <= arg_233_1.time_ and arg_233_1.time_ < var_236_13 + var_236_23 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_13) / var_236_23

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_13 + var_236_23 and arg_233_1.time_ < var_236_13 + var_236_23 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play410161058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 410161058
		arg_237_1.duration_ = 5.333

		local var_237_0 = {
			ja = 5.333,
			CriLanguages = 2.5,
			zh = 2.5
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
				arg_237_0:Play410161059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["1061"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos1061 = var_240_0.localPosition
				var_240_0.localScale = Vector3.New(1, 1, 1)

				arg_237_1:CheckSpriteTmpPos("1061", 2)

				local var_240_2 = var_240_0.childCount

				for iter_240_0 = 0, var_240_2 - 1 do
					local var_240_3 = var_240_0:GetChild(iter_240_0)

					if var_240_3.name == "split_5" or not string.find(var_240_3.name, "split") then
						var_240_3.gameObject:SetActive(true)
					else
						var_240_3.gameObject:SetActive(false)
					end
				end
			end

			local var_240_4 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_4 then
				local var_240_5 = (arg_237_1.time_ - var_240_1) / var_240_4
				local var_240_6 = Vector3.New(-390, -490, 18)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1061, var_240_6, var_240_5)
			end

			if arg_237_1.time_ >= var_240_1 + var_240_4 and arg_237_1.time_ < var_240_1 + var_240_4 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_240_7 = arg_237_1.actors_["1061"]
			local var_240_8 = 0

			if var_240_8 < arg_237_1.time_ and arg_237_1.time_ <= var_240_8 + arg_240_0 and arg_237_1.var_.actorSpriteComps1061 == nil then
				arg_237_1.var_.actorSpriteComps1061 = var_240_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_9 = 0.034

			if var_240_8 <= arg_237_1.time_ and arg_237_1.time_ < var_240_8 + var_240_9 then
				local var_240_10 = (arg_237_1.time_ - var_240_8) / var_240_9

				if arg_237_1.var_.actorSpriteComps1061 then
					for iter_240_1, iter_240_2 in pairs(arg_237_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_240_2 then
							local var_240_11 = Mathf.Lerp(iter_240_2.color.r, 1, var_240_10)

							iter_240_2.color = Color.New(var_240_11, var_240_11, var_240_11)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_8 + var_240_9 and arg_237_1.time_ < var_240_8 + var_240_9 + arg_240_0 and arg_237_1.var_.actorSpriteComps1061 then
				local var_240_12 = 1

				for iter_240_3, iter_240_4 in pairs(arg_237_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_240_4 then
						iter_240_4.color = Color.New(var_240_12, var_240_12, var_240_12)
					end
				end

				arg_237_1.var_.actorSpriteComps1061 = nil
			end

			local var_240_13 = arg_237_1.actors_["10059"]
			local var_240_14 = 0

			if var_240_14 < arg_237_1.time_ and arg_237_1.time_ <= var_240_14 + arg_240_0 and arg_237_1.var_.actorSpriteComps10059 == nil then
				arg_237_1.var_.actorSpriteComps10059 = var_240_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_15 = 0.034

			if var_240_14 <= arg_237_1.time_ and arg_237_1.time_ < var_240_14 + var_240_15 then
				local var_240_16 = (arg_237_1.time_ - var_240_14) / var_240_15

				if arg_237_1.var_.actorSpriteComps10059 then
					for iter_240_5, iter_240_6 in pairs(arg_237_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_240_6 then
							local var_240_17 = Mathf.Lerp(iter_240_6.color.r, 0.5, var_240_16)

							iter_240_6.color = Color.New(var_240_17, var_240_17, var_240_17)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_14 + var_240_15 and arg_237_1.time_ < var_240_14 + var_240_15 + arg_240_0 and arg_237_1.var_.actorSpriteComps10059 then
				local var_240_18 = 0.5

				for iter_240_7, iter_240_8 in pairs(arg_237_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_240_8 then
						iter_240_8.color = Color.New(var_240_18, var_240_18, var_240_18)
					end
				end

				arg_237_1.var_.actorSpriteComps10059 = nil
			end

			local var_240_19 = 0
			local var_240_20 = 0.3

			if var_240_19 < arg_237_1.time_ and arg_237_1.time_ <= var_240_19 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_21 = arg_237_1:FormatText(StoryNameCfg[612].name)

				arg_237_1.leftNameTxt_.text = var_240_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_22 = arg_237_1:GetWordFromCfg(410161058)
				local var_240_23 = arg_237_1:FormatText(var_240_22.content)

				arg_237_1.text_.text = var_240_23

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_24 = 12
				local var_240_25 = utf8.len(var_240_23)
				local var_240_26 = var_240_24 <= 0 and var_240_20 or var_240_20 * (var_240_25 / var_240_24)

				if var_240_26 > 0 and var_240_20 < var_240_26 then
					arg_237_1.talkMaxDuration = var_240_26

					if var_240_26 + var_240_19 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_26 + var_240_19
					end
				end

				arg_237_1.text_.text = var_240_23
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161058", "story_v_out_410161.awb") ~= 0 then
					local var_240_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161058", "story_v_out_410161.awb") / 1000

					if var_240_27 + var_240_19 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_27 + var_240_19
					end

					if var_240_22.prefab_name ~= "" and arg_237_1.actors_[var_240_22.prefab_name] ~= nil then
						local var_240_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_22.prefab_name].transform, "story_v_out_410161", "410161058", "story_v_out_410161.awb")

						arg_237_1:RecordAudio("410161058", var_240_28)
						arg_237_1:RecordAudio("410161058", var_240_28)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_410161", "410161058", "story_v_out_410161.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_410161", "410161058", "story_v_out_410161.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_29 = math.max(var_240_20, arg_237_1.talkMaxDuration)

			if var_240_19 <= arg_237_1.time_ and arg_237_1.time_ < var_240_19 + var_240_29 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_19) / var_240_29

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_19 + var_240_29 and arg_237_1.time_ < var_240_19 + var_240_29 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play410161059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 410161059
		arg_241_1.duration_ = 2.966

		local var_241_0 = {
			ja = 2.933,
			CriLanguages = 2.966,
			zh = 2.966
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
				arg_241_0:Play410161060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10059"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos10059 = var_244_0.localPosition
				var_244_0.localScale = Vector3.New(1, 1, 1)

				arg_241_1:CheckSpriteTmpPos("10059", 4)

				local var_244_2 = var_244_0.childCount

				for iter_244_0 = 0, var_244_2 - 1 do
					local var_244_3 = var_244_0:GetChild(iter_244_0)

					if var_244_3.name == "" or not string.find(var_244_3.name, "split") then
						var_244_3.gameObject:SetActive(true)
					else
						var_244_3.gameObject:SetActive(false)
					end
				end
			end

			local var_244_4 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_4 then
				local var_244_5 = (arg_241_1.time_ - var_244_1) / var_244_4
				local var_244_6 = Vector3.New(390, -530, 35)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos10059, var_244_6, var_244_5)
			end

			if arg_241_1.time_ >= var_244_1 + var_244_4 and arg_241_1.time_ < var_244_1 + var_244_4 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_244_7 = arg_241_1.actors_["10059"]
			local var_244_8 = 0

			if var_244_8 < arg_241_1.time_ and arg_241_1.time_ <= var_244_8 + arg_244_0 and arg_241_1.var_.actorSpriteComps10059 == nil then
				arg_241_1.var_.actorSpriteComps10059 = var_244_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_9 = 0.034

			if var_244_8 <= arg_241_1.time_ and arg_241_1.time_ < var_244_8 + var_244_9 then
				local var_244_10 = (arg_241_1.time_ - var_244_8) / var_244_9

				if arg_241_1.var_.actorSpriteComps10059 then
					for iter_244_1, iter_244_2 in pairs(arg_241_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_244_2 then
							local var_244_11 = Mathf.Lerp(iter_244_2.color.r, 1, var_244_10)

							iter_244_2.color = Color.New(var_244_11, var_244_11, var_244_11)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_8 + var_244_9 and arg_241_1.time_ < var_244_8 + var_244_9 + arg_244_0 and arg_241_1.var_.actorSpriteComps10059 then
				local var_244_12 = 1

				for iter_244_3, iter_244_4 in pairs(arg_241_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_244_4 then
						iter_244_4.color = Color.New(var_244_12, var_244_12, var_244_12)
					end
				end

				arg_241_1.var_.actorSpriteComps10059 = nil
			end

			local var_244_13 = arg_241_1.actors_["1061"]
			local var_244_14 = 0

			if var_244_14 < arg_241_1.time_ and arg_241_1.time_ <= var_244_14 + arg_244_0 and arg_241_1.var_.actorSpriteComps1061 == nil then
				arg_241_1.var_.actorSpriteComps1061 = var_244_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_15 = 0.034

			if var_244_14 <= arg_241_1.time_ and arg_241_1.time_ < var_244_14 + var_244_15 then
				local var_244_16 = (arg_241_1.time_ - var_244_14) / var_244_15

				if arg_241_1.var_.actorSpriteComps1061 then
					for iter_244_5, iter_244_6 in pairs(arg_241_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_244_6 then
							local var_244_17 = Mathf.Lerp(iter_244_6.color.r, 0.5, var_244_16)

							iter_244_6.color = Color.New(var_244_17, var_244_17, var_244_17)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_14 + var_244_15 and arg_241_1.time_ < var_244_14 + var_244_15 + arg_244_0 and arg_241_1.var_.actorSpriteComps1061 then
				local var_244_18 = 0.5

				for iter_244_7, iter_244_8 in pairs(arg_241_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_244_8 then
						iter_244_8.color = Color.New(var_244_18, var_244_18, var_244_18)
					end
				end

				arg_241_1.var_.actorSpriteComps1061 = nil
			end

			local var_244_19 = 0
			local var_244_20 = 0.25

			if var_244_19 < arg_241_1.time_ and arg_241_1.time_ <= var_244_19 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_21 = arg_241_1:FormatText(StoryNameCfg[596].name)

				arg_241_1.leftNameTxt_.text = var_244_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_22 = arg_241_1:GetWordFromCfg(410161059)
				local var_244_23 = arg_241_1:FormatText(var_244_22.content)

				arg_241_1.text_.text = var_244_23

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_24 = 10
				local var_244_25 = utf8.len(var_244_23)
				local var_244_26 = var_244_24 <= 0 and var_244_20 or var_244_20 * (var_244_25 / var_244_24)

				if var_244_26 > 0 and var_244_20 < var_244_26 then
					arg_241_1.talkMaxDuration = var_244_26

					if var_244_26 + var_244_19 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_26 + var_244_19
					end
				end

				arg_241_1.text_.text = var_244_23
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161059", "story_v_out_410161.awb") ~= 0 then
					local var_244_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161059", "story_v_out_410161.awb") / 1000

					if var_244_27 + var_244_19 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_27 + var_244_19
					end

					if var_244_22.prefab_name ~= "" and arg_241_1.actors_[var_244_22.prefab_name] ~= nil then
						local var_244_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_22.prefab_name].transform, "story_v_out_410161", "410161059", "story_v_out_410161.awb")

						arg_241_1:RecordAudio("410161059", var_244_28)
						arg_241_1:RecordAudio("410161059", var_244_28)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_410161", "410161059", "story_v_out_410161.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_410161", "410161059", "story_v_out_410161.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_29 = math.max(var_244_20, arg_241_1.talkMaxDuration)

			if var_244_19 <= arg_241_1.time_ and arg_241_1.time_ < var_244_19 + var_244_29 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_19) / var_244_29

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_19 + var_244_29 and arg_241_1.time_ < var_244_19 + var_244_29 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play410161060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 410161060
		arg_245_1.duration_ = 9

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play410161061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = "ST62"

			if arg_245_1.bgs_[var_248_0] == nil then
				local var_248_1 = Object.Instantiate(arg_245_1.paintGo_)

				var_248_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_248_0)
				var_248_1.name = var_248_0
				var_248_1.transform.parent = arg_245_1.stage_.transform
				var_248_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_245_1.bgs_[var_248_0] = var_248_1
			end

			local var_248_2 = 2

			if var_248_2 < arg_245_1.time_ and arg_245_1.time_ <= var_248_2 + arg_248_0 then
				local var_248_3 = manager.ui.mainCamera.transform.localPosition
				local var_248_4 = Vector3.New(0, 0, 10) + Vector3.New(var_248_3.x, var_248_3.y, 0)
				local var_248_5 = arg_245_1.bgs_.ST62

				var_248_5.transform.localPosition = var_248_4
				var_248_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_248_6 = var_248_5:GetComponent("SpriteRenderer")

				if var_248_6 and var_248_6.sprite then
					local var_248_7 = (var_248_5.transform.localPosition - var_248_3).z
					local var_248_8 = manager.ui.mainCameraCom_
					local var_248_9 = 2 * var_248_7 * Mathf.Tan(var_248_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_248_10 = var_248_9 * var_248_8.aspect
					local var_248_11 = var_248_6.sprite.bounds.size.x
					local var_248_12 = var_248_6.sprite.bounds.size.y
					local var_248_13 = var_248_10 / var_248_11
					local var_248_14 = var_248_9 / var_248_12
					local var_248_15 = var_248_14 < var_248_13 and var_248_13 or var_248_14

					var_248_5.transform.localScale = Vector3.New(var_248_15, var_248_15, 0)
				end

				for iter_248_0, iter_248_1 in pairs(arg_245_1.bgs_) do
					if iter_248_0 ~= "ST62" then
						iter_248_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_248_16 = 0

			if var_248_16 < arg_245_1.time_ and arg_245_1.time_ <= var_248_16 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = true

				arg_245_1:SetGaussion(false)
			end

			local var_248_17 = 2

			if var_248_16 <= arg_245_1.time_ and arg_245_1.time_ < var_248_16 + var_248_17 then
				local var_248_18 = (arg_245_1.time_ - var_248_16) / var_248_17
				local var_248_19 = Color.New(0, 0, 0)

				var_248_19.a = Mathf.Lerp(0, 1, var_248_18)
				arg_245_1.mask_.color = var_248_19
			end

			if arg_245_1.time_ >= var_248_16 + var_248_17 and arg_245_1.time_ < var_248_16 + var_248_17 + arg_248_0 then
				local var_248_20 = Color.New(0, 0, 0)

				var_248_20.a = 1
				arg_245_1.mask_.color = var_248_20
			end

			local var_248_21 = 2

			if var_248_21 < arg_245_1.time_ and arg_245_1.time_ <= var_248_21 + arg_248_0 then
				arg_245_1.mask_.enabled = true
				arg_245_1.mask_.raycastTarget = true

				arg_245_1:SetGaussion(false)
			end

			local var_248_22 = 2

			if var_248_21 <= arg_245_1.time_ and arg_245_1.time_ < var_248_21 + var_248_22 then
				local var_248_23 = (arg_245_1.time_ - var_248_21) / var_248_22
				local var_248_24 = Color.New(0, 0, 0)

				var_248_24.a = Mathf.Lerp(1, 0, var_248_23)
				arg_245_1.mask_.color = var_248_24
			end

			if arg_245_1.time_ >= var_248_21 + var_248_22 and arg_245_1.time_ < var_248_21 + var_248_22 + arg_248_0 then
				local var_248_25 = Color.New(0, 0, 0)
				local var_248_26 = 0

				arg_245_1.mask_.enabled = false
				var_248_25.a = var_248_26
				arg_245_1.mask_.color = var_248_25
			end

			local var_248_27 = arg_245_1.actors_["10059"].transform
			local var_248_28 = 2

			if var_248_28 < arg_245_1.time_ and arg_245_1.time_ <= var_248_28 + arg_248_0 then
				arg_245_1.var_.moveOldPos10059 = var_248_27.localPosition
				var_248_27.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("10059", 7)

				local var_248_29 = var_248_27.childCount

				for iter_248_2 = 0, var_248_29 - 1 do
					local var_248_30 = var_248_27:GetChild(iter_248_2)

					if var_248_30.name == "" or not string.find(var_248_30.name, "split") then
						var_248_30.gameObject:SetActive(true)
					else
						var_248_30.gameObject:SetActive(false)
					end
				end
			end

			local var_248_31 = 0.001

			if var_248_28 <= arg_245_1.time_ and arg_245_1.time_ < var_248_28 + var_248_31 then
				local var_248_32 = (arg_245_1.time_ - var_248_28) / var_248_31
				local var_248_33 = Vector3.New(0, -2000, 35)

				var_248_27.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos10059, var_248_33, var_248_32)
			end

			if arg_245_1.time_ >= var_248_28 + var_248_31 and arg_245_1.time_ < var_248_28 + var_248_31 + arg_248_0 then
				var_248_27.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_248_34 = arg_245_1.actors_["1061"].transform
			local var_248_35 = 2

			if var_248_35 < arg_245_1.time_ and arg_245_1.time_ <= var_248_35 + arg_248_0 then
				arg_245_1.var_.moveOldPos1061 = var_248_34.localPosition
				var_248_34.localScale = Vector3.New(1, 1, 1)

				arg_245_1:CheckSpriteTmpPos("1061", 7)

				local var_248_36 = var_248_34.childCount

				for iter_248_3 = 0, var_248_36 - 1 do
					local var_248_37 = var_248_34:GetChild(iter_248_3)

					if var_248_37.name == "" or not string.find(var_248_37.name, "split") then
						var_248_37.gameObject:SetActive(true)
					else
						var_248_37.gameObject:SetActive(false)
					end
				end
			end

			local var_248_38 = 0.001

			if var_248_35 <= arg_245_1.time_ and arg_245_1.time_ < var_248_35 + var_248_38 then
				local var_248_39 = (arg_245_1.time_ - var_248_35) / var_248_38
				local var_248_40 = Vector3.New(0, -2000, 18)

				var_248_34.localPosition = Vector3.Lerp(arg_245_1.var_.moveOldPos1061, var_248_40, var_248_39)
			end

			if arg_245_1.time_ >= var_248_35 + var_248_38 and arg_245_1.time_ < var_248_35 + var_248_38 + arg_248_0 then
				var_248_34.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_248_41 = arg_245_1.actors_["10059"]
			local var_248_42 = 2

			if var_248_42 < arg_245_1.time_ and arg_245_1.time_ <= var_248_42 + arg_248_0 and arg_245_1.var_.actorSpriteComps10059 == nil then
				arg_245_1.var_.actorSpriteComps10059 = var_248_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_43 = 0.034

			if var_248_42 <= arg_245_1.time_ and arg_245_1.time_ < var_248_42 + var_248_43 then
				local var_248_44 = (arg_245_1.time_ - var_248_42) / var_248_43

				if arg_245_1.var_.actorSpriteComps10059 then
					for iter_248_4, iter_248_5 in pairs(arg_245_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_248_5 then
							local var_248_45 = Mathf.Lerp(iter_248_5.color.r, 0.5, var_248_44)

							iter_248_5.color = Color.New(var_248_45, var_248_45, var_248_45)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_42 + var_248_43 and arg_245_1.time_ < var_248_42 + var_248_43 + arg_248_0 and arg_245_1.var_.actorSpriteComps10059 then
				local var_248_46 = 0.5

				for iter_248_6, iter_248_7 in pairs(arg_245_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_248_7 then
						iter_248_7.color = Color.New(var_248_46, var_248_46, var_248_46)
					end
				end

				arg_245_1.var_.actorSpriteComps10059 = nil
			end

			local var_248_47 = arg_245_1.actors_["1061"]
			local var_248_48 = 2.00066666666667

			if var_248_48 < arg_245_1.time_ and arg_245_1.time_ <= var_248_48 + arg_248_0 and arg_245_1.var_.actorSpriteComps1061 == nil then
				arg_245_1.var_.actorSpriteComps1061 = var_248_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_248_49 = 0.0333333333333332

			if var_248_48 <= arg_245_1.time_ and arg_245_1.time_ < var_248_48 + var_248_49 then
				local var_248_50 = (arg_245_1.time_ - var_248_48) / var_248_49

				if arg_245_1.var_.actorSpriteComps1061 then
					for iter_248_8, iter_248_9 in pairs(arg_245_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_248_9 then
							local var_248_51 = Mathf.Lerp(iter_248_9.color.r, 0.5, var_248_50)

							iter_248_9.color = Color.New(var_248_51, var_248_51, var_248_51)
						end
					end
				end
			end

			if arg_245_1.time_ >= var_248_48 + var_248_49 and arg_245_1.time_ < var_248_48 + var_248_49 + arg_248_0 and arg_245_1.var_.actorSpriteComps1061 then
				local var_248_52 = 0.5

				for iter_248_10, iter_248_11 in pairs(arg_245_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_248_11 then
						iter_248_11.color = Color.New(var_248_52, var_248_52, var_248_52)
					end
				end

				arg_245_1.var_.actorSpriteComps1061 = nil
			end

			if arg_245_1.frameCnt_ <= 1 then
				arg_245_1.dialog_:SetActive(false)
			end

			local var_248_53 = 4
			local var_248_54 = 1.125

			if var_248_53 < arg_245_1.time_ and arg_245_1.time_ <= var_248_53 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0

				arg_245_1.dialog_:SetActive(true)

				local var_248_55 = LeanTween.value(arg_245_1.dialog_, 0, 1, 0.3)

				var_248_55:setOnUpdate(LuaHelper.FloatAction(function(arg_249_0)
					arg_245_1.dialogCg_.alpha = arg_249_0
				end))
				var_248_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_245_1.dialog_)
					var_248_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_245_1.duration_ = arg_245_1.duration_ + 0.3

				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_56 = arg_245_1:GetWordFromCfg(410161060)
				local var_248_57 = arg_245_1:FormatText(var_248_56.content)

				arg_245_1.text_.text = var_248_57

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_58 = 45
				local var_248_59 = utf8.len(var_248_57)
				local var_248_60 = var_248_58 <= 0 and var_248_54 or var_248_54 * (var_248_59 / var_248_58)

				if var_248_60 > 0 and var_248_54 < var_248_60 then
					arg_245_1.talkMaxDuration = var_248_60
					var_248_53 = var_248_53 + 0.3

					if var_248_60 + var_248_53 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_60 + var_248_53
					end
				end

				arg_245_1.text_.text = var_248_57
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_61 = var_248_53 + 0.3
			local var_248_62 = math.max(var_248_54, arg_245_1.talkMaxDuration)

			if var_248_61 <= arg_245_1.time_ and arg_245_1.time_ < var_248_61 + var_248_62 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_61) / var_248_62

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_61 + var_248_62 and arg_245_1.time_ < var_248_61 + var_248_62 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play410161061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 410161061
		arg_251_1.duration_ = 5

		SetActive(arg_251_1.tipsGo_, false)

		function arg_251_1.onSingleLineFinish_()
			arg_251_1.onSingleLineUpdate_ = nil
			arg_251_1.onSingleLineFinish_ = nil
			arg_251_1.state_ = "waiting"
		end

		function arg_251_1.playNext_(arg_253_0)
			if arg_253_0 == 1 then
				arg_251_0:Play410161062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.6

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, false)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_2 = arg_251_1:GetWordFromCfg(410161061)
				local var_254_3 = arg_251_1:FormatText(var_254_2.content)

				arg_251_1.text_.text = var_254_3

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_4 = 24
				local var_254_5 = utf8.len(var_254_3)
				local var_254_6 = var_254_4 <= 0 and var_254_1 or var_254_1 * (var_254_5 / var_254_4)

				if var_254_6 > 0 and var_254_1 < var_254_6 then
					arg_251_1.talkMaxDuration = var_254_6

					if var_254_6 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_6 + var_254_0
					end
				end

				arg_251_1.text_.text = var_254_3
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)
				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_7 = math.max(var_254_1, arg_251_1.talkMaxDuration)

			if var_254_0 <= arg_251_1.time_ and arg_251_1.time_ < var_254_0 + var_254_7 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_0) / var_254_7

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_0 + var_254_7 and arg_251_1.time_ < var_254_0 + var_254_7 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play410161062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 410161062
		arg_255_1.duration_ = 5.4

		local var_255_0 = {
			ja = 5.4,
			CriLanguages = 2.166,
			zh = 2.166
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
				arg_255_0:Play410161063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1061"].transform
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 then
				arg_255_1.var_.moveOldPos1061 = var_258_0.localPosition
				var_258_0.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("1061", 2)

				local var_258_2 = var_258_0.childCount

				for iter_258_0 = 0, var_258_2 - 1 do
					local var_258_3 = var_258_0:GetChild(iter_258_0)

					if var_258_3.name == "" or not string.find(var_258_3.name, "split") then
						var_258_3.gameObject:SetActive(true)
					else
						var_258_3.gameObject:SetActive(false)
					end
				end
			end

			local var_258_4 = 0.001

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_4 then
				local var_258_5 = (arg_255_1.time_ - var_258_1) / var_258_4
				local var_258_6 = Vector3.New(-390, -490, 18)

				var_258_0.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos1061, var_258_6, var_258_5)
			end

			if arg_255_1.time_ >= var_258_1 + var_258_4 and arg_255_1.time_ < var_258_1 + var_258_4 + arg_258_0 then
				var_258_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_258_7 = arg_255_1.actors_["10059"].transform
			local var_258_8 = 0

			if var_258_8 < arg_255_1.time_ and arg_255_1.time_ <= var_258_8 + arg_258_0 then
				arg_255_1.var_.moveOldPos10059 = var_258_7.localPosition
				var_258_7.localScale = Vector3.New(1, 1, 1)

				arg_255_1:CheckSpriteTmpPos("10059", 4)

				local var_258_9 = var_258_7.childCount

				for iter_258_1 = 0, var_258_9 - 1 do
					local var_258_10 = var_258_7:GetChild(iter_258_1)

					if var_258_10.name == "" or not string.find(var_258_10.name, "split") then
						var_258_10.gameObject:SetActive(true)
					else
						var_258_10.gameObject:SetActive(false)
					end
				end
			end

			local var_258_11 = 0.001

			if var_258_8 <= arg_255_1.time_ and arg_255_1.time_ < var_258_8 + var_258_11 then
				local var_258_12 = (arg_255_1.time_ - var_258_8) / var_258_11
				local var_258_13 = Vector3.New(390, -530, 35)

				var_258_7.localPosition = Vector3.Lerp(arg_255_1.var_.moveOldPos10059, var_258_13, var_258_12)
			end

			if arg_255_1.time_ >= var_258_8 + var_258_11 and arg_255_1.time_ < var_258_8 + var_258_11 + arg_258_0 then
				var_258_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_258_14 = arg_255_1.actors_["1061"]
			local var_258_15 = 0

			if var_258_15 < arg_255_1.time_ and arg_255_1.time_ <= var_258_15 + arg_258_0 and arg_255_1.var_.actorSpriteComps1061 == nil then
				arg_255_1.var_.actorSpriteComps1061 = var_258_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_16 = 0.034

			if var_258_15 <= arg_255_1.time_ and arg_255_1.time_ < var_258_15 + var_258_16 then
				local var_258_17 = (arg_255_1.time_ - var_258_15) / var_258_16

				if arg_255_1.var_.actorSpriteComps1061 then
					for iter_258_2, iter_258_3 in pairs(arg_255_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_258_3 then
							local var_258_18 = Mathf.Lerp(iter_258_3.color.r, 1, var_258_17)

							iter_258_3.color = Color.New(var_258_18, var_258_18, var_258_18)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_15 + var_258_16 and arg_255_1.time_ < var_258_15 + var_258_16 + arg_258_0 and arg_255_1.var_.actorSpriteComps1061 then
				local var_258_19 = 1

				for iter_258_4, iter_258_5 in pairs(arg_255_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_258_5 then
						iter_258_5.color = Color.New(var_258_19, var_258_19, var_258_19)
					end
				end

				arg_255_1.var_.actorSpriteComps1061 = nil
			end

			local var_258_20 = arg_255_1.actors_["10059"]
			local var_258_21 = 0

			if var_258_21 < arg_255_1.time_ and arg_255_1.time_ <= var_258_21 + arg_258_0 and arg_255_1.var_.actorSpriteComps10059 == nil then
				arg_255_1.var_.actorSpriteComps10059 = var_258_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_258_22 = 0.034

			if var_258_21 <= arg_255_1.time_ and arg_255_1.time_ < var_258_21 + var_258_22 then
				local var_258_23 = (arg_255_1.time_ - var_258_21) / var_258_22

				if arg_255_1.var_.actorSpriteComps10059 then
					for iter_258_6, iter_258_7 in pairs(arg_255_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_258_7 then
							local var_258_24 = Mathf.Lerp(iter_258_7.color.r, 0.5, var_258_23)

							iter_258_7.color = Color.New(var_258_24, var_258_24, var_258_24)
						end
					end
				end
			end

			if arg_255_1.time_ >= var_258_21 + var_258_22 and arg_255_1.time_ < var_258_21 + var_258_22 + arg_258_0 and arg_255_1.var_.actorSpriteComps10059 then
				local var_258_25 = 0.5

				for iter_258_8, iter_258_9 in pairs(arg_255_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_258_9 then
						iter_258_9.color = Color.New(var_258_25, var_258_25, var_258_25)
					end
				end

				arg_255_1.var_.actorSpriteComps10059 = nil
			end

			local var_258_26 = 0
			local var_258_27 = 0.275

			if var_258_26 < arg_255_1.time_ and arg_255_1.time_ <= var_258_26 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_28 = arg_255_1:FormatText(StoryNameCfg[612].name)

				arg_255_1.leftNameTxt_.text = var_258_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_29 = arg_255_1:GetWordFromCfg(410161062)
				local var_258_30 = arg_255_1:FormatText(var_258_29.content)

				arg_255_1.text_.text = var_258_30

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_31 = 11
				local var_258_32 = utf8.len(var_258_30)
				local var_258_33 = var_258_31 <= 0 and var_258_27 or var_258_27 * (var_258_32 / var_258_31)

				if var_258_33 > 0 and var_258_27 < var_258_33 then
					arg_255_1.talkMaxDuration = var_258_33

					if var_258_33 + var_258_26 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_33 + var_258_26
					end
				end

				arg_255_1.text_.text = var_258_30
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161062", "story_v_out_410161.awb") ~= 0 then
					local var_258_34 = manager.audio:GetVoiceLength("story_v_out_410161", "410161062", "story_v_out_410161.awb") / 1000

					if var_258_34 + var_258_26 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_34 + var_258_26
					end

					if var_258_29.prefab_name ~= "" and arg_255_1.actors_[var_258_29.prefab_name] ~= nil then
						local var_258_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_29.prefab_name].transform, "story_v_out_410161", "410161062", "story_v_out_410161.awb")

						arg_255_1:RecordAudio("410161062", var_258_35)
						arg_255_1:RecordAudio("410161062", var_258_35)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_410161", "410161062", "story_v_out_410161.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_410161", "410161062", "story_v_out_410161.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_36 = math.max(var_258_27, arg_255_1.talkMaxDuration)

			if var_258_26 <= arg_255_1.time_ and arg_255_1.time_ < var_258_26 + var_258_36 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_26) / var_258_36

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_26 + var_258_36 and arg_255_1.time_ < var_258_26 + var_258_36 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play410161063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 410161063
		arg_259_1.duration_ = 1.7

		local var_259_0 = {
			ja = 1.7,
			CriLanguages = 1.466,
			zh = 1.466
		}
		local var_259_1 = manager.audio:GetLocalizationFlag()

		if var_259_0[var_259_1] ~= nil then
			arg_259_1.duration_ = var_259_0[var_259_1]
		end

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play410161064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["10059"].transform
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 then
				arg_259_1.var_.moveOldPos10059 = var_262_0.localPosition
				var_262_0.localScale = Vector3.New(1, 1, 1)

				arg_259_1:CheckSpriteTmpPos("10059", 4)

				local var_262_2 = var_262_0.childCount

				for iter_262_0 = 0, var_262_2 - 1 do
					local var_262_3 = var_262_0:GetChild(iter_262_0)

					if var_262_3.name == "split_2" or not string.find(var_262_3.name, "split") then
						var_262_3.gameObject:SetActive(true)
					else
						var_262_3.gameObject:SetActive(false)
					end
				end
			end

			local var_262_4 = 0.001

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_4 then
				local var_262_5 = (arg_259_1.time_ - var_262_1) / var_262_4
				local var_262_6 = Vector3.New(390, -530, 35)

				var_262_0.localPosition = Vector3.Lerp(arg_259_1.var_.moveOldPos10059, var_262_6, var_262_5)
			end

			if arg_259_1.time_ >= var_262_1 + var_262_4 and arg_259_1.time_ < var_262_1 + var_262_4 + arg_262_0 then
				var_262_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_262_7 = arg_259_1.actors_["10059"]
			local var_262_8 = 0

			if var_262_8 < arg_259_1.time_ and arg_259_1.time_ <= var_262_8 + arg_262_0 and arg_259_1.var_.actorSpriteComps10059 == nil then
				arg_259_1.var_.actorSpriteComps10059 = var_262_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_9 = 0.034

			if var_262_8 <= arg_259_1.time_ and arg_259_1.time_ < var_262_8 + var_262_9 then
				local var_262_10 = (arg_259_1.time_ - var_262_8) / var_262_9

				if arg_259_1.var_.actorSpriteComps10059 then
					for iter_262_1, iter_262_2 in pairs(arg_259_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_262_2 then
							local var_262_11 = Mathf.Lerp(iter_262_2.color.r, 1, var_262_10)

							iter_262_2.color = Color.New(var_262_11, var_262_11, var_262_11)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_8 + var_262_9 and arg_259_1.time_ < var_262_8 + var_262_9 + arg_262_0 and arg_259_1.var_.actorSpriteComps10059 then
				local var_262_12 = 1

				for iter_262_3, iter_262_4 in pairs(arg_259_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_262_4 then
						iter_262_4.color = Color.New(var_262_12, var_262_12, var_262_12)
					end
				end

				arg_259_1.var_.actorSpriteComps10059 = nil
			end

			local var_262_13 = arg_259_1.actors_["1061"]
			local var_262_14 = 0

			if var_262_14 < arg_259_1.time_ and arg_259_1.time_ <= var_262_14 + arg_262_0 and arg_259_1.var_.actorSpriteComps1061 == nil then
				arg_259_1.var_.actorSpriteComps1061 = var_262_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_262_15 = 0.034

			if var_262_14 <= arg_259_1.time_ and arg_259_1.time_ < var_262_14 + var_262_15 then
				local var_262_16 = (arg_259_1.time_ - var_262_14) / var_262_15

				if arg_259_1.var_.actorSpriteComps1061 then
					for iter_262_5, iter_262_6 in pairs(arg_259_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_262_6 then
							local var_262_17 = Mathf.Lerp(iter_262_6.color.r, 0.5, var_262_16)

							iter_262_6.color = Color.New(var_262_17, var_262_17, var_262_17)
						end
					end
				end
			end

			if arg_259_1.time_ >= var_262_14 + var_262_15 and arg_259_1.time_ < var_262_14 + var_262_15 + arg_262_0 and arg_259_1.var_.actorSpriteComps1061 then
				local var_262_18 = 0.5

				for iter_262_7, iter_262_8 in pairs(arg_259_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_262_8 then
						iter_262_8.color = Color.New(var_262_18, var_262_18, var_262_18)
					end
				end

				arg_259_1.var_.actorSpriteComps1061 = nil
			end

			local var_262_19 = 0
			local var_262_20 = 0.125

			if var_262_19 < arg_259_1.time_ and arg_259_1.time_ <= var_262_19 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_21 = arg_259_1:FormatText(StoryNameCfg[596].name)

				arg_259_1.leftNameTxt_.text = var_262_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_22 = arg_259_1:GetWordFromCfg(410161063)
				local var_262_23 = arg_259_1:FormatText(var_262_22.content)

				arg_259_1.text_.text = var_262_23

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_24 = 5
				local var_262_25 = utf8.len(var_262_23)
				local var_262_26 = var_262_24 <= 0 and var_262_20 or var_262_20 * (var_262_25 / var_262_24)

				if var_262_26 > 0 and var_262_20 < var_262_26 then
					arg_259_1.talkMaxDuration = var_262_26

					if var_262_26 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_26 + var_262_19
					end
				end

				arg_259_1.text_.text = var_262_23
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161063", "story_v_out_410161.awb") ~= 0 then
					local var_262_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161063", "story_v_out_410161.awb") / 1000

					if var_262_27 + var_262_19 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_27 + var_262_19
					end

					if var_262_22.prefab_name ~= "" and arg_259_1.actors_[var_262_22.prefab_name] ~= nil then
						local var_262_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_22.prefab_name].transform, "story_v_out_410161", "410161063", "story_v_out_410161.awb")

						arg_259_1:RecordAudio("410161063", var_262_28)
						arg_259_1:RecordAudio("410161063", var_262_28)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_410161", "410161063", "story_v_out_410161.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_410161", "410161063", "story_v_out_410161.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_29 = math.max(var_262_20, arg_259_1.talkMaxDuration)

			if var_262_19 <= arg_259_1.time_ and arg_259_1.time_ < var_262_19 + var_262_29 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_19) / var_262_29

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_19 + var_262_29 and arg_259_1.time_ < var_262_19 + var_262_29 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play410161064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 410161064
		arg_263_1.duration_ = 13.1

		local var_263_0 = {
			ja = 13.1,
			CriLanguages = 4.166,
			zh = 4.166
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
				arg_263_0:Play410161065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1061"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1061 = var_266_0.localPosition
				var_266_0.localScale = Vector3.New(1, 1, 1)

				arg_263_1:CheckSpriteTmpPos("1061", 2)

				local var_266_2 = var_266_0.childCount

				for iter_266_0 = 0, var_266_2 - 1 do
					local var_266_3 = var_266_0:GetChild(iter_266_0)

					if var_266_3.name == "" or not string.find(var_266_3.name, "split") then
						var_266_3.gameObject:SetActive(true)
					else
						var_266_3.gameObject:SetActive(false)
					end
				end
			end

			local var_266_4 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_4 then
				local var_266_5 = (arg_263_1.time_ - var_266_1) / var_266_4
				local var_266_6 = Vector3.New(-390, -490, 18)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1061, var_266_6, var_266_5)
			end

			if arg_263_1.time_ >= var_266_1 + var_266_4 and arg_263_1.time_ < var_266_1 + var_266_4 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_266_7 = arg_263_1.actors_["1061"]
			local var_266_8 = 0

			if var_266_8 < arg_263_1.time_ and arg_263_1.time_ <= var_266_8 + arg_266_0 and arg_263_1.var_.actorSpriteComps1061 == nil then
				arg_263_1.var_.actorSpriteComps1061 = var_266_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_9 = 0.034

			if var_266_8 <= arg_263_1.time_ and arg_263_1.time_ < var_266_8 + var_266_9 then
				local var_266_10 = (arg_263_1.time_ - var_266_8) / var_266_9

				if arg_263_1.var_.actorSpriteComps1061 then
					for iter_266_1, iter_266_2 in pairs(arg_263_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_266_2 then
							local var_266_11 = Mathf.Lerp(iter_266_2.color.r, 1, var_266_10)

							iter_266_2.color = Color.New(var_266_11, var_266_11, var_266_11)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_8 + var_266_9 and arg_263_1.time_ < var_266_8 + var_266_9 + arg_266_0 and arg_263_1.var_.actorSpriteComps1061 then
				local var_266_12 = 1

				for iter_266_3, iter_266_4 in pairs(arg_263_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_266_4 then
						iter_266_4.color = Color.New(var_266_12, var_266_12, var_266_12)
					end
				end

				arg_263_1.var_.actorSpriteComps1061 = nil
			end

			local var_266_13 = arg_263_1.actors_["10059"]
			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 and arg_263_1.var_.actorSpriteComps10059 == nil then
				arg_263_1.var_.actorSpriteComps10059 = var_266_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_266_15 = 0.034

			if var_266_14 <= arg_263_1.time_ and arg_263_1.time_ < var_266_14 + var_266_15 then
				local var_266_16 = (arg_263_1.time_ - var_266_14) / var_266_15

				if arg_263_1.var_.actorSpriteComps10059 then
					for iter_266_5, iter_266_6 in pairs(arg_263_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_266_6 then
							local var_266_17 = Mathf.Lerp(iter_266_6.color.r, 0.5, var_266_16)

							iter_266_6.color = Color.New(var_266_17, var_266_17, var_266_17)
						end
					end
				end
			end

			if arg_263_1.time_ >= var_266_14 + var_266_15 and arg_263_1.time_ < var_266_14 + var_266_15 + arg_266_0 and arg_263_1.var_.actorSpriteComps10059 then
				local var_266_18 = 0.5

				for iter_266_7, iter_266_8 in pairs(arg_263_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_266_8 then
						iter_266_8.color = Color.New(var_266_18, var_266_18, var_266_18)
					end
				end

				arg_263_1.var_.actorSpriteComps10059 = nil
			end

			local var_266_19 = 0
			local var_266_20 = 0.525

			if var_266_19 < arg_263_1.time_ and arg_263_1.time_ <= var_266_19 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_21 = arg_263_1:FormatText(StoryNameCfg[612].name)

				arg_263_1.leftNameTxt_.text = var_266_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_22 = arg_263_1:GetWordFromCfg(410161064)
				local var_266_23 = arg_263_1:FormatText(var_266_22.content)

				arg_263_1.text_.text = var_266_23

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_24 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161064", "story_v_out_410161.awb") ~= 0 then
					local var_266_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161064", "story_v_out_410161.awb") / 1000

					if var_266_27 + var_266_19 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_27 + var_266_19
					end

					if var_266_22.prefab_name ~= "" and arg_263_1.actors_[var_266_22.prefab_name] ~= nil then
						local var_266_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_22.prefab_name].transform, "story_v_out_410161", "410161064", "story_v_out_410161.awb")

						arg_263_1:RecordAudio("410161064", var_266_28)
						arg_263_1:RecordAudio("410161064", var_266_28)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_410161", "410161064", "story_v_out_410161.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_410161", "410161064", "story_v_out_410161.awb")
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
	Play410161065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 410161065
		arg_267_1.duration_ = 2.4

		local var_267_0 = {
			ja = 2.1,
			CriLanguages = 2.4,
			zh = 2.4
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
				arg_267_0:Play410161066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["10059"].transform
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.var_.moveOldPos10059 = var_270_0.localPosition
				var_270_0.localScale = Vector3.New(1, 1, 1)

				arg_267_1:CheckSpriteTmpPos("10059", 4)

				local var_270_2 = var_270_0.childCount

				for iter_270_0 = 0, var_270_2 - 1 do
					local var_270_3 = var_270_0:GetChild(iter_270_0)

					if var_270_3.name == "split_1" or not string.find(var_270_3.name, "split") then
						var_270_3.gameObject:SetActive(true)
					else
						var_270_3.gameObject:SetActive(false)
					end
				end
			end

			local var_270_4 = 0.001

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_4 then
				local var_270_5 = (arg_267_1.time_ - var_270_1) / var_270_4
				local var_270_6 = Vector3.New(390, -530, 35)

				var_270_0.localPosition = Vector3.Lerp(arg_267_1.var_.moveOldPos10059, var_270_6, var_270_5)
			end

			if arg_267_1.time_ >= var_270_1 + var_270_4 and arg_267_1.time_ < var_270_1 + var_270_4 + arg_270_0 then
				var_270_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_270_7 = arg_267_1.actors_["10059"]
			local var_270_8 = 0

			if var_270_8 < arg_267_1.time_ and arg_267_1.time_ <= var_270_8 + arg_270_0 and arg_267_1.var_.actorSpriteComps10059 == nil then
				arg_267_1.var_.actorSpriteComps10059 = var_270_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_9 = 0.034

			if var_270_8 <= arg_267_1.time_ and arg_267_1.time_ < var_270_8 + var_270_9 then
				local var_270_10 = (arg_267_1.time_ - var_270_8) / var_270_9

				if arg_267_1.var_.actorSpriteComps10059 then
					for iter_270_1, iter_270_2 in pairs(arg_267_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_270_2 then
							local var_270_11 = Mathf.Lerp(iter_270_2.color.r, 1, var_270_10)

							iter_270_2.color = Color.New(var_270_11, var_270_11, var_270_11)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_8 + var_270_9 and arg_267_1.time_ < var_270_8 + var_270_9 + arg_270_0 and arg_267_1.var_.actorSpriteComps10059 then
				local var_270_12 = 1

				for iter_270_3, iter_270_4 in pairs(arg_267_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_270_4 then
						iter_270_4.color = Color.New(var_270_12, var_270_12, var_270_12)
					end
				end

				arg_267_1.var_.actorSpriteComps10059 = nil
			end

			local var_270_13 = arg_267_1.actors_["1061"]
			local var_270_14 = 0

			if var_270_14 < arg_267_1.time_ and arg_267_1.time_ <= var_270_14 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 == nil then
				arg_267_1.var_.actorSpriteComps1061 = var_270_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_270_15 = 0.034

			if var_270_14 <= arg_267_1.time_ and arg_267_1.time_ < var_270_14 + var_270_15 then
				local var_270_16 = (arg_267_1.time_ - var_270_14) / var_270_15

				if arg_267_1.var_.actorSpriteComps1061 then
					for iter_270_5, iter_270_6 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_270_6 then
							local var_270_17 = Mathf.Lerp(iter_270_6.color.r, 0.5, var_270_16)

							iter_270_6.color = Color.New(var_270_17, var_270_17, var_270_17)
						end
					end
				end
			end

			if arg_267_1.time_ >= var_270_14 + var_270_15 and arg_267_1.time_ < var_270_14 + var_270_15 + arg_270_0 and arg_267_1.var_.actorSpriteComps1061 then
				local var_270_18 = 0.5

				for iter_270_7, iter_270_8 in pairs(arg_267_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_270_8 then
						iter_270_8.color = Color.New(var_270_18, var_270_18, var_270_18)
					end
				end

				arg_267_1.var_.actorSpriteComps1061 = nil
			end

			local var_270_19 = 0
			local var_270_20 = 0.325

			if var_270_19 < arg_267_1.time_ and arg_267_1.time_ <= var_270_19 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_21 = arg_267_1:FormatText(StoryNameCfg[596].name)

				arg_267_1.leftNameTxt_.text = var_270_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_22 = arg_267_1:GetWordFromCfg(410161065)
				local var_270_23 = arg_267_1:FormatText(var_270_22.content)

				arg_267_1.text_.text = var_270_23

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_24 = 13
				local var_270_25 = utf8.len(var_270_23)
				local var_270_26 = var_270_24 <= 0 and var_270_20 or var_270_20 * (var_270_25 / var_270_24)

				if var_270_26 > 0 and var_270_20 < var_270_26 then
					arg_267_1.talkMaxDuration = var_270_26

					if var_270_26 + var_270_19 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_26 + var_270_19
					end
				end

				arg_267_1.text_.text = var_270_23
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161065", "story_v_out_410161.awb") ~= 0 then
					local var_270_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161065", "story_v_out_410161.awb") / 1000

					if var_270_27 + var_270_19 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_27 + var_270_19
					end

					if var_270_22.prefab_name ~= "" and arg_267_1.actors_[var_270_22.prefab_name] ~= nil then
						local var_270_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_22.prefab_name].transform, "story_v_out_410161", "410161065", "story_v_out_410161.awb")

						arg_267_1:RecordAudio("410161065", var_270_28)
						arg_267_1:RecordAudio("410161065", var_270_28)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_410161", "410161065", "story_v_out_410161.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_410161", "410161065", "story_v_out_410161.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_29 = math.max(var_270_20, arg_267_1.talkMaxDuration)

			if var_270_19 <= arg_267_1.time_ and arg_267_1.time_ < var_270_19 + var_270_29 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_19) / var_270_29

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_19 + var_270_29 and arg_267_1.time_ < var_270_19 + var_270_29 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play410161066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 410161066
		arg_271_1.duration_ = 5.866

		local var_271_0 = {
			ja = 4.866,
			CriLanguages = 5.866,
			zh = 5.866
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
				arg_271_0:Play410161067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1061"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1061 = var_274_0.localPosition
				var_274_0.localScale = Vector3.New(1, 1, 1)

				arg_271_1:CheckSpriteTmpPos("1061", 2)

				local var_274_2 = var_274_0.childCount

				for iter_274_0 = 0, var_274_2 - 1 do
					local var_274_3 = var_274_0:GetChild(iter_274_0)

					if var_274_3.name == "split_5" or not string.find(var_274_3.name, "split") then
						var_274_3.gameObject:SetActive(true)
					else
						var_274_3.gameObject:SetActive(false)
					end
				end
			end

			local var_274_4 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_4 then
				local var_274_5 = (arg_271_1.time_ - var_274_1) / var_274_4
				local var_274_6 = Vector3.New(-390, -490, 18)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1061, var_274_6, var_274_5)
			end

			if arg_271_1.time_ >= var_274_1 + var_274_4 and arg_271_1.time_ < var_274_1 + var_274_4 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_274_7 = arg_271_1.actors_["1061"]
			local var_274_8 = 0

			if var_274_8 < arg_271_1.time_ and arg_271_1.time_ <= var_274_8 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 == nil then
				arg_271_1.var_.actorSpriteComps1061 = var_274_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_9 = 0.034

			if var_274_8 <= arg_271_1.time_ and arg_271_1.time_ < var_274_8 + var_274_9 then
				local var_274_10 = (arg_271_1.time_ - var_274_8) / var_274_9

				if arg_271_1.var_.actorSpriteComps1061 then
					for iter_274_1, iter_274_2 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_274_2 then
							local var_274_11 = Mathf.Lerp(iter_274_2.color.r, 1, var_274_10)

							iter_274_2.color = Color.New(var_274_11, var_274_11, var_274_11)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_8 + var_274_9 and arg_271_1.time_ < var_274_8 + var_274_9 + arg_274_0 and arg_271_1.var_.actorSpriteComps1061 then
				local var_274_12 = 1

				for iter_274_3, iter_274_4 in pairs(arg_271_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_274_4 then
						iter_274_4.color = Color.New(var_274_12, var_274_12, var_274_12)
					end
				end

				arg_271_1.var_.actorSpriteComps1061 = nil
			end

			local var_274_13 = arg_271_1.actors_["10059"]
			local var_274_14 = 0

			if var_274_14 < arg_271_1.time_ and arg_271_1.time_ <= var_274_14 + arg_274_0 and arg_271_1.var_.actorSpriteComps10059 == nil then
				arg_271_1.var_.actorSpriteComps10059 = var_274_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_274_15 = 0.034

			if var_274_14 <= arg_271_1.time_ and arg_271_1.time_ < var_274_14 + var_274_15 then
				local var_274_16 = (arg_271_1.time_ - var_274_14) / var_274_15

				if arg_271_1.var_.actorSpriteComps10059 then
					for iter_274_5, iter_274_6 in pairs(arg_271_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_274_6 then
							local var_274_17 = Mathf.Lerp(iter_274_6.color.r, 0.5, var_274_16)

							iter_274_6.color = Color.New(var_274_17, var_274_17, var_274_17)
						end
					end
				end
			end

			if arg_271_1.time_ >= var_274_14 + var_274_15 and arg_271_1.time_ < var_274_14 + var_274_15 + arg_274_0 and arg_271_1.var_.actorSpriteComps10059 then
				local var_274_18 = 0.5

				for iter_274_7, iter_274_8 in pairs(arg_271_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_274_8 then
						iter_274_8.color = Color.New(var_274_18, var_274_18, var_274_18)
					end
				end

				arg_271_1.var_.actorSpriteComps10059 = nil
			end

			local var_274_19 = 0
			local var_274_20 = 0.625

			if var_274_19 < arg_271_1.time_ and arg_271_1.time_ <= var_274_19 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_21 = arg_271_1:FormatText(StoryNameCfg[612].name)

				arg_271_1.leftNameTxt_.text = var_274_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_22 = arg_271_1:GetWordFromCfg(410161066)
				local var_274_23 = arg_271_1:FormatText(var_274_22.content)

				arg_271_1.text_.text = var_274_23

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_24 = 25
				local var_274_25 = utf8.len(var_274_23)
				local var_274_26 = var_274_24 <= 0 and var_274_20 or var_274_20 * (var_274_25 / var_274_24)

				if var_274_26 > 0 and var_274_20 < var_274_26 then
					arg_271_1.talkMaxDuration = var_274_26

					if var_274_26 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_26 + var_274_19
					end
				end

				arg_271_1.text_.text = var_274_23
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161066", "story_v_out_410161.awb") ~= 0 then
					local var_274_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161066", "story_v_out_410161.awb") / 1000

					if var_274_27 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_27 + var_274_19
					end

					if var_274_22.prefab_name ~= "" and arg_271_1.actors_[var_274_22.prefab_name] ~= nil then
						local var_274_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_22.prefab_name].transform, "story_v_out_410161", "410161066", "story_v_out_410161.awb")

						arg_271_1:RecordAudio("410161066", var_274_28)
						arg_271_1:RecordAudio("410161066", var_274_28)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_410161", "410161066", "story_v_out_410161.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_410161", "410161066", "story_v_out_410161.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_29 = math.max(var_274_20, arg_271_1.talkMaxDuration)

			if var_274_19 <= arg_271_1.time_ and arg_271_1.time_ < var_274_19 + var_274_29 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_19) / var_274_29

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_19 + var_274_29 and arg_271_1.time_ < var_274_19 + var_274_29 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play410161067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 410161067
		arg_275_1.duration_ = 7.866

		local var_275_0 = {
			ja = 7.866,
			CriLanguages = 6.933,
			zh = 6.933
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
				arg_275_0:Play410161068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1061"].transform
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 then
				arg_275_1.var_.moveOldPos1061 = var_278_0.localPosition
				var_278_0.localScale = Vector3.New(1, 1, 1)

				arg_275_1:CheckSpriteTmpPos("1061", 2)

				local var_278_2 = var_278_0.childCount

				for iter_278_0 = 0, var_278_2 - 1 do
					local var_278_3 = var_278_0:GetChild(iter_278_0)

					if var_278_3.name == "split_5" or not string.find(var_278_3.name, "split") then
						var_278_3.gameObject:SetActive(true)
					else
						var_278_3.gameObject:SetActive(false)
					end
				end
			end

			local var_278_4 = 0.001

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_4 then
				local var_278_5 = (arg_275_1.time_ - var_278_1) / var_278_4
				local var_278_6 = Vector3.New(-390, -490, 18)

				var_278_0.localPosition = Vector3.Lerp(arg_275_1.var_.moveOldPos1061, var_278_6, var_278_5)
			end

			if arg_275_1.time_ >= var_278_1 + var_278_4 and arg_275_1.time_ < var_278_1 + var_278_4 + arg_278_0 then
				var_278_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_278_7 = arg_275_1.actors_["1061"]
			local var_278_8 = 0

			if var_278_8 < arg_275_1.time_ and arg_275_1.time_ <= var_278_8 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 == nil then
				arg_275_1.var_.actorSpriteComps1061 = var_278_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_278_9 = 0.034

			if var_278_8 <= arg_275_1.time_ and arg_275_1.time_ < var_278_8 + var_278_9 then
				local var_278_10 = (arg_275_1.time_ - var_278_8) / var_278_9

				if arg_275_1.var_.actorSpriteComps1061 then
					for iter_278_1, iter_278_2 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_278_2 then
							local var_278_11 = Mathf.Lerp(iter_278_2.color.r, 1, var_278_10)

							iter_278_2.color = Color.New(var_278_11, var_278_11, var_278_11)
						end
					end
				end
			end

			if arg_275_1.time_ >= var_278_8 + var_278_9 and arg_275_1.time_ < var_278_8 + var_278_9 + arg_278_0 and arg_275_1.var_.actorSpriteComps1061 then
				local var_278_12 = 1

				for iter_278_3, iter_278_4 in pairs(arg_275_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_278_4 then
						iter_278_4.color = Color.New(var_278_12, var_278_12, var_278_12)
					end
				end

				arg_275_1.var_.actorSpriteComps1061 = nil
			end

			local var_278_13 = 0
			local var_278_14 = 0.8

			if var_278_13 < arg_275_1.time_ and arg_275_1.time_ <= var_278_13 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_15 = arg_275_1:FormatText(StoryNameCfg[612].name)

				arg_275_1.leftNameTxt_.text = var_278_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_16 = arg_275_1:GetWordFromCfg(410161067)
				local var_278_17 = arg_275_1:FormatText(var_278_16.content)

				arg_275_1.text_.text = var_278_17

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_18 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161067", "story_v_out_410161.awb") ~= 0 then
					local var_278_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161067", "story_v_out_410161.awb") / 1000

					if var_278_21 + var_278_13 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_21 + var_278_13
					end

					if var_278_16.prefab_name ~= "" and arg_275_1.actors_[var_278_16.prefab_name] ~= nil then
						local var_278_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_16.prefab_name].transform, "story_v_out_410161", "410161067", "story_v_out_410161.awb")

						arg_275_1:RecordAudio("410161067", var_278_22)
						arg_275_1:RecordAudio("410161067", var_278_22)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_410161", "410161067", "story_v_out_410161.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_410161", "410161067", "story_v_out_410161.awb")
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
	Play410161068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 410161068
		arg_279_1.duration_ = 7.933

		local var_279_0 = {
			ja = 7.766,
			CriLanguages = 7.933,
			zh = 7.933
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
				arg_279_0:Play410161069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["10059"].transform
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 then
				arg_279_1.var_.moveOldPos10059 = var_282_0.localPosition
				var_282_0.localScale = Vector3.New(1, 1, 1)

				arg_279_1:CheckSpriteTmpPos("10059", 4)

				local var_282_2 = var_282_0.childCount

				for iter_282_0 = 0, var_282_2 - 1 do
					local var_282_3 = var_282_0:GetChild(iter_282_0)

					if var_282_3.name == "split_3" or not string.find(var_282_3.name, "split") then
						var_282_3.gameObject:SetActive(true)
					else
						var_282_3.gameObject:SetActive(false)
					end
				end
			end

			local var_282_4 = 0.001

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_4 then
				local var_282_5 = (arg_279_1.time_ - var_282_1) / var_282_4
				local var_282_6 = Vector3.New(390, -530, 35)

				var_282_0.localPosition = Vector3.Lerp(arg_279_1.var_.moveOldPos10059, var_282_6, var_282_5)
			end

			if arg_279_1.time_ >= var_282_1 + var_282_4 and arg_279_1.time_ < var_282_1 + var_282_4 + arg_282_0 then
				var_282_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_282_7 = arg_279_1.actors_["10059"]
			local var_282_8 = 0

			if var_282_8 < arg_279_1.time_ and arg_279_1.time_ <= var_282_8 + arg_282_0 and arg_279_1.var_.actorSpriteComps10059 == nil then
				arg_279_1.var_.actorSpriteComps10059 = var_282_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_9 = 0.034

			if var_282_8 <= arg_279_1.time_ and arg_279_1.time_ < var_282_8 + var_282_9 then
				local var_282_10 = (arg_279_1.time_ - var_282_8) / var_282_9

				if arg_279_1.var_.actorSpriteComps10059 then
					for iter_282_1, iter_282_2 in pairs(arg_279_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_282_2 then
							local var_282_11 = Mathf.Lerp(iter_282_2.color.r, 1, var_282_10)

							iter_282_2.color = Color.New(var_282_11, var_282_11, var_282_11)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_8 + var_282_9 and arg_279_1.time_ < var_282_8 + var_282_9 + arg_282_0 and arg_279_1.var_.actorSpriteComps10059 then
				local var_282_12 = 1

				for iter_282_3, iter_282_4 in pairs(arg_279_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_282_4 then
						iter_282_4.color = Color.New(var_282_12, var_282_12, var_282_12)
					end
				end

				arg_279_1.var_.actorSpriteComps10059 = nil
			end

			local var_282_13 = arg_279_1.actors_["1061"]
			local var_282_14 = 0

			if var_282_14 < arg_279_1.time_ and arg_279_1.time_ <= var_282_14 + arg_282_0 and arg_279_1.var_.actorSpriteComps1061 == nil then
				arg_279_1.var_.actorSpriteComps1061 = var_282_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_282_15 = 0.034

			if var_282_14 <= arg_279_1.time_ and arg_279_1.time_ < var_282_14 + var_282_15 then
				local var_282_16 = (arg_279_1.time_ - var_282_14) / var_282_15

				if arg_279_1.var_.actorSpriteComps1061 then
					for iter_282_5, iter_282_6 in pairs(arg_279_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_282_6 then
							local var_282_17 = Mathf.Lerp(iter_282_6.color.r, 0.5, var_282_16)

							iter_282_6.color = Color.New(var_282_17, var_282_17, var_282_17)
						end
					end
				end
			end

			if arg_279_1.time_ >= var_282_14 + var_282_15 and arg_279_1.time_ < var_282_14 + var_282_15 + arg_282_0 and arg_279_1.var_.actorSpriteComps1061 then
				local var_282_18 = 0.5

				for iter_282_7, iter_282_8 in pairs(arg_279_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_282_8 then
						iter_282_8.color = Color.New(var_282_18, var_282_18, var_282_18)
					end
				end

				arg_279_1.var_.actorSpriteComps1061 = nil
			end

			local var_282_19 = 0
			local var_282_20 = 0.725

			if var_282_19 < arg_279_1.time_ and arg_279_1.time_ <= var_282_19 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_21 = arg_279_1:FormatText(StoryNameCfg[596].name)

				arg_279_1.leftNameTxt_.text = var_282_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_22 = arg_279_1:GetWordFromCfg(410161068)
				local var_282_23 = arg_279_1:FormatText(var_282_22.content)

				arg_279_1.text_.text = var_282_23

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_24 = 29
				local var_282_25 = utf8.len(var_282_23)
				local var_282_26 = var_282_24 <= 0 and var_282_20 or var_282_20 * (var_282_25 / var_282_24)

				if var_282_26 > 0 and var_282_20 < var_282_26 then
					arg_279_1.talkMaxDuration = var_282_26

					if var_282_26 + var_282_19 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_26 + var_282_19
					end
				end

				arg_279_1.text_.text = var_282_23
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161068", "story_v_out_410161.awb") ~= 0 then
					local var_282_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161068", "story_v_out_410161.awb") / 1000

					if var_282_27 + var_282_19 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_27 + var_282_19
					end

					if var_282_22.prefab_name ~= "" and arg_279_1.actors_[var_282_22.prefab_name] ~= nil then
						local var_282_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_22.prefab_name].transform, "story_v_out_410161", "410161068", "story_v_out_410161.awb")

						arg_279_1:RecordAudio("410161068", var_282_28)
						arg_279_1:RecordAudio("410161068", var_282_28)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_410161", "410161068", "story_v_out_410161.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_410161", "410161068", "story_v_out_410161.awb")
				end

				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_29 = math.max(var_282_20, arg_279_1.talkMaxDuration)

			if var_282_19 <= arg_279_1.time_ and arg_279_1.time_ < var_282_19 + var_282_29 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_19) / var_282_29

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_19 + var_282_29 and arg_279_1.time_ < var_282_19 + var_282_29 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play410161069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 410161069
		arg_283_1.duration_ = 9.966

		local var_283_0 = {
			ja = 9.966,
			CriLanguages = 5.333,
			zh = 5.333
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
				arg_283_0:Play410161070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1061"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1061 = var_286_0.localPosition
				var_286_0.localScale = Vector3.New(1, 1, 1)

				arg_283_1:CheckSpriteTmpPos("1061", 2)

				local var_286_2 = var_286_0.childCount

				for iter_286_0 = 0, var_286_2 - 1 do
					local var_286_3 = var_286_0:GetChild(iter_286_0)

					if var_286_3.name == "" or not string.find(var_286_3.name, "split") then
						var_286_3.gameObject:SetActive(true)
					else
						var_286_3.gameObject:SetActive(false)
					end
				end
			end

			local var_286_4 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_4 then
				local var_286_5 = (arg_283_1.time_ - var_286_1) / var_286_4
				local var_286_6 = Vector3.New(-390, -490, 18)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1061, var_286_6, var_286_5)
			end

			if arg_283_1.time_ >= var_286_1 + var_286_4 and arg_283_1.time_ < var_286_1 + var_286_4 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_286_7 = arg_283_1.actors_["1061"]
			local var_286_8 = 0

			if var_286_8 < arg_283_1.time_ and arg_283_1.time_ <= var_286_8 + arg_286_0 and arg_283_1.var_.actorSpriteComps1061 == nil then
				arg_283_1.var_.actorSpriteComps1061 = var_286_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_9 = 0.034

			if var_286_8 <= arg_283_1.time_ and arg_283_1.time_ < var_286_8 + var_286_9 then
				local var_286_10 = (arg_283_1.time_ - var_286_8) / var_286_9

				if arg_283_1.var_.actorSpriteComps1061 then
					for iter_286_1, iter_286_2 in pairs(arg_283_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_286_2 then
							local var_286_11 = Mathf.Lerp(iter_286_2.color.r, 1, var_286_10)

							iter_286_2.color = Color.New(var_286_11, var_286_11, var_286_11)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_8 + var_286_9 and arg_283_1.time_ < var_286_8 + var_286_9 + arg_286_0 and arg_283_1.var_.actorSpriteComps1061 then
				local var_286_12 = 1

				for iter_286_3, iter_286_4 in pairs(arg_283_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_286_4 then
						iter_286_4.color = Color.New(var_286_12, var_286_12, var_286_12)
					end
				end

				arg_283_1.var_.actorSpriteComps1061 = nil
			end

			local var_286_13 = arg_283_1.actors_["10059"]
			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 and arg_283_1.var_.actorSpriteComps10059 == nil then
				arg_283_1.var_.actorSpriteComps10059 = var_286_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_286_15 = 0.034

			if var_286_14 <= arg_283_1.time_ and arg_283_1.time_ < var_286_14 + var_286_15 then
				local var_286_16 = (arg_283_1.time_ - var_286_14) / var_286_15

				if arg_283_1.var_.actorSpriteComps10059 then
					for iter_286_5, iter_286_6 in pairs(arg_283_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_286_6 then
							local var_286_17 = Mathf.Lerp(iter_286_6.color.r, 0.5, var_286_16)

							iter_286_6.color = Color.New(var_286_17, var_286_17, var_286_17)
						end
					end
				end
			end

			if arg_283_1.time_ >= var_286_14 + var_286_15 and arg_283_1.time_ < var_286_14 + var_286_15 + arg_286_0 and arg_283_1.var_.actorSpriteComps10059 then
				local var_286_18 = 0.5

				for iter_286_7, iter_286_8 in pairs(arg_283_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_286_8 then
						iter_286_8.color = Color.New(var_286_18, var_286_18, var_286_18)
					end
				end

				arg_283_1.var_.actorSpriteComps10059 = nil
			end

			local var_286_19 = 0
			local var_286_20 = 0.6

			if var_286_19 < arg_283_1.time_ and arg_283_1.time_ <= var_286_19 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_21 = arg_283_1:FormatText(StoryNameCfg[612].name)

				arg_283_1.leftNameTxt_.text = var_286_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_22 = arg_283_1:GetWordFromCfg(410161069)
				local var_286_23 = arg_283_1:FormatText(var_286_22.content)

				arg_283_1.text_.text = var_286_23

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_24 = 24
				local var_286_25 = utf8.len(var_286_23)
				local var_286_26 = var_286_24 <= 0 and var_286_20 or var_286_20 * (var_286_25 / var_286_24)

				if var_286_26 > 0 and var_286_20 < var_286_26 then
					arg_283_1.talkMaxDuration = var_286_26

					if var_286_26 + var_286_19 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_26 + var_286_19
					end
				end

				arg_283_1.text_.text = var_286_23
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161069", "story_v_out_410161.awb") ~= 0 then
					local var_286_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161069", "story_v_out_410161.awb") / 1000

					if var_286_27 + var_286_19 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_27 + var_286_19
					end

					if var_286_22.prefab_name ~= "" and arg_283_1.actors_[var_286_22.prefab_name] ~= nil then
						local var_286_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_22.prefab_name].transform, "story_v_out_410161", "410161069", "story_v_out_410161.awb")

						arg_283_1:RecordAudio("410161069", var_286_28)
						arg_283_1:RecordAudio("410161069", var_286_28)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_410161", "410161069", "story_v_out_410161.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_410161", "410161069", "story_v_out_410161.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_29 = math.max(var_286_20, arg_283_1.talkMaxDuration)

			if var_286_19 <= arg_283_1.time_ and arg_283_1.time_ < var_286_19 + var_286_29 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_19) / var_286_29

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_19 + var_286_29 and arg_283_1.time_ < var_286_19 + var_286_29 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play410161070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 410161070
		arg_287_1.duration_ = 10.966

		local var_287_0 = {
			ja = 10.966,
			CriLanguages = 8.6,
			zh = 8.6
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
				arg_287_0:Play410161071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["10059"].transform
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 then
				arg_287_1.var_.moveOldPos10059 = var_290_0.localPosition
				var_290_0.localScale = Vector3.New(1, 1, 1)

				arg_287_1:CheckSpriteTmpPos("10059", 4)

				local var_290_2 = var_290_0.childCount

				for iter_290_0 = 0, var_290_2 - 1 do
					local var_290_3 = var_290_0:GetChild(iter_290_0)

					if var_290_3.name == "split_3" or not string.find(var_290_3.name, "split") then
						var_290_3.gameObject:SetActive(true)
					else
						var_290_3.gameObject:SetActive(false)
					end
				end
			end

			local var_290_4 = 0.001

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_4 then
				local var_290_5 = (arg_287_1.time_ - var_290_1) / var_290_4
				local var_290_6 = Vector3.New(390, -530, 35)

				var_290_0.localPosition = Vector3.Lerp(arg_287_1.var_.moveOldPos10059, var_290_6, var_290_5)
			end

			if arg_287_1.time_ >= var_290_1 + var_290_4 and arg_287_1.time_ < var_290_1 + var_290_4 + arg_290_0 then
				var_290_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_290_7 = arg_287_1.actors_["10059"]
			local var_290_8 = 0

			if var_290_8 < arg_287_1.time_ and arg_287_1.time_ <= var_290_8 + arg_290_0 and arg_287_1.var_.actorSpriteComps10059 == nil then
				arg_287_1.var_.actorSpriteComps10059 = var_290_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_9 = 0.034

			if var_290_8 <= arg_287_1.time_ and arg_287_1.time_ < var_290_8 + var_290_9 then
				local var_290_10 = (arg_287_1.time_ - var_290_8) / var_290_9

				if arg_287_1.var_.actorSpriteComps10059 then
					for iter_290_1, iter_290_2 in pairs(arg_287_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_290_2 then
							local var_290_11 = Mathf.Lerp(iter_290_2.color.r, 1, var_290_10)

							iter_290_2.color = Color.New(var_290_11, var_290_11, var_290_11)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_8 + var_290_9 and arg_287_1.time_ < var_290_8 + var_290_9 + arg_290_0 and arg_287_1.var_.actorSpriteComps10059 then
				local var_290_12 = 1

				for iter_290_3, iter_290_4 in pairs(arg_287_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_290_4 then
						iter_290_4.color = Color.New(var_290_12, var_290_12, var_290_12)
					end
				end

				arg_287_1.var_.actorSpriteComps10059 = nil
			end

			local var_290_13 = arg_287_1.actors_["1061"]
			local var_290_14 = 0

			if var_290_14 < arg_287_1.time_ and arg_287_1.time_ <= var_290_14 + arg_290_0 and arg_287_1.var_.actorSpriteComps1061 == nil then
				arg_287_1.var_.actorSpriteComps1061 = var_290_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_290_15 = 0.034

			if var_290_14 <= arg_287_1.time_ and arg_287_1.time_ < var_290_14 + var_290_15 then
				local var_290_16 = (arg_287_1.time_ - var_290_14) / var_290_15

				if arg_287_1.var_.actorSpriteComps1061 then
					for iter_290_5, iter_290_6 in pairs(arg_287_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_290_6 then
							local var_290_17 = Mathf.Lerp(iter_290_6.color.r, 0.5, var_290_16)

							iter_290_6.color = Color.New(var_290_17, var_290_17, var_290_17)
						end
					end
				end
			end

			if arg_287_1.time_ >= var_290_14 + var_290_15 and arg_287_1.time_ < var_290_14 + var_290_15 + arg_290_0 and arg_287_1.var_.actorSpriteComps1061 then
				local var_290_18 = 0.5

				for iter_290_7, iter_290_8 in pairs(arg_287_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_290_8 then
						iter_290_8.color = Color.New(var_290_18, var_290_18, var_290_18)
					end
				end

				arg_287_1.var_.actorSpriteComps1061 = nil
			end

			local var_290_19 = 0
			local var_290_20 = 0.875

			if var_290_19 < arg_287_1.time_ and arg_287_1.time_ <= var_290_19 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_21 = arg_287_1:FormatText(StoryNameCfg[596].name)

				arg_287_1.leftNameTxt_.text = var_290_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_22 = arg_287_1:GetWordFromCfg(410161070)
				local var_290_23 = arg_287_1:FormatText(var_290_22.content)

				arg_287_1.text_.text = var_290_23

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_24 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161070", "story_v_out_410161.awb") ~= 0 then
					local var_290_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161070", "story_v_out_410161.awb") / 1000

					if var_290_27 + var_290_19 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_27 + var_290_19
					end

					if var_290_22.prefab_name ~= "" and arg_287_1.actors_[var_290_22.prefab_name] ~= nil then
						local var_290_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_22.prefab_name].transform, "story_v_out_410161", "410161070", "story_v_out_410161.awb")

						arg_287_1:RecordAudio("410161070", var_290_28)
						arg_287_1:RecordAudio("410161070", var_290_28)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_410161", "410161070", "story_v_out_410161.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_410161", "410161070", "story_v_out_410161.awb")
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
	Play410161071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 410161071
		arg_291_1.duration_ = 11.633

		local var_291_0 = {
			ja = 11.633,
			CriLanguages = 7.466,
			zh = 7.466
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
				arg_291_0:Play410161072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["10059"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos10059 = var_294_0.localPosition
				var_294_0.localScale = Vector3.New(1, 1, 1)

				arg_291_1:CheckSpriteTmpPos("10059", 4)

				local var_294_2 = var_294_0.childCount

				for iter_294_0 = 0, var_294_2 - 1 do
					local var_294_3 = var_294_0:GetChild(iter_294_0)

					if var_294_3.name == "split_3" or not string.find(var_294_3.name, "split") then
						var_294_3.gameObject:SetActive(true)
					else
						var_294_3.gameObject:SetActive(false)
					end
				end
			end

			local var_294_4 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_4 then
				local var_294_5 = (arg_291_1.time_ - var_294_1) / var_294_4
				local var_294_6 = Vector3.New(390, -530, 35)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos10059, var_294_6, var_294_5)
			end

			if arg_291_1.time_ >= var_294_1 + var_294_4 and arg_291_1.time_ < var_294_1 + var_294_4 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_294_7 = arg_291_1.actors_["10059"]
			local var_294_8 = 0

			if var_294_8 < arg_291_1.time_ and arg_291_1.time_ <= var_294_8 + arg_294_0 and arg_291_1.var_.actorSpriteComps10059 == nil then
				arg_291_1.var_.actorSpriteComps10059 = var_294_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_294_9 = 0.034

			if var_294_8 <= arg_291_1.time_ and arg_291_1.time_ < var_294_8 + var_294_9 then
				local var_294_10 = (arg_291_1.time_ - var_294_8) / var_294_9

				if arg_291_1.var_.actorSpriteComps10059 then
					for iter_294_1, iter_294_2 in pairs(arg_291_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_294_2 then
							local var_294_11 = Mathf.Lerp(iter_294_2.color.r, 1, var_294_10)

							iter_294_2.color = Color.New(var_294_11, var_294_11, var_294_11)
						end
					end
				end
			end

			if arg_291_1.time_ >= var_294_8 + var_294_9 and arg_291_1.time_ < var_294_8 + var_294_9 + arg_294_0 and arg_291_1.var_.actorSpriteComps10059 then
				local var_294_12 = 1

				for iter_294_3, iter_294_4 in pairs(arg_291_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_294_4 then
						iter_294_4.color = Color.New(var_294_12, var_294_12, var_294_12)
					end
				end

				arg_291_1.var_.actorSpriteComps10059 = nil
			end

			local var_294_13 = 0
			local var_294_14 = 0.8

			if var_294_13 < arg_291_1.time_ and arg_291_1.time_ <= var_294_13 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, true)

				local var_294_15 = arg_291_1:FormatText(StoryNameCfg[596].name)

				arg_291_1.leftNameTxt_.text = var_294_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_291_1.leftNameTxt_.transform)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1.leftNameTxt_.text)
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_16 = arg_291_1:GetWordFromCfg(410161071)
				local var_294_17 = arg_291_1:FormatText(var_294_16.content)

				arg_291_1.text_.text = var_294_17

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_18 = 32
				local var_294_19 = utf8.len(var_294_17)
				local var_294_20 = var_294_18 <= 0 and var_294_14 or var_294_14 * (var_294_19 / var_294_18)

				if var_294_20 > 0 and var_294_14 < var_294_20 then
					arg_291_1.talkMaxDuration = var_294_20

					if var_294_20 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_20 + var_294_13
					end
				end

				arg_291_1.text_.text = var_294_17
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161071", "story_v_out_410161.awb") ~= 0 then
					local var_294_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161071", "story_v_out_410161.awb") / 1000

					if var_294_21 + var_294_13 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_21 + var_294_13
					end

					if var_294_16.prefab_name ~= "" and arg_291_1.actors_[var_294_16.prefab_name] ~= nil then
						local var_294_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_291_1.actors_[var_294_16.prefab_name].transform, "story_v_out_410161", "410161071", "story_v_out_410161.awb")

						arg_291_1:RecordAudio("410161071", var_294_22)
						arg_291_1:RecordAudio("410161071", var_294_22)
					else
						arg_291_1:AudioAction("play", "voice", "story_v_out_410161", "410161071", "story_v_out_410161.awb")
					end

					arg_291_1:RecordHistoryTalkVoice("story_v_out_410161", "410161071", "story_v_out_410161.awb")
				end

				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_23 = math.max(var_294_14, arg_291_1.talkMaxDuration)

			if var_294_13 <= arg_291_1.time_ and arg_291_1.time_ < var_294_13 + var_294_23 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_13) / var_294_23

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_13 + var_294_23 and arg_291_1.time_ < var_294_13 + var_294_23 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play410161072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 410161072
		arg_295_1.duration_ = 10.833

		local var_295_0 = {
			ja = 10.833,
			CriLanguages = 7.166,
			zh = 7.166
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
				arg_295_0:Play410161073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = arg_295_1.actors_["1061"].transform
			local var_298_1 = 0

			if var_298_1 < arg_295_1.time_ and arg_295_1.time_ <= var_298_1 + arg_298_0 then
				arg_295_1.var_.moveOldPos1061 = var_298_0.localPosition
				var_298_0.localScale = Vector3.New(1, 1, 1)

				arg_295_1:CheckSpriteTmpPos("1061", 2)

				local var_298_2 = var_298_0.childCount

				for iter_298_0 = 0, var_298_2 - 1 do
					local var_298_3 = var_298_0:GetChild(iter_298_0)

					if var_298_3.name == "split_5" or not string.find(var_298_3.name, "split") then
						var_298_3.gameObject:SetActive(true)
					else
						var_298_3.gameObject:SetActive(false)
					end
				end
			end

			local var_298_4 = 0.001

			if var_298_1 <= arg_295_1.time_ and arg_295_1.time_ < var_298_1 + var_298_4 then
				local var_298_5 = (arg_295_1.time_ - var_298_1) / var_298_4
				local var_298_6 = Vector3.New(-390, -490, 18)

				var_298_0.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1061, var_298_6, var_298_5)
			end

			if arg_295_1.time_ >= var_298_1 + var_298_4 and arg_295_1.time_ < var_298_1 + var_298_4 + arg_298_0 then
				var_298_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_298_7 = arg_295_1.actors_["1061"]
			local var_298_8 = 0

			if var_298_8 < arg_295_1.time_ and arg_295_1.time_ <= var_298_8 + arg_298_0 and arg_295_1.var_.actorSpriteComps1061 == nil then
				arg_295_1.var_.actorSpriteComps1061 = var_298_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_9 = 0.034

			if var_298_8 <= arg_295_1.time_ and arg_295_1.time_ < var_298_8 + var_298_9 then
				local var_298_10 = (arg_295_1.time_ - var_298_8) / var_298_9

				if arg_295_1.var_.actorSpriteComps1061 then
					for iter_298_1, iter_298_2 in pairs(arg_295_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_298_2 then
							local var_298_11 = Mathf.Lerp(iter_298_2.color.r, 1, var_298_10)

							iter_298_2.color = Color.New(var_298_11, var_298_11, var_298_11)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_8 + var_298_9 and arg_295_1.time_ < var_298_8 + var_298_9 + arg_298_0 and arg_295_1.var_.actorSpriteComps1061 then
				local var_298_12 = 1

				for iter_298_3, iter_298_4 in pairs(arg_295_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_298_4 then
						iter_298_4.color = Color.New(var_298_12, var_298_12, var_298_12)
					end
				end

				arg_295_1.var_.actorSpriteComps1061 = nil
			end

			local var_298_13 = arg_295_1.actors_["10059"]
			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 and arg_295_1.var_.actorSpriteComps10059 == nil then
				arg_295_1.var_.actorSpriteComps10059 = var_298_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_298_15 = 0.034

			if var_298_14 <= arg_295_1.time_ and arg_295_1.time_ < var_298_14 + var_298_15 then
				local var_298_16 = (arg_295_1.time_ - var_298_14) / var_298_15

				if arg_295_1.var_.actorSpriteComps10059 then
					for iter_298_5, iter_298_6 in pairs(arg_295_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_298_6 then
							local var_298_17 = Mathf.Lerp(iter_298_6.color.r, 0.5, var_298_16)

							iter_298_6.color = Color.New(var_298_17, var_298_17, var_298_17)
						end
					end
				end
			end

			if arg_295_1.time_ >= var_298_14 + var_298_15 and arg_295_1.time_ < var_298_14 + var_298_15 + arg_298_0 and arg_295_1.var_.actorSpriteComps10059 then
				local var_298_18 = 0.5

				for iter_298_7, iter_298_8 in pairs(arg_295_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_298_8 then
						iter_298_8.color = Color.New(var_298_18, var_298_18, var_298_18)
					end
				end

				arg_295_1.var_.actorSpriteComps10059 = nil
			end

			local var_298_19 = 0
			local var_298_20 = 0.8

			if var_298_19 < arg_295_1.time_ and arg_295_1.time_ <= var_298_19 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_21 = arg_295_1:FormatText(StoryNameCfg[612].name)

				arg_295_1.leftNameTxt_.text = var_298_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_22 = arg_295_1:GetWordFromCfg(410161072)
				local var_298_23 = arg_295_1:FormatText(var_298_22.content)

				arg_295_1.text_.text = var_298_23

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_24 = 32
				local var_298_25 = utf8.len(var_298_23)
				local var_298_26 = var_298_24 <= 0 and var_298_20 or var_298_20 * (var_298_25 / var_298_24)

				if var_298_26 > 0 and var_298_20 < var_298_26 then
					arg_295_1.talkMaxDuration = var_298_26

					if var_298_26 + var_298_19 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_26 + var_298_19
					end
				end

				arg_295_1.text_.text = var_298_23
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161072", "story_v_out_410161.awb") ~= 0 then
					local var_298_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161072", "story_v_out_410161.awb") / 1000

					if var_298_27 + var_298_19 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_27 + var_298_19
					end

					if var_298_22.prefab_name ~= "" and arg_295_1.actors_[var_298_22.prefab_name] ~= nil then
						local var_298_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_22.prefab_name].transform, "story_v_out_410161", "410161072", "story_v_out_410161.awb")

						arg_295_1:RecordAudio("410161072", var_298_28)
						arg_295_1:RecordAudio("410161072", var_298_28)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_410161", "410161072", "story_v_out_410161.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_410161", "410161072", "story_v_out_410161.awb")
				end

				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_29 = math.max(var_298_20, arg_295_1.talkMaxDuration)

			if var_298_19 <= arg_295_1.time_ and arg_295_1.time_ < var_298_19 + var_298_29 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_19) / var_298_29

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_19 + var_298_29 and arg_295_1.time_ < var_298_19 + var_298_29 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play410161073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 410161073
		arg_299_1.duration_ = 13.3

		local var_299_0 = {
			ja = 13.3,
			CriLanguages = 9.566,
			zh = 9.566
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
				arg_299_0:Play410161074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["10059"].transform
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 then
				arg_299_1.var_.moveOldPos10059 = var_302_0.localPosition
				var_302_0.localScale = Vector3.New(1, 1, 1)

				arg_299_1:CheckSpriteTmpPos("10059", 4)

				local var_302_2 = var_302_0.childCount

				for iter_302_0 = 0, var_302_2 - 1 do
					local var_302_3 = var_302_0:GetChild(iter_302_0)

					if var_302_3.name == "" or not string.find(var_302_3.name, "split") then
						var_302_3.gameObject:SetActive(true)
					else
						var_302_3.gameObject:SetActive(false)
					end
				end
			end

			local var_302_4 = 0.001

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_4 then
				local var_302_5 = (arg_299_1.time_ - var_302_1) / var_302_4
				local var_302_6 = Vector3.New(390, -530, 35)

				var_302_0.localPosition = Vector3.Lerp(arg_299_1.var_.moveOldPos10059, var_302_6, var_302_5)
			end

			if arg_299_1.time_ >= var_302_1 + var_302_4 and arg_299_1.time_ < var_302_1 + var_302_4 + arg_302_0 then
				var_302_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_302_7 = arg_299_1.actors_["10059"]
			local var_302_8 = 0

			if var_302_8 < arg_299_1.time_ and arg_299_1.time_ <= var_302_8 + arg_302_0 and arg_299_1.var_.actorSpriteComps10059 == nil then
				arg_299_1.var_.actorSpriteComps10059 = var_302_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_9 = 0.034

			if var_302_8 <= arg_299_1.time_ and arg_299_1.time_ < var_302_8 + var_302_9 then
				local var_302_10 = (arg_299_1.time_ - var_302_8) / var_302_9

				if arg_299_1.var_.actorSpriteComps10059 then
					for iter_302_1, iter_302_2 in pairs(arg_299_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_302_2 then
							local var_302_11 = Mathf.Lerp(iter_302_2.color.r, 1, var_302_10)

							iter_302_2.color = Color.New(var_302_11, var_302_11, var_302_11)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_8 + var_302_9 and arg_299_1.time_ < var_302_8 + var_302_9 + arg_302_0 and arg_299_1.var_.actorSpriteComps10059 then
				local var_302_12 = 1

				for iter_302_3, iter_302_4 in pairs(arg_299_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_302_4 then
						iter_302_4.color = Color.New(var_302_12, var_302_12, var_302_12)
					end
				end

				arg_299_1.var_.actorSpriteComps10059 = nil
			end

			local var_302_13 = arg_299_1.actors_["1061"]
			local var_302_14 = 0

			if var_302_14 < arg_299_1.time_ and arg_299_1.time_ <= var_302_14 + arg_302_0 and arg_299_1.var_.actorSpriteComps1061 == nil then
				arg_299_1.var_.actorSpriteComps1061 = var_302_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_302_15 = 0.034

			if var_302_14 <= arg_299_1.time_ and arg_299_1.time_ < var_302_14 + var_302_15 then
				local var_302_16 = (arg_299_1.time_ - var_302_14) / var_302_15

				if arg_299_1.var_.actorSpriteComps1061 then
					for iter_302_5, iter_302_6 in pairs(arg_299_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_302_6 then
							local var_302_17 = Mathf.Lerp(iter_302_6.color.r, 0.5, var_302_16)

							iter_302_6.color = Color.New(var_302_17, var_302_17, var_302_17)
						end
					end
				end
			end

			if arg_299_1.time_ >= var_302_14 + var_302_15 and arg_299_1.time_ < var_302_14 + var_302_15 + arg_302_0 and arg_299_1.var_.actorSpriteComps1061 then
				local var_302_18 = 0.5

				for iter_302_7, iter_302_8 in pairs(arg_299_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_302_8 then
						iter_302_8.color = Color.New(var_302_18, var_302_18, var_302_18)
					end
				end

				arg_299_1.var_.actorSpriteComps1061 = nil
			end

			local var_302_19 = 0
			local var_302_20 = 1.025

			if var_302_19 < arg_299_1.time_ and arg_299_1.time_ <= var_302_19 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_21 = arg_299_1:FormatText(StoryNameCfg[596].name)

				arg_299_1.leftNameTxt_.text = var_302_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_22 = arg_299_1:GetWordFromCfg(410161073)
				local var_302_23 = arg_299_1:FormatText(var_302_22.content)

				arg_299_1.text_.text = var_302_23

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_24 = 41
				local var_302_25 = utf8.len(var_302_23)
				local var_302_26 = var_302_24 <= 0 and var_302_20 or var_302_20 * (var_302_25 / var_302_24)

				if var_302_26 > 0 and var_302_20 < var_302_26 then
					arg_299_1.talkMaxDuration = var_302_26

					if var_302_26 + var_302_19 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_26 + var_302_19
					end
				end

				arg_299_1.text_.text = var_302_23
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161073", "story_v_out_410161.awb") ~= 0 then
					local var_302_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161073", "story_v_out_410161.awb") / 1000

					if var_302_27 + var_302_19 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_27 + var_302_19
					end

					if var_302_22.prefab_name ~= "" and arg_299_1.actors_[var_302_22.prefab_name] ~= nil then
						local var_302_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_22.prefab_name].transform, "story_v_out_410161", "410161073", "story_v_out_410161.awb")

						arg_299_1:RecordAudio("410161073", var_302_28)
						arg_299_1:RecordAudio("410161073", var_302_28)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_410161", "410161073", "story_v_out_410161.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_410161", "410161073", "story_v_out_410161.awb")
				end

				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_29 = math.max(var_302_20, arg_299_1.talkMaxDuration)

			if var_302_19 <= arg_299_1.time_ and arg_299_1.time_ < var_302_19 + var_302_29 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_19) / var_302_29

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_19 + var_302_29 and arg_299_1.time_ < var_302_19 + var_302_29 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play410161074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 410161074
		arg_303_1.duration_ = 5.4

		local var_303_0 = {
			ja = 5.4,
			CriLanguages = 2.033,
			zh = 2.033
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
				arg_303_0:Play410161075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1061"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1061 = var_306_0.localPosition
				var_306_0.localScale = Vector3.New(1, 1, 1)

				arg_303_1:CheckSpriteTmpPos("1061", 2)

				local var_306_2 = var_306_0.childCount

				for iter_306_0 = 0, var_306_2 - 1 do
					local var_306_3 = var_306_0:GetChild(iter_306_0)

					if var_306_3.name == "" or not string.find(var_306_3.name, "split") then
						var_306_3.gameObject:SetActive(true)
					else
						var_306_3.gameObject:SetActive(false)
					end
				end
			end

			local var_306_4 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_4 then
				local var_306_5 = (arg_303_1.time_ - var_306_1) / var_306_4
				local var_306_6 = Vector3.New(-390, -490, 18)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1061, var_306_6, var_306_5)
			end

			if arg_303_1.time_ >= var_306_1 + var_306_4 and arg_303_1.time_ < var_306_1 + var_306_4 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_306_7 = arg_303_1.actors_["1061"]
			local var_306_8 = 0

			if var_306_8 < arg_303_1.time_ and arg_303_1.time_ <= var_306_8 + arg_306_0 and arg_303_1.var_.actorSpriteComps1061 == nil then
				arg_303_1.var_.actorSpriteComps1061 = var_306_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_9 = 0.034

			if var_306_8 <= arg_303_1.time_ and arg_303_1.time_ < var_306_8 + var_306_9 then
				local var_306_10 = (arg_303_1.time_ - var_306_8) / var_306_9

				if arg_303_1.var_.actorSpriteComps1061 then
					for iter_306_1, iter_306_2 in pairs(arg_303_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_306_2 then
							local var_306_11 = Mathf.Lerp(iter_306_2.color.r, 1, var_306_10)

							iter_306_2.color = Color.New(var_306_11, var_306_11, var_306_11)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_8 + var_306_9 and arg_303_1.time_ < var_306_8 + var_306_9 + arg_306_0 and arg_303_1.var_.actorSpriteComps1061 then
				local var_306_12 = 1

				for iter_306_3, iter_306_4 in pairs(arg_303_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_306_4 then
						iter_306_4.color = Color.New(var_306_12, var_306_12, var_306_12)
					end
				end

				arg_303_1.var_.actorSpriteComps1061 = nil
			end

			local var_306_13 = arg_303_1.actors_["10059"]
			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 and arg_303_1.var_.actorSpriteComps10059 == nil then
				arg_303_1.var_.actorSpriteComps10059 = var_306_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_306_15 = 0.034

			if var_306_14 <= arg_303_1.time_ and arg_303_1.time_ < var_306_14 + var_306_15 then
				local var_306_16 = (arg_303_1.time_ - var_306_14) / var_306_15

				if arg_303_1.var_.actorSpriteComps10059 then
					for iter_306_5, iter_306_6 in pairs(arg_303_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_306_6 then
							local var_306_17 = Mathf.Lerp(iter_306_6.color.r, 0.5, var_306_16)

							iter_306_6.color = Color.New(var_306_17, var_306_17, var_306_17)
						end
					end
				end
			end

			if arg_303_1.time_ >= var_306_14 + var_306_15 and arg_303_1.time_ < var_306_14 + var_306_15 + arg_306_0 and arg_303_1.var_.actorSpriteComps10059 then
				local var_306_18 = 0.5

				for iter_306_7, iter_306_8 in pairs(arg_303_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_306_8 then
						iter_306_8.color = Color.New(var_306_18, var_306_18, var_306_18)
					end
				end

				arg_303_1.var_.actorSpriteComps10059 = nil
			end

			local var_306_19 = 0
			local var_306_20 = 0.275

			if var_306_19 < arg_303_1.time_ and arg_303_1.time_ <= var_306_19 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_21 = arg_303_1:FormatText(StoryNameCfg[612].name)

				arg_303_1.leftNameTxt_.text = var_306_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_22 = arg_303_1:GetWordFromCfg(410161074)
				local var_306_23 = arg_303_1:FormatText(var_306_22.content)

				arg_303_1.text_.text = var_306_23

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_24 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161074", "story_v_out_410161.awb") ~= 0 then
					local var_306_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161074", "story_v_out_410161.awb") / 1000

					if var_306_27 + var_306_19 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_27 + var_306_19
					end

					if var_306_22.prefab_name ~= "" and arg_303_1.actors_[var_306_22.prefab_name] ~= nil then
						local var_306_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_22.prefab_name].transform, "story_v_out_410161", "410161074", "story_v_out_410161.awb")

						arg_303_1:RecordAudio("410161074", var_306_28)
						arg_303_1:RecordAudio("410161074", var_306_28)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_410161", "410161074", "story_v_out_410161.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_410161", "410161074", "story_v_out_410161.awb")
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
	Play410161075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 410161075
		arg_307_1.duration_ = 4.666

		local var_307_0 = {
			ja = 4.666,
			CriLanguages = 3.2,
			zh = 3.2
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
				arg_307_0:Play410161076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1061"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1061 = var_310_0.localPosition
				var_310_0.localScale = Vector3.New(1, 1, 1)

				arg_307_1:CheckSpriteTmpPos("1061", 2)

				local var_310_2 = var_310_0.childCount

				for iter_310_0 = 0, var_310_2 - 1 do
					local var_310_3 = var_310_0:GetChild(iter_310_0)

					if var_310_3.name == "" or not string.find(var_310_3.name, "split") then
						var_310_3.gameObject:SetActive(true)
					else
						var_310_3.gameObject:SetActive(false)
					end
				end
			end

			local var_310_4 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_4 then
				local var_310_5 = (arg_307_1.time_ - var_310_1) / var_310_4
				local var_310_6 = Vector3.New(-390, -490, 18)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1061, var_310_6, var_310_5)
			end

			if arg_307_1.time_ >= var_310_1 + var_310_4 and arg_307_1.time_ < var_310_1 + var_310_4 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_310_7 = arg_307_1.actors_["1061"]
			local var_310_8 = 0

			if var_310_8 < arg_307_1.time_ and arg_307_1.time_ <= var_310_8 + arg_310_0 and arg_307_1.var_.actorSpriteComps1061 == nil then
				arg_307_1.var_.actorSpriteComps1061 = var_310_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_310_9 = 0.034

			if var_310_8 <= arg_307_1.time_ and arg_307_1.time_ < var_310_8 + var_310_9 then
				local var_310_10 = (arg_307_1.time_ - var_310_8) / var_310_9

				if arg_307_1.var_.actorSpriteComps1061 then
					for iter_310_1, iter_310_2 in pairs(arg_307_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_310_2 then
							local var_310_11 = Mathf.Lerp(iter_310_2.color.r, 1, var_310_10)

							iter_310_2.color = Color.New(var_310_11, var_310_11, var_310_11)
						end
					end
				end
			end

			if arg_307_1.time_ >= var_310_8 + var_310_9 and arg_307_1.time_ < var_310_8 + var_310_9 + arg_310_0 and arg_307_1.var_.actorSpriteComps1061 then
				local var_310_12 = 1

				for iter_310_3, iter_310_4 in pairs(arg_307_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_310_4 then
						iter_310_4.color = Color.New(var_310_12, var_310_12, var_310_12)
					end
				end

				arg_307_1.var_.actorSpriteComps1061 = nil
			end

			local var_310_13 = 0
			local var_310_14 = 0.3

			if var_310_13 < arg_307_1.time_ and arg_307_1.time_ <= var_310_13 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_15 = arg_307_1:FormatText(StoryNameCfg[612].name)

				arg_307_1.leftNameTxt_.text = var_310_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_16 = arg_307_1:GetWordFromCfg(410161075)
				local var_310_17 = arg_307_1:FormatText(var_310_16.content)

				arg_307_1.text_.text = var_310_17

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_18 = 12
				local var_310_19 = utf8.len(var_310_17)
				local var_310_20 = var_310_18 <= 0 and var_310_14 or var_310_14 * (var_310_19 / var_310_18)

				if var_310_20 > 0 and var_310_14 < var_310_20 then
					arg_307_1.talkMaxDuration = var_310_20

					if var_310_20 + var_310_13 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_20 + var_310_13
					end
				end

				arg_307_1.text_.text = var_310_17
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161075", "story_v_out_410161.awb") ~= 0 then
					local var_310_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161075", "story_v_out_410161.awb") / 1000

					if var_310_21 + var_310_13 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_21 + var_310_13
					end

					if var_310_16.prefab_name ~= "" and arg_307_1.actors_[var_310_16.prefab_name] ~= nil then
						local var_310_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_16.prefab_name].transform, "story_v_out_410161", "410161075", "story_v_out_410161.awb")

						arg_307_1:RecordAudio("410161075", var_310_22)
						arg_307_1:RecordAudio("410161075", var_310_22)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_410161", "410161075", "story_v_out_410161.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_410161", "410161075", "story_v_out_410161.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_23 = math.max(var_310_14, arg_307_1.talkMaxDuration)

			if var_310_13 <= arg_307_1.time_ and arg_307_1.time_ < var_310_13 + var_310_23 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_13) / var_310_23

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_13 + var_310_23 and arg_307_1.time_ < var_310_13 + var_310_23 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play410161076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 410161076
		arg_311_1.duration_ = 6.933

		local var_311_0 = {
			ja = 6.933,
			CriLanguages = 6.666,
			zh = 6.666
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
				arg_311_0:Play410161077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = "ST63"

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
				local var_314_5 = arg_311_1.bgs_.ST63

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
					if iter_314_0 ~= "ST63" then
						iter_314_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_314_16 = 2

			if var_314_16 < arg_311_1.time_ and arg_311_1.time_ <= var_314_16 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_17 = 2

			if var_314_16 <= arg_311_1.time_ and arg_311_1.time_ < var_314_16 + var_314_17 then
				local var_314_18 = (arg_311_1.time_ - var_314_16) / var_314_17
				local var_314_19 = Color.New(0, 0, 0)

				var_314_19.a = Mathf.Lerp(1, 0, var_314_18)
				arg_311_1.mask_.color = var_314_19
			end

			if arg_311_1.time_ >= var_314_16 + var_314_17 and arg_311_1.time_ < var_314_16 + var_314_17 + arg_314_0 then
				local var_314_20 = Color.New(0, 0, 0)
				local var_314_21 = 0

				arg_311_1.mask_.enabled = false
				var_314_20.a = var_314_21
				arg_311_1.mask_.color = var_314_20
			end

			local var_314_22 = 0

			if var_314_22 < arg_311_1.time_ and arg_311_1.time_ <= var_314_22 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_23 = 2

			if var_314_22 <= arg_311_1.time_ and arg_311_1.time_ < var_314_22 + var_314_23 then
				local var_314_24 = (arg_311_1.time_ - var_314_22) / var_314_23
				local var_314_25 = Color.New(0, 0, 0)

				var_314_25.a = Mathf.Lerp(0, 1, var_314_24)
				arg_311_1.mask_.color = var_314_25
			end

			if arg_311_1.time_ >= var_314_22 + var_314_23 and arg_311_1.time_ < var_314_22 + var_314_23 + arg_314_0 then
				local var_314_26 = Color.New(0, 0, 0)

				var_314_26.a = 1
				arg_311_1.mask_.color = var_314_26
			end

			local var_314_27 = arg_311_1.actors_["10059"].transform
			local var_314_28 = 2

			if var_314_28 < arg_311_1.time_ and arg_311_1.time_ <= var_314_28 + arg_314_0 then
				arg_311_1.var_.moveOldPos10059 = var_314_27.localPosition
				var_314_27.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("10059", 7)

				local var_314_29 = var_314_27.childCount

				for iter_314_2 = 0, var_314_29 - 1 do
					local var_314_30 = var_314_27:GetChild(iter_314_2)

					if var_314_30.name == "" or not string.find(var_314_30.name, "split") then
						var_314_30.gameObject:SetActive(true)
					else
						var_314_30.gameObject:SetActive(false)
					end
				end
			end

			local var_314_31 = 0.001

			if var_314_28 <= arg_311_1.time_ and arg_311_1.time_ < var_314_28 + var_314_31 then
				local var_314_32 = (arg_311_1.time_ - var_314_28) / var_314_31
				local var_314_33 = Vector3.New(0, -2000, 35)

				var_314_27.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10059, var_314_33, var_314_32)
			end

			if arg_311_1.time_ >= var_314_28 + var_314_31 and arg_311_1.time_ < var_314_28 + var_314_31 + arg_314_0 then
				var_314_27.localPosition = Vector3.New(0, -2000, 35)
			end

			local var_314_34 = arg_311_1.actors_["1061"].transform
			local var_314_35 = 2

			if var_314_35 < arg_311_1.time_ and arg_311_1.time_ <= var_314_35 + arg_314_0 then
				arg_311_1.var_.moveOldPos1061 = var_314_34.localPosition
				var_314_34.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("1061", 7)

				local var_314_36 = var_314_34.childCount

				for iter_314_3 = 0, var_314_36 - 1 do
					local var_314_37 = var_314_34:GetChild(iter_314_3)

					if var_314_37.name == "" or not string.find(var_314_37.name, "split") then
						var_314_37.gameObject:SetActive(true)
					else
						var_314_37.gameObject:SetActive(false)
					end
				end
			end

			local var_314_38 = 0.001

			if var_314_35 <= arg_311_1.time_ and arg_311_1.time_ < var_314_35 + var_314_38 then
				local var_314_39 = (arg_311_1.time_ - var_314_35) / var_314_38
				local var_314_40 = Vector3.New(0, -2000, 18)

				var_314_34.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1061, var_314_40, var_314_39)
			end

			if arg_311_1.time_ >= var_314_35 + var_314_38 and arg_311_1.time_ < var_314_35 + var_314_38 + arg_314_0 then
				var_314_34.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_314_41 = arg_311_1.actors_["10059"]
			local var_314_42 = 4

			if var_314_42 < arg_311_1.time_ and arg_311_1.time_ <= var_314_42 + arg_314_0 and arg_311_1.var_.actorSpriteComps10059 == nil then
				arg_311_1.var_.actorSpriteComps10059 = var_314_41:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_43 = 0.034

			if var_314_42 <= arg_311_1.time_ and arg_311_1.time_ < var_314_42 + var_314_43 then
				local var_314_44 = (arg_311_1.time_ - var_314_42) / var_314_43

				if arg_311_1.var_.actorSpriteComps10059 then
					for iter_314_4, iter_314_5 in pairs(arg_311_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_314_5 then
							local var_314_45 = Mathf.Lerp(iter_314_5.color.r, 1, var_314_44)

							iter_314_5.color = Color.New(var_314_45, var_314_45, var_314_45)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_42 + var_314_43 and arg_311_1.time_ < var_314_42 + var_314_43 + arg_314_0 and arg_311_1.var_.actorSpriteComps10059 then
				local var_314_46 = 1

				for iter_314_6, iter_314_7 in pairs(arg_311_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_314_7 then
						iter_314_7.color = Color.New(var_314_46, var_314_46, var_314_46)
					end
				end

				arg_311_1.var_.actorSpriteComps10059 = nil
			end

			local var_314_47 = arg_311_1.actors_["1061"]
			local var_314_48 = 2

			if var_314_48 < arg_311_1.time_ and arg_311_1.time_ <= var_314_48 + arg_314_0 and arg_311_1.var_.actorSpriteComps1061 == nil then
				arg_311_1.var_.actorSpriteComps1061 = var_314_47:GetComponentsInChildren(typeof(Image), true)
			end

			local var_314_49 = 0.034

			if var_314_48 <= arg_311_1.time_ and arg_311_1.time_ < var_314_48 + var_314_49 then
				local var_314_50 = (arg_311_1.time_ - var_314_48) / var_314_49

				if arg_311_1.var_.actorSpriteComps1061 then
					for iter_314_8, iter_314_9 in pairs(arg_311_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_314_9 then
							local var_314_51 = Mathf.Lerp(iter_314_9.color.r, 0.5, var_314_50)

							iter_314_9.color = Color.New(var_314_51, var_314_51, var_314_51)
						end
					end
				end
			end

			if arg_311_1.time_ >= var_314_48 + var_314_49 and arg_311_1.time_ < var_314_48 + var_314_49 + arg_314_0 and arg_311_1.var_.actorSpriteComps1061 then
				local var_314_52 = 0.5

				for iter_314_10, iter_314_11 in pairs(arg_311_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_314_11 then
						iter_314_11.color = Color.New(var_314_52, var_314_52, var_314_52)
					end
				end

				arg_311_1.var_.actorSpriteComps1061 = nil
			end

			local var_314_53 = arg_311_1.actors_["10059"].transform
			local var_314_54 = 4

			if var_314_54 < arg_311_1.time_ and arg_311_1.time_ <= var_314_54 + arg_314_0 then
				arg_311_1.var_.moveOldPos10059 = var_314_53.localPosition
				var_314_53.localScale = Vector3.New(1, 1, 1)

				arg_311_1:CheckSpriteTmpPos("10059", 3)

				local var_314_55 = var_314_53.childCount

				for iter_314_12 = 0, var_314_55 - 1 do
					local var_314_56 = var_314_53:GetChild(iter_314_12)

					if var_314_56.name == "" or not string.find(var_314_56.name, "split") then
						var_314_56.gameObject:SetActive(true)
					else
						var_314_56.gameObject:SetActive(false)
					end
				end
			end

			local var_314_57 = 0.001

			if var_314_54 <= arg_311_1.time_ and arg_311_1.time_ < var_314_54 + var_314_57 then
				local var_314_58 = (arg_311_1.time_ - var_314_54) / var_314_57
				local var_314_59 = Vector3.New(0, -530, 35)

				var_314_53.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos10059, var_314_59, var_314_58)
			end

			if arg_311_1.time_ >= var_314_54 + var_314_57 and arg_311_1.time_ < var_314_54 + var_314_57 + arg_314_0 then
				var_314_53.localPosition = Vector3.New(0, -530, 35)
			end

			if arg_311_1.frameCnt_ <= 1 then
				arg_311_1.dialog_:SetActive(false)
			end

			local var_314_60 = 4
			local var_314_61 = 0.325

			if var_314_60 < arg_311_1.time_ and arg_311_1.time_ <= var_314_60 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0

				arg_311_1.dialog_:SetActive(true)

				local var_314_62 = LeanTween.value(arg_311_1.dialog_, 0, 1, 0.3)

				var_314_62:setOnUpdate(LuaHelper.FloatAction(function(arg_315_0)
					arg_311_1.dialogCg_.alpha = arg_315_0
				end))
				var_314_62:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_311_1.dialog_)
					var_314_62:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_311_1.duration_ = arg_311_1.duration_ + 0.3

				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_63 = arg_311_1:FormatText(StoryNameCfg[596].name)

				arg_311_1.leftNameTxt_.text = var_314_63

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_64 = arg_311_1:GetWordFromCfg(410161076)
				local var_314_65 = arg_311_1:FormatText(var_314_64.content)

				arg_311_1.text_.text = var_314_65

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_66 = 13
				local var_314_67 = utf8.len(var_314_65)
				local var_314_68 = var_314_66 <= 0 and var_314_61 or var_314_61 * (var_314_67 / var_314_66)

				if var_314_68 > 0 and var_314_61 < var_314_68 then
					arg_311_1.talkMaxDuration = var_314_68
					var_314_60 = var_314_60 + 0.3

					if var_314_68 + var_314_60 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_68 + var_314_60
					end
				end

				arg_311_1.text_.text = var_314_65
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161076", "story_v_out_410161.awb") ~= 0 then
					local var_314_69 = manager.audio:GetVoiceLength("story_v_out_410161", "410161076", "story_v_out_410161.awb") / 1000

					if var_314_69 + var_314_60 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_69 + var_314_60
					end

					if var_314_64.prefab_name ~= "" and arg_311_1.actors_[var_314_64.prefab_name] ~= nil then
						local var_314_70 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_64.prefab_name].transform, "story_v_out_410161", "410161076", "story_v_out_410161.awb")

						arg_311_1:RecordAudio("410161076", var_314_70)
						arg_311_1:RecordAudio("410161076", var_314_70)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_410161", "410161076", "story_v_out_410161.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_410161", "410161076", "story_v_out_410161.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_71 = var_314_60 + 0.3
			local var_314_72 = math.max(var_314_61, arg_311_1.talkMaxDuration)

			if var_314_71 <= arg_311_1.time_ and arg_311_1.time_ < var_314_71 + var_314_72 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_71) / var_314_72

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_71 + var_314_72 and arg_311_1.time_ < var_314_71 + var_314_72 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play410161077 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 410161077
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play410161078(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10059"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 and arg_317_1.var_.actorSpriteComps10059 == nil then
				arg_317_1.var_.actorSpriteComps10059 = var_320_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_320_2 = 0.034

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_2 then
				local var_320_3 = (arg_317_1.time_ - var_320_1) / var_320_2

				if arg_317_1.var_.actorSpriteComps10059 then
					for iter_320_0, iter_320_1 in pairs(arg_317_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_320_1 then
							local var_320_4 = Mathf.Lerp(iter_320_1.color.r, 0.5, var_320_3)

							iter_320_1.color = Color.New(var_320_4, var_320_4, var_320_4)
						end
					end
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_2 and arg_317_1.time_ < var_320_1 + var_320_2 + arg_320_0 and arg_317_1.var_.actorSpriteComps10059 then
				local var_320_5 = 0.5

				for iter_320_2, iter_320_3 in pairs(arg_317_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_320_3 then
						iter_320_3.color = Color.New(var_320_5, var_320_5, var_320_5)
					end
				end

				arg_317_1.var_.actorSpriteComps10059 = nil
			end

			local var_320_6 = 0
			local var_320_7 = 1.35

			if var_320_6 < arg_317_1.time_ and arg_317_1.time_ <= var_320_6 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_8 = arg_317_1:GetWordFromCfg(410161077)
				local var_320_9 = arg_317_1:FormatText(var_320_8.content)

				arg_317_1.text_.text = var_320_9

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_10 = 54
				local var_320_11 = utf8.len(var_320_9)
				local var_320_12 = var_320_10 <= 0 and var_320_7 or var_320_7 * (var_320_11 / var_320_10)

				if var_320_12 > 0 and var_320_7 < var_320_12 then
					arg_317_1.talkMaxDuration = var_320_12

					if var_320_12 + var_320_6 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_12 + var_320_6
					end
				end

				arg_317_1.text_.text = var_320_9
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_13 = math.max(var_320_7, arg_317_1.talkMaxDuration)

			if var_320_6 <= arg_317_1.time_ and arg_317_1.time_ < var_320_6 + var_320_13 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_6) / var_320_13

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_6 + var_320_13 and arg_317_1.time_ < var_320_6 + var_320_13 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play410161078 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 410161078
		arg_321_1.duration_ = 15.4

		local var_321_0 = {
			ja = 15.4,
			CriLanguages = 11.2,
			zh = 11.2
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
				arg_321_0:Play410161079(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = arg_321_1.actors_["10059"].transform
			local var_324_1 = 0

			if var_324_1 < arg_321_1.time_ and arg_321_1.time_ <= var_324_1 + arg_324_0 then
				arg_321_1.var_.moveOldPos10059 = var_324_0.localPosition
				var_324_0.localScale = Vector3.New(1, 1, 1)

				arg_321_1:CheckSpriteTmpPos("10059", 3)

				local var_324_2 = var_324_0.childCount

				for iter_324_0 = 0, var_324_2 - 1 do
					local var_324_3 = var_324_0:GetChild(iter_324_0)

					if var_324_3.name == "" or not string.find(var_324_3.name, "split") then
						var_324_3.gameObject:SetActive(true)
					else
						var_324_3.gameObject:SetActive(false)
					end
				end
			end

			local var_324_4 = 0.001

			if var_324_1 <= arg_321_1.time_ and arg_321_1.time_ < var_324_1 + var_324_4 then
				local var_324_5 = (arg_321_1.time_ - var_324_1) / var_324_4
				local var_324_6 = Vector3.New(0, -530, 35)

				var_324_0.localPosition = Vector3.Lerp(arg_321_1.var_.moveOldPos10059, var_324_6, var_324_5)
			end

			if arg_321_1.time_ >= var_324_1 + var_324_4 and arg_321_1.time_ < var_324_1 + var_324_4 + arg_324_0 then
				var_324_0.localPosition = Vector3.New(0, -530, 35)
			end

			local var_324_7 = arg_321_1.actors_["10059"]
			local var_324_8 = 0

			if var_324_8 < arg_321_1.time_ and arg_321_1.time_ <= var_324_8 + arg_324_0 and arg_321_1.var_.actorSpriteComps10059 == nil then
				arg_321_1.var_.actorSpriteComps10059 = var_324_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_324_9 = 0.034

			if var_324_8 <= arg_321_1.time_ and arg_321_1.time_ < var_324_8 + var_324_9 then
				local var_324_10 = (arg_321_1.time_ - var_324_8) / var_324_9

				if arg_321_1.var_.actorSpriteComps10059 then
					for iter_324_1, iter_324_2 in pairs(arg_321_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_324_2 then
							local var_324_11 = Mathf.Lerp(iter_324_2.color.r, 1, var_324_10)

							iter_324_2.color = Color.New(var_324_11, var_324_11, var_324_11)
						end
					end
				end
			end

			if arg_321_1.time_ >= var_324_8 + var_324_9 and arg_321_1.time_ < var_324_8 + var_324_9 + arg_324_0 and arg_321_1.var_.actorSpriteComps10059 then
				local var_324_12 = 1

				for iter_324_3, iter_324_4 in pairs(arg_321_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_324_4 then
						iter_324_4.color = Color.New(var_324_12, var_324_12, var_324_12)
					end
				end

				arg_321_1.var_.actorSpriteComps10059 = nil
			end

			local var_324_13 = 0
			local var_324_14 = 1.25

			if var_324_13 < arg_321_1.time_ and arg_321_1.time_ <= var_324_13 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_15 = arg_321_1:FormatText(StoryNameCfg[596].name)

				arg_321_1.leftNameTxt_.text = var_324_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_16 = arg_321_1:GetWordFromCfg(410161078)
				local var_324_17 = arg_321_1:FormatText(var_324_16.content)

				arg_321_1.text_.text = var_324_17

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_18 = 50
				local var_324_19 = utf8.len(var_324_17)
				local var_324_20 = var_324_18 <= 0 and var_324_14 or var_324_14 * (var_324_19 / var_324_18)

				if var_324_20 > 0 and var_324_14 < var_324_20 then
					arg_321_1.talkMaxDuration = var_324_20

					if var_324_20 + var_324_13 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_20 + var_324_13
					end
				end

				arg_321_1.text_.text = var_324_17
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161078", "story_v_out_410161.awb") ~= 0 then
					local var_324_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161078", "story_v_out_410161.awb") / 1000

					if var_324_21 + var_324_13 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_21 + var_324_13
					end

					if var_324_16.prefab_name ~= "" and arg_321_1.actors_[var_324_16.prefab_name] ~= nil then
						local var_324_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_16.prefab_name].transform, "story_v_out_410161", "410161078", "story_v_out_410161.awb")

						arg_321_1:RecordAudio("410161078", var_324_22)
						arg_321_1:RecordAudio("410161078", var_324_22)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_410161", "410161078", "story_v_out_410161.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_410161", "410161078", "story_v_out_410161.awb")
				end

				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_23 = math.max(var_324_14, arg_321_1.talkMaxDuration)

			if var_324_13 <= arg_321_1.time_ and arg_321_1.time_ < var_324_13 + var_324_23 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_13) / var_324_23

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_13 + var_324_23 and arg_321_1.time_ < var_324_13 + var_324_23 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play410161079 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 410161079
		arg_325_1.duration_ = 3.333

		local var_325_0 = {
			ja = 3.133,
			CriLanguages = 3.333,
			zh = 3.333
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
				arg_325_0:Play410161080(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = arg_325_1.actors_["10059"].transform
			local var_328_1 = 0

			if var_328_1 < arg_325_1.time_ and arg_325_1.time_ <= var_328_1 + arg_328_0 then
				arg_325_1.var_.moveOldPos10059 = var_328_0.localPosition
				var_328_0.localScale = Vector3.New(1, 1, 1)

				arg_325_1:CheckSpriteTmpPos("10059", 3)

				local var_328_2 = var_328_0.childCount

				for iter_328_0 = 0, var_328_2 - 1 do
					local var_328_3 = var_328_0:GetChild(iter_328_0)

					if var_328_3.name == "" or not string.find(var_328_3.name, "split") then
						var_328_3.gameObject:SetActive(true)
					else
						var_328_3.gameObject:SetActive(false)
					end
				end
			end

			local var_328_4 = 0.001

			if var_328_1 <= arg_325_1.time_ and arg_325_1.time_ < var_328_1 + var_328_4 then
				local var_328_5 = (arg_325_1.time_ - var_328_1) / var_328_4
				local var_328_6 = Vector3.New(0, -530, 35)

				var_328_0.localPosition = Vector3.Lerp(arg_325_1.var_.moveOldPos10059, var_328_6, var_328_5)
			end

			if arg_325_1.time_ >= var_328_1 + var_328_4 and arg_325_1.time_ < var_328_1 + var_328_4 + arg_328_0 then
				var_328_0.localPosition = Vector3.New(0, -530, 35)
			end

			local var_328_7 = arg_325_1.actors_["10059"]
			local var_328_8 = 0

			if var_328_8 < arg_325_1.time_ and arg_325_1.time_ <= var_328_8 + arg_328_0 and arg_325_1.var_.actorSpriteComps10059 == nil then
				arg_325_1.var_.actorSpriteComps10059 = var_328_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_328_9 = 0.034

			if var_328_8 <= arg_325_1.time_ and arg_325_1.time_ < var_328_8 + var_328_9 then
				local var_328_10 = (arg_325_1.time_ - var_328_8) / var_328_9

				if arg_325_1.var_.actorSpriteComps10059 then
					for iter_328_1, iter_328_2 in pairs(arg_325_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_328_2 then
							local var_328_11 = Mathf.Lerp(iter_328_2.color.r, 1, var_328_10)

							iter_328_2.color = Color.New(var_328_11, var_328_11, var_328_11)
						end
					end
				end
			end

			if arg_325_1.time_ >= var_328_8 + var_328_9 and arg_325_1.time_ < var_328_8 + var_328_9 + arg_328_0 and arg_325_1.var_.actorSpriteComps10059 then
				local var_328_12 = 1

				for iter_328_3, iter_328_4 in pairs(arg_325_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_328_4 then
						iter_328_4.color = Color.New(var_328_12, var_328_12, var_328_12)
					end
				end

				arg_325_1.var_.actorSpriteComps10059 = nil
			end

			local var_328_13 = 0
			local var_328_14 = 0.275

			if var_328_13 < arg_325_1.time_ and arg_325_1.time_ <= var_328_13 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_15 = arg_325_1:FormatText(StoryNameCfg[596].name)

				arg_325_1.leftNameTxt_.text = var_328_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_16 = arg_325_1:GetWordFromCfg(410161079)
				local var_328_17 = arg_325_1:FormatText(var_328_16.content)

				arg_325_1.text_.text = var_328_17

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_18 = 11
				local var_328_19 = utf8.len(var_328_17)
				local var_328_20 = var_328_18 <= 0 and var_328_14 or var_328_14 * (var_328_19 / var_328_18)

				if var_328_20 > 0 and var_328_14 < var_328_20 then
					arg_325_1.talkMaxDuration = var_328_20

					if var_328_20 + var_328_13 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_20 + var_328_13
					end
				end

				arg_325_1.text_.text = var_328_17
				arg_325_1.typewritter.percent = 0

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161079", "story_v_out_410161.awb") ~= 0 then
					local var_328_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161079", "story_v_out_410161.awb") / 1000

					if var_328_21 + var_328_13 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_21 + var_328_13
					end

					if var_328_16.prefab_name ~= "" and arg_325_1.actors_[var_328_16.prefab_name] ~= nil then
						local var_328_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_16.prefab_name].transform, "story_v_out_410161", "410161079", "story_v_out_410161.awb")

						arg_325_1:RecordAudio("410161079", var_328_22)
						arg_325_1:RecordAudio("410161079", var_328_22)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_410161", "410161079", "story_v_out_410161.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_410161", "410161079", "story_v_out_410161.awb")
				end

				arg_325_1:RecordContent(arg_325_1.text_.text)
			end

			local var_328_23 = math.max(var_328_14, arg_325_1.talkMaxDuration)

			if var_328_13 <= arg_325_1.time_ and arg_325_1.time_ < var_328_13 + var_328_23 then
				arg_325_1.typewritter.percent = (arg_325_1.time_ - var_328_13) / var_328_23

				arg_325_1.typewritter:SetDirty()
			end

			if arg_325_1.time_ >= var_328_13 + var_328_23 and arg_325_1.time_ < var_328_13 + var_328_23 + arg_328_0 then
				arg_325_1.typewritter.percent = 1

				arg_325_1.typewritter:SetDirty()
				arg_325_1:ShowNextGo(true)
			end
		end
	end,
	Play410161080 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 410161080
		arg_329_1.duration_ = 12.566

		local var_329_0 = {
			ja = 12.566,
			CriLanguages = 4.5,
			zh = 4.5
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
				arg_329_0:Play410161081(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = arg_329_1.actors_["1061"].transform
			local var_332_1 = 0

			if var_332_1 < arg_329_1.time_ and arg_329_1.time_ <= var_332_1 + arg_332_0 then
				arg_329_1.var_.moveOldPos1061 = var_332_0.localPosition
				var_332_0.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("1061", 2)

				local var_332_2 = var_332_0.childCount

				for iter_332_0 = 0, var_332_2 - 1 do
					local var_332_3 = var_332_0:GetChild(iter_332_0)

					if var_332_3.name == "" or not string.find(var_332_3.name, "split") then
						var_332_3.gameObject:SetActive(true)
					else
						var_332_3.gameObject:SetActive(false)
					end
				end
			end

			local var_332_4 = 0.001

			if var_332_1 <= arg_329_1.time_ and arg_329_1.time_ < var_332_1 + var_332_4 then
				local var_332_5 = (arg_329_1.time_ - var_332_1) / var_332_4
				local var_332_6 = Vector3.New(-390, -490, 18)

				var_332_0.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos1061, var_332_6, var_332_5)
			end

			if arg_329_1.time_ >= var_332_1 + var_332_4 and arg_329_1.time_ < var_332_1 + var_332_4 + arg_332_0 then
				var_332_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_332_7 = arg_329_1.actors_["10059"].transform
			local var_332_8 = 0

			if var_332_8 < arg_329_1.time_ and arg_329_1.time_ <= var_332_8 + arg_332_0 then
				arg_329_1.var_.moveOldPos10059 = var_332_7.localPosition
				var_332_7.localScale = Vector3.New(1, 1, 1)

				arg_329_1:CheckSpriteTmpPos("10059", 4)

				local var_332_9 = var_332_7.childCount

				for iter_332_1 = 0, var_332_9 - 1 do
					local var_332_10 = var_332_7:GetChild(iter_332_1)

					if var_332_10.name == "" or not string.find(var_332_10.name, "split") then
						var_332_10.gameObject:SetActive(true)
					else
						var_332_10.gameObject:SetActive(false)
					end
				end
			end

			local var_332_11 = 0.001

			if var_332_8 <= arg_329_1.time_ and arg_329_1.time_ < var_332_8 + var_332_11 then
				local var_332_12 = (arg_329_1.time_ - var_332_8) / var_332_11
				local var_332_13 = Vector3.New(390, -530, 35)

				var_332_7.localPosition = Vector3.Lerp(arg_329_1.var_.moveOldPos10059, var_332_13, var_332_12)
			end

			if arg_329_1.time_ >= var_332_8 + var_332_11 and arg_329_1.time_ < var_332_8 + var_332_11 + arg_332_0 then
				var_332_7.localPosition = Vector3.New(390, -530, 35)
			end

			local var_332_14 = arg_329_1.actors_["1061"]
			local var_332_15 = 0

			if var_332_15 < arg_329_1.time_ and arg_329_1.time_ <= var_332_15 + arg_332_0 and arg_329_1.var_.actorSpriteComps1061 == nil then
				arg_329_1.var_.actorSpriteComps1061 = var_332_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_16 = 0.034

			if var_332_15 <= arg_329_1.time_ and arg_329_1.time_ < var_332_15 + var_332_16 then
				local var_332_17 = (arg_329_1.time_ - var_332_15) / var_332_16

				if arg_329_1.var_.actorSpriteComps1061 then
					for iter_332_2, iter_332_3 in pairs(arg_329_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_332_3 then
							local var_332_18 = Mathf.Lerp(iter_332_3.color.r, 1, var_332_17)

							iter_332_3.color = Color.New(var_332_18, var_332_18, var_332_18)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_15 + var_332_16 and arg_329_1.time_ < var_332_15 + var_332_16 + arg_332_0 and arg_329_1.var_.actorSpriteComps1061 then
				local var_332_19 = 1

				for iter_332_4, iter_332_5 in pairs(arg_329_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_332_5 then
						iter_332_5.color = Color.New(var_332_19, var_332_19, var_332_19)
					end
				end

				arg_329_1.var_.actorSpriteComps1061 = nil
			end

			local var_332_20 = arg_329_1.actors_["10059"]
			local var_332_21 = 0

			if var_332_21 < arg_329_1.time_ and arg_329_1.time_ <= var_332_21 + arg_332_0 and arg_329_1.var_.actorSpriteComps10059 == nil then
				arg_329_1.var_.actorSpriteComps10059 = var_332_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_332_22 = 0.034

			if var_332_21 <= arg_329_1.time_ and arg_329_1.time_ < var_332_21 + var_332_22 then
				local var_332_23 = (arg_329_1.time_ - var_332_21) / var_332_22

				if arg_329_1.var_.actorSpriteComps10059 then
					for iter_332_6, iter_332_7 in pairs(arg_329_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_332_7 then
							local var_332_24 = Mathf.Lerp(iter_332_7.color.r, 0.5, var_332_23)

							iter_332_7.color = Color.New(var_332_24, var_332_24, var_332_24)
						end
					end
				end
			end

			if arg_329_1.time_ >= var_332_21 + var_332_22 and arg_329_1.time_ < var_332_21 + var_332_22 + arg_332_0 and arg_329_1.var_.actorSpriteComps10059 then
				local var_332_25 = 0.5

				for iter_332_8, iter_332_9 in pairs(arg_329_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_332_9 then
						iter_332_9.color = Color.New(var_332_25, var_332_25, var_332_25)
					end
				end

				arg_329_1.var_.actorSpriteComps10059 = nil
			end

			local var_332_26 = 0
			local var_332_27 = 0.5

			if var_332_26 < arg_329_1.time_ and arg_329_1.time_ <= var_332_26 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_28 = arg_329_1:FormatText(StoryNameCfg[612].name)

				arg_329_1.leftNameTxt_.text = var_332_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_29 = arg_329_1:GetWordFromCfg(410161080)
				local var_332_30 = arg_329_1:FormatText(var_332_29.content)

				arg_329_1.text_.text = var_332_30

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_31 = 20
				local var_332_32 = utf8.len(var_332_30)
				local var_332_33 = var_332_31 <= 0 and var_332_27 or var_332_27 * (var_332_32 / var_332_31)

				if var_332_33 > 0 and var_332_27 < var_332_33 then
					arg_329_1.talkMaxDuration = var_332_33

					if var_332_33 + var_332_26 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_33 + var_332_26
					end
				end

				arg_329_1.text_.text = var_332_30
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161080", "story_v_out_410161.awb") ~= 0 then
					local var_332_34 = manager.audio:GetVoiceLength("story_v_out_410161", "410161080", "story_v_out_410161.awb") / 1000

					if var_332_34 + var_332_26 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_34 + var_332_26
					end

					if var_332_29.prefab_name ~= "" and arg_329_1.actors_[var_332_29.prefab_name] ~= nil then
						local var_332_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_29.prefab_name].transform, "story_v_out_410161", "410161080", "story_v_out_410161.awb")

						arg_329_1:RecordAudio("410161080", var_332_35)
						arg_329_1:RecordAudio("410161080", var_332_35)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_410161", "410161080", "story_v_out_410161.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_410161", "410161080", "story_v_out_410161.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_36 = math.max(var_332_27, arg_329_1.talkMaxDuration)

			if var_332_26 <= arg_329_1.time_ and arg_329_1.time_ < var_332_26 + var_332_36 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_26) / var_332_36

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_26 + var_332_36 and arg_329_1.time_ < var_332_26 + var_332_36 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play410161081 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 410161081
		arg_333_1.duration_ = 9.833

		local var_333_0 = {
			ja = 9.833,
			CriLanguages = 8,
			zh = 8
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
				arg_333_0:Play410161082(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = arg_333_1.actors_["1061"].transform
			local var_336_1 = 0

			if var_336_1 < arg_333_1.time_ and arg_333_1.time_ <= var_336_1 + arg_336_0 then
				arg_333_1.var_.moveOldPos1061 = var_336_0.localPosition
				var_336_0.localScale = Vector3.New(1, 1, 1)

				arg_333_1:CheckSpriteTmpPos("1061", 2)

				local var_336_2 = var_336_0.childCount

				for iter_336_0 = 0, var_336_2 - 1 do
					local var_336_3 = var_336_0:GetChild(iter_336_0)

					if var_336_3.name == "" or not string.find(var_336_3.name, "split") then
						var_336_3.gameObject:SetActive(true)
					else
						var_336_3.gameObject:SetActive(false)
					end
				end
			end

			local var_336_4 = 0.001

			if var_336_1 <= arg_333_1.time_ and arg_333_1.time_ < var_336_1 + var_336_4 then
				local var_336_5 = (arg_333_1.time_ - var_336_1) / var_336_4
				local var_336_6 = Vector3.New(-390, -490, 18)

				var_336_0.localPosition = Vector3.Lerp(arg_333_1.var_.moveOldPos1061, var_336_6, var_336_5)
			end

			if arg_333_1.time_ >= var_336_1 + var_336_4 and arg_333_1.time_ < var_336_1 + var_336_4 + arg_336_0 then
				var_336_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_336_7 = arg_333_1.actors_["1061"]
			local var_336_8 = 0

			if var_336_8 < arg_333_1.time_ and arg_333_1.time_ <= var_336_8 + arg_336_0 and arg_333_1.var_.actorSpriteComps1061 == nil then
				arg_333_1.var_.actorSpriteComps1061 = var_336_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_336_9 = 0.034

			if var_336_8 <= arg_333_1.time_ and arg_333_1.time_ < var_336_8 + var_336_9 then
				local var_336_10 = (arg_333_1.time_ - var_336_8) / var_336_9

				if arg_333_1.var_.actorSpriteComps1061 then
					for iter_336_1, iter_336_2 in pairs(arg_333_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_336_2 then
							local var_336_11 = Mathf.Lerp(iter_336_2.color.r, 1, var_336_10)

							iter_336_2.color = Color.New(var_336_11, var_336_11, var_336_11)
						end
					end
				end
			end

			if arg_333_1.time_ >= var_336_8 + var_336_9 and arg_333_1.time_ < var_336_8 + var_336_9 + arg_336_0 and arg_333_1.var_.actorSpriteComps1061 then
				local var_336_12 = 1

				for iter_336_3, iter_336_4 in pairs(arg_333_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_336_4 then
						iter_336_4.color = Color.New(var_336_12, var_336_12, var_336_12)
					end
				end

				arg_333_1.var_.actorSpriteComps1061 = nil
			end

			local var_336_13 = 0
			local var_336_14 = 0.925

			if var_336_13 < arg_333_1.time_ and arg_333_1.time_ <= var_336_13 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_15 = arg_333_1:FormatText(StoryNameCfg[612].name)

				arg_333_1.leftNameTxt_.text = var_336_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_16 = arg_333_1:GetWordFromCfg(410161081)
				local var_336_17 = arg_333_1:FormatText(var_336_16.content)

				arg_333_1.text_.text = var_336_17

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_18 = 37
				local var_336_19 = utf8.len(var_336_17)
				local var_336_20 = var_336_18 <= 0 and var_336_14 or var_336_14 * (var_336_19 / var_336_18)

				if var_336_20 > 0 and var_336_14 < var_336_20 then
					arg_333_1.talkMaxDuration = var_336_20

					if var_336_20 + var_336_13 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_20 + var_336_13
					end
				end

				arg_333_1.text_.text = var_336_17
				arg_333_1.typewritter.percent = 0

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161081", "story_v_out_410161.awb") ~= 0 then
					local var_336_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161081", "story_v_out_410161.awb") / 1000

					if var_336_21 + var_336_13 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_21 + var_336_13
					end

					if var_336_16.prefab_name ~= "" and arg_333_1.actors_[var_336_16.prefab_name] ~= nil then
						local var_336_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_16.prefab_name].transform, "story_v_out_410161", "410161081", "story_v_out_410161.awb")

						arg_333_1:RecordAudio("410161081", var_336_22)
						arg_333_1:RecordAudio("410161081", var_336_22)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_410161", "410161081", "story_v_out_410161.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_410161", "410161081", "story_v_out_410161.awb")
				end

				arg_333_1:RecordContent(arg_333_1.text_.text)
			end

			local var_336_23 = math.max(var_336_14, arg_333_1.talkMaxDuration)

			if var_336_13 <= arg_333_1.time_ and arg_333_1.time_ < var_336_13 + var_336_23 then
				arg_333_1.typewritter.percent = (arg_333_1.time_ - var_336_13) / var_336_23

				arg_333_1.typewritter:SetDirty()
			end

			if arg_333_1.time_ >= var_336_13 + var_336_23 and arg_333_1.time_ < var_336_13 + var_336_23 + arg_336_0 then
				arg_333_1.typewritter.percent = 1

				arg_333_1.typewritter:SetDirty()
				arg_333_1:ShowNextGo(true)
			end
		end
	end,
	Play410161082 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 410161082
		arg_337_1.duration_ = 13.2

		local var_337_0 = {
			ja = 13.2,
			CriLanguages = 12.533,
			zh = 12.533
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
				arg_337_0:Play410161083(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = arg_337_1.actors_["1061"].transform
			local var_340_1 = 0

			if var_340_1 < arg_337_1.time_ and arg_337_1.time_ <= var_340_1 + arg_340_0 then
				arg_337_1.var_.moveOldPos1061 = var_340_0.localPosition
				var_340_0.localScale = Vector3.New(1, 1, 1)

				arg_337_1:CheckSpriteTmpPos("1061", 2)

				local var_340_2 = var_340_0.childCount

				for iter_340_0 = 0, var_340_2 - 1 do
					local var_340_3 = var_340_0:GetChild(iter_340_0)

					if var_340_3.name == "" or not string.find(var_340_3.name, "split") then
						var_340_3.gameObject:SetActive(true)
					else
						var_340_3.gameObject:SetActive(false)
					end
				end
			end

			local var_340_4 = 0.001

			if var_340_1 <= arg_337_1.time_ and arg_337_1.time_ < var_340_1 + var_340_4 then
				local var_340_5 = (arg_337_1.time_ - var_340_1) / var_340_4
				local var_340_6 = Vector3.New(-390, -490, 18)

				var_340_0.localPosition = Vector3.Lerp(arg_337_1.var_.moveOldPos1061, var_340_6, var_340_5)
			end

			if arg_337_1.time_ >= var_340_1 + var_340_4 and arg_337_1.time_ < var_340_1 + var_340_4 + arg_340_0 then
				var_340_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_340_7 = arg_337_1.actors_["1061"]
			local var_340_8 = 0

			if var_340_8 < arg_337_1.time_ and arg_337_1.time_ <= var_340_8 + arg_340_0 and arg_337_1.var_.actorSpriteComps1061 == nil then
				arg_337_1.var_.actorSpriteComps1061 = var_340_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_340_9 = 0.034

			if var_340_8 <= arg_337_1.time_ and arg_337_1.time_ < var_340_8 + var_340_9 then
				local var_340_10 = (arg_337_1.time_ - var_340_8) / var_340_9

				if arg_337_1.var_.actorSpriteComps1061 then
					for iter_340_1, iter_340_2 in pairs(arg_337_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_340_2 then
							local var_340_11 = Mathf.Lerp(iter_340_2.color.r, 1, var_340_10)

							iter_340_2.color = Color.New(var_340_11, var_340_11, var_340_11)
						end
					end
				end
			end

			if arg_337_1.time_ >= var_340_8 + var_340_9 and arg_337_1.time_ < var_340_8 + var_340_9 + arg_340_0 and arg_337_1.var_.actorSpriteComps1061 then
				local var_340_12 = 1

				for iter_340_3, iter_340_4 in pairs(arg_337_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_340_4 then
						iter_340_4.color = Color.New(var_340_12, var_340_12, var_340_12)
					end
				end

				arg_337_1.var_.actorSpriteComps1061 = nil
			end

			local var_340_13 = 0
			local var_340_14 = 1.425

			if var_340_13 < arg_337_1.time_ and arg_337_1.time_ <= var_340_13 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_15 = arg_337_1:FormatText(StoryNameCfg[612].name)

				arg_337_1.leftNameTxt_.text = var_340_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_16 = arg_337_1:GetWordFromCfg(410161082)
				local var_340_17 = arg_337_1:FormatText(var_340_16.content)

				arg_337_1.text_.text = var_340_17

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_18 = 57
				local var_340_19 = utf8.len(var_340_17)
				local var_340_20 = var_340_18 <= 0 and var_340_14 or var_340_14 * (var_340_19 / var_340_18)

				if var_340_20 > 0 and var_340_14 < var_340_20 then
					arg_337_1.talkMaxDuration = var_340_20

					if var_340_20 + var_340_13 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_20 + var_340_13
					end
				end

				arg_337_1.text_.text = var_340_17
				arg_337_1.typewritter.percent = 0

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161082", "story_v_out_410161.awb") ~= 0 then
					local var_340_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161082", "story_v_out_410161.awb") / 1000

					if var_340_21 + var_340_13 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_21 + var_340_13
					end

					if var_340_16.prefab_name ~= "" and arg_337_1.actors_[var_340_16.prefab_name] ~= nil then
						local var_340_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_16.prefab_name].transform, "story_v_out_410161", "410161082", "story_v_out_410161.awb")

						arg_337_1:RecordAudio("410161082", var_340_22)
						arg_337_1:RecordAudio("410161082", var_340_22)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_410161", "410161082", "story_v_out_410161.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_410161", "410161082", "story_v_out_410161.awb")
				end

				arg_337_1:RecordContent(arg_337_1.text_.text)
			end

			local var_340_23 = math.max(var_340_14, arg_337_1.talkMaxDuration)

			if var_340_13 <= arg_337_1.time_ and arg_337_1.time_ < var_340_13 + var_340_23 then
				arg_337_1.typewritter.percent = (arg_337_1.time_ - var_340_13) / var_340_23

				arg_337_1.typewritter:SetDirty()
			end

			if arg_337_1.time_ >= var_340_13 + var_340_23 and arg_337_1.time_ < var_340_13 + var_340_23 + arg_340_0 then
				arg_337_1.typewritter.percent = 1

				arg_337_1.typewritter:SetDirty()
				arg_337_1:ShowNextGo(true)
			end
		end
	end,
	Play410161083 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 410161083
		arg_341_1.duration_ = 6.733

		local var_341_0 = {
			ja = 6.733,
			CriLanguages = 4.466,
			zh = 4.466
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
				arg_341_0:Play410161084(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = arg_341_1.actors_["10059"].transform
			local var_344_1 = 0

			if var_344_1 < arg_341_1.time_ and arg_341_1.time_ <= var_344_1 + arg_344_0 then
				arg_341_1.var_.moveOldPos10059 = var_344_0.localPosition
				var_344_0.localScale = Vector3.New(1, 1, 1)

				arg_341_1:CheckSpriteTmpPos("10059", 4)

				local var_344_2 = var_344_0.childCount

				for iter_344_0 = 0, var_344_2 - 1 do
					local var_344_3 = var_344_0:GetChild(iter_344_0)

					if var_344_3.name == "" or not string.find(var_344_3.name, "split") then
						var_344_3.gameObject:SetActive(true)
					else
						var_344_3.gameObject:SetActive(false)
					end
				end
			end

			local var_344_4 = 0.001

			if var_344_1 <= arg_341_1.time_ and arg_341_1.time_ < var_344_1 + var_344_4 then
				local var_344_5 = (arg_341_1.time_ - var_344_1) / var_344_4
				local var_344_6 = Vector3.New(390, -530, 35)

				var_344_0.localPosition = Vector3.Lerp(arg_341_1.var_.moveOldPos10059, var_344_6, var_344_5)
			end

			if arg_341_1.time_ >= var_344_1 + var_344_4 and arg_341_1.time_ < var_344_1 + var_344_4 + arg_344_0 then
				var_344_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_344_7 = arg_341_1.actors_["10059"]
			local var_344_8 = 0

			if var_344_8 < arg_341_1.time_ and arg_341_1.time_ <= var_344_8 + arg_344_0 and arg_341_1.var_.actorSpriteComps10059 == nil then
				arg_341_1.var_.actorSpriteComps10059 = var_344_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_9 = 0.034

			if var_344_8 <= arg_341_1.time_ and arg_341_1.time_ < var_344_8 + var_344_9 then
				local var_344_10 = (arg_341_1.time_ - var_344_8) / var_344_9

				if arg_341_1.var_.actorSpriteComps10059 then
					for iter_344_1, iter_344_2 in pairs(arg_341_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_344_2 then
							local var_344_11 = Mathf.Lerp(iter_344_2.color.r, 1, var_344_10)

							iter_344_2.color = Color.New(var_344_11, var_344_11, var_344_11)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_8 + var_344_9 and arg_341_1.time_ < var_344_8 + var_344_9 + arg_344_0 and arg_341_1.var_.actorSpriteComps10059 then
				local var_344_12 = 1

				for iter_344_3, iter_344_4 in pairs(arg_341_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_344_4 then
						iter_344_4.color = Color.New(var_344_12, var_344_12, var_344_12)
					end
				end

				arg_341_1.var_.actorSpriteComps10059 = nil
			end

			local var_344_13 = arg_341_1.actors_["1061"]
			local var_344_14 = 0

			if var_344_14 < arg_341_1.time_ and arg_341_1.time_ <= var_344_14 + arg_344_0 and arg_341_1.var_.actorSpriteComps1061 == nil then
				arg_341_1.var_.actorSpriteComps1061 = var_344_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_344_15 = 0.034

			if var_344_14 <= arg_341_1.time_ and arg_341_1.time_ < var_344_14 + var_344_15 then
				local var_344_16 = (arg_341_1.time_ - var_344_14) / var_344_15

				if arg_341_1.var_.actorSpriteComps1061 then
					for iter_344_5, iter_344_6 in pairs(arg_341_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_344_6 then
							local var_344_17 = Mathf.Lerp(iter_344_6.color.r, 0.5, var_344_16)

							iter_344_6.color = Color.New(var_344_17, var_344_17, var_344_17)
						end
					end
				end
			end

			if arg_341_1.time_ >= var_344_14 + var_344_15 and arg_341_1.time_ < var_344_14 + var_344_15 + arg_344_0 and arg_341_1.var_.actorSpriteComps1061 then
				local var_344_18 = 0.5

				for iter_344_7, iter_344_8 in pairs(arg_341_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_344_8 then
						iter_344_8.color = Color.New(var_344_18, var_344_18, var_344_18)
					end
				end

				arg_341_1.var_.actorSpriteComps1061 = nil
			end

			local var_344_19 = 0
			local var_344_20 = 0.325

			if var_344_19 < arg_341_1.time_ and arg_341_1.time_ <= var_344_19 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_21 = arg_341_1:FormatText(StoryNameCfg[596].name)

				arg_341_1.leftNameTxt_.text = var_344_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_22 = arg_341_1:GetWordFromCfg(410161083)
				local var_344_23 = arg_341_1:FormatText(var_344_22.content)

				arg_341_1.text_.text = var_344_23

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_24 = 13
				local var_344_25 = utf8.len(var_344_23)
				local var_344_26 = var_344_24 <= 0 and var_344_20 or var_344_20 * (var_344_25 / var_344_24)

				if var_344_26 > 0 and var_344_20 < var_344_26 then
					arg_341_1.talkMaxDuration = var_344_26

					if var_344_26 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_26 + var_344_19
					end
				end

				arg_341_1.text_.text = var_344_23
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161083", "story_v_out_410161.awb") ~= 0 then
					local var_344_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161083", "story_v_out_410161.awb") / 1000

					if var_344_27 + var_344_19 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_27 + var_344_19
					end

					if var_344_22.prefab_name ~= "" and arg_341_1.actors_[var_344_22.prefab_name] ~= nil then
						local var_344_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_22.prefab_name].transform, "story_v_out_410161", "410161083", "story_v_out_410161.awb")

						arg_341_1:RecordAudio("410161083", var_344_28)
						arg_341_1:RecordAudio("410161083", var_344_28)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_410161", "410161083", "story_v_out_410161.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_410161", "410161083", "story_v_out_410161.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_29 = math.max(var_344_20, arg_341_1.talkMaxDuration)

			if var_344_19 <= arg_341_1.time_ and arg_341_1.time_ < var_344_19 + var_344_29 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_19) / var_344_29

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_19 + var_344_29 and arg_341_1.time_ < var_344_19 + var_344_29 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play410161084 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 410161084
		arg_345_1.duration_ = 10.966

		local var_345_0 = {
			ja = 10.966,
			CriLanguages = 8.1,
			zh = 8.1
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
				arg_345_0:Play410161085(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = arg_345_1.actors_["10059"].transform
			local var_348_1 = 0

			if var_348_1 < arg_345_1.time_ and arg_345_1.time_ <= var_348_1 + arg_348_0 then
				arg_345_1.var_.moveOldPos10059 = var_348_0.localPosition
				var_348_0.localScale = Vector3.New(1, 1, 1)

				arg_345_1:CheckSpriteTmpPos("10059", 4)

				local var_348_2 = var_348_0.childCount

				for iter_348_0 = 0, var_348_2 - 1 do
					local var_348_3 = var_348_0:GetChild(iter_348_0)

					if var_348_3.name == "" or not string.find(var_348_3.name, "split") then
						var_348_3.gameObject:SetActive(true)
					else
						var_348_3.gameObject:SetActive(false)
					end
				end
			end

			local var_348_4 = 0.001

			if var_348_1 <= arg_345_1.time_ and arg_345_1.time_ < var_348_1 + var_348_4 then
				local var_348_5 = (arg_345_1.time_ - var_348_1) / var_348_4
				local var_348_6 = Vector3.New(390, -530, 35)

				var_348_0.localPosition = Vector3.Lerp(arg_345_1.var_.moveOldPos10059, var_348_6, var_348_5)
			end

			if arg_345_1.time_ >= var_348_1 + var_348_4 and arg_345_1.time_ < var_348_1 + var_348_4 + arg_348_0 then
				var_348_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_348_7 = arg_345_1.actors_["10059"]
			local var_348_8 = 0

			if var_348_8 < arg_345_1.time_ and arg_345_1.time_ <= var_348_8 + arg_348_0 and arg_345_1.var_.actorSpriteComps10059 == nil then
				arg_345_1.var_.actorSpriteComps10059 = var_348_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_348_9 = 0.034

			if var_348_8 <= arg_345_1.time_ and arg_345_1.time_ < var_348_8 + var_348_9 then
				local var_348_10 = (arg_345_1.time_ - var_348_8) / var_348_9

				if arg_345_1.var_.actorSpriteComps10059 then
					for iter_348_1, iter_348_2 in pairs(arg_345_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_348_2 then
							local var_348_11 = Mathf.Lerp(iter_348_2.color.r, 1, var_348_10)

							iter_348_2.color = Color.New(var_348_11, var_348_11, var_348_11)
						end
					end
				end
			end

			if arg_345_1.time_ >= var_348_8 + var_348_9 and arg_345_1.time_ < var_348_8 + var_348_9 + arg_348_0 and arg_345_1.var_.actorSpriteComps10059 then
				local var_348_12 = 1

				for iter_348_3, iter_348_4 in pairs(arg_345_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_348_4 then
						iter_348_4.color = Color.New(var_348_12, var_348_12, var_348_12)
					end
				end

				arg_345_1.var_.actorSpriteComps10059 = nil
			end

			local var_348_13 = 0
			local var_348_14 = 0.925

			if var_348_13 < arg_345_1.time_ and arg_345_1.time_ <= var_348_13 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_15 = arg_345_1:FormatText(StoryNameCfg[596].name)

				arg_345_1.leftNameTxt_.text = var_348_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_16 = arg_345_1:GetWordFromCfg(410161084)
				local var_348_17 = arg_345_1:FormatText(var_348_16.content)

				arg_345_1.text_.text = var_348_17

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_18 = 37
				local var_348_19 = utf8.len(var_348_17)
				local var_348_20 = var_348_18 <= 0 and var_348_14 or var_348_14 * (var_348_19 / var_348_18)

				if var_348_20 > 0 and var_348_14 < var_348_20 then
					arg_345_1.talkMaxDuration = var_348_20

					if var_348_20 + var_348_13 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_20 + var_348_13
					end
				end

				arg_345_1.text_.text = var_348_17
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161084", "story_v_out_410161.awb") ~= 0 then
					local var_348_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161084", "story_v_out_410161.awb") / 1000

					if var_348_21 + var_348_13 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_21 + var_348_13
					end

					if var_348_16.prefab_name ~= "" and arg_345_1.actors_[var_348_16.prefab_name] ~= nil then
						local var_348_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_16.prefab_name].transform, "story_v_out_410161", "410161084", "story_v_out_410161.awb")

						arg_345_1:RecordAudio("410161084", var_348_22)
						arg_345_1:RecordAudio("410161084", var_348_22)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_410161", "410161084", "story_v_out_410161.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_410161", "410161084", "story_v_out_410161.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_23 = math.max(var_348_14, arg_345_1.talkMaxDuration)

			if var_348_13 <= arg_345_1.time_ and arg_345_1.time_ < var_348_13 + var_348_23 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_13) / var_348_23

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_13 + var_348_23 and arg_345_1.time_ < var_348_13 + var_348_23 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play410161085 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 410161085
		arg_349_1.duration_ = 7.966

		local var_349_0 = {
			ja = 7.966,
			CriLanguages = 2.966,
			zh = 2.966
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
				arg_349_0:Play410161086(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = arg_349_1.actors_["1061"].transform
			local var_352_1 = 0

			if var_352_1 < arg_349_1.time_ and arg_349_1.time_ <= var_352_1 + arg_352_0 then
				arg_349_1.var_.moveOldPos1061 = var_352_0.localPosition
				var_352_0.localScale = Vector3.New(1, 1, 1)

				arg_349_1:CheckSpriteTmpPos("1061", 2)

				local var_352_2 = var_352_0.childCount

				for iter_352_0 = 0, var_352_2 - 1 do
					local var_352_3 = var_352_0:GetChild(iter_352_0)

					if var_352_3.name == "" or not string.find(var_352_3.name, "split") then
						var_352_3.gameObject:SetActive(true)
					else
						var_352_3.gameObject:SetActive(false)
					end
				end
			end

			local var_352_4 = 0.001

			if var_352_1 <= arg_349_1.time_ and arg_349_1.time_ < var_352_1 + var_352_4 then
				local var_352_5 = (arg_349_1.time_ - var_352_1) / var_352_4
				local var_352_6 = Vector3.New(-390, -490, 18)

				var_352_0.localPosition = Vector3.Lerp(arg_349_1.var_.moveOldPos1061, var_352_6, var_352_5)
			end

			if arg_349_1.time_ >= var_352_1 + var_352_4 and arg_349_1.time_ < var_352_1 + var_352_4 + arg_352_0 then
				var_352_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_352_7 = arg_349_1.actors_["1061"]
			local var_352_8 = 0

			if var_352_8 < arg_349_1.time_ and arg_349_1.time_ <= var_352_8 + arg_352_0 and arg_349_1.var_.actorSpriteComps1061 == nil then
				arg_349_1.var_.actorSpriteComps1061 = var_352_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_9 = 0.034

			if var_352_8 <= arg_349_1.time_ and arg_349_1.time_ < var_352_8 + var_352_9 then
				local var_352_10 = (arg_349_1.time_ - var_352_8) / var_352_9

				if arg_349_1.var_.actorSpriteComps1061 then
					for iter_352_1, iter_352_2 in pairs(arg_349_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_352_2 then
							local var_352_11 = Mathf.Lerp(iter_352_2.color.r, 1, var_352_10)

							iter_352_2.color = Color.New(var_352_11, var_352_11, var_352_11)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_8 + var_352_9 and arg_349_1.time_ < var_352_8 + var_352_9 + arg_352_0 and arg_349_1.var_.actorSpriteComps1061 then
				local var_352_12 = 1

				for iter_352_3, iter_352_4 in pairs(arg_349_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_352_4 then
						iter_352_4.color = Color.New(var_352_12, var_352_12, var_352_12)
					end
				end

				arg_349_1.var_.actorSpriteComps1061 = nil
			end

			local var_352_13 = arg_349_1.actors_["10059"]
			local var_352_14 = 0

			if var_352_14 < arg_349_1.time_ and arg_349_1.time_ <= var_352_14 + arg_352_0 and arg_349_1.var_.actorSpriteComps10059 == nil then
				arg_349_1.var_.actorSpriteComps10059 = var_352_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_352_15 = 0.034

			if var_352_14 <= arg_349_1.time_ and arg_349_1.time_ < var_352_14 + var_352_15 then
				local var_352_16 = (arg_349_1.time_ - var_352_14) / var_352_15

				if arg_349_1.var_.actorSpriteComps10059 then
					for iter_352_5, iter_352_6 in pairs(arg_349_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_352_6 then
							local var_352_17 = Mathf.Lerp(iter_352_6.color.r, 0.5, var_352_16)

							iter_352_6.color = Color.New(var_352_17, var_352_17, var_352_17)
						end
					end
				end
			end

			if arg_349_1.time_ >= var_352_14 + var_352_15 and arg_349_1.time_ < var_352_14 + var_352_15 + arg_352_0 and arg_349_1.var_.actorSpriteComps10059 then
				local var_352_18 = 0.5

				for iter_352_7, iter_352_8 in pairs(arg_349_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_352_8 then
						iter_352_8.color = Color.New(var_352_18, var_352_18, var_352_18)
					end
				end

				arg_349_1.var_.actorSpriteComps10059 = nil
			end

			local var_352_19 = 0
			local var_352_20 = 0.375

			if var_352_19 < arg_349_1.time_ and arg_349_1.time_ <= var_352_19 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_21 = arg_349_1:FormatText(StoryNameCfg[612].name)

				arg_349_1.leftNameTxt_.text = var_352_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_22 = arg_349_1:GetWordFromCfg(410161085)
				local var_352_23 = arg_349_1:FormatText(var_352_22.content)

				arg_349_1.text_.text = var_352_23

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_24 = 15
				local var_352_25 = utf8.len(var_352_23)
				local var_352_26 = var_352_24 <= 0 and var_352_20 or var_352_20 * (var_352_25 / var_352_24)

				if var_352_26 > 0 and var_352_20 < var_352_26 then
					arg_349_1.talkMaxDuration = var_352_26

					if var_352_26 + var_352_19 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_26 + var_352_19
					end
				end

				arg_349_1.text_.text = var_352_23
				arg_349_1.typewritter.percent = 0

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161085", "story_v_out_410161.awb") ~= 0 then
					local var_352_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161085", "story_v_out_410161.awb") / 1000

					if var_352_27 + var_352_19 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_27 + var_352_19
					end

					if var_352_22.prefab_name ~= "" and arg_349_1.actors_[var_352_22.prefab_name] ~= nil then
						local var_352_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_22.prefab_name].transform, "story_v_out_410161", "410161085", "story_v_out_410161.awb")

						arg_349_1:RecordAudio("410161085", var_352_28)
						arg_349_1:RecordAudio("410161085", var_352_28)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_410161", "410161085", "story_v_out_410161.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_410161", "410161085", "story_v_out_410161.awb")
				end

				arg_349_1:RecordContent(arg_349_1.text_.text)
			end

			local var_352_29 = math.max(var_352_20, arg_349_1.talkMaxDuration)

			if var_352_19 <= arg_349_1.time_ and arg_349_1.time_ < var_352_19 + var_352_29 then
				arg_349_1.typewritter.percent = (arg_349_1.time_ - var_352_19) / var_352_29

				arg_349_1.typewritter:SetDirty()
			end

			if arg_349_1.time_ >= var_352_19 + var_352_29 and arg_349_1.time_ < var_352_19 + var_352_29 + arg_352_0 then
				arg_349_1.typewritter.percent = 1

				arg_349_1.typewritter:SetDirty()
				arg_349_1:ShowNextGo(true)
			end
		end
	end,
	Play410161086 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 410161086
		arg_353_1.duration_ = 8.666

		local var_353_0 = {
			ja = 8.666,
			CriLanguages = 7.066,
			zh = 7.066
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
				arg_353_0:Play410161087(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = arg_353_1.actors_["10059"].transform
			local var_356_1 = 0

			if var_356_1 < arg_353_1.time_ and arg_353_1.time_ <= var_356_1 + arg_356_0 then
				arg_353_1.var_.moveOldPos10059 = var_356_0.localPosition
				var_356_0.localScale = Vector3.New(1, 1, 1)

				arg_353_1:CheckSpriteTmpPos("10059", 4)

				local var_356_2 = var_356_0.childCount

				for iter_356_0 = 0, var_356_2 - 1 do
					local var_356_3 = var_356_0:GetChild(iter_356_0)

					if var_356_3.name == "" or not string.find(var_356_3.name, "split") then
						var_356_3.gameObject:SetActive(true)
					else
						var_356_3.gameObject:SetActive(false)
					end
				end
			end

			local var_356_4 = 0.001

			if var_356_1 <= arg_353_1.time_ and arg_353_1.time_ < var_356_1 + var_356_4 then
				local var_356_5 = (arg_353_1.time_ - var_356_1) / var_356_4
				local var_356_6 = Vector3.New(390, -530, 35)

				var_356_0.localPosition = Vector3.Lerp(arg_353_1.var_.moveOldPos10059, var_356_6, var_356_5)
			end

			if arg_353_1.time_ >= var_356_1 + var_356_4 and arg_353_1.time_ < var_356_1 + var_356_4 + arg_356_0 then
				var_356_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_356_7 = arg_353_1.actors_["10059"]
			local var_356_8 = 0

			if var_356_8 < arg_353_1.time_ and arg_353_1.time_ <= var_356_8 + arg_356_0 and arg_353_1.var_.actorSpriteComps10059 == nil then
				arg_353_1.var_.actorSpriteComps10059 = var_356_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_9 = 0.034

			if var_356_8 <= arg_353_1.time_ and arg_353_1.time_ < var_356_8 + var_356_9 then
				local var_356_10 = (arg_353_1.time_ - var_356_8) / var_356_9

				if arg_353_1.var_.actorSpriteComps10059 then
					for iter_356_1, iter_356_2 in pairs(arg_353_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_356_2 then
							local var_356_11 = Mathf.Lerp(iter_356_2.color.r, 1, var_356_10)

							iter_356_2.color = Color.New(var_356_11, var_356_11, var_356_11)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_8 + var_356_9 and arg_353_1.time_ < var_356_8 + var_356_9 + arg_356_0 and arg_353_1.var_.actorSpriteComps10059 then
				local var_356_12 = 1

				for iter_356_3, iter_356_4 in pairs(arg_353_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_356_4 then
						iter_356_4.color = Color.New(var_356_12, var_356_12, var_356_12)
					end
				end

				arg_353_1.var_.actorSpriteComps10059 = nil
			end

			local var_356_13 = arg_353_1.actors_["1061"]
			local var_356_14 = 0

			if var_356_14 < arg_353_1.time_ and arg_353_1.time_ <= var_356_14 + arg_356_0 and arg_353_1.var_.actorSpriteComps1061 == nil then
				arg_353_1.var_.actorSpriteComps1061 = var_356_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_356_15 = 0.034

			if var_356_14 <= arg_353_1.time_ and arg_353_1.time_ < var_356_14 + var_356_15 then
				local var_356_16 = (arg_353_1.time_ - var_356_14) / var_356_15

				if arg_353_1.var_.actorSpriteComps1061 then
					for iter_356_5, iter_356_6 in pairs(arg_353_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_356_6 then
							local var_356_17 = Mathf.Lerp(iter_356_6.color.r, 0.5, var_356_16)

							iter_356_6.color = Color.New(var_356_17, var_356_17, var_356_17)
						end
					end
				end
			end

			if arg_353_1.time_ >= var_356_14 + var_356_15 and arg_353_1.time_ < var_356_14 + var_356_15 + arg_356_0 and arg_353_1.var_.actorSpriteComps1061 then
				local var_356_18 = 0.5

				for iter_356_7, iter_356_8 in pairs(arg_353_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_356_8 then
						iter_356_8.color = Color.New(var_356_18, var_356_18, var_356_18)
					end
				end

				arg_353_1.var_.actorSpriteComps1061 = nil
			end

			local var_356_19 = 0
			local var_356_20 = 0.925

			if var_356_19 < arg_353_1.time_ and arg_353_1.time_ <= var_356_19 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_21 = arg_353_1:FormatText(StoryNameCfg[596].name)

				arg_353_1.leftNameTxt_.text = var_356_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_22 = arg_353_1:GetWordFromCfg(410161086)
				local var_356_23 = arg_353_1:FormatText(var_356_22.content)

				arg_353_1.text_.text = var_356_23

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_24 = 37
				local var_356_25 = utf8.len(var_356_23)
				local var_356_26 = var_356_24 <= 0 and var_356_20 or var_356_20 * (var_356_25 / var_356_24)

				if var_356_26 > 0 and var_356_20 < var_356_26 then
					arg_353_1.talkMaxDuration = var_356_26

					if var_356_26 + var_356_19 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_26 + var_356_19
					end
				end

				arg_353_1.text_.text = var_356_23
				arg_353_1.typewritter.percent = 0

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161086", "story_v_out_410161.awb") ~= 0 then
					local var_356_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161086", "story_v_out_410161.awb") / 1000

					if var_356_27 + var_356_19 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_27 + var_356_19
					end

					if var_356_22.prefab_name ~= "" and arg_353_1.actors_[var_356_22.prefab_name] ~= nil then
						local var_356_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_22.prefab_name].transform, "story_v_out_410161", "410161086", "story_v_out_410161.awb")

						arg_353_1:RecordAudio("410161086", var_356_28)
						arg_353_1:RecordAudio("410161086", var_356_28)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_410161", "410161086", "story_v_out_410161.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_410161", "410161086", "story_v_out_410161.awb")
				end

				arg_353_1:RecordContent(arg_353_1.text_.text)
			end

			local var_356_29 = math.max(var_356_20, arg_353_1.talkMaxDuration)

			if var_356_19 <= arg_353_1.time_ and arg_353_1.time_ < var_356_19 + var_356_29 then
				arg_353_1.typewritter.percent = (arg_353_1.time_ - var_356_19) / var_356_29

				arg_353_1.typewritter:SetDirty()
			end

			if arg_353_1.time_ >= var_356_19 + var_356_29 and arg_353_1.time_ < var_356_19 + var_356_29 + arg_356_0 then
				arg_353_1.typewritter.percent = 1

				arg_353_1.typewritter:SetDirty()
				arg_353_1:ShowNextGo(true)
			end
		end
	end,
	Play410161087 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 410161087
		arg_357_1.duration_ = 3.7

		local var_357_0 = {
			ja = 3.333,
			CriLanguages = 3.7,
			zh = 3.7
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
				arg_357_0:Play410161088(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = arg_357_1.actors_["10059"].transform
			local var_360_1 = 0

			if var_360_1 < arg_357_1.time_ and arg_357_1.time_ <= var_360_1 + arg_360_0 then
				arg_357_1.var_.moveOldPos10059 = var_360_0.localPosition
				var_360_0.localScale = Vector3.New(1, 1, 1)

				arg_357_1:CheckSpriteTmpPos("10059", 4)

				local var_360_2 = var_360_0.childCount

				for iter_360_0 = 0, var_360_2 - 1 do
					local var_360_3 = var_360_0:GetChild(iter_360_0)

					if var_360_3.name == "" or not string.find(var_360_3.name, "split") then
						var_360_3.gameObject:SetActive(true)
					else
						var_360_3.gameObject:SetActive(false)
					end
				end
			end

			local var_360_4 = 0.001

			if var_360_1 <= arg_357_1.time_ and arg_357_1.time_ < var_360_1 + var_360_4 then
				local var_360_5 = (arg_357_1.time_ - var_360_1) / var_360_4
				local var_360_6 = Vector3.New(390, -530, 35)

				var_360_0.localPosition = Vector3.Lerp(arg_357_1.var_.moveOldPos10059, var_360_6, var_360_5)
			end

			if arg_357_1.time_ >= var_360_1 + var_360_4 and arg_357_1.time_ < var_360_1 + var_360_4 + arg_360_0 then
				var_360_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_360_7 = arg_357_1.actors_["10059"]
			local var_360_8 = 0

			if var_360_8 < arg_357_1.time_ and arg_357_1.time_ <= var_360_8 + arg_360_0 and arg_357_1.var_.actorSpriteComps10059 == nil then
				arg_357_1.var_.actorSpriteComps10059 = var_360_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_360_9 = 0.034

			if var_360_8 <= arg_357_1.time_ and arg_357_1.time_ < var_360_8 + var_360_9 then
				local var_360_10 = (arg_357_1.time_ - var_360_8) / var_360_9

				if arg_357_1.var_.actorSpriteComps10059 then
					for iter_360_1, iter_360_2 in pairs(arg_357_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_360_2 then
							local var_360_11 = Mathf.Lerp(iter_360_2.color.r, 1, var_360_10)

							iter_360_2.color = Color.New(var_360_11, var_360_11, var_360_11)
						end
					end
				end
			end

			if arg_357_1.time_ >= var_360_8 + var_360_9 and arg_357_1.time_ < var_360_8 + var_360_9 + arg_360_0 and arg_357_1.var_.actorSpriteComps10059 then
				local var_360_12 = 1

				for iter_360_3, iter_360_4 in pairs(arg_357_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_360_4 then
						iter_360_4.color = Color.New(var_360_12, var_360_12, var_360_12)
					end
				end

				arg_357_1.var_.actorSpriteComps10059 = nil
			end

			local var_360_13 = 0
			local var_360_14 = 0.3

			if var_360_13 < arg_357_1.time_ and arg_357_1.time_ <= var_360_13 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_15 = arg_357_1:FormatText(StoryNameCfg[596].name)

				arg_357_1.leftNameTxt_.text = var_360_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_16 = arg_357_1:GetWordFromCfg(410161087)
				local var_360_17 = arg_357_1:FormatText(var_360_16.content)

				arg_357_1.text_.text = var_360_17

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_18 = 12
				local var_360_19 = utf8.len(var_360_17)
				local var_360_20 = var_360_18 <= 0 and var_360_14 or var_360_14 * (var_360_19 / var_360_18)

				if var_360_20 > 0 and var_360_14 < var_360_20 then
					arg_357_1.talkMaxDuration = var_360_20

					if var_360_20 + var_360_13 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_20 + var_360_13
					end
				end

				arg_357_1.text_.text = var_360_17
				arg_357_1.typewritter.percent = 0

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161087", "story_v_out_410161.awb") ~= 0 then
					local var_360_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161087", "story_v_out_410161.awb") / 1000

					if var_360_21 + var_360_13 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_21 + var_360_13
					end

					if var_360_16.prefab_name ~= "" and arg_357_1.actors_[var_360_16.prefab_name] ~= nil then
						local var_360_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_16.prefab_name].transform, "story_v_out_410161", "410161087", "story_v_out_410161.awb")

						arg_357_1:RecordAudio("410161087", var_360_22)
						arg_357_1:RecordAudio("410161087", var_360_22)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_410161", "410161087", "story_v_out_410161.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_410161", "410161087", "story_v_out_410161.awb")
				end

				arg_357_1:RecordContent(arg_357_1.text_.text)
			end

			local var_360_23 = math.max(var_360_14, arg_357_1.talkMaxDuration)

			if var_360_13 <= arg_357_1.time_ and arg_357_1.time_ < var_360_13 + var_360_23 then
				arg_357_1.typewritter.percent = (arg_357_1.time_ - var_360_13) / var_360_23

				arg_357_1.typewritter:SetDirty()
			end

			if arg_357_1.time_ >= var_360_13 + var_360_23 and arg_357_1.time_ < var_360_13 + var_360_23 + arg_360_0 then
				arg_357_1.typewritter.percent = 1

				arg_357_1.typewritter:SetDirty()
				arg_357_1:ShowNextGo(true)
			end
		end
	end,
	Play410161088 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 410161088
		arg_361_1.duration_ = 5

		SetActive(arg_361_1.tipsGo_, false)

		function arg_361_1.onSingleLineFinish_()
			arg_361_1.onSingleLineUpdate_ = nil
			arg_361_1.onSingleLineFinish_ = nil
			arg_361_1.state_ = "waiting"
		end

		function arg_361_1.playNext_(arg_363_0)
			if arg_363_0 == 1 then
				arg_361_0:Play410161089(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = arg_361_1.actors_["1061"]
			local var_364_1 = 0

			if var_364_1 < arg_361_1.time_ and arg_361_1.time_ <= var_364_1 + arg_364_0 and arg_361_1.var_.actorSpriteComps1061 == nil then
				arg_361_1.var_.actorSpriteComps1061 = var_364_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_2 = 0.034

			if var_364_1 <= arg_361_1.time_ and arg_361_1.time_ < var_364_1 + var_364_2 then
				local var_364_3 = (arg_361_1.time_ - var_364_1) / var_364_2

				if arg_361_1.var_.actorSpriteComps1061 then
					for iter_364_0, iter_364_1 in pairs(arg_361_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_364_1 then
							local var_364_4 = Mathf.Lerp(iter_364_1.color.r, 0.5, var_364_3)

							iter_364_1.color = Color.New(var_364_4, var_364_4, var_364_4)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_1 + var_364_2 and arg_361_1.time_ < var_364_1 + var_364_2 + arg_364_0 and arg_361_1.var_.actorSpriteComps1061 then
				local var_364_5 = 0.5

				for iter_364_2, iter_364_3 in pairs(arg_361_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_364_3 then
						iter_364_3.color = Color.New(var_364_5, var_364_5, var_364_5)
					end
				end

				arg_361_1.var_.actorSpriteComps1061 = nil
			end

			local var_364_6 = arg_361_1.actors_["10059"]
			local var_364_7 = 0

			if var_364_7 < arg_361_1.time_ and arg_361_1.time_ <= var_364_7 + arg_364_0 and arg_361_1.var_.actorSpriteComps10059 == nil then
				arg_361_1.var_.actorSpriteComps10059 = var_364_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_364_8 = 0.034

			if var_364_7 <= arg_361_1.time_ and arg_361_1.time_ < var_364_7 + var_364_8 then
				local var_364_9 = (arg_361_1.time_ - var_364_7) / var_364_8

				if arg_361_1.var_.actorSpriteComps10059 then
					for iter_364_4, iter_364_5 in pairs(arg_361_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_364_5 then
							local var_364_10 = Mathf.Lerp(iter_364_5.color.r, 0.5, var_364_9)

							iter_364_5.color = Color.New(var_364_10, var_364_10, var_364_10)
						end
					end
				end
			end

			if arg_361_1.time_ >= var_364_7 + var_364_8 and arg_361_1.time_ < var_364_7 + var_364_8 + arg_364_0 and arg_361_1.var_.actorSpriteComps10059 then
				local var_364_11 = 0.5

				for iter_364_6, iter_364_7 in pairs(arg_361_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_364_7 then
						iter_364_7.color = Color.New(var_364_11, var_364_11, var_364_11)
					end
				end

				arg_361_1.var_.actorSpriteComps10059 = nil
			end

			local var_364_12 = 0
			local var_364_13 = 0.85

			if var_364_12 < arg_361_1.time_ and arg_361_1.time_ <= var_364_12 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, false)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_14 = arg_361_1:GetWordFromCfg(410161088)
				local var_364_15 = arg_361_1:FormatText(var_364_14.content)

				arg_361_1.text_.text = var_364_15

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_16 = 34
				local var_364_17 = utf8.len(var_364_15)
				local var_364_18 = var_364_16 <= 0 and var_364_13 or var_364_13 * (var_364_17 / var_364_16)

				if var_364_18 > 0 and var_364_13 < var_364_18 then
					arg_361_1.talkMaxDuration = var_364_18

					if var_364_18 + var_364_12 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_18 + var_364_12
					end
				end

				arg_361_1.text_.text = var_364_15
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)
				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_19 = math.max(var_364_13, arg_361_1.talkMaxDuration)

			if var_364_12 <= arg_361_1.time_ and arg_361_1.time_ < var_364_12 + var_364_19 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_12) / var_364_19

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_12 + var_364_19 and arg_361_1.time_ < var_364_12 + var_364_19 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play410161089 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 410161089
		arg_365_1.duration_ = 5

		SetActive(arg_365_1.tipsGo_, false)

		function arg_365_1.onSingleLineFinish_()
			arg_365_1.onSingleLineUpdate_ = nil
			arg_365_1.onSingleLineFinish_ = nil
			arg_365_1.state_ = "waiting"
		end

		function arg_365_1.playNext_(arg_367_0)
			if arg_367_0 == 1 then
				arg_365_0:Play410161090(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.925

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

				local var_368_2 = arg_365_1:GetWordFromCfg(410161089)
				local var_368_3 = arg_365_1:FormatText(var_368_2.content)

				arg_365_1.text_.text = var_368_3

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_4 = 37
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
	Play410161090 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 410161090
		arg_369_1.duration_ = 14.6

		local var_369_0 = {
			ja = 14.6,
			CriLanguages = 11.2,
			zh = 11.2
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
				arg_369_0:Play410161091(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = arg_369_1.actors_["10059"].transform
			local var_372_1 = 0

			if var_372_1 < arg_369_1.time_ and arg_369_1.time_ <= var_372_1 + arg_372_0 then
				arg_369_1.var_.moveOldPos10059 = var_372_0.localPosition
				var_372_0.localScale = Vector3.New(1, 1, 1)

				arg_369_1:CheckSpriteTmpPos("10059", 4)

				local var_372_2 = var_372_0.childCount

				for iter_372_0 = 0, var_372_2 - 1 do
					local var_372_3 = var_372_0:GetChild(iter_372_0)

					if var_372_3.name == "" or not string.find(var_372_3.name, "split") then
						var_372_3.gameObject:SetActive(true)
					else
						var_372_3.gameObject:SetActive(false)
					end
				end
			end

			local var_372_4 = 0.001

			if var_372_1 <= arg_369_1.time_ and arg_369_1.time_ < var_372_1 + var_372_4 then
				local var_372_5 = (arg_369_1.time_ - var_372_1) / var_372_4
				local var_372_6 = Vector3.New(390, -530, 35)

				var_372_0.localPosition = Vector3.Lerp(arg_369_1.var_.moveOldPos10059, var_372_6, var_372_5)
			end

			if arg_369_1.time_ >= var_372_1 + var_372_4 and arg_369_1.time_ < var_372_1 + var_372_4 + arg_372_0 then
				var_372_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_372_7 = arg_369_1.actors_["10059"]
			local var_372_8 = 0

			if var_372_8 < arg_369_1.time_ and arg_369_1.time_ <= var_372_8 + arg_372_0 and arg_369_1.var_.actorSpriteComps10059 == nil then
				arg_369_1.var_.actorSpriteComps10059 = var_372_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_372_9 = 0.034

			if var_372_8 <= arg_369_1.time_ and arg_369_1.time_ < var_372_8 + var_372_9 then
				local var_372_10 = (arg_369_1.time_ - var_372_8) / var_372_9

				if arg_369_1.var_.actorSpriteComps10059 then
					for iter_372_1, iter_372_2 in pairs(arg_369_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_372_2 then
							local var_372_11 = Mathf.Lerp(iter_372_2.color.r, 1, var_372_10)

							iter_372_2.color = Color.New(var_372_11, var_372_11, var_372_11)
						end
					end
				end
			end

			if arg_369_1.time_ >= var_372_8 + var_372_9 and arg_369_1.time_ < var_372_8 + var_372_9 + arg_372_0 and arg_369_1.var_.actorSpriteComps10059 then
				local var_372_12 = 1

				for iter_372_3, iter_372_4 in pairs(arg_369_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_372_4 then
						iter_372_4.color = Color.New(var_372_12, var_372_12, var_372_12)
					end
				end

				arg_369_1.var_.actorSpriteComps10059 = nil
			end

			local var_372_13 = 0
			local var_372_14 = 1.35

			if var_372_13 < arg_369_1.time_ and arg_369_1.time_ <= var_372_13 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_15 = arg_369_1:FormatText(StoryNameCfg[596].name)

				arg_369_1.leftNameTxt_.text = var_372_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_16 = arg_369_1:GetWordFromCfg(410161090)
				local var_372_17 = arg_369_1:FormatText(var_372_16.content)

				arg_369_1.text_.text = var_372_17

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_18 = 54
				local var_372_19 = utf8.len(var_372_17)
				local var_372_20 = var_372_18 <= 0 and var_372_14 or var_372_14 * (var_372_19 / var_372_18)

				if var_372_20 > 0 and var_372_14 < var_372_20 then
					arg_369_1.talkMaxDuration = var_372_20

					if var_372_20 + var_372_13 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_20 + var_372_13
					end
				end

				arg_369_1.text_.text = var_372_17
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161090", "story_v_out_410161.awb") ~= 0 then
					local var_372_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161090", "story_v_out_410161.awb") / 1000

					if var_372_21 + var_372_13 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_21 + var_372_13
					end

					if var_372_16.prefab_name ~= "" and arg_369_1.actors_[var_372_16.prefab_name] ~= nil then
						local var_372_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_16.prefab_name].transform, "story_v_out_410161", "410161090", "story_v_out_410161.awb")

						arg_369_1:RecordAudio("410161090", var_372_22)
						arg_369_1:RecordAudio("410161090", var_372_22)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_410161", "410161090", "story_v_out_410161.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_410161", "410161090", "story_v_out_410161.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_23 = math.max(var_372_14, arg_369_1.talkMaxDuration)

			if var_372_13 <= arg_369_1.time_ and arg_369_1.time_ < var_372_13 + var_372_23 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_13) / var_372_23

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_13 + var_372_23 and arg_369_1.time_ < var_372_13 + var_372_23 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play410161091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 410161091
		arg_373_1.duration_ = 7.933

		local var_373_0 = {
			ja = 7.933,
			CriLanguages = 6.633,
			zh = 6.633
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
				arg_373_0:Play410161092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["10059"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos10059 = var_376_0.localPosition
				var_376_0.localScale = Vector3.New(1, 1, 1)

				arg_373_1:CheckSpriteTmpPos("10059", 4)

				local var_376_2 = var_376_0.childCount

				for iter_376_0 = 0, var_376_2 - 1 do
					local var_376_3 = var_376_0:GetChild(iter_376_0)

					if var_376_3.name == "" or not string.find(var_376_3.name, "split") then
						var_376_3.gameObject:SetActive(true)
					else
						var_376_3.gameObject:SetActive(false)
					end
				end
			end

			local var_376_4 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_4 then
				local var_376_5 = (arg_373_1.time_ - var_376_1) / var_376_4
				local var_376_6 = Vector3.New(390, -530, 35)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos10059, var_376_6, var_376_5)
			end

			if arg_373_1.time_ >= var_376_1 + var_376_4 and arg_373_1.time_ < var_376_1 + var_376_4 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_376_7 = arg_373_1.actors_["10059"]
			local var_376_8 = 0

			if var_376_8 < arg_373_1.time_ and arg_373_1.time_ <= var_376_8 + arg_376_0 and arg_373_1.var_.actorSpriteComps10059 == nil then
				arg_373_1.var_.actorSpriteComps10059 = var_376_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_376_9 = 0.034

			if var_376_8 <= arg_373_1.time_ and arg_373_1.time_ < var_376_8 + var_376_9 then
				local var_376_10 = (arg_373_1.time_ - var_376_8) / var_376_9

				if arg_373_1.var_.actorSpriteComps10059 then
					for iter_376_1, iter_376_2 in pairs(arg_373_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_376_2 then
							local var_376_11 = Mathf.Lerp(iter_376_2.color.r, 1, var_376_10)

							iter_376_2.color = Color.New(var_376_11, var_376_11, var_376_11)
						end
					end
				end
			end

			if arg_373_1.time_ >= var_376_8 + var_376_9 and arg_373_1.time_ < var_376_8 + var_376_9 + arg_376_0 and arg_373_1.var_.actorSpriteComps10059 then
				local var_376_12 = 1

				for iter_376_3, iter_376_4 in pairs(arg_373_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_376_4 then
						iter_376_4.color = Color.New(var_376_12, var_376_12, var_376_12)
					end
				end

				arg_373_1.var_.actorSpriteComps10059 = nil
			end

			local var_376_13 = 0
			local var_376_14 = 0.9

			if var_376_13 < arg_373_1.time_ and arg_373_1.time_ <= var_376_13 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_15 = arg_373_1:FormatText(StoryNameCfg[596].name)

				arg_373_1.leftNameTxt_.text = var_376_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_16 = arg_373_1:GetWordFromCfg(410161091)
				local var_376_17 = arg_373_1:FormatText(var_376_16.content)

				arg_373_1.text_.text = var_376_17

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_18 = 36
				local var_376_19 = utf8.len(var_376_17)
				local var_376_20 = var_376_18 <= 0 and var_376_14 or var_376_14 * (var_376_19 / var_376_18)

				if var_376_20 > 0 and var_376_14 < var_376_20 then
					arg_373_1.talkMaxDuration = var_376_20

					if var_376_20 + var_376_13 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_20 + var_376_13
					end
				end

				arg_373_1.text_.text = var_376_17
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161091", "story_v_out_410161.awb") ~= 0 then
					local var_376_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161091", "story_v_out_410161.awb") / 1000

					if var_376_21 + var_376_13 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_21 + var_376_13
					end

					if var_376_16.prefab_name ~= "" and arg_373_1.actors_[var_376_16.prefab_name] ~= nil then
						local var_376_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_16.prefab_name].transform, "story_v_out_410161", "410161091", "story_v_out_410161.awb")

						arg_373_1:RecordAudio("410161091", var_376_22)
						arg_373_1:RecordAudio("410161091", var_376_22)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_410161", "410161091", "story_v_out_410161.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_410161", "410161091", "story_v_out_410161.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_23 = math.max(var_376_14, arg_373_1.talkMaxDuration)

			if var_376_13 <= arg_373_1.time_ and arg_373_1.time_ < var_376_13 + var_376_23 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_13) / var_376_23

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_13 + var_376_23 and arg_373_1.time_ < var_376_13 + var_376_23 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play410161092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 410161092
		arg_377_1.duration_ = 10.1

		local var_377_0 = {
			ja = 10.1,
			CriLanguages = 9.3,
			zh = 9.3
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
				arg_377_0:Play410161093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1061"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos1061 = var_380_0.localPosition
				var_380_0.localScale = Vector3.New(1, 1, 1)

				arg_377_1:CheckSpriteTmpPos("1061", 2)

				local var_380_2 = var_380_0.childCount

				for iter_380_0 = 0, var_380_2 - 1 do
					local var_380_3 = var_380_0:GetChild(iter_380_0)

					if var_380_3.name == "" or not string.find(var_380_3.name, "split") then
						var_380_3.gameObject:SetActive(true)
					else
						var_380_3.gameObject:SetActive(false)
					end
				end
			end

			local var_380_4 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_4 then
				local var_380_5 = (arg_377_1.time_ - var_380_1) / var_380_4
				local var_380_6 = Vector3.New(-390, -490, 18)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1061, var_380_6, var_380_5)
			end

			if arg_377_1.time_ >= var_380_1 + var_380_4 and arg_377_1.time_ < var_380_1 + var_380_4 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_380_7 = arg_377_1.actors_["1061"]
			local var_380_8 = 0

			if var_380_8 < arg_377_1.time_ and arg_377_1.time_ <= var_380_8 + arg_380_0 and arg_377_1.var_.actorSpriteComps1061 == nil then
				arg_377_1.var_.actorSpriteComps1061 = var_380_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_9 = 0.034

			if var_380_8 <= arg_377_1.time_ and arg_377_1.time_ < var_380_8 + var_380_9 then
				local var_380_10 = (arg_377_1.time_ - var_380_8) / var_380_9

				if arg_377_1.var_.actorSpriteComps1061 then
					for iter_380_1, iter_380_2 in pairs(arg_377_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_380_2 then
							local var_380_11 = Mathf.Lerp(iter_380_2.color.r, 1, var_380_10)

							iter_380_2.color = Color.New(var_380_11, var_380_11, var_380_11)
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_8 + var_380_9 and arg_377_1.time_ < var_380_8 + var_380_9 + arg_380_0 and arg_377_1.var_.actorSpriteComps1061 then
				local var_380_12 = 1

				for iter_380_3, iter_380_4 in pairs(arg_377_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_380_4 then
						iter_380_4.color = Color.New(var_380_12, var_380_12, var_380_12)
					end
				end

				arg_377_1.var_.actorSpriteComps1061 = nil
			end

			local var_380_13 = arg_377_1.actors_["10059"]
			local var_380_14 = 0

			if var_380_14 < arg_377_1.time_ and arg_377_1.time_ <= var_380_14 + arg_380_0 and arg_377_1.var_.actorSpriteComps10059 == nil then
				arg_377_1.var_.actorSpriteComps10059 = var_380_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_380_15 = 0.034

			if var_380_14 <= arg_377_1.time_ and arg_377_1.time_ < var_380_14 + var_380_15 then
				local var_380_16 = (arg_377_1.time_ - var_380_14) / var_380_15

				if arg_377_1.var_.actorSpriteComps10059 then
					for iter_380_5, iter_380_6 in pairs(arg_377_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_380_6 then
							local var_380_17 = Mathf.Lerp(iter_380_6.color.r, 0.5, var_380_16)

							iter_380_6.color = Color.New(var_380_17, var_380_17, var_380_17)
						end
					end
				end
			end

			if arg_377_1.time_ >= var_380_14 + var_380_15 and arg_377_1.time_ < var_380_14 + var_380_15 + arg_380_0 and arg_377_1.var_.actorSpriteComps10059 then
				local var_380_18 = 0.5

				for iter_380_7, iter_380_8 in pairs(arg_377_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_380_8 then
						iter_380_8.color = Color.New(var_380_18, var_380_18, var_380_18)
					end
				end

				arg_377_1.var_.actorSpriteComps10059 = nil
			end

			local var_380_19 = 0
			local var_380_20 = 0.9

			if var_380_19 < arg_377_1.time_ and arg_377_1.time_ <= var_380_19 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_21 = arg_377_1:FormatText(StoryNameCfg[612].name)

				arg_377_1.leftNameTxt_.text = var_380_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_22 = arg_377_1:GetWordFromCfg(410161092)
				local var_380_23 = arg_377_1:FormatText(var_380_22.content)

				arg_377_1.text_.text = var_380_23

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_24 = 36
				local var_380_25 = utf8.len(var_380_23)
				local var_380_26 = var_380_24 <= 0 and var_380_20 or var_380_20 * (var_380_25 / var_380_24)

				if var_380_26 > 0 and var_380_20 < var_380_26 then
					arg_377_1.talkMaxDuration = var_380_26

					if var_380_26 + var_380_19 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_26 + var_380_19
					end
				end

				arg_377_1.text_.text = var_380_23
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161092", "story_v_out_410161.awb") ~= 0 then
					local var_380_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161092", "story_v_out_410161.awb") / 1000

					if var_380_27 + var_380_19 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_27 + var_380_19
					end

					if var_380_22.prefab_name ~= "" and arg_377_1.actors_[var_380_22.prefab_name] ~= nil then
						local var_380_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_22.prefab_name].transform, "story_v_out_410161", "410161092", "story_v_out_410161.awb")

						arg_377_1:RecordAudio("410161092", var_380_28)
						arg_377_1:RecordAudio("410161092", var_380_28)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_410161", "410161092", "story_v_out_410161.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_410161", "410161092", "story_v_out_410161.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_29 = math.max(var_380_20, arg_377_1.talkMaxDuration)

			if var_380_19 <= arg_377_1.time_ and arg_377_1.time_ < var_380_19 + var_380_29 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_19) / var_380_29

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_19 + var_380_29 and arg_377_1.time_ < var_380_19 + var_380_29 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play410161093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 410161093
		arg_381_1.duration_ = 7.733

		local var_381_0 = {
			ja = 7.733,
			CriLanguages = 6.033,
			zh = 6.033
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
				arg_381_0:Play410161094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1061"].transform
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 then
				arg_381_1.var_.moveOldPos1061 = var_384_0.localPosition
				var_384_0.localScale = Vector3.New(1, 1, 1)

				arg_381_1:CheckSpriteTmpPos("1061", 2)

				local var_384_2 = var_384_0.childCount

				for iter_384_0 = 0, var_384_2 - 1 do
					local var_384_3 = var_384_0:GetChild(iter_384_0)

					if var_384_3.name == "" or not string.find(var_384_3.name, "split") then
						var_384_3.gameObject:SetActive(true)
					else
						var_384_3.gameObject:SetActive(false)
					end
				end
			end

			local var_384_4 = 0.001

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_4 then
				local var_384_5 = (arg_381_1.time_ - var_384_1) / var_384_4
				local var_384_6 = Vector3.New(-390, -490, 18)

				var_384_0.localPosition = Vector3.Lerp(arg_381_1.var_.moveOldPos1061, var_384_6, var_384_5)
			end

			if arg_381_1.time_ >= var_384_1 + var_384_4 and arg_381_1.time_ < var_384_1 + var_384_4 + arg_384_0 then
				var_384_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_384_7 = arg_381_1.actors_["1061"]
			local var_384_8 = 0

			if var_384_8 < arg_381_1.time_ and arg_381_1.time_ <= var_384_8 + arg_384_0 and arg_381_1.var_.actorSpriteComps1061 == nil then
				arg_381_1.var_.actorSpriteComps1061 = var_384_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_384_9 = 0.034

			if var_384_8 <= arg_381_1.time_ and arg_381_1.time_ < var_384_8 + var_384_9 then
				local var_384_10 = (arg_381_1.time_ - var_384_8) / var_384_9

				if arg_381_1.var_.actorSpriteComps1061 then
					for iter_384_1, iter_384_2 in pairs(arg_381_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_384_2 then
							local var_384_11 = Mathf.Lerp(iter_384_2.color.r, 1, var_384_10)

							iter_384_2.color = Color.New(var_384_11, var_384_11, var_384_11)
						end
					end
				end
			end

			if arg_381_1.time_ >= var_384_8 + var_384_9 and arg_381_1.time_ < var_384_8 + var_384_9 + arg_384_0 and arg_381_1.var_.actorSpriteComps1061 then
				local var_384_12 = 1

				for iter_384_3, iter_384_4 in pairs(arg_381_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_384_4 then
						iter_384_4.color = Color.New(var_384_12, var_384_12, var_384_12)
					end
				end

				arg_381_1.var_.actorSpriteComps1061 = nil
			end

			local var_384_13 = 0
			local var_384_14 = 0.7

			if var_384_13 < arg_381_1.time_ and arg_381_1.time_ <= var_384_13 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_15 = arg_381_1:FormatText(StoryNameCfg[612].name)

				arg_381_1.leftNameTxt_.text = var_384_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_16 = arg_381_1:GetWordFromCfg(410161093)
				local var_384_17 = arg_381_1:FormatText(var_384_16.content)

				arg_381_1.text_.text = var_384_17

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_18 = 28
				local var_384_19 = utf8.len(var_384_17)
				local var_384_20 = var_384_18 <= 0 and var_384_14 or var_384_14 * (var_384_19 / var_384_18)

				if var_384_20 > 0 and var_384_14 < var_384_20 then
					arg_381_1.talkMaxDuration = var_384_20

					if var_384_20 + var_384_13 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_20 + var_384_13
					end
				end

				arg_381_1.text_.text = var_384_17
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161093", "story_v_out_410161.awb") ~= 0 then
					local var_384_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161093", "story_v_out_410161.awb") / 1000

					if var_384_21 + var_384_13 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_21 + var_384_13
					end

					if var_384_16.prefab_name ~= "" and arg_381_1.actors_[var_384_16.prefab_name] ~= nil then
						local var_384_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_16.prefab_name].transform, "story_v_out_410161", "410161093", "story_v_out_410161.awb")

						arg_381_1:RecordAudio("410161093", var_384_22)
						arg_381_1:RecordAudio("410161093", var_384_22)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_410161", "410161093", "story_v_out_410161.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_410161", "410161093", "story_v_out_410161.awb")
				end

				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_23 = math.max(var_384_14, arg_381_1.talkMaxDuration)

			if var_384_13 <= arg_381_1.time_ and arg_381_1.time_ < var_384_13 + var_384_23 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_13) / var_384_23

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_13 + var_384_23 and arg_381_1.time_ < var_384_13 + var_384_23 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play410161094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 410161094
		arg_385_1.duration_ = 15.666

		local var_385_0 = {
			ja = 15.666,
			CriLanguages = 13.433,
			zh = 13.433
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
				arg_385_0:Play410161095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1061"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos1061 = var_388_0.localPosition
				var_388_0.localScale = Vector3.New(1, 1, 1)

				arg_385_1:CheckSpriteTmpPos("1061", 2)

				local var_388_2 = var_388_0.childCount

				for iter_388_0 = 0, var_388_2 - 1 do
					local var_388_3 = var_388_0:GetChild(iter_388_0)

					if var_388_3.name == "" or not string.find(var_388_3.name, "split") then
						var_388_3.gameObject:SetActive(true)
					else
						var_388_3.gameObject:SetActive(false)
					end
				end
			end

			local var_388_4 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_4 then
				local var_388_5 = (arg_385_1.time_ - var_388_1) / var_388_4
				local var_388_6 = Vector3.New(-390, -490, 18)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1061, var_388_6, var_388_5)
			end

			if arg_385_1.time_ >= var_388_1 + var_388_4 and arg_385_1.time_ < var_388_1 + var_388_4 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_388_7 = arg_385_1.actors_["1061"]
			local var_388_8 = 0

			if var_388_8 < arg_385_1.time_ and arg_385_1.time_ <= var_388_8 + arg_388_0 and arg_385_1.var_.actorSpriteComps1061 == nil then
				arg_385_1.var_.actorSpriteComps1061 = var_388_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_388_9 = 0.034

			if var_388_8 <= arg_385_1.time_ and arg_385_1.time_ < var_388_8 + var_388_9 then
				local var_388_10 = (arg_385_1.time_ - var_388_8) / var_388_9

				if arg_385_1.var_.actorSpriteComps1061 then
					for iter_388_1, iter_388_2 in pairs(arg_385_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_388_2 then
							local var_388_11 = Mathf.Lerp(iter_388_2.color.r, 1, var_388_10)

							iter_388_2.color = Color.New(var_388_11, var_388_11, var_388_11)
						end
					end
				end
			end

			if arg_385_1.time_ >= var_388_8 + var_388_9 and arg_385_1.time_ < var_388_8 + var_388_9 + arg_388_0 and arg_385_1.var_.actorSpriteComps1061 then
				local var_388_12 = 1

				for iter_388_3, iter_388_4 in pairs(arg_385_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_388_4 then
						iter_388_4.color = Color.New(var_388_12, var_388_12, var_388_12)
					end
				end

				arg_385_1.var_.actorSpriteComps1061 = nil
			end

			local var_388_13 = 0
			local var_388_14 = 1.425

			if var_388_13 < arg_385_1.time_ and arg_385_1.time_ <= var_388_13 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_15 = arg_385_1:FormatText(StoryNameCfg[612].name)

				arg_385_1.leftNameTxt_.text = var_388_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_16 = arg_385_1:GetWordFromCfg(410161094)
				local var_388_17 = arg_385_1:FormatText(var_388_16.content)

				arg_385_1.text_.text = var_388_17

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_18 = 57
				local var_388_19 = utf8.len(var_388_17)
				local var_388_20 = var_388_18 <= 0 and var_388_14 or var_388_14 * (var_388_19 / var_388_18)

				if var_388_20 > 0 and var_388_14 < var_388_20 then
					arg_385_1.talkMaxDuration = var_388_20

					if var_388_20 + var_388_13 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_20 + var_388_13
					end
				end

				arg_385_1.text_.text = var_388_17
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161094", "story_v_out_410161.awb") ~= 0 then
					local var_388_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161094", "story_v_out_410161.awb") / 1000

					if var_388_21 + var_388_13 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_21 + var_388_13
					end

					if var_388_16.prefab_name ~= "" and arg_385_1.actors_[var_388_16.prefab_name] ~= nil then
						local var_388_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_16.prefab_name].transform, "story_v_out_410161", "410161094", "story_v_out_410161.awb")

						arg_385_1:RecordAudio("410161094", var_388_22)
						arg_385_1:RecordAudio("410161094", var_388_22)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_410161", "410161094", "story_v_out_410161.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_410161", "410161094", "story_v_out_410161.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_23 = math.max(var_388_14, arg_385_1.talkMaxDuration)

			if var_388_13 <= arg_385_1.time_ and arg_385_1.time_ < var_388_13 + var_388_23 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_13) / var_388_23

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_13 + var_388_23 and arg_385_1.time_ < var_388_13 + var_388_23 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play410161095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 410161095
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play410161096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1061"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.actorSpriteComps1061 == nil then
				arg_389_1.var_.actorSpriteComps1061 = var_392_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_2 = 0.034

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.actorSpriteComps1061 then
					for iter_392_0, iter_392_1 in pairs(arg_389_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_392_1 then
							local var_392_4 = Mathf.Lerp(iter_392_1.color.r, 0.5, var_392_3)

							iter_392_1.color = Color.New(var_392_4, var_392_4, var_392_4)
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.actorSpriteComps1061 then
				local var_392_5 = 0.5

				for iter_392_2, iter_392_3 in pairs(arg_389_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_392_3 then
						iter_392_3.color = Color.New(var_392_5, var_392_5, var_392_5)
					end
				end

				arg_389_1.var_.actorSpriteComps1061 = nil
			end

			local var_392_6 = arg_389_1.actors_["10059"]
			local var_392_7 = 0

			if var_392_7 < arg_389_1.time_ and arg_389_1.time_ <= var_392_7 + arg_392_0 and arg_389_1.var_.actorSpriteComps10059 == nil then
				arg_389_1.var_.actorSpriteComps10059 = var_392_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_392_8 = 0.034

			if var_392_7 <= arg_389_1.time_ and arg_389_1.time_ < var_392_7 + var_392_8 then
				local var_392_9 = (arg_389_1.time_ - var_392_7) / var_392_8

				if arg_389_1.var_.actorSpriteComps10059 then
					for iter_392_4, iter_392_5 in pairs(arg_389_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_392_5 then
							local var_392_10 = Mathf.Lerp(iter_392_5.color.r, 0.5, var_392_9)

							iter_392_5.color = Color.New(var_392_10, var_392_10, var_392_10)
						end
					end
				end
			end

			if arg_389_1.time_ >= var_392_7 + var_392_8 and arg_389_1.time_ < var_392_7 + var_392_8 + arg_392_0 and arg_389_1.var_.actorSpriteComps10059 then
				local var_392_11 = 0.5

				for iter_392_6, iter_392_7 in pairs(arg_389_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_392_7 then
						iter_392_7.color = Color.New(var_392_11, var_392_11, var_392_11)
					end
				end

				arg_389_1.var_.actorSpriteComps10059 = nil
			end

			local var_392_12 = 0
			local var_392_13 = 1

			if var_392_12 < arg_389_1.time_ and arg_389_1.time_ <= var_392_12 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, false)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_14 = arg_389_1:GetWordFromCfg(410161095)
				local var_392_15 = arg_389_1:FormatText(var_392_14.content)

				arg_389_1.text_.text = var_392_15

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_16 = 40
				local var_392_17 = utf8.len(var_392_15)
				local var_392_18 = var_392_16 <= 0 and var_392_13 or var_392_13 * (var_392_17 / var_392_16)

				if var_392_18 > 0 and var_392_13 < var_392_18 then
					arg_389_1.talkMaxDuration = var_392_18

					if var_392_18 + var_392_12 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_18 + var_392_12
					end
				end

				arg_389_1.text_.text = var_392_15
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_19 = math.max(var_392_13, arg_389_1.talkMaxDuration)

			if var_392_12 <= arg_389_1.time_ and arg_389_1.time_ < var_392_12 + var_392_19 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_12) / var_392_19

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_12 + var_392_19 and arg_389_1.time_ < var_392_12 + var_392_19 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play410161096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 410161096
		arg_393_1.duration_ = 6.766

		local var_393_0 = {
			ja = 6.766,
			CriLanguages = 3.833,
			zh = 3.833
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
				arg_393_0:Play410161097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = arg_393_1.actors_["10059"].transform
			local var_396_1 = 0

			if var_396_1 < arg_393_1.time_ and arg_393_1.time_ <= var_396_1 + arg_396_0 then
				arg_393_1.var_.moveOldPos10059 = var_396_0.localPosition
				var_396_0.localScale = Vector3.New(1, 1, 1)

				arg_393_1:CheckSpriteTmpPos("10059", 4)

				local var_396_2 = var_396_0.childCount

				for iter_396_0 = 0, var_396_2 - 1 do
					local var_396_3 = var_396_0:GetChild(iter_396_0)

					if var_396_3.name == "" or not string.find(var_396_3.name, "split") then
						var_396_3.gameObject:SetActive(true)
					else
						var_396_3.gameObject:SetActive(false)
					end
				end
			end

			local var_396_4 = 0.001

			if var_396_1 <= arg_393_1.time_ and arg_393_1.time_ < var_396_1 + var_396_4 then
				local var_396_5 = (arg_393_1.time_ - var_396_1) / var_396_4
				local var_396_6 = Vector3.New(390, -530, 35)

				var_396_0.localPosition = Vector3.Lerp(arg_393_1.var_.moveOldPos10059, var_396_6, var_396_5)
			end

			if arg_393_1.time_ >= var_396_1 + var_396_4 and arg_393_1.time_ < var_396_1 + var_396_4 + arg_396_0 then
				var_396_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_396_7 = arg_393_1.actors_["10059"]
			local var_396_8 = 0

			if var_396_8 < arg_393_1.time_ and arg_393_1.time_ <= var_396_8 + arg_396_0 and arg_393_1.var_.actorSpriteComps10059 == nil then
				arg_393_1.var_.actorSpriteComps10059 = var_396_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_396_9 = 0.034

			if var_396_8 <= arg_393_1.time_ and arg_393_1.time_ < var_396_8 + var_396_9 then
				local var_396_10 = (arg_393_1.time_ - var_396_8) / var_396_9

				if arg_393_1.var_.actorSpriteComps10059 then
					for iter_396_1, iter_396_2 in pairs(arg_393_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_396_2 then
							local var_396_11 = Mathf.Lerp(iter_396_2.color.r, 1, var_396_10)

							iter_396_2.color = Color.New(var_396_11, var_396_11, var_396_11)
						end
					end
				end
			end

			if arg_393_1.time_ >= var_396_8 + var_396_9 and arg_393_1.time_ < var_396_8 + var_396_9 + arg_396_0 and arg_393_1.var_.actorSpriteComps10059 then
				local var_396_12 = 1

				for iter_396_3, iter_396_4 in pairs(arg_393_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_396_4 then
						iter_396_4.color = Color.New(var_396_12, var_396_12, var_396_12)
					end
				end

				arg_393_1.var_.actorSpriteComps10059 = nil
			end

			local var_396_13 = 0
			local var_396_14 = 0.4

			if var_396_13 < arg_393_1.time_ and arg_393_1.time_ <= var_396_13 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_15 = arg_393_1:FormatText(StoryNameCfg[596].name)

				arg_393_1.leftNameTxt_.text = var_396_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_16 = arg_393_1:GetWordFromCfg(410161096)
				local var_396_17 = arg_393_1:FormatText(var_396_16.content)

				arg_393_1.text_.text = var_396_17

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_18 = 16
				local var_396_19 = utf8.len(var_396_17)
				local var_396_20 = var_396_18 <= 0 and var_396_14 or var_396_14 * (var_396_19 / var_396_18)

				if var_396_20 > 0 and var_396_14 < var_396_20 then
					arg_393_1.talkMaxDuration = var_396_20

					if var_396_20 + var_396_13 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_20 + var_396_13
					end
				end

				arg_393_1.text_.text = var_396_17
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161096", "story_v_out_410161.awb") ~= 0 then
					local var_396_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161096", "story_v_out_410161.awb") / 1000

					if var_396_21 + var_396_13 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_21 + var_396_13
					end

					if var_396_16.prefab_name ~= "" and arg_393_1.actors_[var_396_16.prefab_name] ~= nil then
						local var_396_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_16.prefab_name].transform, "story_v_out_410161", "410161096", "story_v_out_410161.awb")

						arg_393_1:RecordAudio("410161096", var_396_22)
						arg_393_1:RecordAudio("410161096", var_396_22)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_410161", "410161096", "story_v_out_410161.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_410161", "410161096", "story_v_out_410161.awb")
				end

				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_23 = math.max(var_396_14, arg_393_1.talkMaxDuration)

			if var_396_13 <= arg_393_1.time_ and arg_393_1.time_ < var_396_13 + var_396_23 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_13) / var_396_23

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_13 + var_396_23 and arg_393_1.time_ < var_396_13 + var_396_23 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play410161097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 410161097
		arg_397_1.duration_ = 10.266

		local var_397_0 = {
			ja = 10.266,
			CriLanguages = 5,
			zh = 5
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
				arg_397_0:Play410161098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = arg_397_1.actors_["1061"].transform
			local var_400_1 = 0

			if var_400_1 < arg_397_1.time_ and arg_397_1.time_ <= var_400_1 + arg_400_0 then
				arg_397_1.var_.moveOldPos1061 = var_400_0.localPosition
				var_400_0.localScale = Vector3.New(1, 1, 1)

				arg_397_1:CheckSpriteTmpPos("1061", 2)

				local var_400_2 = var_400_0.childCount

				for iter_400_0 = 0, var_400_2 - 1 do
					local var_400_3 = var_400_0:GetChild(iter_400_0)

					if var_400_3.name == "split_5" or not string.find(var_400_3.name, "split") then
						var_400_3.gameObject:SetActive(true)
					else
						var_400_3.gameObject:SetActive(false)
					end
				end
			end

			local var_400_4 = 0.001

			if var_400_1 <= arg_397_1.time_ and arg_397_1.time_ < var_400_1 + var_400_4 then
				local var_400_5 = (arg_397_1.time_ - var_400_1) / var_400_4
				local var_400_6 = Vector3.New(-390, -490, 18)

				var_400_0.localPosition = Vector3.Lerp(arg_397_1.var_.moveOldPos1061, var_400_6, var_400_5)
			end

			if arg_397_1.time_ >= var_400_1 + var_400_4 and arg_397_1.time_ < var_400_1 + var_400_4 + arg_400_0 then
				var_400_0.localPosition = Vector3.New(-390, -490, 18)
			end

			local var_400_7 = arg_397_1.actors_["1061"]
			local var_400_8 = 0

			if var_400_8 < arg_397_1.time_ and arg_397_1.time_ <= var_400_8 + arg_400_0 and arg_397_1.var_.actorSpriteComps1061 == nil then
				arg_397_1.var_.actorSpriteComps1061 = var_400_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_9 = 0.034

			if var_400_8 <= arg_397_1.time_ and arg_397_1.time_ < var_400_8 + var_400_9 then
				local var_400_10 = (arg_397_1.time_ - var_400_8) / var_400_9

				if arg_397_1.var_.actorSpriteComps1061 then
					for iter_400_1, iter_400_2 in pairs(arg_397_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_400_2 then
							local var_400_11 = Mathf.Lerp(iter_400_2.color.r, 1, var_400_10)

							iter_400_2.color = Color.New(var_400_11, var_400_11, var_400_11)
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_8 + var_400_9 and arg_397_1.time_ < var_400_8 + var_400_9 + arg_400_0 and arg_397_1.var_.actorSpriteComps1061 then
				local var_400_12 = 1

				for iter_400_3, iter_400_4 in pairs(arg_397_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_400_4 then
						iter_400_4.color = Color.New(var_400_12, var_400_12, var_400_12)
					end
				end

				arg_397_1.var_.actorSpriteComps1061 = nil
			end

			local var_400_13 = arg_397_1.actors_["10059"]
			local var_400_14 = 0

			if var_400_14 < arg_397_1.time_ and arg_397_1.time_ <= var_400_14 + arg_400_0 and arg_397_1.var_.actorSpriteComps10059 == nil then
				arg_397_1.var_.actorSpriteComps10059 = var_400_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_400_15 = 0.034

			if var_400_14 <= arg_397_1.time_ and arg_397_1.time_ < var_400_14 + var_400_15 then
				local var_400_16 = (arg_397_1.time_ - var_400_14) / var_400_15

				if arg_397_1.var_.actorSpriteComps10059 then
					for iter_400_5, iter_400_6 in pairs(arg_397_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_400_6 then
							local var_400_17 = Mathf.Lerp(iter_400_6.color.r, 0.5, var_400_16)

							iter_400_6.color = Color.New(var_400_17, var_400_17, var_400_17)
						end
					end
				end
			end

			if arg_397_1.time_ >= var_400_14 + var_400_15 and arg_397_1.time_ < var_400_14 + var_400_15 + arg_400_0 and arg_397_1.var_.actorSpriteComps10059 then
				local var_400_18 = 0.5

				for iter_400_7, iter_400_8 in pairs(arg_397_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_400_8 then
						iter_400_8.color = Color.New(var_400_18, var_400_18, var_400_18)
					end
				end

				arg_397_1.var_.actorSpriteComps10059 = nil
			end

			local var_400_19 = 0
			local var_400_20 = 0.575

			if var_400_19 < arg_397_1.time_ and arg_397_1.time_ <= var_400_19 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_21 = arg_397_1:FormatText(StoryNameCfg[612].name)

				arg_397_1.leftNameTxt_.text = var_400_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_22 = arg_397_1:GetWordFromCfg(410161097)
				local var_400_23 = arg_397_1:FormatText(var_400_22.content)

				arg_397_1.text_.text = var_400_23

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_24 = 23
				local var_400_25 = utf8.len(var_400_23)
				local var_400_26 = var_400_24 <= 0 and var_400_20 or var_400_20 * (var_400_25 / var_400_24)

				if var_400_26 > 0 and var_400_20 < var_400_26 then
					arg_397_1.talkMaxDuration = var_400_26

					if var_400_26 + var_400_19 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_26 + var_400_19
					end
				end

				arg_397_1.text_.text = var_400_23
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161097", "story_v_out_410161.awb") ~= 0 then
					local var_400_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161097", "story_v_out_410161.awb") / 1000

					if var_400_27 + var_400_19 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_27 + var_400_19
					end

					if var_400_22.prefab_name ~= "" and arg_397_1.actors_[var_400_22.prefab_name] ~= nil then
						local var_400_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_22.prefab_name].transform, "story_v_out_410161", "410161097", "story_v_out_410161.awb")

						arg_397_1:RecordAudio("410161097", var_400_28)
						arg_397_1:RecordAudio("410161097", var_400_28)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_410161", "410161097", "story_v_out_410161.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_410161", "410161097", "story_v_out_410161.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_29 = math.max(var_400_20, arg_397_1.talkMaxDuration)

			if var_400_19 <= arg_397_1.time_ and arg_397_1.time_ < var_400_19 + var_400_29 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_19) / var_400_29

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_19 + var_400_29 and arg_397_1.time_ < var_400_19 + var_400_29 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play410161098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 410161098
		arg_401_1.duration_ = 6.866

		local var_401_0 = {
			ja = 6.866,
			CriLanguages = 3.633,
			zh = 3.633
		}
		local var_401_1 = manager.audio:GetLocalizationFlag()

		if var_401_0[var_401_1] ~= nil then
			arg_401_1.duration_ = var_401_0[var_401_1]
		end

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play410161099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["10059"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos10059 = var_404_0.localPosition
				var_404_0.localScale = Vector3.New(1, 1, 1)

				arg_401_1:CheckSpriteTmpPos("10059", 4)

				local var_404_2 = var_404_0.childCount

				for iter_404_0 = 0, var_404_2 - 1 do
					local var_404_3 = var_404_0:GetChild(iter_404_0)

					if var_404_3.name == "" or not string.find(var_404_3.name, "split") then
						var_404_3.gameObject:SetActive(true)
					else
						var_404_3.gameObject:SetActive(false)
					end
				end
			end

			local var_404_4 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_4 then
				local var_404_5 = (arg_401_1.time_ - var_404_1) / var_404_4
				local var_404_6 = Vector3.New(390, -530, 35)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos10059, var_404_6, var_404_5)
			end

			if arg_401_1.time_ >= var_404_1 + var_404_4 and arg_401_1.time_ < var_404_1 + var_404_4 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(390, -530, 35)
			end

			local var_404_7 = arg_401_1.actors_["10059"]
			local var_404_8 = 0

			if var_404_8 < arg_401_1.time_ and arg_401_1.time_ <= var_404_8 + arg_404_0 and arg_401_1.var_.actorSpriteComps10059 == nil then
				arg_401_1.var_.actorSpriteComps10059 = var_404_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_9 = 0.034

			if var_404_8 <= arg_401_1.time_ and arg_401_1.time_ < var_404_8 + var_404_9 then
				local var_404_10 = (arg_401_1.time_ - var_404_8) / var_404_9

				if arg_401_1.var_.actorSpriteComps10059 then
					for iter_404_1, iter_404_2 in pairs(arg_401_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_404_2 then
							local var_404_11 = Mathf.Lerp(iter_404_2.color.r, 1, var_404_10)

							iter_404_2.color = Color.New(var_404_11, var_404_11, var_404_11)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_8 + var_404_9 and arg_401_1.time_ < var_404_8 + var_404_9 + arg_404_0 and arg_401_1.var_.actorSpriteComps10059 then
				local var_404_12 = 1

				for iter_404_3, iter_404_4 in pairs(arg_401_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_404_4 then
						iter_404_4.color = Color.New(var_404_12, var_404_12, var_404_12)
					end
				end

				arg_401_1.var_.actorSpriteComps10059 = nil
			end

			local var_404_13 = arg_401_1.actors_["1061"]
			local var_404_14 = 0

			if var_404_14 < arg_401_1.time_ and arg_401_1.time_ <= var_404_14 + arg_404_0 and arg_401_1.var_.actorSpriteComps1061 == nil then
				arg_401_1.var_.actorSpriteComps1061 = var_404_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_404_15 = 0.034

			if var_404_14 <= arg_401_1.time_ and arg_401_1.time_ < var_404_14 + var_404_15 then
				local var_404_16 = (arg_401_1.time_ - var_404_14) / var_404_15

				if arg_401_1.var_.actorSpriteComps1061 then
					for iter_404_5, iter_404_6 in pairs(arg_401_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_404_6 then
							local var_404_17 = Mathf.Lerp(iter_404_6.color.r, 0.5, var_404_16)

							iter_404_6.color = Color.New(var_404_17, var_404_17, var_404_17)
						end
					end
				end
			end

			if arg_401_1.time_ >= var_404_14 + var_404_15 and arg_401_1.time_ < var_404_14 + var_404_15 + arg_404_0 and arg_401_1.var_.actorSpriteComps1061 then
				local var_404_18 = 0.5

				for iter_404_7, iter_404_8 in pairs(arg_401_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_404_8 then
						iter_404_8.color = Color.New(var_404_18, var_404_18, var_404_18)
					end
				end

				arg_401_1.var_.actorSpriteComps1061 = nil
			end

			local var_404_19 = 0
			local var_404_20 = 0.325

			if var_404_19 < arg_401_1.time_ and arg_401_1.time_ <= var_404_19 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_21 = arg_401_1:FormatText(StoryNameCfg[596].name)

				arg_401_1.leftNameTxt_.text = var_404_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_22 = arg_401_1:GetWordFromCfg(410161098)
				local var_404_23 = arg_401_1:FormatText(var_404_22.content)

				arg_401_1.text_.text = var_404_23

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_24 = 13
				local var_404_25 = utf8.len(var_404_23)
				local var_404_26 = var_404_24 <= 0 and var_404_20 or var_404_20 * (var_404_25 / var_404_24)

				if var_404_26 > 0 and var_404_20 < var_404_26 then
					arg_401_1.talkMaxDuration = var_404_26

					if var_404_26 + var_404_19 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_26 + var_404_19
					end
				end

				arg_401_1.text_.text = var_404_23
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161098", "story_v_out_410161.awb") ~= 0 then
					local var_404_27 = manager.audio:GetVoiceLength("story_v_out_410161", "410161098", "story_v_out_410161.awb") / 1000

					if var_404_27 + var_404_19 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_27 + var_404_19
					end

					if var_404_22.prefab_name ~= "" and arg_401_1.actors_[var_404_22.prefab_name] ~= nil then
						local var_404_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_22.prefab_name].transform, "story_v_out_410161", "410161098", "story_v_out_410161.awb")

						arg_401_1:RecordAudio("410161098", var_404_28)
						arg_401_1:RecordAudio("410161098", var_404_28)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_410161", "410161098", "story_v_out_410161.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_410161", "410161098", "story_v_out_410161.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_29 = math.max(var_404_20, arg_401_1.talkMaxDuration)

			if var_404_19 <= arg_401_1.time_ and arg_401_1.time_ < var_404_19 + var_404_29 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_19) / var_404_29

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_19 + var_404_29 and arg_401_1.time_ < var_404_19 + var_404_29 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play410161099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 410161099
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play410161100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1061"].transform
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 then
				arg_405_1.var_.moveOldPos1061 = var_408_0.localPosition
				var_408_0.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("1061", 7)

				local var_408_2 = var_408_0.childCount

				for iter_408_0 = 0, var_408_2 - 1 do
					local var_408_3 = var_408_0:GetChild(iter_408_0)

					if var_408_3.name == "" or not string.find(var_408_3.name, "split") then
						var_408_3.gameObject:SetActive(true)
					else
						var_408_3.gameObject:SetActive(false)
					end
				end
			end

			local var_408_4 = 0.001

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_4 then
				local var_408_5 = (arg_405_1.time_ - var_408_1) / var_408_4
				local var_408_6 = Vector3.New(0, -2000, 18)

				var_408_0.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos1061, var_408_6, var_408_5)
			end

			if arg_405_1.time_ >= var_408_1 + var_408_4 and arg_405_1.time_ < var_408_1 + var_408_4 + arg_408_0 then
				var_408_0.localPosition = Vector3.New(0, -2000, 18)
			end

			local var_408_7 = arg_405_1.actors_["10059"].transform
			local var_408_8 = 0

			if var_408_8 < arg_405_1.time_ and arg_405_1.time_ <= var_408_8 + arg_408_0 then
				arg_405_1.var_.moveOldPos10059 = var_408_7.localPosition
				var_408_7.localScale = Vector3.New(1, 1, 1)

				arg_405_1:CheckSpriteTmpPos("10059", 3)

				local var_408_9 = var_408_7.childCount

				for iter_408_1 = 0, var_408_9 - 1 do
					local var_408_10 = var_408_7:GetChild(iter_408_1)

					if var_408_10.name == "" or not string.find(var_408_10.name, "split") then
						var_408_10.gameObject:SetActive(true)
					else
						var_408_10.gameObject:SetActive(false)
					end
				end
			end

			local var_408_11 = 0.001

			if var_408_8 <= arg_405_1.time_ and arg_405_1.time_ < var_408_8 + var_408_11 then
				local var_408_12 = (arg_405_1.time_ - var_408_8) / var_408_11
				local var_408_13 = Vector3.New(0, -530, 35)

				var_408_7.localPosition = Vector3.Lerp(arg_405_1.var_.moveOldPos10059, var_408_13, var_408_12)
			end

			if arg_405_1.time_ >= var_408_8 + var_408_11 and arg_405_1.time_ < var_408_8 + var_408_11 + arg_408_0 then
				var_408_7.localPosition = Vector3.New(0, -530, 35)
			end

			local var_408_14 = arg_405_1.actors_["1061"]
			local var_408_15 = 0

			if var_408_15 < arg_405_1.time_ and arg_405_1.time_ <= var_408_15 + arg_408_0 and arg_405_1.var_.actorSpriteComps1061 == nil then
				arg_405_1.var_.actorSpriteComps1061 = var_408_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_16 = 0.034

			if var_408_15 <= arg_405_1.time_ and arg_405_1.time_ < var_408_15 + var_408_16 then
				local var_408_17 = (arg_405_1.time_ - var_408_15) / var_408_16

				if arg_405_1.var_.actorSpriteComps1061 then
					for iter_408_2, iter_408_3 in pairs(arg_405_1.var_.actorSpriteComps1061:ToTable()) do
						if iter_408_3 then
							local var_408_18 = Mathf.Lerp(iter_408_3.color.r, 0.5, var_408_17)

							iter_408_3.color = Color.New(var_408_18, var_408_18, var_408_18)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_15 + var_408_16 and arg_405_1.time_ < var_408_15 + var_408_16 + arg_408_0 and arg_405_1.var_.actorSpriteComps1061 then
				local var_408_19 = 0.5

				for iter_408_4, iter_408_5 in pairs(arg_405_1.var_.actorSpriteComps1061:ToTable()) do
					if iter_408_5 then
						iter_408_5.color = Color.New(var_408_19, var_408_19, var_408_19)
					end
				end

				arg_405_1.var_.actorSpriteComps1061 = nil
			end

			local var_408_20 = arg_405_1.actors_["10059"]
			local var_408_21 = 0

			if var_408_21 < arg_405_1.time_ and arg_405_1.time_ <= var_408_21 + arg_408_0 and arg_405_1.var_.actorSpriteComps10059 == nil then
				arg_405_1.var_.actorSpriteComps10059 = var_408_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_408_22 = 0.034

			if var_408_21 <= arg_405_1.time_ and arg_405_1.time_ < var_408_21 + var_408_22 then
				local var_408_23 = (arg_405_1.time_ - var_408_21) / var_408_22

				if arg_405_1.var_.actorSpriteComps10059 then
					for iter_408_6, iter_408_7 in pairs(arg_405_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_408_7 then
							local var_408_24 = Mathf.Lerp(iter_408_7.color.r, 0.5, var_408_23)

							iter_408_7.color = Color.New(var_408_24, var_408_24, var_408_24)
						end
					end
				end
			end

			if arg_405_1.time_ >= var_408_21 + var_408_22 and arg_405_1.time_ < var_408_21 + var_408_22 + arg_408_0 and arg_405_1.var_.actorSpriteComps10059 then
				local var_408_25 = 0.5

				for iter_408_8, iter_408_9 in pairs(arg_405_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_408_9 then
						iter_408_9.color = Color.New(var_408_25, var_408_25, var_408_25)
					end
				end

				arg_405_1.var_.actorSpriteComps10059 = nil
			end

			local var_408_26 = 0
			local var_408_27 = 0.8

			if var_408_26 < arg_405_1.time_ and arg_405_1.time_ <= var_408_26 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_28 = arg_405_1:GetWordFromCfg(410161099)
				local var_408_29 = arg_405_1:FormatText(var_408_28.content)

				arg_405_1.text_.text = var_408_29

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_30 = 32
				local var_408_31 = utf8.len(var_408_29)
				local var_408_32 = var_408_30 <= 0 and var_408_27 or var_408_27 * (var_408_31 / var_408_30)

				if var_408_32 > 0 and var_408_27 < var_408_32 then
					arg_405_1.talkMaxDuration = var_408_32

					if var_408_32 + var_408_26 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_32 + var_408_26
					end
				end

				arg_405_1.text_.text = var_408_29
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_33 = math.max(var_408_27, arg_405_1.talkMaxDuration)

			if var_408_26 <= arg_405_1.time_ and arg_405_1.time_ < var_408_26 + var_408_33 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_26) / var_408_33

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_26 + var_408_33 and arg_405_1.time_ < var_408_26 + var_408_33 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play410161100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 410161100
		arg_409_1.duration_ = 4.233

		local var_409_0 = {
			ja = 4.233,
			CriLanguages = 4,
			zh = 4
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
			arg_409_1.auto_ = false
		end

		function arg_409_1.playNext_(arg_411_0)
			arg_409_1.onStoryFinished_()
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = arg_409_1.actors_["10059"].transform
			local var_412_1 = 0

			if var_412_1 < arg_409_1.time_ and arg_409_1.time_ <= var_412_1 + arg_412_0 then
				arg_409_1.var_.moveOldPos10059 = var_412_0.localPosition
				var_412_0.localScale = Vector3.New(1, 1, 1)

				arg_409_1:CheckSpriteTmpPos("10059", 3)

				local var_412_2 = var_412_0.childCount

				for iter_412_0 = 0, var_412_2 - 1 do
					local var_412_3 = var_412_0:GetChild(iter_412_0)

					if var_412_3.name == "" or not string.find(var_412_3.name, "split") then
						var_412_3.gameObject:SetActive(true)
					else
						var_412_3.gameObject:SetActive(false)
					end
				end
			end

			local var_412_4 = 0.001

			if var_412_1 <= arg_409_1.time_ and arg_409_1.time_ < var_412_1 + var_412_4 then
				local var_412_5 = (arg_409_1.time_ - var_412_1) / var_412_4
				local var_412_6 = Vector3.New(0, -530, 35)

				var_412_0.localPosition = Vector3.Lerp(arg_409_1.var_.moveOldPos10059, var_412_6, var_412_5)
			end

			if arg_409_1.time_ >= var_412_1 + var_412_4 and arg_409_1.time_ < var_412_1 + var_412_4 + arg_412_0 then
				var_412_0.localPosition = Vector3.New(0, -530, 35)
			end

			local var_412_7 = arg_409_1.actors_["10059"]
			local var_412_8 = 0

			if var_412_8 < arg_409_1.time_ and arg_409_1.time_ <= var_412_8 + arg_412_0 and arg_409_1.var_.actorSpriteComps10059 == nil then
				arg_409_1.var_.actorSpriteComps10059 = var_412_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_412_9 = 0.034

			if var_412_8 <= arg_409_1.time_ and arg_409_1.time_ < var_412_8 + var_412_9 then
				local var_412_10 = (arg_409_1.time_ - var_412_8) / var_412_9

				if arg_409_1.var_.actorSpriteComps10059 then
					for iter_412_1, iter_412_2 in pairs(arg_409_1.var_.actorSpriteComps10059:ToTable()) do
						if iter_412_2 then
							local var_412_11 = Mathf.Lerp(iter_412_2.color.r, 1, var_412_10)

							iter_412_2.color = Color.New(var_412_11, var_412_11, var_412_11)
						end
					end
				end
			end

			if arg_409_1.time_ >= var_412_8 + var_412_9 and arg_409_1.time_ < var_412_8 + var_412_9 + arg_412_0 and arg_409_1.var_.actorSpriteComps10059 then
				local var_412_12 = 1

				for iter_412_3, iter_412_4 in pairs(arg_409_1.var_.actorSpriteComps10059:ToTable()) do
					if iter_412_4 then
						iter_412_4.color = Color.New(var_412_12, var_412_12, var_412_12)
					end
				end

				arg_409_1.var_.actorSpriteComps10059 = nil
			end

			local var_412_13 = 0
			local var_412_14 = 0.325

			if var_412_13 < arg_409_1.time_ and arg_409_1.time_ <= var_412_13 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_15 = arg_409_1:FormatText(StoryNameCfg[596].name)

				arg_409_1.leftNameTxt_.text = var_412_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_16 = arg_409_1:GetWordFromCfg(410161100)
				local var_412_17 = arg_409_1:FormatText(var_412_16.content)

				arg_409_1.text_.text = var_412_17

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_18 = 13
				local var_412_19 = utf8.len(var_412_17)
				local var_412_20 = var_412_18 <= 0 and var_412_14 or var_412_14 * (var_412_19 / var_412_18)

				if var_412_20 > 0 and var_412_14 < var_412_20 then
					arg_409_1.talkMaxDuration = var_412_20

					if var_412_20 + var_412_13 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_20 + var_412_13
					end
				end

				arg_409_1.text_.text = var_412_17
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_410161", "410161100", "story_v_out_410161.awb") ~= 0 then
					local var_412_21 = manager.audio:GetVoiceLength("story_v_out_410161", "410161100", "story_v_out_410161.awb") / 1000

					if var_412_21 + var_412_13 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_21 + var_412_13
					end

					if var_412_16.prefab_name ~= "" and arg_409_1.actors_[var_412_16.prefab_name] ~= nil then
						local var_412_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_16.prefab_name].transform, "story_v_out_410161", "410161100", "story_v_out_410161.awb")

						arg_409_1:RecordAudio("410161100", var_412_22)
						arg_409_1:RecordAudio("410161100", var_412_22)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_out_410161", "410161100", "story_v_out_410161.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_out_410161", "410161100", "story_v_out_410161.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_23 = math.max(var_412_14, arg_409_1.talkMaxDuration)

			if var_412_13 <= arg_409_1.time_ and arg_409_1.time_ < var_412_13 + var_412_23 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_13) / var_412_23

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_13 + var_412_23 and arg_409_1.time_ < var_412_13 + var_412_23 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST67",
		"Assets/UIResources/UI_AB/TextureConfig/Background/L04f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST62",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST63"
	},
	voices = {
		"story_v_out_410161.awb"
	}
}
