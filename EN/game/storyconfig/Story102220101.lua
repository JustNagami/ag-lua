return {
	Play222011001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 222011001
		arg_1_1.duration_ = 19.666

		local var_1_0 = {
			ja = 19.666,
			ko = 12.366,
			zh = 12.366
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
				arg_1_0:Play222011002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST52"

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
				local var_4_5 = arg_1_1.bgs_.ST52

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
					if iter_4_0 ~= "ST52" then
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
			local var_4_23 = 0.7

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 1.875
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_2_story_ruomuhuajing", "bgm_activity_2_2_story_ruomuhuajing", "bgm_activity_2_2_story_ruomuhuajing.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_30 = 2
			local var_4_31 = 0.875

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

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[36].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(222011001)
				local var_4_35 = arg_1_1:FormatText(var_4_34.content)

				arg_1_1.text_.text = var_4_35

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_36 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011001", "story_v_out_222011.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_222011", "222011001", "story_v_out_222011.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_222011", "222011001", "story_v_out_222011.awb")

						arg_1_1:RecordAudio("222011001", var_4_40)
						arg_1_1:RecordAudio("222011001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_222011", "222011001", "story_v_out_222011.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_222011", "222011001", "story_v_out_222011.awb")
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
	Play222011002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 222011002
		arg_7_1.duration_ = 10.2

		local var_7_0 = {
			ja = 10.2,
			ko = 6.1,
			zh = 6.1
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
				arg_7_0:Play222011003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.625

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[36].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(222011002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011002", "story_v_out_222011.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011002", "story_v_out_222011.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_222011", "222011002", "story_v_out_222011.awb")

						arg_7_1:RecordAudio("222011002", var_10_9)
						arg_7_1:RecordAudio("222011002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_222011", "222011002", "story_v_out_222011.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_222011", "222011002", "story_v_out_222011.awb")
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
	Play222011003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 222011003
		arg_11_1.duration_ = 8.566

		local var_11_0 = {
			ja = 8.566,
			ko = 3.233,
			zh = 3.233
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
				arg_11_0:Play222011004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.275

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[36].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(222011003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011003", "story_v_out_222011.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011003", "story_v_out_222011.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_222011", "222011003", "story_v_out_222011.awb")

						arg_11_1:RecordAudio("222011003", var_14_9)
						arg_11_1:RecordAudio("222011003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_222011", "222011003", "story_v_out_222011.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_222011", "222011003", "story_v_out_222011.awb")
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
	Play222011004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 222011004
		arg_15_1.duration_ = 0.499999999999

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"

			SetActive(arg_15_1.choicesGo_, true)

			for iter_16_0, iter_16_1 in ipairs(arg_15_1.choices_) do
				local var_16_0 = iter_16_0 <= 1

				SetActive(iter_16_1.go, var_16_0)
			end

			arg_15_1.choices_[1].txt.text = arg_15_1:FormatText(StoryChoiceCfg[455].name)
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play222011005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.allBtn_.enabled = false
			end

			local var_18_1 = 0.5

			if arg_15_1.time_ >= var_18_0 + var_18_1 and arg_15_1.time_ < var_18_0 + var_18_1 + arg_18_0 then
				arg_15_1.allBtn_.enabled = true
			end
		end
	end,
	Play222011005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 222011005
		arg_19_1.duration_ = 8.233

		local var_19_0 = {
			ja = 8.233,
			ko = 5.266,
			zh = 5.266
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
				arg_19_0:Play222011006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.45

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[36].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(222011005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011005", "story_v_out_222011.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011005", "story_v_out_222011.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_222011", "222011005", "story_v_out_222011.awb")

						arg_19_1:RecordAudio("222011005", var_22_9)
						arg_19_1:RecordAudio("222011005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_222011", "222011005", "story_v_out_222011.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_222011", "222011005", "story_v_out_222011.awb")
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
	Play222011006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 222011006
		arg_23_1.duration_ = 0.499999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"

			SetActive(arg_23_1.choicesGo_, true)

			for iter_24_0, iter_24_1 in ipairs(arg_23_1.choices_) do
				local var_24_0 = iter_24_0 <= 1

				SetActive(iter_24_1.go, var_24_0)
			end

			arg_23_1.choices_[1].txt.text = arg_23_1:FormatText(StoryChoiceCfg[456].name)
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play222011007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.allBtn_.enabled = false
			end

			local var_26_1 = 0.5

			if arg_23_1.time_ >= var_26_0 + var_26_1 and arg_23_1.time_ < var_26_0 + var_26_1 + arg_26_0 then
				arg_23_1.allBtn_.enabled = true
			end
		end
	end,
	Play222011007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 222011007
		arg_27_1.duration_ = 15.1

		local var_27_0 = {
			ja = 15.1,
			ko = 7.7,
			zh = 7.7
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
				arg_27_0:Play222011008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.825

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[36].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(222011007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011007", "story_v_out_222011.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011007", "story_v_out_222011.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_222011", "222011007", "story_v_out_222011.awb")

						arg_27_1:RecordAudio("222011007", var_30_9)
						arg_27_1:RecordAudio("222011007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_222011", "222011007", "story_v_out_222011.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_222011", "222011007", "story_v_out_222011.awb")
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
	Play222011008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 222011008
		arg_31_1.duration_ = 17.533

		local var_31_0 = {
			ja = 17.533,
			ko = 9.8,
			zh = 9.8
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
				arg_31_0:Play222011009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 1.025

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[36].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(222011008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011008", "story_v_out_222011.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011008", "story_v_out_222011.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_222011", "222011008", "story_v_out_222011.awb")

						arg_31_1:RecordAudio("222011008", var_34_9)
						arg_31_1:RecordAudio("222011008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_222011", "222011008", "story_v_out_222011.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_222011", "222011008", "story_v_out_222011.awb")
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
	Play222011009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 222011009
		arg_35_1.duration_ = 5.166

		local var_35_0 = {
			ja = 5.166,
			ko = 1.533,
			zh = 1.533
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
				arg_35_0:Play222011010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.125

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[36].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(222011009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011009", "story_v_out_222011.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011009", "story_v_out_222011.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_222011", "222011009", "story_v_out_222011.awb")

						arg_35_1:RecordAudio("222011009", var_38_9)
						arg_35_1:RecordAudio("222011009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_222011", "222011009", "story_v_out_222011.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_222011", "222011009", "story_v_out_222011.awb")
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
	Play222011010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 222011010
		arg_39_1.duration_ = 0.499999999999

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"

			SetActive(arg_39_1.choicesGo_, true)

			for iter_40_0, iter_40_1 in ipairs(arg_39_1.choices_) do
				local var_40_0 = iter_40_0 <= 2

				SetActive(iter_40_1.go, var_40_0)
			end

			arg_39_1.choices_[1].txt.text = arg_39_1:FormatText(StoryChoiceCfg[457].name)
			arg_39_1.choices_[2].txt.text = arg_39_1:FormatText(StoryChoiceCfg[458].name)
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play222011011(arg_39_1)
			end

			if arg_41_0 == 2 then
				arg_39_0:Play222011011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.allBtn_.enabled = false
			end

			local var_42_1 = 0.5

			if arg_39_1.time_ >= var_42_0 + var_42_1 and arg_39_1.time_ < var_42_0 + var_42_1 + arg_42_0 then
				arg_39_1.allBtn_.enabled = true
			end
		end
	end,
	Play222011011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 222011011
		arg_43_1.duration_ = 7.6

		local var_43_0 = {
			ja = 7.6,
			ko = 5,
			zh = 5
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
				arg_43_0:Play222011012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.55

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[36].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, true)
				arg_43_1.iconController_:SetSelectedState("hero")

				arg_43_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(222011011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 22
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011011", "story_v_out_222011.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011011", "story_v_out_222011.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_222011", "222011011", "story_v_out_222011.awb")

						arg_43_1:RecordAudio("222011011", var_46_9)
						arg_43_1:RecordAudio("222011011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_222011", "222011011", "story_v_out_222011.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_222011", "222011011", "story_v_out_222011.awb")
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
	Play222011012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 222011012
		arg_47_1.duration_ = 9.5

		local var_47_0 = {
			ja = 9.5,
			ko = 5.566,
			zh = 5.566
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
				arg_47_0:Play222011013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.45

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[36].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(222011012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011012", "story_v_out_222011.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011012", "story_v_out_222011.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_222011", "222011012", "story_v_out_222011.awb")

						arg_47_1:RecordAudio("222011012", var_50_9)
						arg_47_1:RecordAudio("222011012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_222011", "222011012", "story_v_out_222011.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_222011", "222011012", "story_v_out_222011.awb")
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
	Play222011013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 222011013
		arg_51_1.duration_ = 0.499999999999

		SetActive(arg_51_1.tipsGo_, false)

		function arg_51_1.onSingleLineFinish_()
			arg_51_1.onSingleLineUpdate_ = nil
			arg_51_1.onSingleLineFinish_ = nil
			arg_51_1.state_ = "waiting"

			SetActive(arg_51_1.choicesGo_, true)

			for iter_52_0, iter_52_1 in ipairs(arg_51_1.choices_) do
				local var_52_0 = iter_52_0 <= 1

				SetActive(iter_52_1.go, var_52_0)
			end

			arg_51_1.choices_[1].txt.text = arg_51_1:FormatText(StoryChoiceCfg[459].name)
		end

		function arg_51_1.playNext_(arg_53_0)
			if arg_53_0 == 1 then
				arg_51_0:Play222011014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.allBtn_.enabled = false
			end

			local var_54_1 = 0.5

			if arg_51_1.time_ >= var_54_0 + var_54_1 and arg_51_1.time_ < var_54_0 + var_54_1 + arg_54_0 then
				arg_51_1.allBtn_.enabled = true
			end
		end
	end,
	Play222011014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 222011014
		arg_55_1.duration_ = 12.333

		local var_55_0 = {
			ja = 12.333,
			ko = 7.766,
			zh = 7.766
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
				arg_55_0:Play222011015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.725

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[36].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(222011014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 29
				local var_58_6 = utf8.len(var_58_4)
				local var_58_7 = var_58_5 <= 0 and var_58_1 or var_58_1 * (var_58_6 / var_58_5)

				if var_58_7 > 0 and var_58_1 < var_58_7 then
					arg_55_1.talkMaxDuration = var_58_7

					if var_58_7 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_7 + var_58_0
					end
				end

				arg_55_1.text_.text = var_58_4
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011014", "story_v_out_222011.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011014", "story_v_out_222011.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_222011", "222011014", "story_v_out_222011.awb")

						arg_55_1:RecordAudio("222011014", var_58_9)
						arg_55_1:RecordAudio("222011014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_222011", "222011014", "story_v_out_222011.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_222011", "222011014", "story_v_out_222011.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_10 = math.max(var_58_1, arg_55_1.talkMaxDuration)

			if var_58_0 <= arg_55_1.time_ and arg_55_1.time_ < var_58_0 + var_58_10 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_0) / var_58_10

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_0 + var_58_10 and arg_55_1.time_ < var_58_0 + var_58_10 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play222011015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 222011015
		arg_59_1.duration_ = 16.9

		local var_59_0 = {
			ja = 16.9,
			ko = 7.133,
			zh = 7.133
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
				arg_59_0:Play222011016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.625

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[36].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, true)
				arg_59_1.iconController_:SetSelectedState("hero")

				arg_59_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_shadoww")

				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(222011015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011015", "story_v_out_222011.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011015", "story_v_out_222011.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_222011", "222011015", "story_v_out_222011.awb")

						arg_59_1:RecordAudio("222011015", var_62_9)
						arg_59_1:RecordAudio("222011015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_222011", "222011015", "story_v_out_222011.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_222011", "222011015", "story_v_out_222011.awb")
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
	Play222011016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 222011016
		arg_63_1.duration_ = 0.499999999999

		SetActive(arg_63_1.tipsGo_, false)

		function arg_63_1.onSingleLineFinish_()
			arg_63_1.onSingleLineUpdate_ = nil
			arg_63_1.onSingleLineFinish_ = nil
			arg_63_1.state_ = "waiting"

			SetActive(arg_63_1.choicesGo_, true)

			for iter_64_0, iter_64_1 in ipairs(arg_63_1.choices_) do
				local var_64_0 = iter_64_0 <= 1

				SetActive(iter_64_1.go, var_64_0)
			end

			arg_63_1.choices_[1].txt.text = arg_63_1:FormatText(StoryChoiceCfg[460].name)
		end

		function arg_63_1.playNext_(arg_65_0)
			if arg_65_0 == 1 then
				arg_63_0:Play222011017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.allBtn_.enabled = false
			end

			local var_66_1 = 0.5

			if arg_63_1.time_ >= var_66_0 + var_66_1 and arg_63_1.time_ < var_66_0 + var_66_1 + arg_66_0 then
				arg_63_1.allBtn_.enabled = true
			end
		end
	end,
	Play222011017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 222011017
		arg_67_1.duration_ = 8.666

		local var_67_0 = {
			ja = 8.5,
			ko = 8.666,
			zh = 8.666
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
				arg_67_0:Play222011018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "ST47"

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
				local var_70_5 = arg_67_1.bgs_.ST47

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
					if iter_70_0 ~= "ST47" then
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

			local var_70_17 = 2

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

			local var_70_21 = 2

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

			local var_70_27 = "1074ui_story"

			if arg_67_1.actors_[var_70_27] == nil then
				local var_70_28 = Object.Instantiate(Asset.Load("Char/" .. var_70_27), arg_67_1.stage_.transform)

				var_70_28.name = var_70_27
				var_70_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_27] = var_70_28

				local var_70_29 = var_70_28:GetComponentInChildren(typeof(CharacterEffect))

				var_70_29.enabled = true

				local var_70_30 = GameObjectTools.GetOrAddComponent(var_70_28, typeof(DynamicBoneHelper))

				if var_70_30 then
					var_70_30:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_29.transform, false)

				arg_67_1.var_[var_70_27 .. "Animator"] = var_70_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_27 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_27 .. "LipSync"] = var_70_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_31 = arg_67_1.actors_["1074ui_story"].transform
			local var_70_32 = 3.8

			if var_70_32 < arg_67_1.time_ and arg_67_1.time_ <= var_70_32 + arg_70_0 then
				arg_67_1.var_.moveOldPos1074ui_story = var_70_31.localPosition
			end

			local var_70_33 = 0.001

			if var_70_32 <= arg_67_1.time_ and arg_67_1.time_ < var_70_32 + var_70_33 then
				local var_70_34 = (arg_67_1.time_ - var_70_32) / var_70_33
				local var_70_35 = Vector3.New(-0.7, -1.055, -6.12)

				var_70_31.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos1074ui_story, var_70_35, var_70_34)

				local var_70_36 = manager.ui.mainCamera.transform.position - var_70_31.position

				var_70_31.forward = Vector3.New(var_70_36.x, var_70_36.y, var_70_36.z)

				local var_70_37 = var_70_31.localEulerAngles

				var_70_37.z = 0
				var_70_37.x = 0
				var_70_31.localEulerAngles = var_70_37
			end

			if arg_67_1.time_ >= var_70_32 + var_70_33 and arg_67_1.time_ < var_70_32 + var_70_33 + arg_70_0 then
				var_70_31.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_70_38 = manager.ui.mainCamera.transform.position - var_70_31.position

				var_70_31.forward = Vector3.New(var_70_38.x, var_70_38.y, var_70_38.z)

				local var_70_39 = var_70_31.localEulerAngles

				var_70_39.z = 0
				var_70_39.x = 0
				var_70_31.localEulerAngles = var_70_39
			end

			local var_70_40 = arg_67_1.actors_["1074ui_story"]
			local var_70_41 = 3.8

			if var_70_41 < arg_67_1.time_ and arg_67_1.time_ <= var_70_41 + arg_70_0 and arg_67_1.var_.characterEffect1074ui_story == nil then
				arg_67_1.var_.characterEffect1074ui_story = var_70_40:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_42 = 0.200000002980232

			if var_70_41 <= arg_67_1.time_ and arg_67_1.time_ < var_70_41 + var_70_42 then
				local var_70_43 = (arg_67_1.time_ - var_70_41) / var_70_42

				if arg_67_1.var_.characterEffect1074ui_story then
					arg_67_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_67_1.time_ >= var_70_41 + var_70_42 and arg_67_1.time_ < var_70_41 + var_70_42 + arg_70_0 and arg_67_1.var_.characterEffect1074ui_story then
				arg_67_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_70_44 = 3.8

			if var_70_44 < arg_67_1.time_ and arg_67_1.time_ <= var_70_44 + arg_70_0 then
				arg_67_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_70_45 = 3.8

			if var_70_45 < arg_67_1.time_ and arg_67_1.time_ <= var_70_45 + arg_70_0 then
				arg_67_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_70_46 = "10044ui_story"

			if arg_67_1.actors_[var_70_46] == nil then
				local var_70_47 = Object.Instantiate(Asset.Load("Char/" .. var_70_46), arg_67_1.stage_.transform)

				var_70_47.name = var_70_46
				var_70_47.transform.localPosition = Vector3.New(0, 100, 0)
				arg_67_1.actors_[var_70_46] = var_70_47

				local var_70_48 = var_70_47:GetComponentInChildren(typeof(CharacterEffect))

				var_70_48.enabled = true

				local var_70_49 = GameObjectTools.GetOrAddComponent(var_70_47, typeof(DynamicBoneHelper))

				if var_70_49 then
					var_70_49:EnableDynamicBone(false)
				end

				arg_67_1:ShowWeapon(var_70_48.transform, false)

				arg_67_1.var_[var_70_46 .. "Animator"] = var_70_48.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_67_1.var_[var_70_46 .. "Animator"].applyRootMotion = true
				arg_67_1.var_[var_70_46 .. "LipSync"] = var_70_48.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_70_50 = arg_67_1.actors_["10044ui_story"].transform
			local var_70_51 = 3.8

			if var_70_51 < arg_67_1.time_ and arg_67_1.time_ <= var_70_51 + arg_70_0 then
				arg_67_1.var_.moveOldPos10044ui_story = var_70_50.localPosition
			end

			local var_70_52 = 0.001

			if var_70_51 <= arg_67_1.time_ and arg_67_1.time_ < var_70_51 + var_70_52 then
				local var_70_53 = (arg_67_1.time_ - var_70_51) / var_70_52
				local var_70_54 = Vector3.New(0.7, -0.72, -6.3)

				var_70_50.localPosition = Vector3.Lerp(arg_67_1.var_.moveOldPos10044ui_story, var_70_54, var_70_53)

				local var_70_55 = manager.ui.mainCamera.transform.position - var_70_50.position

				var_70_50.forward = Vector3.New(var_70_55.x, var_70_55.y, var_70_55.z)

				local var_70_56 = var_70_50.localEulerAngles

				var_70_56.z = 0
				var_70_56.x = 0
				var_70_50.localEulerAngles = var_70_56
			end

			if arg_67_1.time_ >= var_70_51 + var_70_52 and arg_67_1.time_ < var_70_51 + var_70_52 + arg_70_0 then
				var_70_50.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_70_57 = manager.ui.mainCamera.transform.position - var_70_50.position

				var_70_50.forward = Vector3.New(var_70_57.x, var_70_57.y, var_70_57.z)

				local var_70_58 = var_70_50.localEulerAngles

				var_70_58.z = 0
				var_70_58.x = 0
				var_70_50.localEulerAngles = var_70_58
			end

			local var_70_59 = arg_67_1.actors_["10044ui_story"]
			local var_70_60 = 3.8

			if var_70_60 < arg_67_1.time_ and arg_67_1.time_ <= var_70_60 + arg_70_0 and arg_67_1.var_.characterEffect10044ui_story == nil then
				arg_67_1.var_.characterEffect10044ui_story = var_70_59:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_70_61 = 0.200000002980232

			if var_70_60 <= arg_67_1.time_ and arg_67_1.time_ < var_70_60 + var_70_61 then
				local var_70_62 = (arg_67_1.time_ - var_70_60) / var_70_61

				if arg_67_1.var_.characterEffect10044ui_story then
					local var_70_63 = Mathf.Lerp(0, 0.5, var_70_62)

					arg_67_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_67_1.var_.characterEffect10044ui_story.fillRatio = var_70_63
				end
			end

			if arg_67_1.time_ >= var_70_60 + var_70_61 and arg_67_1.time_ < var_70_60 + var_70_61 + arg_70_0 and arg_67_1.var_.characterEffect10044ui_story then
				local var_70_64 = 0.5

				arg_67_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_67_1.var_.characterEffect10044ui_story.fillRatio = var_70_64
			end

			local var_70_65 = 3.8

			if var_70_65 < arg_67_1.time_ and arg_67_1.time_ <= var_70_65 + arg_70_0 then
				arg_67_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_70_66 = arg_67_1.actors_["10044ui_story"]
			local var_70_67 = 3.8

			if var_70_67 < arg_67_1.time_ and arg_67_1.time_ <= var_70_67 + arg_70_0 then
				if arg_67_1.var_.characterEffect10044ui_story == nil then
					arg_67_1.var_.characterEffect10044ui_story = var_70_66:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_70_68 = arg_67_1.var_.characterEffect10044ui_story

				var_70_68.imageEffect:turnOff()

				var_70_68.interferenceEffect.enabled = true
				var_70_68.interferenceEffect.noise = 0.001
				var_70_68.interferenceEffect.simTimeScale = 1
				var_70_68.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_70_69 = arg_67_1.actors_["10044ui_story"]
			local var_70_70 = 3.8
			local var_70_71 = 0.1

			if var_70_70 < arg_67_1.time_ and arg_67_1.time_ <= var_70_70 + arg_70_0 then
				if arg_67_1.var_.characterEffect10044ui_story == nil then
					arg_67_1.var_.characterEffect10044ui_story = var_70_69:GetComponentInChildren(typeof(CharacterEffect))
				end

				arg_67_1.var_.characterEffect10044ui_story.imageEffect:turnOn(false)
			end

			local var_70_72 = 0
			local var_70_73 = 1

			if var_70_72 < arg_67_1.time_ and arg_67_1.time_ <= var_70_72 + arg_70_0 then
				local var_70_74 = "play"
				local var_70_75 = "effect"

				arg_67_1:AudioAction(var_70_74, var_70_75, "se_story_v1_environment_crowd", "se_story_v1_environment_crowd", "se_story_v1_environment_crowd.awb")
			end

			local var_70_76 = 0
			local var_70_77 = 0.7

			if var_70_76 < arg_67_1.time_ and arg_67_1.time_ <= var_70_76 + arg_70_0 then
				local var_70_78 = "play"
				local var_70_79 = "music"

				arg_67_1:AudioAction(var_70_78, var_70_79, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_70_80 = 1.875
			local var_70_81 = 1

			if var_70_80 < arg_67_1.time_ and arg_67_1.time_ <= var_70_80 + arg_70_0 then
				local var_70_82 = "play"
				local var_70_83 = "music"

				arg_67_1:AudioAction(var_70_82, var_70_83, "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city", "bgm_activity_2_1_story_city.awb")
			end

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_84 = 4
			local var_70_85 = 0.6

			if var_70_84 < arg_67_1.time_ and arg_67_1.time_ <= var_70_84 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_86 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_86:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_86:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_86:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_87 = arg_67_1:FormatText(StoryNameCfg[410].name)

				arg_67_1.leftNameTxt_.text = var_70_87

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_88 = arg_67_1:GetWordFromCfg(222011017)
				local var_70_89 = arg_67_1:FormatText(var_70_88.content)

				arg_67_1.text_.text = var_70_89

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_90 = 24
				local var_70_91 = utf8.len(var_70_89)
				local var_70_92 = var_70_90 <= 0 and var_70_85 or var_70_85 * (var_70_91 / var_70_90)

				if var_70_92 > 0 and var_70_85 < var_70_92 then
					arg_67_1.talkMaxDuration = var_70_92
					var_70_84 = var_70_84 + 0.3

					if var_70_92 + var_70_84 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_92 + var_70_84
					end
				end

				arg_67_1.text_.text = var_70_89
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011017", "story_v_out_222011.awb") ~= 0 then
					local var_70_93 = manager.audio:GetVoiceLength("story_v_out_222011", "222011017", "story_v_out_222011.awb") / 1000

					if var_70_93 + var_70_84 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_93 + var_70_84
					end

					if var_70_88.prefab_name ~= "" and arg_67_1.actors_[var_70_88.prefab_name] ~= nil then
						local var_70_94 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_88.prefab_name].transform, "story_v_out_222011", "222011017", "story_v_out_222011.awb")

						arg_67_1:RecordAudio("222011017", var_70_94)
						arg_67_1:RecordAudio("222011017", var_70_94)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_222011", "222011017", "story_v_out_222011.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_222011", "222011017", "story_v_out_222011.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_95 = var_70_84 + 0.3
			local var_70_96 = math.max(var_70_85, arg_67_1.talkMaxDuration)

			if var_70_95 <= arg_67_1.time_ and arg_67_1.time_ < var_70_95 + var_70_96 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_95) / var_70_96

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_95 + var_70_96 and arg_67_1.time_ < var_70_95 + var_70_96 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play222011018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 222011018
		arg_73_1.duration_ = 1.999999999999

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play222011019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1074ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1074ui_story == nil then
				arg_73_1.var_.characterEffect1074ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1074ui_story then
					arg_73_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1074ui_story then
				arg_73_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_76_4 = 0

			if var_76_4 < arg_73_1.time_ and arg_73_1.time_ <= var_76_4 + arg_76_0 then
				arg_73_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_76_5 = 0
			local var_76_6 = 0.125

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_7 = arg_73_1:FormatText(StoryNameCfg[410].name)

				arg_73_1.leftNameTxt_.text = var_76_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_8 = arg_73_1:GetWordFromCfg(222011018)
				local var_76_9 = arg_73_1:FormatText(var_76_8.content)

				arg_73_1.text_.text = var_76_9

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_10 = 5
				local var_76_11 = utf8.len(var_76_9)
				local var_76_12 = var_76_10 <= 0 and var_76_6 or var_76_6 * (var_76_11 / var_76_10)

				if var_76_12 > 0 and var_76_6 < var_76_12 then
					arg_73_1.talkMaxDuration = var_76_12

					if var_76_12 + var_76_5 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_12 + var_76_5
					end
				end

				arg_73_1.text_.text = var_76_9
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011018", "story_v_out_222011.awb") ~= 0 then
					local var_76_13 = manager.audio:GetVoiceLength("story_v_out_222011", "222011018", "story_v_out_222011.awb") / 1000

					if var_76_13 + var_76_5 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_5
					end

					if var_76_8.prefab_name ~= "" and arg_73_1.actors_[var_76_8.prefab_name] ~= nil then
						local var_76_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_8.prefab_name].transform, "story_v_out_222011", "222011018", "story_v_out_222011.awb")

						arg_73_1:RecordAudio("222011018", var_76_14)
						arg_73_1:RecordAudio("222011018", var_76_14)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_222011", "222011018", "story_v_out_222011.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_222011", "222011018", "story_v_out_222011.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_15 = math.max(var_76_6, arg_73_1.talkMaxDuration)

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_15 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_5) / var_76_15

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_5 + var_76_15 and arg_73_1.time_ < var_76_5 + var_76_15 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play222011019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 222011019
		arg_77_1.duration_ = 8.233

		local var_77_0 = {
			ja = 8.233,
			ko = 6.033,
			zh = 6.033
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
				arg_77_0:Play222011020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10044ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect10044ui_story == nil then
				arg_77_1.var_.characterEffect10044ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect10044ui_story then
					arg_77_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect10044ui_story then
				arg_77_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_80_4 = 0

			if var_80_4 < arg_77_1.time_ and arg_77_1.time_ <= var_80_4 + arg_80_0 then
				arg_77_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_80_5 = 0

			if var_80_5 < arg_77_1.time_ and arg_77_1.time_ <= var_80_5 + arg_80_0 then
				arg_77_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_80_6 = arg_77_1.actors_["1074ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect1074ui_story == nil then
				arg_77_1.var_.characterEffect1074ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.200000002980232

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect1074ui_story then
					local var_80_10 = Mathf.Lerp(0, 0.5, var_80_9)

					arg_77_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_77_1.var_.characterEffect1074ui_story.fillRatio = var_80_10
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect1074ui_story then
				local var_80_11 = 0.5

				arg_77_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_77_1.var_.characterEffect1074ui_story.fillRatio = var_80_11
			end

			local var_80_12 = 0
			local var_80_13 = 0.725

			if var_80_12 < arg_77_1.time_ and arg_77_1.time_ <= var_80_12 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_14 = arg_77_1:FormatText(StoryNameCfg[380].name)

				arg_77_1.leftNameTxt_.text = var_80_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_15 = arg_77_1:GetWordFromCfg(222011019)
				local var_80_16 = arg_77_1:FormatText(var_80_15.content)

				arg_77_1.text_.text = var_80_16

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_17 = 29
				local var_80_18 = utf8.len(var_80_16)
				local var_80_19 = var_80_17 <= 0 and var_80_13 or var_80_13 * (var_80_18 / var_80_17)

				if var_80_19 > 0 and var_80_13 < var_80_19 then
					arg_77_1.talkMaxDuration = var_80_19

					if var_80_19 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_19 + var_80_12
					end
				end

				arg_77_1.text_.text = var_80_16
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011019", "story_v_out_222011.awb") ~= 0 then
					local var_80_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011019", "story_v_out_222011.awb") / 1000

					if var_80_20 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_20 + var_80_12
					end

					if var_80_15.prefab_name ~= "" and arg_77_1.actors_[var_80_15.prefab_name] ~= nil then
						local var_80_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_15.prefab_name].transform, "story_v_out_222011", "222011019", "story_v_out_222011.awb")

						arg_77_1:RecordAudio("222011019", var_80_21)
						arg_77_1:RecordAudio("222011019", var_80_21)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_222011", "222011019", "story_v_out_222011.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_222011", "222011019", "story_v_out_222011.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_22 = math.max(var_80_13, arg_77_1.talkMaxDuration)

			if var_80_12 <= arg_77_1.time_ and arg_77_1.time_ < var_80_12 + var_80_22 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_12) / var_80_22

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_12 + var_80_22 and arg_77_1.time_ < var_80_12 + var_80_22 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play222011020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 222011020
		arg_81_1.duration_ = 11.3

		local var_81_0 = {
			ja = 8.933,
			ko = 11.3,
			zh = 11.3
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
				arg_81_0:Play222011021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10044ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect10044ui_story == nil then
				arg_81_1.var_.characterEffect10044ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect10044ui_story then
					arg_81_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect10044ui_story then
				arg_81_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_84_4 = 0

			if var_84_4 < arg_81_1.time_ and arg_81_1.time_ <= var_84_4 + arg_84_0 then
				arg_81_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action435")
			end

			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 then
				arg_81_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_84_6 = 0
			local var_84_7 = 1.1

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[380].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(222011020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 44
				local var_84_12 = utf8.len(var_84_10)
				local var_84_13 = var_84_11 <= 0 and var_84_7 or var_84_7 * (var_84_12 / var_84_11)

				if var_84_13 > 0 and var_84_7 < var_84_13 then
					arg_81_1.talkMaxDuration = var_84_13

					if var_84_13 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_13 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_10
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011020", "story_v_out_222011.awb") ~= 0 then
					local var_84_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011020", "story_v_out_222011.awb") / 1000

					if var_84_14 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_14 + var_84_6
					end

					if var_84_9.prefab_name ~= "" and arg_81_1.actors_[var_84_9.prefab_name] ~= nil then
						local var_84_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_9.prefab_name].transform, "story_v_out_222011", "222011020", "story_v_out_222011.awb")

						arg_81_1:RecordAudio("222011020", var_84_15)
						arg_81_1:RecordAudio("222011020", var_84_15)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_222011", "222011020", "story_v_out_222011.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_222011", "222011020", "story_v_out_222011.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_16 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_16 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_16

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_16 and arg_81_1.time_ < var_84_6 + var_84_16 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play222011021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 222011021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play222011022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["10044ui_story"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.characterEffect10044ui_story == nil then
				arg_85_1.var_.characterEffect10044ui_story = var_88_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_88_2 = 0.200000002980232

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.characterEffect10044ui_story then
					local var_88_4 = Mathf.Lerp(0, 0.5, var_88_3)

					arg_85_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_85_1.var_.characterEffect10044ui_story.fillRatio = var_88_4
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.characterEffect10044ui_story then
				local var_88_5 = 0.5

				arg_85_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_85_1.var_.characterEffect10044ui_story.fillRatio = var_88_5
			end

			local var_88_6 = arg_85_1.actors_["1074ui_story"].transform
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 then
				arg_85_1.var_.moveOldPos1074ui_story = var_88_6.localPosition
			end

			local var_88_8 = 0.001

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8
				local var_88_10 = Vector3.New(0, 100, 0)

				var_88_6.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos1074ui_story, var_88_10, var_88_9)

				local var_88_11 = manager.ui.mainCamera.transform.position - var_88_6.position

				var_88_6.forward = Vector3.New(var_88_11.x, var_88_11.y, var_88_11.z)

				local var_88_12 = var_88_6.localEulerAngles

				var_88_12.z = 0
				var_88_12.x = 0
				var_88_6.localEulerAngles = var_88_12
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 then
				var_88_6.localPosition = Vector3.New(0, 100, 0)

				local var_88_13 = manager.ui.mainCamera.transform.position - var_88_6.position

				var_88_6.forward = Vector3.New(var_88_13.x, var_88_13.y, var_88_13.z)

				local var_88_14 = var_88_6.localEulerAngles

				var_88_14.z = 0
				var_88_14.x = 0
				var_88_6.localEulerAngles = var_88_14
			end

			local var_88_15 = arg_85_1.actors_["10044ui_story"].transform
			local var_88_16 = 0

			if var_88_16 < arg_85_1.time_ and arg_85_1.time_ <= var_88_16 + arg_88_0 then
				arg_85_1.var_.moveOldPos10044ui_story = var_88_15.localPosition
			end

			local var_88_17 = 0.001

			if var_88_16 <= arg_85_1.time_ and arg_85_1.time_ < var_88_16 + var_88_17 then
				local var_88_18 = (arg_85_1.time_ - var_88_16) / var_88_17
				local var_88_19 = Vector3.New(0, 100, 0)

				var_88_15.localPosition = Vector3.Lerp(arg_85_1.var_.moveOldPos10044ui_story, var_88_19, var_88_18)

				local var_88_20 = manager.ui.mainCamera.transform.position - var_88_15.position

				var_88_15.forward = Vector3.New(var_88_20.x, var_88_20.y, var_88_20.z)

				local var_88_21 = var_88_15.localEulerAngles

				var_88_21.z = 0
				var_88_21.x = 0
				var_88_15.localEulerAngles = var_88_21
			end

			if arg_85_1.time_ >= var_88_16 + var_88_17 and arg_85_1.time_ < var_88_16 + var_88_17 + arg_88_0 then
				var_88_15.localPosition = Vector3.New(0, 100, 0)

				local var_88_22 = manager.ui.mainCamera.transform.position - var_88_15.position

				var_88_15.forward = Vector3.New(var_88_22.x, var_88_22.y, var_88_22.z)

				local var_88_23 = var_88_15.localEulerAngles

				var_88_23.z = 0
				var_88_23.x = 0
				var_88_15.localEulerAngles = var_88_23
			end

			local var_88_24 = 0
			local var_88_25 = 1.65

			if var_88_24 < arg_85_1.time_ and arg_85_1.time_ <= var_88_24 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_26 = arg_85_1:GetWordFromCfg(222011021)
				local var_88_27 = arg_85_1:FormatText(var_88_26.content)

				arg_85_1.text_.text = var_88_27

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_28 = 66
				local var_88_29 = utf8.len(var_88_27)
				local var_88_30 = var_88_28 <= 0 and var_88_25 or var_88_25 * (var_88_29 / var_88_28)

				if var_88_30 > 0 and var_88_25 < var_88_30 then
					arg_85_1.talkMaxDuration = var_88_30

					if var_88_30 + var_88_24 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_30 + var_88_24
					end
				end

				arg_85_1.text_.text = var_88_27
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_31 = math.max(var_88_25, arg_85_1.talkMaxDuration)

			if var_88_24 <= arg_85_1.time_ and arg_85_1.time_ < var_88_24 + var_88_31 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_24) / var_88_31

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_24 + var_88_31 and arg_85_1.time_ < var_88_24 + var_88_31 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play222011022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 222011022
		arg_89_1.duration_ = 2.433

		local var_89_0 = {
			ja = 2.433,
			ko = 2.333,
			zh = 2.333
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
				arg_89_0:Play222011023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1074ui_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1074ui_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1074ui_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = arg_89_1.actors_["1074ui_story"]
			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 and arg_89_1.var_.characterEffect1074ui_story == nil then
				arg_89_1.var_.characterEffect1074ui_story = var_92_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_11 = 0.200000002980232

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_11 then
				local var_92_12 = (arg_89_1.time_ - var_92_10) / var_92_11

				if arg_89_1.var_.characterEffect1074ui_story then
					arg_89_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_10 + var_92_11 and arg_89_1.time_ < var_92_10 + var_92_11 + arg_92_0 and arg_89_1.var_.characterEffect1074ui_story then
				arg_89_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_92_13 = 0

			if var_92_13 < arg_89_1.time_ and arg_89_1.time_ <= var_92_13 + arg_92_0 then
				arg_89_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_92_14 = arg_89_1.actors_["10044ui_story"].transform
			local var_92_15 = 0

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 then
				arg_89_1.var_.moveOldPos10044ui_story = var_92_14.localPosition
			end

			local var_92_16 = 0.001

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_16 then
				local var_92_17 = (arg_89_1.time_ - var_92_15) / var_92_16
				local var_92_18 = Vector3.New(0.7, -0.72, -6.3)

				var_92_14.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10044ui_story, var_92_18, var_92_17)

				local var_92_19 = manager.ui.mainCamera.transform.position - var_92_14.position

				var_92_14.forward = Vector3.New(var_92_19.x, var_92_19.y, var_92_19.z)

				local var_92_20 = var_92_14.localEulerAngles

				var_92_20.z = 0
				var_92_20.x = 0
				var_92_14.localEulerAngles = var_92_20
			end

			if arg_89_1.time_ >= var_92_15 + var_92_16 and arg_89_1.time_ < var_92_15 + var_92_16 + arg_92_0 then
				var_92_14.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_92_21 = manager.ui.mainCamera.transform.position - var_92_14.position

				var_92_14.forward = Vector3.New(var_92_21.x, var_92_21.y, var_92_21.z)

				local var_92_22 = var_92_14.localEulerAngles

				var_92_22.z = 0
				var_92_22.x = 0
				var_92_14.localEulerAngles = var_92_22
			end

			local var_92_23 = 0

			if var_92_23 < arg_89_1.time_ and arg_89_1.time_ <= var_92_23 + arg_92_0 then
				arg_89_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action5_2")
			end

			local var_92_24 = 0

			if var_92_24 < arg_89_1.time_ and arg_89_1.time_ <= var_92_24 + arg_92_0 then
				arg_89_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_92_25 = 0
			local var_92_26 = 0.25

			if var_92_25 < arg_89_1.time_ and arg_89_1.time_ <= var_92_25 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_27 = arg_89_1:FormatText(StoryNameCfg[410].name)

				arg_89_1.leftNameTxt_.text = var_92_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_28 = arg_89_1:GetWordFromCfg(222011022)
				local var_92_29 = arg_89_1:FormatText(var_92_28.content)

				arg_89_1.text_.text = var_92_29

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_30 = 10
				local var_92_31 = utf8.len(var_92_29)
				local var_92_32 = var_92_30 <= 0 and var_92_26 or var_92_26 * (var_92_31 / var_92_30)

				if var_92_32 > 0 and var_92_26 < var_92_32 then
					arg_89_1.talkMaxDuration = var_92_32

					if var_92_32 + var_92_25 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_32 + var_92_25
					end
				end

				arg_89_1.text_.text = var_92_29
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011022", "story_v_out_222011.awb") ~= 0 then
					local var_92_33 = manager.audio:GetVoiceLength("story_v_out_222011", "222011022", "story_v_out_222011.awb") / 1000

					if var_92_33 + var_92_25 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_33 + var_92_25
					end

					if var_92_28.prefab_name ~= "" and arg_89_1.actors_[var_92_28.prefab_name] ~= nil then
						local var_92_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_28.prefab_name].transform, "story_v_out_222011", "222011022", "story_v_out_222011.awb")

						arg_89_1:RecordAudio("222011022", var_92_34)
						arg_89_1:RecordAudio("222011022", var_92_34)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_222011", "222011022", "story_v_out_222011.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_222011", "222011022", "story_v_out_222011.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_35 = math.max(var_92_26, arg_89_1.talkMaxDuration)

			if var_92_25 <= arg_89_1.time_ and arg_89_1.time_ < var_92_25 + var_92_35 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_25) / var_92_35

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_25 + var_92_35 and arg_89_1.time_ < var_92_25 + var_92_35 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play222011023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 222011023
		arg_93_1.duration_ = 7.2

		local var_93_0 = {
			ja = 7.2,
			ko = 5.1,
			zh = 5.1
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
				arg_93_0:Play222011024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = 0

			if var_96_0 < arg_93_1.time_ and arg_93_1.time_ <= var_96_0 + arg_96_0 then
				arg_93_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_96_1 = 0
			local var_96_2 = 0.6

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_3 = arg_93_1:FormatText(StoryNameCfg[410].name)

				arg_93_1.leftNameTxt_.text = var_96_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_4 = arg_93_1:GetWordFromCfg(222011023)
				local var_96_5 = arg_93_1:FormatText(var_96_4.content)

				arg_93_1.text_.text = var_96_5

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_6 = 23
				local var_96_7 = utf8.len(var_96_5)
				local var_96_8 = var_96_6 <= 0 and var_96_2 or var_96_2 * (var_96_7 / var_96_6)

				if var_96_8 > 0 and var_96_2 < var_96_8 then
					arg_93_1.talkMaxDuration = var_96_8

					if var_96_8 + var_96_1 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_8 + var_96_1
					end
				end

				arg_93_1.text_.text = var_96_5
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011023", "story_v_out_222011.awb") ~= 0 then
					local var_96_9 = manager.audio:GetVoiceLength("story_v_out_222011", "222011023", "story_v_out_222011.awb") / 1000

					if var_96_9 + var_96_1 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_9 + var_96_1
					end

					if var_96_4.prefab_name ~= "" and arg_93_1.actors_[var_96_4.prefab_name] ~= nil then
						local var_96_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_4.prefab_name].transform, "story_v_out_222011", "222011023", "story_v_out_222011.awb")

						arg_93_1:RecordAudio("222011023", var_96_10)
						arg_93_1:RecordAudio("222011023", var_96_10)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_222011", "222011023", "story_v_out_222011.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_222011", "222011023", "story_v_out_222011.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_11 = math.max(var_96_2, arg_93_1.talkMaxDuration)

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_11 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_1) / var_96_11

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_1 + var_96_11 and arg_93_1.time_ < var_96_1 + var_96_11 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play222011024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 222011024
		arg_97_1.duration_ = 7.966

		local var_97_0 = {
			ja = 7.966,
			ko = 7.766,
			zh = 7.766
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
				arg_97_0:Play222011025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["10044ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect10044ui_story == nil then
				arg_97_1.var_.characterEffect10044ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect10044ui_story then
					arg_97_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect10044ui_story then
				arg_97_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_100_4 = 0

			if var_100_4 < arg_97_1.time_ and arg_97_1.time_ <= var_100_4 + arg_100_0 then
				arg_97_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_100_5 = arg_97_1.actors_["1074ui_story"]
			local var_100_6 = 0

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 and arg_97_1.var_.characterEffect1074ui_story == nil then
				arg_97_1.var_.characterEffect1074ui_story = var_100_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_7 = 0.200000002980232

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_7 then
				local var_100_8 = (arg_97_1.time_ - var_100_6) / var_100_7

				if arg_97_1.var_.characterEffect1074ui_story then
					local var_100_9 = Mathf.Lerp(0, 0.5, var_100_8)

					arg_97_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1074ui_story.fillRatio = var_100_9
				end
			end

			if arg_97_1.time_ >= var_100_6 + var_100_7 and arg_97_1.time_ < var_100_6 + var_100_7 + arg_100_0 and arg_97_1.var_.characterEffect1074ui_story then
				local var_100_10 = 0.5

				arg_97_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1074ui_story.fillRatio = var_100_10
			end

			local var_100_11 = 0
			local var_100_12 = 1.025

			if var_100_11 < arg_97_1.time_ and arg_97_1.time_ <= var_100_11 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_13 = arg_97_1:FormatText(StoryNameCfg[380].name)

				arg_97_1.leftNameTxt_.text = var_100_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_14 = arg_97_1:GetWordFromCfg(222011024)
				local var_100_15 = arg_97_1:FormatText(var_100_14.content)

				arg_97_1.text_.text = var_100_15

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_16 = 41
				local var_100_17 = utf8.len(var_100_15)
				local var_100_18 = var_100_16 <= 0 and var_100_12 or var_100_12 * (var_100_17 / var_100_16)

				if var_100_18 > 0 and var_100_12 < var_100_18 then
					arg_97_1.talkMaxDuration = var_100_18

					if var_100_18 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_18 + var_100_11
					end
				end

				arg_97_1.text_.text = var_100_15
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011024", "story_v_out_222011.awb") ~= 0 then
					local var_100_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011024", "story_v_out_222011.awb") / 1000

					if var_100_19 + var_100_11 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_19 + var_100_11
					end

					if var_100_14.prefab_name ~= "" and arg_97_1.actors_[var_100_14.prefab_name] ~= nil then
						local var_100_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_14.prefab_name].transform, "story_v_out_222011", "222011024", "story_v_out_222011.awb")

						arg_97_1:RecordAudio("222011024", var_100_20)
						arg_97_1:RecordAudio("222011024", var_100_20)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_222011", "222011024", "story_v_out_222011.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_222011", "222011024", "story_v_out_222011.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_21 = math.max(var_100_12, arg_97_1.talkMaxDuration)

			if var_100_11 <= arg_97_1.time_ and arg_97_1.time_ < var_100_11 + var_100_21 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_11) / var_100_21

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_11 + var_100_21 and arg_97_1.time_ < var_100_11 + var_100_21 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play222011025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 222011025
		arg_101_1.duration_ = 3.4

		local var_101_0 = {
			ja = 3.4,
			ko = 3.1,
			zh = 3.1
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
				arg_101_0:Play222011026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1074ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1074ui_story == nil then
				arg_101_1.var_.characterEffect1074ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1074ui_story then
					arg_101_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1074ui_story then
				arg_101_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_104_4 = 0

			if var_104_4 < arg_101_1.time_ and arg_101_1.time_ <= var_104_4 + arg_104_0 then
				arg_101_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_104_5 = arg_101_1.actors_["10044ui_story"]
			local var_104_6 = 0

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 and arg_101_1.var_.characterEffect10044ui_story == nil then
				arg_101_1.var_.characterEffect10044ui_story = var_104_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_7 = 0.200000002980232

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_7 then
				local var_104_8 = (arg_101_1.time_ - var_104_6) / var_104_7

				if arg_101_1.var_.characterEffect10044ui_story then
					local var_104_9 = Mathf.Lerp(0, 0.5, var_104_8)

					arg_101_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_101_1.var_.characterEffect10044ui_story.fillRatio = var_104_9
				end
			end

			if arg_101_1.time_ >= var_104_6 + var_104_7 and arg_101_1.time_ < var_104_6 + var_104_7 + arg_104_0 and arg_101_1.var_.characterEffect10044ui_story then
				local var_104_10 = 0.5

				arg_101_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_101_1.var_.characterEffect10044ui_story.fillRatio = var_104_10
			end

			local var_104_11 = 0
			local var_104_12 = 0.325

			if var_104_11 < arg_101_1.time_ and arg_101_1.time_ <= var_104_11 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_13 = arg_101_1:FormatText(StoryNameCfg[410].name)

				arg_101_1.leftNameTxt_.text = var_104_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_14 = arg_101_1:GetWordFromCfg(222011025)
				local var_104_15 = arg_101_1:FormatText(var_104_14.content)

				arg_101_1.text_.text = var_104_15

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_16 = 13
				local var_104_17 = utf8.len(var_104_15)
				local var_104_18 = var_104_16 <= 0 and var_104_12 or var_104_12 * (var_104_17 / var_104_16)

				if var_104_18 > 0 and var_104_12 < var_104_18 then
					arg_101_1.talkMaxDuration = var_104_18

					if var_104_18 + var_104_11 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_18 + var_104_11
					end
				end

				arg_101_1.text_.text = var_104_15
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011025", "story_v_out_222011.awb") ~= 0 then
					local var_104_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011025", "story_v_out_222011.awb") / 1000

					if var_104_19 + var_104_11 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_19 + var_104_11
					end

					if var_104_14.prefab_name ~= "" and arg_101_1.actors_[var_104_14.prefab_name] ~= nil then
						local var_104_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_14.prefab_name].transform, "story_v_out_222011", "222011025", "story_v_out_222011.awb")

						arg_101_1:RecordAudio("222011025", var_104_20)
						arg_101_1:RecordAudio("222011025", var_104_20)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_222011", "222011025", "story_v_out_222011.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_222011", "222011025", "story_v_out_222011.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_21 = math.max(var_104_12, arg_101_1.talkMaxDuration)

			if var_104_11 <= arg_101_1.time_ and arg_101_1.time_ < var_104_11 + var_104_21 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_11) / var_104_21

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_11 + var_104_21 and arg_101_1.time_ < var_104_11 + var_104_21 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play222011026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 222011026
		arg_105_1.duration_ = 5.133

		local var_105_0 = {
			ja = 5.133,
			ko = 2.6,
			zh = 2.6
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
				arg_105_0:Play222011027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10044ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect10044ui_story == nil then
				arg_105_1.var_.characterEffect10044ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect10044ui_story then
					arg_105_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect10044ui_story then
				arg_105_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_108_4 = 0

			if var_108_4 < arg_105_1.time_ and arg_105_1.time_ <= var_108_4 + arg_108_0 then
				arg_105_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_108_5 = 0

			if var_108_5 < arg_105_1.time_ and arg_105_1.time_ <= var_108_5 + arg_108_0 then
				arg_105_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_108_6 = arg_105_1.actors_["1074ui_story"]
			local var_108_7 = 0

			if var_108_7 < arg_105_1.time_ and arg_105_1.time_ <= var_108_7 + arg_108_0 and arg_105_1.var_.characterEffect1074ui_story == nil then
				arg_105_1.var_.characterEffect1074ui_story = var_108_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_8 = 0.200000002980232

			if var_108_7 <= arg_105_1.time_ and arg_105_1.time_ < var_108_7 + var_108_8 then
				local var_108_9 = (arg_105_1.time_ - var_108_7) / var_108_8

				if arg_105_1.var_.characterEffect1074ui_story then
					local var_108_10 = Mathf.Lerp(0, 0.5, var_108_9)

					arg_105_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1074ui_story.fillRatio = var_108_10
				end
			end

			if arg_105_1.time_ >= var_108_7 + var_108_8 and arg_105_1.time_ < var_108_7 + var_108_8 + arg_108_0 and arg_105_1.var_.characterEffect1074ui_story then
				local var_108_11 = 0.5

				arg_105_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1074ui_story.fillRatio = var_108_11
			end

			local var_108_12 = 0
			local var_108_13 = 0.275

			if var_108_12 < arg_105_1.time_ and arg_105_1.time_ <= var_108_12 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_14 = arg_105_1:FormatText(StoryNameCfg[380].name)

				arg_105_1.leftNameTxt_.text = var_108_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_15 = arg_105_1:GetWordFromCfg(222011026)
				local var_108_16 = arg_105_1:FormatText(var_108_15.content)

				arg_105_1.text_.text = var_108_16

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_17 = 11
				local var_108_18 = utf8.len(var_108_16)
				local var_108_19 = var_108_17 <= 0 and var_108_13 or var_108_13 * (var_108_18 / var_108_17)

				if var_108_19 > 0 and var_108_13 < var_108_19 then
					arg_105_1.talkMaxDuration = var_108_19

					if var_108_19 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_19 + var_108_12
					end
				end

				arg_105_1.text_.text = var_108_16
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011026", "story_v_out_222011.awb") ~= 0 then
					local var_108_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011026", "story_v_out_222011.awb") / 1000

					if var_108_20 + var_108_12 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_20 + var_108_12
					end

					if var_108_15.prefab_name ~= "" and arg_105_1.actors_[var_108_15.prefab_name] ~= nil then
						local var_108_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_15.prefab_name].transform, "story_v_out_222011", "222011026", "story_v_out_222011.awb")

						arg_105_1:RecordAudio("222011026", var_108_21)
						arg_105_1:RecordAudio("222011026", var_108_21)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_222011", "222011026", "story_v_out_222011.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_222011", "222011026", "story_v_out_222011.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_22 = math.max(var_108_13, arg_105_1.talkMaxDuration)

			if var_108_12 <= arg_105_1.time_ and arg_105_1.time_ < var_108_12 + var_108_22 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_12) / var_108_22

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_12 + var_108_22 and arg_105_1.time_ < var_108_12 + var_108_22 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play222011027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 222011027
		arg_109_1.duration_ = 6.9

		local var_109_0 = {
			ja = 6.9,
			ko = 5,
			zh = 5
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
				arg_109_0:Play222011028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = arg_109_1.actors_["1074ui_story"]
			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 and arg_109_1.var_.characterEffect1074ui_story == nil then
				arg_109_1.var_.characterEffect1074ui_story = var_112_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_2 = 0.200000002980232

			if var_112_1 <= arg_109_1.time_ and arg_109_1.time_ < var_112_1 + var_112_2 then
				local var_112_3 = (arg_109_1.time_ - var_112_1) / var_112_2

				if arg_109_1.var_.characterEffect1074ui_story then
					arg_109_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_109_1.time_ >= var_112_1 + var_112_2 and arg_109_1.time_ < var_112_1 + var_112_2 + arg_112_0 and arg_109_1.var_.characterEffect1074ui_story then
				arg_109_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_112_4 = 0

			if var_112_4 < arg_109_1.time_ and arg_109_1.time_ <= var_112_4 + arg_112_0 then
				arg_109_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_112_5 = arg_109_1.actors_["10044ui_story"]
			local var_112_6 = 0

			if var_112_6 < arg_109_1.time_ and arg_109_1.time_ <= var_112_6 + arg_112_0 and arg_109_1.var_.characterEffect10044ui_story == nil then
				arg_109_1.var_.characterEffect10044ui_story = var_112_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_112_7 = 0.200000002980232

			if var_112_6 <= arg_109_1.time_ and arg_109_1.time_ < var_112_6 + var_112_7 then
				local var_112_8 = (arg_109_1.time_ - var_112_6) / var_112_7

				if arg_109_1.var_.characterEffect10044ui_story then
					local var_112_9 = Mathf.Lerp(0, 0.5, var_112_8)

					arg_109_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_109_1.var_.characterEffect10044ui_story.fillRatio = var_112_9
				end
			end

			if arg_109_1.time_ >= var_112_6 + var_112_7 and arg_109_1.time_ < var_112_6 + var_112_7 + arg_112_0 and arg_109_1.var_.characterEffect10044ui_story then
				local var_112_10 = 0.5

				arg_109_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_109_1.var_.characterEffect10044ui_story.fillRatio = var_112_10
			end

			local var_112_11 = 0
			local var_112_12 = 0.6

			if var_112_11 < arg_109_1.time_ and arg_109_1.time_ <= var_112_11 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_13 = arg_109_1:FormatText(StoryNameCfg[410].name)

				arg_109_1.leftNameTxt_.text = var_112_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_14 = arg_109_1:GetWordFromCfg(222011027)
				local var_112_15 = arg_109_1:FormatText(var_112_14.content)

				arg_109_1.text_.text = var_112_15

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_16 = 24
				local var_112_17 = utf8.len(var_112_15)
				local var_112_18 = var_112_16 <= 0 and var_112_12 or var_112_12 * (var_112_17 / var_112_16)

				if var_112_18 > 0 and var_112_12 < var_112_18 then
					arg_109_1.talkMaxDuration = var_112_18

					if var_112_18 + var_112_11 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_18 + var_112_11
					end
				end

				arg_109_1.text_.text = var_112_15
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011027", "story_v_out_222011.awb") ~= 0 then
					local var_112_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011027", "story_v_out_222011.awb") / 1000

					if var_112_19 + var_112_11 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_19 + var_112_11
					end

					if var_112_14.prefab_name ~= "" and arg_109_1.actors_[var_112_14.prefab_name] ~= nil then
						local var_112_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_14.prefab_name].transform, "story_v_out_222011", "222011027", "story_v_out_222011.awb")

						arg_109_1:RecordAudio("222011027", var_112_20)
						arg_109_1:RecordAudio("222011027", var_112_20)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_222011", "222011027", "story_v_out_222011.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_222011", "222011027", "story_v_out_222011.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_21 = math.max(var_112_12, arg_109_1.talkMaxDuration)

			if var_112_11 <= arg_109_1.time_ and arg_109_1.time_ < var_112_11 + var_112_21 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_11) / var_112_21

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_11 + var_112_21 and arg_109_1.time_ < var_112_11 + var_112_21 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play222011028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 222011028
		arg_113_1.duration_ = 5.766

		local var_113_0 = {
			ja = 5.766,
			ko = 5.3,
			zh = 5.3
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
				arg_113_0:Play222011029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10044ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect10044ui_story == nil then
				arg_113_1.var_.characterEffect10044ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect10044ui_story then
					arg_113_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect10044ui_story then
				arg_113_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_116_4 = 0

			if var_116_4 < arg_113_1.time_ and arg_113_1.time_ <= var_116_4 + arg_116_0 then
				arg_113_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_116_6 = arg_113_1.actors_["1074ui_story"]
			local var_116_7 = 0

			if var_116_7 < arg_113_1.time_ and arg_113_1.time_ <= var_116_7 + arg_116_0 and arg_113_1.var_.characterEffect1074ui_story == nil then
				arg_113_1.var_.characterEffect1074ui_story = var_116_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_8 = 0.200000002980232

			if var_116_7 <= arg_113_1.time_ and arg_113_1.time_ < var_116_7 + var_116_8 then
				local var_116_9 = (arg_113_1.time_ - var_116_7) / var_116_8

				if arg_113_1.var_.characterEffect1074ui_story then
					local var_116_10 = Mathf.Lerp(0, 0.5, var_116_9)

					arg_113_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_113_1.var_.characterEffect1074ui_story.fillRatio = var_116_10
				end
			end

			if arg_113_1.time_ >= var_116_7 + var_116_8 and arg_113_1.time_ < var_116_7 + var_116_8 + arg_116_0 and arg_113_1.var_.characterEffect1074ui_story then
				local var_116_11 = 0.5

				arg_113_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_113_1.var_.characterEffect1074ui_story.fillRatio = var_116_11
			end

			local var_116_12 = 0
			local var_116_13 = 0.675

			if var_116_12 < arg_113_1.time_ and arg_113_1.time_ <= var_116_12 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_14 = arg_113_1:FormatText(StoryNameCfg[380].name)

				arg_113_1.leftNameTxt_.text = var_116_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_15 = arg_113_1:GetWordFromCfg(222011028)
				local var_116_16 = arg_113_1:FormatText(var_116_15.content)

				arg_113_1.text_.text = var_116_16

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_17 = 27
				local var_116_18 = utf8.len(var_116_16)
				local var_116_19 = var_116_17 <= 0 and var_116_13 or var_116_13 * (var_116_18 / var_116_17)

				if var_116_19 > 0 and var_116_13 < var_116_19 then
					arg_113_1.talkMaxDuration = var_116_19

					if var_116_19 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_19 + var_116_12
					end
				end

				arg_113_1.text_.text = var_116_16
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011028", "story_v_out_222011.awb") ~= 0 then
					local var_116_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011028", "story_v_out_222011.awb") / 1000

					if var_116_20 + var_116_12 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_20 + var_116_12
					end

					if var_116_15.prefab_name ~= "" and arg_113_1.actors_[var_116_15.prefab_name] ~= nil then
						local var_116_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_15.prefab_name].transform, "story_v_out_222011", "222011028", "story_v_out_222011.awb")

						arg_113_1:RecordAudio("222011028", var_116_21)
						arg_113_1:RecordAudio("222011028", var_116_21)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_222011", "222011028", "story_v_out_222011.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_222011", "222011028", "story_v_out_222011.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_22 = math.max(var_116_13, arg_113_1.talkMaxDuration)

			if var_116_12 <= arg_113_1.time_ and arg_113_1.time_ < var_116_12 + var_116_22 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_12) / var_116_22

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_12 + var_116_22 and arg_113_1.time_ < var_116_12 + var_116_22 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play222011029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 222011029
		arg_117_1.duration_ = 11.1

		local var_117_0 = {
			ja = 11.1,
			ko = 8.2,
			zh = 8.2
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
				arg_117_0:Play222011030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				arg_117_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_120_1 = 0
			local var_120_2 = 1.025

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_3 = arg_117_1:FormatText(StoryNameCfg[380].name)

				arg_117_1.leftNameTxt_.text = var_120_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_4 = arg_117_1:GetWordFromCfg(222011029)
				local var_120_5 = arg_117_1:FormatText(var_120_4.content)

				arg_117_1.text_.text = var_120_5

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_6 = 41
				local var_120_7 = utf8.len(var_120_5)
				local var_120_8 = var_120_6 <= 0 and var_120_2 or var_120_2 * (var_120_7 / var_120_6)

				if var_120_8 > 0 and var_120_2 < var_120_8 then
					arg_117_1.talkMaxDuration = var_120_8

					if var_120_8 + var_120_1 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_8 + var_120_1
					end
				end

				arg_117_1.text_.text = var_120_5
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011029", "story_v_out_222011.awb") ~= 0 then
					local var_120_9 = manager.audio:GetVoiceLength("story_v_out_222011", "222011029", "story_v_out_222011.awb") / 1000

					if var_120_9 + var_120_1 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_9 + var_120_1
					end

					if var_120_4.prefab_name ~= "" and arg_117_1.actors_[var_120_4.prefab_name] ~= nil then
						local var_120_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_4.prefab_name].transform, "story_v_out_222011", "222011029", "story_v_out_222011.awb")

						arg_117_1:RecordAudio("222011029", var_120_10)
						arg_117_1:RecordAudio("222011029", var_120_10)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_222011", "222011029", "story_v_out_222011.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_222011", "222011029", "story_v_out_222011.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_11 = math.max(var_120_2, arg_117_1.talkMaxDuration)

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_11 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_1) / var_120_11

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_1 + var_120_11 and arg_117_1.time_ < var_120_1 + var_120_11 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play222011030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 222011030
		arg_121_1.duration_ = 3.266

		local var_121_0 = {
			ja = 3.266,
			ko = 1.999999999999,
			zh = 1.999999999999
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
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play222011031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1074ui_story"]
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 and arg_121_1.var_.characterEffect1074ui_story == nil then
				arg_121_1.var_.characterEffect1074ui_story = var_124_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_2 = 0.200000002980232

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2

				if arg_121_1.var_.characterEffect1074ui_story then
					arg_121_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 and arg_121_1.var_.characterEffect1074ui_story then
				arg_121_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_124_4 = 0

			if var_124_4 < arg_121_1.time_ and arg_121_1.time_ <= var_124_4 + arg_124_0 then
				arg_121_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_5 = arg_121_1.actors_["10044ui_story"]
			local var_124_6 = 0

			if var_124_6 < arg_121_1.time_ and arg_121_1.time_ <= var_124_6 + arg_124_0 and arg_121_1.var_.characterEffect10044ui_story == nil then
				arg_121_1.var_.characterEffect10044ui_story = var_124_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_7 = 0.200000002980232

			if var_124_6 <= arg_121_1.time_ and arg_121_1.time_ < var_124_6 + var_124_7 then
				local var_124_8 = (arg_121_1.time_ - var_124_6) / var_124_7

				if arg_121_1.var_.characterEffect10044ui_story then
					local var_124_9 = Mathf.Lerp(0, 0.5, var_124_8)

					arg_121_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10044ui_story.fillRatio = var_124_9
				end
			end

			if arg_121_1.time_ >= var_124_6 + var_124_7 and arg_121_1.time_ < var_124_6 + var_124_7 + arg_124_0 and arg_121_1.var_.characterEffect10044ui_story then
				local var_124_10 = 0.5

				arg_121_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10044ui_story.fillRatio = var_124_10
			end

			local var_124_11 = 0
			local var_124_12 = 0.15

			if var_124_11 < arg_121_1.time_ and arg_121_1.time_ <= var_124_11 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_13 = arg_121_1:FormatText(StoryNameCfg[410].name)

				arg_121_1.leftNameTxt_.text = var_124_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_14 = arg_121_1:GetWordFromCfg(222011030)
				local var_124_15 = arg_121_1:FormatText(var_124_14.content)

				arg_121_1.text_.text = var_124_15

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_16 = 6
				local var_124_17 = utf8.len(var_124_15)
				local var_124_18 = var_124_16 <= 0 and var_124_12 or var_124_12 * (var_124_17 / var_124_16)

				if var_124_18 > 0 and var_124_12 < var_124_18 then
					arg_121_1.talkMaxDuration = var_124_18

					if var_124_18 + var_124_11 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_18 + var_124_11
					end
				end

				arg_121_1.text_.text = var_124_15
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011030", "story_v_out_222011.awb") ~= 0 then
					local var_124_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011030", "story_v_out_222011.awb") / 1000

					if var_124_19 + var_124_11 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_19 + var_124_11
					end

					if var_124_14.prefab_name ~= "" and arg_121_1.actors_[var_124_14.prefab_name] ~= nil then
						local var_124_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_14.prefab_name].transform, "story_v_out_222011", "222011030", "story_v_out_222011.awb")

						arg_121_1:RecordAudio("222011030", var_124_20)
						arg_121_1:RecordAudio("222011030", var_124_20)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_222011", "222011030", "story_v_out_222011.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_222011", "222011030", "story_v_out_222011.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_21 = math.max(var_124_12, arg_121_1.talkMaxDuration)

			if var_124_11 <= arg_121_1.time_ and arg_121_1.time_ < var_124_11 + var_124_21 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_11) / var_124_21

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_11 + var_124_21 and arg_121_1.time_ < var_124_11 + var_124_21 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play222011031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 222011031
		arg_125_1.duration_ = 11.4

		local var_125_0 = {
			ja = 11.4,
			ko = 10,
			zh = 10
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
				arg_125_0:Play222011032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10044ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect10044ui_story == nil then
				arg_125_1.var_.characterEffect10044ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect10044ui_story then
					arg_125_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10044ui_story then
				arg_125_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_128_4 = 0

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				arg_125_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_128_6 = arg_125_1.actors_["1074ui_story"]
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 and arg_125_1.var_.characterEffect1074ui_story == nil then
				arg_125_1.var_.characterEffect1074ui_story = var_128_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_8 = 0.200000002980232

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8

				if arg_125_1.var_.characterEffect1074ui_story then
					local var_128_10 = Mathf.Lerp(0, 0.5, var_128_9)

					arg_125_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1074ui_story.fillRatio = var_128_10
				end
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 and arg_125_1.var_.characterEffect1074ui_story then
				local var_128_11 = 0.5

				arg_125_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1074ui_story.fillRatio = var_128_11
			end

			local var_128_12 = 0
			local var_128_13 = 1.075

			if var_128_12 < arg_125_1.time_ and arg_125_1.time_ <= var_128_12 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_14 = arg_125_1:FormatText(StoryNameCfg[380].name)

				arg_125_1.leftNameTxt_.text = var_128_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_15 = arg_125_1:GetWordFromCfg(222011031)
				local var_128_16 = arg_125_1:FormatText(var_128_15.content)

				arg_125_1.text_.text = var_128_16

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_17 = 43
				local var_128_18 = utf8.len(var_128_16)
				local var_128_19 = var_128_17 <= 0 and var_128_13 or var_128_13 * (var_128_18 / var_128_17)

				if var_128_19 > 0 and var_128_13 < var_128_19 then
					arg_125_1.talkMaxDuration = var_128_19

					if var_128_19 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_19 + var_128_12
					end
				end

				arg_125_1.text_.text = var_128_16
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011031", "story_v_out_222011.awb") ~= 0 then
					local var_128_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011031", "story_v_out_222011.awb") / 1000

					if var_128_20 + var_128_12 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_20 + var_128_12
					end

					if var_128_15.prefab_name ~= "" and arg_125_1.actors_[var_128_15.prefab_name] ~= nil then
						local var_128_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_15.prefab_name].transform, "story_v_out_222011", "222011031", "story_v_out_222011.awb")

						arg_125_1:RecordAudio("222011031", var_128_21)
						arg_125_1:RecordAudio("222011031", var_128_21)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_222011", "222011031", "story_v_out_222011.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_222011", "222011031", "story_v_out_222011.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_22 = math.max(var_128_13, arg_125_1.talkMaxDuration)

			if var_128_12 <= arg_125_1.time_ and arg_125_1.time_ < var_128_12 + var_128_22 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_12) / var_128_22

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_12 + var_128_22 and arg_125_1.time_ < var_128_12 + var_128_22 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play222011032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 222011032
		arg_129_1.duration_ = 5.3

		local var_129_0 = {
			ja = 5.3,
			ko = 5.233,
			zh = 5.233
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
				arg_129_0:Play222011033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["10044ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect10044ui_story == nil then
				arg_129_1.var_.characterEffect10044ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect10044ui_story then
					arg_129_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect10044ui_story then
				arg_129_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_132_4 = 0

			if var_132_4 < arg_129_1.time_ and arg_129_1.time_ <= var_132_4 + arg_132_0 then
				arg_129_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 then
				arg_129_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_132_6 = 0
			local var_132_7 = 0.6

			if var_132_6 < arg_129_1.time_ and arg_129_1.time_ <= var_132_6 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_8 = arg_129_1:FormatText(StoryNameCfg[380].name)

				arg_129_1.leftNameTxt_.text = var_132_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_9 = arg_129_1:GetWordFromCfg(222011032)
				local var_132_10 = arg_129_1:FormatText(var_132_9.content)

				arg_129_1.text_.text = var_132_10

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_11 = 24
				local var_132_12 = utf8.len(var_132_10)
				local var_132_13 = var_132_11 <= 0 and var_132_7 or var_132_7 * (var_132_12 / var_132_11)

				if var_132_13 > 0 and var_132_7 < var_132_13 then
					arg_129_1.talkMaxDuration = var_132_13

					if var_132_13 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_13 + var_132_6
					end
				end

				arg_129_1.text_.text = var_132_10
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011032", "story_v_out_222011.awb") ~= 0 then
					local var_132_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011032", "story_v_out_222011.awb") / 1000

					if var_132_14 + var_132_6 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_14 + var_132_6
					end

					if var_132_9.prefab_name ~= "" and arg_129_1.actors_[var_132_9.prefab_name] ~= nil then
						local var_132_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_9.prefab_name].transform, "story_v_out_222011", "222011032", "story_v_out_222011.awb")

						arg_129_1:RecordAudio("222011032", var_132_15)
						arg_129_1:RecordAudio("222011032", var_132_15)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_222011", "222011032", "story_v_out_222011.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_222011", "222011032", "story_v_out_222011.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_16 = math.max(var_132_7, arg_129_1.talkMaxDuration)

			if var_132_6 <= arg_129_1.time_ and arg_129_1.time_ < var_132_6 + var_132_16 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_6) / var_132_16

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_6 + var_132_16 and arg_129_1.time_ < var_132_6 + var_132_16 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play222011033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 222011033
		arg_133_1.duration_ = 6.966

		local var_133_0 = {
			ja = 6.733,
			ko = 6.966,
			zh = 6.966
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
				arg_133_0:Play222011034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1074ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1074ui_story == nil then
				arg_133_1.var_.characterEffect1074ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1074ui_story then
					arg_133_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1074ui_story then
				arg_133_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_136_4 = 0

			if var_136_4 < arg_133_1.time_ and arg_133_1.time_ <= var_136_4 + arg_136_0 then
				arg_133_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_5 = arg_133_1.actors_["10044ui_story"]
			local var_136_6 = 0

			if var_136_6 < arg_133_1.time_ and arg_133_1.time_ <= var_136_6 + arg_136_0 and arg_133_1.var_.characterEffect10044ui_story == nil then
				arg_133_1.var_.characterEffect10044ui_story = var_136_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_7 = 0.200000002980232

			if var_136_6 <= arg_133_1.time_ and arg_133_1.time_ < var_136_6 + var_136_7 then
				local var_136_8 = (arg_133_1.time_ - var_136_6) / var_136_7

				if arg_133_1.var_.characterEffect10044ui_story then
					local var_136_9 = Mathf.Lerp(0, 0.5, var_136_8)

					arg_133_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_133_1.var_.characterEffect10044ui_story.fillRatio = var_136_9
				end
			end

			if arg_133_1.time_ >= var_136_6 + var_136_7 and arg_133_1.time_ < var_136_6 + var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect10044ui_story then
				local var_136_10 = 0.5

				arg_133_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_133_1.var_.characterEffect10044ui_story.fillRatio = var_136_10
			end

			local var_136_11 = 0
			local var_136_12 = 0.7

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_13 = arg_133_1:FormatText(StoryNameCfg[410].name)

				arg_133_1.leftNameTxt_.text = var_136_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_14 = arg_133_1:GetWordFromCfg(222011033)
				local var_136_15 = arg_133_1:FormatText(var_136_14.content)

				arg_133_1.text_.text = var_136_15

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_16 = 28
				local var_136_17 = utf8.len(var_136_15)
				local var_136_18 = var_136_16 <= 0 and var_136_12 or var_136_12 * (var_136_17 / var_136_16)

				if var_136_18 > 0 and var_136_12 < var_136_18 then
					arg_133_1.talkMaxDuration = var_136_18

					if var_136_18 + var_136_11 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_18 + var_136_11
					end
				end

				arg_133_1.text_.text = var_136_15
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011033", "story_v_out_222011.awb") ~= 0 then
					local var_136_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011033", "story_v_out_222011.awb") / 1000

					if var_136_19 + var_136_11 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_11
					end

					if var_136_14.prefab_name ~= "" and arg_133_1.actors_[var_136_14.prefab_name] ~= nil then
						local var_136_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_14.prefab_name].transform, "story_v_out_222011", "222011033", "story_v_out_222011.awb")

						arg_133_1:RecordAudio("222011033", var_136_20)
						arg_133_1:RecordAudio("222011033", var_136_20)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_222011", "222011033", "story_v_out_222011.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_222011", "222011033", "story_v_out_222011.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_21 = math.max(var_136_12, arg_133_1.talkMaxDuration)

			if var_136_11 <= arg_133_1.time_ and arg_133_1.time_ < var_136_11 + var_136_21 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_11) / var_136_21

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_11 + var_136_21 and arg_133_1.time_ < var_136_11 + var_136_21 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play222011034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 222011034
		arg_137_1.duration_ = 14.633

		local var_137_0 = {
			ja = 14.633,
			ko = 10.166,
			zh = 10.166
		}
		local var_137_1 = manager.audio:GetLocalizationFlag()

		if var_137_0[var_137_1] ~= nil then
			arg_137_1.duration_ = var_137_0[var_137_1]
		end

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play222011035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10044ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect10044ui_story == nil then
				arg_137_1.var_.characterEffect10044ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect10044ui_story then
					arg_137_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect10044ui_story then
				arg_137_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_140_4 = 0

			if var_140_4 < arg_137_1.time_ and arg_137_1.time_ <= var_140_4 + arg_140_0 then
				arg_137_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_140_5 = 0

			if var_140_5 < arg_137_1.time_ and arg_137_1.time_ <= var_140_5 + arg_140_0 then
				arg_137_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_6 = arg_137_1.actors_["1074ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1074ui_story == nil then
				arg_137_1.var_.characterEffect1074ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.200000002980232

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1074ui_story then
					local var_140_10 = Mathf.Lerp(0, 0.5, var_140_9)

					arg_137_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1074ui_story.fillRatio = var_140_10
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1074ui_story then
				local var_140_11 = 0.5

				arg_137_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1074ui_story.fillRatio = var_140_11
			end

			local var_140_12 = 0
			local var_140_13 = 1.1

			if var_140_12 < arg_137_1.time_ and arg_137_1.time_ <= var_140_12 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_14 = arg_137_1:FormatText(StoryNameCfg[380].name)

				arg_137_1.leftNameTxt_.text = var_140_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_15 = arg_137_1:GetWordFromCfg(222011034)
				local var_140_16 = arg_137_1:FormatText(var_140_15.content)

				arg_137_1.text_.text = var_140_16

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_17 = 44
				local var_140_18 = utf8.len(var_140_16)
				local var_140_19 = var_140_17 <= 0 and var_140_13 or var_140_13 * (var_140_18 / var_140_17)

				if var_140_19 > 0 and var_140_13 < var_140_19 then
					arg_137_1.talkMaxDuration = var_140_19

					if var_140_19 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_19 + var_140_12
					end
				end

				arg_137_1.text_.text = var_140_16
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011034", "story_v_out_222011.awb") ~= 0 then
					local var_140_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011034", "story_v_out_222011.awb") / 1000

					if var_140_20 + var_140_12 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_20 + var_140_12
					end

					if var_140_15.prefab_name ~= "" and arg_137_1.actors_[var_140_15.prefab_name] ~= nil then
						local var_140_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_15.prefab_name].transform, "story_v_out_222011", "222011034", "story_v_out_222011.awb")

						arg_137_1:RecordAudio("222011034", var_140_21)
						arg_137_1:RecordAudio("222011034", var_140_21)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_222011", "222011034", "story_v_out_222011.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_222011", "222011034", "story_v_out_222011.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_22 = math.max(var_140_13, arg_137_1.talkMaxDuration)

			if var_140_12 <= arg_137_1.time_ and arg_137_1.time_ < var_140_12 + var_140_22 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_12) / var_140_22

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_12 + var_140_22 and arg_137_1.time_ < var_140_12 + var_140_22 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play222011035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 222011035
		arg_141_1.duration_ = 7.966

		local var_141_0 = {
			ja = 7.533,
			ko = 7.966,
			zh = 7.966
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
				arg_141_0:Play222011036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_144_2 = 0
			local var_144_3 = 0.9

			if var_144_2 < arg_141_1.time_ and arg_141_1.time_ <= var_144_2 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_4 = arg_141_1:FormatText(StoryNameCfg[380].name)

				arg_141_1.leftNameTxt_.text = var_144_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_5 = arg_141_1:GetWordFromCfg(222011035)
				local var_144_6 = arg_141_1:FormatText(var_144_5.content)

				arg_141_1.text_.text = var_144_6

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_7 = 36
				local var_144_8 = utf8.len(var_144_6)
				local var_144_9 = var_144_7 <= 0 and var_144_3 or var_144_3 * (var_144_8 / var_144_7)

				if var_144_9 > 0 and var_144_3 < var_144_9 then
					arg_141_1.talkMaxDuration = var_144_9

					if var_144_9 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_9 + var_144_2
					end
				end

				arg_141_1.text_.text = var_144_6
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011035", "story_v_out_222011.awb") ~= 0 then
					local var_144_10 = manager.audio:GetVoiceLength("story_v_out_222011", "222011035", "story_v_out_222011.awb") / 1000

					if var_144_10 + var_144_2 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_10 + var_144_2
					end

					if var_144_5.prefab_name ~= "" and arg_141_1.actors_[var_144_5.prefab_name] ~= nil then
						local var_144_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_5.prefab_name].transform, "story_v_out_222011", "222011035", "story_v_out_222011.awb")

						arg_141_1:RecordAudio("222011035", var_144_11)
						arg_141_1:RecordAudio("222011035", var_144_11)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_222011", "222011035", "story_v_out_222011.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_222011", "222011035", "story_v_out_222011.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_12 = math.max(var_144_3, arg_141_1.talkMaxDuration)

			if var_144_2 <= arg_141_1.time_ and arg_141_1.time_ < var_144_2 + var_144_12 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_2) / var_144_12

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_2 + var_144_12 and arg_141_1.time_ < var_144_2 + var_144_12 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play222011036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 222011036
		arg_145_1.duration_ = 11.733

		local var_145_0 = {
			ja = 11.733,
			ko = 9.7,
			zh = 9.7
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
				arg_145_0:Play222011037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1074ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1074ui_story == nil then
				arg_145_1.var_.characterEffect1074ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect1074ui_story then
					arg_145_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect1074ui_story then
				arg_145_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_148_4 = 0

			if var_148_4 < arg_145_1.time_ and arg_145_1.time_ <= var_148_4 + arg_148_0 then
				arg_145_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_148_5 = arg_145_1.actors_["10044ui_story"]
			local var_148_6 = 0

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 and arg_145_1.var_.characterEffect10044ui_story == nil then
				arg_145_1.var_.characterEffect10044ui_story = var_148_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_7 = 0.200000002980232

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_7 then
				local var_148_8 = (arg_145_1.time_ - var_148_6) / var_148_7

				if arg_145_1.var_.characterEffect10044ui_story then
					local var_148_9 = Mathf.Lerp(0, 0.5, var_148_8)

					arg_145_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_145_1.var_.characterEffect10044ui_story.fillRatio = var_148_9
				end
			end

			if arg_145_1.time_ >= var_148_6 + var_148_7 and arg_145_1.time_ < var_148_6 + var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect10044ui_story then
				local var_148_10 = 0.5

				arg_145_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_145_1.var_.characterEffect10044ui_story.fillRatio = var_148_10
			end

			local var_148_11 = 0
			local var_148_12 = 1.025

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_13 = arg_145_1:FormatText(StoryNameCfg[410].name)

				arg_145_1.leftNameTxt_.text = var_148_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_14 = arg_145_1:GetWordFromCfg(222011036)
				local var_148_15 = arg_145_1:FormatText(var_148_14.content)

				arg_145_1.text_.text = var_148_15

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_16 = 41
				local var_148_17 = utf8.len(var_148_15)
				local var_148_18 = var_148_16 <= 0 and var_148_12 or var_148_12 * (var_148_17 / var_148_16)

				if var_148_18 > 0 and var_148_12 < var_148_18 then
					arg_145_1.talkMaxDuration = var_148_18

					if var_148_18 + var_148_11 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_18 + var_148_11
					end
				end

				arg_145_1.text_.text = var_148_15
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011036", "story_v_out_222011.awb") ~= 0 then
					local var_148_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011036", "story_v_out_222011.awb") / 1000

					if var_148_19 + var_148_11 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_11
					end

					if var_148_14.prefab_name ~= "" and arg_145_1.actors_[var_148_14.prefab_name] ~= nil then
						local var_148_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_14.prefab_name].transform, "story_v_out_222011", "222011036", "story_v_out_222011.awb")

						arg_145_1:RecordAudio("222011036", var_148_20)
						arg_145_1:RecordAudio("222011036", var_148_20)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_222011", "222011036", "story_v_out_222011.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_222011", "222011036", "story_v_out_222011.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_21 = math.max(var_148_12, arg_145_1.talkMaxDuration)

			if var_148_11 <= arg_145_1.time_ and arg_145_1.time_ < var_148_11 + var_148_21 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_11) / var_148_21

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_11 + var_148_21 and arg_145_1.time_ < var_148_11 + var_148_21 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play222011037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 222011037
		arg_149_1.duration_ = 18.2

		local var_149_0 = {
			ja = 18.2,
			ko = 13.1,
			zh = 13.1
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
				arg_149_0:Play222011038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_1 = 0
			local var_152_2 = 1.65

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_3 = arg_149_1:FormatText(StoryNameCfg[410].name)

				arg_149_1.leftNameTxt_.text = var_152_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_4 = arg_149_1:GetWordFromCfg(222011037)
				local var_152_5 = arg_149_1:FormatText(var_152_4.content)

				arg_149_1.text_.text = var_152_5

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_6 = 66
				local var_152_7 = utf8.len(var_152_5)
				local var_152_8 = var_152_6 <= 0 and var_152_2 or var_152_2 * (var_152_7 / var_152_6)

				if var_152_8 > 0 and var_152_2 < var_152_8 then
					arg_149_1.talkMaxDuration = var_152_8

					if var_152_8 + var_152_1 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_1
					end
				end

				arg_149_1.text_.text = var_152_5
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011037", "story_v_out_222011.awb") ~= 0 then
					local var_152_9 = manager.audio:GetVoiceLength("story_v_out_222011", "222011037", "story_v_out_222011.awb") / 1000

					if var_152_9 + var_152_1 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_9 + var_152_1
					end

					if var_152_4.prefab_name ~= "" and arg_149_1.actors_[var_152_4.prefab_name] ~= nil then
						local var_152_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_4.prefab_name].transform, "story_v_out_222011", "222011037", "story_v_out_222011.awb")

						arg_149_1:RecordAudio("222011037", var_152_10)
						arg_149_1:RecordAudio("222011037", var_152_10)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_222011", "222011037", "story_v_out_222011.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_222011", "222011037", "story_v_out_222011.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_11 = math.max(var_152_2, arg_149_1.talkMaxDuration)

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_11 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_1) / var_152_11

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_1 + var_152_11 and arg_149_1.time_ < var_152_1 + var_152_11 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play222011038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 222011038
		arg_153_1.duration_ = 4.466

		local var_153_0 = {
			ja = 4.066,
			ko = 4.466,
			zh = 4.466
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
				arg_153_0:Play222011039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10044ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect10044ui_story == nil then
				arg_153_1.var_.characterEffect10044ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect10044ui_story then
					arg_153_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect10044ui_story then
				arg_153_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_156_4 = 0

			if var_156_4 < arg_153_1.time_ and arg_153_1.time_ <= var_156_4 + arg_156_0 then
				arg_153_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 then
				arg_153_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_156_6 = arg_153_1.actors_["1074ui_story"]
			local var_156_7 = 0

			if var_156_7 < arg_153_1.time_ and arg_153_1.time_ <= var_156_7 + arg_156_0 and arg_153_1.var_.characterEffect1074ui_story == nil then
				arg_153_1.var_.characterEffect1074ui_story = var_156_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_8 = 0.200000002980232

			if var_156_7 <= arg_153_1.time_ and arg_153_1.time_ < var_156_7 + var_156_8 then
				local var_156_9 = (arg_153_1.time_ - var_156_7) / var_156_8

				if arg_153_1.var_.characterEffect1074ui_story then
					local var_156_10 = Mathf.Lerp(0, 0.5, var_156_9)

					arg_153_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1074ui_story.fillRatio = var_156_10
				end
			end

			if arg_153_1.time_ >= var_156_7 + var_156_8 and arg_153_1.time_ < var_156_7 + var_156_8 + arg_156_0 and arg_153_1.var_.characterEffect1074ui_story then
				local var_156_11 = 0.5

				arg_153_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1074ui_story.fillRatio = var_156_11
			end

			local var_156_12 = 0
			local var_156_13 = 0.325

			if var_156_12 < arg_153_1.time_ and arg_153_1.time_ <= var_156_12 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_14 = arg_153_1:FormatText(StoryNameCfg[380].name)

				arg_153_1.leftNameTxt_.text = var_156_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_15 = arg_153_1:GetWordFromCfg(222011038)
				local var_156_16 = arg_153_1:FormatText(var_156_15.content)

				arg_153_1.text_.text = var_156_16

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_17 = 13
				local var_156_18 = utf8.len(var_156_16)
				local var_156_19 = var_156_17 <= 0 and var_156_13 or var_156_13 * (var_156_18 / var_156_17)

				if var_156_19 > 0 and var_156_13 < var_156_19 then
					arg_153_1.talkMaxDuration = var_156_19

					if var_156_19 + var_156_12 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_12
					end
				end

				arg_153_1.text_.text = var_156_16
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011038", "story_v_out_222011.awb") ~= 0 then
					local var_156_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011038", "story_v_out_222011.awb") / 1000

					if var_156_20 + var_156_12 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_20 + var_156_12
					end

					if var_156_15.prefab_name ~= "" and arg_153_1.actors_[var_156_15.prefab_name] ~= nil then
						local var_156_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_15.prefab_name].transform, "story_v_out_222011", "222011038", "story_v_out_222011.awb")

						arg_153_1:RecordAudio("222011038", var_156_21)
						arg_153_1:RecordAudio("222011038", var_156_21)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_222011", "222011038", "story_v_out_222011.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_222011", "222011038", "story_v_out_222011.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_22 = math.max(var_156_13, arg_153_1.talkMaxDuration)

			if var_156_12 <= arg_153_1.time_ and arg_153_1.time_ < var_156_12 + var_156_22 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_12) / var_156_22

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_12 + var_156_22 and arg_153_1.time_ < var_156_12 + var_156_22 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play222011039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 222011039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play222011040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10044ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos10044ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, 100, 0)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10044ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, 100, 0)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["10044ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect10044ui_story == nil then
				arg_157_1.var_.characterEffect10044ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect10044ui_story then
					local var_160_13 = Mathf.Lerp(0, 0.5, var_160_12)

					arg_157_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_157_1.var_.characterEffect10044ui_story.fillRatio = var_160_13
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect10044ui_story then
				local var_160_14 = 0.5

				arg_157_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_157_1.var_.characterEffect10044ui_story.fillRatio = var_160_14
			end

			local var_160_15 = arg_157_1.actors_["1074ui_story"].transform
			local var_160_16 = 0

			if var_160_16 < arg_157_1.time_ and arg_157_1.time_ <= var_160_16 + arg_160_0 then
				arg_157_1.var_.moveOldPos1074ui_story = var_160_15.localPosition
			end

			local var_160_17 = 0.001

			if var_160_16 <= arg_157_1.time_ and arg_157_1.time_ < var_160_16 + var_160_17 then
				local var_160_18 = (arg_157_1.time_ - var_160_16) / var_160_17
				local var_160_19 = Vector3.New(0, 100, 0)

				var_160_15.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1074ui_story, var_160_19, var_160_18)

				local var_160_20 = manager.ui.mainCamera.transform.position - var_160_15.position

				var_160_15.forward = Vector3.New(var_160_20.x, var_160_20.y, var_160_20.z)

				local var_160_21 = var_160_15.localEulerAngles

				var_160_21.z = 0
				var_160_21.x = 0
				var_160_15.localEulerAngles = var_160_21
			end

			if arg_157_1.time_ >= var_160_16 + var_160_17 and arg_157_1.time_ < var_160_16 + var_160_17 + arg_160_0 then
				var_160_15.localPosition = Vector3.New(0, 100, 0)

				local var_160_22 = manager.ui.mainCamera.transform.position - var_160_15.position

				var_160_15.forward = Vector3.New(var_160_22.x, var_160_22.y, var_160_22.z)

				local var_160_23 = var_160_15.localEulerAngles

				var_160_23.z = 0
				var_160_23.x = 0
				var_160_15.localEulerAngles = var_160_23
			end

			local var_160_24 = arg_157_1.actors_["1074ui_story"]
			local var_160_25 = 0

			if var_160_25 < arg_157_1.time_ and arg_157_1.time_ <= var_160_25 + arg_160_0 and arg_157_1.var_.characterEffect1074ui_story == nil then
				arg_157_1.var_.characterEffect1074ui_story = var_160_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_26 = 0.200000002980232

			if var_160_25 <= arg_157_1.time_ and arg_157_1.time_ < var_160_25 + var_160_26 then
				local var_160_27 = (arg_157_1.time_ - var_160_25) / var_160_26

				if arg_157_1.var_.characterEffect1074ui_story then
					local var_160_28 = Mathf.Lerp(0, 0.5, var_160_27)

					arg_157_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1074ui_story.fillRatio = var_160_28
				end
			end

			if arg_157_1.time_ >= var_160_25 + var_160_26 and arg_157_1.time_ < var_160_25 + var_160_26 + arg_160_0 and arg_157_1.var_.characterEffect1074ui_story then
				local var_160_29 = 0.5

				arg_157_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1074ui_story.fillRatio = var_160_29
			end

			local var_160_30 = 0
			local var_160_31 = 0.975

			if var_160_30 < arg_157_1.time_ and arg_157_1.time_ <= var_160_30 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_32 = arg_157_1:GetWordFromCfg(222011039)
				local var_160_33 = arg_157_1:FormatText(var_160_32.content)

				arg_157_1.text_.text = var_160_33

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_34 = 39
				local var_160_35 = utf8.len(var_160_33)
				local var_160_36 = var_160_34 <= 0 and var_160_31 or var_160_31 * (var_160_35 / var_160_34)

				if var_160_36 > 0 and var_160_31 < var_160_36 then
					arg_157_1.talkMaxDuration = var_160_36

					if var_160_36 + var_160_30 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_36 + var_160_30
					end
				end

				arg_157_1.text_.text = var_160_33
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_37 = math.max(var_160_31, arg_157_1.talkMaxDuration)

			if var_160_30 <= arg_157_1.time_ and arg_157_1.time_ < var_160_30 + var_160_37 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_30) / var_160_37

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_30 + var_160_37 and arg_157_1.time_ < var_160_30 + var_160_37 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play222011040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 222011040
		arg_161_1.duration_ = 12.3

		local var_161_0 = {
			ja = 12.3,
			ko = 10.233,
			zh = 10.233
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
				arg_161_0:Play222011041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 1.15

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_2 = arg_161_1:FormatText(StoryNameCfg[152].name)

				arg_161_1.leftNameTxt_.text = var_164_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, true)
				arg_161_1.iconController_:SetSelectedState("hero")

				arg_161_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_3 = arg_161_1:GetWordFromCfg(222011040)
				local var_164_4 = arg_161_1:FormatText(var_164_3.content)

				arg_161_1.text_.text = var_164_4

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_5 = 46
				local var_164_6 = utf8.len(var_164_4)
				local var_164_7 = var_164_5 <= 0 and var_164_1 or var_164_1 * (var_164_6 / var_164_5)

				if var_164_7 > 0 and var_164_1 < var_164_7 then
					arg_161_1.talkMaxDuration = var_164_7

					if var_164_7 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_7 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_4
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011040", "story_v_out_222011.awb") ~= 0 then
					local var_164_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011040", "story_v_out_222011.awb") / 1000

					if var_164_8 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_8 + var_164_0
					end

					if var_164_3.prefab_name ~= "" and arg_161_1.actors_[var_164_3.prefab_name] ~= nil then
						local var_164_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_3.prefab_name].transform, "story_v_out_222011", "222011040", "story_v_out_222011.awb")

						arg_161_1:RecordAudio("222011040", var_164_9)
						arg_161_1:RecordAudio("222011040", var_164_9)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_222011", "222011040", "story_v_out_222011.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_222011", "222011040", "story_v_out_222011.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_10 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_10 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_10

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_10 and arg_161_1.time_ < var_164_0 + var_164_10 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play222011041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 222011041
		arg_165_1.duration_ = 5.933

		local var_165_0 = {
			ja = 5.933,
			ko = 3.3,
			zh = 3.3
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
				arg_165_0:Play222011042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = 0
			local var_168_1 = 0.4

			if var_168_0 < arg_165_1.time_ and arg_165_1.time_ <= var_168_0 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_2 = arg_165_1:FormatText(StoryNameCfg[152].name)

				arg_165_1.leftNameTxt_.text = var_168_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, true)
				arg_165_1.iconController_:SetSelectedState("hero")

				arg_165_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_3 = arg_165_1:GetWordFromCfg(222011041)
				local var_168_4 = arg_165_1:FormatText(var_168_3.content)

				arg_165_1.text_.text = var_168_4

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_5 = 16
				local var_168_6 = utf8.len(var_168_4)
				local var_168_7 = var_168_5 <= 0 and var_168_1 or var_168_1 * (var_168_6 / var_168_5)

				if var_168_7 > 0 and var_168_1 < var_168_7 then
					arg_165_1.talkMaxDuration = var_168_7

					if var_168_7 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_7 + var_168_0
					end
				end

				arg_165_1.text_.text = var_168_4
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011041", "story_v_out_222011.awb") ~= 0 then
					local var_168_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011041", "story_v_out_222011.awb") / 1000

					if var_168_8 + var_168_0 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_8 + var_168_0
					end

					if var_168_3.prefab_name ~= "" and arg_165_1.actors_[var_168_3.prefab_name] ~= nil then
						local var_168_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_3.prefab_name].transform, "story_v_out_222011", "222011041", "story_v_out_222011.awb")

						arg_165_1:RecordAudio("222011041", var_168_9)
						arg_165_1:RecordAudio("222011041", var_168_9)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_222011", "222011041", "story_v_out_222011.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_222011", "222011041", "story_v_out_222011.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_10 = math.max(var_168_1, arg_165_1.talkMaxDuration)

			if var_168_0 <= arg_165_1.time_ and arg_165_1.time_ < var_168_0 + var_168_10 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_0) / var_168_10

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_0 + var_168_10 and arg_165_1.time_ < var_168_0 + var_168_10 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play222011042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 222011042
		arg_169_1.duration_ = 4.9

		local var_169_0 = {
			ja = 4.433,
			ko = 4.9,
			zh = 4.9
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
				arg_169_0:Play222011043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1074ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1074ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0.7, -1.055, -6.12)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1074ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1074ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1074ui_story == nil then
				arg_169_1.var_.characterEffect1074ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1074ui_story then
					local var_172_13 = Mathf.Lerp(0, 0.5, var_172_12)

					arg_169_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1074ui_story.fillRatio = var_172_13
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1074ui_story then
				local var_172_14 = 0.5

				arg_169_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1074ui_story.fillRatio = var_172_14
			end

			local var_172_15 = arg_169_1.actors_["10044ui_story"].transform
			local var_172_16 = 0

			if var_172_16 < arg_169_1.time_ and arg_169_1.time_ <= var_172_16 + arg_172_0 then
				arg_169_1.var_.moveOldPos10044ui_story = var_172_15.localPosition
			end

			local var_172_17 = 0.001

			if var_172_16 <= arg_169_1.time_ and arg_169_1.time_ < var_172_16 + var_172_17 then
				local var_172_18 = (arg_169_1.time_ - var_172_16) / var_172_17
				local var_172_19 = Vector3.New(-0.7, -0.72, -6.3)

				var_172_15.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10044ui_story, var_172_19, var_172_18)

				local var_172_20 = manager.ui.mainCamera.transform.position - var_172_15.position

				var_172_15.forward = Vector3.New(var_172_20.x, var_172_20.y, var_172_20.z)

				local var_172_21 = var_172_15.localEulerAngles

				var_172_21.z = 0
				var_172_21.x = 0
				var_172_15.localEulerAngles = var_172_21
			end

			if arg_169_1.time_ >= var_172_16 + var_172_17 and arg_169_1.time_ < var_172_16 + var_172_17 + arg_172_0 then
				var_172_15.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_172_22 = manager.ui.mainCamera.transform.position - var_172_15.position

				var_172_15.forward = Vector3.New(var_172_22.x, var_172_22.y, var_172_22.z)

				local var_172_23 = var_172_15.localEulerAngles

				var_172_23.z = 0
				var_172_23.x = 0
				var_172_15.localEulerAngles = var_172_23
			end

			local var_172_24 = arg_169_1.actors_["10044ui_story"]
			local var_172_25 = 0

			if var_172_25 < arg_169_1.time_ and arg_169_1.time_ <= var_172_25 + arg_172_0 and arg_169_1.var_.characterEffect10044ui_story == nil then
				arg_169_1.var_.characterEffect10044ui_story = var_172_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_26 = 0.200000002980232

			if var_172_25 <= arg_169_1.time_ and arg_169_1.time_ < var_172_25 + var_172_26 then
				local var_172_27 = (arg_169_1.time_ - var_172_25) / var_172_26

				if arg_169_1.var_.characterEffect10044ui_story then
					arg_169_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_25 + var_172_26 and arg_169_1.time_ < var_172_25 + var_172_26 + arg_172_0 and arg_169_1.var_.characterEffect10044ui_story then
				arg_169_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_172_28 = 0

			if var_172_28 < arg_169_1.time_ and arg_169_1.time_ <= var_172_28 + arg_172_0 then
				arg_169_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_172_29 = 0

			if var_172_29 < arg_169_1.time_ and arg_169_1.time_ <= var_172_29 + arg_172_0 then
				arg_169_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_172_30 = 0
			local var_172_31 = 0.525

			if var_172_30 < arg_169_1.time_ and arg_169_1.time_ <= var_172_30 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_32 = arg_169_1:FormatText(StoryNameCfg[380].name)

				arg_169_1.leftNameTxt_.text = var_172_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_33 = arg_169_1:GetWordFromCfg(222011042)
				local var_172_34 = arg_169_1:FormatText(var_172_33.content)

				arg_169_1.text_.text = var_172_34

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_35 = 21
				local var_172_36 = utf8.len(var_172_34)
				local var_172_37 = var_172_35 <= 0 and var_172_31 or var_172_31 * (var_172_36 / var_172_35)

				if var_172_37 > 0 and var_172_31 < var_172_37 then
					arg_169_1.talkMaxDuration = var_172_37

					if var_172_37 + var_172_30 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_37 + var_172_30
					end
				end

				arg_169_1.text_.text = var_172_34
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011042", "story_v_out_222011.awb") ~= 0 then
					local var_172_38 = manager.audio:GetVoiceLength("story_v_out_222011", "222011042", "story_v_out_222011.awb") / 1000

					if var_172_38 + var_172_30 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_38 + var_172_30
					end

					if var_172_33.prefab_name ~= "" and arg_169_1.actors_[var_172_33.prefab_name] ~= nil then
						local var_172_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_33.prefab_name].transform, "story_v_out_222011", "222011042", "story_v_out_222011.awb")

						arg_169_1:RecordAudio("222011042", var_172_39)
						arg_169_1:RecordAudio("222011042", var_172_39)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_222011", "222011042", "story_v_out_222011.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_222011", "222011042", "story_v_out_222011.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_40 = math.max(var_172_31, arg_169_1.talkMaxDuration)

			if var_172_30 <= arg_169_1.time_ and arg_169_1.time_ < var_172_30 + var_172_40 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_30) / var_172_40

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_30 + var_172_40 and arg_169_1.time_ < var_172_30 + var_172_40 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play222011043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 222011043
		arg_173_1.duration_ = 7.433

		local var_173_0 = {
			ja = 7.433,
			ko = 4.633,
			zh = 4.633
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
				arg_173_0:Play222011044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1074ui_story"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.characterEffect1074ui_story == nil then
				arg_173_1.var_.characterEffect1074ui_story = var_176_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_2 = 0.200000002980232

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.characterEffect1074ui_story then
					arg_173_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.characterEffect1074ui_story then
				arg_173_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_176_4 = 0

			if var_176_4 < arg_173_1.time_ and arg_173_1.time_ <= var_176_4 + arg_176_0 then
				arg_173_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_176_5 = arg_173_1.actors_["10044ui_story"]
			local var_176_6 = 0

			if var_176_6 < arg_173_1.time_ and arg_173_1.time_ <= var_176_6 + arg_176_0 and arg_173_1.var_.characterEffect10044ui_story == nil then
				arg_173_1.var_.characterEffect10044ui_story = var_176_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_7 = 0.200000002980232

			if var_176_6 <= arg_173_1.time_ and arg_173_1.time_ < var_176_6 + var_176_7 then
				local var_176_8 = (arg_173_1.time_ - var_176_6) / var_176_7

				if arg_173_1.var_.characterEffect10044ui_story then
					local var_176_9 = Mathf.Lerp(0, 0.5, var_176_8)

					arg_173_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_173_1.var_.characterEffect10044ui_story.fillRatio = var_176_9
				end
			end

			if arg_173_1.time_ >= var_176_6 + var_176_7 and arg_173_1.time_ < var_176_6 + var_176_7 + arg_176_0 and arg_173_1.var_.characterEffect10044ui_story then
				local var_176_10 = 0.5

				arg_173_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_173_1.var_.characterEffect10044ui_story.fillRatio = var_176_10
			end

			local var_176_11 = 0
			local var_176_12 = 0.425

			if var_176_11 < arg_173_1.time_ and arg_173_1.time_ <= var_176_11 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_13 = arg_173_1:FormatText(StoryNameCfg[410].name)

				arg_173_1.leftNameTxt_.text = var_176_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_14 = arg_173_1:GetWordFromCfg(222011043)
				local var_176_15 = arg_173_1:FormatText(var_176_14.content)

				arg_173_1.text_.text = var_176_15

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_16 = 17
				local var_176_17 = utf8.len(var_176_15)
				local var_176_18 = var_176_16 <= 0 and var_176_12 or var_176_12 * (var_176_17 / var_176_16)

				if var_176_18 > 0 and var_176_12 < var_176_18 then
					arg_173_1.talkMaxDuration = var_176_18

					if var_176_18 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_18 + var_176_11
					end
				end

				arg_173_1.text_.text = var_176_15
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011043", "story_v_out_222011.awb") ~= 0 then
					local var_176_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011043", "story_v_out_222011.awb") / 1000

					if var_176_19 + var_176_11 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_19 + var_176_11
					end

					if var_176_14.prefab_name ~= "" and arg_173_1.actors_[var_176_14.prefab_name] ~= nil then
						local var_176_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_14.prefab_name].transform, "story_v_out_222011", "222011043", "story_v_out_222011.awb")

						arg_173_1:RecordAudio("222011043", var_176_20)
						arg_173_1:RecordAudio("222011043", var_176_20)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_222011", "222011043", "story_v_out_222011.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_222011", "222011043", "story_v_out_222011.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_21 = math.max(var_176_12, arg_173_1.talkMaxDuration)

			if var_176_11 <= arg_173_1.time_ and arg_173_1.time_ < var_176_11 + var_176_21 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_11) / var_176_21

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_11 + var_176_21 and arg_173_1.time_ < var_176_11 + var_176_21 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play222011044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 222011044
		arg_177_1.duration_ = 8.6

		local var_177_0 = {
			ja = 8.6,
			ko = 5.133,
			zh = 5.133
		}
		local var_177_1 = manager.audio:GetLocalizationFlag()

		if var_177_0[var_177_1] ~= nil then
			arg_177_1.duration_ = var_177_0[var_177_1]
		end

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play222011045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10044ui_story"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.characterEffect10044ui_story == nil then
				arg_177_1.var_.characterEffect10044ui_story = var_180_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_2 = 0.200000002980232

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.characterEffect10044ui_story then
					arg_177_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.characterEffect10044ui_story then
				arg_177_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_180_4 = 0

			if var_180_4 < arg_177_1.time_ and arg_177_1.time_ <= var_180_4 + arg_180_0 then
				arg_177_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_180_5 = 0

			if var_180_5 < arg_177_1.time_ and arg_177_1.time_ <= var_180_5 + arg_180_0 then
				arg_177_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_180_6 = arg_177_1.actors_["1074ui_story"]
			local var_180_7 = 0

			if var_180_7 < arg_177_1.time_ and arg_177_1.time_ <= var_180_7 + arg_180_0 and arg_177_1.var_.characterEffect1074ui_story == nil then
				arg_177_1.var_.characterEffect1074ui_story = var_180_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_8 = 0.200000002980232

			if var_180_7 <= arg_177_1.time_ and arg_177_1.time_ < var_180_7 + var_180_8 then
				local var_180_9 = (arg_177_1.time_ - var_180_7) / var_180_8

				if arg_177_1.var_.characterEffect1074ui_story then
					local var_180_10 = Mathf.Lerp(0, 0.5, var_180_9)

					arg_177_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1074ui_story.fillRatio = var_180_10
				end
			end

			if arg_177_1.time_ >= var_180_7 + var_180_8 and arg_177_1.time_ < var_180_7 + var_180_8 + arg_180_0 and arg_177_1.var_.characterEffect1074ui_story then
				local var_180_11 = 0.5

				arg_177_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1074ui_story.fillRatio = var_180_11
			end

			local var_180_12 = 0
			local var_180_13 = 0.45

			if var_180_12 < arg_177_1.time_ and arg_177_1.time_ <= var_180_12 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_14 = arg_177_1:FormatText(StoryNameCfg[380].name)

				arg_177_1.leftNameTxt_.text = var_180_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_15 = arg_177_1:GetWordFromCfg(222011044)
				local var_180_16 = arg_177_1:FormatText(var_180_15.content)

				arg_177_1.text_.text = var_180_16

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_17 = 18
				local var_180_18 = utf8.len(var_180_16)
				local var_180_19 = var_180_17 <= 0 and var_180_13 or var_180_13 * (var_180_18 / var_180_17)

				if var_180_19 > 0 and var_180_13 < var_180_19 then
					arg_177_1.talkMaxDuration = var_180_19

					if var_180_19 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_19 + var_180_12
					end
				end

				arg_177_1.text_.text = var_180_16
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011044", "story_v_out_222011.awb") ~= 0 then
					local var_180_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011044", "story_v_out_222011.awb") / 1000

					if var_180_20 + var_180_12 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_20 + var_180_12
					end

					if var_180_15.prefab_name ~= "" and arg_177_1.actors_[var_180_15.prefab_name] ~= nil then
						local var_180_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_15.prefab_name].transform, "story_v_out_222011", "222011044", "story_v_out_222011.awb")

						arg_177_1:RecordAudio("222011044", var_180_21)
						arg_177_1:RecordAudio("222011044", var_180_21)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_222011", "222011044", "story_v_out_222011.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_222011", "222011044", "story_v_out_222011.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_22 = math.max(var_180_13, arg_177_1.talkMaxDuration)

			if var_180_12 <= arg_177_1.time_ and arg_177_1.time_ < var_180_12 + var_180_22 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_12) / var_180_22

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_12 + var_180_22 and arg_177_1.time_ < var_180_12 + var_180_22 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play222011045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 222011045
		arg_181_1.duration_ = 5.866

		local var_181_0 = {
			ja = 5.866,
			ko = 5.1,
			zh = 5.1
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
				arg_181_0:Play222011046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1074ui_story"]
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 and arg_181_1.var_.characterEffect1074ui_story == nil then
				arg_181_1.var_.characterEffect1074ui_story = var_184_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_2 = 0.200000002980232

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2

				if arg_181_1.var_.characterEffect1074ui_story then
					arg_181_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 and arg_181_1.var_.characterEffect1074ui_story then
				arg_181_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_184_4 = 0

			if var_184_4 < arg_181_1.time_ and arg_181_1.time_ <= var_184_4 + arg_184_0 then
				arg_181_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_184_5 = 0

			if var_184_5 < arg_181_1.time_ and arg_181_1.time_ <= var_184_5 + arg_184_0 then
				arg_181_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_184_6 = arg_181_1.actors_["10044ui_story"]
			local var_184_7 = 0

			if var_184_7 < arg_181_1.time_ and arg_181_1.time_ <= var_184_7 + arg_184_0 and arg_181_1.var_.characterEffect10044ui_story == nil then
				arg_181_1.var_.characterEffect10044ui_story = var_184_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_8 = 0.200000002980232

			if var_184_7 <= arg_181_1.time_ and arg_181_1.time_ < var_184_7 + var_184_8 then
				local var_184_9 = (arg_181_1.time_ - var_184_7) / var_184_8

				if arg_181_1.var_.characterEffect10044ui_story then
					local var_184_10 = Mathf.Lerp(0, 0.5, var_184_9)

					arg_181_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_181_1.var_.characterEffect10044ui_story.fillRatio = var_184_10
				end
			end

			if arg_181_1.time_ >= var_184_7 + var_184_8 and arg_181_1.time_ < var_184_7 + var_184_8 + arg_184_0 and arg_181_1.var_.characterEffect10044ui_story then
				local var_184_11 = 0.5

				arg_181_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_181_1.var_.characterEffect10044ui_story.fillRatio = var_184_11
			end

			local var_184_12 = 0
			local var_184_13 = 0.65

			if var_184_12 < arg_181_1.time_ and arg_181_1.time_ <= var_184_12 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_14 = arg_181_1:FormatText(StoryNameCfg[410].name)

				arg_181_1.leftNameTxt_.text = var_184_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_15 = arg_181_1:GetWordFromCfg(222011045)
				local var_184_16 = arg_181_1:FormatText(var_184_15.content)

				arg_181_1.text_.text = var_184_16

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_17 = 26
				local var_184_18 = utf8.len(var_184_16)
				local var_184_19 = var_184_17 <= 0 and var_184_13 or var_184_13 * (var_184_18 / var_184_17)

				if var_184_19 > 0 and var_184_13 < var_184_19 then
					arg_181_1.talkMaxDuration = var_184_19

					if var_184_19 + var_184_12 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_19 + var_184_12
					end
				end

				arg_181_1.text_.text = var_184_16
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011045", "story_v_out_222011.awb") ~= 0 then
					local var_184_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011045", "story_v_out_222011.awb") / 1000

					if var_184_20 + var_184_12 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_20 + var_184_12
					end

					if var_184_15.prefab_name ~= "" and arg_181_1.actors_[var_184_15.prefab_name] ~= nil then
						local var_184_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_15.prefab_name].transform, "story_v_out_222011", "222011045", "story_v_out_222011.awb")

						arg_181_1:RecordAudio("222011045", var_184_21)
						arg_181_1:RecordAudio("222011045", var_184_21)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_222011", "222011045", "story_v_out_222011.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_222011", "222011045", "story_v_out_222011.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_22 = math.max(var_184_13, arg_181_1.talkMaxDuration)

			if var_184_12 <= arg_181_1.time_ and arg_181_1.time_ < var_184_12 + var_184_22 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_12) / var_184_22

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_12 + var_184_22 and arg_181_1.time_ < var_184_12 + var_184_22 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play222011046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 222011046
		arg_185_1.duration_ = 3.6

		local var_185_0 = {
			ja = 3.6,
			ko = 3.2,
			zh = 3.2
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
				arg_185_0:Play222011047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action3_1")
			end

			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 then
				arg_185_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_188_2 = 0
			local var_188_3 = 0.35

			if var_188_2 < arg_185_1.time_ and arg_185_1.time_ <= var_188_2 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_4 = arg_185_1:FormatText(StoryNameCfg[410].name)

				arg_185_1.leftNameTxt_.text = var_188_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_5 = arg_185_1:GetWordFromCfg(222011046)
				local var_188_6 = arg_185_1:FormatText(var_188_5.content)

				arg_185_1.text_.text = var_188_6

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_7 = 14
				local var_188_8 = utf8.len(var_188_6)
				local var_188_9 = var_188_7 <= 0 and var_188_3 or var_188_3 * (var_188_8 / var_188_7)

				if var_188_9 > 0 and var_188_3 < var_188_9 then
					arg_185_1.talkMaxDuration = var_188_9

					if var_188_9 + var_188_2 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_9 + var_188_2
					end
				end

				arg_185_1.text_.text = var_188_6
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011046", "story_v_out_222011.awb") ~= 0 then
					local var_188_10 = manager.audio:GetVoiceLength("story_v_out_222011", "222011046", "story_v_out_222011.awb") / 1000

					if var_188_10 + var_188_2 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_10 + var_188_2
					end

					if var_188_5.prefab_name ~= "" and arg_185_1.actors_[var_188_5.prefab_name] ~= nil then
						local var_188_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_5.prefab_name].transform, "story_v_out_222011", "222011046", "story_v_out_222011.awb")

						arg_185_1:RecordAudio("222011046", var_188_11)
						arg_185_1:RecordAudio("222011046", var_188_11)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_222011", "222011046", "story_v_out_222011.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_222011", "222011046", "story_v_out_222011.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_12 = math.max(var_188_3, arg_185_1.talkMaxDuration)

			if var_188_2 <= arg_185_1.time_ and arg_185_1.time_ < var_188_2 + var_188_12 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_2) / var_188_12

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_2 + var_188_12 and arg_185_1.time_ < var_188_2 + var_188_12 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play222011047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 222011047
		arg_189_1.duration_ = 5.8

		local var_189_0 = {
			ja = 5.8,
			ko = 4.2,
			zh = 4.2
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
				arg_189_0:Play222011048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10044ui_story"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.characterEffect10044ui_story == nil then
				arg_189_1.var_.characterEffect10044ui_story = var_192_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_2 = 0.200000002980232

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.characterEffect10044ui_story then
					arg_189_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.characterEffect10044ui_story then
				arg_189_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_192_4 = 0

			if var_192_4 < arg_189_1.time_ and arg_189_1.time_ <= var_192_4 + arg_192_0 then
				arg_189_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_192_5 = 0

			if var_192_5 < arg_189_1.time_ and arg_189_1.time_ <= var_192_5 + arg_192_0 then
				arg_189_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_192_6 = arg_189_1.actors_["1074ui_story"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.characterEffect1074ui_story == nil then
				arg_189_1.var_.characterEffect1074ui_story = var_192_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_192_8 = 0.200000002980232

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.characterEffect1074ui_story then
					local var_192_10 = Mathf.Lerp(0, 0.5, var_192_9)

					arg_189_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_189_1.var_.characterEffect1074ui_story.fillRatio = var_192_10
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.characterEffect1074ui_story then
				local var_192_11 = 0.5

				arg_189_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_189_1.var_.characterEffect1074ui_story.fillRatio = var_192_11
			end

			local var_192_12 = 0
			local var_192_13 = 0.5

			if var_192_12 < arg_189_1.time_ and arg_189_1.time_ <= var_192_12 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_14 = arg_189_1:FormatText(StoryNameCfg[380].name)

				arg_189_1.leftNameTxt_.text = var_192_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_15 = arg_189_1:GetWordFromCfg(222011047)
				local var_192_16 = arg_189_1:FormatText(var_192_15.content)

				arg_189_1.text_.text = var_192_16

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_17 = 20
				local var_192_18 = utf8.len(var_192_16)
				local var_192_19 = var_192_17 <= 0 and var_192_13 or var_192_13 * (var_192_18 / var_192_17)

				if var_192_19 > 0 and var_192_13 < var_192_19 then
					arg_189_1.talkMaxDuration = var_192_19

					if var_192_19 + var_192_12 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_19 + var_192_12
					end
				end

				arg_189_1.text_.text = var_192_16
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011047", "story_v_out_222011.awb") ~= 0 then
					local var_192_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011047", "story_v_out_222011.awb") / 1000

					if var_192_20 + var_192_12 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_20 + var_192_12
					end

					if var_192_15.prefab_name ~= "" and arg_189_1.actors_[var_192_15.prefab_name] ~= nil then
						local var_192_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_15.prefab_name].transform, "story_v_out_222011", "222011047", "story_v_out_222011.awb")

						arg_189_1:RecordAudio("222011047", var_192_21)
						arg_189_1:RecordAudio("222011047", var_192_21)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_222011", "222011047", "story_v_out_222011.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_222011", "222011047", "story_v_out_222011.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_22 = math.max(var_192_13, arg_189_1.talkMaxDuration)

			if var_192_12 <= arg_189_1.time_ and arg_189_1.time_ < var_192_12 + var_192_22 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_12) / var_192_22

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_12 + var_192_22 and arg_189_1.time_ < var_192_12 + var_192_22 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play222011048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 222011048
		arg_193_1.duration_ = 10.066

		local var_193_0 = {
			ja = 10.066,
			ko = 7.633,
			zh = 7.633
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
				arg_193_0:Play222011049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10044ui_story"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.characterEffect10044ui_story == nil then
				arg_193_1.var_.characterEffect10044ui_story = var_196_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_196_2 = 0.200000002980232

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.characterEffect10044ui_story then
					arg_193_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.characterEffect10044ui_story then
				arg_193_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_196_4 = 0

			if var_196_4 < arg_193_1.time_ and arg_193_1.time_ <= var_196_4 + arg_196_0 then
				arg_193_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_196_5 = 0

			if var_196_5 < arg_193_1.time_ and arg_193_1.time_ <= var_196_5 + arg_196_0 then
				arg_193_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_196_6 = 0
			local var_196_7 = 0.875

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_8 = arg_193_1:FormatText(StoryNameCfg[380].name)

				arg_193_1.leftNameTxt_.text = var_196_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_9 = arg_193_1:GetWordFromCfg(222011048)
				local var_196_10 = arg_193_1:FormatText(var_196_9.content)

				arg_193_1.text_.text = var_196_10

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_11 = 35
				local var_196_12 = utf8.len(var_196_10)
				local var_196_13 = var_196_11 <= 0 and var_196_7 or var_196_7 * (var_196_12 / var_196_11)

				if var_196_13 > 0 and var_196_7 < var_196_13 then
					arg_193_1.talkMaxDuration = var_196_13

					if var_196_13 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_13 + var_196_6
					end
				end

				arg_193_1.text_.text = var_196_10
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011048", "story_v_out_222011.awb") ~= 0 then
					local var_196_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011048", "story_v_out_222011.awb") / 1000

					if var_196_14 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_14 + var_196_6
					end

					if var_196_9.prefab_name ~= "" and arg_193_1.actors_[var_196_9.prefab_name] ~= nil then
						local var_196_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_9.prefab_name].transform, "story_v_out_222011", "222011048", "story_v_out_222011.awb")

						arg_193_1:RecordAudio("222011048", var_196_15)
						arg_193_1:RecordAudio("222011048", var_196_15)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_222011", "222011048", "story_v_out_222011.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_222011", "222011048", "story_v_out_222011.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_16 = math.max(var_196_7, arg_193_1.talkMaxDuration)

			if var_196_6 <= arg_193_1.time_ and arg_193_1.time_ < var_196_6 + var_196_16 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_6) / var_196_16

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_6 + var_196_16 and arg_193_1.time_ < var_196_6 + var_196_16 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play222011049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 222011049
		arg_197_1.duration_ = 12.9

		local var_197_0 = {
			ja = 12.9,
			ko = 10.7,
			zh = 10.7
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
				arg_197_0:Play222011050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["10044ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect10044ui_story == nil then
				arg_197_1.var_.characterEffect10044ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect10044ui_story then
					arg_197_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect10044ui_story then
				arg_197_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_200_4 = 0

			if var_200_4 < arg_197_1.time_ and arg_197_1.time_ <= var_200_4 + arg_200_0 then
				arg_197_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_200_5 = 0

			if var_200_5 < arg_197_1.time_ and arg_197_1.time_ <= var_200_5 + arg_200_0 then
				arg_197_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_200_6 = 0

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action3_2")
			end

			local var_200_7 = 0
			local var_200_8 = 1.275

			if var_200_7 < arg_197_1.time_ and arg_197_1.time_ <= var_200_7 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_9 = arg_197_1:FormatText(StoryNameCfg[380].name)

				arg_197_1.leftNameTxt_.text = var_200_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_10 = arg_197_1:GetWordFromCfg(222011049)
				local var_200_11 = arg_197_1:FormatText(var_200_10.content)

				arg_197_1.text_.text = var_200_11

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_12 = 51
				local var_200_13 = utf8.len(var_200_11)
				local var_200_14 = var_200_12 <= 0 and var_200_8 or var_200_8 * (var_200_13 / var_200_12)

				if var_200_14 > 0 and var_200_8 < var_200_14 then
					arg_197_1.talkMaxDuration = var_200_14

					if var_200_14 + var_200_7 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_14 + var_200_7
					end
				end

				arg_197_1.text_.text = var_200_11
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011049", "story_v_out_222011.awb") ~= 0 then
					local var_200_15 = manager.audio:GetVoiceLength("story_v_out_222011", "222011049", "story_v_out_222011.awb") / 1000

					if var_200_15 + var_200_7 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_15 + var_200_7
					end

					if var_200_10.prefab_name ~= "" and arg_197_1.actors_[var_200_10.prefab_name] ~= nil then
						local var_200_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_10.prefab_name].transform, "story_v_out_222011", "222011049", "story_v_out_222011.awb")

						arg_197_1:RecordAudio("222011049", var_200_16)
						arg_197_1:RecordAudio("222011049", var_200_16)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_out_222011", "222011049", "story_v_out_222011.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_out_222011", "222011049", "story_v_out_222011.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_17 = math.max(var_200_8, arg_197_1.talkMaxDuration)

			if var_200_7 <= arg_197_1.time_ and arg_197_1.time_ < var_200_7 + var_200_17 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_7) / var_200_17

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_7 + var_200_17 and arg_197_1.time_ < var_200_7 + var_200_17 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play222011050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 222011050
		arg_201_1.duration_ = 6.69933333333333

		local var_201_0 = {
			ja = 6.69933333333333,
			ko = 6.36633333333333,
			zh = 6.36633333333333
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
				arg_201_0:Play222011051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1074ui_story"].transform
			local var_204_1 = 2

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1074ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -1.055, -6.12)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1074ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1074ui_story"]
			local var_204_10 = 2

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1074ui_story == nil then
				arg_201_1.var_.characterEffect1074ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1074ui_story then
					arg_201_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1074ui_story then
				arg_201_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_204_13 = 2

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_204_14 = 2

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_204_15 = arg_201_1.actors_["10044ui_story"].transform
			local var_204_16 = 1.96599999815226

			if var_204_16 < arg_201_1.time_ and arg_201_1.time_ <= var_204_16 + arg_204_0 then
				arg_201_1.var_.moveOldPos10044ui_story = var_204_15.localPosition
			end

			local var_204_17 = 0.001

			if var_204_16 <= arg_201_1.time_ and arg_201_1.time_ < var_204_16 + var_204_17 then
				local var_204_18 = (arg_201_1.time_ - var_204_16) / var_204_17
				local var_204_19 = Vector3.New(0, 100, 0)

				var_204_15.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10044ui_story, var_204_19, var_204_18)

				local var_204_20 = manager.ui.mainCamera.transform.position - var_204_15.position

				var_204_15.forward = Vector3.New(var_204_20.x, var_204_20.y, var_204_20.z)

				local var_204_21 = var_204_15.localEulerAngles

				var_204_21.z = 0
				var_204_21.x = 0
				var_204_15.localEulerAngles = var_204_21
			end

			if arg_201_1.time_ >= var_204_16 + var_204_17 and arg_201_1.time_ < var_204_16 + var_204_17 + arg_204_0 then
				var_204_15.localPosition = Vector3.New(0, 100, 0)

				local var_204_22 = manager.ui.mainCamera.transform.position - var_204_15.position

				var_204_15.forward = Vector3.New(var_204_22.x, var_204_22.y, var_204_22.z)

				local var_204_23 = var_204_15.localEulerAngles

				var_204_23.z = 0
				var_204_23.x = 0
				var_204_15.localEulerAngles = var_204_23
			end

			local var_204_24 = arg_201_1.actors_["10044ui_story"]
			local var_204_25 = 1.96599999815226

			if var_204_25 < arg_201_1.time_ and arg_201_1.time_ <= var_204_25 + arg_204_0 and arg_201_1.var_.characterEffect10044ui_story == nil then
				arg_201_1.var_.characterEffect10044ui_story = var_204_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_26 = 0.034000001847744

			if var_204_25 <= arg_201_1.time_ and arg_201_1.time_ < var_204_25 + var_204_26 then
				local var_204_27 = (arg_201_1.time_ - var_204_25) / var_204_26

				if arg_201_1.var_.characterEffect10044ui_story then
					local var_204_28 = Mathf.Lerp(0, 0.5, var_204_27)

					arg_201_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_201_1.var_.characterEffect10044ui_story.fillRatio = var_204_28
				end
			end

			if arg_201_1.time_ >= var_204_25 + var_204_26 and arg_201_1.time_ < var_204_25 + var_204_26 + arg_204_0 and arg_201_1.var_.characterEffect10044ui_story then
				local var_204_29 = 0.5

				arg_201_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_201_1.var_.characterEffect10044ui_story.fillRatio = var_204_29
			end

			local var_204_30 = 0

			if var_204_30 < arg_201_1.time_ and arg_201_1.time_ <= var_204_30 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_31 = 2

			if var_204_30 <= arg_201_1.time_ and arg_201_1.time_ < var_204_30 + var_204_31 then
				local var_204_32 = (arg_201_1.time_ - var_204_30) / var_204_31
				local var_204_33 = Color.New(0, 0, 0)

				var_204_33.a = Mathf.Lerp(0, 1, var_204_32)
				arg_201_1.mask_.color = var_204_33
			end

			if arg_201_1.time_ >= var_204_30 + var_204_31 and arg_201_1.time_ < var_204_30 + var_204_31 + arg_204_0 then
				local var_204_34 = Color.New(0, 0, 0)

				var_204_34.a = 1
				arg_201_1.mask_.color = var_204_34
			end

			local var_204_35 = 2

			if var_204_35 < arg_201_1.time_ and arg_201_1.time_ <= var_204_35 + arg_204_0 then
				arg_201_1.mask_.enabled = true
				arg_201_1.mask_.raycastTarget = true

				arg_201_1:SetGaussion(false)
			end

			local var_204_36 = 2

			if var_204_35 <= arg_201_1.time_ and arg_201_1.time_ < var_204_35 + var_204_36 then
				local var_204_37 = (arg_201_1.time_ - var_204_35) / var_204_36
				local var_204_38 = Color.New(0, 0, 0)

				var_204_38.a = Mathf.Lerp(1, 0, var_204_37)
				arg_201_1.mask_.color = var_204_38
			end

			if arg_201_1.time_ >= var_204_35 + var_204_36 and arg_201_1.time_ < var_204_35 + var_204_36 + arg_204_0 then
				local var_204_39 = Color.New(0, 0, 0)
				local var_204_40 = 0

				arg_201_1.mask_.enabled = false
				var_204_39.a = var_204_40
				arg_201_1.mask_.color = var_204_39
			end

			if arg_201_1.frameCnt_ <= 1 then
				arg_201_1.dialog_:SetActive(false)
			end

			local var_204_41 = 2.83333333333333
			local var_204_42 = 0.2

			if var_204_41 < arg_201_1.time_ and arg_201_1.time_ <= var_204_41 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0

				arg_201_1.dialog_:SetActive(true)

				local var_204_43 = LeanTween.value(arg_201_1.dialog_, 0, 1, 0.3)

				var_204_43:setOnUpdate(LuaHelper.FloatAction(function(arg_205_0)
					arg_201_1.dialogCg_.alpha = arg_205_0
				end))
				var_204_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_201_1.dialog_)
					var_204_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_201_1.duration_ = arg_201_1.duration_ + 0.3

				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_44 = arg_201_1:FormatText(StoryNameCfg[410].name)

				arg_201_1.leftNameTxt_.text = var_204_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_45 = arg_201_1:GetWordFromCfg(222011050)
				local var_204_46 = arg_201_1:FormatText(var_204_45.content)

				arg_201_1.text_.text = var_204_46

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_47 = 8
				local var_204_48 = utf8.len(var_204_46)
				local var_204_49 = var_204_47 <= 0 and var_204_42 or var_204_42 * (var_204_48 / var_204_47)

				if var_204_49 > 0 and var_204_42 < var_204_49 then
					arg_201_1.talkMaxDuration = var_204_49
					var_204_41 = var_204_41 + 0.3

					if var_204_49 + var_204_41 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_49 + var_204_41
					end
				end

				arg_201_1.text_.text = var_204_46
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011050", "story_v_out_222011.awb") ~= 0 then
					local var_204_50 = manager.audio:GetVoiceLength("story_v_out_222011", "222011050", "story_v_out_222011.awb") / 1000

					if var_204_50 + var_204_41 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_50 + var_204_41
					end

					if var_204_45.prefab_name ~= "" and arg_201_1.actors_[var_204_45.prefab_name] ~= nil then
						local var_204_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_45.prefab_name].transform, "story_v_out_222011", "222011050", "story_v_out_222011.awb")

						arg_201_1:RecordAudio("222011050", var_204_51)
						arg_201_1:RecordAudio("222011050", var_204_51)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_222011", "222011050", "story_v_out_222011.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_222011", "222011050", "story_v_out_222011.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_52 = var_204_41 + 0.3
			local var_204_53 = math.max(var_204_42, arg_201_1.talkMaxDuration)

			if var_204_52 <= arg_201_1.time_ and arg_201_1.time_ < var_204_52 + var_204_53 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_52) / var_204_53

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_52 + var_204_53 and arg_201_1.time_ < var_204_52 + var_204_53 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play222011051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 222011051
		arg_207_1.duration_ = 5

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play222011052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1074ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1074ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(0, 100, 0)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1074ui_story, var_210_4, var_210_3)

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

			local var_210_9 = arg_207_1.actors_["1074ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect1074ui_story == nil then
				arg_207_1.var_.characterEffect1074ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect1074ui_story then
					local var_210_13 = Mathf.Lerp(0, 0.5, var_210_12)

					arg_207_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1074ui_story.fillRatio = var_210_13
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect1074ui_story then
				local var_210_14 = 0.5

				arg_207_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1074ui_story.fillRatio = var_210_14
			end

			local var_210_15 = 0
			local var_210_16 = 0.8

			if var_210_15 < arg_207_1.time_ and arg_207_1.time_ <= var_210_15 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, false)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_17 = arg_207_1:GetWordFromCfg(222011051)
				local var_210_18 = arg_207_1:FormatText(var_210_17.content)

				arg_207_1.text_.text = var_210_18

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_19 = 32
				local var_210_20 = utf8.len(var_210_18)
				local var_210_21 = var_210_19 <= 0 and var_210_16 or var_210_16 * (var_210_20 / var_210_19)

				if var_210_21 > 0 and var_210_16 < var_210_21 then
					arg_207_1.talkMaxDuration = var_210_21

					if var_210_21 + var_210_15 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_21 + var_210_15
					end
				end

				arg_207_1.text_.text = var_210_18
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)
				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_22 = math.max(var_210_16, arg_207_1.talkMaxDuration)

			if var_210_15 <= arg_207_1.time_ and arg_207_1.time_ < var_210_15 + var_210_22 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_15) / var_210_22

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_15 + var_210_22 and arg_207_1.time_ < var_210_15 + var_210_22 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play222011052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 222011052
		arg_211_1.duration_ = 5

		SetActive(arg_211_1.tipsGo_, false)

		function arg_211_1.onSingleLineFinish_()
			arg_211_1.onSingleLineUpdate_ = nil
			arg_211_1.onSingleLineFinish_ = nil
			arg_211_1.state_ = "waiting"
		end

		function arg_211_1.playNext_(arg_213_0)
			if arg_213_0 == 1 then
				arg_211_0:Play222011053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0
			local var_214_1 = 1.4

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, false)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_2 = arg_211_1:GetWordFromCfg(222011052)
				local var_214_3 = arg_211_1:FormatText(var_214_2.content)

				arg_211_1.text_.text = var_214_3

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_4 = 56
				local var_214_5 = utf8.len(var_214_3)
				local var_214_6 = var_214_4 <= 0 and var_214_1 or var_214_1 * (var_214_5 / var_214_4)

				if var_214_6 > 0 and var_214_1 < var_214_6 then
					arg_211_1.talkMaxDuration = var_214_6

					if var_214_6 + var_214_0 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_6 + var_214_0
					end
				end

				arg_211_1.text_.text = var_214_3
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)
				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_7 = math.max(var_214_1, arg_211_1.talkMaxDuration)

			if var_214_0 <= arg_211_1.time_ and arg_211_1.time_ < var_214_0 + var_214_7 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_0) / var_214_7

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_0 + var_214_7 and arg_211_1.time_ < var_214_0 + var_214_7 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play222011053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 222011053
		arg_215_1.duration_ = 17.7

		local var_215_0 = {
			ja = 17.7,
			ko = 15.1,
			zh = 15.1
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
				arg_215_0:Play222011054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0
			local var_218_1 = 1.775

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_2 = arg_215_1:FormatText(StoryNameCfg[152].name)

				arg_215_1.leftNameTxt_.text = var_218_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, true)
				arg_215_1.iconController_:SetSelectedState("hero")

				arg_215_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_3 = arg_215_1:GetWordFromCfg(222011053)
				local var_218_4 = arg_215_1:FormatText(var_218_3.content)

				arg_215_1.text_.text = var_218_4

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_5 = 71
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011053", "story_v_out_222011.awb") ~= 0 then
					local var_218_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011053", "story_v_out_222011.awb") / 1000

					if var_218_8 + var_218_0 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_0
					end

					if var_218_3.prefab_name ~= "" and arg_215_1.actors_[var_218_3.prefab_name] ~= nil then
						local var_218_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_3.prefab_name].transform, "story_v_out_222011", "222011053", "story_v_out_222011.awb")

						arg_215_1:RecordAudio("222011053", var_218_9)
						arg_215_1:RecordAudio("222011053", var_218_9)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_222011", "222011053", "story_v_out_222011.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_222011", "222011053", "story_v_out_222011.awb")
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
	Play222011054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 222011054
		arg_219_1.duration_ = 21.633

		local var_219_0 = {
			ja = 21.633,
			ko = 16.866,
			zh = 16.866
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
				arg_219_0:Play222011055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 1.95

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[152].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(222011054)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 78
				local var_222_6 = utf8.len(var_222_4)
				local var_222_7 = var_222_5 <= 0 and var_222_1 or var_222_1 * (var_222_6 / var_222_5)

				if var_222_7 > 0 and var_222_1 < var_222_7 then
					arg_219_1.talkMaxDuration = var_222_7

					if var_222_7 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_7 + var_222_0
					end
				end

				arg_219_1.text_.text = var_222_4
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011054", "story_v_out_222011.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011054", "story_v_out_222011.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_222011", "222011054", "story_v_out_222011.awb")

						arg_219_1:RecordAudio("222011054", var_222_9)
						arg_219_1:RecordAudio("222011054", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_222011", "222011054", "story_v_out_222011.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_222011", "222011054", "story_v_out_222011.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_10 = math.max(var_222_1, arg_219_1.talkMaxDuration)

			if var_222_0 <= arg_219_1.time_ and arg_219_1.time_ < var_222_0 + var_222_10 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_0) / var_222_10

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_0 + var_222_10 and arg_219_1.time_ < var_222_0 + var_222_10 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play222011055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 222011055
		arg_223_1.duration_ = 12.366

		local var_223_0 = {
			ja = 10.233,
			ko = 12.366,
			zh = 12.366
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
				arg_223_0:Play222011056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0
			local var_226_1 = 1.3

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_2 = arg_223_1:FormatText(StoryNameCfg[152].name)

				arg_223_1.leftNameTxt_.text = var_226_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, true)
				arg_223_1.iconController_:SetSelectedState("hero")

				arg_223_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_soundonly")

				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_3 = arg_223_1:GetWordFromCfg(222011055)
				local var_226_4 = arg_223_1:FormatText(var_226_3.content)

				arg_223_1.text_.text = var_226_4

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_5 = 52
				local var_226_6 = utf8.len(var_226_4)
				local var_226_7 = var_226_5 <= 0 and var_226_1 or var_226_1 * (var_226_6 / var_226_5)

				if var_226_7 > 0 and var_226_1 < var_226_7 then
					arg_223_1.talkMaxDuration = var_226_7

					if var_226_7 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_7 + var_226_0
					end
				end

				arg_223_1.text_.text = var_226_4
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011055", "story_v_out_222011.awb") ~= 0 then
					local var_226_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011055", "story_v_out_222011.awb") / 1000

					if var_226_8 + var_226_0 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_8 + var_226_0
					end

					if var_226_3.prefab_name ~= "" and arg_223_1.actors_[var_226_3.prefab_name] ~= nil then
						local var_226_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_3.prefab_name].transform, "story_v_out_222011", "222011055", "story_v_out_222011.awb")

						arg_223_1:RecordAudio("222011055", var_226_9)
						arg_223_1:RecordAudio("222011055", var_226_9)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_222011", "222011055", "story_v_out_222011.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_222011", "222011055", "story_v_out_222011.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_10 = math.max(var_226_1, arg_223_1.talkMaxDuration)

			if var_226_0 <= arg_223_1.time_ and arg_223_1.time_ < var_226_0 + var_226_10 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_0) / var_226_10

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_0 + var_226_10 and arg_223_1.time_ < var_226_0 + var_226_10 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play222011056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 222011056
		arg_227_1.duration_ = 5

		SetActive(arg_227_1.tipsGo_, false)

		function arg_227_1.onSingleLineFinish_()
			arg_227_1.onSingleLineUpdate_ = nil
			arg_227_1.onSingleLineFinish_ = nil
			arg_227_1.state_ = "waiting"
		end

		function arg_227_1.playNext_(arg_229_0)
			if arg_229_0 == 1 then
				arg_227_0:Play222011057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0
			local var_230_1 = 1.2

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

				local var_230_2 = arg_227_1:GetWordFromCfg(222011056)
				local var_230_3 = arg_227_1:FormatText(var_230_2.content)

				arg_227_1.text_.text = var_230_3

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_4 = 48
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
	Play222011057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 222011057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play222011058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = 0
			local var_234_1 = 0.475

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

				local var_234_2 = arg_231_1:GetWordFromCfg(222011057)
				local var_234_3 = arg_231_1:FormatText(var_234_2.content)

				arg_231_1.text_.text = var_234_3

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_4 = 19
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
	Play222011058 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 222011058
		arg_235_1.duration_ = 5

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play222011059(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = 0
			local var_238_1 = 0.825

			if var_238_0 < arg_235_1.time_ and arg_235_1.time_ <= var_238_0 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, false)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_2 = arg_235_1:GetWordFromCfg(222011058)
				local var_238_3 = arg_235_1:FormatText(var_238_2.content)

				arg_235_1.text_.text = var_238_3

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_4 = 33
				local var_238_5 = utf8.len(var_238_3)
				local var_238_6 = var_238_4 <= 0 and var_238_1 or var_238_1 * (var_238_5 / var_238_4)

				if var_238_6 > 0 and var_238_1 < var_238_6 then
					arg_235_1.talkMaxDuration = var_238_6

					if var_238_6 + var_238_0 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_6 + var_238_0
					end
				end

				arg_235_1.text_.text = var_238_3
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)
				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_7 = math.max(var_238_1, arg_235_1.talkMaxDuration)

			if var_238_0 <= arg_235_1.time_ and arg_235_1.time_ < var_238_0 + var_238_7 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_0) / var_238_7

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_0 + var_238_7 and arg_235_1.time_ < var_238_0 + var_238_7 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play222011059 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 222011059
		arg_239_1.duration_ = 18.966

		local var_239_0 = {
			ja = 18.966,
			ko = 13.866,
			zh = 13.866
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
				arg_239_0:Play222011060(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1074ui_story"].transform
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 then
				arg_239_1.var_.moveOldPos1074ui_story = var_242_0.localPosition
			end

			local var_242_2 = 0.001

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2
				local var_242_4 = Vector3.New(0, -1.055, -6.12)

				var_242_0.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1074ui_story, var_242_4, var_242_3)

				local var_242_5 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_5.x, var_242_5.y, var_242_5.z)

				local var_242_6 = var_242_0.localEulerAngles

				var_242_6.z = 0
				var_242_6.x = 0
				var_242_0.localEulerAngles = var_242_6
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 then
				var_242_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_242_7 = manager.ui.mainCamera.transform.position - var_242_0.position

				var_242_0.forward = Vector3.New(var_242_7.x, var_242_7.y, var_242_7.z)

				local var_242_8 = var_242_0.localEulerAngles

				var_242_8.z = 0
				var_242_8.x = 0
				var_242_0.localEulerAngles = var_242_8
			end

			local var_242_9 = arg_239_1.actors_["1074ui_story"]
			local var_242_10 = 0

			if var_242_10 < arg_239_1.time_ and arg_239_1.time_ <= var_242_10 + arg_242_0 and arg_239_1.var_.characterEffect1074ui_story == nil then
				arg_239_1.var_.characterEffect1074ui_story = var_242_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_11 = 0.200000002980232

			if var_242_10 <= arg_239_1.time_ and arg_239_1.time_ < var_242_10 + var_242_11 then
				local var_242_12 = (arg_239_1.time_ - var_242_10) / var_242_11

				if arg_239_1.var_.characterEffect1074ui_story then
					arg_239_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_10 + var_242_11 and arg_239_1.time_ < var_242_10 + var_242_11 + arg_242_0 and arg_239_1.var_.characterEffect1074ui_story then
				arg_239_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_242_13 = 0

			if var_242_13 < arg_239_1.time_ and arg_239_1.time_ <= var_242_13 + arg_242_0 then
				arg_239_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_242_14 = 0

			if var_242_14 < arg_239_1.time_ and arg_239_1.time_ <= var_242_14 + arg_242_0 then
				arg_239_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_242_15 = 0
			local var_242_16 = 1.475

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_17 = arg_239_1:FormatText(StoryNameCfg[410].name)

				arg_239_1.leftNameTxt_.text = var_242_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_18 = arg_239_1:GetWordFromCfg(222011059)
				local var_242_19 = arg_239_1:FormatText(var_242_18.content)

				arg_239_1.text_.text = var_242_19

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_20 = 59
				local var_242_21 = utf8.len(var_242_19)
				local var_242_22 = var_242_20 <= 0 and var_242_16 or var_242_16 * (var_242_21 / var_242_20)

				if var_242_22 > 0 and var_242_16 < var_242_22 then
					arg_239_1.talkMaxDuration = var_242_22

					if var_242_22 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_22 + var_242_15
					end
				end

				arg_239_1.text_.text = var_242_19
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011059", "story_v_out_222011.awb") ~= 0 then
					local var_242_23 = manager.audio:GetVoiceLength("story_v_out_222011", "222011059", "story_v_out_222011.awb") / 1000

					if var_242_23 + var_242_15 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_23 + var_242_15
					end

					if var_242_18.prefab_name ~= "" and arg_239_1.actors_[var_242_18.prefab_name] ~= nil then
						local var_242_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_18.prefab_name].transform, "story_v_out_222011", "222011059", "story_v_out_222011.awb")

						arg_239_1:RecordAudio("222011059", var_242_24)
						arg_239_1:RecordAudio("222011059", var_242_24)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_222011", "222011059", "story_v_out_222011.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_222011", "222011059", "story_v_out_222011.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_25 = math.max(var_242_16, arg_239_1.talkMaxDuration)

			if var_242_15 <= arg_239_1.time_ and arg_239_1.time_ < var_242_15 + var_242_25 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_15) / var_242_25

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_15 + var_242_25 and arg_239_1.time_ < var_242_15 + var_242_25 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play222011060 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 222011060
		arg_243_1.duration_ = 5.9

		local var_243_0 = {
			ja = 5.9,
			ko = 5.066,
			zh = 5.066
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
				arg_243_0:Play222011061(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = 0
			local var_246_1 = 0.525

			if var_246_0 < arg_243_1.time_ and arg_243_1.time_ <= var_246_0 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_2 = arg_243_1:FormatText(StoryNameCfg[410].name)

				arg_243_1.leftNameTxt_.text = var_246_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, false)
				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_3 = arg_243_1:GetWordFromCfg(222011060)
				local var_246_4 = arg_243_1:FormatText(var_246_3.content)

				arg_243_1.text_.text = var_246_4

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011060", "story_v_out_222011.awb") ~= 0 then
					local var_246_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011060", "story_v_out_222011.awb") / 1000

					if var_246_8 + var_246_0 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_8 + var_246_0
					end

					if var_246_3.prefab_name ~= "" and arg_243_1.actors_[var_246_3.prefab_name] ~= nil then
						local var_246_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_3.prefab_name].transform, "story_v_out_222011", "222011060", "story_v_out_222011.awb")

						arg_243_1:RecordAudio("222011060", var_246_9)
						arg_243_1:RecordAudio("222011060", var_246_9)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_222011", "222011060", "story_v_out_222011.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_222011", "222011060", "story_v_out_222011.awb")
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
	Play222011061 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 222011061
		arg_247_1.duration_ = 8.5

		local var_247_0 = {
			ja = 8.5,
			ko = 3.8,
			zh = 3.8
		}
		local var_247_1 = manager.audio:GetLocalizationFlag()

		if var_247_0[var_247_1] ~= nil then
			arg_247_1.duration_ = var_247_0[var_247_1]
		end

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play222011062(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = arg_247_1.actors_["1074ui_story"]
			local var_250_1 = 0

			if var_250_1 < arg_247_1.time_ and arg_247_1.time_ <= var_250_1 + arg_250_0 and arg_247_1.var_.characterEffect1074ui_story == nil then
				arg_247_1.var_.characterEffect1074ui_story = var_250_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_250_2 = 0.2

			if var_250_1 <= arg_247_1.time_ and arg_247_1.time_ < var_250_1 + var_250_2 then
				local var_250_3 = (arg_247_1.time_ - var_250_1) / var_250_2

				if arg_247_1.var_.characterEffect1074ui_story then
					local var_250_4 = Mathf.Lerp(0, 0.5, var_250_3)

					arg_247_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_247_1.var_.characterEffect1074ui_story.fillRatio = var_250_4
				end
			end

			if arg_247_1.time_ >= var_250_1 + var_250_2 and arg_247_1.time_ < var_250_1 + var_250_2 + arg_250_0 and arg_247_1.var_.characterEffect1074ui_story then
				local var_250_5 = 0.5

				arg_247_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_247_1.var_.characterEffect1074ui_story.fillRatio = var_250_5
			end

			local var_250_6 = "1071ui_story"

			if arg_247_1.actors_[var_250_6] == nil then
				local var_250_7 = Object.Instantiate(Asset.Load("Char/" .. var_250_6), arg_247_1.stage_.transform)

				var_250_7.name = var_250_6
				var_250_7.transform.localPosition = Vector3.New(0, 100, 0)
				arg_247_1.actors_[var_250_6] = var_250_7

				local var_250_8 = var_250_7:GetComponentInChildren(typeof(CharacterEffect))

				var_250_8.enabled = true

				local var_250_9 = GameObjectTools.GetOrAddComponent(var_250_7, typeof(DynamicBoneHelper))

				if var_250_9 then
					var_250_9:EnableDynamicBone(false)
				end

				arg_247_1:ShowWeapon(var_250_8.transform, false)

				arg_247_1.var_[var_250_6 .. "Animator"] = var_250_8.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_247_1.var_[var_250_6 .. "Animator"].applyRootMotion = true
				arg_247_1.var_[var_250_6 .. "LipSync"] = var_250_8.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_250_10 = 0

			if var_250_10 < arg_247_1.time_ and arg_247_1.time_ <= var_250_10 + arg_250_0 then
				arg_247_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1201cva")
			end

			local var_250_11 = 0
			local var_250_12 = 0.425

			if var_250_11 < arg_247_1.time_ and arg_247_1.time_ <= var_250_11 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_13 = arg_247_1:FormatText(StoryNameCfg[36].name)

				arg_247_1.leftNameTxt_.text = var_250_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, true)
				arg_247_1.iconController_:SetSelectedState("hero")

				arg_247_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1071")

				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_14 = arg_247_1:GetWordFromCfg(222011061)
				local var_250_15 = arg_247_1:FormatText(var_250_14.content)

				arg_247_1.text_.text = var_250_15

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_16 = 17
				local var_250_17 = utf8.len(var_250_15)
				local var_250_18 = var_250_16 <= 0 and var_250_12 or var_250_12 * (var_250_17 / var_250_16)

				if var_250_18 > 0 and var_250_12 < var_250_18 then
					arg_247_1.talkMaxDuration = var_250_18

					if var_250_18 + var_250_11 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_18 + var_250_11
					end
				end

				arg_247_1.text_.text = var_250_15
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011061", "story_v_out_222011.awb") ~= 0 then
					local var_250_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011061", "story_v_out_222011.awb") / 1000

					if var_250_19 + var_250_11 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_19 + var_250_11
					end

					if var_250_14.prefab_name ~= "" and arg_247_1.actors_[var_250_14.prefab_name] ~= nil then
						local var_250_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_14.prefab_name].transform, "story_v_out_222011", "222011061", "story_v_out_222011.awb")

						arg_247_1:RecordAudio("222011061", var_250_20)
						arg_247_1:RecordAudio("222011061", var_250_20)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_222011", "222011061", "story_v_out_222011.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_222011", "222011061", "story_v_out_222011.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_21 = math.max(var_250_12, arg_247_1.talkMaxDuration)

			if var_250_11 <= arg_247_1.time_ and arg_247_1.time_ < var_250_11 + var_250_21 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_11) / var_250_21

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_11 + var_250_21 and arg_247_1.time_ < var_250_11 + var_250_21 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play222011062 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 222011062
		arg_251_1.duration_ = 3.7

		local var_251_0 = {
			ja = 3.7,
			ko = 2.733,
			zh = 2.733
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
				arg_251_0:Play222011063(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = arg_251_1.actors_["1074ui_story"].transform
			local var_254_1 = 0

			if var_254_1 < arg_251_1.time_ and arg_251_1.time_ <= var_254_1 + arg_254_0 then
				arg_251_1.var_.moveOldPos1074ui_story = var_254_0.localPosition
			end

			local var_254_2 = 0.001

			if var_254_1 <= arg_251_1.time_ and arg_251_1.time_ < var_254_1 + var_254_2 then
				local var_254_3 = (arg_251_1.time_ - var_254_1) / var_254_2
				local var_254_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_254_0.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1074ui_story, var_254_4, var_254_3)

				local var_254_5 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_5.x, var_254_5.y, var_254_5.z)

				local var_254_6 = var_254_0.localEulerAngles

				var_254_6.z = 0
				var_254_6.x = 0
				var_254_0.localEulerAngles = var_254_6
			end

			if arg_251_1.time_ >= var_254_1 + var_254_2 and arg_251_1.time_ < var_254_1 + var_254_2 + arg_254_0 then
				var_254_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_254_7 = manager.ui.mainCamera.transform.position - var_254_0.position

				var_254_0.forward = Vector3.New(var_254_7.x, var_254_7.y, var_254_7.z)

				local var_254_8 = var_254_0.localEulerAngles

				var_254_8.z = 0
				var_254_8.x = 0
				var_254_0.localEulerAngles = var_254_8
			end

			local var_254_9 = arg_251_1.actors_["1074ui_story"]
			local var_254_10 = 0

			if var_254_10 < arg_251_1.time_ and arg_251_1.time_ <= var_254_10 + arg_254_0 and arg_251_1.var_.characterEffect1074ui_story == nil then
				arg_251_1.var_.characterEffect1074ui_story = var_254_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_11 = 0.200000002980232

			if var_254_10 <= arg_251_1.time_ and arg_251_1.time_ < var_254_10 + var_254_11 then
				local var_254_12 = (arg_251_1.time_ - var_254_10) / var_254_11

				if arg_251_1.var_.characterEffect1074ui_story then
					arg_251_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_251_1.time_ >= var_254_10 + var_254_11 and arg_251_1.time_ < var_254_10 + var_254_11 + arg_254_0 and arg_251_1.var_.characterEffect1074ui_story then
				arg_251_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_254_13 = 0

			if var_254_13 < arg_251_1.time_ and arg_251_1.time_ <= var_254_13 + arg_254_0 then
				arg_251_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_254_14 = 0

			if var_254_14 < arg_251_1.time_ and arg_251_1.time_ <= var_254_14 + arg_254_0 then
				arg_251_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_254_15 = arg_251_1.actors_["1071ui_story"].transform
			local var_254_16 = 0

			if var_254_16 < arg_251_1.time_ and arg_251_1.time_ <= var_254_16 + arg_254_0 then
				arg_251_1.var_.moveOldPos1071ui_story = var_254_15.localPosition
			end

			local var_254_17 = 0.001

			if var_254_16 <= arg_251_1.time_ and arg_251_1.time_ < var_254_16 + var_254_17 then
				local var_254_18 = (arg_251_1.time_ - var_254_16) / var_254_17
				local var_254_19 = Vector3.New(0.7, -1.05, -6.2)

				var_254_15.localPosition = Vector3.Lerp(arg_251_1.var_.moveOldPos1071ui_story, var_254_19, var_254_18)

				local var_254_20 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_20.x, var_254_20.y, var_254_20.z)

				local var_254_21 = var_254_15.localEulerAngles

				var_254_21.z = 0
				var_254_21.x = 0
				var_254_15.localEulerAngles = var_254_21
			end

			if arg_251_1.time_ >= var_254_16 + var_254_17 and arg_251_1.time_ < var_254_16 + var_254_17 + arg_254_0 then
				var_254_15.localPosition = Vector3.New(0.7, -1.05, -6.2)

				local var_254_22 = manager.ui.mainCamera.transform.position - var_254_15.position

				var_254_15.forward = Vector3.New(var_254_22.x, var_254_22.y, var_254_22.z)

				local var_254_23 = var_254_15.localEulerAngles

				var_254_23.z = 0
				var_254_23.x = 0
				var_254_15.localEulerAngles = var_254_23
			end

			local var_254_24 = arg_251_1.actors_["1071ui_story"]
			local var_254_25 = 0

			if var_254_25 < arg_251_1.time_ and arg_251_1.time_ <= var_254_25 + arg_254_0 and arg_251_1.var_.characterEffect1071ui_story == nil then
				arg_251_1.var_.characterEffect1071ui_story = var_254_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_254_26 = 0.200000002980232

			if var_254_25 <= arg_251_1.time_ and arg_251_1.time_ < var_254_25 + var_254_26 then
				local var_254_27 = (arg_251_1.time_ - var_254_25) / var_254_26

				if arg_251_1.var_.characterEffect1071ui_story then
					local var_254_28 = Mathf.Lerp(0, 0.5, var_254_27)

					arg_251_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_251_1.var_.characterEffect1071ui_story.fillRatio = var_254_28
				end
			end

			if arg_251_1.time_ >= var_254_25 + var_254_26 and arg_251_1.time_ < var_254_25 + var_254_26 + arg_254_0 and arg_251_1.var_.characterEffect1071ui_story then
				local var_254_29 = 0.5

				arg_251_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_251_1.var_.characterEffect1071ui_story.fillRatio = var_254_29
			end

			local var_254_30 = 0

			if var_254_30 < arg_251_1.time_ and arg_251_1.time_ <= var_254_30 + arg_254_0 then
				arg_251_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_254_31 = 0
			local var_254_32 = 0.35

			if var_254_31 < arg_251_1.time_ and arg_251_1.time_ <= var_254_31 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_33 = arg_251_1:FormatText(StoryNameCfg[410].name)

				arg_251_1.leftNameTxt_.text = var_254_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, false)
				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_34 = arg_251_1:GetWordFromCfg(222011062)
				local var_254_35 = arg_251_1:FormatText(var_254_34.content)

				arg_251_1.text_.text = var_254_35

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_36 = 14
				local var_254_37 = utf8.len(var_254_35)
				local var_254_38 = var_254_36 <= 0 and var_254_32 or var_254_32 * (var_254_37 / var_254_36)

				if var_254_38 > 0 and var_254_32 < var_254_38 then
					arg_251_1.talkMaxDuration = var_254_38

					if var_254_38 + var_254_31 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_38 + var_254_31
					end
				end

				arg_251_1.text_.text = var_254_35
				arg_251_1.typewritter.percent = 0

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011062", "story_v_out_222011.awb") ~= 0 then
					local var_254_39 = manager.audio:GetVoiceLength("story_v_out_222011", "222011062", "story_v_out_222011.awb") / 1000

					if var_254_39 + var_254_31 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_39 + var_254_31
					end

					if var_254_34.prefab_name ~= "" and arg_251_1.actors_[var_254_34.prefab_name] ~= nil then
						local var_254_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_34.prefab_name].transform, "story_v_out_222011", "222011062", "story_v_out_222011.awb")

						arg_251_1:RecordAudio("222011062", var_254_40)
						arg_251_1:RecordAudio("222011062", var_254_40)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_out_222011", "222011062", "story_v_out_222011.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_out_222011", "222011062", "story_v_out_222011.awb")
				end

				arg_251_1:RecordContent(arg_251_1.text_.text)
			end

			local var_254_41 = math.max(var_254_32, arg_251_1.talkMaxDuration)

			if var_254_31 <= arg_251_1.time_ and arg_251_1.time_ < var_254_31 + var_254_41 then
				arg_251_1.typewritter.percent = (arg_251_1.time_ - var_254_31) / var_254_41

				arg_251_1.typewritter:SetDirty()
			end

			if arg_251_1.time_ >= var_254_31 + var_254_41 and arg_251_1.time_ < var_254_31 + var_254_41 + arg_254_0 then
				arg_251_1.typewritter.percent = 1

				arg_251_1.typewritter:SetDirty()
				arg_251_1:ShowNextGo(true)
			end
		end
	end,
	Play222011063 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 222011063
		arg_255_1.duration_ = 10.8

		local var_255_0 = {
			ja = 10.8,
			ko = 7.366,
			zh = 7.366
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
				arg_255_0:Play222011064(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = arg_255_1.actors_["1071ui_story"]
			local var_258_1 = 0

			if var_258_1 < arg_255_1.time_ and arg_255_1.time_ <= var_258_1 + arg_258_0 and arg_255_1.var_.characterEffect1071ui_story == nil then
				arg_255_1.var_.characterEffect1071ui_story = var_258_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_2 = 0.200000002980232

			if var_258_1 <= arg_255_1.time_ and arg_255_1.time_ < var_258_1 + var_258_2 then
				local var_258_3 = (arg_255_1.time_ - var_258_1) / var_258_2

				if arg_255_1.var_.characterEffect1071ui_story then
					arg_255_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_255_1.time_ >= var_258_1 + var_258_2 and arg_255_1.time_ < var_258_1 + var_258_2 + arg_258_0 and arg_255_1.var_.characterEffect1071ui_story then
				arg_255_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_258_4 = 0

			if var_258_4 < arg_255_1.time_ and arg_255_1.time_ <= var_258_4 + arg_258_0 then
				arg_255_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action1_1")
			end

			local var_258_5 = arg_255_1.actors_["1074ui_story"]
			local var_258_6 = 0

			if var_258_6 < arg_255_1.time_ and arg_255_1.time_ <= var_258_6 + arg_258_0 and arg_255_1.var_.characterEffect1074ui_story == nil then
				arg_255_1.var_.characterEffect1074ui_story = var_258_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_258_7 = 0.200000002980232

			if var_258_6 <= arg_255_1.time_ and arg_255_1.time_ < var_258_6 + var_258_7 then
				local var_258_8 = (arg_255_1.time_ - var_258_6) / var_258_7

				if arg_255_1.var_.characterEffect1074ui_story then
					local var_258_9 = Mathf.Lerp(0, 0.5, var_258_8)

					arg_255_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_255_1.var_.characterEffect1074ui_story.fillRatio = var_258_9
				end
			end

			if arg_255_1.time_ >= var_258_6 + var_258_7 and arg_255_1.time_ < var_258_6 + var_258_7 + arg_258_0 and arg_255_1.var_.characterEffect1074ui_story then
				local var_258_10 = 0.5

				arg_255_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_255_1.var_.characterEffect1074ui_story.fillRatio = var_258_10
			end

			local var_258_11 = 0
			local var_258_12 = 0.725

			if var_258_11 < arg_255_1.time_ and arg_255_1.time_ <= var_258_11 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_13 = arg_255_1:FormatText(StoryNameCfg[384].name)

				arg_255_1.leftNameTxt_.text = var_258_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_14 = arg_255_1:GetWordFromCfg(222011063)
				local var_258_15 = arg_255_1:FormatText(var_258_14.content)

				arg_255_1.text_.text = var_258_15

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_16 = 29
				local var_258_17 = utf8.len(var_258_15)
				local var_258_18 = var_258_16 <= 0 and var_258_12 or var_258_12 * (var_258_17 / var_258_16)

				if var_258_18 > 0 and var_258_12 < var_258_18 then
					arg_255_1.talkMaxDuration = var_258_18

					if var_258_18 + var_258_11 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_18 + var_258_11
					end
				end

				arg_255_1.text_.text = var_258_15
				arg_255_1.typewritter.percent = 0

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011063", "story_v_out_222011.awb") ~= 0 then
					local var_258_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011063", "story_v_out_222011.awb") / 1000

					if var_258_19 + var_258_11 > arg_255_1.duration_ then
						arg_255_1.duration_ = var_258_19 + var_258_11
					end

					if var_258_14.prefab_name ~= "" and arg_255_1.actors_[var_258_14.prefab_name] ~= nil then
						local var_258_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_255_1.actors_[var_258_14.prefab_name].transform, "story_v_out_222011", "222011063", "story_v_out_222011.awb")

						arg_255_1:RecordAudio("222011063", var_258_20)
						arg_255_1:RecordAudio("222011063", var_258_20)
					else
						arg_255_1:AudioAction("play", "voice", "story_v_out_222011", "222011063", "story_v_out_222011.awb")
					end

					arg_255_1:RecordHistoryTalkVoice("story_v_out_222011", "222011063", "story_v_out_222011.awb")
				end

				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_21 = math.max(var_258_12, arg_255_1.talkMaxDuration)

			if var_258_11 <= arg_255_1.time_ and arg_255_1.time_ < var_258_11 + var_258_21 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_11) / var_258_21

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_11 + var_258_21 and arg_255_1.time_ < var_258_11 + var_258_21 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play222011064 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 222011064
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play222011065(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = arg_259_1.actors_["1071ui_story"]
			local var_262_1 = 0

			if var_262_1 < arg_259_1.time_ and arg_259_1.time_ <= var_262_1 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story == nil then
				arg_259_1.var_.characterEffect1071ui_story = var_262_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_262_2 = 0.200000002980232

			if var_262_1 <= arg_259_1.time_ and arg_259_1.time_ < var_262_1 + var_262_2 then
				local var_262_3 = (arg_259_1.time_ - var_262_1) / var_262_2

				if arg_259_1.var_.characterEffect1071ui_story then
					local var_262_4 = Mathf.Lerp(0, 0.5, var_262_3)

					arg_259_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_259_1.var_.characterEffect1071ui_story.fillRatio = var_262_4
				end
			end

			if arg_259_1.time_ >= var_262_1 + var_262_2 and arg_259_1.time_ < var_262_1 + var_262_2 + arg_262_0 and arg_259_1.var_.characterEffect1071ui_story then
				local var_262_5 = 0.5

				arg_259_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_259_1.var_.characterEffect1071ui_story.fillRatio = var_262_5
			end

			local var_262_6 = 0
			local var_262_7 = 0.725

			if var_262_6 < arg_259_1.time_ and arg_259_1.time_ <= var_262_6 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_8 = arg_259_1:GetWordFromCfg(222011064)
				local var_262_9 = arg_259_1:FormatText(var_262_8.content)

				arg_259_1.text_.text = var_262_9

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_10 = 29
				local var_262_11 = utf8.len(var_262_9)
				local var_262_12 = var_262_10 <= 0 and var_262_7 or var_262_7 * (var_262_11 / var_262_10)

				if var_262_12 > 0 and var_262_7 < var_262_12 then
					arg_259_1.talkMaxDuration = var_262_12

					if var_262_12 + var_262_6 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_12 + var_262_6
					end
				end

				arg_259_1.text_.text = var_262_9
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_13 = math.max(var_262_7, arg_259_1.talkMaxDuration)

			if var_262_6 <= arg_259_1.time_ and arg_259_1.time_ < var_262_6 + var_262_13 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_6) / var_262_13

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_6 + var_262_13 and arg_259_1.time_ < var_262_6 + var_262_13 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play222011065 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 222011065
		arg_263_1.duration_ = 18.4

		local var_263_0 = {
			ja = 18.4,
			ko = 13.8,
			zh = 13.8
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
				arg_263_0:Play222011066(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1071ui_story"]
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 and arg_263_1.var_.characterEffect1071ui_story == nil then
				arg_263_1.var_.characterEffect1071ui_story = var_266_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_2 = 0.200000002980232

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2

				if arg_263_1.var_.characterEffect1071ui_story then
					arg_263_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 and arg_263_1.var_.characterEffect1071ui_story then
				arg_263_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_266_4 = 0
			local var_266_5 = 1.1

			if var_266_4 < arg_263_1.time_ and arg_263_1.time_ <= var_266_4 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_6 = arg_263_1:FormatText(StoryNameCfg[384].name)

				arg_263_1.leftNameTxt_.text = var_266_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_7 = arg_263_1:GetWordFromCfg(222011065)
				local var_266_8 = arg_263_1:FormatText(var_266_7.content)

				arg_263_1.text_.text = var_266_8

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_9 = 44
				local var_266_10 = utf8.len(var_266_8)
				local var_266_11 = var_266_9 <= 0 and var_266_5 or var_266_5 * (var_266_10 / var_266_9)

				if var_266_11 > 0 and var_266_5 < var_266_11 then
					arg_263_1.talkMaxDuration = var_266_11

					if var_266_11 + var_266_4 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_11 + var_266_4
					end
				end

				arg_263_1.text_.text = var_266_8
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011065", "story_v_out_222011.awb") ~= 0 then
					local var_266_12 = manager.audio:GetVoiceLength("story_v_out_222011", "222011065", "story_v_out_222011.awb") / 1000

					if var_266_12 + var_266_4 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_12 + var_266_4
					end

					if var_266_7.prefab_name ~= "" and arg_263_1.actors_[var_266_7.prefab_name] ~= nil then
						local var_266_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_7.prefab_name].transform, "story_v_out_222011", "222011065", "story_v_out_222011.awb")

						arg_263_1:RecordAudio("222011065", var_266_13)
						arg_263_1:RecordAudio("222011065", var_266_13)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_222011", "222011065", "story_v_out_222011.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_222011", "222011065", "story_v_out_222011.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_14 = math.max(var_266_5, arg_263_1.talkMaxDuration)

			if var_266_4 <= arg_263_1.time_ and arg_263_1.time_ < var_266_4 + var_266_14 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_4) / var_266_14

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_4 + var_266_14 and arg_263_1.time_ < var_266_4 + var_266_14 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play222011066 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 222011066
		arg_267_1.duration_ = 15.366

		local var_267_0 = {
			ja = 14.6,
			ko = 15.366,
			zh = 15.366
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
				arg_267_0:Play222011067(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = 0

			if var_270_0 < arg_267_1.time_ and arg_267_1.time_ <= var_270_0 + arg_270_0 then
				arg_267_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action2_1")
			end

			local var_270_1 = 0
			local var_270_2 = 1.35

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 then
				arg_267_1.talkMaxDuration = 0
				arg_267_1.dialogCg_.alpha = 1

				arg_267_1.dialog_:SetActive(true)
				SetActive(arg_267_1.leftNameGo_, true)

				local var_270_3 = arg_267_1:FormatText(StoryNameCfg[384].name)

				arg_267_1.leftNameTxt_.text = var_270_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_267_1.leftNameTxt_.transform)

				arg_267_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_267_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_267_1:RecordName(arg_267_1.leftNameTxt_.text)
				SetActive(arg_267_1.iconTrs_.gameObject, false)
				arg_267_1.callingController_:SetSelectedState("normal")

				local var_270_4 = arg_267_1:GetWordFromCfg(222011066)
				local var_270_5 = arg_267_1:FormatText(var_270_4.content)

				arg_267_1.text_.text = var_270_5

				LuaForUtil.ClearLinePrefixSymbol(arg_267_1.text_)

				local var_270_6 = 54
				local var_270_7 = utf8.len(var_270_5)
				local var_270_8 = var_270_6 <= 0 and var_270_2 or var_270_2 * (var_270_7 / var_270_6)

				if var_270_8 > 0 and var_270_2 < var_270_8 then
					arg_267_1.talkMaxDuration = var_270_8

					if var_270_8 + var_270_1 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_8 + var_270_1
					end
				end

				arg_267_1.text_.text = var_270_5
				arg_267_1.typewritter.percent = 0

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011066", "story_v_out_222011.awb") ~= 0 then
					local var_270_9 = manager.audio:GetVoiceLength("story_v_out_222011", "222011066", "story_v_out_222011.awb") / 1000

					if var_270_9 + var_270_1 > arg_267_1.duration_ then
						arg_267_1.duration_ = var_270_9 + var_270_1
					end

					if var_270_4.prefab_name ~= "" and arg_267_1.actors_[var_270_4.prefab_name] ~= nil then
						local var_270_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_267_1.actors_[var_270_4.prefab_name].transform, "story_v_out_222011", "222011066", "story_v_out_222011.awb")

						arg_267_1:RecordAudio("222011066", var_270_10)
						arg_267_1:RecordAudio("222011066", var_270_10)
					else
						arg_267_1:AudioAction("play", "voice", "story_v_out_222011", "222011066", "story_v_out_222011.awb")
					end

					arg_267_1:RecordHistoryTalkVoice("story_v_out_222011", "222011066", "story_v_out_222011.awb")
				end

				arg_267_1:RecordContent(arg_267_1.text_.text)
			end

			local var_270_11 = math.max(var_270_2, arg_267_1.talkMaxDuration)

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_11 then
				arg_267_1.typewritter.percent = (arg_267_1.time_ - var_270_1) / var_270_11

				arg_267_1.typewritter:SetDirty()
			end

			if arg_267_1.time_ >= var_270_1 + var_270_11 and arg_267_1.time_ < var_270_1 + var_270_11 + arg_270_0 then
				arg_267_1.typewritter.percent = 1

				arg_267_1.typewritter:SetDirty()
				arg_267_1:ShowNextGo(true)
			end
		end
	end,
	Play222011067 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 222011067
		arg_271_1.duration_ = 12.9

		local var_271_0 = {
			ja = 12.9,
			ko = 7.233,
			zh = 7.233
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
				arg_271_0:Play222011068(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1074ui_story"]
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 and arg_271_1.var_.characterEffect1074ui_story == nil then
				arg_271_1.var_.characterEffect1074ui_story = var_274_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_2 = 0.200000002980232

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2

				if arg_271_1.var_.characterEffect1074ui_story then
					arg_271_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 and arg_271_1.var_.characterEffect1074ui_story then
				arg_271_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_274_4 = 0

			if var_274_4 < arg_271_1.time_ and arg_271_1.time_ <= var_274_4 + arg_274_0 then
				arg_271_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_274_5 = arg_271_1.actors_["1071ui_story"]
			local var_274_6 = 0

			if var_274_6 < arg_271_1.time_ and arg_271_1.time_ <= var_274_6 + arg_274_0 and arg_271_1.var_.characterEffect1071ui_story == nil then
				arg_271_1.var_.characterEffect1071ui_story = var_274_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_7 = 0.200000002980232

			if var_274_6 <= arg_271_1.time_ and arg_271_1.time_ < var_274_6 + var_274_7 then
				local var_274_8 = (arg_271_1.time_ - var_274_6) / var_274_7

				if arg_271_1.var_.characterEffect1071ui_story then
					local var_274_9 = Mathf.Lerp(0, 0.5, var_274_8)

					arg_271_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1071ui_story.fillRatio = var_274_9
				end
			end

			if arg_271_1.time_ >= var_274_6 + var_274_7 and arg_271_1.time_ < var_274_6 + var_274_7 + arg_274_0 and arg_271_1.var_.characterEffect1071ui_story then
				local var_274_10 = 0.5

				arg_271_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1071ui_story.fillRatio = var_274_10
			end

			local var_274_11 = 0
			local var_274_12 = 0.85

			if var_274_11 < arg_271_1.time_ and arg_271_1.time_ <= var_274_11 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, true)

				local var_274_13 = arg_271_1:FormatText(StoryNameCfg[410].name)

				arg_271_1.leftNameTxt_.text = var_274_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_271_1.leftNameTxt_.transform)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1.leftNameTxt_.text)
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_14 = arg_271_1:GetWordFromCfg(222011067)
				local var_274_15 = arg_271_1:FormatText(var_274_14.content)

				arg_271_1.text_.text = var_274_15

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_16 = 33
				local var_274_17 = utf8.len(var_274_15)
				local var_274_18 = var_274_16 <= 0 and var_274_12 or var_274_12 * (var_274_17 / var_274_16)

				if var_274_18 > 0 and var_274_12 < var_274_18 then
					arg_271_1.talkMaxDuration = var_274_18

					if var_274_18 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_18 + var_274_11
					end
				end

				arg_271_1.text_.text = var_274_15
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011067", "story_v_out_222011.awb") ~= 0 then
					local var_274_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011067", "story_v_out_222011.awb") / 1000

					if var_274_19 + var_274_11 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_19 + var_274_11
					end

					if var_274_14.prefab_name ~= "" and arg_271_1.actors_[var_274_14.prefab_name] ~= nil then
						local var_274_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_271_1.actors_[var_274_14.prefab_name].transform, "story_v_out_222011", "222011067", "story_v_out_222011.awb")

						arg_271_1:RecordAudio("222011067", var_274_20)
						arg_271_1:RecordAudio("222011067", var_274_20)
					else
						arg_271_1:AudioAction("play", "voice", "story_v_out_222011", "222011067", "story_v_out_222011.awb")
					end

					arg_271_1:RecordHistoryTalkVoice("story_v_out_222011", "222011067", "story_v_out_222011.awb")
				end

				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_21 = math.max(var_274_12, arg_271_1.talkMaxDuration)

			if var_274_11 <= arg_271_1.time_ and arg_271_1.time_ < var_274_11 + var_274_21 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_11) / var_274_21

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_11 + var_274_21 and arg_271_1.time_ < var_274_11 + var_274_21 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play222011068 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 222011068
		arg_275_1.duration_ = 8.833

		local var_275_0 = {
			ja = 8.833,
			ko = 4.833,
			zh = 4.833
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
				arg_275_0:Play222011069(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = arg_275_1.actors_["1071ui_story"]
			local var_278_1 = 0

			if var_278_1 < arg_275_1.time_ and arg_275_1.time_ <= var_278_1 + arg_278_0 and arg_275_1.var_.characterEffect1071ui_story == nil then
				arg_275_1.var_.characterEffect1071ui_story = var_278_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_2 = 0.200000002980232

			if var_278_1 <= arg_275_1.time_ and arg_275_1.time_ < var_278_1 + var_278_2 then
				local var_278_3 = (arg_275_1.time_ - var_278_1) / var_278_2

				if arg_275_1.var_.characterEffect1071ui_story then
					arg_275_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_275_1.time_ >= var_278_1 + var_278_2 and arg_275_1.time_ < var_278_1 + var_278_2 + arg_278_0 and arg_275_1.var_.characterEffect1071ui_story then
				arg_275_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_278_4 = 0

			if var_278_4 < arg_275_1.time_ and arg_275_1.time_ <= var_278_4 + arg_278_0 then
				arg_275_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071actionlink/1071action423")
			end

			local var_278_5 = arg_275_1.actors_["1074ui_story"]
			local var_278_6 = 0

			if var_278_6 < arg_275_1.time_ and arg_275_1.time_ <= var_278_6 + arg_278_0 and arg_275_1.var_.characterEffect1074ui_story == nil then
				arg_275_1.var_.characterEffect1074ui_story = var_278_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_278_7 = 0.200000002980232

			if var_278_6 <= arg_275_1.time_ and arg_275_1.time_ < var_278_6 + var_278_7 then
				local var_278_8 = (arg_275_1.time_ - var_278_6) / var_278_7

				if arg_275_1.var_.characterEffect1074ui_story then
					local var_278_9 = Mathf.Lerp(0, 0.5, var_278_8)

					arg_275_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_275_1.var_.characterEffect1074ui_story.fillRatio = var_278_9
				end
			end

			if arg_275_1.time_ >= var_278_6 + var_278_7 and arg_275_1.time_ < var_278_6 + var_278_7 + arg_278_0 and arg_275_1.var_.characterEffect1074ui_story then
				local var_278_10 = 0.5

				arg_275_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_275_1.var_.characterEffect1074ui_story.fillRatio = var_278_10
			end

			local var_278_11 = 0
			local var_278_12 = 0.625

			if var_278_11 < arg_275_1.time_ and arg_275_1.time_ <= var_278_11 + arg_278_0 then
				arg_275_1.talkMaxDuration = 0
				arg_275_1.dialogCg_.alpha = 1

				arg_275_1.dialog_:SetActive(true)
				SetActive(arg_275_1.leftNameGo_, true)

				local var_278_13 = arg_275_1:FormatText(StoryNameCfg[384].name)

				arg_275_1.leftNameTxt_.text = var_278_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_275_1.leftNameTxt_.transform)

				arg_275_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_275_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_275_1:RecordName(arg_275_1.leftNameTxt_.text)
				SetActive(arg_275_1.iconTrs_.gameObject, false)
				arg_275_1.callingController_:SetSelectedState("normal")

				local var_278_14 = arg_275_1:GetWordFromCfg(222011068)
				local var_278_15 = arg_275_1:FormatText(var_278_14.content)

				arg_275_1.text_.text = var_278_15

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_16 = 25
				local var_278_17 = utf8.len(var_278_15)
				local var_278_18 = var_278_16 <= 0 and var_278_12 or var_278_12 * (var_278_17 / var_278_16)

				if var_278_18 > 0 and var_278_12 < var_278_18 then
					arg_275_1.talkMaxDuration = var_278_18

					if var_278_18 + var_278_11 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_18 + var_278_11
					end
				end

				arg_275_1.text_.text = var_278_15
				arg_275_1.typewritter.percent = 0

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011068", "story_v_out_222011.awb") ~= 0 then
					local var_278_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011068", "story_v_out_222011.awb") / 1000

					if var_278_19 + var_278_11 > arg_275_1.duration_ then
						arg_275_1.duration_ = var_278_19 + var_278_11
					end

					if var_278_14.prefab_name ~= "" and arg_275_1.actors_[var_278_14.prefab_name] ~= nil then
						local var_278_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_275_1.actors_[var_278_14.prefab_name].transform, "story_v_out_222011", "222011068", "story_v_out_222011.awb")

						arg_275_1:RecordAudio("222011068", var_278_20)
						arg_275_1:RecordAudio("222011068", var_278_20)
					else
						arg_275_1:AudioAction("play", "voice", "story_v_out_222011", "222011068", "story_v_out_222011.awb")
					end

					arg_275_1:RecordHistoryTalkVoice("story_v_out_222011", "222011068", "story_v_out_222011.awb")
				end

				arg_275_1:RecordContent(arg_275_1.text_.text)
			end

			local var_278_21 = math.max(var_278_12, arg_275_1.talkMaxDuration)

			if var_278_11 <= arg_275_1.time_ and arg_275_1.time_ < var_278_11 + var_278_21 then
				arg_275_1.typewritter.percent = (arg_275_1.time_ - var_278_11) / var_278_21

				arg_275_1.typewritter:SetDirty()
			end

			if arg_275_1.time_ >= var_278_11 + var_278_21 and arg_275_1.time_ < var_278_11 + var_278_21 + arg_278_0 then
				arg_275_1.typewritter.percent = 1

				arg_275_1.typewritter:SetDirty()
				arg_275_1:ShowNextGo(true)
			end
		end
	end,
	Play222011069 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 222011069
		arg_279_1.duration_ = 13.7

		local var_279_0 = {
			ja = 13.7,
			ko = 5.766,
			zh = 5.766
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
				arg_279_0:Play222011070(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = arg_279_1.actors_["1074ui_story"]
			local var_282_1 = 0

			if var_282_1 < arg_279_1.time_ and arg_279_1.time_ <= var_282_1 + arg_282_0 and arg_279_1.var_.characterEffect1074ui_story == nil then
				arg_279_1.var_.characterEffect1074ui_story = var_282_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_2 = 0.200000002980232

			if var_282_1 <= arg_279_1.time_ and arg_279_1.time_ < var_282_1 + var_282_2 then
				local var_282_3 = (arg_279_1.time_ - var_282_1) / var_282_2

				if arg_279_1.var_.characterEffect1074ui_story then
					arg_279_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_279_1.time_ >= var_282_1 + var_282_2 and arg_279_1.time_ < var_282_1 + var_282_2 + arg_282_0 and arg_279_1.var_.characterEffect1074ui_story then
				arg_279_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_282_4 = 0

			if var_282_4 < arg_279_1.time_ and arg_279_1.time_ <= var_282_4 + arg_282_0 then
				arg_279_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_282_5 = 0

			if var_282_5 < arg_279_1.time_ and arg_279_1.time_ <= var_282_5 + arg_282_0 then
				arg_279_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_282_6 = arg_279_1.actors_["1071ui_story"]
			local var_282_7 = 0

			if var_282_7 < arg_279_1.time_ and arg_279_1.time_ <= var_282_7 + arg_282_0 and arg_279_1.var_.characterEffect1071ui_story == nil then
				arg_279_1.var_.characterEffect1071ui_story = var_282_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_282_8 = 0.200000002980232

			if var_282_7 <= arg_279_1.time_ and arg_279_1.time_ < var_282_7 + var_282_8 then
				local var_282_9 = (arg_279_1.time_ - var_282_7) / var_282_8

				if arg_279_1.var_.characterEffect1071ui_story then
					local var_282_10 = Mathf.Lerp(0, 0.5, var_282_9)

					arg_279_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_279_1.var_.characterEffect1071ui_story.fillRatio = var_282_10
				end
			end

			if arg_279_1.time_ >= var_282_7 + var_282_8 and arg_279_1.time_ < var_282_7 + var_282_8 + arg_282_0 and arg_279_1.var_.characterEffect1071ui_story then
				local var_282_11 = 0.5

				arg_279_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_279_1.var_.characterEffect1071ui_story.fillRatio = var_282_11
			end

			local var_282_12 = 0
			local var_282_13 = 0.425

			if var_282_12 < arg_279_1.time_ and arg_279_1.time_ <= var_282_12 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, true)

				local var_282_14 = arg_279_1:FormatText(StoryNameCfg[410].name)

				arg_279_1.leftNameTxt_.text = var_282_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_279_1.leftNameTxt_.transform)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1.leftNameTxt_.text)
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_15 = arg_279_1:GetWordFromCfg(222011069)
				local var_282_16 = arg_279_1:FormatText(var_282_15.content)

				arg_279_1.text_.text = var_282_16

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_17 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011069", "story_v_out_222011.awb") ~= 0 then
					local var_282_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011069", "story_v_out_222011.awb") / 1000

					if var_282_20 + var_282_12 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_20 + var_282_12
					end

					if var_282_15.prefab_name ~= "" and arg_279_1.actors_[var_282_15.prefab_name] ~= nil then
						local var_282_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_279_1.actors_[var_282_15.prefab_name].transform, "story_v_out_222011", "222011069", "story_v_out_222011.awb")

						arg_279_1:RecordAudio("222011069", var_282_21)
						arg_279_1:RecordAudio("222011069", var_282_21)
					else
						arg_279_1:AudioAction("play", "voice", "story_v_out_222011", "222011069", "story_v_out_222011.awb")
					end

					arg_279_1:RecordHistoryTalkVoice("story_v_out_222011", "222011069", "story_v_out_222011.awb")
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
	Play222011070 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 222011070
		arg_283_1.duration_ = 8.266

		local var_283_0 = {
			ja = 8.266,
			ko = 7.1,
			zh = 7.1
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
				arg_283_0:Play222011071(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1071ui_story"]
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story == nil then
				arg_283_1.var_.characterEffect1071ui_story = var_286_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_2 = 0.200000002980232

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2

				if arg_283_1.var_.characterEffect1071ui_story then
					arg_283_1.var_.characterEffect1071ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 and arg_283_1.var_.characterEffect1071ui_story then
				arg_283_1.var_.characterEffect1071ui_story.fillFlat = false
			end

			local var_286_4 = 0

			if var_286_4 < arg_283_1.time_ and arg_283_1.time_ <= var_286_4 + arg_286_0 then
				arg_283_1:PlayTimeline("1071ui_story", "StoryTimeline/CharAction/story1071/story1071action/1071action3_2")
			end

			local var_286_5 = arg_283_1.actors_["1074ui_story"]
			local var_286_6 = 0

			if var_286_6 < arg_283_1.time_ and arg_283_1.time_ <= var_286_6 + arg_286_0 and arg_283_1.var_.characterEffect1074ui_story == nil then
				arg_283_1.var_.characterEffect1074ui_story = var_286_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_7 = 0.200000002980232

			if var_286_6 <= arg_283_1.time_ and arg_283_1.time_ < var_286_6 + var_286_7 then
				local var_286_8 = (arg_283_1.time_ - var_286_6) / var_286_7

				if arg_283_1.var_.characterEffect1074ui_story then
					local var_286_9 = Mathf.Lerp(0, 0.5, var_286_8)

					arg_283_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_283_1.var_.characterEffect1074ui_story.fillRatio = var_286_9
				end
			end

			if arg_283_1.time_ >= var_286_6 + var_286_7 and arg_283_1.time_ < var_286_6 + var_286_7 + arg_286_0 and arg_283_1.var_.characterEffect1074ui_story then
				local var_286_10 = 0.5

				arg_283_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_283_1.var_.characterEffect1074ui_story.fillRatio = var_286_10
			end

			local var_286_11 = 0
			local var_286_12 = 0.85

			if var_286_11 < arg_283_1.time_ and arg_283_1.time_ <= var_286_11 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_13 = arg_283_1:FormatText(StoryNameCfg[384].name)

				arg_283_1.leftNameTxt_.text = var_286_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_14 = arg_283_1:GetWordFromCfg(222011070)
				local var_286_15 = arg_283_1:FormatText(var_286_14.content)

				arg_283_1.text_.text = var_286_15

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_16 = 34
				local var_286_17 = utf8.len(var_286_15)
				local var_286_18 = var_286_16 <= 0 and var_286_12 or var_286_12 * (var_286_17 / var_286_16)

				if var_286_18 > 0 and var_286_12 < var_286_18 then
					arg_283_1.talkMaxDuration = var_286_18

					if var_286_18 + var_286_11 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_18 + var_286_11
					end
				end

				arg_283_1.text_.text = var_286_15
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011070", "story_v_out_222011.awb") ~= 0 then
					local var_286_19 = manager.audio:GetVoiceLength("story_v_out_222011", "222011070", "story_v_out_222011.awb") / 1000

					if var_286_19 + var_286_11 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_19 + var_286_11
					end

					if var_286_14.prefab_name ~= "" and arg_283_1.actors_[var_286_14.prefab_name] ~= nil then
						local var_286_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_14.prefab_name].transform, "story_v_out_222011", "222011070", "story_v_out_222011.awb")

						arg_283_1:RecordAudio("222011070", var_286_20)
						arg_283_1:RecordAudio("222011070", var_286_20)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_out_222011", "222011070", "story_v_out_222011.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_out_222011", "222011070", "story_v_out_222011.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_21 = math.max(var_286_12, arg_283_1.talkMaxDuration)

			if var_286_11 <= arg_283_1.time_ and arg_283_1.time_ < var_286_11 + var_286_21 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_11) / var_286_21

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_11 + var_286_21 and arg_283_1.time_ < var_286_11 + var_286_21 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play222011071 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 222011071
		arg_287_1.duration_ = 5.7

		local var_287_0 = {
			ja = 5.7,
			ko = 3.533,
			zh = 3.533
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
				arg_287_0:Play222011072(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = 0
			local var_290_1 = 0.375

			if var_290_0 < arg_287_1.time_ and arg_287_1.time_ <= var_290_0 + arg_290_0 then
				arg_287_1.talkMaxDuration = 0
				arg_287_1.dialogCg_.alpha = 1

				arg_287_1.dialog_:SetActive(true)
				SetActive(arg_287_1.leftNameGo_, true)

				local var_290_2 = arg_287_1:FormatText(StoryNameCfg[384].name)

				arg_287_1.leftNameTxt_.text = var_290_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_287_1.leftNameTxt_.transform)

				arg_287_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_287_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_287_1:RecordName(arg_287_1.leftNameTxt_.text)
				SetActive(arg_287_1.iconTrs_.gameObject, false)
				arg_287_1.callingController_:SetSelectedState("normal")

				local var_290_3 = arg_287_1:GetWordFromCfg(222011071)
				local var_290_4 = arg_287_1:FormatText(var_290_3.content)

				arg_287_1.text_.text = var_290_4

				LuaForUtil.ClearLinePrefixSymbol(arg_287_1.text_)

				local var_290_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011071", "story_v_out_222011.awb") ~= 0 then
					local var_290_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011071", "story_v_out_222011.awb") / 1000

					if var_290_8 + var_290_0 > arg_287_1.duration_ then
						arg_287_1.duration_ = var_290_8 + var_290_0
					end

					if var_290_3.prefab_name ~= "" and arg_287_1.actors_[var_290_3.prefab_name] ~= nil then
						local var_290_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_287_1.actors_[var_290_3.prefab_name].transform, "story_v_out_222011", "222011071", "story_v_out_222011.awb")

						arg_287_1:RecordAudio("222011071", var_290_9)
						arg_287_1:RecordAudio("222011071", var_290_9)
					else
						arg_287_1:AudioAction("play", "voice", "story_v_out_222011", "222011071", "story_v_out_222011.awb")
					end

					arg_287_1:RecordHistoryTalkVoice("story_v_out_222011", "222011071", "story_v_out_222011.awb")
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
	Play222011072 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 222011072
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play222011073(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1071ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1071ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, 100, 0)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1071ui_story, var_294_4, var_294_3)

				local var_294_5 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_5.x, var_294_5.y, var_294_5.z)

				local var_294_6 = var_294_0.localEulerAngles

				var_294_6.z = 0
				var_294_6.x = 0
				var_294_0.localEulerAngles = var_294_6
			end

			if arg_291_1.time_ >= var_294_1 + var_294_2 and arg_291_1.time_ < var_294_1 + var_294_2 + arg_294_0 then
				var_294_0.localPosition = Vector3.New(0, 100, 0)

				local var_294_7 = manager.ui.mainCamera.transform.position - var_294_0.position

				var_294_0.forward = Vector3.New(var_294_7.x, var_294_7.y, var_294_7.z)

				local var_294_8 = var_294_0.localEulerAngles

				var_294_8.z = 0
				var_294_8.x = 0
				var_294_0.localEulerAngles = var_294_8
			end

			local var_294_9 = arg_291_1.actors_["1071ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1071ui_story == nil then
				arg_291_1.var_.characterEffect1071ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1071ui_story then
					local var_294_13 = Mathf.Lerp(0, 0.5, var_294_12)

					arg_291_1.var_.characterEffect1071ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1071ui_story.fillRatio = var_294_13
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1071ui_story then
				local var_294_14 = 0.5

				arg_291_1.var_.characterEffect1071ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1071ui_story.fillRatio = var_294_14
			end

			local var_294_15 = arg_291_1.actors_["1074ui_story"].transform
			local var_294_16 = 0

			if var_294_16 < arg_291_1.time_ and arg_291_1.time_ <= var_294_16 + arg_294_0 then
				arg_291_1.var_.moveOldPos1074ui_story = var_294_15.localPosition
			end

			local var_294_17 = 0.001

			if var_294_16 <= arg_291_1.time_ and arg_291_1.time_ < var_294_16 + var_294_17 then
				local var_294_18 = (arg_291_1.time_ - var_294_16) / var_294_17
				local var_294_19 = Vector3.New(0, 100, 0)

				var_294_15.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1074ui_story, var_294_19, var_294_18)

				local var_294_20 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_20.x, var_294_20.y, var_294_20.z)

				local var_294_21 = var_294_15.localEulerAngles

				var_294_21.z = 0
				var_294_21.x = 0
				var_294_15.localEulerAngles = var_294_21
			end

			if arg_291_1.time_ >= var_294_16 + var_294_17 and arg_291_1.time_ < var_294_16 + var_294_17 + arg_294_0 then
				var_294_15.localPosition = Vector3.New(0, 100, 0)

				local var_294_22 = manager.ui.mainCamera.transform.position - var_294_15.position

				var_294_15.forward = Vector3.New(var_294_22.x, var_294_22.y, var_294_22.z)

				local var_294_23 = var_294_15.localEulerAngles

				var_294_23.z = 0
				var_294_23.x = 0
				var_294_15.localEulerAngles = var_294_23
			end

			local var_294_24 = arg_291_1.actors_["10044ui_story"]
			local var_294_25 = 0

			if var_294_25 < arg_291_1.time_ and arg_291_1.time_ <= var_294_25 + arg_294_0 and arg_291_1.var_.characterEffect10044ui_story == nil then
				arg_291_1.var_.characterEffect10044ui_story = var_294_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_26 = 0.200000002980232

			if var_294_25 <= arg_291_1.time_ and arg_291_1.time_ < var_294_25 + var_294_26 then
				local var_294_27 = (arg_291_1.time_ - var_294_25) / var_294_26

				if arg_291_1.var_.characterEffect10044ui_story then
					local var_294_28 = Mathf.Lerp(0, 0.5, var_294_27)

					arg_291_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_291_1.var_.characterEffect10044ui_story.fillRatio = var_294_28
				end
			end

			if arg_291_1.time_ >= var_294_25 + var_294_26 and arg_291_1.time_ < var_294_25 + var_294_26 + arg_294_0 and arg_291_1.var_.characterEffect10044ui_story then
				local var_294_29 = 0.5

				arg_291_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_291_1.var_.characterEffect10044ui_story.fillRatio = var_294_29
			end

			local var_294_30 = 0
			local var_294_31 = 0.6

			if var_294_30 < arg_291_1.time_ and arg_291_1.time_ <= var_294_30 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_32 = arg_291_1:GetWordFromCfg(222011072)
				local var_294_33 = arg_291_1:FormatText(var_294_32.content)

				arg_291_1.text_.text = var_294_33

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_34 = 24
				local var_294_35 = utf8.len(var_294_33)
				local var_294_36 = var_294_34 <= 0 and var_294_31 or var_294_31 * (var_294_35 / var_294_34)

				if var_294_36 > 0 and var_294_31 < var_294_36 then
					arg_291_1.talkMaxDuration = var_294_36

					if var_294_36 + var_294_30 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_36 + var_294_30
					end
				end

				arg_291_1.text_.text = var_294_33
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_37 = math.max(var_294_31, arg_291_1.talkMaxDuration)

			if var_294_30 <= arg_291_1.time_ and arg_291_1.time_ < var_294_30 + var_294_37 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_30) / var_294_37

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_30 + var_294_37 and arg_291_1.time_ < var_294_30 + var_294_37 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play222011073 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 222011073
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play222011074(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 1.175

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

				local var_298_2 = arg_295_1:GetWordFromCfg(222011073)
				local var_298_3 = arg_295_1:FormatText(var_298_2.content)

				arg_295_1.text_.text = var_298_3

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_4 = 47
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
	Play222011074 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 222011074
		arg_299_1.duration_ = 5.233

		local var_299_0 = {
			ja = 5.233,
			ko = 4.966,
			zh = 4.966
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
				arg_299_0:Play222011075(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.575

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[473].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, true)
				arg_299_1.iconController_:SetSelectedState("hero")

				arg_299_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(222011074)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011074", "story_v_out_222011.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011074", "story_v_out_222011.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_out_222011", "222011074", "story_v_out_222011.awb")

						arg_299_1:RecordAudio("222011074", var_302_9)
						arg_299_1:RecordAudio("222011074", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_out_222011", "222011074", "story_v_out_222011.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_out_222011", "222011074", "story_v_out_222011.awb")
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
	Play222011075 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 222011075
		arg_303_1.duration_ = 5

		local var_303_0 = {
			ja = 5,
			ko = 2.266,
			zh = 2.266
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
				arg_303_0:Play222011076(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = arg_303_1.actors_["1074ui_story"].transform
			local var_306_1 = 0

			if var_306_1 < arg_303_1.time_ and arg_303_1.time_ <= var_306_1 + arg_306_0 then
				arg_303_1.var_.moveOldPos1074ui_story = var_306_0.localPosition
			end

			local var_306_2 = 0.001

			if var_306_1 <= arg_303_1.time_ and arg_303_1.time_ < var_306_1 + var_306_2 then
				local var_306_3 = (arg_303_1.time_ - var_306_1) / var_306_2
				local var_306_4 = Vector3.New(0, -1.055, -6.12)

				var_306_0.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1074ui_story, var_306_4, var_306_3)

				local var_306_5 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_5.x, var_306_5.y, var_306_5.z)

				local var_306_6 = var_306_0.localEulerAngles

				var_306_6.z = 0
				var_306_6.x = 0
				var_306_0.localEulerAngles = var_306_6
			end

			if arg_303_1.time_ >= var_306_1 + var_306_2 and arg_303_1.time_ < var_306_1 + var_306_2 + arg_306_0 then
				var_306_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_306_7 = manager.ui.mainCamera.transform.position - var_306_0.position

				var_306_0.forward = Vector3.New(var_306_7.x, var_306_7.y, var_306_7.z)

				local var_306_8 = var_306_0.localEulerAngles

				var_306_8.z = 0
				var_306_8.x = 0
				var_306_0.localEulerAngles = var_306_8
			end

			local var_306_9 = arg_303_1.actors_["1074ui_story"]
			local var_306_10 = 0

			if var_306_10 < arg_303_1.time_ and arg_303_1.time_ <= var_306_10 + arg_306_0 and arg_303_1.var_.characterEffect1074ui_story == nil then
				arg_303_1.var_.characterEffect1074ui_story = var_306_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_11 = 0.200000002980232

			if var_306_10 <= arg_303_1.time_ and arg_303_1.time_ < var_306_10 + var_306_11 then
				local var_306_12 = (arg_303_1.time_ - var_306_10) / var_306_11

				if arg_303_1.var_.characterEffect1074ui_story then
					arg_303_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_10 + var_306_11 and arg_303_1.time_ < var_306_10 + var_306_11 + arg_306_0 and arg_303_1.var_.characterEffect1074ui_story then
				arg_303_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_306_13 = 0

			if var_306_13 < arg_303_1.time_ and arg_303_1.time_ <= var_306_13 + arg_306_0 then
				arg_303_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 then
				arg_303_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_306_15 = 0
			local var_306_16 = 0.125

			if var_306_15 < arg_303_1.time_ and arg_303_1.time_ <= var_306_15 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_17 = arg_303_1:FormatText(StoryNameCfg[410].name)

				arg_303_1.leftNameTxt_.text = var_306_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_18 = arg_303_1:GetWordFromCfg(222011075)
				local var_306_19 = arg_303_1:FormatText(var_306_18.content)

				arg_303_1.text_.text = var_306_19

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_20 = 5
				local var_306_21 = utf8.len(var_306_19)
				local var_306_22 = var_306_20 <= 0 and var_306_16 or var_306_16 * (var_306_21 / var_306_20)

				if var_306_22 > 0 and var_306_16 < var_306_22 then
					arg_303_1.talkMaxDuration = var_306_22

					if var_306_22 + var_306_15 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_22 + var_306_15
					end
				end

				arg_303_1.text_.text = var_306_19
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011075", "story_v_out_222011.awb") ~= 0 then
					local var_306_23 = manager.audio:GetVoiceLength("story_v_out_222011", "222011075", "story_v_out_222011.awb") / 1000

					if var_306_23 + var_306_15 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_23 + var_306_15
					end

					if var_306_18.prefab_name ~= "" and arg_303_1.actors_[var_306_18.prefab_name] ~= nil then
						local var_306_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_18.prefab_name].transform, "story_v_out_222011", "222011075", "story_v_out_222011.awb")

						arg_303_1:RecordAudio("222011075", var_306_24)
						arg_303_1:RecordAudio("222011075", var_306_24)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_222011", "222011075", "story_v_out_222011.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_222011", "222011075", "story_v_out_222011.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_25 = math.max(var_306_16, arg_303_1.talkMaxDuration)

			if var_306_15 <= arg_303_1.time_ and arg_303_1.time_ < var_306_15 + var_306_25 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_15) / var_306_25

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_15 + var_306_25 and arg_303_1.time_ < var_306_15 + var_306_25 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play222011076 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 222011076
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play222011077(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1074ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1074ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, 100, 0)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1074ui_story, var_310_4, var_310_3)

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

			local var_310_9 = arg_307_1.actors_["1074ui_story"]
			local var_310_10 = 0

			if var_310_10 < arg_307_1.time_ and arg_307_1.time_ <= var_310_10 + arg_310_0 and arg_307_1.var_.characterEffect1074ui_story == nil then
				arg_307_1.var_.characterEffect1074ui_story = var_310_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_11 = 0.200000002980232

			if var_310_10 <= arg_307_1.time_ and arg_307_1.time_ < var_310_10 + var_310_11 then
				local var_310_12 = (arg_307_1.time_ - var_310_10) / var_310_11

				if arg_307_1.var_.characterEffect1074ui_story then
					local var_310_13 = Mathf.Lerp(0, 0.5, var_310_12)

					arg_307_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1074ui_story.fillRatio = var_310_13
				end
			end

			if arg_307_1.time_ >= var_310_10 + var_310_11 and arg_307_1.time_ < var_310_10 + var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect1074ui_story then
				local var_310_14 = 0.5

				arg_307_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1074ui_story.fillRatio = var_310_14
			end

			local var_310_15 = 0
			local var_310_16 = 0.675

			if var_310_15 < arg_307_1.time_ and arg_307_1.time_ <= var_310_15 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_17 = arg_307_1:GetWordFromCfg(222011076)
				local var_310_18 = arg_307_1:FormatText(var_310_17.content)

				arg_307_1.text_.text = var_310_18

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_19 = 27
				local var_310_20 = utf8.len(var_310_18)
				local var_310_21 = var_310_19 <= 0 and var_310_16 or var_310_16 * (var_310_20 / var_310_19)

				if var_310_21 > 0 and var_310_16 < var_310_21 then
					arg_307_1.talkMaxDuration = var_310_21

					if var_310_21 + var_310_15 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_21 + var_310_15
					end
				end

				arg_307_1.text_.text = var_310_18
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_22 = math.max(var_310_16, arg_307_1.talkMaxDuration)

			if var_310_15 <= arg_307_1.time_ and arg_307_1.time_ < var_310_15 + var_310_22 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_15) / var_310_22

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_15 + var_310_22 and arg_307_1.time_ < var_310_15 + var_310_22 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play222011077 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 222011077
		arg_311_1.duration_ = 4.299999999999

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play222011078(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0

			if var_314_0 < arg_311_1.time_ and arg_311_1.time_ <= var_314_0 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_1 = 2

			if var_314_0 <= arg_311_1.time_ and arg_311_1.time_ < var_314_0 + var_314_1 then
				local var_314_2 = (arg_311_1.time_ - var_314_0) / var_314_1
				local var_314_3 = Color.New(0, 0, 0)

				var_314_3.a = Mathf.Lerp(0, 1, var_314_2)
				arg_311_1.mask_.color = var_314_3
			end

			if arg_311_1.time_ >= var_314_0 + var_314_1 and arg_311_1.time_ < var_314_0 + var_314_1 + arg_314_0 then
				local var_314_4 = Color.New(0, 0, 0)

				var_314_4.a = 1
				arg_311_1.mask_.color = var_314_4
			end

			local var_314_5 = 2

			if var_314_5 < arg_311_1.time_ and arg_311_1.time_ <= var_314_5 + arg_314_0 then
				arg_311_1.mask_.enabled = true
				arg_311_1.mask_.raycastTarget = true

				arg_311_1:SetGaussion(false)
			end

			local var_314_6 = 2

			if var_314_5 <= arg_311_1.time_ and arg_311_1.time_ < var_314_5 + var_314_6 then
				local var_314_7 = (arg_311_1.time_ - var_314_5) / var_314_6
				local var_314_8 = Color.New(0, 0, 0)

				var_314_8.a = Mathf.Lerp(1, 0, var_314_7)
				arg_311_1.mask_.color = var_314_8
			end

			if arg_311_1.time_ >= var_314_5 + var_314_6 and arg_311_1.time_ < var_314_5 + var_314_6 + arg_314_0 then
				local var_314_9 = Color.New(0, 0, 0)
				local var_314_10 = 0

				arg_311_1.mask_.enabled = false
				var_314_9.a = var_314_10
				arg_311_1.mask_.color = var_314_9
			end

			local var_314_11 = 2

			if var_314_11 < arg_311_1.time_ and arg_311_1.time_ <= var_314_11 + arg_314_0 then
				arg_311_1.fswbg_:SetActive(true)
				arg_311_1.dialog_:SetActive(false)

				arg_311_1.fswtw_.percent = 0

				local var_314_12 = arg_311_1:GetWordFromCfg(222011077)
				local var_314_13 = arg_311_1:FormatText(var_314_12.content)

				arg_311_1.fswt_.text = var_314_13

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.fswt_)

				arg_311_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_311_1.fswtw_:SetDirty()

				arg_311_1.typewritterCharCountI18N = 0

				SetActive(arg_311_1.fswtw_.transform.parent.parent:Find("bg/line").gameObject, false)
				arg_311_1:ShowNextGo(false)
			end

			local var_314_14 = 2.01666666666667

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1.var_.oldValueTypewriter = arg_311_1.fswtw_.percent

				arg_311_1:ShowNextGo(false)
			end

			local var_314_15 = 5
			local var_314_16 = 0.333333333333333
			local var_314_17 = arg_311_1:GetWordFromCfg(222011077)
			local var_314_18 = arg_311_1:FormatText(var_314_17.content)
			local var_314_19, var_314_20 = arg_311_1:GetPercentByPara(var_314_18, 1)

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0

				local var_314_21 = var_314_15 <= 0 and var_314_16 or var_314_16 * ((var_314_20 - arg_311_1.typewritterCharCountI18N) / var_314_15)

				if var_314_21 > 0 and var_314_16 < var_314_21 then
					arg_311_1.talkMaxDuration = var_314_21

					if var_314_21 + var_314_14 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_21 + var_314_14
					end
				end
			end

			local var_314_22 = 0.333333333333333
			local var_314_23 = math.max(var_314_22, arg_311_1.talkMaxDuration)

			if var_314_14 <= arg_311_1.time_ and arg_311_1.time_ < var_314_14 + var_314_23 then
				local var_314_24 = (arg_311_1.time_ - var_314_14) / var_314_23

				arg_311_1.fswtw_.percent = Mathf.Lerp(arg_311_1.var_.oldValueTypewriter, var_314_19, var_314_24)
				arg_311_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_311_1.fswtw_:SetDirty()
			end

			if arg_311_1.time_ >= var_314_14 + var_314_23 and arg_311_1.time_ < var_314_14 + var_314_23 + arg_314_0 then
				arg_311_1.fswtw_.percent = var_314_19

				arg_311_1.fswtw_:SetDirty()
				arg_311_1:ShowNextGo(true)

				arg_311_1.typewritterCharCountI18N = var_314_20
			end

			local var_314_25 = "STblack"

			if arg_311_1.bgs_[var_314_25] == nil then
				local var_314_26 = Object.Instantiate(arg_311_1.paintGo_)

				var_314_26:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_314_25)
				var_314_26.name = var_314_25
				var_314_26.transform.parent = arg_311_1.stage_.transform
				var_314_26.transform.localPosition = Vector3.New(0, 100, 0)
				arg_311_1.bgs_[var_314_25] = var_314_26
			end

			local var_314_27 = 2

			if var_314_27 < arg_311_1.time_ and arg_311_1.time_ <= var_314_27 + arg_314_0 then
				local var_314_28 = manager.ui.mainCamera.transform.localPosition
				local var_314_29 = Vector3.New(0, 0, 10) + Vector3.New(var_314_28.x, var_314_28.y, 0)
				local var_314_30 = arg_311_1.bgs_.STblack

				var_314_30.transform.localPosition = var_314_29
				var_314_30.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_314_31 = var_314_30:GetComponent("SpriteRenderer")

				if var_314_31 and var_314_31.sprite then
					local var_314_32 = (var_314_30.transform.localPosition - var_314_28).z
					local var_314_33 = manager.ui.mainCameraCom_
					local var_314_34 = 2 * var_314_32 * Mathf.Tan(var_314_33.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_314_35 = var_314_34 * var_314_33.aspect
					local var_314_36 = var_314_31.sprite.bounds.size.x
					local var_314_37 = var_314_31.sprite.bounds.size.y
					local var_314_38 = var_314_35 / var_314_36
					local var_314_39 = var_314_34 / var_314_37
					local var_314_40 = var_314_39 < var_314_38 and var_314_38 or var_314_39

					var_314_30.transform.localScale = Vector3.New(var_314_40, var_314_40, 0)
				end

				for iter_314_0, iter_314_1 in pairs(arg_311_1.bgs_) do
					if iter_314_0 ~= "STblack" then
						iter_314_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_314_41 = 2

			if var_314_41 < arg_311_1.time_ and arg_311_1.time_ <= var_314_41 + arg_314_0 then
				local var_314_42 = arg_311_1.fswbg_.transform:Find("textbox/adapt/content") or arg_311_1.fswbg_.transform:Find("textbox/content")
				local var_314_43 = var_314_42:GetComponent("Text")
				local var_314_44 = var_314_42:GetComponent("RectTransform")

				var_314_43.alignment = UnityEngine.TextAnchor.MiddleCenter
				var_314_44.offsetMin = Vector2.New(0, 0)
				var_314_44.offsetMax = Vector2.New(0, 0)
			end
		end
	end,
	Play222011078 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 222011078
		arg_315_1.duration_ = 4.399999999999

		local var_315_0 = {
			ja = 4.399999999999,
			ko = 4.199999999999,
			zh = 4.199999999999
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
				arg_315_0:Play222011079(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = "YZ0101"

			if arg_315_1.bgs_[var_318_0] == nil then
				local var_318_1 = Object.Instantiate(arg_315_1.paintGo_)

				var_318_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_318_0)
				var_318_1.name = var_318_0
				var_318_1.transform.parent = arg_315_1.stage_.transform
				var_318_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_315_1.bgs_[var_318_0] = var_318_1
			end

			local var_318_2 = 0

			if var_318_2 < arg_315_1.time_ and arg_315_1.time_ <= var_318_2 + arg_318_0 then
				local var_318_3 = manager.ui.mainCamera.transform.localPosition
				local var_318_4 = Vector3.New(0, 0, 10) + Vector3.New(var_318_3.x, var_318_3.y, 0)
				local var_318_5 = arg_315_1.bgs_.YZ0101

				var_318_5.transform.localPosition = var_318_4
				var_318_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_318_6 = var_318_5:GetComponent("SpriteRenderer")

				if var_318_6 and var_318_6.sprite then
					local var_318_7 = (var_318_5.transform.localPosition - var_318_3).z
					local var_318_8 = manager.ui.mainCameraCom_
					local var_318_9 = 2 * var_318_7 * Mathf.Tan(var_318_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_318_10 = var_318_9 * var_318_8.aspect
					local var_318_11 = var_318_6.sprite.bounds.size.x
					local var_318_12 = var_318_6.sprite.bounds.size.y
					local var_318_13 = var_318_10 / var_318_11
					local var_318_14 = var_318_9 / var_318_12
					local var_318_15 = var_318_14 < var_318_13 and var_318_13 or var_318_14

					var_318_5.transform.localScale = Vector3.New(var_318_15, var_318_15, 0)
				end

				for iter_318_0, iter_318_1 in pairs(arg_315_1.bgs_) do
					if iter_318_0 ~= "YZ0101" then
						iter_318_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1.mask_.enabled = true
				arg_315_1.mask_.raycastTarget = true

				arg_315_1:SetGaussion(false)
			end

			local var_318_17 = 2

			if var_318_16 <= arg_315_1.time_ and arg_315_1.time_ < var_318_16 + var_318_17 then
				local var_318_18 = (arg_315_1.time_ - var_318_16) / var_318_17
				local var_318_19 = Color.New(0, 0, 0)

				var_318_19.a = Mathf.Lerp(1, 0, var_318_18)
				arg_315_1.mask_.color = var_318_19
			end

			if arg_315_1.time_ >= var_318_16 + var_318_17 and arg_315_1.time_ < var_318_16 + var_318_17 + arg_318_0 then
				local var_318_20 = Color.New(0, 0, 0)
				local var_318_21 = 0

				arg_315_1.mask_.enabled = false
				var_318_20.a = var_318_21
				arg_315_1.mask_.color = var_318_20
			end

			local var_318_22 = 0

			if var_318_22 < arg_315_1.time_ and arg_315_1.time_ <= var_318_22 + arg_318_0 then
				arg_315_1.fswbg_:SetActive(false)
				arg_315_1.dialog_:SetActive(false)
				arg_315_1:ShowNextGo(false)
			end

			local var_318_23 = arg_315_1.bgs_.YZ0101.transform
			local var_318_24 = 0

			if var_318_24 < arg_315_1.time_ and arg_315_1.time_ <= var_318_24 + arg_318_0 then
				arg_315_1.var_.moveOldPosYZ0101 = var_318_23.localPosition
			end

			local var_318_25 = 3.5

			if var_318_24 <= arg_315_1.time_ and arg_315_1.time_ < var_318_24 + var_318_25 then
				local var_318_26 = (arg_315_1.time_ - var_318_24) / var_318_25
				local var_318_27 = Vector3.New(0, 1, 9.5)

				var_318_23.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPosYZ0101, var_318_27, var_318_26)
			end

			if arg_315_1.time_ >= var_318_24 + var_318_25 and arg_315_1.time_ < var_318_24 + var_318_25 + arg_318_0 then
				var_318_23.localPosition = Vector3.New(0, 1, 9.5)
			end

			local var_318_28 = 1.999999999999

			if var_318_28 < arg_315_1.time_ and arg_315_1.time_ <= var_318_28 + arg_318_0 then
				arg_315_1.allBtn_.enabled = false
			end

			local var_318_29 = 1.500000000001

			if arg_315_1.time_ >= var_318_28 + var_318_29 and arg_315_1.time_ < var_318_28 + var_318_29 + arg_318_0 then
				arg_315_1.allBtn_.enabled = true
			end

			if arg_315_1.frameCnt_ <= 1 then
				arg_315_1.dialog_:SetActive(false)
			end

			local var_318_30 = 1.999999999999
			local var_318_31 = 0.2

			if var_318_30 < arg_315_1.time_ and arg_315_1.time_ <= var_318_30 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0

				arg_315_1.dialog_:SetActive(true)

				local var_318_32 = LeanTween.value(arg_315_1.dialog_, 0, 1, 0.3)

				var_318_32:setOnUpdate(LuaHelper.FloatAction(function(arg_319_0)
					arg_315_1.dialogCg_.alpha = arg_319_0
				end))
				var_318_32:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_315_1.dialog_)
					var_318_32:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_315_1.duration_ = arg_315_1.duration_ + 0.3

				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_33 = arg_315_1:FormatText(StoryNameCfg[36].name)

				arg_315_1.leftNameTxt_.text = var_318_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, true)
				arg_315_1.iconController_:SetSelectedState("hero")

				arg_315_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_34 = arg_315_1:GetWordFromCfg(222011078)
				local var_318_35 = arg_315_1:FormatText(var_318_34.content)

				arg_315_1.text_.text = var_318_35

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_36 = 8
				local var_318_37 = utf8.len(var_318_35)
				local var_318_38 = var_318_36 <= 0 and var_318_31 or var_318_31 * (var_318_37 / var_318_36)

				if var_318_38 > 0 and var_318_31 < var_318_38 then
					arg_315_1.talkMaxDuration = var_318_38
					var_318_30 = var_318_30 + 0.3

					if var_318_38 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_38 + var_318_30
					end
				end

				arg_315_1.text_.text = var_318_35
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011078", "story_v_out_222011.awb") ~= 0 then
					local var_318_39 = manager.audio:GetVoiceLength("story_v_out_222011", "222011078", "story_v_out_222011.awb") / 1000

					if var_318_39 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_39 + var_318_30
					end

					if var_318_34.prefab_name ~= "" and arg_315_1.actors_[var_318_34.prefab_name] ~= nil then
						local var_318_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_34.prefab_name].transform, "story_v_out_222011", "222011078", "story_v_out_222011.awb")

						arg_315_1:RecordAudio("222011078", var_318_40)
						arg_315_1:RecordAudio("222011078", var_318_40)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_222011", "222011078", "story_v_out_222011.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_222011", "222011078", "story_v_out_222011.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_41 = var_318_30 + 0.3
			local var_318_42 = math.max(var_318_31, arg_315_1.talkMaxDuration)

			if var_318_41 <= arg_315_1.time_ and arg_315_1.time_ < var_318_41 + var_318_42 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_41) / var_318_42

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_41 + var_318_42 and arg_315_1.time_ < var_318_41 + var_318_42 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play222011079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 222011079
		arg_321_1.duration_ = 5

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play222011080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 1.7

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_2 = arg_321_1:GetWordFromCfg(222011079)
				local var_324_3 = arg_321_1:FormatText(var_324_2.content)

				arg_321_1.text_.text = var_324_3

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_4 = 68
				local var_324_5 = utf8.len(var_324_3)
				local var_324_6 = var_324_4 <= 0 and var_324_1 or var_324_1 * (var_324_5 / var_324_4)

				if var_324_6 > 0 and var_324_1 < var_324_6 then
					arg_321_1.talkMaxDuration = var_324_6

					if var_324_6 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_6 + var_324_0
					end
				end

				arg_321_1.text_.text = var_324_3
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_7 = math.max(var_324_1, arg_321_1.talkMaxDuration)

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_7 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_0) / var_324_7

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_0 + var_324_7 and arg_321_1.time_ < var_324_0 + var_324_7 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play222011080 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 222011080
		arg_325_1.duration_ = 3.766

		local var_325_0 = {
			ja = 3.766,
			ko = 2.466,
			zh = 2.466
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
				arg_325_0:Play222011081(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.3

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[140].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, true)
				arg_325_1.iconController_:SetSelectedState("hero")

				arg_325_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_woundedd")

				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(222011080)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011080", "story_v_out_222011.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011080", "story_v_out_222011.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_222011", "222011080", "story_v_out_222011.awb")

						arg_325_1:RecordAudio("222011080", var_328_9)
						arg_325_1:RecordAudio("222011080", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_222011", "222011080", "story_v_out_222011.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_222011", "222011080", "story_v_out_222011.awb")
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
	Play222011081 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 222011081
		arg_329_1.duration_ = 6.5

		local var_329_0 = {
			ja = 6.5,
			ko = 3.933,
			zh = 3.933
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
				arg_329_0:Play222011082(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 0.475

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[141].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, true)
				arg_329_1.iconController_:SetSelectedState("hero")

				arg_329_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(222011081)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 19
				local var_332_6 = utf8.len(var_332_4)
				local var_332_7 = var_332_5 <= 0 and var_332_1 or var_332_1 * (var_332_6 / var_332_5)

				if var_332_7 > 0 and var_332_1 < var_332_7 then
					arg_329_1.talkMaxDuration = var_332_7

					if var_332_7 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_7 + var_332_0
					end
				end

				arg_329_1.text_.text = var_332_4
				arg_329_1.typewritter.percent = 0

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011081", "story_v_out_222011.awb") ~= 0 then
					local var_332_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011081", "story_v_out_222011.awb") / 1000

					if var_332_8 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_0
					end

					if var_332_3.prefab_name ~= "" and arg_329_1.actors_[var_332_3.prefab_name] ~= nil then
						local var_332_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_3.prefab_name].transform, "story_v_out_222011", "222011081", "story_v_out_222011.awb")

						arg_329_1:RecordAudio("222011081", var_332_9)
						arg_329_1:RecordAudio("222011081", var_332_9)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_222011", "222011081", "story_v_out_222011.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_222011", "222011081", "story_v_out_222011.awb")
				end

				arg_329_1:RecordContent(arg_329_1.text_.text)
			end

			local var_332_10 = math.max(var_332_1, arg_329_1.talkMaxDuration)

			if var_332_0 <= arg_329_1.time_ and arg_329_1.time_ < var_332_0 + var_332_10 then
				arg_329_1.typewritter.percent = (arg_329_1.time_ - var_332_0) / var_332_10

				arg_329_1.typewritter:SetDirty()
			end

			if arg_329_1.time_ >= var_332_0 + var_332_10 and arg_329_1.time_ < var_332_0 + var_332_10 + arg_332_0 then
				arg_329_1.typewritter.percent = 1

				arg_329_1.typewritter:SetDirty()
				arg_329_1:ShowNextGo(true)
			end
		end
	end,
	Play222011082 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 222011082
		arg_333_1.duration_ = 12.2

		local var_333_0 = {
			ja = 12.2,
			ko = 7.033,
			zh = 7.033
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
				arg_333_0:Play222011083(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 0.825

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_2 = arg_333_1:FormatText(StoryNameCfg[141].name)

				arg_333_1.leftNameTxt_.text = var_336_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, true)
				arg_333_1.iconController_:SetSelectedState("hero")

				arg_333_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_3 = arg_333_1:GetWordFromCfg(222011082)
				local var_336_4 = arg_333_1:FormatText(var_336_3.content)

				arg_333_1.text_.text = var_336_4

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011082", "story_v_out_222011.awb") ~= 0 then
					local var_336_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011082", "story_v_out_222011.awb") / 1000

					if var_336_8 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_8 + var_336_0
					end

					if var_336_3.prefab_name ~= "" and arg_333_1.actors_[var_336_3.prefab_name] ~= nil then
						local var_336_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_3.prefab_name].transform, "story_v_out_222011", "222011082", "story_v_out_222011.awb")

						arg_333_1:RecordAudio("222011082", var_336_9)
						arg_333_1:RecordAudio("222011082", var_336_9)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_222011", "222011082", "story_v_out_222011.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_222011", "222011082", "story_v_out_222011.awb")
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
	Play222011083 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 222011083
		arg_337_1.duration_ = 17.133

		local var_337_0 = {
			ja = 17.133,
			ko = 11.433,
			zh = 11.433
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
				arg_337_0:Play222011084(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 1.475

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[141].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, true)
				arg_337_1.iconController_:SetSelectedState("hero")

				arg_337_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_citizenwc")

				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(222011083)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011083", "story_v_out_222011.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011083", "story_v_out_222011.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_222011", "222011083", "story_v_out_222011.awb")

						arg_337_1:RecordAudio("222011083", var_340_9)
						arg_337_1:RecordAudio("222011083", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_222011", "222011083", "story_v_out_222011.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_222011", "222011083", "story_v_out_222011.awb")
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
	Play222011084 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 222011084
		arg_341_1.duration_ = 5

		SetActive(arg_341_1.tipsGo_, false)

		function arg_341_1.onSingleLineFinish_()
			arg_341_1.onSingleLineUpdate_ = nil
			arg_341_1.onSingleLineFinish_ = nil
			arg_341_1.state_ = "waiting"
		end

		function arg_341_1.playNext_(arg_343_0)
			if arg_343_0 == 1 then
				arg_341_0:Play222011085(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 1.325

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

				local var_344_2 = arg_341_1:GetWordFromCfg(222011084)
				local var_344_3 = arg_341_1:FormatText(var_344_2.content)

				arg_341_1.text_.text = var_344_3

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_4 = 53
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
	Play222011085 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 222011085
		arg_345_1.duration_ = 5

		SetActive(arg_345_1.tipsGo_, false)

		function arg_345_1.onSingleLineFinish_()
			arg_345_1.onSingleLineUpdate_ = nil
			arg_345_1.onSingleLineFinish_ = nil
			arg_345_1.state_ = "waiting"
		end

		function arg_345_1.playNext_(arg_347_0)
			if arg_347_0 == 1 then
				arg_345_0:Play222011086(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 1.525

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

				local var_348_2 = arg_345_1:GetWordFromCfg(222011085)
				local var_348_3 = arg_345_1:FormatText(var_348_2.content)

				arg_345_1.text_.text = var_348_3

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_4 = 61
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
	Play222011086 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 222011086
		arg_349_1.duration_ = 10.266

		local var_349_0 = {
			ja = 10.266,
			ko = 5.1,
			zh = 5.1
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
				arg_349_0:Play222011087(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 0.625

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[410].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(222011086)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011086", "story_v_out_222011.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011086", "story_v_out_222011.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_222011", "222011086", "story_v_out_222011.awb")

						arg_349_1:RecordAudio("222011086", var_352_9)
						arg_349_1:RecordAudio("222011086", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_222011", "222011086", "story_v_out_222011.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_222011", "222011086", "story_v_out_222011.awb")
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
	Play222011087 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 222011087
		arg_353_1.duration_ = 3.833

		local var_353_0 = {
			ja = 3.833,
			ko = 2.366,
			zh = 2.366
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
				arg_353_0:Play222011088(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 0.2

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[465].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, true)
				arg_353_1.iconController_:SetSelectedState("hero")

				arg_353_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(222011087)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011087", "story_v_out_222011.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011087", "story_v_out_222011.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_222011", "222011087", "story_v_out_222011.awb")

						arg_353_1:RecordAudio("222011087", var_356_9)
						arg_353_1:RecordAudio("222011087", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_222011", "222011087", "story_v_out_222011.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_222011", "222011087", "story_v_out_222011.awb")
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
	Play222011088 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 222011088
		arg_357_1.duration_ = 10.833

		local var_357_0 = {
			ja = 10.833,
			ko = 4.766,
			zh = 4.766
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
				arg_357_0:Play222011089(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.65

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[410].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(222011088)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 26
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011088", "story_v_out_222011.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011088", "story_v_out_222011.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_222011", "222011088", "story_v_out_222011.awb")

						arg_357_1:RecordAudio("222011088", var_360_9)
						arg_357_1:RecordAudio("222011088", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_222011", "222011088", "story_v_out_222011.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_222011", "222011088", "story_v_out_222011.awb")
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
	Play222011089 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 222011089
		arg_361_1.duration_ = 8.166

		local var_361_0 = {
			ja = 8.166,
			ko = 5.1,
			zh = 5.1
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
				arg_361_0:Play222011090(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.575

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[410].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(222011089)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 23
				local var_364_6 = utf8.len(var_364_4)
				local var_364_7 = var_364_5 <= 0 and var_364_1 or var_364_1 * (var_364_6 / var_364_5)

				if var_364_7 > 0 and var_364_1 < var_364_7 then
					arg_361_1.talkMaxDuration = var_364_7

					if var_364_7 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_7 + var_364_0
					end
				end

				arg_361_1.text_.text = var_364_4
				arg_361_1.typewritter.percent = 0

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011089", "story_v_out_222011.awb") ~= 0 then
					local var_364_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011089", "story_v_out_222011.awb") / 1000

					if var_364_8 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_0
					end

					if var_364_3.prefab_name ~= "" and arg_361_1.actors_[var_364_3.prefab_name] ~= nil then
						local var_364_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_3.prefab_name].transform, "story_v_out_222011", "222011089", "story_v_out_222011.awb")

						arg_361_1:RecordAudio("222011089", var_364_9)
						arg_361_1:RecordAudio("222011089", var_364_9)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_222011", "222011089", "story_v_out_222011.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_222011", "222011089", "story_v_out_222011.awb")
				end

				arg_361_1:RecordContent(arg_361_1.text_.text)
			end

			local var_364_10 = math.max(var_364_1, arg_361_1.talkMaxDuration)

			if var_364_0 <= arg_361_1.time_ and arg_361_1.time_ < var_364_0 + var_364_10 then
				arg_361_1.typewritter.percent = (arg_361_1.time_ - var_364_0) / var_364_10

				arg_361_1.typewritter:SetDirty()
			end

			if arg_361_1.time_ >= var_364_0 + var_364_10 and arg_361_1.time_ < var_364_0 + var_364_10 + arg_364_0 then
				arg_361_1.typewritter.percent = 1

				arg_361_1.typewritter:SetDirty()
				arg_361_1:ShowNextGo(true)
			end
		end
	end,
	Play222011090 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 222011090
		arg_365_1.duration_ = 2.3

		local var_365_0 = {
			ja = 2.3,
			ko = 1.733,
			zh = 1.733
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
				arg_365_0:Play222011091(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = arg_365_1.actors_["1074ui_story"]
			local var_368_1 = 0

			if var_368_1 < arg_365_1.time_ and arg_365_1.time_ <= var_368_1 + arg_368_0 and arg_365_1.var_.characterEffect1074ui_story == nil then
				arg_365_1.var_.characterEffect1074ui_story = var_368_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_368_2 = 0.200000002980232

			if var_368_1 <= arg_365_1.time_ and arg_365_1.time_ < var_368_1 + var_368_2 then
				local var_368_3 = (arg_365_1.time_ - var_368_1) / var_368_2

				if arg_365_1.var_.characterEffect1074ui_story then
					local var_368_4 = Mathf.Lerp(0, 0.5, var_368_3)

					arg_365_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_365_1.var_.characterEffect1074ui_story.fillRatio = var_368_4
				end
			end

			if arg_365_1.time_ >= var_368_1 + var_368_2 and arg_365_1.time_ < var_368_1 + var_368_2 + arg_368_0 and arg_365_1.var_.characterEffect1074ui_story then
				local var_368_5 = 0.5

				arg_365_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_365_1.var_.characterEffect1074ui_story.fillRatio = var_368_5
			end

			local var_368_6 = 0
			local var_368_7 = 0.175

			if var_368_6 < arg_365_1.time_ and arg_365_1.time_ <= var_368_6 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_8 = arg_365_1:FormatText(StoryNameCfg[466].name)

				arg_365_1.leftNameTxt_.text = var_368_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, true)
				arg_365_1.iconController_:SetSelectedState("hero")

				arg_365_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_9 = arg_365_1:GetWordFromCfg(222011090)
				local var_368_10 = arg_365_1:FormatText(var_368_9.content)

				arg_365_1.text_.text = var_368_10

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_11 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011090", "story_v_out_222011.awb") ~= 0 then
					local var_368_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011090", "story_v_out_222011.awb") / 1000

					if var_368_14 + var_368_6 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_14 + var_368_6
					end

					if var_368_9.prefab_name ~= "" and arg_365_1.actors_[var_368_9.prefab_name] ~= nil then
						local var_368_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_9.prefab_name].transform, "story_v_out_222011", "222011090", "story_v_out_222011.awb")

						arg_365_1:RecordAudio("222011090", var_368_15)
						arg_365_1:RecordAudio("222011090", var_368_15)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_222011", "222011090", "story_v_out_222011.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_222011", "222011090", "story_v_out_222011.awb")
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
	Play222011091 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 222011091
		arg_369_1.duration_ = 12.266

		local var_369_0 = {
			ja = 11.266,
			ko = 12.266,
			zh = 12.266
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
				arg_369_0:Play222011092(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 1.325

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_2 = arg_369_1:FormatText(StoryNameCfg[410].name)

				arg_369_1.leftNameTxt_.text = var_372_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_3 = arg_369_1:GetWordFromCfg(222011091)
				local var_372_4 = arg_369_1:FormatText(var_372_3.content)

				arg_369_1.text_.text = var_372_4

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011091", "story_v_out_222011.awb") ~= 0 then
					local var_372_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011091", "story_v_out_222011.awb") / 1000

					if var_372_8 + var_372_0 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_8 + var_372_0
					end

					if var_372_3.prefab_name ~= "" and arg_369_1.actors_[var_372_3.prefab_name] ~= nil then
						local var_372_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_3.prefab_name].transform, "story_v_out_222011", "222011091", "story_v_out_222011.awb")

						arg_369_1:RecordAudio("222011091", var_372_9)
						arg_369_1:RecordAudio("222011091", var_372_9)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_222011", "222011091", "story_v_out_222011.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_222011", "222011091", "story_v_out_222011.awb")
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
	Play222011092 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 222011092
		arg_373_1.duration_ = 5

		SetActive(arg_373_1.tipsGo_, false)

		function arg_373_1.onSingleLineFinish_()
			arg_373_1.onSingleLineUpdate_ = nil
			arg_373_1.onSingleLineFinish_ = nil
			arg_373_1.state_ = "waiting"
		end

		function arg_373_1.playNext_(arg_375_0)
			if arg_375_0 == 1 then
				arg_373_0:Play222011093(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 0
			local var_376_1 = 0.875

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

				local var_376_2 = arg_373_1:GetWordFromCfg(222011092)
				local var_376_3 = arg_373_1:FormatText(var_376_2.content)

				arg_373_1.text_.text = var_376_3

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_4 = 35
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
	Play222011093 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 222011093
		arg_377_1.duration_ = 9.566

		local var_377_0 = {
			ja = 9.566,
			ko = 8.566,
			zh = 8.566
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
				arg_377_0:Play222011094(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = 0
			local var_380_1 = 0.975

			if var_380_0 < arg_377_1.time_ and arg_377_1.time_ <= var_380_0 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, true)

				local var_380_2 = arg_377_1:FormatText(StoryNameCfg[466].name)

				arg_377_1.leftNameTxt_.text = var_380_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_377_1.leftNameTxt_.transform)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1.leftNameTxt_.text)
				SetActive(arg_377_1.iconTrs_.gameObject, true)
				arg_377_1.iconController_:SetSelectedState("hero")

				arg_377_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_3 = arg_377_1:GetWordFromCfg(222011093)
				local var_380_4 = arg_377_1:FormatText(var_380_3.content)

				arg_377_1.text_.text = var_380_4

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_5 = 39
				local var_380_6 = utf8.len(var_380_4)
				local var_380_7 = var_380_5 <= 0 and var_380_1 or var_380_1 * (var_380_6 / var_380_5)

				if var_380_7 > 0 and var_380_1 < var_380_7 then
					arg_377_1.talkMaxDuration = var_380_7

					if var_380_7 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_7 + var_380_0
					end
				end

				arg_377_1.text_.text = var_380_4
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011093", "story_v_out_222011.awb") ~= 0 then
					local var_380_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011093", "story_v_out_222011.awb") / 1000

					if var_380_8 + var_380_0 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_8 + var_380_0
					end

					if var_380_3.prefab_name ~= "" and arg_377_1.actors_[var_380_3.prefab_name] ~= nil then
						local var_380_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_377_1.actors_[var_380_3.prefab_name].transform, "story_v_out_222011", "222011093", "story_v_out_222011.awb")

						arg_377_1:RecordAudio("222011093", var_380_9)
						arg_377_1:RecordAudio("222011093", var_380_9)
					else
						arg_377_1:AudioAction("play", "voice", "story_v_out_222011", "222011093", "story_v_out_222011.awb")
					end

					arg_377_1:RecordHistoryTalkVoice("story_v_out_222011", "222011093", "story_v_out_222011.awb")
				end

				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_10 = math.max(var_380_1, arg_377_1.talkMaxDuration)

			if var_380_0 <= arg_377_1.time_ and arg_377_1.time_ < var_380_0 + var_380_10 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_0) / var_380_10

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_0 + var_380_10 and arg_377_1.time_ < var_380_0 + var_380_10 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play222011094 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 222011094
		arg_381_1.duration_ = 15.3

		local var_381_0 = {
			ja = 15.3,
			ko = 14.366,
			zh = 14.366
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
				arg_381_0:Play222011095(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 1.475

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[466].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, true)
				arg_381_1.iconController_:SetSelectedState("hero")

				arg_381_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(222011094)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 59
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011094", "story_v_out_222011.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011094", "story_v_out_222011.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_222011", "222011094", "story_v_out_222011.awb")

						arg_381_1:RecordAudio("222011094", var_384_9)
						arg_381_1:RecordAudio("222011094", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_222011", "222011094", "story_v_out_222011.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_222011", "222011094", "story_v_out_222011.awb")
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
	Play222011095 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 222011095
		arg_385_1.duration_ = 12.666

		local var_385_0 = {
			ja = 12.666,
			ko = 5.966,
			zh = 5.966
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
				arg_385_0:Play222011096(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 0.875

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_2 = arg_385_1:FormatText(StoryNameCfg[465].name)

				arg_385_1.leftNameTxt_.text = var_388_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, true)
				arg_385_1.iconController_:SetSelectedState("hero")

				arg_385_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_3 = arg_385_1:GetWordFromCfg(222011095)
				local var_388_4 = arg_385_1:FormatText(var_388_3.content)

				arg_385_1.text_.text = var_388_4

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_5 = 35
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011095", "story_v_out_222011.awb") ~= 0 then
					local var_388_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011095", "story_v_out_222011.awb") / 1000

					if var_388_8 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_8 + var_388_0
					end

					if var_388_3.prefab_name ~= "" and arg_385_1.actors_[var_388_3.prefab_name] ~= nil then
						local var_388_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_3.prefab_name].transform, "story_v_out_222011", "222011095", "story_v_out_222011.awb")

						arg_385_1:RecordAudio("222011095", var_388_9)
						arg_385_1:RecordAudio("222011095", var_388_9)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_out_222011", "222011095", "story_v_out_222011.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_out_222011", "222011095", "story_v_out_222011.awb")
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
	Play222011096 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 222011096
		arg_389_1.duration_ = 10.8

		local var_389_0 = {
			ja = 10.8,
			ko = 7.466,
			zh = 7.466
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
				arg_389_0:Play222011097(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 0.8

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_2 = arg_389_1:FormatText(StoryNameCfg[410].name)

				arg_389_1.leftNameTxt_.text = var_392_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_3 = arg_389_1:GetWordFromCfg(222011096)
				local var_392_4 = arg_389_1:FormatText(var_392_3.content)

				arg_389_1.text_.text = var_392_4

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_5 = 32
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011096", "story_v_out_222011.awb") ~= 0 then
					local var_392_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011096", "story_v_out_222011.awb") / 1000

					if var_392_8 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_8 + var_392_0
					end

					if var_392_3.prefab_name ~= "" and arg_389_1.actors_[var_392_3.prefab_name] ~= nil then
						local var_392_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_389_1.actors_[var_392_3.prefab_name].transform, "story_v_out_222011", "222011096", "story_v_out_222011.awb")

						arg_389_1:RecordAudio("222011096", var_392_9)
						arg_389_1:RecordAudio("222011096", var_392_9)
					else
						arg_389_1:AudioAction("play", "voice", "story_v_out_222011", "222011096", "story_v_out_222011.awb")
					end

					arg_389_1:RecordHistoryTalkVoice("story_v_out_222011", "222011096", "story_v_out_222011.awb")
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
	Play222011097 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 222011097
		arg_393_1.duration_ = 9.066

		local var_393_0 = {
			ja = 9.066,
			ko = 7.1,
			zh = 7.1
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
				arg_393_0:Play222011098(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 1

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[465].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, true)
				arg_393_1.iconController_:SetSelectedState("hero")

				arg_393_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(222011097)
				local var_396_4 = arg_393_1:FormatText(var_396_3.content)

				arg_393_1.text_.text = var_396_4

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011097", "story_v_out_222011.awb") ~= 0 then
					local var_396_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011097", "story_v_out_222011.awb") / 1000

					if var_396_8 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_8 + var_396_0
					end

					if var_396_3.prefab_name ~= "" and arg_393_1.actors_[var_396_3.prefab_name] ~= nil then
						local var_396_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_3.prefab_name].transform, "story_v_out_222011", "222011097", "story_v_out_222011.awb")

						arg_393_1:RecordAudio("222011097", var_396_9)
						arg_393_1:RecordAudio("222011097", var_396_9)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_out_222011", "222011097", "story_v_out_222011.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_out_222011", "222011097", "story_v_out_222011.awb")
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
	Play222011098 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 222011098
		arg_397_1.duration_ = 7.4

		local var_397_0 = {
			ja = 7.4,
			ko = 7.033,
			zh = 7.033
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
				arg_397_0:Play222011099(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 1

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				local var_400_2 = "stop"
				local var_400_3 = "effect"

				arg_397_1:AudioAction(var_400_2, var_400_3, "se_story_v1_environment_crowd", "se_story_v1_environment_crowd", "")
			end

			local var_400_4 = 0
			local var_400_5 = 0.45

			if var_400_4 < arg_397_1.time_ and arg_397_1.time_ <= var_400_4 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_6 = arg_397_1:FormatText(StoryNameCfg[36].name)

				arg_397_1.leftNameTxt_.text = var_400_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, true)
				arg_397_1.iconController_:SetSelectedState("hero")

				arg_397_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10057")

				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_7 = arg_397_1:GetWordFromCfg(222011098)
				local var_400_8 = arg_397_1:FormatText(var_400_7.content)

				arg_397_1.text_.text = var_400_8

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_9 = 18
				local var_400_10 = utf8.len(var_400_8)
				local var_400_11 = var_400_9 <= 0 and var_400_5 or var_400_5 * (var_400_10 / var_400_9)

				if var_400_11 > 0 and var_400_5 < var_400_11 then
					arg_397_1.talkMaxDuration = var_400_11

					if var_400_11 + var_400_4 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_11 + var_400_4
					end
				end

				arg_397_1.text_.text = var_400_8
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011098", "story_v_out_222011.awb") ~= 0 then
					local var_400_12 = manager.audio:GetVoiceLength("story_v_out_222011", "222011098", "story_v_out_222011.awb") / 1000

					if var_400_12 + var_400_4 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_12 + var_400_4
					end

					if var_400_7.prefab_name ~= "" and arg_397_1.actors_[var_400_7.prefab_name] ~= nil then
						local var_400_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_397_1.actors_[var_400_7.prefab_name].transform, "story_v_out_222011", "222011098", "story_v_out_222011.awb")

						arg_397_1:RecordAudio("222011098", var_400_13)
						arg_397_1:RecordAudio("222011098", var_400_13)
					else
						arg_397_1:AudioAction("play", "voice", "story_v_out_222011", "222011098", "story_v_out_222011.awb")
					end

					arg_397_1:RecordHistoryTalkVoice("story_v_out_222011", "222011098", "story_v_out_222011.awb")
				end

				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_14 = math.max(var_400_5, arg_397_1.talkMaxDuration)

			if var_400_4 <= arg_397_1.time_ and arg_397_1.time_ < var_400_4 + var_400_14 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_4) / var_400_14

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_4 + var_400_14 and arg_397_1.time_ < var_400_4 + var_400_14 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play222011099 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 222011099
		arg_401_1.duration_ = 9

		SetActive(arg_401_1.tipsGo_, false)

		function arg_401_1.onSingleLineFinish_()
			arg_401_1.onSingleLineUpdate_ = nil
			arg_401_1.onSingleLineFinish_ = nil
			arg_401_1.state_ = "waiting"
		end

		function arg_401_1.playNext_(arg_403_0)
			if arg_403_0 == 1 then
				arg_401_0:Play222011100(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = 0

			if var_404_0 < arg_401_1.time_ and arg_401_1.time_ <= var_404_0 + arg_404_0 then
				arg_401_1.mask_.enabled = true
				arg_401_1.mask_.raycastTarget = true

				arg_401_1:SetGaussion(false)
			end

			local var_404_1 = 2

			if var_404_0 <= arg_401_1.time_ and arg_401_1.time_ < var_404_0 + var_404_1 then
				local var_404_2 = (arg_401_1.time_ - var_404_0) / var_404_1
				local var_404_3 = Color.New(0.02830189, 0.02830189, 0.02830189)

				var_404_3.a = Mathf.Lerp(0, 1, var_404_2)
				arg_401_1.mask_.color = var_404_3
			end

			if arg_401_1.time_ >= var_404_0 + var_404_1 and arg_401_1.time_ < var_404_0 + var_404_1 + arg_404_0 then
				local var_404_4 = Color.New(0.02830189, 0.02830189, 0.02830189)

				var_404_4.a = 1
				arg_401_1.mask_.color = var_404_4
			end

			local var_404_5 = 2

			if var_404_5 < arg_401_1.time_ and arg_401_1.time_ <= var_404_5 + arg_404_0 then
				arg_401_1.mask_.enabled = true
				arg_401_1.mask_.raycastTarget = true

				arg_401_1:SetGaussion(false)
			end

			local var_404_6 = 2

			if var_404_5 <= arg_401_1.time_ and arg_401_1.time_ < var_404_5 + var_404_6 then
				local var_404_7 = (arg_401_1.time_ - var_404_5) / var_404_6
				local var_404_8 = Color.New(0.02830189, 0.02830189, 0.02830189)

				var_404_8.a = Mathf.Lerp(1, 0, var_404_7)
				arg_401_1.mask_.color = var_404_8
			end

			if arg_401_1.time_ >= var_404_5 + var_404_6 and arg_401_1.time_ < var_404_5 + var_404_6 + arg_404_0 then
				local var_404_9 = Color.New(0.02830189, 0.02830189, 0.02830189)
				local var_404_10 = 0

				arg_401_1.mask_.enabled = false
				var_404_9.a = var_404_10
				arg_401_1.mask_.color = var_404_9
			end

			local var_404_11 = 2

			if var_404_11 < arg_401_1.time_ and arg_401_1.time_ <= var_404_11 + arg_404_0 then
				local var_404_12 = manager.ui.mainCamera.transform.localPosition
				local var_404_13 = Vector3.New(0, 0, 10) + Vector3.New(var_404_12.x, var_404_12.y, 0)
				local var_404_14 = arg_401_1.bgs_.ST47

				var_404_14.transform.localPosition = var_404_13
				var_404_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_404_15 = var_404_14:GetComponent("SpriteRenderer")

				if var_404_15 and var_404_15.sprite then
					local var_404_16 = (var_404_14.transform.localPosition - var_404_12).z
					local var_404_17 = manager.ui.mainCameraCom_
					local var_404_18 = 2 * var_404_16 * Mathf.Tan(var_404_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_404_19 = var_404_18 * var_404_17.aspect
					local var_404_20 = var_404_15.sprite.bounds.size.x
					local var_404_21 = var_404_15.sprite.bounds.size.y
					local var_404_22 = var_404_19 / var_404_20
					local var_404_23 = var_404_18 / var_404_21
					local var_404_24 = var_404_23 < var_404_22 and var_404_22 or var_404_23

					var_404_14.transform.localScale = Vector3.New(var_404_24, var_404_24, 0)
				end

				for iter_404_0, iter_404_1 in pairs(arg_401_1.bgs_) do
					if iter_404_0 ~= "ST47" then
						iter_404_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			if arg_401_1.frameCnt_ <= 1 then
				arg_401_1.dialog_:SetActive(false)
			end

			local var_404_25 = 4
			local var_404_26 = 1.35

			if var_404_25 < arg_401_1.time_ and arg_401_1.time_ <= var_404_25 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0

				arg_401_1.dialog_:SetActive(true)

				local var_404_27 = LeanTween.value(arg_401_1.dialog_, 0, 1, 0.3)

				var_404_27:setOnUpdate(LuaHelper.FloatAction(function(arg_405_0)
					arg_401_1.dialogCg_.alpha = arg_405_0
				end))
				var_404_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_401_1.dialog_)
					var_404_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_401_1.duration_ = arg_401_1.duration_ + 0.3

				SetActive(arg_401_1.leftNameGo_, false)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_28 = arg_401_1:GetWordFromCfg(222011099)
				local var_404_29 = arg_401_1:FormatText(var_404_28.content)

				arg_401_1.text_.text = var_404_29

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_30 = 52
				local var_404_31 = utf8.len(var_404_29)
				local var_404_32 = var_404_30 <= 0 and var_404_26 or var_404_26 * (var_404_31 / var_404_30)

				if var_404_32 > 0 and var_404_26 < var_404_32 then
					arg_401_1.talkMaxDuration = var_404_32
					var_404_25 = var_404_25 + 0.3

					if var_404_32 + var_404_25 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_32 + var_404_25
					end
				end

				arg_401_1.text_.text = var_404_29
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)
				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_33 = var_404_25 + 0.3
			local var_404_34 = math.max(var_404_26, arg_401_1.talkMaxDuration)

			if var_404_33 <= arg_401_1.time_ and arg_401_1.time_ < var_404_33 + var_404_34 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_33) / var_404_34

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_33 + var_404_34 and arg_401_1.time_ < var_404_33 + var_404_34 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play222011100 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 222011100
		arg_407_1.duration_ = 10.833

		local var_407_0 = {
			ja = 10.833,
			ko = 7.466,
			zh = 7.466
		}
		local var_407_1 = manager.audio:GetLocalizationFlag()

		if var_407_0[var_407_1] ~= nil then
			arg_407_1.duration_ = var_407_0[var_407_1]
		end

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play222011101(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = "10057ui_story"

			if arg_407_1.actors_[var_410_0] == nil then
				local var_410_1 = Object.Instantiate(Asset.Load("Char/" .. var_410_0), arg_407_1.stage_.transform)

				var_410_1.name = var_410_0
				var_410_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_407_1.actors_[var_410_0] = var_410_1

				local var_410_2 = var_410_1:GetComponentInChildren(typeof(CharacterEffect))

				var_410_2.enabled = true

				local var_410_3 = GameObjectTools.GetOrAddComponent(var_410_1, typeof(DynamicBoneHelper))

				if var_410_3 then
					var_410_3:EnableDynamicBone(false)
				end

				arg_407_1:ShowWeapon(var_410_2.transform, false)

				arg_407_1.var_[var_410_0 .. "Animator"] = var_410_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_407_1.var_[var_410_0 .. "Animator"].applyRootMotion = true
				arg_407_1.var_[var_410_0 .. "LipSync"] = var_410_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_410_4 = arg_407_1.actors_["10057ui_story"].transform
			local var_410_5 = 0

			if var_410_5 < arg_407_1.time_ and arg_407_1.time_ <= var_410_5 + arg_410_0 then
				arg_407_1.var_.moveOldPos10057ui_story = var_410_4.localPosition
			end

			local var_410_6 = 0.001

			if var_410_5 <= arg_407_1.time_ and arg_407_1.time_ < var_410_5 + var_410_6 then
				local var_410_7 = (arg_407_1.time_ - var_410_5) / var_410_6
				local var_410_8 = Vector3.New(-0.7, -1.13, -5.72)

				var_410_4.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos10057ui_story, var_410_8, var_410_7)

				local var_410_9 = manager.ui.mainCamera.transform.position - var_410_4.position

				var_410_4.forward = Vector3.New(var_410_9.x, var_410_9.y, var_410_9.z)

				local var_410_10 = var_410_4.localEulerAngles

				var_410_10.z = 0
				var_410_10.x = 0
				var_410_4.localEulerAngles = var_410_10
			end

			if arg_407_1.time_ >= var_410_5 + var_410_6 and arg_407_1.time_ < var_410_5 + var_410_6 + arg_410_0 then
				var_410_4.localPosition = Vector3.New(-0.7, -1.13, -5.72)

				local var_410_11 = manager.ui.mainCamera.transform.position - var_410_4.position

				var_410_4.forward = Vector3.New(var_410_11.x, var_410_11.y, var_410_11.z)

				local var_410_12 = var_410_4.localEulerAngles

				var_410_12.z = 0
				var_410_12.x = 0
				var_410_4.localEulerAngles = var_410_12
			end

			local var_410_13 = arg_407_1.actors_["10057ui_story"]
			local var_410_14 = 0

			if var_410_14 < arg_407_1.time_ and arg_407_1.time_ <= var_410_14 + arg_410_0 and arg_407_1.var_.characterEffect10057ui_story == nil then
				arg_407_1.var_.characterEffect10057ui_story = var_410_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_15 = 0.200000002980232

			if var_410_14 <= arg_407_1.time_ and arg_407_1.time_ < var_410_14 + var_410_15 then
				local var_410_16 = (arg_407_1.time_ - var_410_14) / var_410_15

				if arg_407_1.var_.characterEffect10057ui_story then
					arg_407_1.var_.characterEffect10057ui_story.fillFlat = false
				end
			end

			if arg_407_1.time_ >= var_410_14 + var_410_15 and arg_407_1.time_ < var_410_14 + var_410_15 + arg_410_0 and arg_407_1.var_.characterEffect10057ui_story then
				arg_407_1.var_.characterEffect10057ui_story.fillFlat = false
			end

			local var_410_17 = 0

			if var_410_17 < arg_407_1.time_ and arg_407_1.time_ <= var_410_17 + arg_410_0 then
				arg_407_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/story10057/story10057action/10057action1_1")
			end

			local var_410_18 = 0

			if var_410_18 < arg_407_1.time_ and arg_407_1.time_ <= var_410_18 + arg_410_0 then
				arg_407_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_410_19 = arg_407_1.actors_["1074ui_story"].transform
			local var_410_20 = 0

			if var_410_20 < arg_407_1.time_ and arg_407_1.time_ <= var_410_20 + arg_410_0 then
				arg_407_1.var_.moveOldPos1074ui_story = var_410_19.localPosition
			end

			local var_410_21 = 0.001

			if var_410_20 <= arg_407_1.time_ and arg_407_1.time_ < var_410_20 + var_410_21 then
				local var_410_22 = (arg_407_1.time_ - var_410_20) / var_410_21
				local var_410_23 = Vector3.New(0.7, -1.055, -6.12)

				var_410_19.localPosition = Vector3.Lerp(arg_407_1.var_.moveOldPos1074ui_story, var_410_23, var_410_22)

				local var_410_24 = manager.ui.mainCamera.transform.position - var_410_19.position

				var_410_19.forward = Vector3.New(var_410_24.x, var_410_24.y, var_410_24.z)

				local var_410_25 = var_410_19.localEulerAngles

				var_410_25.z = 0
				var_410_25.x = 0
				var_410_19.localEulerAngles = var_410_25
			end

			if arg_407_1.time_ >= var_410_20 + var_410_21 and arg_407_1.time_ < var_410_20 + var_410_21 + arg_410_0 then
				var_410_19.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_410_26 = manager.ui.mainCamera.transform.position - var_410_19.position

				var_410_19.forward = Vector3.New(var_410_26.x, var_410_26.y, var_410_26.z)

				local var_410_27 = var_410_19.localEulerAngles

				var_410_27.z = 0
				var_410_27.x = 0
				var_410_19.localEulerAngles = var_410_27
			end

			local var_410_28 = arg_407_1.actors_["1074ui_story"]
			local var_410_29 = 0

			if var_410_29 < arg_407_1.time_ and arg_407_1.time_ <= var_410_29 + arg_410_0 and arg_407_1.var_.characterEffect1074ui_story == nil then
				arg_407_1.var_.characterEffect1074ui_story = var_410_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_30 = 0.200000002980232

			if var_410_29 <= arg_407_1.time_ and arg_407_1.time_ < var_410_29 + var_410_30 then
				local var_410_31 = (arg_407_1.time_ - var_410_29) / var_410_30

				if arg_407_1.var_.characterEffect1074ui_story then
					local var_410_32 = Mathf.Lerp(0, 0.5, var_410_31)

					arg_407_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1074ui_story.fillRatio = var_410_32
				end
			end

			if arg_407_1.time_ >= var_410_29 + var_410_30 and arg_407_1.time_ < var_410_29 + var_410_30 + arg_410_0 and arg_407_1.var_.characterEffect1074ui_story then
				local var_410_33 = 0.5

				arg_407_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1074ui_story.fillRatio = var_410_33
			end

			local var_410_34 = 0
			local var_410_35 = 0.625

			if var_410_34 < arg_407_1.time_ and arg_407_1.time_ <= var_410_34 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_36 = arg_407_1:FormatText(StoryNameCfg[464].name)

				arg_407_1.leftNameTxt_.text = var_410_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_37 = arg_407_1:GetWordFromCfg(222011100)
				local var_410_38 = arg_407_1:FormatText(var_410_37.content)

				arg_407_1.text_.text = var_410_38

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_39 = 25
				local var_410_40 = utf8.len(var_410_38)
				local var_410_41 = var_410_39 <= 0 and var_410_35 or var_410_35 * (var_410_40 / var_410_39)

				if var_410_41 > 0 and var_410_35 < var_410_41 then
					arg_407_1.talkMaxDuration = var_410_41

					if var_410_41 + var_410_34 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_41 + var_410_34
					end
				end

				arg_407_1.text_.text = var_410_38
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011100", "story_v_out_222011.awb") ~= 0 then
					local var_410_42 = manager.audio:GetVoiceLength("story_v_out_222011", "222011100", "story_v_out_222011.awb") / 1000

					if var_410_42 + var_410_34 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_42 + var_410_34
					end

					if var_410_37.prefab_name ~= "" and arg_407_1.actors_[var_410_37.prefab_name] ~= nil then
						local var_410_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_37.prefab_name].transform, "story_v_out_222011", "222011100", "story_v_out_222011.awb")

						arg_407_1:RecordAudio("222011100", var_410_43)
						arg_407_1:RecordAudio("222011100", var_410_43)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_222011", "222011100", "story_v_out_222011.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_222011", "222011100", "story_v_out_222011.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_44 = math.max(var_410_35, arg_407_1.talkMaxDuration)

			if var_410_34 <= arg_407_1.time_ and arg_407_1.time_ < var_410_34 + var_410_44 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_34) / var_410_44

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_34 + var_410_44 and arg_407_1.time_ < var_410_34 + var_410_44 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play222011101 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 222011101
		arg_411_1.duration_ = 17.633

		local var_411_0 = {
			ja = 17.633,
			ko = 10.6,
			zh = 10.6
		}
		local var_411_1 = manager.audio:GetLocalizationFlag()

		if var_411_0[var_411_1] ~= nil then
			arg_411_1.duration_ = var_411_0[var_411_1]
		end

		SetActive(arg_411_1.tipsGo_, false)

		function arg_411_1.onSingleLineFinish_()
			arg_411_1.onSingleLineUpdate_ = nil
			arg_411_1.onSingleLineFinish_ = nil
			arg_411_1.state_ = "waiting"
		end

		function arg_411_1.playNext_(arg_413_0)
			if arg_413_0 == 1 then
				arg_411_0:Play222011102(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = 0
			local var_414_1 = 0.85

			if var_414_0 < arg_411_1.time_ and arg_411_1.time_ <= var_414_0 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_2 = arg_411_1:FormatText(StoryNameCfg[464].name)

				arg_411_1.leftNameTxt_.text = var_414_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_3 = arg_411_1:GetWordFromCfg(222011101)
				local var_414_4 = arg_411_1:FormatText(var_414_3.content)

				arg_411_1.text_.text = var_414_4

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_5 = 34
				local var_414_6 = utf8.len(var_414_4)
				local var_414_7 = var_414_5 <= 0 and var_414_1 or var_414_1 * (var_414_6 / var_414_5)

				if var_414_7 > 0 and var_414_1 < var_414_7 then
					arg_411_1.talkMaxDuration = var_414_7

					if var_414_7 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_7 + var_414_0
					end
				end

				arg_411_1.text_.text = var_414_4
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011101", "story_v_out_222011.awb") ~= 0 then
					local var_414_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011101", "story_v_out_222011.awb") / 1000

					if var_414_8 + var_414_0 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_8 + var_414_0
					end

					if var_414_3.prefab_name ~= "" and arg_411_1.actors_[var_414_3.prefab_name] ~= nil then
						local var_414_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_3.prefab_name].transform, "story_v_out_222011", "222011101", "story_v_out_222011.awb")

						arg_411_1:RecordAudio("222011101", var_414_9)
						arg_411_1:RecordAudio("222011101", var_414_9)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_222011", "222011101", "story_v_out_222011.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_222011", "222011101", "story_v_out_222011.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_10 = math.max(var_414_1, arg_411_1.talkMaxDuration)

			if var_414_0 <= arg_411_1.time_ and arg_411_1.time_ < var_414_0 + var_414_10 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_0) / var_414_10

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_0 + var_414_10 and arg_411_1.time_ < var_414_0 + var_414_10 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play222011102 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 222011102
		arg_415_1.duration_ = 18.7

		local var_415_0 = {
			ja = 18.7,
			ko = 6.8,
			zh = 6.8
		}
		local var_415_1 = manager.audio:GetLocalizationFlag()

		if var_415_0[var_415_1] ~= nil then
			arg_415_1.duration_ = var_415_0[var_415_1]
		end

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play222011103(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = arg_415_1.actors_["1074ui_story"]
			local var_418_1 = 0

			if var_418_1 < arg_415_1.time_ and arg_415_1.time_ <= var_418_1 + arg_418_0 and arg_415_1.var_.characterEffect1074ui_story == nil then
				arg_415_1.var_.characterEffect1074ui_story = var_418_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_2 = 0.200000002980232

			if var_418_1 <= arg_415_1.time_ and arg_415_1.time_ < var_418_1 + var_418_2 then
				local var_418_3 = (arg_415_1.time_ - var_418_1) / var_418_2

				if arg_415_1.var_.characterEffect1074ui_story then
					arg_415_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_415_1.time_ >= var_418_1 + var_418_2 and arg_415_1.time_ < var_418_1 + var_418_2 + arg_418_0 and arg_415_1.var_.characterEffect1074ui_story then
				arg_415_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_418_4 = 0

			if var_418_4 < arg_415_1.time_ and arg_415_1.time_ <= var_418_4 + arg_418_0 then
				arg_415_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_418_5 = 0

			if var_418_5 < arg_415_1.time_ and arg_415_1.time_ <= var_418_5 + arg_418_0 then
				arg_415_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_418_6 = arg_415_1.actors_["10057ui_story"]
			local var_418_7 = 0

			if var_418_7 < arg_415_1.time_ and arg_415_1.time_ <= var_418_7 + arg_418_0 and arg_415_1.var_.characterEffect10057ui_story == nil then
				arg_415_1.var_.characterEffect10057ui_story = var_418_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_418_8 = 0.200000002980232

			if var_418_7 <= arg_415_1.time_ and arg_415_1.time_ < var_418_7 + var_418_8 then
				local var_418_9 = (arg_415_1.time_ - var_418_7) / var_418_8

				if arg_415_1.var_.characterEffect10057ui_story then
					local var_418_10 = Mathf.Lerp(0, 0.5, var_418_9)

					arg_415_1.var_.characterEffect10057ui_story.fillFlat = true
					arg_415_1.var_.characterEffect10057ui_story.fillRatio = var_418_10
				end
			end

			if arg_415_1.time_ >= var_418_7 + var_418_8 and arg_415_1.time_ < var_418_7 + var_418_8 + arg_418_0 and arg_415_1.var_.characterEffect10057ui_story then
				local var_418_11 = 0.5

				arg_415_1.var_.characterEffect10057ui_story.fillFlat = true
				arg_415_1.var_.characterEffect10057ui_story.fillRatio = var_418_11
			end

			local var_418_12 = 0
			local var_418_13 = 0.7

			if var_418_12 < arg_415_1.time_ and arg_415_1.time_ <= var_418_12 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0
				arg_415_1.dialogCg_.alpha = 1

				arg_415_1.dialog_:SetActive(true)
				SetActive(arg_415_1.leftNameGo_, true)

				local var_418_14 = arg_415_1:FormatText(StoryNameCfg[410].name)

				arg_415_1.leftNameTxt_.text = var_418_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_415_1.leftNameTxt_.transform)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1.leftNameTxt_.text)
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_15 = arg_415_1:GetWordFromCfg(222011102)
				local var_418_16 = arg_415_1:FormatText(var_418_15.content)

				arg_415_1.text_.text = var_418_16

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_17 = 28
				local var_418_18 = utf8.len(var_418_16)
				local var_418_19 = var_418_17 <= 0 and var_418_13 or var_418_13 * (var_418_18 / var_418_17)

				if var_418_19 > 0 and var_418_13 < var_418_19 then
					arg_415_1.talkMaxDuration = var_418_19

					if var_418_19 + var_418_12 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_19 + var_418_12
					end
				end

				arg_415_1.text_.text = var_418_16
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011102", "story_v_out_222011.awb") ~= 0 then
					local var_418_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011102", "story_v_out_222011.awb") / 1000

					if var_418_20 + var_418_12 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_20 + var_418_12
					end

					if var_418_15.prefab_name ~= "" and arg_415_1.actors_[var_418_15.prefab_name] ~= nil then
						local var_418_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_415_1.actors_[var_418_15.prefab_name].transform, "story_v_out_222011", "222011102", "story_v_out_222011.awb")

						arg_415_1:RecordAudio("222011102", var_418_21)
						arg_415_1:RecordAudio("222011102", var_418_21)
					else
						arg_415_1:AudioAction("play", "voice", "story_v_out_222011", "222011102", "story_v_out_222011.awb")
					end

					arg_415_1:RecordHistoryTalkVoice("story_v_out_222011", "222011102", "story_v_out_222011.awb")
				end

				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_22 = math.max(var_418_13, arg_415_1.talkMaxDuration)

			if var_418_12 <= arg_415_1.time_ and arg_415_1.time_ < var_418_12 + var_418_22 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_12) / var_418_22

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_12 + var_418_22 and arg_415_1.time_ < var_418_12 + var_418_22 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play222011103 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 222011103
		arg_419_1.duration_ = 11.8

		local var_419_0 = {
			ja = 11.8,
			ko = 7.066,
			zh = 7.066
		}
		local var_419_1 = manager.audio:GetLocalizationFlag()

		if var_419_0[var_419_1] ~= nil then
			arg_419_1.duration_ = var_419_0[var_419_1]
		end

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play222011104(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 0.775

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, true)

				local var_422_2 = arg_419_1:FormatText(StoryNameCfg[410].name)

				arg_419_1.leftNameTxt_.text = var_422_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_419_1.leftNameTxt_.transform)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1.leftNameTxt_.text)
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_3 = arg_419_1:GetWordFromCfg(222011103)
				local var_422_4 = arg_419_1:FormatText(var_422_3.content)

				arg_419_1.text_.text = var_422_4

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_5 = 31
				local var_422_6 = utf8.len(var_422_4)
				local var_422_7 = var_422_5 <= 0 and var_422_1 or var_422_1 * (var_422_6 / var_422_5)

				if var_422_7 > 0 and var_422_1 < var_422_7 then
					arg_419_1.talkMaxDuration = var_422_7

					if var_422_7 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_7 + var_422_0
					end
				end

				arg_419_1.text_.text = var_422_4
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011103", "story_v_out_222011.awb") ~= 0 then
					local var_422_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011103", "story_v_out_222011.awb") / 1000

					if var_422_8 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_8 + var_422_0
					end

					if var_422_3.prefab_name ~= "" and arg_419_1.actors_[var_422_3.prefab_name] ~= nil then
						local var_422_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_419_1.actors_[var_422_3.prefab_name].transform, "story_v_out_222011", "222011103", "story_v_out_222011.awb")

						arg_419_1:RecordAudio("222011103", var_422_9)
						arg_419_1:RecordAudio("222011103", var_422_9)
					else
						arg_419_1:AudioAction("play", "voice", "story_v_out_222011", "222011103", "story_v_out_222011.awb")
					end

					arg_419_1:RecordHistoryTalkVoice("story_v_out_222011", "222011103", "story_v_out_222011.awb")
				end

				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_10 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_10 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_10

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_10 and arg_419_1.time_ < var_422_0 + var_422_10 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play222011104 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 222011104
		arg_423_1.duration_ = 8.966

		local var_423_0 = {
			ja = 8.966,
			ko = 4.1,
			zh = 4.1
		}
		local var_423_1 = manager.audio:GetLocalizationFlag()

		if var_423_0[var_423_1] ~= nil then
			arg_423_1.duration_ = var_423_0[var_423_1]
		end

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play222011105(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = arg_423_1.actors_["10057ui_story"]
			local var_426_1 = 0

			if var_426_1 < arg_423_1.time_ and arg_423_1.time_ <= var_426_1 + arg_426_0 and arg_423_1.var_.characterEffect10057ui_story == nil then
				arg_423_1.var_.characterEffect10057ui_story = var_426_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_2 = 0.200000002980232

			if var_426_1 <= arg_423_1.time_ and arg_423_1.time_ < var_426_1 + var_426_2 then
				local var_426_3 = (arg_423_1.time_ - var_426_1) / var_426_2

				if arg_423_1.var_.characterEffect10057ui_story then
					arg_423_1.var_.characterEffect10057ui_story.fillFlat = false
				end
			end

			if arg_423_1.time_ >= var_426_1 + var_426_2 and arg_423_1.time_ < var_426_1 + var_426_2 + arg_426_0 and arg_423_1.var_.characterEffect10057ui_story then
				arg_423_1.var_.characterEffect10057ui_story.fillFlat = false
			end

			local var_426_4 = 0

			if var_426_4 < arg_423_1.time_ and arg_423_1.time_ <= var_426_4 + arg_426_0 then
				arg_423_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/story10057/story10057action/10057action1_1")
			end

			local var_426_5 = 0

			if var_426_5 < arg_423_1.time_ and arg_423_1.time_ <= var_426_5 + arg_426_0 then
				arg_423_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_426_6 = arg_423_1.actors_["1074ui_story"]
			local var_426_7 = 0

			if var_426_7 < arg_423_1.time_ and arg_423_1.time_ <= var_426_7 + arg_426_0 and arg_423_1.var_.characterEffect1074ui_story == nil then
				arg_423_1.var_.characterEffect1074ui_story = var_426_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_426_8 = 0.200000002980232

			if var_426_7 <= arg_423_1.time_ and arg_423_1.time_ < var_426_7 + var_426_8 then
				local var_426_9 = (arg_423_1.time_ - var_426_7) / var_426_8

				if arg_423_1.var_.characterEffect1074ui_story then
					local var_426_10 = Mathf.Lerp(0, 0.5, var_426_9)

					arg_423_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_423_1.var_.characterEffect1074ui_story.fillRatio = var_426_10
				end
			end

			if arg_423_1.time_ >= var_426_7 + var_426_8 and arg_423_1.time_ < var_426_7 + var_426_8 + arg_426_0 and arg_423_1.var_.characterEffect1074ui_story then
				local var_426_11 = 0.5

				arg_423_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_423_1.var_.characterEffect1074ui_story.fillRatio = var_426_11
			end

			local var_426_12 = 0
			local var_426_13 = 0.25

			if var_426_12 < arg_423_1.time_ and arg_423_1.time_ <= var_426_12 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, true)

				local var_426_14 = arg_423_1:FormatText(StoryNameCfg[464].name)

				arg_423_1.leftNameTxt_.text = var_426_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_423_1.leftNameTxt_.transform)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1.leftNameTxt_.text)
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_15 = arg_423_1:GetWordFromCfg(222011104)
				local var_426_16 = arg_423_1:FormatText(var_426_15.content)

				arg_423_1.text_.text = var_426_16

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_17 = 10
				local var_426_18 = utf8.len(var_426_16)
				local var_426_19 = var_426_17 <= 0 and var_426_13 or var_426_13 * (var_426_18 / var_426_17)

				if var_426_19 > 0 and var_426_13 < var_426_19 then
					arg_423_1.talkMaxDuration = var_426_19

					if var_426_19 + var_426_12 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_19 + var_426_12
					end
				end

				arg_423_1.text_.text = var_426_16
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011104", "story_v_out_222011.awb") ~= 0 then
					local var_426_20 = manager.audio:GetVoiceLength("story_v_out_222011", "222011104", "story_v_out_222011.awb") / 1000

					if var_426_20 + var_426_12 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_20 + var_426_12
					end

					if var_426_15.prefab_name ~= "" and arg_423_1.actors_[var_426_15.prefab_name] ~= nil then
						local var_426_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_423_1.actors_[var_426_15.prefab_name].transform, "story_v_out_222011", "222011104", "story_v_out_222011.awb")

						arg_423_1:RecordAudio("222011104", var_426_21)
						arg_423_1:RecordAudio("222011104", var_426_21)
					else
						arg_423_1:AudioAction("play", "voice", "story_v_out_222011", "222011104", "story_v_out_222011.awb")
					end

					arg_423_1:RecordHistoryTalkVoice("story_v_out_222011", "222011104", "story_v_out_222011.awb")
				end

				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_22 = math.max(var_426_13, arg_423_1.talkMaxDuration)

			if var_426_12 <= arg_423_1.time_ and arg_423_1.time_ < var_426_12 + var_426_22 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_12) / var_426_22

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_12 + var_426_22 and arg_423_1.time_ < var_426_12 + var_426_22 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play222011105 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 222011105
		arg_427_1.duration_ = 2.833

		local var_427_0 = {
			ja = 2,
			ko = 2.833,
			zh = 2.833
		}
		local var_427_1 = manager.audio:GetLocalizationFlag()

		if var_427_0[var_427_1] ~= nil then
			arg_427_1.duration_ = var_427_0[var_427_1]
		end

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play222011106(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = arg_427_1.actors_["10057ui_story"]
			local var_430_1 = 0

			if var_430_1 < arg_427_1.time_ and arg_427_1.time_ <= var_430_1 + arg_430_0 and arg_427_1.var_.characterEffect10057ui_story == nil then
				arg_427_1.var_.characterEffect10057ui_story = var_430_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_430_2 = 0.200000002980232

			if var_430_1 <= arg_427_1.time_ and arg_427_1.time_ < var_430_1 + var_430_2 then
				local var_430_3 = (arg_427_1.time_ - var_430_1) / var_430_2

				if arg_427_1.var_.characterEffect10057ui_story then
					local var_430_4 = Mathf.Lerp(0, 0.5, var_430_3)

					arg_427_1.var_.characterEffect10057ui_story.fillFlat = true
					arg_427_1.var_.characterEffect10057ui_story.fillRatio = var_430_4
				end
			end

			if arg_427_1.time_ >= var_430_1 + var_430_2 and arg_427_1.time_ < var_430_1 + var_430_2 + arg_430_0 and arg_427_1.var_.characterEffect10057ui_story then
				local var_430_5 = 0.5

				arg_427_1.var_.characterEffect10057ui_story.fillFlat = true
				arg_427_1.var_.characterEffect10057ui_story.fillRatio = var_430_5
			end

			local var_430_6 = 0
			local var_430_7 = 0.275

			if var_430_6 < arg_427_1.time_ and arg_427_1.time_ <= var_430_6 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, true)

				local var_430_8 = arg_427_1:FormatText(StoryNameCfg[465].name)

				arg_427_1.leftNameTxt_.text = var_430_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_427_1.leftNameTxt_.transform)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1.leftNameTxt_.text)
				SetActive(arg_427_1.iconTrs_.gameObject, true)
				arg_427_1.iconController_:SetSelectedState("hero")

				arg_427_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_9 = arg_427_1:GetWordFromCfg(222011105)
				local var_430_10 = arg_427_1:FormatText(var_430_9.content)

				arg_427_1.text_.text = var_430_10

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_11 = 11
				local var_430_12 = utf8.len(var_430_10)
				local var_430_13 = var_430_11 <= 0 and var_430_7 or var_430_7 * (var_430_12 / var_430_11)

				if var_430_13 > 0 and var_430_7 < var_430_13 then
					arg_427_1.talkMaxDuration = var_430_13

					if var_430_13 + var_430_6 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_13 + var_430_6
					end
				end

				arg_427_1.text_.text = var_430_10
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011105", "story_v_out_222011.awb") ~= 0 then
					local var_430_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011105", "story_v_out_222011.awb") / 1000

					if var_430_14 + var_430_6 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_14 + var_430_6
					end

					if var_430_9.prefab_name ~= "" and arg_427_1.actors_[var_430_9.prefab_name] ~= nil then
						local var_430_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_427_1.actors_[var_430_9.prefab_name].transform, "story_v_out_222011", "222011105", "story_v_out_222011.awb")

						arg_427_1:RecordAudio("222011105", var_430_15)
						arg_427_1:RecordAudio("222011105", var_430_15)
					else
						arg_427_1:AudioAction("play", "voice", "story_v_out_222011", "222011105", "story_v_out_222011.awb")
					end

					arg_427_1:RecordHistoryTalkVoice("story_v_out_222011", "222011105", "story_v_out_222011.awb")
				end

				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_16 = math.max(var_430_7, arg_427_1.talkMaxDuration)

			if var_430_6 <= arg_427_1.time_ and arg_427_1.time_ < var_430_6 + var_430_16 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_6) / var_430_16

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_6 + var_430_16 and arg_427_1.time_ < var_430_6 + var_430_16 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play222011106 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 222011106
		arg_431_1.duration_ = 21.3

		local var_431_0 = {
			ja = 21.3,
			ko = 13.966,
			zh = 13.966
		}
		local var_431_1 = manager.audio:GetLocalizationFlag()

		if var_431_0[var_431_1] ~= nil then
			arg_431_1.duration_ = var_431_0[var_431_1]
		end

		SetActive(arg_431_1.tipsGo_, false)

		function arg_431_1.onSingleLineFinish_()
			arg_431_1.onSingleLineUpdate_ = nil
			arg_431_1.onSingleLineFinish_ = nil
			arg_431_1.state_ = "waiting"
		end

		function arg_431_1.playNext_(arg_433_0)
			if arg_433_0 == 1 then
				arg_431_0:Play222011107(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = arg_431_1.actors_["10057ui_story"]
			local var_434_1 = 0

			if var_434_1 < arg_431_1.time_ and arg_431_1.time_ <= var_434_1 + arg_434_0 and arg_431_1.var_.characterEffect10057ui_story == nil then
				arg_431_1.var_.characterEffect10057ui_story = var_434_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_434_2 = 0.200000002980232

			if var_434_1 <= arg_431_1.time_ and arg_431_1.time_ < var_434_1 + var_434_2 then
				local var_434_3 = (arg_431_1.time_ - var_434_1) / var_434_2

				if arg_431_1.var_.characterEffect10057ui_story then
					arg_431_1.var_.characterEffect10057ui_story.fillFlat = false
				end
			end

			if arg_431_1.time_ >= var_434_1 + var_434_2 and arg_431_1.time_ < var_434_1 + var_434_2 + arg_434_0 and arg_431_1.var_.characterEffect10057ui_story then
				arg_431_1.var_.characterEffect10057ui_story.fillFlat = false
			end

			local var_434_4 = 0

			if var_434_4 < arg_431_1.time_ and arg_431_1.time_ <= var_434_4 + arg_434_0 then
				arg_431_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/story10057/story10057action/10057action1_1")
			end

			local var_434_5 = 0

			if var_434_5 < arg_431_1.time_ and arg_431_1.time_ <= var_434_5 + arg_434_0 then
				arg_431_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_434_6 = 0
			local var_434_7 = 1.3

			if var_434_6 < arg_431_1.time_ and arg_431_1.time_ <= var_434_6 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_8 = arg_431_1:FormatText(StoryNameCfg[464].name)

				arg_431_1.leftNameTxt_.text = var_434_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, false)
				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_9 = arg_431_1:GetWordFromCfg(222011106)
				local var_434_10 = arg_431_1:FormatText(var_434_9.content)

				arg_431_1.text_.text = var_434_10

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_11 = 52
				local var_434_12 = utf8.len(var_434_10)
				local var_434_13 = var_434_11 <= 0 and var_434_7 or var_434_7 * (var_434_12 / var_434_11)

				if var_434_13 > 0 and var_434_7 < var_434_13 then
					arg_431_1.talkMaxDuration = var_434_13

					if var_434_13 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_13 + var_434_6
					end
				end

				arg_431_1.text_.text = var_434_10
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011106", "story_v_out_222011.awb") ~= 0 then
					local var_434_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011106", "story_v_out_222011.awb") / 1000

					if var_434_14 + var_434_6 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_14 + var_434_6
					end

					if var_434_9.prefab_name ~= "" and arg_431_1.actors_[var_434_9.prefab_name] ~= nil then
						local var_434_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_9.prefab_name].transform, "story_v_out_222011", "222011106", "story_v_out_222011.awb")

						arg_431_1:RecordAudio("222011106", var_434_15)
						arg_431_1:RecordAudio("222011106", var_434_15)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_out_222011", "222011106", "story_v_out_222011.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_out_222011", "222011106", "story_v_out_222011.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_16 = math.max(var_434_7, arg_431_1.talkMaxDuration)

			if var_434_6 <= arg_431_1.time_ and arg_431_1.time_ < var_434_6 + var_434_16 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_6) / var_434_16

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_6 + var_434_16 and arg_431_1.time_ < var_434_6 + var_434_16 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play222011107 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 222011107
		arg_435_1.duration_ = 19.633

		local var_435_0 = {
			ja = 19.633,
			ko = 18.066,
			zh = 18.066
		}
		local var_435_1 = manager.audio:GetLocalizationFlag()

		if var_435_0[var_435_1] ~= nil then
			arg_435_1.duration_ = var_435_0[var_435_1]
		end

		SetActive(arg_435_1.tipsGo_, false)

		function arg_435_1.onSingleLineFinish_()
			arg_435_1.onSingleLineUpdate_ = nil
			arg_435_1.onSingleLineFinish_ = nil
			arg_435_1.state_ = "waiting"
		end

		function arg_435_1.playNext_(arg_437_0)
			if arg_437_0 == 1 then
				arg_435_0:Play222011108(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = 0
			local var_438_1 = 1.65

			if var_438_0 < arg_435_1.time_ and arg_435_1.time_ <= var_438_0 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_2 = arg_435_1:FormatText(StoryNameCfg[464].name)

				arg_435_1.leftNameTxt_.text = var_438_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_3 = arg_435_1:GetWordFromCfg(222011107)
				local var_438_4 = arg_435_1:FormatText(var_438_3.content)

				arg_435_1.text_.text = var_438_4

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_5 = 66
				local var_438_6 = utf8.len(var_438_4)
				local var_438_7 = var_438_5 <= 0 and var_438_1 or var_438_1 * (var_438_6 / var_438_5)

				if var_438_7 > 0 and var_438_1 < var_438_7 then
					arg_435_1.talkMaxDuration = var_438_7

					if var_438_7 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_7 + var_438_0
					end
				end

				arg_435_1.text_.text = var_438_4
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011107", "story_v_out_222011.awb") ~= 0 then
					local var_438_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011107", "story_v_out_222011.awb") / 1000

					if var_438_8 + var_438_0 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_8 + var_438_0
					end

					if var_438_3.prefab_name ~= "" and arg_435_1.actors_[var_438_3.prefab_name] ~= nil then
						local var_438_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_3.prefab_name].transform, "story_v_out_222011", "222011107", "story_v_out_222011.awb")

						arg_435_1:RecordAudio("222011107", var_438_9)
						arg_435_1:RecordAudio("222011107", var_438_9)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_out_222011", "222011107", "story_v_out_222011.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_out_222011", "222011107", "story_v_out_222011.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_10 = math.max(var_438_1, arg_435_1.talkMaxDuration)

			if var_438_0 <= arg_435_1.time_ and arg_435_1.time_ < var_438_0 + var_438_10 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_0) / var_438_10

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_0 + var_438_10 and arg_435_1.time_ < var_438_0 + var_438_10 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play222011108 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 222011108
		arg_439_1.duration_ = 26.066

		local var_439_0 = {
			ja = 26.066,
			ko = 16.466,
			zh = 16.466
		}
		local var_439_1 = manager.audio:GetLocalizationFlag()

		if var_439_0[var_439_1] ~= nil then
			arg_439_1.duration_ = var_439_0[var_439_1]
		end

		SetActive(arg_439_1.tipsGo_, false)

		function arg_439_1.onSingleLineFinish_()
			arg_439_1.onSingleLineUpdate_ = nil
			arg_439_1.onSingleLineFinish_ = nil
			arg_439_1.state_ = "waiting"
		end

		function arg_439_1.playNext_(arg_441_0)
			if arg_441_0 == 1 then
				arg_439_0:Play222011109(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = 0

			if var_442_0 < arg_439_1.time_ and arg_439_1.time_ <= var_442_0 + arg_442_0 then
				arg_439_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/story10057/story10057action/10057action5_1")
			end

			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 then
				arg_439_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_442_2 = 0
			local var_442_3 = 1.575

			if var_442_2 < arg_439_1.time_ and arg_439_1.time_ <= var_442_2 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_4 = arg_439_1:FormatText(StoryNameCfg[464].name)

				arg_439_1.leftNameTxt_.text = var_442_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_5 = arg_439_1:GetWordFromCfg(222011108)
				local var_442_6 = arg_439_1:FormatText(var_442_5.content)

				arg_439_1.text_.text = var_442_6

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_7 = 63
				local var_442_8 = utf8.len(var_442_6)
				local var_442_9 = var_442_7 <= 0 and var_442_3 or var_442_3 * (var_442_8 / var_442_7)

				if var_442_9 > 0 and var_442_3 < var_442_9 then
					arg_439_1.talkMaxDuration = var_442_9

					if var_442_9 + var_442_2 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_9 + var_442_2
					end
				end

				arg_439_1.text_.text = var_442_6
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011108", "story_v_out_222011.awb") ~= 0 then
					local var_442_10 = manager.audio:GetVoiceLength("story_v_out_222011", "222011108", "story_v_out_222011.awb") / 1000

					if var_442_10 + var_442_2 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_10 + var_442_2
					end

					if var_442_5.prefab_name ~= "" and arg_439_1.actors_[var_442_5.prefab_name] ~= nil then
						local var_442_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_5.prefab_name].transform, "story_v_out_222011", "222011108", "story_v_out_222011.awb")

						arg_439_1:RecordAudio("222011108", var_442_11)
						arg_439_1:RecordAudio("222011108", var_442_11)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_222011", "222011108", "story_v_out_222011.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_222011", "222011108", "story_v_out_222011.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_12 = math.max(var_442_3, arg_439_1.talkMaxDuration)

			if var_442_2 <= arg_439_1.time_ and arg_439_1.time_ < var_442_2 + var_442_12 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_2) / var_442_12

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_2 + var_442_12 and arg_439_1.time_ < var_442_2 + var_442_12 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play222011109 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 222011109
		arg_443_1.duration_ = 11.8

		local var_443_0 = {
			ja = 11.8,
			ko = 6.666,
			zh = 6.666
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
				arg_443_0:Play222011110(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["10057ui_story"]
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 and arg_443_1.var_.characterEffect10057ui_story == nil then
				arg_443_1.var_.characterEffect10057ui_story = var_446_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_2 = 0.200000002980232

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2

				if arg_443_1.var_.characterEffect10057ui_story then
					local var_446_4 = Mathf.Lerp(0, 0.5, var_446_3)

					arg_443_1.var_.characterEffect10057ui_story.fillFlat = true
					arg_443_1.var_.characterEffect10057ui_story.fillRatio = var_446_4
				end
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 and arg_443_1.var_.characterEffect10057ui_story then
				local var_446_5 = 0.5

				arg_443_1.var_.characterEffect10057ui_story.fillFlat = true
				arg_443_1.var_.characterEffect10057ui_story.fillRatio = var_446_5
			end

			local var_446_6 = 0
			local var_446_7 = 0.75

			if var_446_6 < arg_443_1.time_ and arg_443_1.time_ <= var_446_6 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_8 = arg_443_1:FormatText(StoryNameCfg[466].name)

				arg_443_1.leftNameTxt_.text = var_446_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, true)
				arg_443_1.iconController_:SetSelectedState("hero")

				arg_443_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_9 = arg_443_1:GetWordFromCfg(222011109)
				local var_446_10 = arg_443_1:FormatText(var_446_9.content)

				arg_443_1.text_.text = var_446_10

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_11 = 30
				local var_446_12 = utf8.len(var_446_10)
				local var_446_13 = var_446_11 <= 0 and var_446_7 or var_446_7 * (var_446_12 / var_446_11)

				if var_446_13 > 0 and var_446_7 < var_446_13 then
					arg_443_1.talkMaxDuration = var_446_13

					if var_446_13 + var_446_6 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_13 + var_446_6
					end
				end

				arg_443_1.text_.text = var_446_10
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011109", "story_v_out_222011.awb") ~= 0 then
					local var_446_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011109", "story_v_out_222011.awb") / 1000

					if var_446_14 + var_446_6 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_14 + var_446_6
					end

					if var_446_9.prefab_name ~= "" and arg_443_1.actors_[var_446_9.prefab_name] ~= nil then
						local var_446_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_9.prefab_name].transform, "story_v_out_222011", "222011109", "story_v_out_222011.awb")

						arg_443_1:RecordAudio("222011109", var_446_15)
						arg_443_1:RecordAudio("222011109", var_446_15)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_222011", "222011109", "story_v_out_222011.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_222011", "222011109", "story_v_out_222011.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_16 = math.max(var_446_7, arg_443_1.talkMaxDuration)

			if var_446_6 <= arg_443_1.time_ and arg_443_1.time_ < var_446_6 + var_446_16 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_6) / var_446_16

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_6 + var_446_16 and arg_443_1.time_ < var_446_6 + var_446_16 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play222011110 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 222011110
		arg_447_1.duration_ = 8.966

		local var_447_0 = {
			ja = 8.966,
			ko = 4.966,
			zh = 4.966
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
				arg_447_0:Play222011111(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.625

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[466].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, true)
				arg_447_1.iconController_:SetSelectedState("hero")

				arg_447_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(222011110)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 25
				local var_450_6 = utf8.len(var_450_4)
				local var_450_7 = var_450_5 <= 0 and var_450_1 or var_450_1 * (var_450_6 / var_450_5)

				if var_450_7 > 0 and var_450_1 < var_450_7 then
					arg_447_1.talkMaxDuration = var_450_7

					if var_450_7 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_7 + var_450_0
					end
				end

				arg_447_1.text_.text = var_450_4
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011110", "story_v_out_222011.awb") ~= 0 then
					local var_450_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011110", "story_v_out_222011.awb") / 1000

					if var_450_8 + var_450_0 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_8 + var_450_0
					end

					if var_450_3.prefab_name ~= "" and arg_447_1.actors_[var_450_3.prefab_name] ~= nil then
						local var_450_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_3.prefab_name].transform, "story_v_out_222011", "222011110", "story_v_out_222011.awb")

						arg_447_1:RecordAudio("222011110", var_450_9)
						arg_447_1:RecordAudio("222011110", var_450_9)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_222011", "222011110", "story_v_out_222011.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_222011", "222011110", "story_v_out_222011.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_10 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_10 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_10

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_10 and arg_447_1.time_ < var_450_0 + var_450_10 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play222011111 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 222011111
		arg_451_1.duration_ = 16.133

		local var_451_0 = {
			ja = 16.133,
			ko = 10.7,
			zh = 10.7
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
				arg_451_0:Play222011112(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["10057ui_story"]
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 and arg_451_1.var_.characterEffect10057ui_story == nil then
				arg_451_1.var_.characterEffect10057ui_story = var_454_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_454_2 = 0.200000002980232

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2

				if arg_451_1.var_.characterEffect10057ui_story then
					arg_451_1.var_.characterEffect10057ui_story.fillFlat = false
				end
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 and arg_451_1.var_.characterEffect10057ui_story then
				arg_451_1.var_.characterEffect10057ui_story.fillFlat = false
			end

			local var_454_4 = 0

			if var_454_4 < arg_451_1.time_ and arg_451_1.time_ <= var_454_4 + arg_454_0 then
				arg_451_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/story10057/story10057actionlink/10057action454")
			end

			local var_454_5 = 0

			if var_454_5 < arg_451_1.time_ and arg_451_1.time_ <= var_454_5 + arg_454_0 then
				arg_451_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_454_6 = 0
			local var_454_7 = 0.95

			if var_454_6 < arg_451_1.time_ and arg_451_1.time_ <= var_454_6 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, true)

				local var_454_8 = arg_451_1:FormatText(StoryNameCfg[464].name)

				arg_451_1.leftNameTxt_.text = var_454_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_451_1.leftNameTxt_.transform)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1.leftNameTxt_.text)
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_9 = arg_451_1:GetWordFromCfg(222011111)
				local var_454_10 = arg_451_1:FormatText(var_454_9.content)

				arg_451_1.text_.text = var_454_10

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_11 = 38
				local var_454_12 = utf8.len(var_454_10)
				local var_454_13 = var_454_11 <= 0 and var_454_7 or var_454_7 * (var_454_12 / var_454_11)

				if var_454_13 > 0 and var_454_7 < var_454_13 then
					arg_451_1.talkMaxDuration = var_454_13

					if var_454_13 + var_454_6 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_13 + var_454_6
					end
				end

				arg_451_1.text_.text = var_454_10
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011111", "story_v_out_222011.awb") ~= 0 then
					local var_454_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011111", "story_v_out_222011.awb") / 1000

					if var_454_14 + var_454_6 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_14 + var_454_6
					end

					if var_454_9.prefab_name ~= "" and arg_451_1.actors_[var_454_9.prefab_name] ~= nil then
						local var_454_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_451_1.actors_[var_454_9.prefab_name].transform, "story_v_out_222011", "222011111", "story_v_out_222011.awb")

						arg_451_1:RecordAudio("222011111", var_454_15)
						arg_451_1:RecordAudio("222011111", var_454_15)
					else
						arg_451_1:AudioAction("play", "voice", "story_v_out_222011", "222011111", "story_v_out_222011.awb")
					end

					arg_451_1:RecordHistoryTalkVoice("story_v_out_222011", "222011111", "story_v_out_222011.awb")
				end

				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_16 = math.max(var_454_7, arg_451_1.talkMaxDuration)

			if var_454_6 <= arg_451_1.time_ and arg_451_1.time_ < var_454_6 + var_454_16 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_6) / var_454_16

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_6 + var_454_16 and arg_451_1.time_ < var_454_6 + var_454_16 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play222011112 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 222011112
		arg_455_1.duration_ = 14.333

		local var_455_0 = {
			ja = 14.333,
			ko = 8.933,
			zh = 8.933
		}
		local var_455_1 = manager.audio:GetLocalizationFlag()

		if var_455_0[var_455_1] ~= nil then
			arg_455_1.duration_ = var_455_0[var_455_1]
		end

		SetActive(arg_455_1.tipsGo_, false)

		function arg_455_1.onSingleLineFinish_()
			arg_455_1.onSingleLineUpdate_ = nil
			arg_455_1.onSingleLineFinish_ = nil
			arg_455_1.state_ = "waiting"
		end

		function arg_455_1.playNext_(arg_457_0)
			if arg_457_0 == 1 then
				arg_455_0:Play222011113(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = 0

			if var_458_0 < arg_455_1.time_ and arg_455_1.time_ <= var_458_0 + arg_458_0 then
				arg_455_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_458_1 = 0
			local var_458_2 = 0.85

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_3 = arg_455_1:FormatText(StoryNameCfg[464].name)

				arg_455_1.leftNameTxt_.text = var_458_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_4 = arg_455_1:GetWordFromCfg(222011112)
				local var_458_5 = arg_455_1:FormatText(var_458_4.content)

				arg_455_1.text_.text = var_458_5

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_6 = 34
				local var_458_7 = utf8.len(var_458_5)
				local var_458_8 = var_458_6 <= 0 and var_458_2 or var_458_2 * (var_458_7 / var_458_6)

				if var_458_8 > 0 and var_458_2 < var_458_8 then
					arg_455_1.talkMaxDuration = var_458_8

					if var_458_8 + var_458_1 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_8 + var_458_1
					end
				end

				arg_455_1.text_.text = var_458_5
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011112", "story_v_out_222011.awb") ~= 0 then
					local var_458_9 = manager.audio:GetVoiceLength("story_v_out_222011", "222011112", "story_v_out_222011.awb") / 1000

					if var_458_9 + var_458_1 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_9 + var_458_1
					end

					if var_458_4.prefab_name ~= "" and arg_455_1.actors_[var_458_4.prefab_name] ~= nil then
						local var_458_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_4.prefab_name].transform, "story_v_out_222011", "222011112", "story_v_out_222011.awb")

						arg_455_1:RecordAudio("222011112", var_458_10)
						arg_455_1:RecordAudio("222011112", var_458_10)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_222011", "222011112", "story_v_out_222011.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_222011", "222011112", "story_v_out_222011.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_11 = math.max(var_458_2, arg_455_1.talkMaxDuration)

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_11 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_1) / var_458_11

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_1 + var_458_11 and arg_455_1.time_ < var_458_1 + var_458_11 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play222011113 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 222011113
		arg_459_1.duration_ = 5.7

		local var_459_0 = {
			ja = 5.7,
			ko = 3.9,
			zh = 3.9
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
				arg_459_0:Play222011114(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["10057ui_story"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and arg_459_1.var_.characterEffect10057ui_story == nil then
				arg_459_1.var_.characterEffect10057ui_story = var_462_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_2 = 0.200000002980232

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.characterEffect10057ui_story then
					local var_462_4 = Mathf.Lerp(0, 0.5, var_462_3)

					arg_459_1.var_.characterEffect10057ui_story.fillFlat = true
					arg_459_1.var_.characterEffect10057ui_story.fillRatio = var_462_4
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and arg_459_1.var_.characterEffect10057ui_story then
				local var_462_5 = 0.5

				arg_459_1.var_.characterEffect10057ui_story.fillFlat = true
				arg_459_1.var_.characterEffect10057ui_story.fillRatio = var_462_5
			end

			local var_462_6 = 0
			local var_462_7 = 0.5

			if var_462_6 < arg_459_1.time_ and arg_459_1.time_ <= var_462_6 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_8 = arg_459_1:FormatText(StoryNameCfg[465].name)

				arg_459_1.leftNameTxt_.text = var_462_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, true)
				arg_459_1.iconController_:SetSelectedState("hero")

				arg_459_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_9 = arg_459_1:GetWordFromCfg(222011113)
				local var_462_10 = arg_459_1:FormatText(var_462_9.content)

				arg_459_1.text_.text = var_462_10

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_11 = 20
				local var_462_12 = utf8.len(var_462_10)
				local var_462_13 = var_462_11 <= 0 and var_462_7 or var_462_7 * (var_462_12 / var_462_11)

				if var_462_13 > 0 and var_462_7 < var_462_13 then
					arg_459_1.talkMaxDuration = var_462_13

					if var_462_13 + var_462_6 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_13 + var_462_6
					end
				end

				arg_459_1.text_.text = var_462_10
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011113", "story_v_out_222011.awb") ~= 0 then
					local var_462_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011113", "story_v_out_222011.awb") / 1000

					if var_462_14 + var_462_6 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_14 + var_462_6
					end

					if var_462_9.prefab_name ~= "" and arg_459_1.actors_[var_462_9.prefab_name] ~= nil then
						local var_462_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_9.prefab_name].transform, "story_v_out_222011", "222011113", "story_v_out_222011.awb")

						arg_459_1:RecordAudio("222011113", var_462_15)
						arg_459_1:RecordAudio("222011113", var_462_15)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_222011", "222011113", "story_v_out_222011.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_222011", "222011113", "story_v_out_222011.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_16 = math.max(var_462_7, arg_459_1.talkMaxDuration)

			if var_462_6 <= arg_459_1.time_ and arg_459_1.time_ < var_462_6 + var_462_16 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_6) / var_462_16

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_6 + var_462_16 and arg_459_1.time_ < var_462_6 + var_462_16 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play222011114 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 222011114
		arg_463_1.duration_ = 19.666

		local var_463_0 = {
			ja = 19.666,
			ko = 10.3,
			zh = 10.3
		}
		local var_463_1 = manager.audio:GetLocalizationFlag()

		if var_463_0[var_463_1] ~= nil then
			arg_463_1.duration_ = var_463_0[var_463_1]
		end

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play222011115(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = arg_463_1.actors_["10057ui_story"]
			local var_466_1 = 0

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 and arg_463_1.var_.characterEffect10057ui_story == nil then
				arg_463_1.var_.characterEffect10057ui_story = var_466_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_466_2 = 0.200000002980232

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_2 then
				local var_466_3 = (arg_463_1.time_ - var_466_1) / var_466_2

				if arg_463_1.var_.characterEffect10057ui_story then
					arg_463_1.var_.characterEffect10057ui_story.fillFlat = false
				end
			end

			if arg_463_1.time_ >= var_466_1 + var_466_2 and arg_463_1.time_ < var_466_1 + var_466_2 + arg_466_0 and arg_463_1.var_.characterEffect10057ui_story then
				arg_463_1.var_.characterEffect10057ui_story.fillFlat = false
			end

			local var_466_4 = 0

			if var_466_4 < arg_463_1.time_ and arg_463_1.time_ <= var_466_4 + arg_466_0 then
				arg_463_1:PlayTimeline("10057ui_story", "StoryTimeline/CharAction/story10057/story10057action/10057action4_2")
			end

			local var_466_5 = 0
			local var_466_6 = 0.875

			if var_466_5 < arg_463_1.time_ and arg_463_1.time_ <= var_466_5 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_7 = arg_463_1:FormatText(StoryNameCfg[464].name)

				arg_463_1.leftNameTxt_.text = var_466_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_8 = arg_463_1:GetWordFromCfg(222011114)
				local var_466_9 = arg_463_1:FormatText(var_466_8.content)

				arg_463_1.text_.text = var_466_9

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_10 = 35
				local var_466_11 = utf8.len(var_466_9)
				local var_466_12 = var_466_10 <= 0 and var_466_6 or var_466_6 * (var_466_11 / var_466_10)

				if var_466_12 > 0 and var_466_6 < var_466_12 then
					arg_463_1.talkMaxDuration = var_466_12

					if var_466_12 + var_466_5 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_12 + var_466_5
					end
				end

				arg_463_1.text_.text = var_466_9
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011114", "story_v_out_222011.awb") ~= 0 then
					local var_466_13 = manager.audio:GetVoiceLength("story_v_out_222011", "222011114", "story_v_out_222011.awb") / 1000

					if var_466_13 + var_466_5 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_13 + var_466_5
					end

					if var_466_8.prefab_name ~= "" and arg_463_1.actors_[var_466_8.prefab_name] ~= nil then
						local var_466_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_8.prefab_name].transform, "story_v_out_222011", "222011114", "story_v_out_222011.awb")

						arg_463_1:RecordAudio("222011114", var_466_14)
						arg_463_1:RecordAudio("222011114", var_466_14)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_222011", "222011114", "story_v_out_222011.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_222011", "222011114", "story_v_out_222011.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_15 = math.max(var_466_6, arg_463_1.talkMaxDuration)

			if var_466_5 <= arg_463_1.time_ and arg_463_1.time_ < var_466_5 + var_466_15 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_5) / var_466_15

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_5 + var_466_15 and arg_463_1.time_ < var_466_5 + var_466_15 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play222011115 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 222011115
		arg_467_1.duration_ = 15.4

		local var_467_0 = {
			ja = 15.4,
			ko = 10.866,
			zh = 10.866
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
				arg_467_0:Play222011116(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.975

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_2 = arg_467_1:FormatText(StoryNameCfg[464].name)

				arg_467_1.leftNameTxt_.text = var_470_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_3 = arg_467_1:GetWordFromCfg(222011115)
				local var_470_4 = arg_467_1:FormatText(var_470_3.content)

				arg_467_1.text_.text = var_470_4

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_5 = 39
				local var_470_6 = utf8.len(var_470_4)
				local var_470_7 = var_470_5 <= 0 and var_470_1 or var_470_1 * (var_470_6 / var_470_5)

				if var_470_7 > 0 and var_470_1 < var_470_7 then
					arg_467_1.talkMaxDuration = var_470_7

					if var_470_7 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_7 + var_470_0
					end
				end

				arg_467_1.text_.text = var_470_4
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011115", "story_v_out_222011.awb") ~= 0 then
					local var_470_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011115", "story_v_out_222011.awb") / 1000

					if var_470_8 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_8 + var_470_0
					end

					if var_470_3.prefab_name ~= "" and arg_467_1.actors_[var_470_3.prefab_name] ~= nil then
						local var_470_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_3.prefab_name].transform, "story_v_out_222011", "222011115", "story_v_out_222011.awb")

						arg_467_1:RecordAudio("222011115", var_470_9)
						arg_467_1:RecordAudio("222011115", var_470_9)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_222011", "222011115", "story_v_out_222011.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_222011", "222011115", "story_v_out_222011.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_10 = math.max(var_470_1, arg_467_1.talkMaxDuration)

			if var_470_0 <= arg_467_1.time_ and arg_467_1.time_ < var_470_0 + var_470_10 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_0) / var_470_10

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_0 + var_470_10 and arg_467_1.time_ < var_470_0 + var_470_10 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play222011116 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 222011116
		arg_471_1.duration_ = 23.466

		local var_471_0 = {
			ja = 23.466,
			ko = 21.833,
			zh = 21.833
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
				arg_471_0:Play222011117(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 1.45

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_2 = arg_471_1:FormatText(StoryNameCfg[464].name)

				arg_471_1.leftNameTxt_.text = var_474_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_3 = arg_471_1:GetWordFromCfg(222011116)
				local var_474_4 = arg_471_1:FormatText(var_474_3.content)

				arg_471_1.text_.text = var_474_4

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_5 = 58
				local var_474_6 = utf8.len(var_474_4)
				local var_474_7 = var_474_5 <= 0 and var_474_1 or var_474_1 * (var_474_6 / var_474_5)

				if var_474_7 > 0 and var_474_1 < var_474_7 then
					arg_471_1.talkMaxDuration = var_474_7

					if var_474_7 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_7 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_4
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011116", "story_v_out_222011.awb") ~= 0 then
					local var_474_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011116", "story_v_out_222011.awb") / 1000

					if var_474_8 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_8 + var_474_0
					end

					if var_474_3.prefab_name ~= "" and arg_471_1.actors_[var_474_3.prefab_name] ~= nil then
						local var_474_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_3.prefab_name].transform, "story_v_out_222011", "222011116", "story_v_out_222011.awb")

						arg_471_1:RecordAudio("222011116", var_474_9)
						arg_471_1:RecordAudio("222011116", var_474_9)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_222011", "222011116", "story_v_out_222011.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_222011", "222011116", "story_v_out_222011.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_10 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_10 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_10

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_10 and arg_471_1.time_ < var_474_0 + var_474_10 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play222011117 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 222011117
		arg_475_1.duration_ = 5

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play222011118(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["10057ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos10057ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, 100, 0)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos10057ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, 100, 0)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = arg_475_1.actors_["10057ui_story"]
			local var_478_10 = 0

			if var_478_10 < arg_475_1.time_ and arg_475_1.time_ <= var_478_10 + arg_478_0 and arg_475_1.var_.characterEffect10057ui_story == nil then
				arg_475_1.var_.characterEffect10057ui_story = var_478_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_11 = 0.200000002980232

			if var_478_10 <= arg_475_1.time_ and arg_475_1.time_ < var_478_10 + var_478_11 then
				local var_478_12 = (arg_475_1.time_ - var_478_10) / var_478_11

				if arg_475_1.var_.characterEffect10057ui_story then
					local var_478_13 = Mathf.Lerp(0, 0.5, var_478_12)

					arg_475_1.var_.characterEffect10057ui_story.fillFlat = true
					arg_475_1.var_.characterEffect10057ui_story.fillRatio = var_478_13
				end
			end

			if arg_475_1.time_ >= var_478_10 + var_478_11 and arg_475_1.time_ < var_478_10 + var_478_11 + arg_478_0 and arg_475_1.var_.characterEffect10057ui_story then
				local var_478_14 = 0.5

				arg_475_1.var_.characterEffect10057ui_story.fillFlat = true
				arg_475_1.var_.characterEffect10057ui_story.fillRatio = var_478_14
			end

			local var_478_15 = arg_475_1.actors_["1074ui_story"].transform
			local var_478_16 = 0

			if var_478_16 < arg_475_1.time_ and arg_475_1.time_ <= var_478_16 + arg_478_0 then
				arg_475_1.var_.moveOldPos1074ui_story = var_478_15.localPosition
			end

			local var_478_17 = 0.001

			if var_478_16 <= arg_475_1.time_ and arg_475_1.time_ < var_478_16 + var_478_17 then
				local var_478_18 = (arg_475_1.time_ - var_478_16) / var_478_17
				local var_478_19 = Vector3.New(0, 100, 0)

				var_478_15.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1074ui_story, var_478_19, var_478_18)

				local var_478_20 = manager.ui.mainCamera.transform.position - var_478_15.position

				var_478_15.forward = Vector3.New(var_478_20.x, var_478_20.y, var_478_20.z)

				local var_478_21 = var_478_15.localEulerAngles

				var_478_21.z = 0
				var_478_21.x = 0
				var_478_15.localEulerAngles = var_478_21
			end

			if arg_475_1.time_ >= var_478_16 + var_478_17 and arg_475_1.time_ < var_478_16 + var_478_17 + arg_478_0 then
				var_478_15.localPosition = Vector3.New(0, 100, 0)

				local var_478_22 = manager.ui.mainCamera.transform.position - var_478_15.position

				var_478_15.forward = Vector3.New(var_478_22.x, var_478_22.y, var_478_22.z)

				local var_478_23 = var_478_15.localEulerAngles

				var_478_23.z = 0
				var_478_23.x = 0
				var_478_15.localEulerAngles = var_478_23
			end

			local var_478_24 = arg_475_1.actors_["1074ui_story"]
			local var_478_25 = 0

			if var_478_25 < arg_475_1.time_ and arg_475_1.time_ <= var_478_25 + arg_478_0 and arg_475_1.var_.characterEffect1074ui_story == nil then
				arg_475_1.var_.characterEffect1074ui_story = var_478_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_26 = 0.200000002980232

			if var_478_25 <= arg_475_1.time_ and arg_475_1.time_ < var_478_25 + var_478_26 then
				local var_478_27 = (arg_475_1.time_ - var_478_25) / var_478_26

				if arg_475_1.var_.characterEffect1074ui_story then
					local var_478_28 = Mathf.Lerp(0, 0.5, var_478_27)

					arg_475_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_475_1.var_.characterEffect1074ui_story.fillRatio = var_478_28
				end
			end

			if arg_475_1.time_ >= var_478_25 + var_478_26 and arg_475_1.time_ < var_478_25 + var_478_26 + arg_478_0 and arg_475_1.var_.characterEffect1074ui_story then
				local var_478_29 = 0.5

				arg_475_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_475_1.var_.characterEffect1074ui_story.fillRatio = var_478_29
			end

			local var_478_30 = 0
			local var_478_31 = 0.8

			if var_478_30 < arg_475_1.time_ and arg_475_1.time_ <= var_478_30 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, false)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_32 = arg_475_1:GetWordFromCfg(222011117)
				local var_478_33 = arg_475_1:FormatText(var_478_32.content)

				arg_475_1.text_.text = var_478_33

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_34 = 32
				local var_478_35 = utf8.len(var_478_33)
				local var_478_36 = var_478_34 <= 0 and var_478_31 or var_478_31 * (var_478_35 / var_478_34)

				if var_478_36 > 0 and var_478_31 < var_478_36 then
					arg_475_1.talkMaxDuration = var_478_36

					if var_478_36 + var_478_30 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_36 + var_478_30
					end
				end

				arg_475_1.text_.text = var_478_33
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)
				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_37 = math.max(var_478_31, arg_475_1.talkMaxDuration)

			if var_478_30 <= arg_475_1.time_ and arg_475_1.time_ < var_478_30 + var_478_37 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_30) / var_478_37

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_30 + var_478_37 and arg_475_1.time_ < var_478_30 + var_478_37 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play222011118 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 222011118
		arg_479_1.duration_ = 7.6

		local var_479_0 = {
			ja = 7.6,
			ko = 5.9,
			zh = 5.9
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
				arg_479_0:Play222011119(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = 0
			local var_482_1 = 0.975

			if var_482_0 < arg_479_1.time_ and arg_479_1.time_ <= var_482_0 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_2 = arg_479_1:FormatText(StoryNameCfg[465].name)

				arg_479_1.leftNameTxt_.text = var_482_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, true)
				arg_479_1.iconController_:SetSelectedState("hero")

				arg_479_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_3 = arg_479_1:GetWordFromCfg(222011118)
				local var_482_4 = arg_479_1:FormatText(var_482_3.content)

				arg_479_1.text_.text = var_482_4

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_5 = 39
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011118", "story_v_out_222011.awb") ~= 0 then
					local var_482_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011118", "story_v_out_222011.awb") / 1000

					if var_482_8 + var_482_0 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_8 + var_482_0
					end

					if var_482_3.prefab_name ~= "" and arg_479_1.actors_[var_482_3.prefab_name] ~= nil then
						local var_482_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_3.prefab_name].transform, "story_v_out_222011", "222011118", "story_v_out_222011.awb")

						arg_479_1:RecordAudio("222011118", var_482_9)
						arg_479_1:RecordAudio("222011118", var_482_9)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_222011", "222011118", "story_v_out_222011.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_222011", "222011118", "story_v_out_222011.awb")
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
	Play222011119 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 222011119
		arg_483_1.duration_ = 5

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play222011120(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = 0
			local var_486_1 = 0.6

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, false)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_2 = arg_483_1:GetWordFromCfg(222011119)
				local var_486_3 = arg_483_1:FormatText(var_486_2.content)

				arg_483_1.text_.text = var_486_3

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_4 = 24
				local var_486_5 = utf8.len(var_486_3)
				local var_486_6 = var_486_4 <= 0 and var_486_1 or var_486_1 * (var_486_5 / var_486_4)

				if var_486_6 > 0 and var_486_1 < var_486_6 then
					arg_483_1.talkMaxDuration = var_486_6

					if var_486_6 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_6 + var_486_0
					end
				end

				arg_483_1.text_.text = var_486_3
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)
				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_7 = math.max(var_486_1, arg_483_1.talkMaxDuration)

			if var_486_0 <= arg_483_1.time_ and arg_483_1.time_ < var_486_0 + var_486_7 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_0) / var_486_7

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_0 + var_486_7 and arg_483_1.time_ < var_486_0 + var_486_7 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play222011120 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 222011120
		arg_487_1.duration_ = 18.266

		local var_487_0 = {
			ja = 18.266,
			ko = 11.166,
			zh = 11.166
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
				arg_487_0:Play222011121(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["1074ui_story"].transform
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 then
				arg_487_1.var_.moveOldPos1074ui_story = var_490_0.localPosition
			end

			local var_490_2 = 0.001

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2
				local var_490_4 = Vector3.New(0, -1.055, -6.12)

				var_490_0.localPosition = Vector3.Lerp(arg_487_1.var_.moveOldPos1074ui_story, var_490_4, var_490_3)

				local var_490_5 = manager.ui.mainCamera.transform.position - var_490_0.position

				var_490_0.forward = Vector3.New(var_490_5.x, var_490_5.y, var_490_5.z)

				local var_490_6 = var_490_0.localEulerAngles

				var_490_6.z = 0
				var_490_6.x = 0
				var_490_0.localEulerAngles = var_490_6
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 then
				var_490_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_490_7 = manager.ui.mainCamera.transform.position - var_490_0.position

				var_490_0.forward = Vector3.New(var_490_7.x, var_490_7.y, var_490_7.z)

				local var_490_8 = var_490_0.localEulerAngles

				var_490_8.z = 0
				var_490_8.x = 0
				var_490_0.localEulerAngles = var_490_8
			end

			local var_490_9 = arg_487_1.actors_["1074ui_story"]
			local var_490_10 = 0

			if var_490_10 < arg_487_1.time_ and arg_487_1.time_ <= var_490_10 + arg_490_0 and arg_487_1.var_.characterEffect1074ui_story == nil then
				arg_487_1.var_.characterEffect1074ui_story = var_490_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_11 = 0.200000002980232

			if var_490_10 <= arg_487_1.time_ and arg_487_1.time_ < var_490_10 + var_490_11 then
				local var_490_12 = (arg_487_1.time_ - var_490_10) / var_490_11

				if arg_487_1.var_.characterEffect1074ui_story then
					arg_487_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_487_1.time_ >= var_490_10 + var_490_11 and arg_487_1.time_ < var_490_10 + var_490_11 + arg_490_0 and arg_487_1.var_.characterEffect1074ui_story then
				arg_487_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_490_13 = 0

			if var_490_13 < arg_487_1.time_ and arg_487_1.time_ <= var_490_13 + arg_490_0 then
				arg_487_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_490_14 = 0

			if var_490_14 < arg_487_1.time_ and arg_487_1.time_ <= var_490_14 + arg_490_0 then
				arg_487_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_490_15 = 0
			local var_490_16 = 1.275

			if var_490_15 < arg_487_1.time_ and arg_487_1.time_ <= var_490_15 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_17 = arg_487_1:FormatText(StoryNameCfg[410].name)

				arg_487_1.leftNameTxt_.text = var_490_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_18 = arg_487_1:GetWordFromCfg(222011120)
				local var_490_19 = arg_487_1:FormatText(var_490_18.content)

				arg_487_1.text_.text = var_490_19

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_20 = 51
				local var_490_21 = utf8.len(var_490_19)
				local var_490_22 = var_490_20 <= 0 and var_490_16 or var_490_16 * (var_490_21 / var_490_20)

				if var_490_22 > 0 and var_490_16 < var_490_22 then
					arg_487_1.talkMaxDuration = var_490_22

					if var_490_22 + var_490_15 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_22 + var_490_15
					end
				end

				arg_487_1.text_.text = var_490_19
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011120", "story_v_out_222011.awb") ~= 0 then
					local var_490_23 = manager.audio:GetVoiceLength("story_v_out_222011", "222011120", "story_v_out_222011.awb") / 1000

					if var_490_23 + var_490_15 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_23 + var_490_15
					end

					if var_490_18.prefab_name ~= "" and arg_487_1.actors_[var_490_18.prefab_name] ~= nil then
						local var_490_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_18.prefab_name].transform, "story_v_out_222011", "222011120", "story_v_out_222011.awb")

						arg_487_1:RecordAudio("222011120", var_490_24)
						arg_487_1:RecordAudio("222011120", var_490_24)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_222011", "222011120", "story_v_out_222011.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_222011", "222011120", "story_v_out_222011.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_25 = math.max(var_490_16, arg_487_1.talkMaxDuration)

			if var_490_15 <= arg_487_1.time_ and arg_487_1.time_ < var_490_15 + var_490_25 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_15) / var_490_25

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_15 + var_490_25 and arg_487_1.time_ < var_490_15 + var_490_25 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play222011121 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 222011121
		arg_491_1.duration_ = 3.866

		local var_491_0 = {
			ja = 3.866,
			ko = 2.8,
			zh = 2.8
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
				arg_491_0:Play222011122(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1074ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect1074ui_story == nil then
				arg_491_1.var_.characterEffect1074ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.200000002980232

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect1074ui_story then
					local var_494_4 = Mathf.Lerp(0, 0.5, var_494_3)

					arg_491_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_491_1.var_.characterEffect1074ui_story.fillRatio = var_494_4
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1074ui_story then
				local var_494_5 = 0.5

				arg_491_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_491_1.var_.characterEffect1074ui_story.fillRatio = var_494_5
			end

			local var_494_6 = 0
			local var_494_7 = 0.275

			if var_494_6 < arg_491_1.time_ and arg_491_1.time_ <= var_494_6 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_8 = arg_491_1:FormatText(StoryNameCfg[466].name)

				arg_491_1.leftNameTxt_.text = var_494_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, true)
				arg_491_1.iconController_:SetSelectedState("hero")

				arg_491_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_9 = arg_491_1:GetWordFromCfg(222011121)
				local var_494_10 = arg_491_1:FormatText(var_494_9.content)

				arg_491_1.text_.text = var_494_10

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_11 = 11
				local var_494_12 = utf8.len(var_494_10)
				local var_494_13 = var_494_11 <= 0 and var_494_7 or var_494_7 * (var_494_12 / var_494_11)

				if var_494_13 > 0 and var_494_7 < var_494_13 then
					arg_491_1.talkMaxDuration = var_494_13

					if var_494_13 + var_494_6 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_13 + var_494_6
					end
				end

				arg_491_1.text_.text = var_494_10
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011121", "story_v_out_222011.awb") ~= 0 then
					local var_494_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011121", "story_v_out_222011.awb") / 1000

					if var_494_14 + var_494_6 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_14 + var_494_6
					end

					if var_494_9.prefab_name ~= "" and arg_491_1.actors_[var_494_9.prefab_name] ~= nil then
						local var_494_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_9.prefab_name].transform, "story_v_out_222011", "222011121", "story_v_out_222011.awb")

						arg_491_1:RecordAudio("222011121", var_494_15)
						arg_491_1:RecordAudio("222011121", var_494_15)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_222011", "222011121", "story_v_out_222011.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_222011", "222011121", "story_v_out_222011.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_16 = math.max(var_494_7, arg_491_1.talkMaxDuration)

			if var_494_6 <= arg_491_1.time_ and arg_491_1.time_ < var_494_6 + var_494_16 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_6) / var_494_16

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_6 + var_494_16 and arg_491_1.time_ < var_494_6 + var_494_16 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play222011122 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 222011122
		arg_495_1.duration_ = 17.066

		local var_495_0 = {
			ja = 17.066,
			ko = 10.6,
			zh = 10.6
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
				arg_495_0:Play222011123(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = arg_495_1.actors_["1074ui_story"]
			local var_498_1 = 0

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 and arg_495_1.var_.characterEffect1074ui_story == nil then
				arg_495_1.var_.characterEffect1074ui_story = var_498_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_498_2 = 0.200000002980232

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_2 then
				local var_498_3 = (arg_495_1.time_ - var_498_1) / var_498_2

				if arg_495_1.var_.characterEffect1074ui_story then
					arg_495_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_495_1.time_ >= var_498_1 + var_498_2 and arg_495_1.time_ < var_498_1 + var_498_2 + arg_498_0 and arg_495_1.var_.characterEffect1074ui_story then
				arg_495_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_498_4 = 0

			if var_498_4 < arg_495_1.time_ and arg_495_1.time_ <= var_498_4 + arg_498_0 then
				arg_495_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_498_5 = 0
			local var_498_6 = 1.325

			if var_498_5 < arg_495_1.time_ and arg_495_1.time_ <= var_498_5 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_7 = arg_495_1:FormatText(StoryNameCfg[410].name)

				arg_495_1.leftNameTxt_.text = var_498_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_8 = arg_495_1:GetWordFromCfg(222011122)
				local var_498_9 = arg_495_1:FormatText(var_498_8.content)

				arg_495_1.text_.text = var_498_9

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_10 = 53
				local var_498_11 = utf8.len(var_498_9)
				local var_498_12 = var_498_10 <= 0 and var_498_6 or var_498_6 * (var_498_11 / var_498_10)

				if var_498_12 > 0 and var_498_6 < var_498_12 then
					arg_495_1.talkMaxDuration = var_498_12

					if var_498_12 + var_498_5 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_12 + var_498_5
					end
				end

				arg_495_1.text_.text = var_498_9
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011122", "story_v_out_222011.awb") ~= 0 then
					local var_498_13 = manager.audio:GetVoiceLength("story_v_out_222011", "222011122", "story_v_out_222011.awb") / 1000

					if var_498_13 + var_498_5 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_13 + var_498_5
					end

					if var_498_8.prefab_name ~= "" and arg_495_1.actors_[var_498_8.prefab_name] ~= nil then
						local var_498_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_8.prefab_name].transform, "story_v_out_222011", "222011122", "story_v_out_222011.awb")

						arg_495_1:RecordAudio("222011122", var_498_14)
						arg_495_1:RecordAudio("222011122", var_498_14)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_222011", "222011122", "story_v_out_222011.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_222011", "222011122", "story_v_out_222011.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_15 = math.max(var_498_6, arg_495_1.talkMaxDuration)

			if var_498_5 <= arg_495_1.time_ and arg_495_1.time_ < var_498_5 + var_498_15 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_5) / var_498_15

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_5 + var_498_15 and arg_495_1.time_ < var_498_5 + var_498_15 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play222011123 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 222011123
		arg_499_1.duration_ = 17.766

		local var_499_0 = {
			ja = 17.766,
			ko = 10.966,
			zh = 10.966
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
				arg_499_0:Play222011124(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0
			local var_502_1 = 1.3

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_2 = arg_499_1:FormatText(StoryNameCfg[410].name)

				arg_499_1.leftNameTxt_.text = var_502_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_3 = arg_499_1:GetWordFromCfg(222011123)
				local var_502_4 = arg_499_1:FormatText(var_502_3.content)

				arg_499_1.text_.text = var_502_4

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_5 = 52
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011123", "story_v_out_222011.awb") ~= 0 then
					local var_502_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011123", "story_v_out_222011.awb") / 1000

					if var_502_8 + var_502_0 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_8 + var_502_0
					end

					if var_502_3.prefab_name ~= "" and arg_499_1.actors_[var_502_3.prefab_name] ~= nil then
						local var_502_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_3.prefab_name].transform, "story_v_out_222011", "222011123", "story_v_out_222011.awb")

						arg_499_1:RecordAudio("222011123", var_502_9)
						arg_499_1:RecordAudio("222011123", var_502_9)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_222011", "222011123", "story_v_out_222011.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_222011", "222011123", "story_v_out_222011.awb")
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
	Play222011124 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 222011124
		arg_503_1.duration_ = 8.166

		local var_503_0 = {
			ja = 8.166,
			ko = 6.266,
			zh = 6.266
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
				arg_503_0:Play222011125(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1074ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1074ui_story == nil then
				arg_503_1.var_.characterEffect1074ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.200000002980232

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1074ui_story then
					local var_506_4 = Mathf.Lerp(0, 0.5, var_506_3)

					arg_503_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_503_1.var_.characterEffect1074ui_story.fillRatio = var_506_4
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1074ui_story then
				local var_506_5 = 0.5

				arg_503_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_503_1.var_.characterEffect1074ui_story.fillRatio = var_506_5
			end

			local var_506_6 = 0
			local var_506_7 = 0.825

			if var_506_6 < arg_503_1.time_ and arg_503_1.time_ <= var_506_6 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_8 = arg_503_1:FormatText(StoryNameCfg[465].name)

				arg_503_1.leftNameTxt_.text = var_506_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, true)
				arg_503_1.iconController_:SetSelectedState("hero")

				arg_503_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenmb")

				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_9 = arg_503_1:GetWordFromCfg(222011124)
				local var_506_10 = arg_503_1:FormatText(var_506_9.content)

				arg_503_1.text_.text = var_506_10

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_11 = 33
				local var_506_12 = utf8.len(var_506_10)
				local var_506_13 = var_506_11 <= 0 and var_506_7 or var_506_7 * (var_506_12 / var_506_11)

				if var_506_13 > 0 and var_506_7 < var_506_13 then
					arg_503_1.talkMaxDuration = var_506_13

					if var_506_13 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_13 + var_506_6
					end
				end

				arg_503_1.text_.text = var_506_10
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011124", "story_v_out_222011.awb") ~= 0 then
					local var_506_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011124", "story_v_out_222011.awb") / 1000

					if var_506_14 + var_506_6 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_14 + var_506_6
					end

					if var_506_9.prefab_name ~= "" and arg_503_1.actors_[var_506_9.prefab_name] ~= nil then
						local var_506_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_9.prefab_name].transform, "story_v_out_222011", "222011124", "story_v_out_222011.awb")

						arg_503_1:RecordAudio("222011124", var_506_15)
						arg_503_1:RecordAudio("222011124", var_506_15)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_222011", "222011124", "story_v_out_222011.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_222011", "222011124", "story_v_out_222011.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_16 = math.max(var_506_7, arg_503_1.talkMaxDuration)

			if var_506_6 <= arg_503_1.time_ and arg_503_1.time_ < var_506_6 + var_506_16 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_6) / var_506_16

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_6 + var_506_16 and arg_503_1.time_ < var_506_6 + var_506_16 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play222011125 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 222011125
		arg_507_1.duration_ = 7.2

		local var_507_0 = {
			ja = 7.2,
			ko = 3.566,
			zh = 3.566
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
				arg_507_0:Play222011126(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 0.35

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_2 = arg_507_1:FormatText(StoryNameCfg[466].name)

				arg_507_1.leftNameTxt_.text = var_510_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, true)
				arg_507_1.iconController_:SetSelectedState("hero")

				arg_507_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_3 = arg_507_1:GetWordFromCfg(222011125)
				local var_510_4 = arg_507_1:FormatText(var_510_3.content)

				arg_507_1.text_.text = var_510_4

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_5 = 14
				local var_510_6 = utf8.len(var_510_4)
				local var_510_7 = var_510_5 <= 0 and var_510_1 or var_510_1 * (var_510_6 / var_510_5)

				if var_510_7 > 0 and var_510_1 < var_510_7 then
					arg_507_1.talkMaxDuration = var_510_7

					if var_510_7 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_7 + var_510_0
					end
				end

				arg_507_1.text_.text = var_510_4
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011125", "story_v_out_222011.awb") ~= 0 then
					local var_510_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011125", "story_v_out_222011.awb") / 1000

					if var_510_8 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_8 + var_510_0
					end

					if var_510_3.prefab_name ~= "" and arg_507_1.actors_[var_510_3.prefab_name] ~= nil then
						local var_510_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_3.prefab_name].transform, "story_v_out_222011", "222011125", "story_v_out_222011.awb")

						arg_507_1:RecordAudio("222011125", var_510_9)
						arg_507_1:RecordAudio("222011125", var_510_9)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_222011", "222011125", "story_v_out_222011.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_222011", "222011125", "story_v_out_222011.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_10 = math.max(var_510_1, arg_507_1.talkMaxDuration)

			if var_510_0 <= arg_507_1.time_ and arg_507_1.time_ < var_510_0 + var_510_10 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_0) / var_510_10

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_0 + var_510_10 and arg_507_1.time_ < var_510_0 + var_510_10 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play222011126 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 222011126
		arg_511_1.duration_ = 5

		SetActive(arg_511_1.tipsGo_, false)

		function arg_511_1.onSingleLineFinish_()
			arg_511_1.onSingleLineUpdate_ = nil
			arg_511_1.onSingleLineFinish_ = nil
			arg_511_1.state_ = "waiting"
		end

		function arg_511_1.playNext_(arg_513_0)
			if arg_513_0 == 1 then
				arg_511_0:Play222011127(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1074ui_story"].transform
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 then
				arg_511_1.var_.moveOldPos1074ui_story = var_514_0.localPosition
			end

			local var_514_2 = 0.001

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2
				local var_514_4 = Vector3.New(0, 100, 0)

				var_514_0.localPosition = Vector3.Lerp(arg_511_1.var_.moveOldPos1074ui_story, var_514_4, var_514_3)

				local var_514_5 = manager.ui.mainCamera.transform.position - var_514_0.position

				var_514_0.forward = Vector3.New(var_514_5.x, var_514_5.y, var_514_5.z)

				local var_514_6 = var_514_0.localEulerAngles

				var_514_6.z = 0
				var_514_6.x = 0
				var_514_0.localEulerAngles = var_514_6
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 then
				var_514_0.localPosition = Vector3.New(0, 100, 0)

				local var_514_7 = manager.ui.mainCamera.transform.position - var_514_0.position

				var_514_0.forward = Vector3.New(var_514_7.x, var_514_7.y, var_514_7.z)

				local var_514_8 = var_514_0.localEulerAngles

				var_514_8.z = 0
				var_514_8.x = 0
				var_514_0.localEulerAngles = var_514_8
			end

			local var_514_9 = arg_511_1.actors_["1074ui_story"]
			local var_514_10 = 0

			if var_514_10 < arg_511_1.time_ and arg_511_1.time_ <= var_514_10 + arg_514_0 and arg_511_1.var_.characterEffect1074ui_story == nil then
				arg_511_1.var_.characterEffect1074ui_story = var_514_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_514_11 = 0.200000002980232

			if var_514_10 <= arg_511_1.time_ and arg_511_1.time_ < var_514_10 + var_514_11 then
				local var_514_12 = (arg_511_1.time_ - var_514_10) / var_514_11

				if arg_511_1.var_.characterEffect1074ui_story then
					local var_514_13 = Mathf.Lerp(0, 0.5, var_514_12)

					arg_511_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_511_1.var_.characterEffect1074ui_story.fillRatio = var_514_13
				end
			end

			if arg_511_1.time_ >= var_514_10 + var_514_11 and arg_511_1.time_ < var_514_10 + var_514_11 + arg_514_0 and arg_511_1.var_.characterEffect1074ui_story then
				local var_514_14 = 0.5

				arg_511_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_511_1.var_.characterEffect1074ui_story.fillRatio = var_514_14
			end

			local var_514_15 = 0
			local var_514_16 = 1.1

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

				local var_514_17 = arg_511_1:GetWordFromCfg(222011126)
				local var_514_18 = arg_511_1:FormatText(var_514_17.content)

				arg_511_1.text_.text = var_514_18

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_19 = 44
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
	Play222011127 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 222011127
		arg_515_1.duration_ = 9.466

		local var_515_0 = {
			ja = 9.466,
			ko = 7.466,
			zh = 7.466
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
				arg_515_0:Play222011128(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1074ui_story"].transform
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 then
				arg_515_1.var_.moveOldPos1074ui_story = var_518_0.localPosition
			end

			local var_518_2 = 0.001

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2
				local var_518_4 = Vector3.New(0, -1.055, -6.12)

				var_518_0.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1074ui_story, var_518_4, var_518_3)

				local var_518_5 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_5.x, var_518_5.y, var_518_5.z)

				local var_518_6 = var_518_0.localEulerAngles

				var_518_6.z = 0
				var_518_6.x = 0
				var_518_0.localEulerAngles = var_518_6
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 then
				var_518_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_518_7 = manager.ui.mainCamera.transform.position - var_518_0.position

				var_518_0.forward = Vector3.New(var_518_7.x, var_518_7.y, var_518_7.z)

				local var_518_8 = var_518_0.localEulerAngles

				var_518_8.z = 0
				var_518_8.x = 0
				var_518_0.localEulerAngles = var_518_8
			end

			local var_518_9 = arg_515_1.actors_["1074ui_story"]
			local var_518_10 = 0

			if var_518_10 < arg_515_1.time_ and arg_515_1.time_ <= var_518_10 + arg_518_0 and arg_515_1.var_.characterEffect1074ui_story == nil then
				arg_515_1.var_.characterEffect1074ui_story = var_518_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_11 = 0.200000002980232

			if var_518_10 <= arg_515_1.time_ and arg_515_1.time_ < var_518_10 + var_518_11 then
				local var_518_12 = (arg_515_1.time_ - var_518_10) / var_518_11

				if arg_515_1.var_.characterEffect1074ui_story then
					arg_515_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_515_1.time_ >= var_518_10 + var_518_11 and arg_515_1.time_ < var_518_10 + var_518_11 + arg_518_0 and arg_515_1.var_.characterEffect1074ui_story then
				arg_515_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_518_13 = 0

			if var_518_13 < arg_515_1.time_ and arg_515_1.time_ <= var_518_13 + arg_518_0 then
				arg_515_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_518_14 = 0

			if var_518_14 < arg_515_1.time_ and arg_515_1.time_ <= var_518_14 + arg_518_0 then
				arg_515_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_518_15 = 0
			local var_518_16 = 0.625

			if var_518_15 < arg_515_1.time_ and arg_515_1.time_ <= var_518_15 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_17 = arg_515_1:FormatText(StoryNameCfg[410].name)

				arg_515_1.leftNameTxt_.text = var_518_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_18 = arg_515_1:GetWordFromCfg(222011127)
				local var_518_19 = arg_515_1:FormatText(var_518_18.content)

				arg_515_1.text_.text = var_518_19

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_20 = 25
				local var_518_21 = utf8.len(var_518_19)
				local var_518_22 = var_518_20 <= 0 and var_518_16 or var_518_16 * (var_518_21 / var_518_20)

				if var_518_22 > 0 and var_518_16 < var_518_22 then
					arg_515_1.talkMaxDuration = var_518_22

					if var_518_22 + var_518_15 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_22 + var_518_15
					end
				end

				arg_515_1.text_.text = var_518_19
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011127", "story_v_out_222011.awb") ~= 0 then
					local var_518_23 = manager.audio:GetVoiceLength("story_v_out_222011", "222011127", "story_v_out_222011.awb") / 1000

					if var_518_23 + var_518_15 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_23 + var_518_15
					end

					if var_518_18.prefab_name ~= "" and arg_515_1.actors_[var_518_18.prefab_name] ~= nil then
						local var_518_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_18.prefab_name].transform, "story_v_out_222011", "222011127", "story_v_out_222011.awb")

						arg_515_1:RecordAudio("222011127", var_518_24)
						arg_515_1:RecordAudio("222011127", var_518_24)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_222011", "222011127", "story_v_out_222011.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_222011", "222011127", "story_v_out_222011.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_25 = math.max(var_518_16, arg_515_1.talkMaxDuration)

			if var_518_15 <= arg_515_1.time_ and arg_515_1.time_ < var_518_15 + var_518_25 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_15) / var_518_25

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_15 + var_518_25 and arg_515_1.time_ < var_518_15 + var_518_25 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play222011128 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 222011128
		arg_519_1.duration_ = 13.333

		local var_519_0 = {
			ja = 13.333,
			ko = 7.1,
			zh = 7.1
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
				arg_519_0:Play222011129(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = 0
			local var_522_1 = 0.525

			if var_522_0 < arg_519_1.time_ and arg_519_1.time_ <= var_522_0 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_2 = arg_519_1:FormatText(StoryNameCfg[410].name)

				arg_519_1.leftNameTxt_.text = var_522_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_3 = arg_519_1:GetWordFromCfg(222011128)
				local var_522_4 = arg_519_1:FormatText(var_522_3.content)

				arg_519_1.text_.text = var_522_4

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011128", "story_v_out_222011.awb") ~= 0 then
					local var_522_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011128", "story_v_out_222011.awb") / 1000

					if var_522_8 + var_522_0 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_8 + var_522_0
					end

					if var_522_3.prefab_name ~= "" and arg_519_1.actors_[var_522_3.prefab_name] ~= nil then
						local var_522_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_3.prefab_name].transform, "story_v_out_222011", "222011128", "story_v_out_222011.awb")

						arg_519_1:RecordAudio("222011128", var_522_9)
						arg_519_1:RecordAudio("222011128", var_522_9)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_222011", "222011128", "story_v_out_222011.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_222011", "222011128", "story_v_out_222011.awb")
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
	Play222011129 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 222011129
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play222011130(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["1074ui_story"]
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 and arg_523_1.var_.characterEffect1074ui_story == nil then
				arg_523_1.var_.characterEffect1074ui_story = var_526_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_526_2 = 0.200000002980232

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2

				if arg_523_1.var_.characterEffect1074ui_story then
					local var_526_4 = Mathf.Lerp(0, 0.5, var_526_3)

					arg_523_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_523_1.var_.characterEffect1074ui_story.fillRatio = var_526_4
				end
			end

			if arg_523_1.time_ >= var_526_1 + var_526_2 and arg_523_1.time_ < var_526_1 + var_526_2 + arg_526_0 and arg_523_1.var_.characterEffect1074ui_story then
				local var_526_5 = 0.5

				arg_523_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_523_1.var_.characterEffect1074ui_story.fillRatio = var_526_5
			end

			local var_526_6 = 0
			local var_526_7 = 1.4

			if var_526_6 < arg_523_1.time_ and arg_523_1.time_ <= var_526_6 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_8 = arg_523_1:GetWordFromCfg(222011129)
				local var_526_9 = arg_523_1:FormatText(var_526_8.content)

				arg_523_1.text_.text = var_526_9

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_10 = 56
				local var_526_11 = utf8.len(var_526_9)
				local var_526_12 = var_526_10 <= 0 and var_526_7 or var_526_7 * (var_526_11 / var_526_10)

				if var_526_12 > 0 and var_526_7 < var_526_12 then
					arg_523_1.talkMaxDuration = var_526_12

					if var_526_12 + var_526_6 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_12 + var_526_6
					end
				end

				arg_523_1.text_.text = var_526_9
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_13 = math.max(var_526_7, arg_523_1.talkMaxDuration)

			if var_526_6 <= arg_523_1.time_ and arg_523_1.time_ < var_526_6 + var_526_13 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_6) / var_526_13

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_6 + var_526_13 and arg_523_1.time_ < var_526_6 + var_526_13 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play222011130 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 222011130
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play222011131(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 1

			if var_530_0 < arg_527_1.time_ and arg_527_1.time_ <= var_530_0 + arg_530_0 then
				local var_530_2 = "play"
				local var_530_3 = "effect"

				arg_527_1:AudioAction(var_530_2, var_530_3, "se_story", "se_story_communication", "")
			end

			local var_530_4 = 0
			local var_530_5 = 1

			if var_530_4 < arg_527_1.time_ and arg_527_1.time_ <= var_530_4 + arg_530_0 then
				local var_530_6 = "play"
				local var_530_7 = "effect"

				arg_527_1:AudioAction(var_530_6, var_530_7, "se_story", "se_story_communication", "")
			end

			local var_530_8 = 0
			local var_530_9 = 1

			if var_530_8 < arg_527_1.time_ and arg_527_1.time_ <= var_530_8 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, false)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_10 = arg_527_1:GetWordFromCfg(222011130)
				local var_530_11 = arg_527_1:FormatText(var_530_10.content)

				arg_527_1.text_.text = var_530_11

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_12 = 40
				local var_530_13 = utf8.len(var_530_11)
				local var_530_14 = var_530_12 <= 0 and var_530_9 or var_530_9 * (var_530_13 / var_530_12)

				if var_530_14 > 0 and var_530_9 < var_530_14 then
					arg_527_1.talkMaxDuration = var_530_14

					if var_530_14 + var_530_8 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_14 + var_530_8
					end
				end

				arg_527_1.text_.text = var_530_11
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)
				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_15 = math.max(var_530_9, arg_527_1.talkMaxDuration)

			if var_530_8 <= arg_527_1.time_ and arg_527_1.time_ < var_530_8 + var_530_15 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_8) / var_530_15

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_8 + var_530_15 and arg_527_1.time_ < var_530_8 + var_530_15 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play222011131 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 222011131
		arg_531_1.duration_ = 3.6

		local var_531_0 = {
			ja = 3.6,
			ko = 2.1,
			zh = 2.1
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
				arg_531_0:Play222011132(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1074ui_story"]
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 and arg_531_1.var_.characterEffect1074ui_story == nil then
				arg_531_1.var_.characterEffect1074ui_story = var_534_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_534_2 = 0.200000002980232

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_2 then
				local var_534_3 = (arg_531_1.time_ - var_534_1) / var_534_2

				if arg_531_1.var_.characterEffect1074ui_story then
					arg_531_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_531_1.time_ >= var_534_1 + var_534_2 and arg_531_1.time_ < var_534_1 + var_534_2 + arg_534_0 and arg_531_1.var_.characterEffect1074ui_story then
				arg_531_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_534_4 = 0

			if var_534_4 < arg_531_1.time_ and arg_531_1.time_ <= var_534_4 + arg_534_0 then
				arg_531_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_534_5 = 0

			if var_534_5 < arg_531_1.time_ and arg_531_1.time_ <= var_534_5 + arg_534_0 then
				arg_531_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_534_6 = 0
			local var_534_7 = 0.3

			if var_534_6 < arg_531_1.time_ and arg_531_1.time_ <= var_534_6 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_8 = arg_531_1:FormatText(StoryNameCfg[410].name)

				arg_531_1.leftNameTxt_.text = var_534_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_9 = arg_531_1:GetWordFromCfg(222011131)
				local var_534_10 = arg_531_1:FormatText(var_534_9.content)

				arg_531_1.text_.text = var_534_10

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_11 = 12
				local var_534_12 = utf8.len(var_534_10)
				local var_534_13 = var_534_11 <= 0 and var_534_7 or var_534_7 * (var_534_12 / var_534_11)

				if var_534_13 > 0 and var_534_7 < var_534_13 then
					arg_531_1.talkMaxDuration = var_534_13

					if var_534_13 + var_534_6 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_13 + var_534_6
					end
				end

				arg_531_1.text_.text = var_534_10
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011131", "story_v_out_222011.awb") ~= 0 then
					local var_534_14 = manager.audio:GetVoiceLength("story_v_out_222011", "222011131", "story_v_out_222011.awb") / 1000

					if var_534_14 + var_534_6 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_14 + var_534_6
					end

					if var_534_9.prefab_name ~= "" and arg_531_1.actors_[var_534_9.prefab_name] ~= nil then
						local var_534_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_9.prefab_name].transform, "story_v_out_222011", "222011131", "story_v_out_222011.awb")

						arg_531_1:RecordAudio("222011131", var_534_15)
						arg_531_1:RecordAudio("222011131", var_534_15)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_222011", "222011131", "story_v_out_222011.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_222011", "222011131", "story_v_out_222011.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_16 = math.max(var_534_7, arg_531_1.talkMaxDuration)

			if var_534_6 <= arg_531_1.time_ and arg_531_1.time_ < var_534_6 + var_534_16 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_6) / var_534_16

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_6 + var_534_16 and arg_531_1.time_ < var_534_6 + var_534_16 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play222011132 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 222011132
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play222011133(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1074ui_story"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.characterEffect1074ui_story == nil then
				arg_535_1.var_.characterEffect1074ui_story = var_538_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_2 = 0.200000002980232

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.characterEffect1074ui_story then
					local var_538_4 = Mathf.Lerp(0, 0.5, var_538_3)

					arg_535_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_535_1.var_.characterEffect1074ui_story.fillRatio = var_538_4
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.characterEffect1074ui_story then
				local var_538_5 = 0.5

				arg_535_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_535_1.var_.characterEffect1074ui_story.fillRatio = var_538_5
			end

			local var_538_6 = 0
			local var_538_7 = 1

			if var_538_6 < arg_535_1.time_ and arg_535_1.time_ <= var_538_6 + arg_538_0 then
				local var_538_8 = "play"
				local var_538_9 = "effect"

				arg_535_1:AudioAction(var_538_8, var_538_9, "se_story_222_00", "se_story_222_00_noise", "")
			end

			local var_538_10 = 0
			local var_538_11 = 0.825

			if var_538_10 < arg_535_1.time_ and arg_535_1.time_ <= var_538_10 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, false)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_12 = arg_535_1:GetWordFromCfg(222011132)
				local var_538_13 = arg_535_1:FormatText(var_538_12.content)

				arg_535_1.text_.text = var_538_13

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_14 = 33
				local var_538_15 = utf8.len(var_538_13)
				local var_538_16 = var_538_14 <= 0 and var_538_11 or var_538_11 * (var_538_15 / var_538_14)

				if var_538_16 > 0 and var_538_11 < var_538_16 then
					arg_535_1.talkMaxDuration = var_538_16

					if var_538_16 + var_538_10 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_16 + var_538_10
					end
				end

				arg_535_1.text_.text = var_538_13
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_17 = math.max(var_538_11, arg_535_1.talkMaxDuration)

			if var_538_10 <= arg_535_1.time_ and arg_535_1.time_ < var_538_10 + var_538_17 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_10) / var_538_17

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_10 + var_538_17 and arg_535_1.time_ < var_538_10 + var_538_17 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play222011133 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 222011133
		arg_539_1.duration_ = 3.6

		local var_539_0 = {
			ja = 3.6,
			ko = 2.366,
			zh = 2.366
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
				arg_539_0:Play222011134(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["1074ui_story"]
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 and arg_539_1.var_.characterEffect1074ui_story == nil then
				arg_539_1.var_.characterEffect1074ui_story = var_542_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_2 = 0.200000002980232

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2

				if arg_539_1.var_.characterEffect1074ui_story then
					arg_539_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 and arg_539_1.var_.characterEffect1074ui_story then
				arg_539_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_542_4 = 0

			if var_542_4 < arg_539_1.time_ and arg_539_1.time_ <= var_542_4 + arg_542_0 then
				arg_539_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_542_5 = 0

			if var_542_5 < arg_539_1.time_ and arg_539_1.time_ <= var_542_5 + arg_542_0 then
				arg_539_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_542_6 = 0
			local var_542_7 = 1

			if var_542_6 < arg_539_1.time_ and arg_539_1.time_ <= var_542_6 + arg_542_0 then
				local var_542_8 = "play"
				local var_542_9 = "effect"

				arg_539_1:AudioAction(var_542_8, var_542_9, "se_story_222_00", "se_story_222_00_noise", "")
			end

			local var_542_10 = 0
			local var_542_11 = 0.225

			if var_542_10 < arg_539_1.time_ and arg_539_1.time_ <= var_542_10 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_12 = arg_539_1:FormatText(StoryNameCfg[410].name)

				arg_539_1.leftNameTxt_.text = var_542_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_13 = arg_539_1:GetWordFromCfg(222011133)
				local var_542_14 = arg_539_1:FormatText(var_542_13.content)

				arg_539_1.text_.text = var_542_14

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_15 = 9
				local var_542_16 = utf8.len(var_542_14)
				local var_542_17 = var_542_15 <= 0 and var_542_11 or var_542_11 * (var_542_16 / var_542_15)

				if var_542_17 > 0 and var_542_11 < var_542_17 then
					arg_539_1.talkMaxDuration = var_542_17

					if var_542_17 + var_542_10 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_17 + var_542_10
					end
				end

				arg_539_1.text_.text = var_542_14
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011133", "story_v_out_222011.awb") ~= 0 then
					local var_542_18 = manager.audio:GetVoiceLength("story_v_out_222011", "222011133", "story_v_out_222011.awb") / 1000

					if var_542_18 + var_542_10 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_18 + var_542_10
					end

					if var_542_13.prefab_name ~= "" and arg_539_1.actors_[var_542_13.prefab_name] ~= nil then
						local var_542_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_13.prefab_name].transform, "story_v_out_222011", "222011133", "story_v_out_222011.awb")

						arg_539_1:RecordAudio("222011133", var_542_19)
						arg_539_1:RecordAudio("222011133", var_542_19)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_222011", "222011133", "story_v_out_222011.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_222011", "222011133", "story_v_out_222011.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_20 = math.max(var_542_11, arg_539_1.talkMaxDuration)

			if var_542_10 <= arg_539_1.time_ and arg_539_1.time_ < var_542_10 + var_542_20 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_10) / var_542_20

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_10 + var_542_20 and arg_539_1.time_ < var_542_10 + var_542_20 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play222011134 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 222011134
		arg_543_1.duration_ = 3.966

		local var_543_0 = {
			ja = 3.966,
			ko = 3.166,
			zh = 3.166
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
				arg_543_0:Play222011135(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1074ui_story"].transform
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 then
				arg_543_1.var_.moveOldPos1074ui_story = var_546_0.localPosition
			end

			local var_546_2 = 0.001

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_2 then
				local var_546_3 = (arg_543_1.time_ - var_546_1) / var_546_2
				local var_546_4 = Vector3.New(0, 100, 0)

				var_546_0.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos1074ui_story, var_546_4, var_546_3)

				local var_546_5 = manager.ui.mainCamera.transform.position - var_546_0.position

				var_546_0.forward = Vector3.New(var_546_5.x, var_546_5.y, var_546_5.z)

				local var_546_6 = var_546_0.localEulerAngles

				var_546_6.z = 0
				var_546_6.x = 0
				var_546_0.localEulerAngles = var_546_6
			end

			if arg_543_1.time_ >= var_546_1 + var_546_2 and arg_543_1.time_ < var_546_1 + var_546_2 + arg_546_0 then
				var_546_0.localPosition = Vector3.New(0, 100, 0)

				local var_546_7 = manager.ui.mainCamera.transform.position - var_546_0.position

				var_546_0.forward = Vector3.New(var_546_7.x, var_546_7.y, var_546_7.z)

				local var_546_8 = var_546_0.localEulerAngles

				var_546_8.z = 0
				var_546_8.x = 0
				var_546_0.localEulerAngles = var_546_8
			end

			local var_546_9 = arg_543_1.actors_["1074ui_story"]
			local var_546_10 = 0

			if var_546_10 < arg_543_1.time_ and arg_543_1.time_ <= var_546_10 + arg_546_0 and arg_543_1.var_.characterEffect1074ui_story == nil then
				arg_543_1.var_.characterEffect1074ui_story = var_546_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_11 = 0.200000002980232

			if var_546_10 <= arg_543_1.time_ and arg_543_1.time_ < var_546_10 + var_546_11 then
				local var_546_12 = (arg_543_1.time_ - var_546_10) / var_546_11

				if arg_543_1.var_.characterEffect1074ui_story then
					local var_546_13 = Mathf.Lerp(0, 0.5, var_546_12)

					arg_543_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_543_1.var_.characterEffect1074ui_story.fillRatio = var_546_13
				end
			end

			if arg_543_1.time_ >= var_546_10 + var_546_11 and arg_543_1.time_ < var_546_10 + var_546_11 + arg_546_0 and arg_543_1.var_.characterEffect1074ui_story then
				local var_546_14 = 0.5

				arg_543_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_543_1.var_.characterEffect1074ui_story.fillRatio = var_546_14
			end

			local var_546_15 = manager.ui.mainCamera.transform
			local var_546_16 = 0

			if var_546_16 < arg_543_1.time_ and arg_543_1.time_ <= var_546_16 + arg_546_0 then
				arg_543_1.var_.shakeOldPos = var_546_15.localPosition
			end

			local var_546_17 = 0.6

			if var_546_16 <= arg_543_1.time_ and arg_543_1.time_ < var_546_16 + var_546_17 then
				local var_546_18 = (arg_543_1.time_ - var_546_16) / 0.066
				local var_546_19, var_546_20 = math.modf(var_546_18)

				var_546_15.localPosition = Vector3.New(var_546_20 * 0.13, var_546_20 * 0.13, var_546_20 * 0.13) + arg_543_1.var_.shakeOldPos
			end

			if arg_543_1.time_ >= var_546_16 + var_546_17 and arg_543_1.time_ < var_546_16 + var_546_17 + arg_546_0 then
				var_546_15.localPosition = arg_543_1.var_.shakeOldPos
			end

			local var_546_21 = 0

			if var_546_21 < arg_543_1.time_ and arg_543_1.time_ <= var_546_21 + arg_546_0 then
				arg_543_1.allBtn_.enabled = false
			end

			local var_546_22 = 0.6

			if arg_543_1.time_ >= var_546_21 + var_546_22 and arg_543_1.time_ < var_546_21 + var_546_22 + arg_546_0 then
				arg_543_1.allBtn_.enabled = true
			end

			local var_546_23 = 0
			local var_546_24 = 0.325

			if var_546_23 < arg_543_1.time_ and arg_543_1.time_ <= var_546_23 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_25 = arg_543_1:FormatText(StoryNameCfg[380].name)

				arg_543_1.leftNameTxt_.text = var_546_25

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, true)
				arg_543_1.iconController_:SetSelectedState("hero")

				arg_543_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10044")

				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_26 = arg_543_1:GetWordFromCfg(222011134)
				local var_546_27 = arg_543_1:FormatText(var_546_26.content)

				arg_543_1.text_.text = var_546_27

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_28 = 13
				local var_546_29 = utf8.len(var_546_27)
				local var_546_30 = var_546_28 <= 0 and var_546_24 or var_546_24 * (var_546_29 / var_546_28)

				if var_546_30 > 0 and var_546_24 < var_546_30 then
					arg_543_1.talkMaxDuration = var_546_30

					if var_546_30 + var_546_23 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_30 + var_546_23
					end
				end

				arg_543_1.text_.text = var_546_27
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011134", "story_v_out_222011.awb") ~= 0 then
					local var_546_31 = manager.audio:GetVoiceLength("story_v_out_222011", "222011134", "story_v_out_222011.awb") / 1000

					if var_546_31 + var_546_23 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_31 + var_546_23
					end

					if var_546_26.prefab_name ~= "" and arg_543_1.actors_[var_546_26.prefab_name] ~= nil then
						local var_546_32 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_26.prefab_name].transform, "story_v_out_222011", "222011134", "story_v_out_222011.awb")

						arg_543_1:RecordAudio("222011134", var_546_32)
						arg_543_1:RecordAudio("222011134", var_546_32)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_222011", "222011134", "story_v_out_222011.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_222011", "222011134", "story_v_out_222011.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_33 = math.max(var_546_24, arg_543_1.talkMaxDuration)

			if var_546_23 <= arg_543_1.time_ and arg_543_1.time_ < var_546_23 + var_546_33 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_23) / var_546_33

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_23 + var_546_33 and arg_543_1.time_ < var_546_23 + var_546_33 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play222011135 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 222011135
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play222011136(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 1

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				local var_550_2 = "play"
				local var_550_3 = "effect"

				arg_547_1:AudioAction(var_550_2, var_550_3, "se_story_222_00", "se_story_222_00_signalnoise", "")
			end

			local var_550_4 = 0
			local var_550_5 = 1

			if var_550_4 < arg_547_1.time_ and arg_547_1.time_ <= var_550_4 + arg_550_0 then
				local var_550_6 = "play"
				local var_550_7 = "effect"

				arg_547_1:AudioAction(var_550_6, var_550_7, "se_story_222_00", "se_story_222_00_signalnoise", "")
			end

			local var_550_8 = 0
			local var_550_9 = 0.85

			if var_550_8 < arg_547_1.time_ and arg_547_1.time_ <= var_550_8 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, false)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_10 = arg_547_1:GetWordFromCfg(222011135)
				local var_550_11 = arg_547_1:FormatText(var_550_10.content)

				arg_547_1.text_.text = var_550_11

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_12 = 34
				local var_550_13 = utf8.len(var_550_11)
				local var_550_14 = var_550_12 <= 0 and var_550_9 or var_550_9 * (var_550_13 / var_550_12)

				if var_550_14 > 0 and var_550_9 < var_550_14 then
					arg_547_1.talkMaxDuration = var_550_14

					if var_550_14 + var_550_8 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_14 + var_550_8
					end
				end

				arg_547_1.text_.text = var_550_11
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_15 = math.max(var_550_9, arg_547_1.talkMaxDuration)

			if var_550_8 <= arg_547_1.time_ and arg_547_1.time_ < var_550_8 + var_550_15 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_8) / var_550_15

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_8 + var_550_15 and arg_547_1.time_ < var_550_8 + var_550_15 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play222011136 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 222011136
		arg_551_1.duration_ = 6.766

		local var_551_0 = {
			ja = 6.766,
			ko = 4.9,
			zh = 4.9
		}
		local var_551_1 = manager.audio:GetLocalizationFlag()

		if var_551_0[var_551_1] ~= nil then
			arg_551_1.duration_ = var_551_0[var_551_1]
		end

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play222011137(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = 0
			local var_554_1 = 0.575

			if var_554_0 < arg_551_1.time_ and arg_551_1.time_ <= var_554_0 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_2 = arg_551_1:FormatText(StoryNameCfg[473].name)

				arg_551_1.leftNameTxt_.text = var_554_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, true)
				arg_551_1.iconController_:SetSelectedState("hero")

				arg_551_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_3 = arg_551_1:GetWordFromCfg(222011136)
				local var_554_4 = arg_551_1:FormatText(var_554_3.content)

				arg_551_1.text_.text = var_554_4

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_5 = 23
				local var_554_6 = utf8.len(var_554_4)
				local var_554_7 = var_554_5 <= 0 and var_554_1 or var_554_1 * (var_554_6 / var_554_5)

				if var_554_7 > 0 and var_554_1 < var_554_7 then
					arg_551_1.talkMaxDuration = var_554_7

					if var_554_7 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_7 + var_554_0
					end
				end

				arg_551_1.text_.text = var_554_4
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011136", "story_v_out_222011.awb") ~= 0 then
					local var_554_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011136", "story_v_out_222011.awb") / 1000

					if var_554_8 + var_554_0 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_8 + var_554_0
					end

					if var_554_3.prefab_name ~= "" and arg_551_1.actors_[var_554_3.prefab_name] ~= nil then
						local var_554_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_3.prefab_name].transform, "story_v_out_222011", "222011136", "story_v_out_222011.awb")

						arg_551_1:RecordAudio("222011136", var_554_9)
						arg_551_1:RecordAudio("222011136", var_554_9)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_222011", "222011136", "story_v_out_222011.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_222011", "222011136", "story_v_out_222011.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_10 = math.max(var_554_1, arg_551_1.talkMaxDuration)

			if var_554_0 <= arg_551_1.time_ and arg_551_1.time_ < var_554_0 + var_554_10 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_0) / var_554_10

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_0 + var_554_10 and arg_551_1.time_ < var_554_0 + var_554_10 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play222011137 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 222011137
		arg_555_1.duration_ = 4.033

		local var_555_0 = {
			ja = 4.033,
			ko = 2.433,
			zh = 2.433
		}
		local var_555_1 = manager.audio:GetLocalizationFlag()

		if var_555_0[var_555_1] ~= nil then
			arg_555_1.duration_ = var_555_0[var_555_1]
		end

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play222011138(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = 0
			local var_558_1 = 0.175

			if var_558_0 < arg_555_1.time_ and arg_555_1.time_ <= var_558_0 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_2 = arg_555_1:FormatText(StoryNameCfg[473].name)

				arg_555_1.leftNameTxt_.text = var_558_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, true)
				arg_555_1.iconController_:SetSelectedState("hero")

				arg_555_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_boffinm")

				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_3 = arg_555_1:GetWordFromCfg(222011137)
				local var_558_4 = arg_555_1:FormatText(var_558_3.content)

				arg_555_1.text_.text = var_558_4

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_5 = 7
				local var_558_6 = utf8.len(var_558_4)
				local var_558_7 = var_558_5 <= 0 and var_558_1 or var_558_1 * (var_558_6 / var_558_5)

				if var_558_7 > 0 and var_558_1 < var_558_7 then
					arg_555_1.talkMaxDuration = var_558_7

					if var_558_7 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_7 + var_558_0
					end
				end

				arg_555_1.text_.text = var_558_4
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_222011", "222011137", "story_v_out_222011.awb") ~= 0 then
					local var_558_8 = manager.audio:GetVoiceLength("story_v_out_222011", "222011137", "story_v_out_222011.awb") / 1000

					if var_558_8 + var_558_0 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_8 + var_558_0
					end

					if var_558_3.prefab_name ~= "" and arg_555_1.actors_[var_558_3.prefab_name] ~= nil then
						local var_558_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_3.prefab_name].transform, "story_v_out_222011", "222011137", "story_v_out_222011.awb")

						arg_555_1:RecordAudio("222011137", var_558_9)
						arg_555_1:RecordAudio("222011137", var_558_9)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_222011", "222011137", "story_v_out_222011.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_222011", "222011137", "story_v_out_222011.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_10 = math.max(var_558_1, arg_555_1.talkMaxDuration)

			if var_558_0 <= arg_555_1.time_ and arg_555_1.time_ < var_558_0 + var_558_10 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_0) / var_558_10

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_0 + var_558_10 and arg_555_1.time_ < var_558_0 + var_558_10 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play222011138 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 222011138
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
			arg_559_1.auto_ = false
		end

		function arg_559_1.playNext_(arg_561_0)
			arg_559_1.onStoryFinished_()
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = 0
			local var_562_1 = 1.125

			if var_562_0 < arg_559_1.time_ and arg_559_1.time_ <= var_562_0 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_2 = arg_559_1:GetWordFromCfg(222011138)
				local var_562_3 = arg_559_1:FormatText(var_562_2.content)

				arg_559_1.text_.text = var_562_3

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_4 = 45
				local var_562_5 = utf8.len(var_562_3)
				local var_562_6 = var_562_4 <= 0 and var_562_1 or var_562_1 * (var_562_5 / var_562_4)

				if var_562_6 > 0 and var_562_1 < var_562_6 then
					arg_559_1.talkMaxDuration = var_562_6

					if var_562_6 + var_562_0 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_6 + var_562_0
					end
				end

				arg_559_1.text_.text = var_562_3
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_7 = math.max(var_562_1, arg_559_1.talkMaxDuration)

			if var_562_0 <= arg_559_1.time_ and arg_559_1.time_ < var_562_0 + var_562_7 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_0) / var_562_7

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_0 + var_562_7 and arg_559_1.time_ < var_562_0 + var_562_7 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST52",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST47",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/YZ0101"
	},
	voices = {
		"story_v_out_222011.awb"
	}
}
