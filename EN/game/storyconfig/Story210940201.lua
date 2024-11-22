return {
	Play1109402001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 1109402001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play1109402002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "ST03"

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
				if arg_1_0.sceneSettingEffect_ then
					arg_1_1.sceneSettingEffect_.enabled = false
				end

				arg_1_1.sceneSettingGo_:SetActive(true)

				local var_4_3 = manager.ui.mainCamera.transform.localPosition
				local var_4_4 = Vector3.New(0, 0, 10) + Vector3.New(var_4_3.x, var_4_3.y, 0)
				local var_4_5 = arg_1_1.bgs_.ST03

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
					if iter_4_0 ~= "ST03" then
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

			local var_4_22 = 1.875
			local var_4_23 = 0.7

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_v1_environment_crowd", "se_story_v1_environment_crowd", "se_story_v1_environment_crowd.awb")
			end

			local var_4_26 = 1.575
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_side_daily05", "bgm_side_daily05", "bgm_side_daily05.awb")
			end

			local var_4_30 = 0
			local var_4_31 = 0.2

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_34 = 2
			local var_4_35 = 0.575

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

				local var_4_37 = arg_1_1:GetWordFromCfg(1109402001)
				local var_4_38 = arg_1_1:FormatText(var_4_37.content)

				arg_1_1.text_.text = var_4_38

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_39 = 23
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
	Play1109402002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 1109402002
		arg_7_1.duration_ = 5

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play1109402003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.6

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

				local var_10_2 = arg_7_1:GetWordFromCfg(1109402002)
				local var_10_3 = arg_7_1:FormatText(var_10_2.content)

				arg_7_1.text_.text = var_10_3

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_4 = 24
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
	Play1109402003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 1109402003
		arg_11_1.duration_ = 6.4

		local var_11_0 = {
			ja = 6.4,
			ko = 5.966,
			zh = 5.966
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
				arg_11_0:Play1109402004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 0.9

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[23].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterm")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(1109402003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402003", "story_v_side_new_1109402.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402003", "story_v_side_new_1109402.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_side_new_1109402", "1109402003", "story_v_side_new_1109402.awb")

						arg_11_1:RecordAudio("1109402003", var_14_9)
						arg_11_1:RecordAudio("1109402003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402003", "story_v_side_new_1109402.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402003", "story_v_side_new_1109402.awb")
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
	Play1109402004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 1109402004
		arg_15_1.duration_ = 7.533

		local var_15_0 = {
			ja = 4.966,
			ko = 7.533,
			zh = 7.533
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
				arg_15_0:Play1109402005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 1.1

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[25].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(1109402004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402004", "story_v_side_new_1109402.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402004", "story_v_side_new_1109402.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_side_new_1109402", "1109402004", "story_v_side_new_1109402.awb")

						arg_15_1:RecordAudio("1109402004", var_18_9)
						arg_15_1:RecordAudio("1109402004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402004", "story_v_side_new_1109402.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402004", "story_v_side_new_1109402.awb")
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
	Play1109402005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 1109402005
		arg_19_1.duration_ = 5.466

		local var_19_0 = {
			ja = 5.466,
			ko = 4.833,
			zh = 4.833
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
				arg_19_0:Play1109402006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.7

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[26].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_studentm")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(1109402005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 28
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402005", "story_v_side_new_1109402.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402005", "story_v_side_new_1109402.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_side_new_1109402", "1109402005", "story_v_side_new_1109402.awb")

						arg_19_1:RecordAudio("1109402005", var_22_9)
						arg_19_1:RecordAudio("1109402005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402005", "story_v_side_new_1109402.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402005", "story_v_side_new_1109402.awb")
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
	Play1109402006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 1109402006
		arg_23_1.duration_ = 5

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play1109402007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.65

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

				local var_26_3 = arg_23_1:GetWordFromCfg(1109402006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 26
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
	Play1109402007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 1109402007
		arg_27_1.duration_ = 3.2

		local var_27_0 = {
			ja = 1.999999999999,
			ko = 3.2,
			zh = 3.2
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
				arg_27_0:Play1109402008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = "1094ui_story"

			if arg_27_1.actors_[var_30_0] == nil then
				local var_30_1 = Object.Instantiate(Asset.Load("Char/" .. var_30_0), arg_27_1.stage_.transform)

				var_30_1.name = var_30_0
				var_30_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_27_1.actors_[var_30_0] = var_30_1

				local var_30_2 = var_30_1:GetComponentInChildren(typeof(CharacterEffect))

				var_30_2.enabled = true

				local var_30_3 = GameObjectTools.GetOrAddComponent(var_30_1, typeof(DynamicBoneHelper))

				if var_30_3 then
					var_30_3:EnableDynamicBone(false)
				end

				arg_27_1:ShowWeapon(var_30_2.transform, false)

				arg_27_1.var_[var_30_0 .. "Animator"] = var_30_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_27_1.var_[var_30_0 .. "Animator"].applyRootMotion = true
				arg_27_1.var_[var_30_0 .. "LipSync"] = var_30_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_30_4 = arg_27_1.actors_["1094ui_story"].transform
			local var_30_5 = 0

			if var_30_5 < arg_27_1.time_ and arg_27_1.time_ <= var_30_5 + arg_30_0 then
				arg_27_1.var_.moveOldPos1094ui_story = var_30_4.localPosition
			end

			local var_30_6 = 0.001

			if var_30_5 <= arg_27_1.time_ and arg_27_1.time_ < var_30_5 + var_30_6 then
				local var_30_7 = (arg_27_1.time_ - var_30_5) / var_30_6
				local var_30_8 = Vector3.New(0, -0.84, -6.1)

				var_30_4.localPosition = Vector3.Lerp(arg_27_1.var_.moveOldPos1094ui_story, var_30_8, var_30_7)

				local var_30_9 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_9.x, var_30_9.y, var_30_9.z)

				local var_30_10 = var_30_4.localEulerAngles

				var_30_10.z = 0
				var_30_10.x = 0
				var_30_4.localEulerAngles = var_30_10
			end

			if arg_27_1.time_ >= var_30_5 + var_30_6 and arg_27_1.time_ < var_30_5 + var_30_6 + arg_30_0 then
				var_30_4.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_30_11 = manager.ui.mainCamera.transform.position - var_30_4.position

				var_30_4.forward = Vector3.New(var_30_11.x, var_30_11.y, var_30_11.z)

				local var_30_12 = var_30_4.localEulerAngles

				var_30_12.z = 0
				var_30_12.x = 0
				var_30_4.localEulerAngles = var_30_12
			end

			local var_30_13 = arg_27_1.actors_["1094ui_story"]
			local var_30_14 = 0

			if var_30_14 < arg_27_1.time_ and arg_27_1.time_ <= var_30_14 + arg_30_0 and arg_27_1.var_.characterEffect1094ui_story == nil then
				arg_27_1.var_.characterEffect1094ui_story = var_30_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_30_15 = 0.200000002980232

			if var_30_14 <= arg_27_1.time_ and arg_27_1.time_ < var_30_14 + var_30_15 then
				local var_30_16 = (arg_27_1.time_ - var_30_14) / var_30_15

				if arg_27_1.var_.characterEffect1094ui_story then
					arg_27_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_27_1.time_ >= var_30_14 + var_30_15 and arg_27_1.time_ < var_30_14 + var_30_15 + arg_30_0 and arg_27_1.var_.characterEffect1094ui_story then
				arg_27_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_30_17 = 0

			if var_30_17 < arg_27_1.time_ and arg_27_1.time_ <= var_30_17 + arg_30_0 then
				arg_27_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_30_18 = 0

			if var_30_18 < arg_27_1.time_ and arg_27_1.time_ <= var_30_18 + arg_30_0 then
				arg_27_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_30_19 = 0
			local var_30_20 = 0.075

			if var_30_19 < arg_27_1.time_ and arg_27_1.time_ <= var_30_19 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_21 = arg_27_1:FormatText(StoryNameCfg[181].name)

				arg_27_1.leftNameTxt_.text = var_30_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_22 = arg_27_1:GetWordFromCfg(1109402007)
				local var_30_23 = arg_27_1:FormatText(var_30_22.content)

				arg_27_1.text_.text = var_30_23

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_24 = 3
				local var_30_25 = utf8.len(var_30_23)
				local var_30_26 = var_30_24 <= 0 and var_30_20 or var_30_20 * (var_30_25 / var_30_24)

				if var_30_26 > 0 and var_30_20 < var_30_26 then
					arg_27_1.talkMaxDuration = var_30_26

					if var_30_26 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_26 + var_30_19
					end
				end

				arg_27_1.text_.text = var_30_23
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402007", "story_v_side_new_1109402.awb") ~= 0 then
					local var_30_27 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402007", "story_v_side_new_1109402.awb") / 1000

					if var_30_27 + var_30_19 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_27 + var_30_19
					end

					if var_30_22.prefab_name ~= "" and arg_27_1.actors_[var_30_22.prefab_name] ~= nil then
						local var_30_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_22.prefab_name].transform, "story_v_side_new_1109402", "1109402007", "story_v_side_new_1109402.awb")

						arg_27_1:RecordAudio("1109402007", var_30_28)
						arg_27_1:RecordAudio("1109402007", var_30_28)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402007", "story_v_side_new_1109402.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402007", "story_v_side_new_1109402.awb")
				end

				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_29 = math.max(var_30_20, arg_27_1.talkMaxDuration)

			if var_30_19 <= arg_27_1.time_ and arg_27_1.time_ < var_30_19 + var_30_29 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_19) / var_30_29

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_19 + var_30_29 and arg_27_1.time_ < var_30_19 + var_30_29 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 1109402008
		arg_31_1.duration_ = 5

		SetActive(arg_31_1.tipsGo_, false)

		function arg_31_1.onSingleLineFinish_()
			arg_31_1.onSingleLineUpdate_ = nil
			arg_31_1.onSingleLineFinish_ = nil
			arg_31_1.state_ = "waiting"
		end

		function arg_31_1.playNext_(arg_33_0)
			if arg_33_0 == 1 then
				arg_31_0:Play1109402009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = arg_31_1.actors_["1094ui_story"]
			local var_34_1 = 0

			if var_34_1 < arg_31_1.time_ and arg_31_1.time_ <= var_34_1 + arg_34_0 and arg_31_1.var_.characterEffect1094ui_story == nil then
				arg_31_1.var_.characterEffect1094ui_story = var_34_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_34_2 = 0.200000002980232

			if var_34_1 <= arg_31_1.time_ and arg_31_1.time_ < var_34_1 + var_34_2 then
				local var_34_3 = (arg_31_1.time_ - var_34_1) / var_34_2

				if arg_31_1.var_.characterEffect1094ui_story then
					local var_34_4 = Mathf.Lerp(0, 0.5, var_34_3)

					arg_31_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_31_1.var_.characterEffect1094ui_story.fillRatio = var_34_4
				end
			end

			if arg_31_1.time_ >= var_34_1 + var_34_2 and arg_31_1.time_ < var_34_1 + var_34_2 + arg_34_0 and arg_31_1.var_.characterEffect1094ui_story then
				local var_34_5 = 0.5

				arg_31_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_31_1.var_.characterEffect1094ui_story.fillRatio = var_34_5
			end

			local var_34_6 = 0
			local var_34_7 = 0.775

			if var_34_6 < arg_31_1.time_ and arg_31_1.time_ <= var_34_6 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, false)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_8 = arg_31_1:GetWordFromCfg(1109402008)
				local var_34_9 = arg_31_1:FormatText(var_34_8.content)

				arg_31_1.text_.text = var_34_9

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_10 = 31
				local var_34_11 = utf8.len(var_34_9)
				local var_34_12 = var_34_10 <= 0 and var_34_7 or var_34_7 * (var_34_11 / var_34_10)

				if var_34_12 > 0 and var_34_7 < var_34_12 then
					arg_31_1.talkMaxDuration = var_34_12

					if var_34_12 + var_34_6 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_12 + var_34_6
					end
				end

				arg_31_1.text_.text = var_34_9
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)
				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_13 = math.max(var_34_7, arg_31_1.talkMaxDuration)

			if var_34_6 <= arg_31_1.time_ and arg_31_1.time_ < var_34_6 + var_34_13 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_6) / var_34_13

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_6 + var_34_13 and arg_31_1.time_ < var_34_6 + var_34_13 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 1109402009
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play1109402010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.225

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

				local var_38_2 = arg_35_1:GetWordFromCfg(1109402009)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 49
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
	Play1109402010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 1109402010
		arg_39_1.duration_ = 5

		SetActive(arg_39_1.tipsGo_, false)

		function arg_39_1.onSingleLineFinish_()
			arg_39_1.onSingleLineUpdate_ = nil
			arg_39_1.onSingleLineFinish_ = nil
			arg_39_1.state_ = "waiting"
		end

		function arg_39_1.playNext_(arg_41_0)
			if arg_41_0 == 1 then
				arg_39_0:Play1109402011(arg_39_1)
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

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[7].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(1109402010)
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
				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_8 = math.max(var_42_1, arg_39_1.talkMaxDuration)

			if var_42_0 <= arg_39_1.time_ and arg_39_1.time_ < var_42_0 + var_42_8 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_0) / var_42_8

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_0 + var_42_8 and arg_39_1.time_ < var_42_0 + var_42_8 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 1109402011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play1109402012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1094ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1094ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, 100, 0)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1094ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, 100, 0)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1094ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1094ui_story == nil then
				arg_43_1.var_.characterEffect1094ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1094ui_story then
					local var_46_13 = Mathf.Lerp(0, 0.5, var_46_12)

					arg_43_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_43_1.var_.characterEffect1094ui_story.fillRatio = var_46_13
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1094ui_story then
				local var_46_14 = 0.5

				arg_43_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_43_1.var_.characterEffect1094ui_story.fillRatio = var_46_14
			end

			local var_46_15 = 0
			local var_46_16 = 0.866666666666667

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				local var_46_17 = "stop"
				local var_46_18 = "effect"

				arg_43_1:AudioAction(var_46_17, var_46_18, "se_story_v1_environment_crowd", "se_story_v1_environment_crowd", "")
			end

			local var_46_19 = 0
			local var_46_20 = 0.475

			if var_46_19 < arg_43_1.time_ and arg_43_1.time_ <= var_46_19 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, false)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_21 = arg_43_1:GetWordFromCfg(1109402011)
				local var_46_22 = arg_43_1:FormatText(var_46_21.content)

				arg_43_1.text_.text = var_46_22

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_23 = 19
				local var_46_24 = utf8.len(var_46_22)
				local var_46_25 = var_46_23 <= 0 and var_46_20 or var_46_20 * (var_46_24 / var_46_23)

				if var_46_25 > 0 and var_46_20 < var_46_25 then
					arg_43_1.talkMaxDuration = var_46_25

					if var_46_25 + var_46_19 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_25 + var_46_19
					end
				end

				arg_43_1.text_.text = var_46_22
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)
				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_26 = math.max(var_46_20, arg_43_1.talkMaxDuration)

			if var_46_19 <= arg_43_1.time_ and arg_43_1.time_ < var_46_19 + var_46_26 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_19) / var_46_26

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_19 + var_46_26 and arg_43_1.time_ < var_46_19 + var_46_26 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 1109402012
		arg_47_1.duration_ = 5.999999999999

		SetActive(arg_47_1.tipsGo_, false)

		function arg_47_1.onSingleLineFinish_()
			arg_47_1.onSingleLineUpdate_ = nil
			arg_47_1.onSingleLineFinish_ = nil
			arg_47_1.state_ = "waiting"
		end

		function arg_47_1.playNext_(arg_49_0)
			if arg_49_0 == 1 then
				arg_47_0:Play1109402013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 2

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				local var_50_1 = manager.ui.mainCamera.transform.localPosition
				local var_50_2 = Vector3.New(0, 0, 10) + Vector3.New(var_50_1.x, var_50_1.y, 0)
				local var_50_3 = arg_47_1.bgs_.ST03

				var_50_3.transform.localPosition = var_50_2
				var_50_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_50_4 = var_50_3:GetComponent("SpriteRenderer")

				if var_50_4 and var_50_4.sprite then
					local var_50_5 = (var_50_3.transform.localPosition - var_50_1).z
					local var_50_6 = manager.ui.mainCameraCom_
					local var_50_7 = 2 * var_50_5 * Mathf.Tan(var_50_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_50_8 = var_50_7 * var_50_6.aspect
					local var_50_9 = var_50_4.sprite.bounds.size.x
					local var_50_10 = var_50_4.sprite.bounds.size.y
					local var_50_11 = var_50_8 / var_50_9
					local var_50_12 = var_50_7 / var_50_10
					local var_50_13 = var_50_12 < var_50_11 and var_50_11 or var_50_12

					var_50_3.transform.localScale = Vector3.New(var_50_13, var_50_13, 0)
				end

				for iter_50_0, iter_50_1 in pairs(arg_47_1.bgs_) do
					if iter_50_0 ~= "ST03" then
						iter_50_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_50_14 = 0

			if var_50_14 < arg_47_1.time_ and arg_47_1.time_ <= var_50_14 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_15 = 2

			if var_50_14 <= arg_47_1.time_ and arg_47_1.time_ < var_50_14 + var_50_15 then
				local var_50_16 = (arg_47_1.time_ - var_50_14) / var_50_15
				local var_50_17 = Color.New(0, 0, 0)

				var_50_17.a = Mathf.Lerp(0, 1, var_50_16)
				arg_47_1.mask_.color = var_50_17
			end

			if arg_47_1.time_ >= var_50_14 + var_50_15 and arg_47_1.time_ < var_50_14 + var_50_15 + arg_50_0 then
				local var_50_18 = Color.New(0, 0, 0)

				var_50_18.a = 1
				arg_47_1.mask_.color = var_50_18
			end

			local var_50_19 = 2

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1.mask_.enabled = true
				arg_47_1.mask_.raycastTarget = true

				arg_47_1:SetGaussion(false)
			end

			local var_50_20 = 2

			if var_50_19 <= arg_47_1.time_ and arg_47_1.time_ < var_50_19 + var_50_20 then
				local var_50_21 = (arg_47_1.time_ - var_50_19) / var_50_20
				local var_50_22 = Color.New(0, 0, 0)

				var_50_22.a = Mathf.Lerp(1, 0, var_50_21)
				arg_47_1.mask_.color = var_50_22
			end

			if arg_47_1.time_ >= var_50_19 + var_50_20 and arg_47_1.time_ < var_50_19 + var_50_20 + arg_50_0 then
				local var_50_23 = Color.New(0, 0, 0)
				local var_50_24 = 0

				arg_47_1.mask_.enabled = false
				var_50_23.a = var_50_24
				arg_47_1.mask_.color = var_50_23
			end

			local var_50_25 = arg_47_1.actors_["1094ui_story"].transform
			local var_50_26 = 4

			if var_50_26 < arg_47_1.time_ and arg_47_1.time_ <= var_50_26 + arg_50_0 then
				arg_47_1.var_.moveOldPos1094ui_story = var_50_25.localPosition
			end

			local var_50_27 = 0.001

			if var_50_26 <= arg_47_1.time_ and arg_47_1.time_ < var_50_26 + var_50_27 then
				local var_50_28 = (arg_47_1.time_ - var_50_26) / var_50_27
				local var_50_29 = Vector3.New(0, -0.84, -6.1)

				var_50_25.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1094ui_story, var_50_29, var_50_28)

				local var_50_30 = manager.ui.mainCamera.transform.position - var_50_25.position

				var_50_25.forward = Vector3.New(var_50_30.x, var_50_30.y, var_50_30.z)

				local var_50_31 = var_50_25.localEulerAngles

				var_50_31.z = 0
				var_50_31.x = 0
				var_50_25.localEulerAngles = var_50_31
			end

			if arg_47_1.time_ >= var_50_26 + var_50_27 and arg_47_1.time_ < var_50_26 + var_50_27 + arg_50_0 then
				var_50_25.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_50_32 = manager.ui.mainCamera.transform.position - var_50_25.position

				var_50_25.forward = Vector3.New(var_50_32.x, var_50_32.y, var_50_32.z)

				local var_50_33 = var_50_25.localEulerAngles

				var_50_33.z = 0
				var_50_33.x = 0
				var_50_25.localEulerAngles = var_50_33
			end

			local var_50_34 = arg_47_1.actors_["1094ui_story"]
			local var_50_35 = 4

			if var_50_35 < arg_47_1.time_ and arg_47_1.time_ <= var_50_35 + arg_50_0 and arg_47_1.var_.characterEffect1094ui_story == nil then
				arg_47_1.var_.characterEffect1094ui_story = var_50_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_36 = 0.200000002980232

			if var_50_35 <= arg_47_1.time_ and arg_47_1.time_ < var_50_35 + var_50_36 then
				local var_50_37 = (arg_47_1.time_ - var_50_35) / var_50_36

				if arg_47_1.var_.characterEffect1094ui_story then
					arg_47_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_35 + var_50_36 and arg_47_1.time_ < var_50_35 + var_50_36 + arg_50_0 and arg_47_1.var_.characterEffect1094ui_story then
				arg_47_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_50_38 = 4

			if var_50_38 < arg_47_1.time_ and arg_47_1.time_ <= var_50_38 + arg_50_0 then
				arg_47_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_50_39 = 4

			if var_50_39 < arg_47_1.time_ and arg_47_1.time_ <= var_50_39 + arg_50_0 then
				arg_47_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			if arg_47_1.frameCnt_ <= 1 then
				arg_47_1.dialog_:SetActive(false)
			end

			local var_50_40 = 4
			local var_50_41 = 0.1

			if var_50_40 < arg_47_1.time_ and arg_47_1.time_ <= var_50_40 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0

				arg_47_1.dialog_:SetActive(true)

				local var_50_42 = LeanTween.value(arg_47_1.dialog_, 0, 1, 0.3)

				var_50_42:setOnUpdate(LuaHelper.FloatAction(function(arg_51_0)
					arg_47_1.dialogCg_.alpha = arg_51_0
				end))
				var_50_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_47_1.dialog_)
					var_50_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_47_1.duration_ = arg_47_1.duration_ + 0.3

				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_43 = arg_47_1:FormatText(StoryNameCfg[181].name)

				arg_47_1.leftNameTxt_.text = var_50_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_44 = arg_47_1:GetWordFromCfg(1109402012)
				local var_50_45 = arg_47_1:FormatText(var_50_44.content)

				arg_47_1.text_.text = var_50_45

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_46 = 4
				local var_50_47 = utf8.len(var_50_45)
				local var_50_48 = var_50_46 <= 0 and var_50_41 or var_50_41 * (var_50_47 / var_50_46)

				if var_50_48 > 0 and var_50_41 < var_50_48 then
					arg_47_1.talkMaxDuration = var_50_48
					var_50_40 = var_50_40 + 0.3

					if var_50_48 + var_50_40 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_48 + var_50_40
					end
				end

				arg_47_1.text_.text = var_50_45
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402012", "story_v_side_new_1109402.awb") ~= 0 then
					local var_50_49 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402012", "story_v_side_new_1109402.awb") / 1000

					if var_50_49 + var_50_40 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_49 + var_50_40
					end

					if var_50_44.prefab_name ~= "" and arg_47_1.actors_[var_50_44.prefab_name] ~= nil then
						local var_50_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_44.prefab_name].transform, "story_v_side_new_1109402", "1109402012", "story_v_side_new_1109402.awb")

						arg_47_1:RecordAudio("1109402012", var_50_50)
						arg_47_1:RecordAudio("1109402012", var_50_50)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402012", "story_v_side_new_1109402.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402012", "story_v_side_new_1109402.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_51 = var_50_40 + 0.3
			local var_50_52 = math.max(var_50_41, arg_47_1.talkMaxDuration)

			if var_50_51 <= arg_47_1.time_ and arg_47_1.time_ < var_50_51 + var_50_52 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_51) / var_50_52

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_51 + var_50_52 and arg_47_1.time_ < var_50_51 + var_50_52 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 1109402013
		arg_53_1.duration_ = 5

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play1109402014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1094ui_story"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.characterEffect1094ui_story == nil then
				arg_53_1.var_.characterEffect1094ui_story = var_56_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_56_2 = 0.200000002980232

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.characterEffect1094ui_story then
					local var_56_4 = Mathf.Lerp(0, 0.5, var_56_3)

					arg_53_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_53_1.var_.characterEffect1094ui_story.fillRatio = var_56_4
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.characterEffect1094ui_story then
				local var_56_5 = 0.5

				arg_53_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_53_1.var_.characterEffect1094ui_story.fillRatio = var_56_5
			end

			local var_56_6 = 0
			local var_56_7 = 0.075

			if var_56_6 < arg_53_1.time_ and arg_53_1.time_ <= var_56_6 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_8 = arg_53_1:FormatText(StoryNameCfg[7].name)

				arg_53_1.leftNameTxt_.text = var_56_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_9 = arg_53_1:GetWordFromCfg(1109402013)
				local var_56_10 = arg_53_1:FormatText(var_56_9.content)

				arg_53_1.text_.text = var_56_10

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_11 = 3
				local var_56_12 = utf8.len(var_56_10)
				local var_56_13 = var_56_11 <= 0 and var_56_7 or var_56_7 * (var_56_12 / var_56_11)

				if var_56_13 > 0 and var_56_7 < var_56_13 then
					arg_53_1.talkMaxDuration = var_56_13

					if var_56_13 + var_56_6 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_13 + var_56_6
					end
				end

				arg_53_1.text_.text = var_56_10
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)
				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_14 = math.max(var_56_7, arg_53_1.talkMaxDuration)

			if var_56_6 <= arg_53_1.time_ and arg_53_1.time_ < var_56_6 + var_56_14 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_6) / var_56_14

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_6 + var_56_14 and arg_53_1.time_ < var_56_6 + var_56_14 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 1109402014
		arg_57_1.duration_ = 6.6

		local var_57_0 = {
			ja = 5.566,
			ko = 6.6,
			zh = 6.6
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
				arg_57_0:Play1109402015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1094ui_story"].transform
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 then
				arg_57_1.var_.moveOldPos1094ui_story = var_60_0.localPosition
			end

			local var_60_2 = 0.001

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2
				local var_60_4 = Vector3.New(0, -0.84, -6.1)

				var_60_0.localPosition = Vector3.Lerp(arg_57_1.var_.moveOldPos1094ui_story, var_60_4, var_60_3)

				local var_60_5 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_5.x, var_60_5.y, var_60_5.z)

				local var_60_6 = var_60_0.localEulerAngles

				var_60_6.z = 0
				var_60_6.x = 0
				var_60_0.localEulerAngles = var_60_6
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 then
				var_60_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_60_7 = manager.ui.mainCamera.transform.position - var_60_0.position

				var_60_0.forward = Vector3.New(var_60_7.x, var_60_7.y, var_60_7.z)

				local var_60_8 = var_60_0.localEulerAngles

				var_60_8.z = 0
				var_60_8.x = 0
				var_60_0.localEulerAngles = var_60_8
			end

			local var_60_9 = arg_57_1.actors_["1094ui_story"]
			local var_60_10 = 0

			if var_60_10 < arg_57_1.time_ and arg_57_1.time_ <= var_60_10 + arg_60_0 and arg_57_1.var_.characterEffect1094ui_story == nil then
				arg_57_1.var_.characterEffect1094ui_story = var_60_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_60_11 = 0.200000002980232

			if var_60_10 <= arg_57_1.time_ and arg_57_1.time_ < var_60_10 + var_60_11 then
				local var_60_12 = (arg_57_1.time_ - var_60_10) / var_60_11

				if arg_57_1.var_.characterEffect1094ui_story then
					arg_57_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_57_1.time_ >= var_60_10 + var_60_11 and arg_57_1.time_ < var_60_10 + var_60_11 + arg_60_0 and arg_57_1.var_.characterEffect1094ui_story then
				arg_57_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_60_13 = 0

			if var_60_13 < arg_57_1.time_ and arg_57_1.time_ <= var_60_13 + arg_60_0 then
				arg_57_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_1")
			end

			local var_60_14 = 0

			if var_60_14 < arg_57_1.time_ and arg_57_1.time_ <= var_60_14 + arg_60_0 then
				arg_57_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_60_15 = 0
			local var_60_16 = 0.675

			if var_60_15 < arg_57_1.time_ and arg_57_1.time_ <= var_60_15 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_17 = arg_57_1:FormatText(StoryNameCfg[181].name)

				arg_57_1.leftNameTxt_.text = var_60_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_18 = arg_57_1:GetWordFromCfg(1109402014)
				local var_60_19 = arg_57_1:FormatText(var_60_18.content)

				arg_57_1.text_.text = var_60_19

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_20 = 27
				local var_60_21 = utf8.len(var_60_19)
				local var_60_22 = var_60_20 <= 0 and var_60_16 or var_60_16 * (var_60_21 / var_60_20)

				if var_60_22 > 0 and var_60_16 < var_60_22 then
					arg_57_1.talkMaxDuration = var_60_22

					if var_60_22 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_22 + var_60_15
					end
				end

				arg_57_1.text_.text = var_60_19
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402014", "story_v_side_new_1109402.awb") ~= 0 then
					local var_60_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402014", "story_v_side_new_1109402.awb") / 1000

					if var_60_23 + var_60_15 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_23 + var_60_15
					end

					if var_60_18.prefab_name ~= "" and arg_57_1.actors_[var_60_18.prefab_name] ~= nil then
						local var_60_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_18.prefab_name].transform, "story_v_side_new_1109402", "1109402014", "story_v_side_new_1109402.awb")

						arg_57_1:RecordAudio("1109402014", var_60_24)
						arg_57_1:RecordAudio("1109402014", var_60_24)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402014", "story_v_side_new_1109402.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402014", "story_v_side_new_1109402.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_25 = math.max(var_60_16, arg_57_1.talkMaxDuration)

			if var_60_15 <= arg_57_1.time_ and arg_57_1.time_ < var_60_15 + var_60_25 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_15) / var_60_25

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_15 + var_60_25 and arg_57_1.time_ < var_60_15 + var_60_25 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 1109402015
		arg_61_1.duration_ = 5

		SetActive(arg_61_1.tipsGo_, false)

		function arg_61_1.onSingleLineFinish_()
			arg_61_1.onSingleLineUpdate_ = nil
			arg_61_1.onSingleLineFinish_ = nil
			arg_61_1.state_ = "waiting"
		end

		function arg_61_1.playNext_(arg_63_0)
			if arg_63_0 == 1 then
				arg_61_0:Play1109402016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1094ui_story"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.characterEffect1094ui_story == nil then
				arg_61_1.var_.characterEffect1094ui_story = var_64_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_64_2 = 0.200000002980232

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.characterEffect1094ui_story then
					local var_64_4 = Mathf.Lerp(0, 0.5, var_64_3)

					arg_61_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_61_1.var_.characterEffect1094ui_story.fillRatio = var_64_4
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.characterEffect1094ui_story then
				local var_64_5 = 0.5

				arg_61_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_61_1.var_.characterEffect1094ui_story.fillRatio = var_64_5
			end

			local var_64_6 = 0
			local var_64_7 = 0.7

			if var_64_6 < arg_61_1.time_ and arg_61_1.time_ <= var_64_6 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_8 = arg_61_1:FormatText(StoryNameCfg[7].name)

				arg_61_1.leftNameTxt_.text = var_64_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_9 = arg_61_1:GetWordFromCfg(1109402015)
				local var_64_10 = arg_61_1:FormatText(var_64_9.content)

				arg_61_1.text_.text = var_64_10

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_11 = 28
				local var_64_12 = utf8.len(var_64_10)
				local var_64_13 = var_64_11 <= 0 and var_64_7 or var_64_7 * (var_64_12 / var_64_11)

				if var_64_13 > 0 and var_64_7 < var_64_13 then
					arg_61_1.talkMaxDuration = var_64_13

					if var_64_13 + var_64_6 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_13 + var_64_6
					end
				end

				arg_61_1.text_.text = var_64_10
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)
				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_14 = math.max(var_64_7, arg_61_1.talkMaxDuration)

			if var_64_6 <= arg_61_1.time_ and arg_61_1.time_ < var_64_6 + var_64_14 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_6) / var_64_14

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_6 + var_64_14 and arg_61_1.time_ < var_64_6 + var_64_14 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 1109402016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play1109402017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 0.85

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, true)

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[7].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(1109402016)
				local var_68_4 = arg_65_1:FormatText(var_68_3.content)

				arg_65_1.text_.text = var_68_4

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_5 = 34
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
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_8 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_8 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_8

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_8 and arg_65_1.time_ < var_68_0 + var_68_8 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 1109402017
		arg_69_1.duration_ = 2.7

		local var_69_0 = {
			ja = 2.7,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_69_0:Play1109402018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1094ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1094ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, -0.84, -6.1)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1094ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = arg_69_1.actors_["1094ui_story"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect1094ui_story == nil then
				arg_69_1.var_.characterEffect1094ui_story = var_72_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_11 = 0.200000002980232

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.characterEffect1094ui_story then
					arg_69_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.characterEffect1094ui_story then
				arg_69_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_72_14 = 0
			local var_72_15 = 0.275

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_16 = arg_69_1:FormatText(StoryNameCfg[181].name)

				arg_69_1.leftNameTxt_.text = var_72_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_17 = arg_69_1:GetWordFromCfg(1109402017)
				local var_72_18 = arg_69_1:FormatText(var_72_17.content)

				arg_69_1.text_.text = var_72_18

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_19 = 11
				local var_72_20 = utf8.len(var_72_18)
				local var_72_21 = var_72_19 <= 0 and var_72_15 or var_72_15 * (var_72_20 / var_72_19)

				if var_72_21 > 0 and var_72_15 < var_72_21 then
					arg_69_1.talkMaxDuration = var_72_21

					if var_72_21 + var_72_14 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_14
					end
				end

				arg_69_1.text_.text = var_72_18
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402017", "story_v_side_new_1109402.awb") ~= 0 then
					local var_72_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402017", "story_v_side_new_1109402.awb") / 1000

					if var_72_22 + var_72_14 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_22 + var_72_14
					end

					if var_72_17.prefab_name ~= "" and arg_69_1.actors_[var_72_17.prefab_name] ~= nil then
						local var_72_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_17.prefab_name].transform, "story_v_side_new_1109402", "1109402017", "story_v_side_new_1109402.awb")

						arg_69_1:RecordAudio("1109402017", var_72_23)
						arg_69_1:RecordAudio("1109402017", var_72_23)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402017", "story_v_side_new_1109402.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402017", "story_v_side_new_1109402.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_24 = math.max(var_72_15, arg_69_1.talkMaxDuration)

			if var_72_14 <= arg_69_1.time_ and arg_69_1.time_ < var_72_14 + var_72_24 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_14) / var_72_24

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_14 + var_72_24 and arg_69_1.time_ < var_72_14 + var_72_24 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 1109402018
		arg_73_1.duration_ = 5

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play1109402019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1094ui_story"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.characterEffect1094ui_story == nil then
				arg_73_1.var_.characterEffect1094ui_story = var_76_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_2 = 0.200000002980232

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.characterEffect1094ui_story then
					local var_76_4 = Mathf.Lerp(0, 0.5, var_76_3)

					arg_73_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1094ui_story.fillRatio = var_76_4
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.characterEffect1094ui_story then
				local var_76_5 = 0.5

				arg_73_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1094ui_story.fillRatio = var_76_5
			end

			local var_76_6 = 0
			local var_76_7 = 1.125

			if var_76_6 < arg_73_1.time_ and arg_73_1.time_ <= var_76_6 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_8 = arg_73_1:FormatText(StoryNameCfg[7].name)

				arg_73_1.leftNameTxt_.text = var_76_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_9 = arg_73_1:GetWordFromCfg(1109402018)
				local var_76_10 = arg_73_1:FormatText(var_76_9.content)

				arg_73_1.text_.text = var_76_10

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_11 = 45
				local var_76_12 = utf8.len(var_76_10)
				local var_76_13 = var_76_11 <= 0 and var_76_7 or var_76_7 * (var_76_12 / var_76_11)

				if var_76_13 > 0 and var_76_7 < var_76_13 then
					arg_73_1.talkMaxDuration = var_76_13

					if var_76_13 + var_76_6 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_13 + var_76_6
					end
				end

				arg_73_1.text_.text = var_76_10
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_14 = math.max(var_76_7, arg_73_1.talkMaxDuration)

			if var_76_6 <= arg_73_1.time_ and arg_73_1.time_ < var_76_6 + var_76_14 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_6) / var_76_14

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_6 + var_76_14 and arg_73_1.time_ < var_76_6 + var_76_14 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 1109402019
		arg_77_1.duration_ = 5

		SetActive(arg_77_1.tipsGo_, false)

		function arg_77_1.onSingleLineFinish_()
			arg_77_1.onSingleLineUpdate_ = nil
			arg_77_1.onSingleLineFinish_ = nil
			arg_77_1.state_ = "waiting"
		end

		function arg_77_1.playNext_(arg_79_0)
			if arg_79_0 == 1 then
				arg_77_0:Play1109402020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = 0
			local var_80_1 = 0.65

			if var_80_0 < arg_77_1.time_ and arg_77_1.time_ <= var_80_0 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, false)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_2 = arg_77_1:GetWordFromCfg(1109402019)
				local var_80_3 = arg_77_1:FormatText(var_80_2.content)

				arg_77_1.text_.text = var_80_3

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_4 = 26
				local var_80_5 = utf8.len(var_80_3)
				local var_80_6 = var_80_4 <= 0 and var_80_1 or var_80_1 * (var_80_5 / var_80_4)

				if var_80_6 > 0 and var_80_1 < var_80_6 then
					arg_77_1.talkMaxDuration = var_80_6

					if var_80_6 + var_80_0 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_6 + var_80_0
					end
				end

				arg_77_1.text_.text = var_80_3
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)
				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_7 = math.max(var_80_1, arg_77_1.talkMaxDuration)

			if var_80_0 <= arg_77_1.time_ and arg_77_1.time_ < var_80_0 + var_80_7 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_0) / var_80_7

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_0 + var_80_7 and arg_77_1.time_ < var_80_0 + var_80_7 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 1109402020
		arg_81_1.duration_ = 1.999999999999

		SetActive(arg_81_1.tipsGo_, false)

		function arg_81_1.onSingleLineFinish_()
			arg_81_1.onSingleLineUpdate_ = nil
			arg_81_1.onSingleLineFinish_ = nil
			arg_81_1.state_ = "waiting"
		end

		function arg_81_1.playNext_(arg_83_0)
			if arg_83_0 == 1 then
				arg_81_0:Play1109402021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = 0

			if var_84_0 < arg_81_1.time_ and arg_81_1.time_ <= var_84_0 + arg_84_0 then
				arg_81_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_2")
			end

			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 then
				arg_81_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_84_2 = arg_81_1.actors_["1094ui_story"]
			local var_84_3 = 0

			if var_84_3 < arg_81_1.time_ and arg_81_1.time_ <= var_84_3 + arg_84_0 and arg_81_1.var_.characterEffect1094ui_story == nil then
				arg_81_1.var_.characterEffect1094ui_story = var_84_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_4 = 0.2

			if var_84_3 <= arg_81_1.time_ and arg_81_1.time_ < var_84_3 + var_84_4 then
				local var_84_5 = (arg_81_1.time_ - var_84_3) / var_84_4

				if arg_81_1.var_.characterEffect1094ui_story then
					arg_81_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_3 + var_84_4 and arg_81_1.time_ < var_84_3 + var_84_4 + arg_84_0 and arg_81_1.var_.characterEffect1094ui_story then
				arg_81_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_84_6 = 0
			local var_84_7 = 0.625

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, false)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_8 = arg_81_1:GetWordFromCfg(1109402020)
				local var_84_9 = arg_81_1:FormatText(var_84_8.content)

				arg_81_1.text_.text = var_84_9

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_10 = 24
				local var_84_11 = utf8.len(var_84_9)
				local var_84_12 = var_84_10 <= 0 and var_84_7 or var_84_7 * (var_84_11 / var_84_10)

				if var_84_12 > 0 and var_84_7 < var_84_12 then
					arg_81_1.talkMaxDuration = var_84_12

					if var_84_12 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_12 + var_84_6
					end
				end

				arg_81_1.text_.text = var_84_9
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402020", "story_v_side_new_1109402.awb") ~= 0 then
					local var_84_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402020", "story_v_side_new_1109402.awb") / 1000

					if var_84_13 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_13 + var_84_6
					end

					if var_84_8.prefab_name ~= "" and arg_81_1.actors_[var_84_8.prefab_name] ~= nil then
						local var_84_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_8.prefab_name].transform, "story_v_side_new_1109402", "1109402020", "story_v_side_new_1109402.awb")

						arg_81_1:RecordAudio("1109402020", var_84_14)
						arg_81_1:RecordAudio("1109402020", var_84_14)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402020", "story_v_side_new_1109402.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402020", "story_v_side_new_1109402.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_15 = math.max(var_84_7, arg_81_1.talkMaxDuration)

			if var_84_6 <= arg_81_1.time_ and arg_81_1.time_ < var_84_6 + var_84_15 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_6) / var_84_15

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_6 + var_84_15 and arg_81_1.time_ < var_84_6 + var_84_15 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 1109402021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play1109402022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_88_1 = 0
			local var_88_2 = 0.5

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, false)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_3 = arg_85_1:GetWordFromCfg(1109402021)
				local var_88_4 = arg_85_1:FormatText(var_88_3.content)

				arg_85_1.text_.text = var_88_4

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_5 = 20
				local var_88_6 = utf8.len(var_88_4)
				local var_88_7 = var_88_5 <= 0 and var_88_2 or var_88_2 * (var_88_6 / var_88_5)

				if var_88_7 > 0 and var_88_2 < var_88_7 then
					arg_85_1.talkMaxDuration = var_88_7

					if var_88_7 + var_88_1 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_7 + var_88_1
					end
				end

				arg_85_1.text_.text = var_88_4
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)
				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_8 = math.max(var_88_2, arg_85_1.talkMaxDuration)

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_8 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_1) / var_88_8

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_1 + var_88_8 and arg_85_1.time_ < var_88_1 + var_88_8 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 1109402022
		arg_89_1.duration_ = 3.366

		local var_89_0 = {
			ja = 2.7,
			ko = 3.366,
			zh = 3.366
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
				arg_89_0:Play1109402023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["1094ui_story"].transform
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 then
				arg_89_1.var_.moveOldPos1094ui_story = var_92_0.localPosition
			end

			local var_92_2 = 0.001

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2
				local var_92_4 = Vector3.New(0, -0.84, -6.1)

				var_92_0.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1094ui_story, var_92_4, var_92_3)

				local var_92_5 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_5.x, var_92_5.y, var_92_5.z)

				local var_92_6 = var_92_0.localEulerAngles

				var_92_6.z = 0
				var_92_6.x = 0
				var_92_0.localEulerAngles = var_92_6
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 then
				var_92_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_92_7 = manager.ui.mainCamera.transform.position - var_92_0.position

				var_92_0.forward = Vector3.New(var_92_7.x, var_92_7.y, var_92_7.z)

				local var_92_8 = var_92_0.localEulerAngles

				var_92_8.z = 0
				var_92_8.x = 0
				var_92_0.localEulerAngles = var_92_8
			end

			local var_92_9 = arg_89_1.actors_["1094ui_story"]
			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 and arg_89_1.var_.characterEffect1094ui_story == nil then
				arg_89_1.var_.characterEffect1094ui_story = var_92_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_11 = 0.200000002980232

			if var_92_10 <= arg_89_1.time_ and arg_89_1.time_ < var_92_10 + var_92_11 then
				local var_92_12 = (arg_89_1.time_ - var_92_10) / var_92_11

				if arg_89_1.var_.characterEffect1094ui_story then
					arg_89_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_10 + var_92_11 and arg_89_1.time_ < var_92_10 + var_92_11 + arg_92_0 and arg_89_1.var_.characterEffect1094ui_story then
				arg_89_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_92_13 = 0

			if var_92_13 < arg_89_1.time_ and arg_89_1.time_ <= var_92_13 + arg_92_0 then
				arg_89_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action3_1")
			end

			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 then
				arg_89_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_92_15 = 0
			local var_92_16 = 0.3

			if var_92_15 < arg_89_1.time_ and arg_89_1.time_ <= var_92_15 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_17 = arg_89_1:FormatText(StoryNameCfg[181].name)

				arg_89_1.leftNameTxt_.text = var_92_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_18 = arg_89_1:GetWordFromCfg(1109402022)
				local var_92_19 = arg_89_1:FormatText(var_92_18.content)

				arg_89_1.text_.text = var_92_19

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_20 = 12
				local var_92_21 = utf8.len(var_92_19)
				local var_92_22 = var_92_20 <= 0 and var_92_16 or var_92_16 * (var_92_21 / var_92_20)

				if var_92_22 > 0 and var_92_16 < var_92_22 then
					arg_89_1.talkMaxDuration = var_92_22

					if var_92_22 + var_92_15 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_22 + var_92_15
					end
				end

				arg_89_1.text_.text = var_92_19
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402022", "story_v_side_new_1109402.awb") ~= 0 then
					local var_92_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402022", "story_v_side_new_1109402.awb") / 1000

					if var_92_23 + var_92_15 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_23 + var_92_15
					end

					if var_92_18.prefab_name ~= "" and arg_89_1.actors_[var_92_18.prefab_name] ~= nil then
						local var_92_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_18.prefab_name].transform, "story_v_side_new_1109402", "1109402022", "story_v_side_new_1109402.awb")

						arg_89_1:RecordAudio("1109402022", var_92_24)
						arg_89_1:RecordAudio("1109402022", var_92_24)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402022", "story_v_side_new_1109402.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402022", "story_v_side_new_1109402.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_25 = math.max(var_92_16, arg_89_1.talkMaxDuration)

			if var_92_15 <= arg_89_1.time_ and arg_89_1.time_ < var_92_15 + var_92_25 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_15) / var_92_25

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_15 + var_92_25 and arg_89_1.time_ < var_92_15 + var_92_25 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 1109402023
		arg_93_1.duration_ = 5

		SetActive(arg_93_1.tipsGo_, false)

		function arg_93_1.onSingleLineFinish_()
			arg_93_1.onSingleLineUpdate_ = nil
			arg_93_1.onSingleLineFinish_ = nil
			arg_93_1.state_ = "waiting"
		end

		function arg_93_1.playNext_(arg_95_0)
			if arg_95_0 == 1 then
				arg_93_0:Play1109402024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["1094ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect1094ui_story == nil then
				arg_93_1.var_.characterEffect1094ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect1094ui_story then
					local var_96_4 = Mathf.Lerp(0, 0.5, var_96_3)

					arg_93_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1094ui_story.fillRatio = var_96_4
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect1094ui_story then
				local var_96_5 = 0.5

				arg_93_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1094ui_story.fillRatio = var_96_5
			end

			local var_96_6 = 0
			local var_96_7 = 0.5

			if var_96_6 < arg_93_1.time_ and arg_93_1.time_ <= var_96_6 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_8 = arg_93_1:FormatText(StoryNameCfg[7].name)

				arg_93_1.leftNameTxt_.text = var_96_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_9 = arg_93_1:GetWordFromCfg(1109402023)
				local var_96_10 = arg_93_1:FormatText(var_96_9.content)

				arg_93_1.text_.text = var_96_10

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_11 = 20
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
				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_14 = math.max(var_96_7, arg_93_1.talkMaxDuration)

			if var_96_6 <= arg_93_1.time_ and arg_93_1.time_ < var_96_6 + var_96_14 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_6) / var_96_14

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_6 + var_96_14 and arg_93_1.time_ < var_96_6 + var_96_14 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 1109402024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play1109402025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = 0
			local var_100_1 = 0.15

			if var_100_0 < arg_97_1.time_ and arg_97_1.time_ <= var_100_0 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_2 = arg_97_1:FormatText(StoryNameCfg[7].name)

				arg_97_1.leftNameTxt_.text = var_100_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_3 = arg_97_1:GetWordFromCfg(1109402024)
				local var_100_4 = arg_97_1:FormatText(var_100_3.content)

				arg_97_1.text_.text = var_100_4

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_5 = 6
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
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_8 = math.max(var_100_1, arg_97_1.talkMaxDuration)

			if var_100_0 <= arg_97_1.time_ and arg_97_1.time_ < var_100_0 + var_100_8 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_0) / var_100_8

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_0 + var_100_8 and arg_97_1.time_ < var_100_0 + var_100_8 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 1109402025
		arg_101_1.duration_ = 5.4

		local var_101_0 = {
			ja = 4.8,
			ko = 5.4,
			zh = 5.4
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
				arg_101_0:Play1109402026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1094ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos1094ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0, -0.84, -6.1)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos1094ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["1094ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect1094ui_story == nil then
				arg_101_1.var_.characterEffect1094ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect1094ui_story then
					arg_101_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect1094ui_story then
				arg_101_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_104_13 = 0

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action3_2")
			end

			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_104_15 = 0
			local var_104_16 = 0.325

			if var_104_15 < arg_101_1.time_ and arg_101_1.time_ <= var_104_15 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_17 = arg_101_1:FormatText(StoryNameCfg[181].name)

				arg_101_1.leftNameTxt_.text = var_104_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_18 = arg_101_1:GetWordFromCfg(1109402025)
				local var_104_19 = arg_101_1:FormatText(var_104_18.content)

				arg_101_1.text_.text = var_104_19

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_20 = 13
				local var_104_21 = utf8.len(var_104_19)
				local var_104_22 = var_104_20 <= 0 and var_104_16 or var_104_16 * (var_104_21 / var_104_20)

				if var_104_22 > 0 and var_104_16 < var_104_22 then
					arg_101_1.talkMaxDuration = var_104_22

					if var_104_22 + var_104_15 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_22 + var_104_15
					end
				end

				arg_101_1.text_.text = var_104_19
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402025", "story_v_side_new_1109402.awb") ~= 0 then
					local var_104_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402025", "story_v_side_new_1109402.awb") / 1000

					if var_104_23 + var_104_15 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_23 + var_104_15
					end

					if var_104_18.prefab_name ~= "" and arg_101_1.actors_[var_104_18.prefab_name] ~= nil then
						local var_104_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_18.prefab_name].transform, "story_v_side_new_1109402", "1109402025", "story_v_side_new_1109402.awb")

						arg_101_1:RecordAudio("1109402025", var_104_24)
						arg_101_1:RecordAudio("1109402025", var_104_24)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402025", "story_v_side_new_1109402.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402025", "story_v_side_new_1109402.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_25 = math.max(var_104_16, arg_101_1.talkMaxDuration)

			if var_104_15 <= arg_101_1.time_ and arg_101_1.time_ < var_104_15 + var_104_25 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_15) / var_104_25

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_15 + var_104_25 and arg_101_1.time_ < var_104_15 + var_104_25 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 1109402026
		arg_105_1.duration_ = 5

		SetActive(arg_105_1.tipsGo_, false)

		function arg_105_1.onSingleLineFinish_()
			arg_105_1.onSingleLineUpdate_ = nil
			arg_105_1.onSingleLineFinish_ = nil
			arg_105_1.state_ = "waiting"
		end

		function arg_105_1.playNext_(arg_107_0)
			if arg_107_0 == 1 then
				arg_105_0:Play1109402027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["1094ui_story"]
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 and arg_105_1.var_.characterEffect1094ui_story == nil then
				arg_105_1.var_.characterEffect1094ui_story = var_108_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_2 = 0.200000002980232

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2

				if arg_105_1.var_.characterEffect1094ui_story then
					local var_108_4 = Mathf.Lerp(0, 0.5, var_108_3)

					arg_105_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1094ui_story.fillRatio = var_108_4
				end
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 and arg_105_1.var_.characterEffect1094ui_story then
				local var_108_5 = 0.5

				arg_105_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1094ui_story.fillRatio = var_108_5
			end

			local var_108_6 = 0
			local var_108_7 = 0.55

			if var_108_6 < arg_105_1.time_ and arg_105_1.time_ <= var_108_6 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, false)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_8 = arg_105_1:GetWordFromCfg(1109402026)
				local var_108_9 = arg_105_1:FormatText(var_108_8.content)

				arg_105_1.text_.text = var_108_9

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_10 = 22
				local var_108_11 = utf8.len(var_108_9)
				local var_108_12 = var_108_10 <= 0 and var_108_7 or var_108_7 * (var_108_11 / var_108_10)

				if var_108_12 > 0 and var_108_7 < var_108_12 then
					arg_105_1.talkMaxDuration = var_108_12

					if var_108_12 + var_108_6 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_12 + var_108_6
					end
				end

				arg_105_1.text_.text = var_108_9
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)
				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_13 = math.max(var_108_7, arg_105_1.talkMaxDuration)

			if var_108_6 <= arg_105_1.time_ and arg_105_1.time_ < var_108_6 + var_108_13 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_6) / var_108_13

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_6 + var_108_13 and arg_105_1.time_ < var_108_6 + var_108_13 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 1109402027
		arg_109_1.duration_ = 5

		SetActive(arg_109_1.tipsGo_, false)

		function arg_109_1.onSingleLineFinish_()
			arg_109_1.onSingleLineUpdate_ = nil
			arg_109_1.onSingleLineFinish_ = nil
			arg_109_1.state_ = "waiting"
		end

		function arg_109_1.playNext_(arg_111_0)
			if arg_111_0 == 1 then
				arg_109_0:Play1109402028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 0.85

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, false)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_2 = arg_109_1:GetWordFromCfg(1109402027)
				local var_112_3 = arg_109_1:FormatText(var_112_2.content)

				arg_109_1.text_.text = var_112_3

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_4 = 34
				local var_112_5 = utf8.len(var_112_3)
				local var_112_6 = var_112_4 <= 0 and var_112_1 or var_112_1 * (var_112_5 / var_112_4)

				if var_112_6 > 0 and var_112_1 < var_112_6 then
					arg_109_1.talkMaxDuration = var_112_6

					if var_112_6 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_6 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_3
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)
				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_7 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_7 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_7

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_7 and arg_109_1.time_ < var_112_0 + var_112_7 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 1109402028
		arg_113_1.duration_ = 4

		local var_113_0 = {
			ja = 4,
			ko = 3.833,
			zh = 3.833
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
				arg_113_0:Play1109402029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["1094ui_story"].transform
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.var_.moveOldPos1094ui_story = var_116_0.localPosition
			end

			local var_116_2 = 0.001

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2
				local var_116_4 = Vector3.New(0, -0.84, -6.1)

				var_116_0.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1094ui_story, var_116_4, var_116_3)

				local var_116_5 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_5.x, var_116_5.y, var_116_5.z)

				local var_116_6 = var_116_0.localEulerAngles

				var_116_6.z = 0
				var_116_6.x = 0
				var_116_0.localEulerAngles = var_116_6
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 then
				var_116_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_116_7 = manager.ui.mainCamera.transform.position - var_116_0.position

				var_116_0.forward = Vector3.New(var_116_7.x, var_116_7.y, var_116_7.z)

				local var_116_8 = var_116_0.localEulerAngles

				var_116_8.z = 0
				var_116_8.x = 0
				var_116_0.localEulerAngles = var_116_8
			end

			local var_116_9 = arg_113_1.actors_["1094ui_story"]
			local var_116_10 = 0

			if var_116_10 < arg_113_1.time_ and arg_113_1.time_ <= var_116_10 + arg_116_0 and arg_113_1.var_.characterEffect1094ui_story == nil then
				arg_113_1.var_.characterEffect1094ui_story = var_116_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_11 = 0.200000002980232

			if var_116_10 <= arg_113_1.time_ and arg_113_1.time_ < var_116_10 + var_116_11 then
				local var_116_12 = (arg_113_1.time_ - var_116_10) / var_116_11

				if arg_113_1.var_.characterEffect1094ui_story then
					arg_113_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_113_1.time_ >= var_116_10 + var_116_11 and arg_113_1.time_ < var_116_10 + var_116_11 + arg_116_0 and arg_113_1.var_.characterEffect1094ui_story then
				arg_113_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_116_13 = 0

			if var_116_13 < arg_113_1.time_ and arg_113_1.time_ <= var_116_13 + arg_116_0 then
				arg_113_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_116_14 = 0
			local var_116_15 = 0.25

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_16 = arg_113_1:FormatText(StoryNameCfg[181].name)

				arg_113_1.leftNameTxt_.text = var_116_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_17 = arg_113_1:GetWordFromCfg(1109402028)
				local var_116_18 = arg_113_1:FormatText(var_116_17.content)

				arg_113_1.text_.text = var_116_18

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_19 = 10
				local var_116_20 = utf8.len(var_116_18)
				local var_116_21 = var_116_19 <= 0 and var_116_15 or var_116_15 * (var_116_20 / var_116_19)

				if var_116_21 > 0 and var_116_15 < var_116_21 then
					arg_113_1.talkMaxDuration = var_116_21

					if var_116_21 + var_116_14 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_21 + var_116_14
					end
				end

				arg_113_1.text_.text = var_116_18
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402028", "story_v_side_new_1109402.awb") ~= 0 then
					local var_116_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402028", "story_v_side_new_1109402.awb") / 1000

					if var_116_22 + var_116_14 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_22 + var_116_14
					end

					if var_116_17.prefab_name ~= "" and arg_113_1.actors_[var_116_17.prefab_name] ~= nil then
						local var_116_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_17.prefab_name].transform, "story_v_side_new_1109402", "1109402028", "story_v_side_new_1109402.awb")

						arg_113_1:RecordAudio("1109402028", var_116_23)
						arg_113_1:RecordAudio("1109402028", var_116_23)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402028", "story_v_side_new_1109402.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402028", "story_v_side_new_1109402.awb")
				end

				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_24 = math.max(var_116_15, arg_113_1.talkMaxDuration)

			if var_116_14 <= arg_113_1.time_ and arg_113_1.time_ < var_116_14 + var_116_24 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_14) / var_116_24

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_14 + var_116_24 and arg_113_1.time_ < var_116_14 + var_116_24 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 1109402029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play1109402030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1094ui_story"]
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 and arg_117_1.var_.characterEffect1094ui_story == nil then
				arg_117_1.var_.characterEffect1094ui_story = var_120_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_2 = 0.200000002980232

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2

				if arg_117_1.var_.characterEffect1094ui_story then
					local var_120_4 = Mathf.Lerp(0, 0.5, var_120_3)

					arg_117_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_117_1.var_.characterEffect1094ui_story.fillRatio = var_120_4
				end
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 and arg_117_1.var_.characterEffect1094ui_story then
				local var_120_5 = 0.5

				arg_117_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_117_1.var_.characterEffect1094ui_story.fillRatio = var_120_5
			end

			local var_120_6 = 0
			local var_120_7 = 0.225

			if var_120_6 < arg_117_1.time_ and arg_117_1.time_ <= var_120_6 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_8 = arg_117_1:FormatText(StoryNameCfg[7].name)

				arg_117_1.leftNameTxt_.text = var_120_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_9 = arg_117_1:GetWordFromCfg(1109402029)
				local var_120_10 = arg_117_1:FormatText(var_120_9.content)

				arg_117_1.text_.text = var_120_10

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_11 = 9
				local var_120_12 = utf8.len(var_120_10)
				local var_120_13 = var_120_11 <= 0 and var_120_7 or var_120_7 * (var_120_12 / var_120_11)

				if var_120_13 > 0 and var_120_7 < var_120_13 then
					arg_117_1.talkMaxDuration = var_120_13

					if var_120_13 + var_120_6 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_13 + var_120_6
					end
				end

				arg_117_1.text_.text = var_120_10
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_14 = math.max(var_120_7, arg_117_1.talkMaxDuration)

			if var_120_6 <= arg_117_1.time_ and arg_117_1.time_ < var_120_6 + var_120_14 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_6) / var_120_14

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_6 + var_120_14 and arg_117_1.time_ < var_120_6 + var_120_14 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 1109402030
		arg_121_1.duration_ = 3.1

		local var_121_0 = {
			ja = 3.1,
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
				arg_121_0:Play1109402031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1094ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1094ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, -0.84, -6.1)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1094ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1094ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1094ui_story == nil then
				arg_121_1.var_.characterEffect1094ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1094ui_story then
					arg_121_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect1094ui_story then
				arg_121_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action4_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = 0
			local var_124_16 = 0.125

			if var_124_15 < arg_121_1.time_ and arg_121_1.time_ <= var_124_15 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_17 = arg_121_1:FormatText(StoryNameCfg[181].name)

				arg_121_1.leftNameTxt_.text = var_124_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_18 = arg_121_1:GetWordFromCfg(1109402030)
				local var_124_19 = arg_121_1:FormatText(var_124_18.content)

				arg_121_1.text_.text = var_124_19

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_20 = 5
				local var_124_21 = utf8.len(var_124_19)
				local var_124_22 = var_124_20 <= 0 and var_124_16 or var_124_16 * (var_124_21 / var_124_20)

				if var_124_22 > 0 and var_124_16 < var_124_22 then
					arg_121_1.talkMaxDuration = var_124_22

					if var_124_22 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_22 + var_124_15
					end
				end

				arg_121_1.text_.text = var_124_19
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402030", "story_v_side_new_1109402.awb") ~= 0 then
					local var_124_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402030", "story_v_side_new_1109402.awb") / 1000

					if var_124_23 + var_124_15 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_23 + var_124_15
					end

					if var_124_18.prefab_name ~= "" and arg_121_1.actors_[var_124_18.prefab_name] ~= nil then
						local var_124_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_18.prefab_name].transform, "story_v_side_new_1109402", "1109402030", "story_v_side_new_1109402.awb")

						arg_121_1:RecordAudio("1109402030", var_124_24)
						arg_121_1:RecordAudio("1109402030", var_124_24)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402030", "story_v_side_new_1109402.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402030", "story_v_side_new_1109402.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_25 = math.max(var_124_16, arg_121_1.talkMaxDuration)

			if var_124_15 <= arg_121_1.time_ and arg_121_1.time_ < var_124_15 + var_124_25 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_15) / var_124_25

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_15 + var_124_25 and arg_121_1.time_ < var_124_15 + var_124_25 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 1109402031
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play1109402032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["1094ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect1094ui_story == nil then
				arg_125_1.var_.characterEffect1094ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect1094ui_story then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_125_1.var_.characterEffect1094ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect1094ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_125_1.var_.characterEffect1094ui_story.fillRatio = var_128_5
			end

			local var_128_6 = 0
			local var_128_7 = 0.4

			if var_128_6 < arg_125_1.time_ and arg_125_1.time_ <= var_128_6 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_8 = arg_125_1:FormatText(StoryNameCfg[7].name)

				arg_125_1.leftNameTxt_.text = var_128_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_9 = arg_125_1:GetWordFromCfg(1109402031)
				local var_128_10 = arg_125_1:FormatText(var_128_9.content)

				arg_125_1.text_.text = var_128_10

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_11 = 16
				local var_128_12 = utf8.len(var_128_10)
				local var_128_13 = var_128_11 <= 0 and var_128_7 or var_128_7 * (var_128_12 / var_128_11)

				if var_128_13 > 0 and var_128_7 < var_128_13 then
					arg_125_1.talkMaxDuration = var_128_13

					if var_128_13 + var_128_6 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_13 + var_128_6
					end
				end

				arg_125_1.text_.text = var_128_10
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_14 = math.max(var_128_7, arg_125_1.talkMaxDuration)

			if var_128_6 <= arg_125_1.time_ and arg_125_1.time_ < var_128_6 + var_128_14 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_6) / var_128_14

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_6 + var_128_14 and arg_125_1.time_ < var_128_6 + var_128_14 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 1109402032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play1109402033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 0.4

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[7].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(1109402032)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 16
				local var_132_6 = utf8.len(var_132_4)
				local var_132_7 = var_132_5 <= 0 and var_132_1 or var_132_1 * (var_132_6 / var_132_5)

				if var_132_7 > 0 and var_132_1 < var_132_7 then
					arg_129_1.talkMaxDuration = var_132_7

					if var_132_7 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_7 + var_132_0
					end
				end

				arg_129_1.text_.text = var_132_4
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_8 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_8 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_8

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_8 and arg_129_1.time_ < var_132_0 + var_132_8 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 1109402033
		arg_133_1.duration_ = 5

		SetActive(arg_133_1.tipsGo_, false)

		function arg_133_1.onSingleLineFinish_()
			arg_133_1.onSingleLineUpdate_ = nil
			arg_133_1.onSingleLineFinish_ = nil
			arg_133_1.state_ = "waiting"
		end

		function arg_133_1.playNext_(arg_135_0)
			if arg_135_0 == 1 then
				arg_133_0:Play1109402034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1094ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1094ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, 100, 0)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1094ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, 100, 0)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = 0
			local var_136_10 = 0.625

			if var_136_9 < arg_133_1.time_ and arg_133_1.time_ <= var_136_9 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, false)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_11 = arg_133_1:GetWordFromCfg(1109402033)
				local var_136_12 = arg_133_1:FormatText(var_136_11.content)

				arg_133_1.text_.text = var_136_12

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_13 = 25
				local var_136_14 = utf8.len(var_136_12)
				local var_136_15 = var_136_13 <= 0 and var_136_10 or var_136_10 * (var_136_14 / var_136_13)

				if var_136_15 > 0 and var_136_10 < var_136_15 then
					arg_133_1.talkMaxDuration = var_136_15

					if var_136_15 + var_136_9 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_15 + var_136_9
					end
				end

				arg_133_1.text_.text = var_136_12
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)
				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_16 = math.max(var_136_10, arg_133_1.talkMaxDuration)

			if var_136_9 <= arg_133_1.time_ and arg_133_1.time_ < var_136_9 + var_136_16 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_9) / var_136_16

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_9 + var_136_16 and arg_133_1.time_ < var_136_9 + var_136_16 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 1109402034
		arg_137_1.duration_ = 5

		SetActive(arg_137_1.tipsGo_, false)

		function arg_137_1.onSingleLineFinish_()
			arg_137_1.onSingleLineUpdate_ = nil
			arg_137_1.onSingleLineFinish_ = nil
			arg_137_1.state_ = "waiting"
		end

		function arg_137_1.playNext_(arg_139_0)
			if arg_139_0 == 1 then
				arg_137_0:Play1109402035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.175

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[7].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(1109402034)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 7
				local var_140_6 = utf8.len(var_140_4)
				local var_140_7 = var_140_5 <= 0 and var_140_1 or var_140_1 * (var_140_6 / var_140_5)

				if var_140_7 > 0 and var_140_1 < var_140_7 then
					arg_137_1.talkMaxDuration = var_140_7

					if var_140_7 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_7 + var_140_0
					end
				end

				arg_137_1.text_.text = var_140_4
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)
				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_8 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_8 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_8

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_8 and arg_137_1.time_ < var_140_0 + var_140_8 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 1109402035
		arg_141_1.duration_ = 5

		SetActive(arg_141_1.tipsGo_, false)

		function arg_141_1.onSingleLineFinish_()
			arg_141_1.onSingleLineUpdate_ = nil
			arg_141_1.onSingleLineFinish_ = nil
			arg_141_1.state_ = "waiting"
		end

		function arg_141_1.playNext_(arg_143_0)
			if arg_143_0 == 1 then
				arg_141_0:Play1109402036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0
			local var_144_1 = 0.6

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

				local var_144_2 = arg_141_1:GetWordFromCfg(1109402035)
				local var_144_3 = arg_141_1:FormatText(var_144_2.content)

				arg_141_1.text_.text = var_144_3

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_4 = 24
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
	Play1109402036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 1109402036
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play1109402037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = 0
			local var_148_1 = 0.55

			if var_148_0 < arg_145_1.time_ and arg_145_1.time_ <= var_148_0 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_2 = arg_145_1:FormatText(StoryNameCfg[7].name)

				arg_145_1.leftNameTxt_.text = var_148_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_3 = arg_145_1:GetWordFromCfg(1109402036)
				local var_148_4 = arg_145_1:FormatText(var_148_3.content)

				arg_145_1.text_.text = var_148_4

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_5 = 22
				local var_148_6 = utf8.len(var_148_4)
				local var_148_7 = var_148_5 <= 0 and var_148_1 or var_148_1 * (var_148_6 / var_148_5)

				if var_148_7 > 0 and var_148_1 < var_148_7 then
					arg_145_1.talkMaxDuration = var_148_7

					if var_148_7 + var_148_0 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_7 + var_148_0
					end
				end

				arg_145_1.text_.text = var_148_4
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_8 = math.max(var_148_1, arg_145_1.talkMaxDuration)

			if var_148_0 <= arg_145_1.time_ and arg_145_1.time_ < var_148_0 + var_148_8 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_0) / var_148_8

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_0 + var_148_8 and arg_145_1.time_ < var_148_0 + var_148_8 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 1109402037
		arg_149_1.duration_ = 1.999999999999

		SetActive(arg_149_1.tipsGo_, false)

		function arg_149_1.onSingleLineFinish_()
			arg_149_1.onSingleLineUpdate_ = nil
			arg_149_1.onSingleLineFinish_ = nil
			arg_149_1.state_ = "waiting"
		end

		function arg_149_1.playNext_(arg_151_0)
			if arg_151_0 == 1 then
				arg_149_0:Play1109402038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["1094ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos1094ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0, -0.84, -6.1)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos1094ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_152_7 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_7.x, var_152_7.y, var_152_7.z)

				local var_152_8 = var_152_0.localEulerAngles

				var_152_8.z = 0
				var_152_8.x = 0
				var_152_0.localEulerAngles = var_152_8
			end

			local var_152_9 = arg_149_1.actors_["1094ui_story"]
			local var_152_10 = 0

			if var_152_10 < arg_149_1.time_ and arg_149_1.time_ <= var_152_10 + arg_152_0 and arg_149_1.var_.characterEffect1094ui_story == nil then
				arg_149_1.var_.characterEffect1094ui_story = var_152_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_11 = 0.200000002980232

			if var_152_10 <= arg_149_1.time_ and arg_149_1.time_ < var_152_10 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_10) / var_152_11

				if arg_149_1.var_.characterEffect1094ui_story then
					arg_149_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_10 + var_152_11 and arg_149_1.time_ < var_152_10 + var_152_11 + arg_152_0 and arg_149_1.var_.characterEffect1094ui_story then
				arg_149_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_152_13 = 0

			if var_152_13 < arg_149_1.time_ and arg_149_1.time_ <= var_152_13 + arg_152_0 then
				arg_149_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action4_2")
			end

			local var_152_14 = 0

			if var_152_14 < arg_149_1.time_ and arg_149_1.time_ <= var_152_14 + arg_152_0 then
				arg_149_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_15 = 0
			local var_152_16 = 0.125

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_17 = arg_149_1:FormatText(StoryNameCfg[181].name)

				arg_149_1.leftNameTxt_.text = var_152_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_18 = arg_149_1:GetWordFromCfg(1109402037)
				local var_152_19 = arg_149_1:FormatText(var_152_18.content)

				arg_149_1.text_.text = var_152_19

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_20 = 5
				local var_152_21 = utf8.len(var_152_19)
				local var_152_22 = var_152_20 <= 0 and var_152_16 or var_152_16 * (var_152_21 / var_152_20)

				if var_152_22 > 0 and var_152_16 < var_152_22 then
					arg_149_1.talkMaxDuration = var_152_22

					if var_152_22 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_22 + var_152_15
					end
				end

				arg_149_1.text_.text = var_152_19
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402037", "story_v_side_new_1109402.awb") ~= 0 then
					local var_152_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402037", "story_v_side_new_1109402.awb") / 1000

					if var_152_23 + var_152_15 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_23 + var_152_15
					end

					if var_152_18.prefab_name ~= "" and arg_149_1.actors_[var_152_18.prefab_name] ~= nil then
						local var_152_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_18.prefab_name].transform, "story_v_side_new_1109402", "1109402037", "story_v_side_new_1109402.awb")

						arg_149_1:RecordAudio("1109402037", var_152_24)
						arg_149_1:RecordAudio("1109402037", var_152_24)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402037", "story_v_side_new_1109402.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402037", "story_v_side_new_1109402.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_25 = math.max(var_152_16, arg_149_1.talkMaxDuration)

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_25 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_15) / var_152_25

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_15 + var_152_25 and arg_149_1.time_ < var_152_15 + var_152_25 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 1109402038
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play1109402039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1094ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect1094ui_story == nil then
				arg_153_1.var_.characterEffect1094ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect1094ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1094ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect1094ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1094ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 0.55

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_8 = arg_153_1:FormatText(StoryNameCfg[7].name)

				arg_153_1.leftNameTxt_.text = var_156_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_9 = arg_153_1:GetWordFromCfg(1109402038)
				local var_156_10 = arg_153_1:FormatText(var_156_9.content)

				arg_153_1.text_.text = var_156_10

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_11 = 22
				local var_156_12 = utf8.len(var_156_10)
				local var_156_13 = var_156_11 <= 0 and var_156_7 or var_156_7 * (var_156_12 / var_156_11)

				if var_156_13 > 0 and var_156_7 < var_156_13 then
					arg_153_1.talkMaxDuration = var_156_13

					if var_156_13 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_13 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_10
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_14 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_14 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_14

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_14 and arg_153_1.time_ < var_156_6 + var_156_14 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 1109402039
		arg_157_1.duration_ = 11

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play1109402040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = 3

			if var_160_0 < arg_157_1.time_ and arg_157_1.time_ <= var_160_0 + arg_160_0 then
				local var_160_1 = manager.ui.mainCamera.transform.localPosition
				local var_160_2 = Vector3.New(0, 0, 10) + Vector3.New(var_160_1.x, var_160_1.y, 0)
				local var_160_3 = arg_157_1.bgs_.ST03

				var_160_3.transform.localPosition = var_160_2
				var_160_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_160_4 = var_160_3:GetComponent("SpriteRenderer")

				if var_160_4 and var_160_4.sprite then
					local var_160_5 = (var_160_3.transform.localPosition - var_160_1).z
					local var_160_6 = manager.ui.mainCameraCom_
					local var_160_7 = 2 * var_160_5 * Mathf.Tan(var_160_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_160_8 = var_160_7 * var_160_6.aspect
					local var_160_9 = var_160_4.sprite.bounds.size.x
					local var_160_10 = var_160_4.sprite.bounds.size.y
					local var_160_11 = var_160_8 / var_160_9
					local var_160_12 = var_160_7 / var_160_10
					local var_160_13 = var_160_12 < var_160_11 and var_160_11 or var_160_12

					var_160_3.transform.localScale = Vector3.New(var_160_13, var_160_13, 0)
				end

				for iter_160_0, iter_160_1 in pairs(arg_157_1.bgs_) do
					if iter_160_0 ~= "ST03" then
						iter_160_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_15 = 3

			if var_160_14 <= arg_157_1.time_ and arg_157_1.time_ < var_160_14 + var_160_15 then
				local var_160_16 = (arg_157_1.time_ - var_160_14) / var_160_15
				local var_160_17 = Color.New(0, 0, 0)

				var_160_17.a = Mathf.Lerp(0, 1, var_160_16)
				arg_157_1.mask_.color = var_160_17
			end

			if arg_157_1.time_ >= var_160_14 + var_160_15 and arg_157_1.time_ < var_160_14 + var_160_15 + arg_160_0 then
				local var_160_18 = Color.New(0, 0, 0)

				var_160_18.a = 1
				arg_157_1.mask_.color = var_160_18
			end

			local var_160_19 = 3

			if var_160_19 < arg_157_1.time_ and arg_157_1.time_ <= var_160_19 + arg_160_0 then
				arg_157_1.mask_.enabled = true
				arg_157_1.mask_.raycastTarget = true

				arg_157_1:SetGaussion(false)
			end

			local var_160_20 = 3

			if var_160_19 <= arg_157_1.time_ and arg_157_1.time_ < var_160_19 + var_160_20 then
				local var_160_21 = (arg_157_1.time_ - var_160_19) / var_160_20
				local var_160_22 = Color.New(0, 0, 0)

				var_160_22.a = Mathf.Lerp(1, 0, var_160_21)
				arg_157_1.mask_.color = var_160_22
			end

			if arg_157_1.time_ >= var_160_19 + var_160_20 and arg_157_1.time_ < var_160_19 + var_160_20 + arg_160_0 then
				local var_160_23 = Color.New(0, 0, 0)
				local var_160_24 = 0

				arg_157_1.mask_.enabled = false
				var_160_23.a = var_160_24
				arg_157_1.mask_.color = var_160_23
			end

			local var_160_25 = arg_157_1.actors_["1094ui_story"].transform
			local var_160_26 = 0

			if var_160_26 < arg_157_1.time_ and arg_157_1.time_ <= var_160_26 + arg_160_0 then
				arg_157_1.var_.moveOldPos1094ui_story = var_160_25.localPosition
			end

			local var_160_27 = 0.001

			if var_160_26 <= arg_157_1.time_ and arg_157_1.time_ < var_160_26 + var_160_27 then
				local var_160_28 = (arg_157_1.time_ - var_160_26) / var_160_27
				local var_160_29 = Vector3.New(0, 100, 0)

				var_160_25.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1094ui_story, var_160_29, var_160_28)

				local var_160_30 = manager.ui.mainCamera.transform.position - var_160_25.position

				var_160_25.forward = Vector3.New(var_160_30.x, var_160_30.y, var_160_30.z)

				local var_160_31 = var_160_25.localEulerAngles

				var_160_31.z = 0
				var_160_31.x = 0
				var_160_25.localEulerAngles = var_160_31
			end

			if arg_157_1.time_ >= var_160_26 + var_160_27 and arg_157_1.time_ < var_160_26 + var_160_27 + arg_160_0 then
				var_160_25.localPosition = Vector3.New(0, 100, 0)

				local var_160_32 = manager.ui.mainCamera.transform.position - var_160_25.position

				var_160_25.forward = Vector3.New(var_160_32.x, var_160_32.y, var_160_32.z)

				local var_160_33 = var_160_25.localEulerAngles

				var_160_33.z = 0
				var_160_33.x = 0
				var_160_25.localEulerAngles = var_160_33
			end

			if arg_157_1.frameCnt_ <= 1 then
				arg_157_1.dialog_:SetActive(false)
			end

			local var_160_34 = 6
			local var_160_35 = 0.8

			if var_160_34 < arg_157_1.time_ and arg_157_1.time_ <= var_160_34 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0

				arg_157_1.dialog_:SetActive(true)

				local var_160_36 = LeanTween.value(arg_157_1.dialog_, 0, 1, 0.3)

				var_160_36:setOnUpdate(LuaHelper.FloatAction(function(arg_161_0)
					arg_157_1.dialogCg_.alpha = arg_161_0
				end))
				var_160_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_157_1.dialog_)
					var_160_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_157_1.duration_ = arg_157_1.duration_ + 0.3

				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_37 = arg_157_1:GetWordFromCfg(1109402039)
				local var_160_38 = arg_157_1:FormatText(var_160_37.content)

				arg_157_1.text_.text = var_160_38

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_39 = 25
				local var_160_40 = utf8.len(var_160_38)
				local var_160_41 = var_160_39 <= 0 and var_160_35 or var_160_35 * (var_160_40 / var_160_39)

				if var_160_41 > 0 and var_160_35 < var_160_41 then
					arg_157_1.talkMaxDuration = var_160_41
					var_160_34 = var_160_34 + 0.3

					if var_160_41 + var_160_34 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_41 + var_160_34
					end
				end

				arg_157_1.text_.text = var_160_38
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_42 = var_160_34 + 0.3
			local var_160_43 = math.max(var_160_35, arg_157_1.talkMaxDuration)

			if var_160_42 <= arg_157_1.time_ and arg_157_1.time_ < var_160_42 + var_160_43 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_42) / var_160_43

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_42 + var_160_43 and arg_157_1.time_ < var_160_42 + var_160_43 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 1109402040
		arg_163_1.duration_ = 3.433

		local var_163_0 = {
			ja = 2.733,
			ko = 3.433,
			zh = 3.433
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
				arg_163_0:Play1109402041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1094ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1094ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, -0.84, -6.1)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1094ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1094ui_story"]
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 and arg_163_1.var_.characterEffect1094ui_story == nil then
				arg_163_1.var_.characterEffect1094ui_story = var_166_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_11 = 0.200000002980232

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11

				if arg_163_1.var_.characterEffect1094ui_story then
					arg_163_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 and arg_163_1.var_.characterEffect1094ui_story then
				arg_163_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_166_13 = 0

			if var_166_13 < arg_163_1.time_ and arg_163_1.time_ <= var_166_13 + arg_166_0 then
				arg_163_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_166_14 = 0

			if var_166_14 < arg_163_1.time_ and arg_163_1.time_ <= var_166_14 + arg_166_0 then
				arg_163_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_166_15 = 0
			local var_166_16 = 0.25

			if var_166_15 < arg_163_1.time_ and arg_163_1.time_ <= var_166_15 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_17 = arg_163_1:FormatText(StoryNameCfg[181].name)

				arg_163_1.leftNameTxt_.text = var_166_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_18 = arg_163_1:GetWordFromCfg(1109402040)
				local var_166_19 = arg_163_1:FormatText(var_166_18.content)

				arg_163_1.text_.text = var_166_19

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_20 = 10
				local var_166_21 = utf8.len(var_166_19)
				local var_166_22 = var_166_20 <= 0 and var_166_16 or var_166_16 * (var_166_21 / var_166_20)

				if var_166_22 > 0 and var_166_16 < var_166_22 then
					arg_163_1.talkMaxDuration = var_166_22

					if var_166_22 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_22 + var_166_15
					end
				end

				arg_163_1.text_.text = var_166_19
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402040", "story_v_side_new_1109402.awb") ~= 0 then
					local var_166_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402040", "story_v_side_new_1109402.awb") / 1000

					if var_166_23 + var_166_15 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_23 + var_166_15
					end

					if var_166_18.prefab_name ~= "" and arg_163_1.actors_[var_166_18.prefab_name] ~= nil then
						local var_166_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_18.prefab_name].transform, "story_v_side_new_1109402", "1109402040", "story_v_side_new_1109402.awb")

						arg_163_1:RecordAudio("1109402040", var_166_24)
						arg_163_1:RecordAudio("1109402040", var_166_24)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402040", "story_v_side_new_1109402.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402040", "story_v_side_new_1109402.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_25 = math.max(var_166_16, arg_163_1.talkMaxDuration)

			if var_166_15 <= arg_163_1.time_ and arg_163_1.time_ < var_166_15 + var_166_25 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_15) / var_166_25

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_15 + var_166_25 and arg_163_1.time_ < var_166_15 + var_166_25 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 1109402041
		arg_167_1.duration_ = 5

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play1109402042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1094ui_story"]
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 and arg_167_1.var_.characterEffect1094ui_story == nil then
				arg_167_1.var_.characterEffect1094ui_story = var_170_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_2 = 0.200000002980232

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2

				if arg_167_1.var_.characterEffect1094ui_story then
					local var_170_4 = Mathf.Lerp(0, 0.5, var_170_3)

					arg_167_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_167_1.var_.characterEffect1094ui_story.fillRatio = var_170_4
				end
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 and arg_167_1.var_.characterEffect1094ui_story then
				local var_170_5 = 0.5

				arg_167_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_167_1.var_.characterEffect1094ui_story.fillRatio = var_170_5
			end

			local var_170_6 = 0
			local var_170_7 = 0.725

			if var_170_6 < arg_167_1.time_ and arg_167_1.time_ <= var_170_6 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, false)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_8 = arg_167_1:GetWordFromCfg(1109402041)
				local var_170_9 = arg_167_1:FormatText(var_170_8.content)

				arg_167_1.text_.text = var_170_9

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_10 = 32
				local var_170_11 = utf8.len(var_170_9)
				local var_170_12 = var_170_10 <= 0 and var_170_7 or var_170_7 * (var_170_11 / var_170_10)

				if var_170_12 > 0 and var_170_7 < var_170_12 then
					arg_167_1.talkMaxDuration = var_170_12

					if var_170_12 + var_170_6 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_12 + var_170_6
					end
				end

				arg_167_1.text_.text = var_170_9
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)
				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_13 = math.max(var_170_7, arg_167_1.talkMaxDuration)

			if var_170_6 <= arg_167_1.time_ and arg_167_1.time_ < var_170_6 + var_170_13 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_6) / var_170_13

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_6 + var_170_13 and arg_167_1.time_ < var_170_6 + var_170_13 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 1109402042
		arg_171_1.duration_ = 2.866

		local var_171_0 = {
			ja = 2.866,
			ko = 2.233,
			zh = 2.233
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
				arg_171_0:Play1109402043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.225

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[36].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(1109402042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 9
				local var_174_6 = utf8.len(var_174_4)
				local var_174_7 = var_174_5 <= 0 and var_174_1 or var_174_1 * (var_174_6 / var_174_5)

				if var_174_7 > 0 and var_174_1 < var_174_7 then
					arg_171_1.talkMaxDuration = var_174_7

					if var_174_7 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_7 + var_174_0
					end
				end

				arg_171_1.text_.text = var_174_4
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402042", "story_v_side_new_1109402.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402042", "story_v_side_new_1109402.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_side_new_1109402", "1109402042", "story_v_side_new_1109402.awb")

						arg_171_1:RecordAudio("1109402042", var_174_9)
						arg_171_1:RecordAudio("1109402042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402042", "story_v_side_new_1109402.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402042", "story_v_side_new_1109402.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_10 = math.max(var_174_1, arg_171_1.talkMaxDuration)

			if var_174_0 <= arg_171_1.time_ and arg_171_1.time_ < var_174_0 + var_174_10 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_0) / var_174_10

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_0 + var_174_10 and arg_171_1.time_ < var_174_0 + var_174_10 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 1109402043
		arg_175_1.duration_ = 1.999999999999

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play1109402044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1094ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1094ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, -0.84, -6.1)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1094ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = arg_175_1.actors_["1094ui_story"]
			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 and arg_175_1.var_.characterEffect1094ui_story == nil then
				arg_175_1.var_.characterEffect1094ui_story = var_178_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_11 = 0.200000002980232

			if var_178_10 <= arg_175_1.time_ and arg_175_1.time_ < var_178_10 + var_178_11 then
				local var_178_12 = (arg_175_1.time_ - var_178_10) / var_178_11

				if arg_175_1.var_.characterEffect1094ui_story then
					arg_175_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_10 + var_178_11 and arg_175_1.time_ < var_178_10 + var_178_11 + arg_178_0 and arg_175_1.var_.characterEffect1094ui_story then
				arg_175_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_178_13 = 0

			if var_178_13 < arg_175_1.time_ and arg_175_1.time_ <= var_178_13 + arg_178_0 then
				arg_175_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action2_1")
			end

			local var_178_14 = 0

			if var_178_14 < arg_175_1.time_ and arg_175_1.time_ <= var_178_14 + arg_178_0 then
				arg_175_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_178_15 = 0
			local var_178_16 = 0.15

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_17 = arg_175_1:FormatText(StoryNameCfg[181].name)

				arg_175_1.leftNameTxt_.text = var_178_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_18 = arg_175_1:GetWordFromCfg(1109402043)
				local var_178_19 = arg_175_1:FormatText(var_178_18.content)

				arg_175_1.text_.text = var_178_19

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_20 = 6
				local var_178_21 = utf8.len(var_178_19)
				local var_178_22 = var_178_20 <= 0 and var_178_16 or var_178_16 * (var_178_21 / var_178_20)

				if var_178_22 > 0 and var_178_16 < var_178_22 then
					arg_175_1.talkMaxDuration = var_178_22

					if var_178_22 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_22 + var_178_15
					end
				end

				arg_175_1.text_.text = var_178_19
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402043", "story_v_side_new_1109402.awb") ~= 0 then
					local var_178_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402043", "story_v_side_new_1109402.awb") / 1000

					if var_178_23 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_23 + var_178_15
					end

					if var_178_18.prefab_name ~= "" and arg_175_1.actors_[var_178_18.prefab_name] ~= nil then
						local var_178_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_18.prefab_name].transform, "story_v_side_new_1109402", "1109402043", "story_v_side_new_1109402.awb")

						arg_175_1:RecordAudio("1109402043", var_178_24)
						arg_175_1:RecordAudio("1109402043", var_178_24)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402043", "story_v_side_new_1109402.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402043", "story_v_side_new_1109402.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_25 = math.max(var_178_16, arg_175_1.talkMaxDuration)

			if var_178_15 <= arg_175_1.time_ and arg_175_1.time_ < var_178_15 + var_178_25 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_15) / var_178_25

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_15 + var_178_25 and arg_175_1.time_ < var_178_15 + var_178_25 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 1109402044
		arg_179_1.duration_ = 13

		SetActive(arg_179_1.tipsGo_, false)

		function arg_179_1.onSingleLineFinish_()
			arg_179_1.onSingleLineUpdate_ = nil
			arg_179_1.onSingleLineFinish_ = nil
			arg_179_1.state_ = "waiting"
		end

		function arg_179_1.playNext_(arg_181_0)
			if arg_181_0 == 1 then
				arg_179_0:Play1109402045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = "I05d"

			if arg_179_1.bgs_[var_182_0] == nil then
				local var_182_1 = Object.Instantiate(arg_179_1.paintGo_)

				var_182_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_182_0)
				var_182_1.name = var_182_0
				var_182_1.transform.parent = arg_179_1.stage_.transform
				var_182_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_179_1.bgs_[var_182_0] = var_182_1
			end

			local var_182_2 = 4

			if var_182_2 < arg_179_1.time_ and arg_179_1.time_ <= var_182_2 + arg_182_0 then
				local var_182_3 = manager.ui.mainCamera.transform.localPosition
				local var_182_4 = Vector3.New(0, 0, 10) + Vector3.New(var_182_3.x, var_182_3.y, 0)
				local var_182_5 = arg_179_1.bgs_.I05d

				var_182_5.transform.localPosition = var_182_4
				var_182_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_182_6 = var_182_5:GetComponent("SpriteRenderer")

				if var_182_6 and var_182_6.sprite then
					local var_182_7 = (var_182_5.transform.localPosition - var_182_3).z
					local var_182_8 = manager.ui.mainCameraCom_
					local var_182_9 = 2 * var_182_7 * Mathf.Tan(var_182_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_182_10 = var_182_9 * var_182_8.aspect
					local var_182_11 = var_182_6.sprite.bounds.size.x
					local var_182_12 = var_182_6.sprite.bounds.size.y
					local var_182_13 = var_182_10 / var_182_11
					local var_182_14 = var_182_9 / var_182_12
					local var_182_15 = var_182_14 < var_182_13 and var_182_13 or var_182_14

					var_182_5.transform.localScale = Vector3.New(var_182_15, var_182_15, 0)
				end

				for iter_182_0, iter_182_1 in pairs(arg_179_1.bgs_) do
					if iter_182_0 ~= "I05d" then
						iter_182_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_182_16 = 0

			if var_182_16 < arg_179_1.time_ and arg_179_1.time_ <= var_182_16 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_17 = 4

			if var_182_16 <= arg_179_1.time_ and arg_179_1.time_ < var_182_16 + var_182_17 then
				local var_182_18 = (arg_179_1.time_ - var_182_16) / var_182_17
				local var_182_19 = Color.New(0, 0, 0)

				var_182_19.a = Mathf.Lerp(0, 1, var_182_18)
				arg_179_1.mask_.color = var_182_19
			end

			if arg_179_1.time_ >= var_182_16 + var_182_17 and arg_179_1.time_ < var_182_16 + var_182_17 + arg_182_0 then
				local var_182_20 = Color.New(0, 0, 0)

				var_182_20.a = 1
				arg_179_1.mask_.color = var_182_20
			end

			local var_182_21 = 4

			if var_182_21 < arg_179_1.time_ and arg_179_1.time_ <= var_182_21 + arg_182_0 then
				arg_179_1.mask_.enabled = true
				arg_179_1.mask_.raycastTarget = true

				arg_179_1:SetGaussion(false)
			end

			local var_182_22 = 4

			if var_182_21 <= arg_179_1.time_ and arg_179_1.time_ < var_182_21 + var_182_22 then
				local var_182_23 = (arg_179_1.time_ - var_182_21) / var_182_22
				local var_182_24 = Color.New(0, 0, 0)

				var_182_24.a = Mathf.Lerp(1, 0, var_182_23)
				arg_179_1.mask_.color = var_182_24
			end

			if arg_179_1.time_ >= var_182_21 + var_182_22 and arg_179_1.time_ < var_182_21 + var_182_22 + arg_182_0 then
				local var_182_25 = Color.New(0, 0, 0)
				local var_182_26 = 0

				arg_179_1.mask_.enabled = false
				var_182_25.a = var_182_26
				arg_179_1.mask_.color = var_182_25
			end

			local var_182_27 = arg_179_1.actors_["1094ui_story"].transform
			local var_182_28 = 0

			if var_182_28 < arg_179_1.time_ and arg_179_1.time_ <= var_182_28 + arg_182_0 then
				arg_179_1.var_.moveOldPos1094ui_story = var_182_27.localPosition
			end

			local var_182_29 = 0.001

			if var_182_28 <= arg_179_1.time_ and arg_179_1.time_ < var_182_28 + var_182_29 then
				local var_182_30 = (arg_179_1.time_ - var_182_28) / var_182_29
				local var_182_31 = Vector3.New(0, 100, 0)

				var_182_27.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1094ui_story, var_182_31, var_182_30)

				local var_182_32 = manager.ui.mainCamera.transform.position - var_182_27.position

				var_182_27.forward = Vector3.New(var_182_32.x, var_182_32.y, var_182_32.z)

				local var_182_33 = var_182_27.localEulerAngles

				var_182_33.z = 0
				var_182_33.x = 0
				var_182_27.localEulerAngles = var_182_33
			end

			if arg_179_1.time_ >= var_182_28 + var_182_29 and arg_179_1.time_ < var_182_28 + var_182_29 + arg_182_0 then
				var_182_27.localPosition = Vector3.New(0, 100, 0)

				local var_182_34 = manager.ui.mainCamera.transform.position - var_182_27.position

				var_182_27.forward = Vector3.New(var_182_34.x, var_182_34.y, var_182_34.z)

				local var_182_35 = var_182_27.localEulerAngles

				var_182_35.z = 0
				var_182_35.x = 0
				var_182_27.localEulerAngles = var_182_35
			end

			local var_182_36 = arg_179_1.actors_["1094ui_story"]
			local var_182_37 = 0

			if var_182_37 < arg_179_1.time_ and arg_179_1.time_ <= var_182_37 + arg_182_0 and arg_179_1.var_.characterEffect1094ui_story == nil then
				arg_179_1.var_.characterEffect1094ui_story = var_182_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_38 = 0.200000002980232

			if var_182_37 <= arg_179_1.time_ and arg_179_1.time_ < var_182_37 + var_182_38 then
				local var_182_39 = (arg_179_1.time_ - var_182_37) / var_182_38

				if arg_179_1.var_.characterEffect1094ui_story then
					local var_182_40 = Mathf.Lerp(0, 0.5, var_182_39)

					arg_179_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1094ui_story.fillRatio = var_182_40
				end
			end

			if arg_179_1.time_ >= var_182_37 + var_182_38 and arg_179_1.time_ < var_182_37 + var_182_38 + arg_182_0 and arg_179_1.var_.characterEffect1094ui_story then
				local var_182_41 = 0.5

				arg_179_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1094ui_story.fillRatio = var_182_41
			end

			if arg_179_1.frameCnt_ <= 1 then
				arg_179_1.dialog_:SetActive(false)
			end

			local var_182_42 = 8
			local var_182_43 = 0.725

			if var_182_42 < arg_179_1.time_ and arg_179_1.time_ <= var_182_42 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0

				arg_179_1.dialog_:SetActive(true)

				local var_182_44 = LeanTween.value(arg_179_1.dialog_, 0, 1, 0.3)

				var_182_44:setOnUpdate(LuaHelper.FloatAction(function(arg_183_0)
					arg_179_1.dialogCg_.alpha = arg_183_0
				end))
				var_182_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_179_1.dialog_)
					var_182_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_179_1.duration_ = arg_179_1.duration_ + 0.3

				SetActive(arg_179_1.leftNameGo_, false)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_45 = arg_179_1:GetWordFromCfg(1109402044)
				local var_182_46 = arg_179_1:FormatText(var_182_45.content)

				arg_179_1.text_.text = var_182_46

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_47 = 29
				local var_182_48 = utf8.len(var_182_46)
				local var_182_49 = var_182_47 <= 0 and var_182_43 or var_182_43 * (var_182_48 / var_182_47)

				if var_182_49 > 0 and var_182_43 < var_182_49 then
					arg_179_1.talkMaxDuration = var_182_49
					var_182_42 = var_182_42 + 0.3

					if var_182_49 + var_182_42 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_49 + var_182_42
					end
				end

				arg_179_1.text_.text = var_182_46
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)
				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_50 = var_182_42 + 0.3
			local var_182_51 = math.max(var_182_43, arg_179_1.talkMaxDuration)

			if var_182_50 <= arg_179_1.time_ and arg_179_1.time_ < var_182_50 + var_182_51 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_50) / var_182_51

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_50 + var_182_51 and arg_179_1.time_ < var_182_50 + var_182_51 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 1109402045
		arg_185_1.duration_ = 5

		SetActive(arg_185_1.tipsGo_, false)

		function arg_185_1.onSingleLineFinish_()
			arg_185_1.onSingleLineUpdate_ = nil
			arg_185_1.onSingleLineFinish_ = nil
			arg_185_1.state_ = "waiting"
		end

		function arg_185_1.playNext_(arg_187_0)
			if arg_187_0 == 1 then
				arg_185_0:Play1109402046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.8

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, false)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_2 = arg_185_1:GetWordFromCfg(1109402045)
				local var_188_3 = arg_185_1:FormatText(var_188_2.content)

				arg_185_1.text_.text = var_188_3

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_4 = 29
				local var_188_5 = utf8.len(var_188_3)
				local var_188_6 = var_188_4 <= 0 and var_188_1 or var_188_1 * (var_188_5 / var_188_4)

				if var_188_6 > 0 and var_188_1 < var_188_6 then
					arg_185_1.talkMaxDuration = var_188_6

					if var_188_6 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_6 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_3
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)
				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_7 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_7 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_7

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_7 and arg_185_1.time_ < var_188_0 + var_188_7 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 1109402046
		arg_189_1.duration_ = 5

		SetActive(arg_189_1.tipsGo_, false)

		function arg_189_1.onSingleLineFinish_()
			arg_189_1.onSingleLineUpdate_ = nil
			arg_189_1.onSingleLineFinish_ = nil
			arg_189_1.state_ = "waiting"
		end

		function arg_189_1.playNext_(arg_191_0)
			if arg_191_0 == 1 then
				arg_189_0:Play1109402047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.775

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[7].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(1109402046)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 31
				local var_192_6 = utf8.len(var_192_4)
				local var_192_7 = var_192_5 <= 0 and var_192_1 or var_192_1 * (var_192_6 / var_192_5)

				if var_192_7 > 0 and var_192_1 < var_192_7 then
					arg_189_1.talkMaxDuration = var_192_7

					if var_192_7 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_7 + var_192_0
					end
				end

				arg_189_1.text_.text = var_192_4
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)
				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_8 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_8 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_8

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_8 and arg_189_1.time_ < var_192_0 + var_192_8 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 1109402047
		arg_193_1.duration_ = 5

		SetActive(arg_193_1.tipsGo_, false)

		function arg_193_1.onSingleLineFinish_()
			arg_193_1.onSingleLineUpdate_ = nil
			arg_193_1.onSingleLineFinish_ = nil
			arg_193_1.state_ = "waiting"
		end

		function arg_193_1.playNext_(arg_195_0)
			if arg_195_0 == 1 then
				arg_193_0:Play1109402048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 1.125

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

				local var_196_2 = arg_193_1:GetWordFromCfg(1109402047)
				local var_196_3 = arg_193_1:FormatText(var_196_2.content)

				arg_193_1.text_.text = var_196_3

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_4 = 45
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
	Play1109402048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 1109402048
		arg_197_1.duration_ = 6.4

		local var_197_0 = {
			ja = 6.4,
			ko = 2.466,
			zh = 2.466
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
				arg_197_0:Play1109402049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.25

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, true)

				local var_200_2 = arg_197_1:FormatText(StoryNameCfg[189].name)

				arg_197_1.leftNameTxt_.text = var_200_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_197_1.leftNameTxt_.transform)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1.leftNameTxt_.text)
				SetActive(arg_197_1.iconTrs_.gameObject, true)
				arg_197_1.iconController_:SetSelectedState("hero")

				arg_197_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_3 = arg_197_1:GetWordFromCfg(1109402048)
				local var_200_4 = arg_197_1:FormatText(var_200_3.content)

				arg_197_1.text_.text = var_200_4

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_5 = 10
				local var_200_6 = utf8.len(var_200_4)
				local var_200_7 = var_200_5 <= 0 and var_200_1 or var_200_1 * (var_200_6 / var_200_5)

				if var_200_7 > 0 and var_200_1 < var_200_7 then
					arg_197_1.talkMaxDuration = var_200_7

					if var_200_7 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_7 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_4
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402048", "story_v_side_new_1109402.awb") ~= 0 then
					local var_200_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402048", "story_v_side_new_1109402.awb") / 1000

					if var_200_8 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_8 + var_200_0
					end

					if var_200_3.prefab_name ~= "" and arg_197_1.actors_[var_200_3.prefab_name] ~= nil then
						local var_200_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_197_1.actors_[var_200_3.prefab_name].transform, "story_v_side_new_1109402", "1109402048", "story_v_side_new_1109402.awb")

						arg_197_1:RecordAudio("1109402048", var_200_9)
						arg_197_1:RecordAudio("1109402048", var_200_9)
					else
						arg_197_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402048", "story_v_side_new_1109402.awb")
					end

					arg_197_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402048", "story_v_side_new_1109402.awb")
				end

				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_10 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_10 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_10

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_10 and arg_197_1.time_ < var_200_0 + var_200_10 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 1109402049
		arg_201_1.duration_ = 5

		SetActive(arg_201_1.tipsGo_, false)

		function arg_201_1.onSingleLineFinish_()
			arg_201_1.onSingleLineUpdate_ = nil
			arg_201_1.onSingleLineFinish_ = nil
			arg_201_1.state_ = "waiting"
		end

		function arg_201_1.playNext_(arg_203_0)
			if arg_203_0 == 1 then
				arg_201_0:Play1109402050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = 0
			local var_204_1 = 0.3

			if var_204_0 < arg_201_1.time_ and arg_201_1.time_ <= var_204_0 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, false)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_2 = arg_201_1:GetWordFromCfg(1109402049)
				local var_204_3 = arg_201_1:FormatText(var_204_2.content)

				arg_201_1.text_.text = var_204_3

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_4 = 12
				local var_204_5 = utf8.len(var_204_3)
				local var_204_6 = var_204_4 <= 0 and var_204_1 or var_204_1 * (var_204_5 / var_204_4)

				if var_204_6 > 0 and var_204_1 < var_204_6 then
					arg_201_1.talkMaxDuration = var_204_6

					if var_204_6 + var_204_0 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_6 + var_204_0
					end
				end

				arg_201_1.text_.text = var_204_3
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)
				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_7 = math.max(var_204_1, arg_201_1.talkMaxDuration)

			if var_204_0 <= arg_201_1.time_ and arg_201_1.time_ < var_204_0 + var_204_7 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_0) / var_204_7

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_0 + var_204_7 and arg_201_1.time_ < var_204_0 + var_204_7 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 1109402050
		arg_205_1.duration_ = 5

		SetActive(arg_205_1.tipsGo_, false)

		function arg_205_1.onSingleLineFinish_()
			arg_205_1.onSingleLineUpdate_ = nil
			arg_205_1.onSingleLineFinish_ = nil
			arg_205_1.state_ = "waiting"
		end

		function arg_205_1.playNext_(arg_207_0)
			if arg_207_0 == 1 then
				arg_205_0:Play1109402051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = 0
			local var_208_1 = 0.55

			if var_208_0 < arg_205_1.time_ and arg_205_1.time_ <= var_208_0 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_2 = arg_205_1:FormatText(StoryNameCfg[7].name)

				arg_205_1.leftNameTxt_.text = var_208_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_3 = arg_205_1:GetWordFromCfg(1109402050)
				local var_208_4 = arg_205_1:FormatText(var_208_3.content)

				arg_205_1.text_.text = var_208_4

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_5 = 22
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
				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_8 = math.max(var_208_1, arg_205_1.talkMaxDuration)

			if var_208_0 <= arg_205_1.time_ and arg_205_1.time_ < var_208_0 + var_208_8 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_0) / var_208_8

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_0 + var_208_8 and arg_205_1.time_ < var_208_0 + var_208_8 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 1109402051
		arg_209_1.duration_ = 5

		SetActive(arg_209_1.tipsGo_, false)

		function arg_209_1.onSingleLineFinish_()
			arg_209_1.onSingleLineUpdate_ = nil
			arg_209_1.onSingleLineFinish_ = nil
			arg_209_1.state_ = "waiting"
		end

		function arg_209_1.playNext_(arg_211_0)
			if arg_211_0 == 1 then
				arg_209_0:Play1109402052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1094ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1094ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -0.84, -6.1)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1094ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["1094ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect1094ui_story == nil then
				arg_209_1.var_.characterEffect1094ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.0166666666666667

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect1094ui_story then
					local var_212_13 = Mathf.Lerp(0, 0.5, var_212_12)

					arg_209_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_209_1.var_.characterEffect1094ui_story.fillRatio = var_212_13
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect1094ui_story then
				local var_212_14 = 0.5

				arg_209_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_209_1.var_.characterEffect1094ui_story.fillRatio = var_212_14
			end

			local var_212_15 = 0

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_212_16 = 0
			local var_212_17 = 0.9

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, false)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_18 = arg_209_1:GetWordFromCfg(1109402051)
				local var_212_19 = arg_209_1:FormatText(var_212_18.content)

				arg_209_1.text_.text = var_212_19

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_20 = 36
				local var_212_21 = utf8.len(var_212_19)
				local var_212_22 = var_212_20 <= 0 and var_212_17 or var_212_17 * (var_212_21 / var_212_20)

				if var_212_22 > 0 and var_212_17 < var_212_22 then
					arg_209_1.talkMaxDuration = var_212_22

					if var_212_22 + var_212_16 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_22 + var_212_16
					end
				end

				arg_209_1.text_.text = var_212_19
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)
				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_23 = math.max(var_212_17, arg_209_1.talkMaxDuration)

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_23 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_16) / var_212_23

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_16 + var_212_23 and arg_209_1.time_ < var_212_16 + var_212_23 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 1109402052
		arg_213_1.duration_ = 2.833

		local var_213_0 = {
			ja = 2.833,
			ko = 2.433,
			zh = 2.433
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
				arg_213_0:Play1109402053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1094ui_story"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.characterEffect1094ui_story == nil then
				arg_213_1.var_.characterEffect1094ui_story = var_216_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_2 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.characterEffect1094ui_story then
					arg_213_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.characterEffect1094ui_story then
				arg_213_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_216_4 = 0

			if var_216_4 < arg_213_1.time_ and arg_213_1.time_ <= var_216_4 + arg_216_0 then
				arg_213_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_216_5 = 0
			local var_216_6 = 0.3

			if var_216_5 < arg_213_1.time_ and arg_213_1.time_ <= var_216_5 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_7 = arg_213_1:FormatText(StoryNameCfg[181].name)

				arg_213_1.leftNameTxt_.text = var_216_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_8 = arg_213_1:GetWordFromCfg(1109402052)
				local var_216_9 = arg_213_1:FormatText(var_216_8.content)

				arg_213_1.text_.text = var_216_9

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_10 = 12
				local var_216_11 = utf8.len(var_216_9)
				local var_216_12 = var_216_10 <= 0 and var_216_6 or var_216_6 * (var_216_11 / var_216_10)

				if var_216_12 > 0 and var_216_6 < var_216_12 then
					arg_213_1.talkMaxDuration = var_216_12

					if var_216_12 + var_216_5 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_12 + var_216_5
					end
				end

				arg_213_1.text_.text = var_216_9
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402052", "story_v_side_new_1109402.awb") ~= 0 then
					local var_216_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402052", "story_v_side_new_1109402.awb") / 1000

					if var_216_13 + var_216_5 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_5
					end

					if var_216_8.prefab_name ~= "" and arg_213_1.actors_[var_216_8.prefab_name] ~= nil then
						local var_216_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_8.prefab_name].transform, "story_v_side_new_1109402", "1109402052", "story_v_side_new_1109402.awb")

						arg_213_1:RecordAudio("1109402052", var_216_14)
						arg_213_1:RecordAudio("1109402052", var_216_14)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402052", "story_v_side_new_1109402.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402052", "story_v_side_new_1109402.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_15 = math.max(var_216_6, arg_213_1.talkMaxDuration)

			if var_216_5 <= arg_213_1.time_ and arg_213_1.time_ < var_216_5 + var_216_15 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_5) / var_216_15

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_5 + var_216_15 and arg_213_1.time_ < var_216_5 + var_216_15 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 1109402053
		arg_217_1.duration_ = 8.3

		local var_217_0 = {
			ja = 8.3,
			ko = 6.366,
			zh = 6.366
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
				arg_217_0:Play1109402054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1094ui_story"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 and arg_217_1.var_.characterEffect1094ui_story == nil then
				arg_217_1.var_.characterEffect1094ui_story = var_220_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_2 = 0.2

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2

				if arg_217_1.var_.characterEffect1094ui_story then
					local var_220_4 = Mathf.Lerp(0, 0.5, var_220_3)

					arg_217_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_217_1.var_.characterEffect1094ui_story.fillRatio = var_220_4
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 and arg_217_1.var_.characterEffect1094ui_story then
				local var_220_5 = 0.5

				arg_217_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_217_1.var_.characterEffect1094ui_story.fillRatio = var_220_5
			end

			local var_220_6 = 0
			local var_220_7 = 0.975

			if var_220_6 < arg_217_1.time_ and arg_217_1.time_ <= var_220_6 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_8 = arg_217_1:FormatText(StoryNameCfg[189].name)

				arg_217_1.leftNameTxt_.text = var_220_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, true)
				arg_217_1.iconController_:SetSelectedState("hero")

				arg_217_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_9 = arg_217_1:GetWordFromCfg(1109402053)
				local var_220_10 = arg_217_1:FormatText(var_220_9.content)

				arg_217_1.text_.text = var_220_10

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_11 = 39
				local var_220_12 = utf8.len(var_220_10)
				local var_220_13 = var_220_11 <= 0 and var_220_7 or var_220_7 * (var_220_12 / var_220_11)

				if var_220_13 > 0 and var_220_7 < var_220_13 then
					arg_217_1.talkMaxDuration = var_220_13

					if var_220_13 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_13 + var_220_6
					end
				end

				arg_217_1.text_.text = var_220_10
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402053", "story_v_side_new_1109402.awb") ~= 0 then
					local var_220_14 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402053", "story_v_side_new_1109402.awb") / 1000

					if var_220_14 + var_220_6 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_14 + var_220_6
					end

					if var_220_9.prefab_name ~= "" and arg_217_1.actors_[var_220_9.prefab_name] ~= nil then
						local var_220_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_9.prefab_name].transform, "story_v_side_new_1109402", "1109402053", "story_v_side_new_1109402.awb")

						arg_217_1:RecordAudio("1109402053", var_220_15)
						arg_217_1:RecordAudio("1109402053", var_220_15)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402053", "story_v_side_new_1109402.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402053", "story_v_side_new_1109402.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_16 = math.max(var_220_7, arg_217_1.talkMaxDuration)

			if var_220_6 <= arg_217_1.time_ and arg_217_1.time_ < var_220_6 + var_220_16 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_6) / var_220_16

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_6 + var_220_16 and arg_217_1.time_ < var_220_6 + var_220_16 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 1109402054
		arg_221_1.duration_ = 5

		SetActive(arg_221_1.tipsGo_, false)

		function arg_221_1.onSingleLineFinish_()
			arg_221_1.onSingleLineUpdate_ = nil
			arg_221_1.onSingleLineFinish_ = nil
			arg_221_1.state_ = "waiting"
		end

		function arg_221_1.playNext_(arg_223_0)
			if arg_223_0 == 1 then
				arg_221_0:Play1109402055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0
			local var_224_1 = 0.675

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_2 = arg_221_1:FormatText(StoryNameCfg[7].name)

				arg_221_1.leftNameTxt_.text = var_224_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_3 = arg_221_1:GetWordFromCfg(1109402054)
				local var_224_4 = arg_221_1:FormatText(var_224_3.content)

				arg_221_1.text_.text = var_224_4

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_5 = 28
				local var_224_6 = utf8.len(var_224_4)
				local var_224_7 = var_224_5 <= 0 and var_224_1 or var_224_1 * (var_224_6 / var_224_5)

				if var_224_7 > 0 and var_224_1 < var_224_7 then
					arg_221_1.talkMaxDuration = var_224_7

					if var_224_7 + var_224_0 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_7 + var_224_0
					end
				end

				arg_221_1.text_.text = var_224_4
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)
				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_8 = math.max(var_224_1, arg_221_1.talkMaxDuration)

			if var_224_0 <= arg_221_1.time_ and arg_221_1.time_ < var_224_0 + var_224_8 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_0) / var_224_8

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_0 + var_224_8 and arg_221_1.time_ < var_224_0 + var_224_8 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 1109402055
		arg_225_1.duration_ = 2.6

		local var_225_0 = {
			ja = 2.6,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_225_0:Play1109402056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1094ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1094ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, -0.84, -6.1)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1094ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["1094ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect1094ui_story == nil then
				arg_225_1.var_.characterEffect1094ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect1094ui_story then
					arg_225_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect1094ui_story then
				arg_225_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_228_13 = 0

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_228_14 = 0
			local var_228_15 = 0.15

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_16 = arg_225_1:FormatText(StoryNameCfg[181].name)

				arg_225_1.leftNameTxt_.text = var_228_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_17 = arg_225_1:GetWordFromCfg(1109402055)
				local var_228_18 = arg_225_1:FormatText(var_228_17.content)

				arg_225_1.text_.text = var_228_18

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_19 = 6
				local var_228_20 = utf8.len(var_228_18)
				local var_228_21 = var_228_19 <= 0 and var_228_15 or var_228_15 * (var_228_20 / var_228_19)

				if var_228_21 > 0 and var_228_15 < var_228_21 then
					arg_225_1.talkMaxDuration = var_228_21

					if var_228_21 + var_228_14 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_14
					end
				end

				arg_225_1.text_.text = var_228_18
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402055", "story_v_side_new_1109402.awb") ~= 0 then
					local var_228_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402055", "story_v_side_new_1109402.awb") / 1000

					if var_228_22 + var_228_14 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_22 + var_228_14
					end

					if var_228_17.prefab_name ~= "" and arg_225_1.actors_[var_228_17.prefab_name] ~= nil then
						local var_228_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_17.prefab_name].transform, "story_v_side_new_1109402", "1109402055", "story_v_side_new_1109402.awb")

						arg_225_1:RecordAudio("1109402055", var_228_23)
						arg_225_1:RecordAudio("1109402055", var_228_23)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402055", "story_v_side_new_1109402.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402055", "story_v_side_new_1109402.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_24 = math.max(var_228_15, arg_225_1.talkMaxDuration)

			if var_228_14 <= arg_225_1.time_ and arg_225_1.time_ < var_228_14 + var_228_24 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_14) / var_228_24

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_14 + var_228_24 and arg_225_1.time_ < var_228_14 + var_228_24 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 1109402056
		arg_229_1.duration_ = 3.966

		local var_229_0 = {
			ja = 3.966,
			ko = 3.2,
			zh = 3.2
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
				arg_229_0:Play1109402057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["1094ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos1094ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, -0.84, -6.1)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos1094ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = 0

			if var_232_9 < arg_229_1.time_ and arg_229_1.time_ <= var_232_9 + arg_232_0 then
				arg_229_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_232_10 = 0
			local var_232_11 = 0.25

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_12 = arg_229_1:FormatText(StoryNameCfg[181].name)

				arg_229_1.leftNameTxt_.text = var_232_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_13 = arg_229_1:GetWordFromCfg(1109402056)
				local var_232_14 = arg_229_1:FormatText(var_232_13.content)

				arg_229_1.text_.text = var_232_14

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_15 = 10
				local var_232_16 = utf8.len(var_232_14)
				local var_232_17 = var_232_15 <= 0 and var_232_11 or var_232_11 * (var_232_16 / var_232_15)

				if var_232_17 > 0 and var_232_11 < var_232_17 then
					arg_229_1.talkMaxDuration = var_232_17

					if var_232_17 + var_232_10 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_17 + var_232_10
					end
				end

				arg_229_1.text_.text = var_232_14
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402056", "story_v_side_new_1109402.awb") ~= 0 then
					local var_232_18 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402056", "story_v_side_new_1109402.awb") / 1000

					if var_232_18 + var_232_10 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_18 + var_232_10
					end

					if var_232_13.prefab_name ~= "" and arg_229_1.actors_[var_232_13.prefab_name] ~= nil then
						local var_232_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_13.prefab_name].transform, "story_v_side_new_1109402", "1109402056", "story_v_side_new_1109402.awb")

						arg_229_1:RecordAudio("1109402056", var_232_19)
						arg_229_1:RecordAudio("1109402056", var_232_19)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402056", "story_v_side_new_1109402.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402056", "story_v_side_new_1109402.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_20 = math.max(var_232_11, arg_229_1.talkMaxDuration)

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_20 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_10) / var_232_20

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_10 + var_232_20 and arg_229_1.time_ < var_232_10 + var_232_20 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 1109402057
		arg_233_1.duration_ = 5

		SetActive(arg_233_1.tipsGo_, false)

		function arg_233_1.onSingleLineFinish_()
			arg_233_1.onSingleLineUpdate_ = nil
			arg_233_1.onSingleLineFinish_ = nil
			arg_233_1.state_ = "waiting"
		end

		function arg_233_1.playNext_(arg_235_0)
			if arg_235_0 == 1 then
				arg_233_0:Play1109402058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1094ui_story"]
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 and arg_233_1.var_.characterEffect1094ui_story == nil then
				arg_233_1.var_.characterEffect1094ui_story = var_236_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_2 = 0.200000002980232

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2

				if arg_233_1.var_.characterEffect1094ui_story then
					local var_236_4 = Mathf.Lerp(0, 0.5, var_236_3)

					arg_233_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_233_1.var_.characterEffect1094ui_story.fillRatio = var_236_4
				end
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 and arg_233_1.var_.characterEffect1094ui_story then
				local var_236_5 = 0.5

				arg_233_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_233_1.var_.characterEffect1094ui_story.fillRatio = var_236_5
			end

			local var_236_6 = 0
			local var_236_7 = 0.4

			if var_236_6 < arg_233_1.time_ and arg_233_1.time_ <= var_236_6 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_8 = arg_233_1:FormatText(StoryNameCfg[7].name)

				arg_233_1.leftNameTxt_.text = var_236_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_9 = arg_233_1:GetWordFromCfg(1109402057)
				local var_236_10 = arg_233_1:FormatText(var_236_9.content)

				arg_233_1.text_.text = var_236_10

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_11 = 16
				local var_236_12 = utf8.len(var_236_10)
				local var_236_13 = var_236_11 <= 0 and var_236_7 or var_236_7 * (var_236_12 / var_236_11)

				if var_236_13 > 0 and var_236_7 < var_236_13 then
					arg_233_1.talkMaxDuration = var_236_13

					if var_236_13 + var_236_6 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_13 + var_236_6
					end
				end

				arg_233_1.text_.text = var_236_10
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)
				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_14 = math.max(var_236_7, arg_233_1.talkMaxDuration)

			if var_236_6 <= arg_233_1.time_ and arg_233_1.time_ < var_236_6 + var_236_14 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_6) / var_236_14

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_6 + var_236_14 and arg_233_1.time_ < var_236_6 + var_236_14 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 1109402058
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play1109402059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action3_1")
			end

			local var_240_2 = 0
			local var_240_3 = 0.55

			if var_240_2 < arg_237_1.time_ and arg_237_1.time_ <= var_240_2 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_4 = arg_237_1:GetWordFromCfg(1109402058)
				local var_240_5 = arg_237_1:FormatText(var_240_4.content)

				arg_237_1.text_.text = var_240_5

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_6 = 22
				local var_240_7 = utf8.len(var_240_5)
				local var_240_8 = var_240_6 <= 0 and var_240_3 or var_240_3 * (var_240_7 / var_240_6)

				if var_240_8 > 0 and var_240_3 < var_240_8 then
					arg_237_1.talkMaxDuration = var_240_8

					if var_240_8 + var_240_2 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_8 + var_240_2
					end
				end

				arg_237_1.text_.text = var_240_5
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_9 = math.max(var_240_3, arg_237_1.talkMaxDuration)

			if var_240_2 <= arg_237_1.time_ and arg_237_1.time_ < var_240_2 + var_240_9 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_2) / var_240_9

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_2 + var_240_9 and arg_237_1.time_ < var_240_2 + var_240_9 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 1109402059
		arg_241_1.duration_ = 9

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play1109402060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1094ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1094ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(0, 100, 0)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1094ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(0, 100, 0)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = arg_241_1.actors_["1094ui_story"]
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 and arg_241_1.var_.characterEffect1094ui_story == nil then
				arg_241_1.var_.characterEffect1094ui_story = var_244_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_11 = 0.200000002980232

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11

				if arg_241_1.var_.characterEffect1094ui_story then
					local var_244_13 = Mathf.Lerp(0, 0.5, var_244_12)

					arg_241_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1094ui_story.fillRatio = var_244_13
				end
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 and arg_241_1.var_.characterEffect1094ui_story then
				local var_244_14 = 0.5

				arg_241_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1094ui_story.fillRatio = var_244_14
			end

			local var_244_15 = 4.33333333333333
			local var_244_16 = 1

			if var_244_15 < arg_241_1.time_ and arg_241_1.time_ <= var_244_15 + arg_244_0 then
				local var_244_17 = "play"
				local var_244_18 = "effect"

				arg_241_1:AudioAction(var_244_17, var_244_18, "se_story", "se_story_communication", "")
			end

			local var_244_19 = "D06_1"

			if arg_241_1.bgs_[var_244_19] == nil then
				local var_244_20 = Object.Instantiate(arg_241_1.paintGo_)

				var_244_20:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_244_19)
				var_244_20.name = var_244_19
				var_244_20.transform.parent = arg_241_1.stage_.transform
				var_244_20.transform.localPosition = Vector3.New(0, 100, 0)
				arg_241_1.bgs_[var_244_19] = var_244_20
			end

			local var_244_21 = 2

			if var_244_21 < arg_241_1.time_ and arg_241_1.time_ <= var_244_21 + arg_244_0 then
				local var_244_22 = manager.ui.mainCamera.transform.localPosition
				local var_244_23 = Vector3.New(0, 0, 10) + Vector3.New(var_244_22.x, var_244_22.y, 0)
				local var_244_24 = arg_241_1.bgs_.D06_1

				var_244_24.transform.localPosition = var_244_23
				var_244_24.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_244_25 = var_244_24:GetComponent("SpriteRenderer")

				if var_244_25 and var_244_25.sprite then
					local var_244_26 = (var_244_24.transform.localPosition - var_244_22).z
					local var_244_27 = manager.ui.mainCameraCom_
					local var_244_28 = 2 * var_244_26 * Mathf.Tan(var_244_27.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_244_29 = var_244_28 * var_244_27.aspect
					local var_244_30 = var_244_25.sprite.bounds.size.x
					local var_244_31 = var_244_25.sprite.bounds.size.y
					local var_244_32 = var_244_29 / var_244_30
					local var_244_33 = var_244_28 / var_244_31
					local var_244_34 = var_244_33 < var_244_32 and var_244_32 or var_244_33

					var_244_24.transform.localScale = Vector3.New(var_244_34, var_244_34, 0)
				end

				for iter_244_0, iter_244_1 in pairs(arg_241_1.bgs_) do
					if iter_244_0 ~= "D06_1" then
						iter_244_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_244_35 = 0

			if var_244_35 < arg_241_1.time_ and arg_241_1.time_ <= var_244_35 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_36 = 2

			if var_244_35 <= arg_241_1.time_ and arg_241_1.time_ < var_244_35 + var_244_36 then
				local var_244_37 = (arg_241_1.time_ - var_244_35) / var_244_36
				local var_244_38 = Color.New(0, 0, 0)

				var_244_38.a = Mathf.Lerp(0, 1, var_244_37)
				arg_241_1.mask_.color = var_244_38
			end

			if arg_241_1.time_ >= var_244_35 + var_244_36 and arg_241_1.time_ < var_244_35 + var_244_36 + arg_244_0 then
				local var_244_39 = Color.New(0, 0, 0)

				var_244_39.a = 1
				arg_241_1.mask_.color = var_244_39
			end

			local var_244_40 = 2

			if var_244_40 < arg_241_1.time_ and arg_241_1.time_ <= var_244_40 + arg_244_0 then
				arg_241_1.mask_.enabled = true
				arg_241_1.mask_.raycastTarget = true

				arg_241_1:SetGaussion(false)
			end

			local var_244_41 = 2

			if var_244_40 <= arg_241_1.time_ and arg_241_1.time_ < var_244_40 + var_244_41 then
				local var_244_42 = (arg_241_1.time_ - var_244_40) / var_244_41
				local var_244_43 = Color.New(0, 0, 0)

				var_244_43.a = Mathf.Lerp(1, 0, var_244_42)
				arg_241_1.mask_.color = var_244_43
			end

			if arg_241_1.time_ >= var_244_40 + var_244_41 and arg_241_1.time_ < var_244_40 + var_244_41 + arg_244_0 then
				local var_244_44 = Color.New(0, 0, 0)
				local var_244_45 = 0

				arg_241_1.mask_.enabled = false
				var_244_44.a = var_244_45
				arg_241_1.mask_.color = var_244_44
			end

			if arg_241_1.frameCnt_ <= 1 then
				arg_241_1.dialog_:SetActive(false)
			end

			local var_244_46 = 4
			local var_244_47 = 0.975

			if var_244_46 < arg_241_1.time_ and arg_241_1.time_ <= var_244_46 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0

				arg_241_1.dialog_:SetActive(true)

				local var_244_48 = LeanTween.value(arg_241_1.dialog_, 0, 1, 0.3)

				var_244_48:setOnUpdate(LuaHelper.FloatAction(function(arg_245_0)
					arg_241_1.dialogCg_.alpha = arg_245_0
				end))
				var_244_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_241_1.dialog_)
					var_244_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_241_1.duration_ = arg_241_1.duration_ + 0.3

				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_49 = arg_241_1:GetWordFromCfg(1109402059)
				local var_244_50 = arg_241_1:FormatText(var_244_49.content)

				arg_241_1.text_.text = var_244_50

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_51 = 37
				local var_244_52 = utf8.len(var_244_50)
				local var_244_53 = var_244_51 <= 0 and var_244_47 or var_244_47 * (var_244_52 / var_244_51)

				if var_244_53 > 0 and var_244_47 < var_244_53 then
					arg_241_1.talkMaxDuration = var_244_53
					var_244_46 = var_244_46 + 0.3

					if var_244_53 + var_244_46 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_53 + var_244_46
					end
				end

				arg_241_1.text_.text = var_244_50
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_54 = var_244_46 + 0.3
			local var_244_55 = math.max(var_244_47, arg_241_1.talkMaxDuration)

			if var_244_54 <= arg_241_1.time_ and arg_241_1.time_ < var_244_54 + var_244_55 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_54) / var_244_55

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_54 + var_244_55 and arg_241_1.time_ < var_244_54 + var_244_55 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 1109402060
		arg_247_1.duration_ = 5

		SetActive(arg_247_1.tipsGo_, false)

		function arg_247_1.onSingleLineFinish_()
			arg_247_1.onSingleLineUpdate_ = nil
			arg_247_1.onSingleLineFinish_ = nil
			arg_247_1.state_ = "waiting"
		end

		function arg_247_1.playNext_(arg_249_0)
			if arg_249_0 == 1 then
				arg_247_0:Play1109402061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0
			local var_250_1 = 0.825

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0
				arg_247_1.dialogCg_.alpha = 1

				arg_247_1.dialog_:SetActive(true)
				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_2 = arg_247_1:FormatText(StoryNameCfg[7].name)

				arg_247_1.leftNameTxt_.text = var_250_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_3 = arg_247_1:GetWordFromCfg(1109402060)
				local var_250_4 = arg_247_1:FormatText(var_250_3.content)

				arg_247_1.text_.text = var_250_4

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_5 = 33
				local var_250_6 = utf8.len(var_250_4)
				local var_250_7 = var_250_5 <= 0 and var_250_1 or var_250_1 * (var_250_6 / var_250_5)

				if var_250_7 > 0 and var_250_1 < var_250_7 then
					arg_247_1.talkMaxDuration = var_250_7

					if var_250_7 + var_250_0 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_7 + var_250_0
					end
				end

				arg_247_1.text_.text = var_250_4
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)
				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_8 = math.max(var_250_1, arg_247_1.talkMaxDuration)

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_8 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_0) / var_250_8

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_0 + var_250_8 and arg_247_1.time_ < var_250_0 + var_250_8 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402061 = function(arg_251_0, arg_251_1)
		arg_251_1.time_ = 0
		arg_251_1.frameCnt_ = 0
		arg_251_1.state_ = "playing"
		arg_251_1.curTalkId_ = 1109402061
		arg_251_1.duration_ = 1.7

		local var_251_0 = {
			ja = 1.1,
			ko = 1.7,
			zh = 1.7
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
				arg_251_0:Play1109402062(arg_251_1)
			end
		end

		function arg_251_1.onSingleLineUpdate_(arg_254_0)
			local var_254_0 = 0
			local var_254_1 = 0.075

			if var_254_0 < arg_251_1.time_ and arg_251_1.time_ <= var_254_0 + arg_254_0 then
				arg_251_1.talkMaxDuration = 0
				arg_251_1.dialogCg_.alpha = 1

				arg_251_1.dialog_:SetActive(true)
				SetActive(arg_251_1.leftNameGo_, true)

				local var_254_2 = arg_251_1:FormatText(StoryNameCfg[189].name)

				arg_251_1.leftNameTxt_.text = var_254_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_251_1.leftNameTxt_.transform)

				arg_251_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_251_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_251_1:RecordName(arg_251_1.leftNameTxt_.text)
				SetActive(arg_251_1.iconTrs_.gameObject, true)
				arg_251_1.iconController_:SetSelectedState("hero")

				arg_251_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_251_1.callingController_:SetSelectedState("normal")

				local var_254_3 = arg_251_1:GetWordFromCfg(1109402061)
				local var_254_4 = arg_251_1:FormatText(var_254_3.content)

				arg_251_1.text_.text = var_254_4

				LuaForUtil.ClearLinePrefixSymbol(arg_251_1.text_)

				local var_254_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402061", "story_v_side_new_1109402.awb") ~= 0 then
					local var_254_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402061", "story_v_side_new_1109402.awb") / 1000

					if var_254_8 + var_254_0 > arg_251_1.duration_ then
						arg_251_1.duration_ = var_254_8 + var_254_0
					end

					if var_254_3.prefab_name ~= "" and arg_251_1.actors_[var_254_3.prefab_name] ~= nil then
						local var_254_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_251_1.actors_[var_254_3.prefab_name].transform, "story_v_side_new_1109402", "1109402061", "story_v_side_new_1109402.awb")

						arg_251_1:RecordAudio("1109402061", var_254_9)
						arg_251_1:RecordAudio("1109402061", var_254_9)
					else
						arg_251_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402061", "story_v_side_new_1109402.awb")
					end

					arg_251_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402061", "story_v_side_new_1109402.awb")
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
	Play1109402062 = function(arg_255_0, arg_255_1)
		arg_255_1.time_ = 0
		arg_255_1.frameCnt_ = 0
		arg_255_1.state_ = "playing"
		arg_255_1.curTalkId_ = 1109402062
		arg_255_1.duration_ = 5

		SetActive(arg_255_1.tipsGo_, false)

		function arg_255_1.onSingleLineFinish_()
			arg_255_1.onSingleLineUpdate_ = nil
			arg_255_1.onSingleLineFinish_ = nil
			arg_255_1.state_ = "waiting"
		end

		function arg_255_1.playNext_(arg_257_0)
			if arg_257_0 == 1 then
				arg_255_0:Play1109402063(arg_255_1)
			end
		end

		function arg_255_1.onSingleLineUpdate_(arg_258_0)
			local var_258_0 = 0
			local var_258_1 = 0.6

			if var_258_0 < arg_255_1.time_ and arg_255_1.time_ <= var_258_0 + arg_258_0 then
				arg_255_1.talkMaxDuration = 0
				arg_255_1.dialogCg_.alpha = 1

				arg_255_1.dialog_:SetActive(true)
				SetActive(arg_255_1.leftNameGo_, true)

				local var_258_2 = arg_255_1:FormatText(StoryNameCfg[7].name)

				arg_255_1.leftNameTxt_.text = var_258_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_255_1.leftNameTxt_.transform)

				arg_255_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_255_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_255_1:RecordName(arg_255_1.leftNameTxt_.text)
				SetActive(arg_255_1.iconTrs_.gameObject, false)
				arg_255_1.callingController_:SetSelectedState("normal")

				local var_258_3 = arg_255_1:GetWordFromCfg(1109402062)
				local var_258_4 = arg_255_1:FormatText(var_258_3.content)

				arg_255_1.text_.text = var_258_4

				LuaForUtil.ClearLinePrefixSymbol(arg_255_1.text_)

				local var_258_5 = 24
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
				arg_255_1:RecordContent(arg_255_1.text_.text)
			end

			local var_258_8 = math.max(var_258_1, arg_255_1.talkMaxDuration)

			if var_258_0 <= arg_255_1.time_ and arg_255_1.time_ < var_258_0 + var_258_8 then
				arg_255_1.typewritter.percent = (arg_255_1.time_ - var_258_0) / var_258_8

				arg_255_1.typewritter:SetDirty()
			end

			if arg_255_1.time_ >= var_258_0 + var_258_8 and arg_255_1.time_ < var_258_0 + var_258_8 + arg_258_0 then
				arg_255_1.typewritter.percent = 1

				arg_255_1.typewritter:SetDirty()
				arg_255_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402063 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 1109402063
		arg_259_1.duration_ = 5

		SetActive(arg_259_1.tipsGo_, false)

		function arg_259_1.onSingleLineFinish_()
			arg_259_1.onSingleLineUpdate_ = nil
			arg_259_1.onSingleLineFinish_ = nil
			arg_259_1.state_ = "waiting"
		end

		function arg_259_1.playNext_(arg_261_0)
			if arg_261_0 == 1 then
				arg_259_0:Play1109402064(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.666666666666667

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				local var_262_2 = "play"
				local var_262_3 = "effect"

				arg_259_1:AudioAction(var_262_2, var_262_3, "se_story_side_1094", "se_story_1094_run", "")
			end

			local var_262_4 = 0
			local var_262_5 = 0.225

			if var_262_4 < arg_259_1.time_ and arg_259_1.time_ <= var_262_4 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, false)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_6 = arg_259_1:GetWordFromCfg(1109402063)
				local var_262_7 = arg_259_1:FormatText(var_262_6.content)

				arg_259_1.text_.text = var_262_7

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_8 = 9
				local var_262_9 = utf8.len(var_262_7)
				local var_262_10 = var_262_8 <= 0 and var_262_5 or var_262_5 * (var_262_9 / var_262_8)

				if var_262_10 > 0 and var_262_5 < var_262_10 then
					arg_259_1.talkMaxDuration = var_262_10

					if var_262_10 + var_262_4 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_10 + var_262_4
					end
				end

				arg_259_1.text_.text = var_262_7
				arg_259_1.typewritter.percent = 0

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(false)
				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_11 = math.max(var_262_5, arg_259_1.talkMaxDuration)

			if var_262_4 <= arg_259_1.time_ and arg_259_1.time_ < var_262_4 + var_262_11 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_4) / var_262_11

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_4 + var_262_11 and arg_259_1.time_ < var_262_4 + var_262_11 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402064 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 1109402064
		arg_263_1.duration_ = 7.2

		local var_263_0 = {
			ja = 7.2,
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
				arg_263_0:Play1109402065(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = arg_263_1.actors_["1094ui_story"].transform
			local var_266_1 = 0

			if var_266_1 < arg_263_1.time_ and arg_263_1.time_ <= var_266_1 + arg_266_0 then
				arg_263_1.var_.moveOldPos1094ui_story = var_266_0.localPosition
			end

			local var_266_2 = 0.001

			if var_266_1 <= arg_263_1.time_ and arg_263_1.time_ < var_266_1 + var_266_2 then
				local var_266_3 = (arg_263_1.time_ - var_266_1) / var_266_2
				local var_266_4 = Vector3.New(0, -0.84, -6.1)

				var_266_0.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPos1094ui_story, var_266_4, var_266_3)

				local var_266_5 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_5.x, var_266_5.y, var_266_5.z)

				local var_266_6 = var_266_0.localEulerAngles

				var_266_6.z = 0
				var_266_6.x = 0
				var_266_0.localEulerAngles = var_266_6
			end

			if arg_263_1.time_ >= var_266_1 + var_266_2 and arg_263_1.time_ < var_266_1 + var_266_2 + arg_266_0 then
				var_266_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_266_7 = manager.ui.mainCamera.transform.position - var_266_0.position

				var_266_0.forward = Vector3.New(var_266_7.x, var_266_7.y, var_266_7.z)

				local var_266_8 = var_266_0.localEulerAngles

				var_266_8.z = 0
				var_266_8.x = 0
				var_266_0.localEulerAngles = var_266_8
			end

			local var_266_9 = arg_263_1.actors_["1094ui_story"]
			local var_266_10 = 0

			if var_266_10 < arg_263_1.time_ and arg_263_1.time_ <= var_266_10 + arg_266_0 and arg_263_1.var_.characterEffect1094ui_story == nil then
				arg_263_1.var_.characterEffect1094ui_story = var_266_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_266_11 = 0.200000002980232

			if var_266_10 <= arg_263_1.time_ and arg_263_1.time_ < var_266_10 + var_266_11 then
				local var_266_12 = (arg_263_1.time_ - var_266_10) / var_266_11

				if arg_263_1.var_.characterEffect1094ui_story then
					arg_263_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_263_1.time_ >= var_266_10 + var_266_11 and arg_263_1.time_ < var_266_10 + var_266_11 + arg_266_0 and arg_263_1.var_.characterEffect1094ui_story then
				arg_263_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_266_13 = 0

			if var_266_13 < arg_263_1.time_ and arg_263_1.time_ <= var_266_13 + arg_266_0 then
				arg_263_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_266_14 = 0

			if var_266_14 < arg_263_1.time_ and arg_263_1.time_ <= var_266_14 + arg_266_0 then
				arg_263_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_266_15 = 0
			local var_266_16 = 0.4

			if var_266_15 < arg_263_1.time_ and arg_263_1.time_ <= var_266_15 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0
				arg_263_1.dialogCg_.alpha = 1

				arg_263_1.dialog_:SetActive(true)
				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_17 = arg_263_1:FormatText(StoryNameCfg[181].name)

				arg_263_1.leftNameTxt_.text = var_266_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_18 = arg_263_1:GetWordFromCfg(1109402064)
				local var_266_19 = arg_263_1:FormatText(var_266_18.content)

				arg_263_1.text_.text = var_266_19

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_20 = 16
				local var_266_21 = utf8.len(var_266_19)
				local var_266_22 = var_266_20 <= 0 and var_266_16 or var_266_16 * (var_266_21 / var_266_20)

				if var_266_22 > 0 and var_266_16 < var_266_22 then
					arg_263_1.talkMaxDuration = var_266_22

					if var_266_22 + var_266_15 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_22 + var_266_15
					end
				end

				arg_263_1.text_.text = var_266_19
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402064", "story_v_side_new_1109402.awb") ~= 0 then
					local var_266_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402064", "story_v_side_new_1109402.awb") / 1000

					if var_266_23 + var_266_15 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_23 + var_266_15
					end

					if var_266_18.prefab_name ~= "" and arg_263_1.actors_[var_266_18.prefab_name] ~= nil then
						local var_266_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_18.prefab_name].transform, "story_v_side_new_1109402", "1109402064", "story_v_side_new_1109402.awb")

						arg_263_1:RecordAudio("1109402064", var_266_24)
						arg_263_1:RecordAudio("1109402064", var_266_24)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402064", "story_v_side_new_1109402.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402064", "story_v_side_new_1109402.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_25 = math.max(var_266_16, arg_263_1.talkMaxDuration)

			if var_266_15 <= arg_263_1.time_ and arg_263_1.time_ < var_266_15 + var_266_25 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_15) / var_266_25

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_15 + var_266_25 and arg_263_1.time_ < var_266_15 + var_266_25 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402065 = function(arg_267_0, arg_267_1)
		arg_267_1.time_ = 0
		arg_267_1.frameCnt_ = 0
		arg_267_1.state_ = "playing"
		arg_267_1.curTalkId_ = 1109402065
		arg_267_1.duration_ = 0.200000002979

		SetActive(arg_267_1.tipsGo_, false)

		function arg_267_1.onSingleLineFinish_()
			arg_267_1.onSingleLineUpdate_ = nil
			arg_267_1.onSingleLineFinish_ = nil
			arg_267_1.state_ = "waiting"

			SetActive(arg_267_1.choicesGo_, true)

			for iter_268_0, iter_268_1 in ipairs(arg_267_1.choices_) do
				local var_268_0 = iter_268_0 <= 1

				SetActive(iter_268_1.go, var_268_0)
			end

			arg_267_1.choices_[1].txt.text = arg_267_1:FormatText(StoryChoiceCfg[405].name)
		end

		function arg_267_1.playNext_(arg_269_0)
			if arg_269_0 == 1 then
				arg_267_0:Play1109402066(arg_267_1)
			end
		end

		function arg_267_1.onSingleLineUpdate_(arg_270_0)
			local var_270_0 = arg_267_1.actors_["1094ui_story"]
			local var_270_1 = 0

			if var_270_1 < arg_267_1.time_ and arg_267_1.time_ <= var_270_1 + arg_270_0 and arg_267_1.var_.characterEffect1094ui_story == nil then
				arg_267_1.var_.characterEffect1094ui_story = var_270_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_270_2 = 0.200000002980232

			if var_270_1 <= arg_267_1.time_ and arg_267_1.time_ < var_270_1 + var_270_2 then
				local var_270_3 = (arg_267_1.time_ - var_270_1) / var_270_2

				if arg_267_1.var_.characterEffect1094ui_story then
					local var_270_4 = Mathf.Lerp(0, 0.5, var_270_3)

					arg_267_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_267_1.var_.characterEffect1094ui_story.fillRatio = var_270_4
				end
			end

			if arg_267_1.time_ >= var_270_1 + var_270_2 and arg_267_1.time_ < var_270_1 + var_270_2 + arg_270_0 and arg_267_1.var_.characterEffect1094ui_story then
				local var_270_5 = 0.5

				arg_267_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_267_1.var_.characterEffect1094ui_story.fillRatio = var_270_5
			end

			local var_270_6 = 0

			if var_270_6 < arg_267_1.time_ and arg_267_1.time_ <= var_270_6 + arg_270_0 then
				arg_267_1.allBtn_.enabled = false
			end

			local var_270_7 = 0.200000002980232

			if arg_267_1.time_ >= var_270_6 + var_270_7 and arg_267_1.time_ < var_270_6 + var_270_7 + arg_270_0 then
				arg_267_1.allBtn_.enabled = true
			end
		end
	end,
	Play1109402066 = function(arg_271_0, arg_271_1)
		arg_271_1.time_ = 0
		arg_271_1.frameCnt_ = 0
		arg_271_1.state_ = "playing"
		arg_271_1.curTalkId_ = 1109402066
		arg_271_1.duration_ = 5

		SetActive(arg_271_1.tipsGo_, false)

		function arg_271_1.onSingleLineFinish_()
			arg_271_1.onSingleLineUpdate_ = nil
			arg_271_1.onSingleLineFinish_ = nil
			arg_271_1.state_ = "waiting"
		end

		function arg_271_1.playNext_(arg_273_0)
			if arg_273_0 == 1 then
				arg_271_0:Play1109402067(arg_271_1)
			end
		end

		function arg_271_1.onSingleLineUpdate_(arg_274_0)
			local var_274_0 = arg_271_1.actors_["1094ui_story"].transform
			local var_274_1 = 0

			if var_274_1 < arg_271_1.time_ and arg_271_1.time_ <= var_274_1 + arg_274_0 then
				arg_271_1.var_.moveOldPos1094ui_story = var_274_0.localPosition
			end

			local var_274_2 = 0.001

			if var_274_1 <= arg_271_1.time_ and arg_271_1.time_ < var_274_1 + var_274_2 then
				local var_274_3 = (arg_271_1.time_ - var_274_1) / var_274_2
				local var_274_4 = Vector3.New(0, 100, 0)

				var_274_0.localPosition = Vector3.Lerp(arg_271_1.var_.moveOldPos1094ui_story, var_274_4, var_274_3)

				local var_274_5 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_5.x, var_274_5.y, var_274_5.z)

				local var_274_6 = var_274_0.localEulerAngles

				var_274_6.z = 0
				var_274_6.x = 0
				var_274_0.localEulerAngles = var_274_6
			end

			if arg_271_1.time_ >= var_274_1 + var_274_2 and arg_271_1.time_ < var_274_1 + var_274_2 + arg_274_0 then
				var_274_0.localPosition = Vector3.New(0, 100, 0)

				local var_274_7 = manager.ui.mainCamera.transform.position - var_274_0.position

				var_274_0.forward = Vector3.New(var_274_7.x, var_274_7.y, var_274_7.z)

				local var_274_8 = var_274_0.localEulerAngles

				var_274_8.z = 0
				var_274_8.x = 0
				var_274_0.localEulerAngles = var_274_8
			end

			local var_274_9 = arg_271_1.actors_["1094ui_story"]
			local var_274_10 = 0

			if var_274_10 < arg_271_1.time_ and arg_271_1.time_ <= var_274_10 + arg_274_0 and arg_271_1.var_.characterEffect1094ui_story == nil then
				arg_271_1.var_.characterEffect1094ui_story = var_274_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_274_11 = 0.200000002980232

			if var_274_10 <= arg_271_1.time_ and arg_271_1.time_ < var_274_10 + var_274_11 then
				local var_274_12 = (arg_271_1.time_ - var_274_10) / var_274_11

				if arg_271_1.var_.characterEffect1094ui_story then
					local var_274_13 = Mathf.Lerp(0, 0.5, var_274_12)

					arg_271_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_271_1.var_.characterEffect1094ui_story.fillRatio = var_274_13
				end
			end

			if arg_271_1.time_ >= var_274_10 + var_274_11 and arg_271_1.time_ < var_274_10 + var_274_11 + arg_274_0 and arg_271_1.var_.characterEffect1094ui_story then
				local var_274_14 = 0.5

				arg_271_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_271_1.var_.characterEffect1094ui_story.fillRatio = var_274_14
			end

			local var_274_15 = 0
			local var_274_16 = 1

			if var_274_15 < arg_271_1.time_ and arg_271_1.time_ <= var_274_15 + arg_274_0 then
				local var_274_17 = "play"
				local var_274_18 = "effect"

				arg_271_1:AudioAction(var_274_17, var_274_18, "se_story_side_1094", "se_story_1094_run", "")
			end

			local var_274_19 = 0
			local var_274_20 = 0.225

			if var_274_19 < arg_271_1.time_ and arg_271_1.time_ <= var_274_19 + arg_274_0 then
				arg_271_1.talkMaxDuration = 0
				arg_271_1.dialogCg_.alpha = 1

				arg_271_1.dialog_:SetActive(true)
				SetActive(arg_271_1.leftNameGo_, false)

				arg_271_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_271_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_271_1:RecordName(arg_271_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_271_1.iconTrs_.gameObject, false)
				arg_271_1.callingController_:SetSelectedState("normal")

				local var_274_21 = arg_271_1:GetWordFromCfg(1109402066)
				local var_274_22 = arg_271_1:FormatText(var_274_21.content)

				arg_271_1.text_.text = var_274_22

				LuaForUtil.ClearLinePrefixSymbol(arg_271_1.text_)

				local var_274_23 = 9
				local var_274_24 = utf8.len(var_274_22)
				local var_274_25 = var_274_23 <= 0 and var_274_20 or var_274_20 * (var_274_24 / var_274_23)

				if var_274_25 > 0 and var_274_20 < var_274_25 then
					arg_271_1.talkMaxDuration = var_274_25

					if var_274_25 + var_274_19 > arg_271_1.duration_ then
						arg_271_1.duration_ = var_274_25 + var_274_19
					end
				end

				arg_271_1.text_.text = var_274_22
				arg_271_1.typewritter.percent = 0

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(false)
				arg_271_1:RecordContent(arg_271_1.text_.text)
			end

			local var_274_26 = math.max(var_274_20, arg_271_1.talkMaxDuration)

			if var_274_19 <= arg_271_1.time_ and arg_271_1.time_ < var_274_19 + var_274_26 then
				arg_271_1.typewritter.percent = (arg_271_1.time_ - var_274_19) / var_274_26

				arg_271_1.typewritter:SetDirty()
			end

			if arg_271_1.time_ >= var_274_19 + var_274_26 and arg_271_1.time_ < var_274_19 + var_274_26 + arg_274_0 then
				arg_271_1.typewritter.percent = 1

				arg_271_1.typewritter:SetDirty()
				arg_271_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402067 = function(arg_275_0, arg_275_1)
		arg_275_1.time_ = 0
		arg_275_1.frameCnt_ = 0
		arg_275_1.state_ = "playing"
		arg_275_1.curTalkId_ = 1109402067
		arg_275_1.duration_ = 5

		SetActive(arg_275_1.tipsGo_, false)

		function arg_275_1.onSingleLineFinish_()
			arg_275_1.onSingleLineUpdate_ = nil
			arg_275_1.onSingleLineFinish_ = nil
			arg_275_1.state_ = "waiting"
		end

		function arg_275_1.playNext_(arg_277_0)
			if arg_277_0 == 1 then
				arg_275_0:Play1109402068(arg_275_1)
			end
		end

		function arg_275_1.onSingleLineUpdate_(arg_278_0)
			local var_278_0 = 0
			local var_278_1 = 0.375

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

				local var_278_3 = arg_275_1:GetWordFromCfg(1109402067)
				local var_278_4 = arg_275_1:FormatText(var_278_3.content)

				arg_275_1.text_.text = var_278_4

				LuaForUtil.ClearLinePrefixSymbol(arg_275_1.text_)

				local var_278_5 = 15
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
	Play1109402068 = function(arg_279_0, arg_279_1)
		arg_279_1.time_ = 0
		arg_279_1.frameCnt_ = 0
		arg_279_1.state_ = "playing"
		arg_279_1.curTalkId_ = 1109402068
		arg_279_1.duration_ = 5

		SetActive(arg_279_1.tipsGo_, false)

		function arg_279_1.onSingleLineFinish_()
			arg_279_1.onSingleLineUpdate_ = nil
			arg_279_1.onSingleLineFinish_ = nil
			arg_279_1.state_ = "waiting"
		end

		function arg_279_1.playNext_(arg_281_0)
			if arg_281_0 == 1 then
				arg_279_0:Play1109402069(arg_279_1)
			end
		end

		function arg_279_1.onSingleLineUpdate_(arg_282_0)
			local var_282_0 = 0
			local var_282_1 = 1

			if var_282_0 < arg_279_1.time_ and arg_279_1.time_ <= var_282_0 + arg_282_0 then
				local var_282_2 = "play"
				local var_282_3 = "effect"

				arg_279_1:AudioAction(var_282_2, var_282_3, "se_story_side_1094", "se_story_1094_run", "")
			end

			local var_282_4 = 0
			local var_282_5 = 0.325

			if var_282_4 < arg_279_1.time_ and arg_279_1.time_ <= var_282_4 + arg_282_0 then
				arg_279_1.talkMaxDuration = 0
				arg_279_1.dialogCg_.alpha = 1

				arg_279_1.dialog_:SetActive(true)
				SetActive(arg_279_1.leftNameGo_, false)

				arg_279_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_279_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_279_1:RecordName(arg_279_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_279_1.iconTrs_.gameObject, false)
				arg_279_1.callingController_:SetSelectedState("normal")

				local var_282_6 = arg_279_1:GetWordFromCfg(1109402068)
				local var_282_7 = arg_279_1:FormatText(var_282_6.content)

				arg_279_1.text_.text = var_282_7

				LuaForUtil.ClearLinePrefixSymbol(arg_279_1.text_)

				local var_282_8 = 13
				local var_282_9 = utf8.len(var_282_7)
				local var_282_10 = var_282_8 <= 0 and var_282_5 or var_282_5 * (var_282_9 / var_282_8)

				if var_282_10 > 0 and var_282_5 < var_282_10 then
					arg_279_1.talkMaxDuration = var_282_10

					if var_282_10 + var_282_4 > arg_279_1.duration_ then
						arg_279_1.duration_ = var_282_10 + var_282_4
					end
				end

				arg_279_1.text_.text = var_282_7
				arg_279_1.typewritter.percent = 0

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(false)
				arg_279_1:RecordContent(arg_279_1.text_.text)
			end

			local var_282_11 = math.max(var_282_5, arg_279_1.talkMaxDuration)

			if var_282_4 <= arg_279_1.time_ and arg_279_1.time_ < var_282_4 + var_282_11 then
				arg_279_1.typewritter.percent = (arg_279_1.time_ - var_282_4) / var_282_11

				arg_279_1.typewritter:SetDirty()
			end

			if arg_279_1.time_ >= var_282_4 + var_282_11 and arg_279_1.time_ < var_282_4 + var_282_11 + arg_282_0 then
				arg_279_1.typewritter.percent = 1

				arg_279_1.typewritter:SetDirty()
				arg_279_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402069 = function(arg_283_0, arg_283_1)
		arg_283_1.time_ = 0
		arg_283_1.frameCnt_ = 0
		arg_283_1.state_ = "playing"
		arg_283_1.curTalkId_ = 1109402069
		arg_283_1.duration_ = 4.6

		local var_283_0 = {
			ja = 4.6,
			ko = 3.066,
			zh = 3.066
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
				arg_283_0:Play1109402070(arg_283_1)
			end
		end

		function arg_283_1.onSingleLineUpdate_(arg_286_0)
			local var_286_0 = arg_283_1.actors_["1094ui_story"].transform
			local var_286_1 = 0

			if var_286_1 < arg_283_1.time_ and arg_283_1.time_ <= var_286_1 + arg_286_0 then
				arg_283_1.var_.moveOldPos1094ui_story = var_286_0.localPosition
			end

			local var_286_2 = 0.001

			if var_286_1 <= arg_283_1.time_ and arg_283_1.time_ < var_286_1 + var_286_2 then
				local var_286_3 = (arg_283_1.time_ - var_286_1) / var_286_2
				local var_286_4 = Vector3.New(0, -0.84, -6.1)

				var_286_0.localPosition = Vector3.Lerp(arg_283_1.var_.moveOldPos1094ui_story, var_286_4, var_286_3)

				local var_286_5 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_5.x, var_286_5.y, var_286_5.z)

				local var_286_6 = var_286_0.localEulerAngles

				var_286_6.z = 0
				var_286_6.x = 0
				var_286_0.localEulerAngles = var_286_6
			end

			if arg_283_1.time_ >= var_286_1 + var_286_2 and arg_283_1.time_ < var_286_1 + var_286_2 + arg_286_0 then
				var_286_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_286_7 = manager.ui.mainCamera.transform.position - var_286_0.position

				var_286_0.forward = Vector3.New(var_286_7.x, var_286_7.y, var_286_7.z)

				local var_286_8 = var_286_0.localEulerAngles

				var_286_8.z = 0
				var_286_8.x = 0
				var_286_0.localEulerAngles = var_286_8
			end

			local var_286_9 = arg_283_1.actors_["1094ui_story"]
			local var_286_10 = 0

			if var_286_10 < arg_283_1.time_ and arg_283_1.time_ <= var_286_10 + arg_286_0 and arg_283_1.var_.characterEffect1094ui_story == nil then
				arg_283_1.var_.characterEffect1094ui_story = var_286_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_286_11 = 0.200000002980232

			if var_286_10 <= arg_283_1.time_ and arg_283_1.time_ < var_286_10 + var_286_11 then
				local var_286_12 = (arg_283_1.time_ - var_286_10) / var_286_11

				if arg_283_1.var_.characterEffect1094ui_story then
					arg_283_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_283_1.time_ >= var_286_10 + var_286_11 and arg_283_1.time_ < var_286_10 + var_286_11 + arg_286_0 and arg_283_1.var_.characterEffect1094ui_story then
				arg_283_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_286_13 = 0

			if var_286_13 < arg_283_1.time_ and arg_283_1.time_ <= var_286_13 + arg_286_0 then
				arg_283_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_286_14 = 0

			if var_286_14 < arg_283_1.time_ and arg_283_1.time_ <= var_286_14 + arg_286_0 then
				arg_283_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_286_15 = 0
			local var_286_16 = 0.35

			if var_286_15 < arg_283_1.time_ and arg_283_1.time_ <= var_286_15 + arg_286_0 then
				arg_283_1.talkMaxDuration = 0
				arg_283_1.dialogCg_.alpha = 1

				arg_283_1.dialog_:SetActive(true)
				SetActive(arg_283_1.leftNameGo_, true)

				local var_286_17 = arg_283_1:FormatText(StoryNameCfg[181].name)

				arg_283_1.leftNameTxt_.text = var_286_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_283_1.leftNameTxt_.transform)

				arg_283_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_283_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_283_1:RecordName(arg_283_1.leftNameTxt_.text)
				SetActive(arg_283_1.iconTrs_.gameObject, false)
				arg_283_1.callingController_:SetSelectedState("normal")

				local var_286_18 = arg_283_1:GetWordFromCfg(1109402069)
				local var_286_19 = arg_283_1:FormatText(var_286_18.content)

				arg_283_1.text_.text = var_286_19

				LuaForUtil.ClearLinePrefixSymbol(arg_283_1.text_)

				local var_286_20 = 14
				local var_286_21 = utf8.len(var_286_19)
				local var_286_22 = var_286_20 <= 0 and var_286_16 or var_286_16 * (var_286_21 / var_286_20)

				if var_286_22 > 0 and var_286_16 < var_286_22 then
					arg_283_1.talkMaxDuration = var_286_22

					if var_286_22 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_22 + var_286_15
					end
				end

				arg_283_1.text_.text = var_286_19
				arg_283_1.typewritter.percent = 0

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402069", "story_v_side_new_1109402.awb") ~= 0 then
					local var_286_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402069", "story_v_side_new_1109402.awb") / 1000

					if var_286_23 + var_286_15 > arg_283_1.duration_ then
						arg_283_1.duration_ = var_286_23 + var_286_15
					end

					if var_286_18.prefab_name ~= "" and arg_283_1.actors_[var_286_18.prefab_name] ~= nil then
						local var_286_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_283_1.actors_[var_286_18.prefab_name].transform, "story_v_side_new_1109402", "1109402069", "story_v_side_new_1109402.awb")

						arg_283_1:RecordAudio("1109402069", var_286_24)
						arg_283_1:RecordAudio("1109402069", var_286_24)
					else
						arg_283_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402069", "story_v_side_new_1109402.awb")
					end

					arg_283_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402069", "story_v_side_new_1109402.awb")
				end

				arg_283_1:RecordContent(arg_283_1.text_.text)
			end

			local var_286_25 = math.max(var_286_16, arg_283_1.talkMaxDuration)

			if var_286_15 <= arg_283_1.time_ and arg_283_1.time_ < var_286_15 + var_286_25 then
				arg_283_1.typewritter.percent = (arg_283_1.time_ - var_286_15) / var_286_25

				arg_283_1.typewritter:SetDirty()
			end

			if arg_283_1.time_ >= var_286_15 + var_286_25 and arg_283_1.time_ < var_286_15 + var_286_25 + arg_286_0 then
				arg_283_1.typewritter.percent = 1

				arg_283_1.typewritter:SetDirty()
				arg_283_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402070 = function(arg_287_0, arg_287_1)
		arg_287_1.time_ = 0
		arg_287_1.frameCnt_ = 0
		arg_287_1.state_ = "playing"
		arg_287_1.curTalkId_ = 1109402070
		arg_287_1.duration_ = 0.200000002979

		SetActive(arg_287_1.tipsGo_, false)

		function arg_287_1.onSingleLineFinish_()
			arg_287_1.onSingleLineUpdate_ = nil
			arg_287_1.onSingleLineFinish_ = nil
			arg_287_1.state_ = "waiting"

			SetActive(arg_287_1.choicesGo_, true)

			for iter_288_0, iter_288_1 in ipairs(arg_287_1.choices_) do
				local var_288_0 = iter_288_0 <= 1

				SetActive(iter_288_1.go, var_288_0)
			end

			arg_287_1.choices_[1].txt.text = arg_287_1:FormatText(StoryChoiceCfg[406].name)
		end

		function arg_287_1.playNext_(arg_289_0)
			if arg_289_0 == 1 then
				arg_287_0:Play1109402071(arg_287_1)
			end
		end

		function arg_287_1.onSingleLineUpdate_(arg_290_0)
			local var_290_0 = arg_287_1.actors_["1094ui_story"]
			local var_290_1 = 0

			if var_290_1 < arg_287_1.time_ and arg_287_1.time_ <= var_290_1 + arg_290_0 and arg_287_1.var_.characterEffect1094ui_story == nil then
				arg_287_1.var_.characterEffect1094ui_story = var_290_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_290_2 = 0.200000002980232

			if var_290_1 <= arg_287_1.time_ and arg_287_1.time_ < var_290_1 + var_290_2 then
				local var_290_3 = (arg_287_1.time_ - var_290_1) / var_290_2

				if arg_287_1.var_.characterEffect1094ui_story then
					local var_290_4 = Mathf.Lerp(0, 0.5, var_290_3)

					arg_287_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_287_1.var_.characterEffect1094ui_story.fillRatio = var_290_4
				end
			end

			if arg_287_1.time_ >= var_290_1 + var_290_2 and arg_287_1.time_ < var_290_1 + var_290_2 + arg_290_0 and arg_287_1.var_.characterEffect1094ui_story then
				local var_290_5 = 0.5

				arg_287_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_287_1.var_.characterEffect1094ui_story.fillRatio = var_290_5
			end

			local var_290_6 = 0

			if var_290_6 < arg_287_1.time_ and arg_287_1.time_ <= var_290_6 + arg_290_0 then
				arg_287_1.allBtn_.enabled = false
			end

			local var_290_7 = 0.200000002980232

			if arg_287_1.time_ >= var_290_6 + var_290_7 and arg_287_1.time_ < var_290_6 + var_290_7 + arg_290_0 then
				arg_287_1.allBtn_.enabled = true
			end
		end
	end,
	Play1109402071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 1109402071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play1109402072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = arg_291_1.actors_["1094ui_story"].transform
			local var_294_1 = 0

			if var_294_1 < arg_291_1.time_ and arg_291_1.time_ <= var_294_1 + arg_294_0 then
				arg_291_1.var_.moveOldPos1094ui_story = var_294_0.localPosition
			end

			local var_294_2 = 0.001

			if var_294_1 <= arg_291_1.time_ and arg_291_1.time_ < var_294_1 + var_294_2 then
				local var_294_3 = (arg_291_1.time_ - var_294_1) / var_294_2
				local var_294_4 = Vector3.New(0, 100, 0)

				var_294_0.localPosition = Vector3.Lerp(arg_291_1.var_.moveOldPos1094ui_story, var_294_4, var_294_3)

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

			local var_294_9 = arg_291_1.actors_["1094ui_story"]
			local var_294_10 = 0

			if var_294_10 < arg_291_1.time_ and arg_291_1.time_ <= var_294_10 + arg_294_0 and arg_291_1.var_.characterEffect1094ui_story == nil then
				arg_291_1.var_.characterEffect1094ui_story = var_294_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_294_11 = 0.200000002980232

			if var_294_10 <= arg_291_1.time_ and arg_291_1.time_ < var_294_10 + var_294_11 then
				local var_294_12 = (arg_291_1.time_ - var_294_10) / var_294_11

				if arg_291_1.var_.characterEffect1094ui_story then
					local var_294_13 = Mathf.Lerp(0, 0.5, var_294_12)

					arg_291_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_291_1.var_.characterEffect1094ui_story.fillRatio = var_294_13
				end
			end

			if arg_291_1.time_ >= var_294_10 + var_294_11 and arg_291_1.time_ < var_294_10 + var_294_11 + arg_294_0 and arg_291_1.var_.characterEffect1094ui_story then
				local var_294_14 = 0.5

				arg_291_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_291_1.var_.characterEffect1094ui_story.fillRatio = var_294_14
			end

			local var_294_15 = 0
			local var_294_16 = 1

			if var_294_15 < arg_291_1.time_ and arg_291_1.time_ <= var_294_15 + arg_294_0 then
				local var_294_17 = "play"
				local var_294_18 = "effect"

				arg_291_1:AudioAction(var_294_17, var_294_18, "se_story_side_1094", "se_story_1094_run", "")
			end

			local var_294_19 = 0
			local var_294_20 = 0.25

			if var_294_19 < arg_291_1.time_ and arg_291_1.time_ <= var_294_19 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_21 = arg_291_1:GetWordFromCfg(1109402071)
				local var_294_22 = arg_291_1:FormatText(var_294_21.content)

				arg_291_1.text_.text = var_294_22

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_23 = 10
				local var_294_24 = utf8.len(var_294_22)
				local var_294_25 = var_294_23 <= 0 and var_294_20 or var_294_20 * (var_294_24 / var_294_23)

				if var_294_25 > 0 and var_294_20 < var_294_25 then
					arg_291_1.talkMaxDuration = var_294_25

					if var_294_25 + var_294_19 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_25 + var_294_19
					end
				end

				arg_291_1.text_.text = var_294_22
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_26 = math.max(var_294_20, arg_291_1.talkMaxDuration)

			if var_294_19 <= arg_291_1.time_ and arg_291_1.time_ < var_294_19 + var_294_26 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_19) / var_294_26

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_19 + var_294_26 and arg_291_1.time_ < var_294_19 + var_294_26 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 1109402072
		arg_295_1.duration_ = 5

		SetActive(arg_295_1.tipsGo_, false)

		function arg_295_1.onSingleLineFinish_()
			arg_295_1.onSingleLineUpdate_ = nil
			arg_295_1.onSingleLineFinish_ = nil
			arg_295_1.state_ = "waiting"
		end

		function arg_295_1.playNext_(arg_297_0)
			if arg_297_0 == 1 then
				arg_295_0:Play1109402073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = 0
			local var_298_1 = 0.5

			if var_298_0 < arg_295_1.time_ and arg_295_1.time_ <= var_298_0 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_2 = arg_295_1:FormatText(StoryNameCfg[7].name)

				arg_295_1.leftNameTxt_.text = var_298_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_3 = arg_295_1:GetWordFromCfg(1109402072)
				local var_298_4 = arg_295_1:FormatText(var_298_3.content)

				arg_295_1.text_.text = var_298_4

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_5 = 20
				local var_298_6 = utf8.len(var_298_4)
				local var_298_7 = var_298_5 <= 0 and var_298_1 or var_298_1 * (var_298_6 / var_298_5)

				if var_298_7 > 0 and var_298_1 < var_298_7 then
					arg_295_1.talkMaxDuration = var_298_7

					if var_298_7 + var_298_0 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_7 + var_298_0
					end
				end

				arg_295_1.text_.text = var_298_4
				arg_295_1.typewritter.percent = 0

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(false)
				arg_295_1:RecordContent(arg_295_1.text_.text)
			end

			local var_298_8 = math.max(var_298_1, arg_295_1.talkMaxDuration)

			if var_298_0 <= arg_295_1.time_ and arg_295_1.time_ < var_298_0 + var_298_8 then
				arg_295_1.typewritter.percent = (arg_295_1.time_ - var_298_0) / var_298_8

				arg_295_1.typewritter:SetDirty()
			end

			if arg_295_1.time_ >= var_298_0 + var_298_8 and arg_295_1.time_ < var_298_0 + var_298_8 + arg_298_0 then
				arg_295_1.typewritter.percent = 1

				arg_295_1.typewritter:SetDirty()
				arg_295_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 1109402073
		arg_299_1.duration_ = 4.233

		local var_299_0 = {
			ja = 4.233,
			ko = 3.2,
			zh = 3.2
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
				arg_299_0:Play1109402074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = 0
			local var_302_1 = 0.225

			if var_302_0 < arg_299_1.time_ and arg_299_1.time_ <= var_302_0 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, true)

				local var_302_2 = arg_299_1:FormatText(StoryNameCfg[189].name)

				arg_299_1.leftNameTxt_.text = var_302_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_299_1.leftNameTxt_.transform)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1.leftNameTxt_.text)
				SetActive(arg_299_1.iconTrs_.gameObject, true)
				arg_299_1.iconController_:SetSelectedState("hero")

				arg_299_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_3 = arg_299_1:GetWordFromCfg(1109402073)
				local var_302_4 = arg_299_1:FormatText(var_302_3.content)

				arg_299_1.text_.text = var_302_4

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402073", "story_v_side_new_1109402.awb") ~= 0 then
					local var_302_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402073", "story_v_side_new_1109402.awb") / 1000

					if var_302_8 + var_302_0 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_8 + var_302_0
					end

					if var_302_3.prefab_name ~= "" and arg_299_1.actors_[var_302_3.prefab_name] ~= nil then
						local var_302_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_299_1.actors_[var_302_3.prefab_name].transform, "story_v_side_new_1109402", "1109402073", "story_v_side_new_1109402.awb")

						arg_299_1:RecordAudio("1109402073", var_302_9)
						arg_299_1:RecordAudio("1109402073", var_302_9)
					else
						arg_299_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402073", "story_v_side_new_1109402.awb")
					end

					arg_299_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402073", "story_v_side_new_1109402.awb")
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
	Play1109402074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 1109402074
		arg_303_1.duration_ = 5

		SetActive(arg_303_1.tipsGo_, false)

		function arg_303_1.onSingleLineFinish_()
			arg_303_1.onSingleLineUpdate_ = nil
			arg_303_1.onSingleLineFinish_ = nil
			arg_303_1.state_ = "waiting"
		end

		function arg_303_1.playNext_(arg_305_0)
			if arg_305_0 == 1 then
				arg_303_0:Play1109402075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = 0
			local var_306_1 = 0.65

			if var_306_0 < arg_303_1.time_ and arg_303_1.time_ <= var_306_0 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_2 = arg_303_1:FormatText(StoryNameCfg[7].name)

				arg_303_1.leftNameTxt_.text = var_306_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_3 = arg_303_1:GetWordFromCfg(1109402074)
				local var_306_4 = arg_303_1:FormatText(var_306_3.content)

				arg_303_1.text_.text = var_306_4

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_5 = 26
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
				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_8 = math.max(var_306_1, arg_303_1.talkMaxDuration)

			if var_306_0 <= arg_303_1.time_ and arg_303_1.time_ < var_306_0 + var_306_8 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_0) / var_306_8

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_0 + var_306_8 and arg_303_1.time_ < var_306_0 + var_306_8 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 1109402075
		arg_307_1.duration_ = 5

		SetActive(arg_307_1.tipsGo_, false)

		function arg_307_1.onSingleLineFinish_()
			arg_307_1.onSingleLineUpdate_ = nil
			arg_307_1.onSingleLineFinish_ = nil
			arg_307_1.state_ = "waiting"
		end

		function arg_307_1.playNext_(arg_309_0)
			if arg_309_0 == 1 then
				arg_307_0:Play1109402076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = 0
			local var_310_1 = 1.075

			if var_310_0 < arg_307_1.time_ and arg_307_1.time_ <= var_310_0 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, false)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_2 = arg_307_1:GetWordFromCfg(1109402075)
				local var_310_3 = arg_307_1:FormatText(var_310_2.content)

				arg_307_1.text_.text = var_310_3

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_4 = 43
				local var_310_5 = utf8.len(var_310_3)
				local var_310_6 = var_310_4 <= 0 and var_310_1 or var_310_1 * (var_310_5 / var_310_4)

				if var_310_6 > 0 and var_310_1 < var_310_6 then
					arg_307_1.talkMaxDuration = var_310_6

					if var_310_6 + var_310_0 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_6 + var_310_0
					end
				end

				arg_307_1.text_.text = var_310_3
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)
				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_7 = math.max(var_310_1, arg_307_1.talkMaxDuration)

			if var_310_0 <= arg_307_1.time_ and arg_307_1.time_ < var_310_0 + var_310_7 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_0) / var_310_7

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_0 + var_310_7 and arg_307_1.time_ < var_310_0 + var_310_7 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 1109402076
		arg_311_1.duration_ = 5

		SetActive(arg_311_1.tipsGo_, false)

		function arg_311_1.onSingleLineFinish_()
			arg_311_1.onSingleLineUpdate_ = nil
			arg_311_1.onSingleLineFinish_ = nil
			arg_311_1.state_ = "waiting"
		end

		function arg_311_1.playNext_(arg_313_0)
			if arg_313_0 == 1 then
				arg_311_0:Play1109402077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = 0
			local var_314_1 = 0.85

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

				local var_314_2 = arg_311_1:GetWordFromCfg(1109402076)
				local var_314_3 = arg_311_1:FormatText(var_314_2.content)

				arg_311_1.text_.text = var_314_3

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_4 = 34
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
	Play1109402077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 1109402077
		arg_315_1.duration_ = 5

		SetActive(arg_315_1.tipsGo_, false)

		function arg_315_1.onSingleLineFinish_()
			arg_315_1.onSingleLineUpdate_ = nil
			arg_315_1.onSingleLineFinish_ = nil
			arg_315_1.state_ = "waiting"
		end

		function arg_315_1.playNext_(arg_317_0)
			if arg_317_0 == 1 then
				arg_315_0:Play1109402078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = 0
			local var_318_1 = 0.8

			if var_318_0 < arg_315_1.time_ and arg_315_1.time_ <= var_318_0 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, false)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_2 = arg_315_1:GetWordFromCfg(1109402077)
				local var_318_3 = arg_315_1:FormatText(var_318_2.content)

				arg_315_1.text_.text = var_318_3

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_4 = 32
				local var_318_5 = utf8.len(var_318_3)
				local var_318_6 = var_318_4 <= 0 and var_318_1 or var_318_1 * (var_318_5 / var_318_4)

				if var_318_6 > 0 and var_318_1 < var_318_6 then
					arg_315_1.talkMaxDuration = var_318_6

					if var_318_6 + var_318_0 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_6 + var_318_0
					end
				end

				arg_315_1.text_.text = var_318_3
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)
				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_7 = math.max(var_318_1, arg_315_1.talkMaxDuration)

			if var_318_0 <= arg_315_1.time_ and arg_315_1.time_ < var_318_0 + var_318_7 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_0) / var_318_7

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_0 + var_318_7 and arg_315_1.time_ < var_318_0 + var_318_7 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 1109402078
		arg_319_1.duration_ = 5

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play1109402079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = 0
			local var_322_1 = 0.3

			if var_322_0 < arg_319_1.time_ and arg_319_1.time_ <= var_322_0 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_2 = arg_319_1:FormatText(StoryNameCfg[7].name)

				arg_319_1.leftNameTxt_.text = var_322_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_3 = arg_319_1:GetWordFromCfg(1109402078)
				local var_322_4 = arg_319_1:FormatText(var_322_3.content)

				arg_319_1.text_.text = var_322_4

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_5 = 12
				local var_322_6 = utf8.len(var_322_4)
				local var_322_7 = var_322_5 <= 0 and var_322_1 or var_322_1 * (var_322_6 / var_322_5)

				if var_322_7 > 0 and var_322_1 < var_322_7 then
					arg_319_1.talkMaxDuration = var_322_7

					if var_322_7 + var_322_0 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_7 + var_322_0
					end
				end

				arg_319_1.text_.text = var_322_4
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)
				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_8 = math.max(var_322_1, arg_319_1.talkMaxDuration)

			if var_322_0 <= arg_319_1.time_ and arg_319_1.time_ < var_322_0 + var_322_8 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_0) / var_322_8

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_0 + var_322_8 and arg_319_1.time_ < var_322_0 + var_322_8 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 1109402079
		arg_323_1.duration_ = 1.733

		local var_323_0 = {
			ja = 1.566,
			ko = 1.733,
			zh = 1.733
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
				arg_323_0:Play1109402080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1094ui_story"].transform
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 then
				arg_323_1.var_.moveOldPos1094ui_story = var_326_0.localPosition
			end

			local var_326_2 = 0.001

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2
				local var_326_4 = Vector3.New(0, -0.84, -6.1)

				var_326_0.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1094ui_story, var_326_4, var_326_3)

				local var_326_5 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_5.x, var_326_5.y, var_326_5.z)

				local var_326_6 = var_326_0.localEulerAngles

				var_326_6.z = 0
				var_326_6.x = 0
				var_326_0.localEulerAngles = var_326_6
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 then
				var_326_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_326_7 = manager.ui.mainCamera.transform.position - var_326_0.position

				var_326_0.forward = Vector3.New(var_326_7.x, var_326_7.y, var_326_7.z)

				local var_326_8 = var_326_0.localEulerAngles

				var_326_8.z = 0
				var_326_8.x = 0
				var_326_0.localEulerAngles = var_326_8
			end

			local var_326_9 = arg_323_1.actors_["1094ui_story"]
			local var_326_10 = 0

			if var_326_10 < arg_323_1.time_ and arg_323_1.time_ <= var_326_10 + arg_326_0 and arg_323_1.var_.characterEffect1094ui_story == nil then
				arg_323_1.var_.characterEffect1094ui_story = var_326_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_11 = 0.200000002980232

			if var_326_10 <= arg_323_1.time_ and arg_323_1.time_ < var_326_10 + var_326_11 then
				local var_326_12 = (arg_323_1.time_ - var_326_10) / var_326_11

				if arg_323_1.var_.characterEffect1094ui_story then
					arg_323_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_10 + var_326_11 and arg_323_1.time_ < var_326_10 + var_326_11 + arg_326_0 and arg_323_1.var_.characterEffect1094ui_story then
				arg_323_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_326_13 = 0
			local var_326_14 = 0.125

			if var_326_13 < arg_323_1.time_ and arg_323_1.time_ <= var_326_13 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_15 = arg_323_1:FormatText(StoryNameCfg[434].name)

				arg_323_1.leftNameTxt_.text = var_326_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, true)
				arg_323_1.iconController_:SetSelectedState("hero")

				arg_323_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_16 = arg_323_1:GetWordFromCfg(1109402079)
				local var_326_17 = arg_323_1:FormatText(var_326_16.content)

				arg_323_1.text_.text = var_326_17

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_18 = 5
				local var_326_19 = utf8.len(var_326_17)
				local var_326_20 = var_326_18 <= 0 and var_326_14 or var_326_14 * (var_326_19 / var_326_18)

				if var_326_20 > 0 and var_326_14 < var_326_20 then
					arg_323_1.talkMaxDuration = var_326_20

					if var_326_20 + var_326_13 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_20 + var_326_13
					end
				end

				arg_323_1.text_.text = var_326_17
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402079", "story_v_side_new_1109402.awb") ~= 0 then
					local var_326_21 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402079", "story_v_side_new_1109402.awb") / 1000

					if var_326_21 + var_326_13 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_21 + var_326_13
					end

					if var_326_16.prefab_name ~= "" and arg_323_1.actors_[var_326_16.prefab_name] ~= nil then
						local var_326_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_16.prefab_name].transform, "story_v_side_new_1109402", "1109402079", "story_v_side_new_1109402.awb")

						arg_323_1:RecordAudio("1109402079", var_326_22)
						arg_323_1:RecordAudio("1109402079", var_326_22)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402079", "story_v_side_new_1109402.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402079", "story_v_side_new_1109402.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_23 = math.max(var_326_14, arg_323_1.talkMaxDuration)

			if var_326_13 <= arg_323_1.time_ and arg_323_1.time_ < var_326_13 + var_326_23 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_13) / var_326_23

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_13 + var_326_23 and arg_323_1.time_ < var_326_13 + var_326_23 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 1109402080
		arg_327_1.duration_ = 5.2

		local var_327_0 = {
			ja = 5.066,
			ko = 5.2,
			zh = 5.2
		}
		local var_327_1 = manager.audio:GetLocalizationFlag()

		if var_327_0[var_327_1] ~= nil then
			arg_327_1.duration_ = var_327_0[var_327_1]
		end

		SetActive(arg_327_1.tipsGo_, false)

		function arg_327_1.onSingleLineFinish_()
			arg_327_1.onSingleLineUpdate_ = nil
			arg_327_1.onSingleLineFinish_ = nil
			arg_327_1.state_ = "waiting"
		end

		function arg_327_1.playNext_(arg_329_0)
			if arg_329_0 == 1 then
				arg_327_0:Play1109402081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1094ui_story"].transform
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				arg_327_1.var_.moveOldPos1094ui_story = var_330_0.localPosition
			end

			local var_330_2 = 0.001

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2
				local var_330_4 = Vector3.New(0, -0.84, -6.1)

				var_330_0.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1094ui_story, var_330_4, var_330_3)

				local var_330_5 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_5.x, var_330_5.y, var_330_5.z)

				local var_330_6 = var_330_0.localEulerAngles

				var_330_6.z = 0
				var_330_6.x = 0
				var_330_0.localEulerAngles = var_330_6
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 then
				var_330_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_330_7 = manager.ui.mainCamera.transform.position - var_330_0.position

				var_330_0.forward = Vector3.New(var_330_7.x, var_330_7.y, var_330_7.z)

				local var_330_8 = var_330_0.localEulerAngles

				var_330_8.z = 0
				var_330_8.x = 0
				var_330_0.localEulerAngles = var_330_8
			end

			local var_330_9 = 0

			if var_330_9 < arg_327_1.time_ and arg_327_1.time_ <= var_330_9 + arg_330_0 then
				arg_327_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_1")
			end

			local var_330_10 = 0

			if var_330_10 < arg_327_1.time_ and arg_327_1.time_ <= var_330_10 + arg_330_0 then
				arg_327_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_330_11 = 0
			local var_330_12 = 0.625

			if var_330_11 < arg_327_1.time_ and arg_327_1.time_ <= var_330_11 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_13 = arg_327_1:FormatText(StoryNameCfg[181].name)

				arg_327_1.leftNameTxt_.text = var_330_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_14 = arg_327_1:GetWordFromCfg(1109402080)
				local var_330_15 = arg_327_1:FormatText(var_330_14.content)

				arg_327_1.text_.text = var_330_15

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_16 = 25
				local var_330_17 = utf8.len(var_330_15)
				local var_330_18 = var_330_16 <= 0 and var_330_12 or var_330_12 * (var_330_17 / var_330_16)

				if var_330_18 > 0 and var_330_12 < var_330_18 then
					arg_327_1.talkMaxDuration = var_330_18

					if var_330_18 + var_330_11 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_18 + var_330_11
					end
				end

				arg_327_1.text_.text = var_330_15
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402080", "story_v_side_new_1109402.awb") ~= 0 then
					local var_330_19 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402080", "story_v_side_new_1109402.awb") / 1000

					if var_330_19 + var_330_11 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_19 + var_330_11
					end

					if var_330_14.prefab_name ~= "" and arg_327_1.actors_[var_330_14.prefab_name] ~= nil then
						local var_330_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_14.prefab_name].transform, "story_v_side_new_1109402", "1109402080", "story_v_side_new_1109402.awb")

						arg_327_1:RecordAudio("1109402080", var_330_20)
						arg_327_1:RecordAudio("1109402080", var_330_20)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402080", "story_v_side_new_1109402.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402080", "story_v_side_new_1109402.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_21 = math.max(var_330_12, arg_327_1.talkMaxDuration)

			if var_330_11 <= arg_327_1.time_ and arg_327_1.time_ < var_330_11 + var_330_21 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_11) / var_330_21

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_11 + var_330_21 and arg_327_1.time_ < var_330_11 + var_330_21 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 1109402081
		arg_331_1.duration_ = 5

		SetActive(arg_331_1.tipsGo_, false)

		function arg_331_1.onSingleLineFinish_()
			arg_331_1.onSingleLineUpdate_ = nil
			arg_331_1.onSingleLineFinish_ = nil
			arg_331_1.state_ = "waiting"
		end

		function arg_331_1.playNext_(arg_333_0)
			if arg_333_0 == 1 then
				arg_331_0:Play1109402082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1094ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1094ui_story == nil then
				arg_331_1.var_.characterEffect1094ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.200000002980232

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1094ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1094ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1094ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1094ui_story.fillRatio = var_334_5
			end

			local var_334_6 = 0
			local var_334_7 = 0.8

			if var_334_6 < arg_331_1.time_ and arg_331_1.time_ <= var_334_6 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_8 = arg_331_1:FormatText(StoryNameCfg[7].name)

				arg_331_1.leftNameTxt_.text = var_334_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_9 = arg_331_1:GetWordFromCfg(1109402081)
				local var_334_10 = arg_331_1:FormatText(var_334_9.content)

				arg_331_1.text_.text = var_334_10

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_11 = 32
				local var_334_12 = utf8.len(var_334_10)
				local var_334_13 = var_334_11 <= 0 and var_334_7 or var_334_7 * (var_334_12 / var_334_11)

				if var_334_13 > 0 and var_334_7 < var_334_13 then
					arg_331_1.talkMaxDuration = var_334_13

					if var_334_13 + var_334_6 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_13 + var_334_6
					end
				end

				arg_331_1.text_.text = var_334_10
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)
				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_14 = math.max(var_334_7, arg_331_1.talkMaxDuration)

			if var_334_6 <= arg_331_1.time_ and arg_331_1.time_ < var_334_6 + var_334_14 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_6) / var_334_14

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_6 + var_334_14 and arg_331_1.time_ < var_334_6 + var_334_14 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 1109402082
		arg_335_1.duration_ = 5

		SetActive(arg_335_1.tipsGo_, false)

		function arg_335_1.onSingleLineFinish_()
			arg_335_1.onSingleLineUpdate_ = nil
			arg_335_1.onSingleLineFinish_ = nil
			arg_335_1.state_ = "waiting"
		end

		function arg_335_1.playNext_(arg_337_0)
			if arg_337_0 == 1 then
				arg_335_0:Play1109402083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = 0
			local var_338_1 = 0.225

			if var_338_0 < arg_335_1.time_ and arg_335_1.time_ <= var_338_0 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_2 = arg_335_1:FormatText(StoryNameCfg[7].name)

				arg_335_1.leftNameTxt_.text = var_338_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_3 = arg_335_1:GetWordFromCfg(1109402082)
				local var_338_4 = arg_335_1:FormatText(var_338_3.content)

				arg_335_1.text_.text = var_338_4

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_5 = 9
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
				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_8 = math.max(var_338_1, arg_335_1.talkMaxDuration)

			if var_338_0 <= arg_335_1.time_ and arg_335_1.time_ < var_338_0 + var_338_8 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_0) / var_338_8

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_0 + var_338_8 and arg_335_1.time_ < var_338_0 + var_338_8 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 1109402083
		arg_339_1.duration_ = 1.999999999999

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play1109402084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = arg_339_1.actors_["1094ui_story"].transform
			local var_342_1 = 0

			if var_342_1 < arg_339_1.time_ and arg_339_1.time_ <= var_342_1 + arg_342_0 then
				arg_339_1.var_.moveOldPos1094ui_story = var_342_0.localPosition
			end

			local var_342_2 = 0.001

			if var_342_1 <= arg_339_1.time_ and arg_339_1.time_ < var_342_1 + var_342_2 then
				local var_342_3 = (arg_339_1.time_ - var_342_1) / var_342_2
				local var_342_4 = Vector3.New(0, -0.84, -6.1)

				var_342_0.localPosition = Vector3.Lerp(arg_339_1.var_.moveOldPos1094ui_story, var_342_4, var_342_3)

				local var_342_5 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_5.x, var_342_5.y, var_342_5.z)

				local var_342_6 = var_342_0.localEulerAngles

				var_342_6.z = 0
				var_342_6.x = 0
				var_342_0.localEulerAngles = var_342_6
			end

			if arg_339_1.time_ >= var_342_1 + var_342_2 and arg_339_1.time_ < var_342_1 + var_342_2 + arg_342_0 then
				var_342_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_342_7 = manager.ui.mainCamera.transform.position - var_342_0.position

				var_342_0.forward = Vector3.New(var_342_7.x, var_342_7.y, var_342_7.z)

				local var_342_8 = var_342_0.localEulerAngles

				var_342_8.z = 0
				var_342_8.x = 0
				var_342_0.localEulerAngles = var_342_8
			end

			local var_342_9 = arg_339_1.actors_["1094ui_story"]
			local var_342_10 = 0

			if var_342_10 < arg_339_1.time_ and arg_339_1.time_ <= var_342_10 + arg_342_0 and arg_339_1.var_.characterEffect1094ui_story == nil then
				arg_339_1.var_.characterEffect1094ui_story = var_342_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_342_11 = 0.200000002980232

			if var_342_10 <= arg_339_1.time_ and arg_339_1.time_ < var_342_10 + var_342_11 then
				local var_342_12 = (arg_339_1.time_ - var_342_10) / var_342_11

				if arg_339_1.var_.characterEffect1094ui_story then
					arg_339_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_339_1.time_ >= var_342_10 + var_342_11 and arg_339_1.time_ < var_342_10 + var_342_11 + arg_342_0 and arg_339_1.var_.characterEffect1094ui_story then
				arg_339_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_342_13 = 0

			if var_342_13 < arg_339_1.time_ and arg_339_1.time_ <= var_342_13 + arg_342_0 then
				arg_339_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_2")
			end

			local var_342_14 = 0
			local var_342_15 = 0.1

			if var_342_14 < arg_339_1.time_ and arg_339_1.time_ <= var_342_14 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_16 = arg_339_1:FormatText(StoryNameCfg[434].name)

				arg_339_1.leftNameTxt_.text = var_342_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, true)
				arg_339_1.iconController_:SetSelectedState("hero")

				arg_339_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_17 = arg_339_1:GetWordFromCfg(1109402083)
				local var_342_18 = arg_339_1:FormatText(var_342_17.content)

				arg_339_1.text_.text = var_342_18

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_19 = 4
				local var_342_20 = utf8.len(var_342_18)
				local var_342_21 = var_342_19 <= 0 and var_342_15 or var_342_15 * (var_342_20 / var_342_19)

				if var_342_21 > 0 and var_342_15 < var_342_21 then
					arg_339_1.talkMaxDuration = var_342_21

					if var_342_21 + var_342_14 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_21 + var_342_14
					end
				end

				arg_339_1.text_.text = var_342_18
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402083", "story_v_side_new_1109402.awb") ~= 0 then
					local var_342_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402083", "story_v_side_new_1109402.awb") / 1000

					if var_342_22 + var_342_14 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_22 + var_342_14
					end

					if var_342_17.prefab_name ~= "" and arg_339_1.actors_[var_342_17.prefab_name] ~= nil then
						local var_342_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_17.prefab_name].transform, "story_v_side_new_1109402", "1109402083", "story_v_side_new_1109402.awb")

						arg_339_1:RecordAudio("1109402083", var_342_23)
						arg_339_1:RecordAudio("1109402083", var_342_23)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402083", "story_v_side_new_1109402.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402083", "story_v_side_new_1109402.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_24 = math.max(var_342_15, arg_339_1.talkMaxDuration)

			if var_342_14 <= arg_339_1.time_ and arg_339_1.time_ < var_342_14 + var_342_24 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_14) / var_342_24

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_14 + var_342_24 and arg_339_1.time_ < var_342_14 + var_342_24 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 1109402084
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play1109402085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1094ui_story"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.characterEffect1094ui_story == nil then
				arg_343_1.var_.characterEffect1094ui_story = var_346_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_346_2 = 0.200000002980232

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.characterEffect1094ui_story then
					local var_346_4 = Mathf.Lerp(0, 0.5, var_346_3)

					arg_343_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_343_1.var_.characterEffect1094ui_story.fillRatio = var_346_4
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.characterEffect1094ui_story then
				local var_346_5 = 0.5

				arg_343_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_343_1.var_.characterEffect1094ui_story.fillRatio = var_346_5
			end

			local var_346_6 = 0
			local var_346_7 = 0.25

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

				local var_346_8 = arg_343_1:GetWordFromCfg(1109402084)
				local var_346_9 = arg_343_1:FormatText(var_346_8.content)

				arg_343_1.text_.text = var_346_9

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_10 = 10
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
	Play1109402085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 1109402085
		arg_347_1.duration_ = 5

		SetActive(arg_347_1.tipsGo_, false)

		function arg_347_1.onSingleLineFinish_()
			arg_347_1.onSingleLineUpdate_ = nil
			arg_347_1.onSingleLineFinish_ = nil
			arg_347_1.state_ = "waiting"
		end

		function arg_347_1.playNext_(arg_349_0)
			if arg_349_0 == 1 then
				arg_347_0:Play1109402086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = 0
			local var_350_1 = 0.575

			if var_350_0 < arg_347_1.time_ and arg_347_1.time_ <= var_350_0 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_2 = arg_347_1:FormatText(StoryNameCfg[7].name)

				arg_347_1.leftNameTxt_.text = var_350_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_3 = arg_347_1:GetWordFromCfg(1109402085)
				local var_350_4 = arg_347_1:FormatText(var_350_3.content)

				arg_347_1.text_.text = var_350_4

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_5 = 23
				local var_350_6 = utf8.len(var_350_4)
				local var_350_7 = var_350_5 <= 0 and var_350_1 or var_350_1 * (var_350_6 / var_350_5)

				if var_350_7 > 0 and var_350_1 < var_350_7 then
					arg_347_1.talkMaxDuration = var_350_7

					if var_350_7 + var_350_0 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_7 + var_350_0
					end
				end

				arg_347_1.text_.text = var_350_4
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)
				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_8 = math.max(var_350_1, arg_347_1.talkMaxDuration)

			if var_350_0 <= arg_347_1.time_ and arg_347_1.time_ < var_350_0 + var_350_8 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_0) / var_350_8

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_0 + var_350_8 and arg_347_1.time_ < var_350_0 + var_350_8 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 1109402086
		arg_351_1.duration_ = 1.999999999999

		SetActive(arg_351_1.tipsGo_, false)

		function arg_351_1.onSingleLineFinish_()
			arg_351_1.onSingleLineUpdate_ = nil
			arg_351_1.onSingleLineFinish_ = nil
			arg_351_1.state_ = "waiting"
		end

		function arg_351_1.playNext_(arg_353_0)
			if arg_353_0 == 1 then
				arg_351_0:Play1109402087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1094ui_story"].transform
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 then
				arg_351_1.var_.moveOldPos1094ui_story = var_354_0.localPosition
			end

			local var_354_2 = 0.001

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2
				local var_354_4 = Vector3.New(0, -0.84, -6.1)

				var_354_0.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1094ui_story, var_354_4, var_354_3)

				local var_354_5 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_5.x, var_354_5.y, var_354_5.z)

				local var_354_6 = var_354_0.localEulerAngles

				var_354_6.z = 0
				var_354_6.x = 0
				var_354_0.localEulerAngles = var_354_6
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 then
				var_354_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_354_7 = manager.ui.mainCamera.transform.position - var_354_0.position

				var_354_0.forward = Vector3.New(var_354_7.x, var_354_7.y, var_354_7.z)

				local var_354_8 = var_354_0.localEulerAngles

				var_354_8.z = 0
				var_354_8.x = 0
				var_354_0.localEulerAngles = var_354_8
			end

			local var_354_9 = arg_351_1.actors_["1094ui_story"]
			local var_354_10 = 0

			if var_354_10 < arg_351_1.time_ and arg_351_1.time_ <= var_354_10 + arg_354_0 and arg_351_1.var_.characterEffect1094ui_story == nil then
				arg_351_1.var_.characterEffect1094ui_story = var_354_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_11 = 0.200000002980232

			if var_354_10 <= arg_351_1.time_ and arg_351_1.time_ < var_354_10 + var_354_11 then
				local var_354_12 = (arg_351_1.time_ - var_354_10) / var_354_11

				if arg_351_1.var_.characterEffect1094ui_story then
					arg_351_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_10 + var_354_11 and arg_351_1.time_ < var_354_10 + var_354_11 + arg_354_0 and arg_351_1.var_.characterEffect1094ui_story then
				arg_351_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_354_13 = 0

			if var_354_13 < arg_351_1.time_ and arg_351_1.time_ <= var_354_13 + arg_354_0 then
				arg_351_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_354_14 = 0

			if var_354_14 < arg_351_1.time_ and arg_351_1.time_ <= var_354_14 + arg_354_0 then
				arg_351_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action3_1")
			end

			local var_354_15 = 0
			local var_354_16 = 0.05

			if var_354_15 < arg_351_1.time_ and arg_351_1.time_ <= var_354_15 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_17 = arg_351_1:FormatText(StoryNameCfg[434].name)

				arg_351_1.leftNameTxt_.text = var_354_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_18 = arg_351_1:GetWordFromCfg(1109402086)
				local var_354_19 = arg_351_1:FormatText(var_354_18.content)

				arg_351_1.text_.text = var_354_19

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_20 = 2
				local var_354_21 = utf8.len(var_354_19)
				local var_354_22 = var_354_20 <= 0 and var_354_16 or var_354_16 * (var_354_21 / var_354_20)

				if var_354_22 > 0 and var_354_16 < var_354_22 then
					arg_351_1.talkMaxDuration = var_354_22

					if var_354_22 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_22 + var_354_15
					end
				end

				arg_351_1.text_.text = var_354_19
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402086", "story_v_side_new_1109402.awb") ~= 0 then
					local var_354_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402086", "story_v_side_new_1109402.awb") / 1000

					if var_354_23 + var_354_15 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_23 + var_354_15
					end

					if var_354_18.prefab_name ~= "" and arg_351_1.actors_[var_354_18.prefab_name] ~= nil then
						local var_354_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_18.prefab_name].transform, "story_v_side_new_1109402", "1109402086", "story_v_side_new_1109402.awb")

						arg_351_1:RecordAudio("1109402086", var_354_24)
						arg_351_1:RecordAudio("1109402086", var_354_24)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402086", "story_v_side_new_1109402.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402086", "story_v_side_new_1109402.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_25 = math.max(var_354_16, arg_351_1.talkMaxDuration)

			if var_354_15 <= arg_351_1.time_ and arg_351_1.time_ < var_354_15 + var_354_25 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_15) / var_354_25

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_15 + var_354_25 and arg_351_1.time_ < var_354_15 + var_354_25 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 1109402087
		arg_355_1.duration_ = 5

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play1109402088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1094ui_story"]
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 and arg_355_1.var_.characterEffect1094ui_story == nil then
				arg_355_1.var_.characterEffect1094ui_story = var_358_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_358_2 = 0.200000002980232

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2

				if arg_355_1.var_.characterEffect1094ui_story then
					local var_358_4 = Mathf.Lerp(0, 0.5, var_358_3)

					arg_355_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_355_1.var_.characterEffect1094ui_story.fillRatio = var_358_4
				end
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 and arg_355_1.var_.characterEffect1094ui_story then
				local var_358_5 = 0.5

				arg_355_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_355_1.var_.characterEffect1094ui_story.fillRatio = var_358_5
			end

			local var_358_6 = 0
			local var_358_7 = 0.275

			if var_358_6 < arg_355_1.time_ and arg_355_1.time_ <= var_358_6 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, false)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_8 = arg_355_1:GetWordFromCfg(1109402087)
				local var_358_9 = arg_355_1:FormatText(var_358_8.content)

				arg_355_1.text_.text = var_358_9

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_10 = 11
				local var_358_11 = utf8.len(var_358_9)
				local var_358_12 = var_358_10 <= 0 and var_358_7 or var_358_7 * (var_358_11 / var_358_10)

				if var_358_12 > 0 and var_358_7 < var_358_12 then
					arg_355_1.talkMaxDuration = var_358_12

					if var_358_12 + var_358_6 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_12 + var_358_6
					end
				end

				arg_355_1.text_.text = var_358_9
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)
				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_13 = math.max(var_358_7, arg_355_1.talkMaxDuration)

			if var_358_6 <= arg_355_1.time_ and arg_355_1.time_ < var_358_6 + var_358_13 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_6) / var_358_13

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_6 + var_358_13 and arg_355_1.time_ < var_358_6 + var_358_13 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 1109402088
		arg_359_1.duration_ = 5

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play1109402089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 0.275

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[7].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(1109402088)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 11
				local var_362_6 = utf8.len(var_362_4)
				local var_362_7 = var_362_5 <= 0 and var_362_1 or var_362_1 * (var_362_6 / var_362_5)

				if var_362_7 > 0 and var_362_1 < var_362_7 then
					arg_359_1.talkMaxDuration = var_362_7

					if var_362_7 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_7 + var_362_0
					end
				end

				arg_359_1.text_.text = var_362_4
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)
				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_8 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_8 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_8

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_8 and arg_359_1.time_ < var_362_0 + var_362_8 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 1109402089
		arg_363_1.duration_ = 2.6

		local var_363_0 = {
			ja = 2.6,
			ko = 1.999999999999,
			zh = 1.999999999999
		}
		local var_363_1 = manager.audio:GetLocalizationFlag()

		if var_363_0[var_363_1] ~= nil then
			arg_363_1.duration_ = var_363_0[var_363_1]
		end

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play1109402090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1094ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1094ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(0, -0.84, -6.1)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1094ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = arg_363_1.actors_["1094ui_story"]
			local var_366_10 = 0

			if var_366_10 < arg_363_1.time_ and arg_363_1.time_ <= var_366_10 + arg_366_0 and arg_363_1.var_.characterEffect1094ui_story == nil then
				arg_363_1.var_.characterEffect1094ui_story = var_366_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_366_11 = 0.200000002980232

			if var_366_10 <= arg_363_1.time_ and arg_363_1.time_ < var_366_10 + var_366_11 then
				local var_366_12 = (arg_363_1.time_ - var_366_10) / var_366_11

				if arg_363_1.var_.characterEffect1094ui_story then
					arg_363_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_363_1.time_ >= var_366_10 + var_366_11 and arg_363_1.time_ < var_366_10 + var_366_11 + arg_366_0 and arg_363_1.var_.characterEffect1094ui_story then
				arg_363_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_366_13 = 0

			if var_366_13 < arg_363_1.time_ and arg_363_1.time_ <= var_366_13 + arg_366_0 then
				arg_363_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_366_14 = 0
			local var_366_15 = 0.125

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_16 = arg_363_1:FormatText(StoryNameCfg[181].name)

				arg_363_1.leftNameTxt_.text = var_366_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_17 = arg_363_1:GetWordFromCfg(1109402089)
				local var_366_18 = arg_363_1:FormatText(var_366_17.content)

				arg_363_1.text_.text = var_366_18

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_19 = 5
				local var_366_20 = utf8.len(var_366_18)
				local var_366_21 = var_366_19 <= 0 and var_366_15 or var_366_15 * (var_366_20 / var_366_19)

				if var_366_21 > 0 and var_366_15 < var_366_21 then
					arg_363_1.talkMaxDuration = var_366_21

					if var_366_21 + var_366_14 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_21 + var_366_14
					end
				end

				arg_363_1.text_.text = var_366_18
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402089", "story_v_side_new_1109402.awb") ~= 0 then
					local var_366_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402089", "story_v_side_new_1109402.awb") / 1000

					if var_366_22 + var_366_14 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_22 + var_366_14
					end

					if var_366_17.prefab_name ~= "" and arg_363_1.actors_[var_366_17.prefab_name] ~= nil then
						local var_366_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_17.prefab_name].transform, "story_v_side_new_1109402", "1109402089", "story_v_side_new_1109402.awb")

						arg_363_1:RecordAudio("1109402089", var_366_23)
						arg_363_1:RecordAudio("1109402089", var_366_23)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402089", "story_v_side_new_1109402.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402089", "story_v_side_new_1109402.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_24 = math.max(var_366_15, arg_363_1.talkMaxDuration)

			if var_366_14 <= arg_363_1.time_ and arg_363_1.time_ < var_366_14 + var_366_24 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_14) / var_366_24

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_14 + var_366_24 and arg_363_1.time_ < var_366_14 + var_366_24 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 1109402090
		arg_367_1.duration_ = 5

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play1109402091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["1094ui_story"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.characterEffect1094ui_story == nil then
				arg_367_1.var_.characterEffect1094ui_story = var_370_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_370_2 = 0.200000002980232

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.characterEffect1094ui_story then
					local var_370_4 = Mathf.Lerp(0, 0.5, var_370_3)

					arg_367_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_367_1.var_.characterEffect1094ui_story.fillRatio = var_370_4
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.characterEffect1094ui_story then
				local var_370_5 = 0.5

				arg_367_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_367_1.var_.characterEffect1094ui_story.fillRatio = var_370_5
			end

			local var_370_6 = 0
			local var_370_7 = 0.6

			if var_370_6 < arg_367_1.time_ and arg_367_1.time_ <= var_370_6 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_8 = arg_367_1:FormatText(StoryNameCfg[7].name)

				arg_367_1.leftNameTxt_.text = var_370_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_9 = arg_367_1:GetWordFromCfg(1109402090)
				local var_370_10 = arg_367_1:FormatText(var_370_9.content)

				arg_367_1.text_.text = var_370_10

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_11 = 24
				local var_370_12 = utf8.len(var_370_10)
				local var_370_13 = var_370_11 <= 0 and var_370_7 or var_370_7 * (var_370_12 / var_370_11)

				if var_370_13 > 0 and var_370_7 < var_370_13 then
					arg_367_1.talkMaxDuration = var_370_13

					if var_370_13 + var_370_6 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_13 + var_370_6
					end
				end

				arg_367_1.text_.text = var_370_10
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_14 = math.max(var_370_7, arg_367_1.talkMaxDuration)

			if var_370_6 <= arg_367_1.time_ and arg_367_1.time_ < var_370_6 + var_370_14 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_6) / var_370_14

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_6 + var_370_14 and arg_367_1.time_ < var_370_6 + var_370_14 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 1109402091
		arg_371_1.duration_ = 1.566

		local var_371_0 = {
			ja = 1.266,
			ko = 1.566,
			zh = 1.566
		}
		local var_371_1 = manager.audio:GetLocalizationFlag()

		if var_371_0[var_371_1] ~= nil then
			arg_371_1.duration_ = var_371_0[var_371_1]
		end

		SetActive(arg_371_1.tipsGo_, false)

		function arg_371_1.onSingleLineFinish_()
			arg_371_1.onSingleLineUpdate_ = nil
			arg_371_1.onSingleLineFinish_ = nil
			arg_371_1.state_ = "waiting"
		end

		function arg_371_1.playNext_(arg_373_0)
			if arg_373_0 == 1 then
				arg_371_0:Play1109402092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = 0
			local var_374_1 = 0.05

			if var_374_0 < arg_371_1.time_ and arg_371_1.time_ <= var_374_0 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_2 = arg_371_1:FormatText(StoryNameCfg[189].name)

				arg_371_1.leftNameTxt_.text = var_374_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, true)
				arg_371_1.iconController_:SetSelectedState("hero")

				arg_371_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_3 = arg_371_1:GetWordFromCfg(1109402091)
				local var_374_4 = arg_371_1:FormatText(var_374_3.content)

				arg_371_1.text_.text = var_374_4

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_5 = 2
				local var_374_6 = utf8.len(var_374_4)
				local var_374_7 = var_374_5 <= 0 and var_374_1 or var_374_1 * (var_374_6 / var_374_5)

				if var_374_7 > 0 and var_374_1 < var_374_7 then
					arg_371_1.talkMaxDuration = var_374_7

					if var_374_7 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_7 + var_374_0
					end
				end

				arg_371_1.text_.text = var_374_4
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402091", "story_v_side_new_1109402.awb") ~= 0 then
					local var_374_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402091", "story_v_side_new_1109402.awb") / 1000

					if var_374_8 + var_374_0 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_8 + var_374_0
					end

					if var_374_3.prefab_name ~= "" and arg_371_1.actors_[var_374_3.prefab_name] ~= nil then
						local var_374_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_3.prefab_name].transform, "story_v_side_new_1109402", "1109402091", "story_v_side_new_1109402.awb")

						arg_371_1:RecordAudio("1109402091", var_374_9)
						arg_371_1:RecordAudio("1109402091", var_374_9)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402091", "story_v_side_new_1109402.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402091", "story_v_side_new_1109402.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_10 = math.max(var_374_1, arg_371_1.talkMaxDuration)

			if var_374_0 <= arg_371_1.time_ and arg_371_1.time_ < var_374_0 + var_374_10 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_0) / var_374_10

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_0 + var_374_10 and arg_371_1.time_ < var_374_0 + var_374_10 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 1109402092
		arg_375_1.duration_ = 5.999999999999

		SetActive(arg_375_1.tipsGo_, false)

		function arg_375_1.onSingleLineFinish_()
			arg_375_1.onSingleLineUpdate_ = nil
			arg_375_1.onSingleLineFinish_ = nil
			arg_375_1.state_ = "waiting"
		end

		function arg_375_1.playNext_(arg_377_0)
			if arg_377_0 == 1 then
				arg_375_0:Play1109402093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = 2

			if var_378_0 < arg_375_1.time_ and arg_375_1.time_ <= var_378_0 + arg_378_0 then
				local var_378_1 = manager.ui.mainCamera.transform.localPosition
				local var_378_2 = Vector3.New(0, 0, 10) + Vector3.New(var_378_1.x, var_378_1.y, 0)
				local var_378_3 = arg_375_1.bgs_.I05d

				var_378_3.transform.localPosition = var_378_2
				var_378_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_378_4 = var_378_3:GetComponent("SpriteRenderer")

				if var_378_4 and var_378_4.sprite then
					local var_378_5 = (var_378_3.transform.localPosition - var_378_1).z
					local var_378_6 = manager.ui.mainCameraCom_
					local var_378_7 = 2 * var_378_5 * Mathf.Tan(var_378_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_378_8 = var_378_7 * var_378_6.aspect
					local var_378_9 = var_378_4.sprite.bounds.size.x
					local var_378_10 = var_378_4.sprite.bounds.size.y
					local var_378_11 = var_378_8 / var_378_9
					local var_378_12 = var_378_7 / var_378_10
					local var_378_13 = var_378_12 < var_378_11 and var_378_11 or var_378_12

					var_378_3.transform.localScale = Vector3.New(var_378_13, var_378_13, 0)
				end

				for iter_378_0, iter_378_1 in pairs(arg_375_1.bgs_) do
					if iter_378_0 ~= "I05d" then
						iter_378_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 then
				arg_375_1.mask_.enabled = true
				arg_375_1.mask_.raycastTarget = true

				arg_375_1:SetGaussion(false)
			end

			local var_378_15 = 2

			if var_378_14 <= arg_375_1.time_ and arg_375_1.time_ < var_378_14 + var_378_15 then
				local var_378_16 = (arg_375_1.time_ - var_378_14) / var_378_15
				local var_378_17 = Color.New(0, 0, 0)

				var_378_17.a = Mathf.Lerp(0, 1, var_378_16)
				arg_375_1.mask_.color = var_378_17
			end

			if arg_375_1.time_ >= var_378_14 + var_378_15 and arg_375_1.time_ < var_378_14 + var_378_15 + arg_378_0 then
				local var_378_18 = Color.New(0, 0, 0)

				var_378_18.a = 1
				arg_375_1.mask_.color = var_378_18
			end

			local var_378_19 = 2

			if var_378_19 < arg_375_1.time_ and arg_375_1.time_ <= var_378_19 + arg_378_0 then
				arg_375_1.mask_.enabled = true
				arg_375_1.mask_.raycastTarget = true

				arg_375_1:SetGaussion(false)
			end

			local var_378_20 = 2

			if var_378_19 <= arg_375_1.time_ and arg_375_1.time_ < var_378_19 + var_378_20 then
				local var_378_21 = (arg_375_1.time_ - var_378_19) / var_378_20
				local var_378_22 = Color.New(0, 0, 0)

				var_378_22.a = Mathf.Lerp(1, 0, var_378_21)
				arg_375_1.mask_.color = var_378_22
			end

			if arg_375_1.time_ >= var_378_19 + var_378_20 and arg_375_1.time_ < var_378_19 + var_378_20 + arg_378_0 then
				local var_378_23 = Color.New(0, 0, 0)
				local var_378_24 = 0

				arg_375_1.mask_.enabled = false
				var_378_23.a = var_378_24
				arg_375_1.mask_.color = var_378_23
			end

			local var_378_25 = arg_375_1.actors_["1094ui_story"].transform
			local var_378_26 = 4

			if var_378_26 < arg_375_1.time_ and arg_375_1.time_ <= var_378_26 + arg_378_0 then
				arg_375_1.var_.moveOldPos1094ui_story = var_378_25.localPosition
			end

			local var_378_27 = 0.001

			if var_378_26 <= arg_375_1.time_ and arg_375_1.time_ < var_378_26 + var_378_27 then
				local var_378_28 = (arg_375_1.time_ - var_378_26) / var_378_27
				local var_378_29 = Vector3.New(0, -0.84, -6.1)

				var_378_25.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1094ui_story, var_378_29, var_378_28)

				local var_378_30 = manager.ui.mainCamera.transform.position - var_378_25.position

				var_378_25.forward = Vector3.New(var_378_30.x, var_378_30.y, var_378_30.z)

				local var_378_31 = var_378_25.localEulerAngles

				var_378_31.z = 0
				var_378_31.x = 0
				var_378_25.localEulerAngles = var_378_31
			end

			if arg_375_1.time_ >= var_378_26 + var_378_27 and arg_375_1.time_ < var_378_26 + var_378_27 + arg_378_0 then
				var_378_25.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_378_32 = manager.ui.mainCamera.transform.position - var_378_25.position

				var_378_25.forward = Vector3.New(var_378_32.x, var_378_32.y, var_378_32.z)

				local var_378_33 = var_378_25.localEulerAngles

				var_378_33.z = 0
				var_378_33.x = 0
				var_378_25.localEulerAngles = var_378_33
			end

			local var_378_34 = arg_375_1.actors_["1094ui_story"]
			local var_378_35 = 4

			if var_378_35 < arg_375_1.time_ and arg_375_1.time_ <= var_378_35 + arg_378_0 and arg_375_1.var_.characterEffect1094ui_story == nil then
				arg_375_1.var_.characterEffect1094ui_story = var_378_34:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_378_36 = 0.200000002980232

			if var_378_35 <= arg_375_1.time_ and arg_375_1.time_ < var_378_35 + var_378_36 then
				local var_378_37 = (arg_375_1.time_ - var_378_35) / var_378_36

				if arg_375_1.var_.characterEffect1094ui_story then
					arg_375_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_375_1.time_ >= var_378_35 + var_378_36 and arg_375_1.time_ < var_378_35 + var_378_36 + arg_378_0 and arg_375_1.var_.characterEffect1094ui_story then
				arg_375_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_378_38 = 4

			if var_378_38 < arg_375_1.time_ and arg_375_1.time_ <= var_378_38 + arg_378_0 then
				arg_375_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_378_39 = 4

			if var_378_39 < arg_375_1.time_ and arg_375_1.time_ <= var_378_39 + arg_378_0 then
				arg_375_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_378_40 = arg_375_1.actors_["1094ui_story"].transform
			local var_378_41 = 0

			if var_378_41 < arg_375_1.time_ and arg_375_1.time_ <= var_378_41 + arg_378_0 then
				arg_375_1.var_.moveOldPos1094ui_story = var_378_40.localPosition
			end

			local var_378_42 = 0.001

			if var_378_41 <= arg_375_1.time_ and arg_375_1.time_ < var_378_41 + var_378_42 then
				local var_378_43 = (arg_375_1.time_ - var_378_41) / var_378_42
				local var_378_44 = Vector3.New(0, 100, 0)

				var_378_40.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos1094ui_story, var_378_44, var_378_43)

				local var_378_45 = manager.ui.mainCamera.transform.position - var_378_40.position

				var_378_40.forward = Vector3.New(var_378_45.x, var_378_45.y, var_378_45.z)

				local var_378_46 = var_378_40.localEulerAngles

				var_378_46.z = 0
				var_378_46.x = 0
				var_378_40.localEulerAngles = var_378_46
			end

			if arg_375_1.time_ >= var_378_41 + var_378_42 and arg_375_1.time_ < var_378_41 + var_378_42 + arg_378_0 then
				var_378_40.localPosition = Vector3.New(0, 100, 0)

				local var_378_47 = manager.ui.mainCamera.transform.position - var_378_40.position

				var_378_40.forward = Vector3.New(var_378_47.x, var_378_47.y, var_378_47.z)

				local var_378_48 = var_378_40.localEulerAngles

				var_378_48.z = 0
				var_378_48.x = 0
				var_378_40.localEulerAngles = var_378_48
			end

			if arg_375_1.frameCnt_ <= 1 then
				arg_375_1.dialog_:SetActive(false)
			end

			local var_378_49 = 4
			local var_378_50 = 0.125

			if var_378_49 < arg_375_1.time_ and arg_375_1.time_ <= var_378_49 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0

				arg_375_1.dialog_:SetActive(true)

				local var_378_51 = LeanTween.value(arg_375_1.dialog_, 0, 1, 0.3)

				var_378_51:setOnUpdate(LuaHelper.FloatAction(function(arg_379_0)
					arg_375_1.dialogCg_.alpha = arg_379_0
				end))
				var_378_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_375_1.dialog_)
					var_378_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_375_1.duration_ = arg_375_1.duration_ + 0.3

				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_52 = arg_375_1:FormatText(StoryNameCfg[181].name)

				arg_375_1.leftNameTxt_.text = var_378_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_53 = arg_375_1:GetWordFromCfg(1109402092)
				local var_378_54 = arg_375_1:FormatText(var_378_53.content)

				arg_375_1.text_.text = var_378_54

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_55 = 5
				local var_378_56 = utf8.len(var_378_54)
				local var_378_57 = var_378_55 <= 0 and var_378_50 or var_378_50 * (var_378_56 / var_378_55)

				if var_378_57 > 0 and var_378_50 < var_378_57 then
					arg_375_1.talkMaxDuration = var_378_57
					var_378_49 = var_378_49 + 0.3

					if var_378_57 + var_378_49 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_57 + var_378_49
					end
				end

				arg_375_1.text_.text = var_378_54
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402092", "story_v_side_new_1109402.awb") ~= 0 then
					local var_378_58 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402092", "story_v_side_new_1109402.awb") / 1000

					if var_378_58 + var_378_49 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_58 + var_378_49
					end

					if var_378_53.prefab_name ~= "" and arg_375_1.actors_[var_378_53.prefab_name] ~= nil then
						local var_378_59 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_53.prefab_name].transform, "story_v_side_new_1109402", "1109402092", "story_v_side_new_1109402.awb")

						arg_375_1:RecordAudio("1109402092", var_378_59)
						arg_375_1:RecordAudio("1109402092", var_378_59)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402092", "story_v_side_new_1109402.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402092", "story_v_side_new_1109402.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_60 = var_378_49 + 0.3
			local var_378_61 = math.max(var_378_50, arg_375_1.talkMaxDuration)

			if var_378_60 <= arg_375_1.time_ and arg_375_1.time_ < var_378_60 + var_378_61 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_60) / var_378_61

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_60 + var_378_61 and arg_375_1.time_ < var_378_60 + var_378_61 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 1109402093
		arg_381_1.duration_ = 5

		SetActive(arg_381_1.tipsGo_, false)

		function arg_381_1.onSingleLineFinish_()
			arg_381_1.onSingleLineUpdate_ = nil
			arg_381_1.onSingleLineFinish_ = nil
			arg_381_1.state_ = "waiting"
		end

		function arg_381_1.playNext_(arg_383_0)
			if arg_383_0 == 1 then
				arg_381_0:Play1109402094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = arg_381_1.actors_["1094ui_story"]
			local var_384_1 = 0

			if var_384_1 < arg_381_1.time_ and arg_381_1.time_ <= var_384_1 + arg_384_0 and arg_381_1.var_.characterEffect1094ui_story == nil then
				arg_381_1.var_.characterEffect1094ui_story = var_384_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_384_2 = 0.200000002980232

			if var_384_1 <= arg_381_1.time_ and arg_381_1.time_ < var_384_1 + var_384_2 then
				local var_384_3 = (arg_381_1.time_ - var_384_1) / var_384_2

				if arg_381_1.var_.characterEffect1094ui_story then
					local var_384_4 = Mathf.Lerp(0, 0.5, var_384_3)

					arg_381_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_381_1.var_.characterEffect1094ui_story.fillRatio = var_384_4
				end
			end

			if arg_381_1.time_ >= var_384_1 + var_384_2 and arg_381_1.time_ < var_384_1 + var_384_2 + arg_384_0 and arg_381_1.var_.characterEffect1094ui_story then
				local var_384_5 = 0.5

				arg_381_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_381_1.var_.characterEffect1094ui_story.fillRatio = var_384_5
			end

			local var_384_6 = 0
			local var_384_7 = 0.65

			if var_384_6 < arg_381_1.time_ and arg_381_1.time_ <= var_384_6 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_8 = arg_381_1:FormatText(StoryNameCfg[7].name)

				arg_381_1.leftNameTxt_.text = var_384_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, false)
				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_9 = arg_381_1:GetWordFromCfg(1109402093)
				local var_384_10 = arg_381_1:FormatText(var_384_9.content)

				arg_381_1.text_.text = var_384_10

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_11 = 26
				local var_384_12 = utf8.len(var_384_10)
				local var_384_13 = var_384_11 <= 0 and var_384_7 or var_384_7 * (var_384_12 / var_384_11)

				if var_384_13 > 0 and var_384_7 < var_384_13 then
					arg_381_1.talkMaxDuration = var_384_13

					if var_384_13 + var_384_6 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_13 + var_384_6
					end
				end

				arg_381_1.text_.text = var_384_10
				arg_381_1.typewritter.percent = 0

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(false)
				arg_381_1:RecordContent(arg_381_1.text_.text)
			end

			local var_384_14 = math.max(var_384_7, arg_381_1.talkMaxDuration)

			if var_384_6 <= arg_381_1.time_ and arg_381_1.time_ < var_384_6 + var_384_14 then
				arg_381_1.typewritter.percent = (arg_381_1.time_ - var_384_6) / var_384_14

				arg_381_1.typewritter:SetDirty()
			end

			if arg_381_1.time_ >= var_384_6 + var_384_14 and arg_381_1.time_ < var_384_6 + var_384_14 + arg_384_0 then
				arg_381_1.typewritter.percent = 1

				arg_381_1.typewritter:SetDirty()
				arg_381_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 1109402094
		arg_385_1.duration_ = 4.6

		local var_385_0 = {
			ja = 1.999999999999,
			ko = 4.6,
			zh = 4.6
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
				arg_385_0:Play1109402095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = arg_385_1.actors_["1094ui_story"].transform
			local var_388_1 = 0

			if var_388_1 < arg_385_1.time_ and arg_385_1.time_ <= var_388_1 + arg_388_0 then
				arg_385_1.var_.moveOldPos1094ui_story = var_388_0.localPosition
			end

			local var_388_2 = 0.001

			if var_388_1 <= arg_385_1.time_ and arg_385_1.time_ < var_388_1 + var_388_2 then
				local var_388_3 = (arg_385_1.time_ - var_388_1) / var_388_2
				local var_388_4 = Vector3.New(0, -0.84, -6.1)

				var_388_0.localPosition = Vector3.Lerp(arg_385_1.var_.moveOldPos1094ui_story, var_388_4, var_388_3)

				local var_388_5 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_5.x, var_388_5.y, var_388_5.z)

				local var_388_6 = var_388_0.localEulerAngles

				var_388_6.z = 0
				var_388_6.x = 0
				var_388_0.localEulerAngles = var_388_6
			end

			if arg_385_1.time_ >= var_388_1 + var_388_2 and arg_385_1.time_ < var_388_1 + var_388_2 + arg_388_0 then
				var_388_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_388_7 = manager.ui.mainCamera.transform.position - var_388_0.position

				var_388_0.forward = Vector3.New(var_388_7.x, var_388_7.y, var_388_7.z)

				local var_388_8 = var_388_0.localEulerAngles

				var_388_8.z = 0
				var_388_8.x = 0
				var_388_0.localEulerAngles = var_388_8
			end

			local var_388_9 = arg_385_1.actors_["1094ui_story"]
			local var_388_10 = 0

			if var_388_10 < arg_385_1.time_ and arg_385_1.time_ <= var_388_10 + arg_388_0 and arg_385_1.var_.characterEffect1094ui_story == nil then
				arg_385_1.var_.characterEffect1094ui_story = var_388_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_388_11 = 0.200000002980232

			if var_388_10 <= arg_385_1.time_ and arg_385_1.time_ < var_388_10 + var_388_11 then
				local var_388_12 = (arg_385_1.time_ - var_388_10) / var_388_11

				if arg_385_1.var_.characterEffect1094ui_story then
					arg_385_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_385_1.time_ >= var_388_10 + var_388_11 and arg_385_1.time_ < var_388_10 + var_388_11 + arg_388_0 and arg_385_1.var_.characterEffect1094ui_story then
				arg_385_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_388_13 = 0

			if var_388_13 < arg_385_1.time_ and arg_385_1.time_ <= var_388_13 + arg_388_0 then
				arg_385_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action4_1")
			end

			local var_388_14 = 0

			if var_388_14 < arg_385_1.time_ and arg_385_1.time_ <= var_388_14 + arg_388_0 then
				arg_385_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_388_15 = 0
			local var_388_16 = 0.225

			if var_388_15 < arg_385_1.time_ and arg_385_1.time_ <= var_388_15 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, true)

				local var_388_17 = arg_385_1:FormatText(StoryNameCfg[181].name)

				arg_385_1.leftNameTxt_.text = var_388_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_385_1.leftNameTxt_.transform)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1.leftNameTxt_.text)
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_18 = arg_385_1:GetWordFromCfg(1109402094)
				local var_388_19 = arg_385_1:FormatText(var_388_18.content)

				arg_385_1.text_.text = var_388_19

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_20 = 9
				local var_388_21 = utf8.len(var_388_19)
				local var_388_22 = var_388_20 <= 0 and var_388_16 or var_388_16 * (var_388_21 / var_388_20)

				if var_388_22 > 0 and var_388_16 < var_388_22 then
					arg_385_1.talkMaxDuration = var_388_22

					if var_388_22 + var_388_15 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_22 + var_388_15
					end
				end

				arg_385_1.text_.text = var_388_19
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402094", "story_v_side_new_1109402.awb") ~= 0 then
					local var_388_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402094", "story_v_side_new_1109402.awb") / 1000

					if var_388_23 + var_388_15 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_23 + var_388_15
					end

					if var_388_18.prefab_name ~= "" and arg_385_1.actors_[var_388_18.prefab_name] ~= nil then
						local var_388_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_385_1.actors_[var_388_18.prefab_name].transform, "story_v_side_new_1109402", "1109402094", "story_v_side_new_1109402.awb")

						arg_385_1:RecordAudio("1109402094", var_388_24)
						arg_385_1:RecordAudio("1109402094", var_388_24)
					else
						arg_385_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402094", "story_v_side_new_1109402.awb")
					end

					arg_385_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402094", "story_v_side_new_1109402.awb")
				end

				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_25 = math.max(var_388_16, arg_385_1.talkMaxDuration)

			if var_388_15 <= arg_385_1.time_ and arg_385_1.time_ < var_388_15 + var_388_25 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_15) / var_388_25

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_15 + var_388_25 and arg_385_1.time_ < var_388_15 + var_388_25 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 1109402095
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play1109402096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = arg_389_1.actors_["1094ui_story"]
			local var_392_1 = 0

			if var_392_1 < arg_389_1.time_ and arg_389_1.time_ <= var_392_1 + arg_392_0 and arg_389_1.var_.characterEffect1094ui_story == nil then
				arg_389_1.var_.characterEffect1094ui_story = var_392_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_392_2 = 0.200000002980232

			if var_392_1 <= arg_389_1.time_ and arg_389_1.time_ < var_392_1 + var_392_2 then
				local var_392_3 = (arg_389_1.time_ - var_392_1) / var_392_2

				if arg_389_1.var_.characterEffect1094ui_story then
					local var_392_4 = Mathf.Lerp(0, 0.5, var_392_3)

					arg_389_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_389_1.var_.characterEffect1094ui_story.fillRatio = var_392_4
				end
			end

			if arg_389_1.time_ >= var_392_1 + var_392_2 and arg_389_1.time_ < var_392_1 + var_392_2 + arg_392_0 and arg_389_1.var_.characterEffect1094ui_story then
				local var_392_5 = 0.5

				arg_389_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_389_1.var_.characterEffect1094ui_story.fillRatio = var_392_5
			end

			local var_392_6 = 0
			local var_392_7 = 0.55

			if var_392_6 < arg_389_1.time_ and arg_389_1.time_ <= var_392_6 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, true)

				local var_392_8 = arg_389_1:FormatText(StoryNameCfg[7].name)

				arg_389_1.leftNameTxt_.text = var_392_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_389_1.leftNameTxt_.transform)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1.leftNameTxt_.text)
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_9 = arg_389_1:GetWordFromCfg(1109402095)
				local var_392_10 = arg_389_1:FormatText(var_392_9.content)

				arg_389_1.text_.text = var_392_10

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_11 = 22
				local var_392_12 = utf8.len(var_392_10)
				local var_392_13 = var_392_11 <= 0 and var_392_7 or var_392_7 * (var_392_12 / var_392_11)

				if var_392_13 > 0 and var_392_7 < var_392_13 then
					arg_389_1.talkMaxDuration = var_392_13

					if var_392_13 + var_392_6 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_13 + var_392_6
					end
				end

				arg_389_1.text_.text = var_392_10
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_14 = math.max(var_392_7, arg_389_1.talkMaxDuration)

			if var_392_6 <= arg_389_1.time_ and arg_389_1.time_ < var_392_6 + var_392_14 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_6) / var_392_14

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_6 + var_392_14 and arg_389_1.time_ < var_392_6 + var_392_14 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 1109402096
		arg_393_1.duration_ = 3.6

		local var_393_0 = {
			ja = 3.6,
			ko = 3,
			zh = 3
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
				arg_393_0:Play1109402097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0
			local var_396_1 = 0.325

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, true)

				local var_396_2 = arg_393_1:FormatText(StoryNameCfg[189].name)

				arg_393_1.leftNameTxt_.text = var_396_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_393_1.leftNameTxt_.transform)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1.leftNameTxt_.text)
				SetActive(arg_393_1.iconTrs_.gameObject, true)
				arg_393_1.iconController_:SetSelectedState("hero")

				arg_393_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_3 = arg_393_1:GetWordFromCfg(1109402096)
				local var_396_4 = arg_393_1:FormatText(var_396_3.content)

				arg_393_1.text_.text = var_396_4

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402096", "story_v_side_new_1109402.awb") ~= 0 then
					local var_396_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402096", "story_v_side_new_1109402.awb") / 1000

					if var_396_8 + var_396_0 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_8 + var_396_0
					end

					if var_396_3.prefab_name ~= "" and arg_393_1.actors_[var_396_3.prefab_name] ~= nil then
						local var_396_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_393_1.actors_[var_396_3.prefab_name].transform, "story_v_side_new_1109402", "1109402096", "story_v_side_new_1109402.awb")

						arg_393_1:RecordAudio("1109402096", var_396_9)
						arg_393_1:RecordAudio("1109402096", var_396_9)
					else
						arg_393_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402096", "story_v_side_new_1109402.awb")
					end

					arg_393_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402096", "story_v_side_new_1109402.awb")
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
	Play1109402097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 1109402097
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play1109402098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 0.575

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, true)

				local var_400_2 = arg_397_1:FormatText(StoryNameCfg[7].name)

				arg_397_1.leftNameTxt_.text = var_400_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_397_1.leftNameTxt_.transform)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1.leftNameTxt_.text)
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_3 = arg_397_1:GetWordFromCfg(1109402097)
				local var_400_4 = arg_397_1:FormatText(var_400_3.content)

				arg_397_1.text_.text = var_400_4

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_5 = 23
				local var_400_6 = utf8.len(var_400_4)
				local var_400_7 = var_400_5 <= 0 and var_400_1 or var_400_1 * (var_400_6 / var_400_5)

				if var_400_7 > 0 and var_400_1 < var_400_7 then
					arg_397_1.talkMaxDuration = var_400_7

					if var_400_7 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_7 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_4
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_8 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_8 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_8

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_8 and arg_397_1.time_ < var_400_0 + var_400_8 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 1109402098
		arg_401_1.duration_ = 3.433

		local var_401_0 = {
			ja = 1.999999999999,
			ko = 3.433,
			zh = 3.433
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
				arg_401_0:Play1109402099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1094ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1094ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(0, -0.84, -6.1)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1094ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = arg_401_1.actors_["1094ui_story"]
			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 and arg_401_1.var_.characterEffect1094ui_story == nil then
				arg_401_1.var_.characterEffect1094ui_story = var_404_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_11 = 0.200000002980232

			if var_404_10 <= arg_401_1.time_ and arg_401_1.time_ < var_404_10 + var_404_11 then
				local var_404_12 = (arg_401_1.time_ - var_404_10) / var_404_11

				if arg_401_1.var_.characterEffect1094ui_story then
					arg_401_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_10 + var_404_11 and arg_401_1.time_ < var_404_10 + var_404_11 + arg_404_0 and arg_401_1.var_.characterEffect1094ui_story then
				arg_401_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_404_13 = 0

			if var_404_13 < arg_401_1.time_ and arg_401_1.time_ <= var_404_13 + arg_404_0 then
				arg_401_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action4_2")
			end

			local var_404_14 = 0

			if var_404_14 < arg_401_1.time_ and arg_401_1.time_ <= var_404_14 + arg_404_0 then
				arg_401_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_404_15 = 0
			local var_404_16 = 0.25

			if var_404_15 < arg_401_1.time_ and arg_401_1.time_ <= var_404_15 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_17 = arg_401_1:FormatText(StoryNameCfg[181].name)

				arg_401_1.leftNameTxt_.text = var_404_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_18 = arg_401_1:GetWordFromCfg(1109402098)
				local var_404_19 = arg_401_1:FormatText(var_404_18.content)

				arg_401_1.text_.text = var_404_19

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_20 = 10
				local var_404_21 = utf8.len(var_404_19)
				local var_404_22 = var_404_20 <= 0 and var_404_16 or var_404_16 * (var_404_21 / var_404_20)

				if var_404_22 > 0 and var_404_16 < var_404_22 then
					arg_401_1.talkMaxDuration = var_404_22

					if var_404_22 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_22 + var_404_15
					end
				end

				arg_401_1.text_.text = var_404_19
				arg_401_1.typewritter.percent = 0

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402098", "story_v_side_new_1109402.awb") ~= 0 then
					local var_404_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402098", "story_v_side_new_1109402.awb") / 1000

					if var_404_23 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_23 + var_404_15
					end

					if var_404_18.prefab_name ~= "" and arg_401_1.actors_[var_404_18.prefab_name] ~= nil then
						local var_404_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_18.prefab_name].transform, "story_v_side_new_1109402", "1109402098", "story_v_side_new_1109402.awb")

						arg_401_1:RecordAudio("1109402098", var_404_24)
						arg_401_1:RecordAudio("1109402098", var_404_24)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402098", "story_v_side_new_1109402.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402098", "story_v_side_new_1109402.awb")
				end

				arg_401_1:RecordContent(arg_401_1.text_.text)
			end

			local var_404_25 = math.max(var_404_16, arg_401_1.talkMaxDuration)

			if var_404_15 <= arg_401_1.time_ and arg_401_1.time_ < var_404_15 + var_404_25 then
				arg_401_1.typewritter.percent = (arg_401_1.time_ - var_404_15) / var_404_25

				arg_401_1.typewritter:SetDirty()
			end

			if arg_401_1.time_ >= var_404_15 + var_404_25 and arg_401_1.time_ < var_404_15 + var_404_25 + arg_404_0 then
				arg_401_1.typewritter.percent = 1

				arg_401_1.typewritter:SetDirty()
				arg_401_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 1109402099
		arg_405_1.duration_ = 11.566

		local var_405_0 = {
			ja = 11.566,
			ko = 5.866,
			zh = 5.866
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
				arg_405_0:Play1109402100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1094ui_story"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.characterEffect1094ui_story == nil then
				arg_405_1.var_.characterEffect1094ui_story = var_408_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_2 = 0.200000002980232

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.characterEffect1094ui_story then
					local var_408_4 = Mathf.Lerp(0, 0.5, var_408_3)

					arg_405_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_405_1.var_.characterEffect1094ui_story.fillRatio = var_408_4
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1094ui_story then
				local var_408_5 = 0.5

				arg_405_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_405_1.var_.characterEffect1094ui_story.fillRatio = var_408_5
			end

			local var_408_6 = 0
			local var_408_7 = 0.65

			if var_408_6 < arg_405_1.time_ and arg_405_1.time_ <= var_408_6 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, true)

				local var_408_8 = arg_405_1:FormatText(StoryNameCfg[189].name)

				arg_405_1.leftNameTxt_.text = var_408_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_405_1.leftNameTxt_.transform)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1.leftNameTxt_.text)
				SetActive(arg_405_1.iconTrs_.gameObject, true)
				arg_405_1.iconController_:SetSelectedState("hero")

				arg_405_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_9 = arg_405_1:GetWordFromCfg(1109402099)
				local var_408_10 = arg_405_1:FormatText(var_408_9.content)

				arg_405_1.text_.text = var_408_10

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_11 = 26
				local var_408_12 = utf8.len(var_408_10)
				local var_408_13 = var_408_11 <= 0 and var_408_7 or var_408_7 * (var_408_12 / var_408_11)

				if var_408_13 > 0 and var_408_7 < var_408_13 then
					arg_405_1.talkMaxDuration = var_408_13

					if var_408_13 + var_408_6 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_13 + var_408_6
					end
				end

				arg_405_1.text_.text = var_408_10
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402099", "story_v_side_new_1109402.awb") ~= 0 then
					local var_408_14 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402099", "story_v_side_new_1109402.awb") / 1000

					if var_408_14 + var_408_6 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_14 + var_408_6
					end

					if var_408_9.prefab_name ~= "" and arg_405_1.actors_[var_408_9.prefab_name] ~= nil then
						local var_408_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_405_1.actors_[var_408_9.prefab_name].transform, "story_v_side_new_1109402", "1109402099", "story_v_side_new_1109402.awb")

						arg_405_1:RecordAudio("1109402099", var_408_15)
						arg_405_1:RecordAudio("1109402099", var_408_15)
					else
						arg_405_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402099", "story_v_side_new_1109402.awb")
					end

					arg_405_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402099", "story_v_side_new_1109402.awb")
				end

				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_16 = math.max(var_408_7, arg_405_1.talkMaxDuration)

			if var_408_6 <= arg_405_1.time_ and arg_405_1.time_ < var_408_6 + var_408_16 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_6) / var_408_16

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_6 + var_408_16 and arg_405_1.time_ < var_408_6 + var_408_16 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 1109402100
		arg_409_1.duration_ = 8.9

		local var_409_0 = {
			ja = 8.9,
			ko = 6.3,
			zh = 6.3
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
				arg_409_0:Play1109402101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0
			local var_412_1 = 0.8

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, true)

				local var_412_2 = arg_409_1:FormatText(StoryNameCfg[189].name)

				arg_409_1.leftNameTxt_.text = var_412_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_409_1.leftNameTxt_.transform)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1.leftNameTxt_.text)
				SetActive(arg_409_1.iconTrs_.gameObject, true)
				arg_409_1.iconController_:SetSelectedState("hero")

				arg_409_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_3 = arg_409_1:GetWordFromCfg(1109402100)
				local var_412_4 = arg_409_1:FormatText(var_412_3.content)

				arg_409_1.text_.text = var_412_4

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_5 = 32
				local var_412_6 = utf8.len(var_412_4)
				local var_412_7 = var_412_5 <= 0 and var_412_1 or var_412_1 * (var_412_6 / var_412_5)

				if var_412_7 > 0 and var_412_1 < var_412_7 then
					arg_409_1.talkMaxDuration = var_412_7

					if var_412_7 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_7 + var_412_0
					end
				end

				arg_409_1.text_.text = var_412_4
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402100", "story_v_side_new_1109402.awb") ~= 0 then
					local var_412_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402100", "story_v_side_new_1109402.awb") / 1000

					if var_412_8 + var_412_0 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_8 + var_412_0
					end

					if var_412_3.prefab_name ~= "" and arg_409_1.actors_[var_412_3.prefab_name] ~= nil then
						local var_412_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_409_1.actors_[var_412_3.prefab_name].transform, "story_v_side_new_1109402", "1109402100", "story_v_side_new_1109402.awb")

						arg_409_1:RecordAudio("1109402100", var_412_9)
						arg_409_1:RecordAudio("1109402100", var_412_9)
					else
						arg_409_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402100", "story_v_side_new_1109402.awb")
					end

					arg_409_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402100", "story_v_side_new_1109402.awb")
				end

				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_10 = math.max(var_412_1, arg_409_1.talkMaxDuration)

			if var_412_0 <= arg_409_1.time_ and arg_409_1.time_ < var_412_0 + var_412_10 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_0) / var_412_10

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_0 + var_412_10 and arg_409_1.time_ < var_412_0 + var_412_10 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 1109402101
		arg_413_1.duration_ = 9

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play1109402102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = "ST17"

			if arg_413_1.bgs_[var_416_0] == nil then
				local var_416_1 = Object.Instantiate(arg_413_1.paintGo_)

				var_416_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_416_0)
				var_416_1.name = var_416_0
				var_416_1.transform.parent = arg_413_1.stage_.transform
				var_416_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_413_1.bgs_[var_416_0] = var_416_1
			end

			local var_416_2 = 2

			if var_416_2 < arg_413_1.time_ and arg_413_1.time_ <= var_416_2 + arg_416_0 then
				local var_416_3 = manager.ui.mainCamera.transform.localPosition
				local var_416_4 = Vector3.New(0, 0, 10) + Vector3.New(var_416_3.x, var_416_3.y, 0)
				local var_416_5 = arg_413_1.bgs_.ST17

				var_416_5.transform.localPosition = var_416_4
				var_416_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_416_6 = var_416_5:GetComponent("SpriteRenderer")

				if var_416_6 and var_416_6.sprite then
					local var_416_7 = (var_416_5.transform.localPosition - var_416_3).z
					local var_416_8 = manager.ui.mainCameraCom_
					local var_416_9 = 2 * var_416_7 * Mathf.Tan(var_416_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_416_10 = var_416_9 * var_416_8.aspect
					local var_416_11 = var_416_6.sprite.bounds.size.x
					local var_416_12 = var_416_6.sprite.bounds.size.y
					local var_416_13 = var_416_10 / var_416_11
					local var_416_14 = var_416_9 / var_416_12
					local var_416_15 = var_416_14 < var_416_13 and var_416_13 or var_416_14

					var_416_5.transform.localScale = Vector3.New(var_416_15, var_416_15, 0)
				end

				for iter_416_0, iter_416_1 in pairs(arg_413_1.bgs_) do
					if iter_416_0 ~= "ST17" then
						iter_416_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_416_16 = 0

			if var_416_16 < arg_413_1.time_ and arg_413_1.time_ <= var_416_16 + arg_416_0 then
				arg_413_1.mask_.enabled = true
				arg_413_1.mask_.raycastTarget = true

				arg_413_1:SetGaussion(false)
			end

			local var_416_17 = 2

			if var_416_16 <= arg_413_1.time_ and arg_413_1.time_ < var_416_16 + var_416_17 then
				local var_416_18 = (arg_413_1.time_ - var_416_16) / var_416_17
				local var_416_19 = Color.New(0, 0, 0)

				var_416_19.a = Mathf.Lerp(0, 1, var_416_18)
				arg_413_1.mask_.color = var_416_19
			end

			if arg_413_1.time_ >= var_416_16 + var_416_17 and arg_413_1.time_ < var_416_16 + var_416_17 + arg_416_0 then
				local var_416_20 = Color.New(0, 0, 0)

				var_416_20.a = 1
				arg_413_1.mask_.color = var_416_20
			end

			local var_416_21 = 2

			if var_416_21 < arg_413_1.time_ and arg_413_1.time_ <= var_416_21 + arg_416_0 then
				arg_413_1.mask_.enabled = true
				arg_413_1.mask_.raycastTarget = true

				arg_413_1:SetGaussion(false)
			end

			local var_416_22 = 2

			if var_416_21 <= arg_413_1.time_ and arg_413_1.time_ < var_416_21 + var_416_22 then
				local var_416_23 = (arg_413_1.time_ - var_416_21) / var_416_22
				local var_416_24 = Color.New(0, 0, 0)

				var_416_24.a = Mathf.Lerp(1, 0, var_416_23)
				arg_413_1.mask_.color = var_416_24
			end

			if arg_413_1.time_ >= var_416_21 + var_416_22 and arg_413_1.time_ < var_416_21 + var_416_22 + arg_416_0 then
				local var_416_25 = Color.New(0, 0, 0)
				local var_416_26 = 0

				arg_413_1.mask_.enabled = false
				var_416_25.a = var_416_26
				arg_413_1.mask_.color = var_416_25
			end

			local var_416_27 = arg_413_1.actors_["1094ui_story"].transform
			local var_416_28 = 0

			if var_416_28 < arg_413_1.time_ and arg_413_1.time_ <= var_416_28 + arg_416_0 then
				arg_413_1.var_.moveOldPos1094ui_story = var_416_27.localPosition
			end

			local var_416_29 = 0.001

			if var_416_28 <= arg_413_1.time_ and arg_413_1.time_ < var_416_28 + var_416_29 then
				local var_416_30 = (arg_413_1.time_ - var_416_28) / var_416_29
				local var_416_31 = Vector3.New(0, 100, 0)

				var_416_27.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1094ui_story, var_416_31, var_416_30)

				local var_416_32 = manager.ui.mainCamera.transform.position - var_416_27.position

				var_416_27.forward = Vector3.New(var_416_32.x, var_416_32.y, var_416_32.z)

				local var_416_33 = var_416_27.localEulerAngles

				var_416_33.z = 0
				var_416_33.x = 0
				var_416_27.localEulerAngles = var_416_33
			end

			if arg_413_1.time_ >= var_416_28 + var_416_29 and arg_413_1.time_ < var_416_28 + var_416_29 + arg_416_0 then
				var_416_27.localPosition = Vector3.New(0, 100, 0)

				local var_416_34 = manager.ui.mainCamera.transform.position - var_416_27.position

				var_416_27.forward = Vector3.New(var_416_34.x, var_416_34.y, var_416_34.z)

				local var_416_35 = var_416_27.localEulerAngles

				var_416_35.z = 0
				var_416_35.x = 0
				var_416_27.localEulerAngles = var_416_35
			end

			local var_416_36 = arg_413_1.actors_["1094ui_story"]
			local var_416_37 = 0

			if var_416_37 < arg_413_1.time_ and arg_413_1.time_ <= var_416_37 + arg_416_0 and arg_413_1.var_.characterEffect1094ui_story == nil then
				arg_413_1.var_.characterEffect1094ui_story = var_416_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_38 = 0.200000002980232

			if var_416_37 <= arg_413_1.time_ and arg_413_1.time_ < var_416_37 + var_416_38 then
				local var_416_39 = (arg_413_1.time_ - var_416_37) / var_416_38

				if arg_413_1.var_.characterEffect1094ui_story then
					local var_416_40 = Mathf.Lerp(0, 0.5, var_416_39)

					arg_413_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_413_1.var_.characterEffect1094ui_story.fillRatio = var_416_40
				end
			end

			if arg_413_1.time_ >= var_416_37 + var_416_38 and arg_413_1.time_ < var_416_37 + var_416_38 + arg_416_0 and arg_413_1.var_.characterEffect1094ui_story then
				local var_416_41 = 0.5

				arg_413_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_413_1.var_.characterEffect1094ui_story.fillRatio = var_416_41
			end

			if arg_413_1.frameCnt_ <= 1 then
				arg_413_1.dialog_:SetActive(false)
			end

			local var_416_42 = 4
			local var_416_43 = 0.4

			if var_416_42 < arg_413_1.time_ and arg_413_1.time_ <= var_416_42 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0

				arg_413_1.dialog_:SetActive(true)

				local var_416_44 = LeanTween.value(arg_413_1.dialog_, 0, 1, 0.3)

				var_416_44:setOnUpdate(LuaHelper.FloatAction(function(arg_417_0)
					arg_413_1.dialogCg_.alpha = arg_417_0
				end))
				var_416_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_413_1.dialog_)
					var_416_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_413_1.duration_ = arg_413_1.duration_ + 0.3

				SetActive(arg_413_1.leftNameGo_, false)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_45 = arg_413_1:GetWordFromCfg(1109402101)
				local var_416_46 = arg_413_1:FormatText(var_416_45.content)

				arg_413_1.text_.text = var_416_46

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_47 = 16
				local var_416_48 = utf8.len(var_416_46)
				local var_416_49 = var_416_47 <= 0 and var_416_43 or var_416_43 * (var_416_48 / var_416_47)

				if var_416_49 > 0 and var_416_43 < var_416_49 then
					arg_413_1.talkMaxDuration = var_416_49
					var_416_42 = var_416_42 + 0.3

					if var_416_49 + var_416_42 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_49 + var_416_42
					end
				end

				arg_413_1.text_.text = var_416_46
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)
				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_50 = var_416_42 + 0.3
			local var_416_51 = math.max(var_416_43, arg_413_1.talkMaxDuration)

			if var_416_50 <= arg_413_1.time_ and arg_413_1.time_ < var_416_50 + var_416_51 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_50) / var_416_51

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_50 + var_416_51 and arg_413_1.time_ < var_416_50 + var_416_51 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402102 = function(arg_419_0, arg_419_1)
		arg_419_1.time_ = 0
		arg_419_1.frameCnt_ = 0
		arg_419_1.state_ = "playing"
		arg_419_1.curTalkId_ = 1109402102
		arg_419_1.duration_ = 5

		SetActive(arg_419_1.tipsGo_, false)

		function arg_419_1.onSingleLineFinish_()
			arg_419_1.onSingleLineUpdate_ = nil
			arg_419_1.onSingleLineFinish_ = nil
			arg_419_1.state_ = "waiting"
		end

		function arg_419_1.playNext_(arg_421_0)
			if arg_421_0 == 1 then
				arg_419_0:Play1109402103(arg_419_1)
			end
		end

		function arg_419_1.onSingleLineUpdate_(arg_422_0)
			local var_422_0 = 0
			local var_422_1 = 1.075

			if var_422_0 < arg_419_1.time_ and arg_419_1.time_ <= var_422_0 + arg_422_0 then
				arg_419_1.talkMaxDuration = 0
				arg_419_1.dialogCg_.alpha = 1

				arg_419_1.dialog_:SetActive(true)
				SetActive(arg_419_1.leftNameGo_, false)

				arg_419_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_419_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_419_1:RecordName(arg_419_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_419_1.iconTrs_.gameObject, false)
				arg_419_1.callingController_:SetSelectedState("normal")

				local var_422_2 = arg_419_1:GetWordFromCfg(1109402102)
				local var_422_3 = arg_419_1:FormatText(var_422_2.content)

				arg_419_1.text_.text = var_422_3

				LuaForUtil.ClearLinePrefixSymbol(arg_419_1.text_)

				local var_422_4 = 43
				local var_422_5 = utf8.len(var_422_3)
				local var_422_6 = var_422_4 <= 0 and var_422_1 or var_422_1 * (var_422_5 / var_422_4)

				if var_422_6 > 0 and var_422_1 < var_422_6 then
					arg_419_1.talkMaxDuration = var_422_6

					if var_422_6 + var_422_0 > arg_419_1.duration_ then
						arg_419_1.duration_ = var_422_6 + var_422_0
					end
				end

				arg_419_1.text_.text = var_422_3
				arg_419_1.typewritter.percent = 0

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(false)
				arg_419_1:RecordContent(arg_419_1.text_.text)
			end

			local var_422_7 = math.max(var_422_1, arg_419_1.talkMaxDuration)

			if var_422_0 <= arg_419_1.time_ and arg_419_1.time_ < var_422_0 + var_422_7 then
				arg_419_1.typewritter.percent = (arg_419_1.time_ - var_422_0) / var_422_7

				arg_419_1.typewritter:SetDirty()
			end

			if arg_419_1.time_ >= var_422_0 + var_422_7 and arg_419_1.time_ < var_422_0 + var_422_7 + arg_422_0 then
				arg_419_1.typewritter.percent = 1

				arg_419_1.typewritter:SetDirty()
				arg_419_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402103 = function(arg_423_0, arg_423_1)
		arg_423_1.time_ = 0
		arg_423_1.frameCnt_ = 0
		arg_423_1.state_ = "playing"
		arg_423_1.curTalkId_ = 1109402103
		arg_423_1.duration_ = 5

		SetActive(arg_423_1.tipsGo_, false)

		function arg_423_1.onSingleLineFinish_()
			arg_423_1.onSingleLineUpdate_ = nil
			arg_423_1.onSingleLineFinish_ = nil
			arg_423_1.state_ = "waiting"
		end

		function arg_423_1.playNext_(arg_425_0)
			if arg_425_0 == 1 then
				arg_423_0:Play1109402104(arg_423_1)
			end
		end

		function arg_423_1.onSingleLineUpdate_(arg_426_0)
			local var_426_0 = 0
			local var_426_1 = 0.575

			if var_426_0 < arg_423_1.time_ and arg_423_1.time_ <= var_426_0 + arg_426_0 then
				arg_423_1.talkMaxDuration = 0
				arg_423_1.dialogCg_.alpha = 1

				arg_423_1.dialog_:SetActive(true)
				SetActive(arg_423_1.leftNameGo_, false)

				arg_423_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_423_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_423_1:RecordName(arg_423_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_423_1.iconTrs_.gameObject, false)
				arg_423_1.callingController_:SetSelectedState("normal")

				local var_426_2 = arg_423_1:GetWordFromCfg(1109402103)
				local var_426_3 = arg_423_1:FormatText(var_426_2.content)

				arg_423_1.text_.text = var_426_3

				LuaForUtil.ClearLinePrefixSymbol(arg_423_1.text_)

				local var_426_4 = 23
				local var_426_5 = utf8.len(var_426_3)
				local var_426_6 = var_426_4 <= 0 and var_426_1 or var_426_1 * (var_426_5 / var_426_4)

				if var_426_6 > 0 and var_426_1 < var_426_6 then
					arg_423_1.talkMaxDuration = var_426_6

					if var_426_6 + var_426_0 > arg_423_1.duration_ then
						arg_423_1.duration_ = var_426_6 + var_426_0
					end
				end

				arg_423_1.text_.text = var_426_3
				arg_423_1.typewritter.percent = 0

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(false)
				arg_423_1:RecordContent(arg_423_1.text_.text)
			end

			local var_426_7 = math.max(var_426_1, arg_423_1.talkMaxDuration)

			if var_426_0 <= arg_423_1.time_ and arg_423_1.time_ < var_426_0 + var_426_7 then
				arg_423_1.typewritter.percent = (arg_423_1.time_ - var_426_0) / var_426_7

				arg_423_1.typewritter:SetDirty()
			end

			if arg_423_1.time_ >= var_426_0 + var_426_7 and arg_423_1.time_ < var_426_0 + var_426_7 + arg_426_0 then
				arg_423_1.typewritter.percent = 1

				arg_423_1.typewritter:SetDirty()
				arg_423_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402104 = function(arg_427_0, arg_427_1)
		arg_427_1.time_ = 0
		arg_427_1.frameCnt_ = 0
		arg_427_1.state_ = "playing"
		arg_427_1.curTalkId_ = 1109402104
		arg_427_1.duration_ = 5

		SetActive(arg_427_1.tipsGo_, false)

		function arg_427_1.onSingleLineFinish_()
			arg_427_1.onSingleLineUpdate_ = nil
			arg_427_1.onSingleLineFinish_ = nil
			arg_427_1.state_ = "waiting"
		end

		function arg_427_1.playNext_(arg_429_0)
			if arg_429_0 == 1 then
				arg_427_0:Play1109402105(arg_427_1)
			end
		end

		function arg_427_1.onSingleLineUpdate_(arg_430_0)
			local var_430_0 = 0
			local var_430_1 = 1.85

			if var_430_0 < arg_427_1.time_ and arg_427_1.time_ <= var_430_0 + arg_430_0 then
				arg_427_1.talkMaxDuration = 0
				arg_427_1.dialogCg_.alpha = 1

				arg_427_1.dialog_:SetActive(true)
				SetActive(arg_427_1.leftNameGo_, false)

				arg_427_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_427_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_427_1:RecordName(arg_427_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_427_1.iconTrs_.gameObject, false)
				arg_427_1.callingController_:SetSelectedState("normal")

				local var_430_2 = arg_427_1:GetWordFromCfg(1109402104)
				local var_430_3 = arg_427_1:FormatText(var_430_2.content)

				arg_427_1.text_.text = var_430_3

				LuaForUtil.ClearLinePrefixSymbol(arg_427_1.text_)

				local var_430_4 = 74
				local var_430_5 = utf8.len(var_430_3)
				local var_430_6 = var_430_4 <= 0 and var_430_1 or var_430_1 * (var_430_5 / var_430_4)

				if var_430_6 > 0 and var_430_1 < var_430_6 then
					arg_427_1.talkMaxDuration = var_430_6

					if var_430_6 + var_430_0 > arg_427_1.duration_ then
						arg_427_1.duration_ = var_430_6 + var_430_0
					end
				end

				arg_427_1.text_.text = var_430_3
				arg_427_1.typewritter.percent = 0

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(false)
				arg_427_1:RecordContent(arg_427_1.text_.text)
			end

			local var_430_7 = math.max(var_430_1, arg_427_1.talkMaxDuration)

			if var_430_0 <= arg_427_1.time_ and arg_427_1.time_ < var_430_0 + var_430_7 then
				arg_427_1.typewritter.percent = (arg_427_1.time_ - var_430_0) / var_430_7

				arg_427_1.typewritter:SetDirty()
			end

			if arg_427_1.time_ >= var_430_0 + var_430_7 and arg_427_1.time_ < var_430_0 + var_430_7 + arg_430_0 then
				arg_427_1.typewritter.percent = 1

				arg_427_1.typewritter:SetDirty()
				arg_427_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402105 = function(arg_431_0, arg_431_1)
		arg_431_1.time_ = 0
		arg_431_1.frameCnt_ = 0
		arg_431_1.state_ = "playing"
		arg_431_1.curTalkId_ = 1109402105
		arg_431_1.duration_ = 7.966

		local var_431_0 = {
			ja = 7.966,
			ko = 6.166,
			zh = 6.166
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
				arg_431_0:Play1109402106(arg_431_1)
			end
		end

		function arg_431_1.onSingleLineUpdate_(arg_434_0)
			local var_434_0 = 0
			local var_434_1 = 0.475

			if var_434_0 < arg_431_1.time_ and arg_431_1.time_ <= var_434_0 + arg_434_0 then
				arg_431_1.talkMaxDuration = 0
				arg_431_1.dialogCg_.alpha = 1

				arg_431_1.dialog_:SetActive(true)
				SetActive(arg_431_1.leftNameGo_, true)

				local var_434_2 = arg_431_1:FormatText(StoryNameCfg[189].name)

				arg_431_1.leftNameTxt_.text = var_434_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_431_1.leftNameTxt_.transform)

				arg_431_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_431_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_431_1:RecordName(arg_431_1.leftNameTxt_.text)
				SetActive(arg_431_1.iconTrs_.gameObject, true)
				arg_431_1.iconController_:SetSelectedState("hero")

				arg_431_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_431_1.callingController_:SetSelectedState("normal")

				local var_434_3 = arg_431_1:GetWordFromCfg(1109402105)
				local var_434_4 = arg_431_1:FormatText(var_434_3.content)

				arg_431_1.text_.text = var_434_4

				LuaForUtil.ClearLinePrefixSymbol(arg_431_1.text_)

				local var_434_5 = 19
				local var_434_6 = utf8.len(var_434_4)
				local var_434_7 = var_434_5 <= 0 and var_434_1 or var_434_1 * (var_434_6 / var_434_5)

				if var_434_7 > 0 and var_434_1 < var_434_7 then
					arg_431_1.talkMaxDuration = var_434_7

					if var_434_7 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_7 + var_434_0
					end
				end

				arg_431_1.text_.text = var_434_4
				arg_431_1.typewritter.percent = 0

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402105", "story_v_side_new_1109402.awb") ~= 0 then
					local var_434_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402105", "story_v_side_new_1109402.awb") / 1000

					if var_434_8 + var_434_0 > arg_431_1.duration_ then
						arg_431_1.duration_ = var_434_8 + var_434_0
					end

					if var_434_3.prefab_name ~= "" and arg_431_1.actors_[var_434_3.prefab_name] ~= nil then
						local var_434_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_431_1.actors_[var_434_3.prefab_name].transform, "story_v_side_new_1109402", "1109402105", "story_v_side_new_1109402.awb")

						arg_431_1:RecordAudio("1109402105", var_434_9)
						arg_431_1:RecordAudio("1109402105", var_434_9)
					else
						arg_431_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402105", "story_v_side_new_1109402.awb")
					end

					arg_431_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402105", "story_v_side_new_1109402.awb")
				end

				arg_431_1:RecordContent(arg_431_1.text_.text)
			end

			local var_434_10 = math.max(var_434_1, arg_431_1.talkMaxDuration)

			if var_434_0 <= arg_431_1.time_ and arg_431_1.time_ < var_434_0 + var_434_10 then
				arg_431_1.typewritter.percent = (arg_431_1.time_ - var_434_0) / var_434_10

				arg_431_1.typewritter:SetDirty()
			end

			if arg_431_1.time_ >= var_434_0 + var_434_10 and arg_431_1.time_ < var_434_0 + var_434_10 + arg_434_0 then
				arg_431_1.typewritter.percent = 1

				arg_431_1.typewritter:SetDirty()
				arg_431_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402106 = function(arg_435_0, arg_435_1)
		arg_435_1.time_ = 0
		arg_435_1.frameCnt_ = 0
		arg_435_1.state_ = "playing"
		arg_435_1.curTalkId_ = 1109402106
		arg_435_1.duration_ = 13.2

		local var_435_0 = {
			ja = 13.2,
			ko = 8.633,
			zh = 8.633
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
				arg_435_0:Play1109402107(arg_435_1)
			end
		end

		function arg_435_1.onSingleLineUpdate_(arg_438_0)
			local var_438_0 = arg_435_1.actors_["1094ui_story"].transform
			local var_438_1 = 0

			if var_438_1 < arg_435_1.time_ and arg_435_1.time_ <= var_438_1 + arg_438_0 then
				arg_435_1.var_.moveOldPos1094ui_story = var_438_0.localPosition
			end

			local var_438_2 = 0.001

			if var_438_1 <= arg_435_1.time_ and arg_435_1.time_ < var_438_1 + var_438_2 then
				local var_438_3 = (arg_435_1.time_ - var_438_1) / var_438_2
				local var_438_4 = Vector3.New(0, -0.84, -6.1)

				var_438_0.localPosition = Vector3.Lerp(arg_435_1.var_.moveOldPos1094ui_story, var_438_4, var_438_3)

				local var_438_5 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_5.x, var_438_5.y, var_438_5.z)

				local var_438_6 = var_438_0.localEulerAngles

				var_438_6.z = 0
				var_438_6.x = 0
				var_438_0.localEulerAngles = var_438_6
			end

			if arg_435_1.time_ >= var_438_1 + var_438_2 and arg_435_1.time_ < var_438_1 + var_438_2 + arg_438_0 then
				var_438_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_438_7 = manager.ui.mainCamera.transform.position - var_438_0.position

				var_438_0.forward = Vector3.New(var_438_7.x, var_438_7.y, var_438_7.z)

				local var_438_8 = var_438_0.localEulerAngles

				var_438_8.z = 0
				var_438_8.x = 0
				var_438_0.localEulerAngles = var_438_8
			end

			local var_438_9 = arg_435_1.actors_["1094ui_story"]
			local var_438_10 = 0

			if var_438_10 < arg_435_1.time_ and arg_435_1.time_ <= var_438_10 + arg_438_0 and arg_435_1.var_.characterEffect1094ui_story == nil then
				arg_435_1.var_.characterEffect1094ui_story = var_438_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_438_11 = 0.200000002980232

			if var_438_10 <= arg_435_1.time_ and arg_435_1.time_ < var_438_10 + var_438_11 then
				local var_438_12 = (arg_435_1.time_ - var_438_10) / var_438_11

				if arg_435_1.var_.characterEffect1094ui_story then
					arg_435_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_435_1.time_ >= var_438_10 + var_438_11 and arg_435_1.time_ < var_438_10 + var_438_11 + arg_438_0 and arg_435_1.var_.characterEffect1094ui_story then
				arg_435_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_438_13 = 0

			if var_438_13 < arg_435_1.time_ and arg_435_1.time_ <= var_438_13 + arg_438_0 then
				arg_435_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_438_14 = 0

			if var_438_14 < arg_435_1.time_ and arg_435_1.time_ <= var_438_14 + arg_438_0 then
				arg_435_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_438_15 = 0
			local var_438_16 = 0.8

			if var_438_15 < arg_435_1.time_ and arg_435_1.time_ <= var_438_15 + arg_438_0 then
				arg_435_1.talkMaxDuration = 0
				arg_435_1.dialogCg_.alpha = 1

				arg_435_1.dialog_:SetActive(true)
				SetActive(arg_435_1.leftNameGo_, true)

				local var_438_17 = arg_435_1:FormatText(StoryNameCfg[181].name)

				arg_435_1.leftNameTxt_.text = var_438_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_435_1.leftNameTxt_.transform)

				arg_435_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_435_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_435_1:RecordName(arg_435_1.leftNameTxt_.text)
				SetActive(arg_435_1.iconTrs_.gameObject, false)
				arg_435_1.callingController_:SetSelectedState("normal")

				local var_438_18 = arg_435_1:GetWordFromCfg(1109402106)
				local var_438_19 = arg_435_1:FormatText(var_438_18.content)

				arg_435_1.text_.text = var_438_19

				LuaForUtil.ClearLinePrefixSymbol(arg_435_1.text_)

				local var_438_20 = 32
				local var_438_21 = utf8.len(var_438_19)
				local var_438_22 = var_438_20 <= 0 and var_438_16 or var_438_16 * (var_438_21 / var_438_20)

				if var_438_22 > 0 and var_438_16 < var_438_22 then
					arg_435_1.talkMaxDuration = var_438_22

					if var_438_22 + var_438_15 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_22 + var_438_15
					end
				end

				arg_435_1.text_.text = var_438_19
				arg_435_1.typewritter.percent = 0

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402106", "story_v_side_new_1109402.awb") ~= 0 then
					local var_438_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402106", "story_v_side_new_1109402.awb") / 1000

					if var_438_23 + var_438_15 > arg_435_1.duration_ then
						arg_435_1.duration_ = var_438_23 + var_438_15
					end

					if var_438_18.prefab_name ~= "" and arg_435_1.actors_[var_438_18.prefab_name] ~= nil then
						local var_438_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_435_1.actors_[var_438_18.prefab_name].transform, "story_v_side_new_1109402", "1109402106", "story_v_side_new_1109402.awb")

						arg_435_1:RecordAudio("1109402106", var_438_24)
						arg_435_1:RecordAudio("1109402106", var_438_24)
					else
						arg_435_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402106", "story_v_side_new_1109402.awb")
					end

					arg_435_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402106", "story_v_side_new_1109402.awb")
				end

				arg_435_1:RecordContent(arg_435_1.text_.text)
			end

			local var_438_25 = math.max(var_438_16, arg_435_1.talkMaxDuration)

			if var_438_15 <= arg_435_1.time_ and arg_435_1.time_ < var_438_15 + var_438_25 then
				arg_435_1.typewritter.percent = (arg_435_1.time_ - var_438_15) / var_438_25

				arg_435_1.typewritter:SetDirty()
			end

			if arg_435_1.time_ >= var_438_15 + var_438_25 and arg_435_1.time_ < var_438_15 + var_438_25 + arg_438_0 then
				arg_435_1.typewritter.percent = 1

				arg_435_1.typewritter:SetDirty()
				arg_435_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 1109402107
		arg_439_1.duration_ = 3.866

		local var_439_0 = {
			ja = 3.866,
			ko = 1.633,
			zh = 1.633
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
				arg_439_0:Play1109402108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1094ui_story"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.characterEffect1094ui_story == nil then
				arg_439_1.var_.characterEffect1094ui_story = var_442_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_2 = 0.200000002980232

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.characterEffect1094ui_story then
					local var_442_4 = Mathf.Lerp(0, 0.5, var_442_3)

					arg_439_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_439_1.var_.characterEffect1094ui_story.fillRatio = var_442_4
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.characterEffect1094ui_story then
				local var_442_5 = 0.5

				arg_439_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_439_1.var_.characterEffect1094ui_story.fillRatio = var_442_5
			end

			local var_442_6 = 0
			local var_442_7 = 0.125

			if var_442_6 < arg_439_1.time_ and arg_439_1.time_ <= var_442_6 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_8 = arg_439_1:FormatText(StoryNameCfg[189].name)

				arg_439_1.leftNameTxt_.text = var_442_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, true)
				arg_439_1.iconController_:SetSelectedState("hero")

				arg_439_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_9 = arg_439_1:GetWordFromCfg(1109402107)
				local var_442_10 = arg_439_1:FormatText(var_442_9.content)

				arg_439_1.text_.text = var_442_10

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_11 = 5
				local var_442_12 = utf8.len(var_442_10)
				local var_442_13 = var_442_11 <= 0 and var_442_7 or var_442_7 * (var_442_12 / var_442_11)

				if var_442_13 > 0 and var_442_7 < var_442_13 then
					arg_439_1.talkMaxDuration = var_442_13

					if var_442_13 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_13 + var_442_6
					end
				end

				arg_439_1.text_.text = var_442_10
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402107", "story_v_side_new_1109402.awb") ~= 0 then
					local var_442_14 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402107", "story_v_side_new_1109402.awb") / 1000

					if var_442_14 + var_442_6 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_14 + var_442_6
					end

					if var_442_9.prefab_name ~= "" and arg_439_1.actors_[var_442_9.prefab_name] ~= nil then
						local var_442_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_9.prefab_name].transform, "story_v_side_new_1109402", "1109402107", "story_v_side_new_1109402.awb")

						arg_439_1:RecordAudio("1109402107", var_442_15)
						arg_439_1:RecordAudio("1109402107", var_442_15)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402107", "story_v_side_new_1109402.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402107", "story_v_side_new_1109402.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_16 = math.max(var_442_7, arg_439_1.talkMaxDuration)

			if var_442_6 <= arg_439_1.time_ and arg_439_1.time_ < var_442_6 + var_442_16 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_6) / var_442_16

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_6 + var_442_16 and arg_439_1.time_ < var_442_6 + var_442_16 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 1109402108
		arg_443_1.duration_ = 5

		SetActive(arg_443_1.tipsGo_, false)

		function arg_443_1.onSingleLineFinish_()
			arg_443_1.onSingleLineUpdate_ = nil
			arg_443_1.onSingleLineFinish_ = nil
			arg_443_1.state_ = "waiting"
		end

		function arg_443_1.playNext_(arg_445_0)
			if arg_445_0 == 1 then
				arg_443_0:Play1109402109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = 0
			local var_446_1 = 0.925

			if var_446_0 < arg_443_1.time_ and arg_443_1.time_ <= var_446_0 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, false)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_2 = arg_443_1:GetWordFromCfg(1109402108)
				local var_446_3 = arg_443_1:FormatText(var_446_2.content)

				arg_443_1.text_.text = var_446_3

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_4 = 37
				local var_446_5 = utf8.len(var_446_3)
				local var_446_6 = var_446_4 <= 0 and var_446_1 or var_446_1 * (var_446_5 / var_446_4)

				if var_446_6 > 0 and var_446_1 < var_446_6 then
					arg_443_1.talkMaxDuration = var_446_6

					if var_446_6 + var_446_0 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_6 + var_446_0
					end
				end

				arg_443_1.text_.text = var_446_3
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)
				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_7 = math.max(var_446_1, arg_443_1.talkMaxDuration)

			if var_446_0 <= arg_443_1.time_ and arg_443_1.time_ < var_446_0 + var_446_7 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_0) / var_446_7

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_0 + var_446_7 and arg_443_1.time_ < var_446_0 + var_446_7 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 1109402109
		arg_447_1.duration_ = 5

		SetActive(arg_447_1.tipsGo_, false)

		function arg_447_1.onSingleLineFinish_()
			arg_447_1.onSingleLineUpdate_ = nil
			arg_447_1.onSingleLineFinish_ = nil
			arg_447_1.state_ = "waiting"
		end

		function arg_447_1.playNext_(arg_449_0)
			if arg_449_0 == 1 then
				arg_447_0:Play1109402110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = 0
			local var_450_1 = 0.25

			if var_450_0 < arg_447_1.time_ and arg_447_1.time_ <= var_450_0 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_2 = arg_447_1:FormatText(StoryNameCfg[7].name)

				arg_447_1.leftNameTxt_.text = var_450_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_3 = arg_447_1:GetWordFromCfg(1109402109)
				local var_450_4 = arg_447_1:FormatText(var_450_3.content)

				arg_447_1.text_.text = var_450_4

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_5 = 10
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
				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_8 = math.max(var_450_1, arg_447_1.talkMaxDuration)

			if var_450_0 <= arg_447_1.time_ and arg_447_1.time_ < var_450_0 + var_450_8 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_0) / var_450_8

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_0 + var_450_8 and arg_447_1.time_ < var_450_0 + var_450_8 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 1109402110
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play1109402111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["1094ui_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos1094ui_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(0, -0.84, -6.1)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1094ui_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = 0

			if var_454_9 < arg_451_1.time_ and arg_451_1.time_ <= var_454_9 + arg_454_0 then
				arg_451_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_1")
			end

			local var_454_10 = 0
			local var_454_11 = 0.85

			if var_454_10 < arg_451_1.time_ and arg_451_1.time_ <= var_454_10 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_12 = arg_451_1:GetWordFromCfg(1109402110)
				local var_454_13 = arg_451_1:FormatText(var_454_12.content)

				arg_451_1.text_.text = var_454_13

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_14 = 33
				local var_454_15 = utf8.len(var_454_13)
				local var_454_16 = var_454_14 <= 0 and var_454_11 or var_454_11 * (var_454_15 / var_454_14)

				if var_454_16 > 0 and var_454_11 < var_454_16 then
					arg_451_1.talkMaxDuration = var_454_16

					if var_454_16 + var_454_10 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_16 + var_454_10
					end
				end

				arg_451_1.text_.text = var_454_13
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_17 = math.max(var_454_11, arg_451_1.talkMaxDuration)

			if var_454_10 <= arg_451_1.time_ and arg_451_1.time_ < var_454_10 + var_454_17 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_10) / var_454_17

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_10 + var_454_17 and arg_451_1.time_ < var_454_10 + var_454_17 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 1109402111
		arg_455_1.duration_ = 4.1

		local var_455_0 = {
			ja = 4.1,
			ko = 1.999999999999,
			zh = 1.999999999999
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
				arg_455_0:Play1109402112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1094ui_story"].transform
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				arg_455_1.var_.moveOldPos1094ui_story = var_458_0.localPosition
			end

			local var_458_2 = 0.001

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2
				local var_458_4 = Vector3.New(0, -0.84, -6.1)

				var_458_0.localPosition = Vector3.Lerp(arg_455_1.var_.moveOldPos1094ui_story, var_458_4, var_458_3)

				local var_458_5 = manager.ui.mainCamera.transform.position - var_458_0.position

				var_458_0.forward = Vector3.New(var_458_5.x, var_458_5.y, var_458_5.z)

				local var_458_6 = var_458_0.localEulerAngles

				var_458_6.z = 0
				var_458_6.x = 0
				var_458_0.localEulerAngles = var_458_6
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 then
				var_458_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_458_7 = manager.ui.mainCamera.transform.position - var_458_0.position

				var_458_0.forward = Vector3.New(var_458_7.x, var_458_7.y, var_458_7.z)

				local var_458_8 = var_458_0.localEulerAngles

				var_458_8.z = 0
				var_458_8.x = 0
				var_458_0.localEulerAngles = var_458_8
			end

			local var_458_9 = arg_455_1.actors_["1094ui_story"]
			local var_458_10 = 0

			if var_458_10 < arg_455_1.time_ and arg_455_1.time_ <= var_458_10 + arg_458_0 and arg_455_1.var_.characterEffect1094ui_story == nil then
				arg_455_1.var_.characterEffect1094ui_story = var_458_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_11 = 0.200000002980232

			if var_458_10 <= arg_455_1.time_ and arg_455_1.time_ < var_458_10 + var_458_11 then
				local var_458_12 = (arg_455_1.time_ - var_458_10) / var_458_11

				if arg_455_1.var_.characterEffect1094ui_story then
					arg_455_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_455_1.time_ >= var_458_10 + var_458_11 and arg_455_1.time_ < var_458_10 + var_458_11 + arg_458_0 and arg_455_1.var_.characterEffect1094ui_story then
				arg_455_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_458_13 = 0

			if var_458_13 < arg_455_1.time_ and arg_455_1.time_ <= var_458_13 + arg_458_0 then
				arg_455_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094actionlink/1094action454")
			end

			local var_458_14 = 0

			if var_458_14 < arg_455_1.time_ and arg_455_1.time_ <= var_458_14 + arg_458_0 then
				arg_455_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_458_15 = 0
			local var_458_16 = 0.15

			if var_458_15 < arg_455_1.time_ and arg_455_1.time_ <= var_458_15 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_17 = arg_455_1:FormatText(StoryNameCfg[181].name)

				arg_455_1.leftNameTxt_.text = var_458_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_18 = arg_455_1:GetWordFromCfg(1109402111)
				local var_458_19 = arg_455_1:FormatText(var_458_18.content)

				arg_455_1.text_.text = var_458_19

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_20 = 6
				local var_458_21 = utf8.len(var_458_19)
				local var_458_22 = var_458_20 <= 0 and var_458_16 or var_458_16 * (var_458_21 / var_458_20)

				if var_458_22 > 0 and var_458_16 < var_458_22 then
					arg_455_1.talkMaxDuration = var_458_22

					if var_458_22 + var_458_15 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_22 + var_458_15
					end
				end

				arg_455_1.text_.text = var_458_19
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402111", "story_v_side_new_1109402.awb") ~= 0 then
					local var_458_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402111", "story_v_side_new_1109402.awb") / 1000

					if var_458_23 + var_458_15 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_23 + var_458_15
					end

					if var_458_18.prefab_name ~= "" and arg_455_1.actors_[var_458_18.prefab_name] ~= nil then
						local var_458_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_18.prefab_name].transform, "story_v_side_new_1109402", "1109402111", "story_v_side_new_1109402.awb")

						arg_455_1:RecordAudio("1109402111", var_458_24)
						arg_455_1:RecordAudio("1109402111", var_458_24)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402111", "story_v_side_new_1109402.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402111", "story_v_side_new_1109402.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_25 = math.max(var_458_16, arg_455_1.talkMaxDuration)

			if var_458_15 <= arg_455_1.time_ and arg_455_1.time_ < var_458_15 + var_458_25 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_15) / var_458_25

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_15 + var_458_25 and arg_455_1.time_ < var_458_15 + var_458_25 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 1109402112
		arg_459_1.duration_ = 5.266

		local var_459_0 = {
			ja = 5.266,
			ko = 4.8,
			zh = 4.8
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
				arg_459_0:Play1109402113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = arg_459_1.actors_["1094ui_story"]
			local var_462_1 = 0

			if var_462_1 < arg_459_1.time_ and arg_459_1.time_ <= var_462_1 + arg_462_0 and arg_459_1.var_.characterEffect1094ui_story == nil then
				arg_459_1.var_.characterEffect1094ui_story = var_462_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_462_2 = 0.200000002980232

			if var_462_1 <= arg_459_1.time_ and arg_459_1.time_ < var_462_1 + var_462_2 then
				local var_462_3 = (arg_459_1.time_ - var_462_1) / var_462_2

				if arg_459_1.var_.characterEffect1094ui_story then
					local var_462_4 = Mathf.Lerp(0, 0.5, var_462_3)

					arg_459_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_459_1.var_.characterEffect1094ui_story.fillRatio = var_462_4
				end
			end

			if arg_459_1.time_ >= var_462_1 + var_462_2 and arg_459_1.time_ < var_462_1 + var_462_2 + arg_462_0 and arg_459_1.var_.characterEffect1094ui_story then
				local var_462_5 = 0.5

				arg_459_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_459_1.var_.characterEffect1094ui_story.fillRatio = var_462_5
			end

			local var_462_6 = 0
			local var_462_7 = 0.575

			if var_462_6 < arg_459_1.time_ and arg_459_1.time_ <= var_462_6 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_8 = arg_459_1:FormatText(StoryNameCfg[426].name)

				arg_459_1.leftNameTxt_.text = var_462_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, true)
				arg_459_1.iconController_:SetSelectedState("hero")

				arg_459_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_9 = arg_459_1:GetWordFromCfg(1109402112)
				local var_462_10 = arg_459_1:FormatText(var_462_9.content)

				arg_459_1.text_.text = var_462_10

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_11 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402112", "story_v_side_new_1109402.awb") ~= 0 then
					local var_462_14 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402112", "story_v_side_new_1109402.awb") / 1000

					if var_462_14 + var_462_6 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_14 + var_462_6
					end

					if var_462_9.prefab_name ~= "" and arg_459_1.actors_[var_462_9.prefab_name] ~= nil then
						local var_462_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_9.prefab_name].transform, "story_v_side_new_1109402", "1109402112", "story_v_side_new_1109402.awb")

						arg_459_1:RecordAudio("1109402112", var_462_15)
						arg_459_1:RecordAudio("1109402112", var_462_15)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402112", "story_v_side_new_1109402.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402112", "story_v_side_new_1109402.awb")
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
	Play1109402113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 1109402113
		arg_463_1.duration_ = 5

		SetActive(arg_463_1.tipsGo_, false)

		function arg_463_1.onSingleLineFinish_()
			arg_463_1.onSingleLineUpdate_ = nil
			arg_463_1.onSingleLineFinish_ = nil
			arg_463_1.state_ = "waiting"
		end

		function arg_463_1.playNext_(arg_465_0)
			if arg_465_0 == 1 then
				arg_463_0:Play1109402114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_466_1 = 0
			local var_466_2 = 0.6

			if var_466_1 < arg_463_1.time_ and arg_463_1.time_ <= var_466_1 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, false)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(1109402113)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 24
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_2 or var_466_2 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_2 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_1 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_1
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)
				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_8 = math.max(var_466_2, arg_463_1.talkMaxDuration)

			if var_466_1 <= arg_463_1.time_ and arg_463_1.time_ < var_466_1 + var_466_8 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_1) / var_466_8

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_1 + var_466_8 and arg_463_1.time_ < var_466_1 + var_466_8 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 1109402114
		arg_467_1.duration_ = 5.233

		local var_467_0 = {
			ja = 5.233,
			ko = 3.566,
			zh = 3.566
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
				arg_467_0:Play1109402115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = 0
			local var_470_1 = 0.325

			if var_470_0 < arg_467_1.time_ and arg_467_1.time_ <= var_470_0 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_2 = arg_467_1:FormatText(StoryNameCfg[426].name)

				arg_467_1.leftNameTxt_.text = var_470_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, true)
				arg_467_1.iconController_:SetSelectedState("hero")

				arg_467_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_3 = arg_467_1:GetWordFromCfg(1109402114)
				local var_470_4 = arg_467_1:FormatText(var_470_3.content)

				arg_467_1.text_.text = var_470_4

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402114", "story_v_side_new_1109402.awb") ~= 0 then
					local var_470_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402114", "story_v_side_new_1109402.awb") / 1000

					if var_470_8 + var_470_0 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_8 + var_470_0
					end

					if var_470_3.prefab_name ~= "" and arg_467_1.actors_[var_470_3.prefab_name] ~= nil then
						local var_470_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_3.prefab_name].transform, "story_v_side_new_1109402", "1109402114", "story_v_side_new_1109402.awb")

						arg_467_1:RecordAudio("1109402114", var_470_9)
						arg_467_1:RecordAudio("1109402114", var_470_9)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402114", "story_v_side_new_1109402.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402114", "story_v_side_new_1109402.awb")
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
	Play1109402115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 1109402115
		arg_471_1.duration_ = 5

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play1109402116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = 0
			local var_474_1 = 0.8

			if var_474_0 < arg_471_1.time_ and arg_471_1.time_ <= var_474_0 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, false)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_2 = arg_471_1:GetWordFromCfg(1109402115)
				local var_474_3 = arg_471_1:FormatText(var_474_2.content)

				arg_471_1.text_.text = var_474_3

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_4 = 32
				local var_474_5 = utf8.len(var_474_3)
				local var_474_6 = var_474_4 <= 0 and var_474_1 or var_474_1 * (var_474_5 / var_474_4)

				if var_474_6 > 0 and var_474_1 < var_474_6 then
					arg_471_1.talkMaxDuration = var_474_6

					if var_474_6 + var_474_0 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_6 + var_474_0
					end
				end

				arg_471_1.text_.text = var_474_3
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)
				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_7 = math.max(var_474_1, arg_471_1.talkMaxDuration)

			if var_474_0 <= arg_471_1.time_ and arg_471_1.time_ < var_474_0 + var_474_7 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_0) / var_474_7

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_0 + var_474_7 and arg_471_1.time_ < var_474_0 + var_474_7 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 1109402116
		arg_475_1.duration_ = 1.999999999999

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play1109402117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = arg_475_1.actors_["1094ui_story"].transform
			local var_478_1 = 0

			if var_478_1 < arg_475_1.time_ and arg_475_1.time_ <= var_478_1 + arg_478_0 then
				arg_475_1.var_.moveOldPos1094ui_story = var_478_0.localPosition
			end

			local var_478_2 = 0.001

			if var_478_1 <= arg_475_1.time_ and arg_475_1.time_ < var_478_1 + var_478_2 then
				local var_478_3 = (arg_475_1.time_ - var_478_1) / var_478_2
				local var_478_4 = Vector3.New(0, -0.84, -6.1)

				var_478_0.localPosition = Vector3.Lerp(arg_475_1.var_.moveOldPos1094ui_story, var_478_4, var_478_3)

				local var_478_5 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_5.x, var_478_5.y, var_478_5.z)

				local var_478_6 = var_478_0.localEulerAngles

				var_478_6.z = 0
				var_478_6.x = 0
				var_478_0.localEulerAngles = var_478_6
			end

			if arg_475_1.time_ >= var_478_1 + var_478_2 and arg_475_1.time_ < var_478_1 + var_478_2 + arg_478_0 then
				var_478_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_478_7 = manager.ui.mainCamera.transform.position - var_478_0.position

				var_478_0.forward = Vector3.New(var_478_7.x, var_478_7.y, var_478_7.z)

				local var_478_8 = var_478_0.localEulerAngles

				var_478_8.z = 0
				var_478_8.x = 0
				var_478_0.localEulerAngles = var_478_8
			end

			local var_478_9 = arg_475_1.actors_["1094ui_story"]
			local var_478_10 = 0

			if var_478_10 < arg_475_1.time_ and arg_475_1.time_ <= var_478_10 + arg_478_0 and arg_475_1.var_.characterEffect1094ui_story == nil then
				arg_475_1.var_.characterEffect1094ui_story = var_478_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_478_11 = 0.200000002980232

			if var_478_10 <= arg_475_1.time_ and arg_475_1.time_ < var_478_10 + var_478_11 then
				local var_478_12 = (arg_475_1.time_ - var_478_10) / var_478_11

				if arg_475_1.var_.characterEffect1094ui_story then
					arg_475_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_475_1.time_ >= var_478_10 + var_478_11 and arg_475_1.time_ < var_478_10 + var_478_11 + arg_478_0 and arg_475_1.var_.characterEffect1094ui_story then
				arg_475_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_478_13 = 0

			if var_478_13 < arg_475_1.time_ and arg_475_1.time_ <= var_478_13 + arg_478_0 then
				arg_475_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action4_2")
			end

			local var_478_14 = 0

			if var_478_14 < arg_475_1.time_ and arg_475_1.time_ <= var_478_14 + arg_478_0 then
				arg_475_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_478_15 = 0
			local var_478_16 = 0.1

			if var_478_15 < arg_475_1.time_ and arg_475_1.time_ <= var_478_15 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_17 = arg_475_1:FormatText(StoryNameCfg[181].name)

				arg_475_1.leftNameTxt_.text = var_478_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_18 = arg_475_1:GetWordFromCfg(1109402116)
				local var_478_19 = arg_475_1:FormatText(var_478_18.content)

				arg_475_1.text_.text = var_478_19

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_20 = 4
				local var_478_21 = utf8.len(var_478_19)
				local var_478_22 = var_478_20 <= 0 and var_478_16 or var_478_16 * (var_478_21 / var_478_20)

				if var_478_22 > 0 and var_478_16 < var_478_22 then
					arg_475_1.talkMaxDuration = var_478_22

					if var_478_22 + var_478_15 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_22 + var_478_15
					end
				end

				arg_475_1.text_.text = var_478_19
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402116", "story_v_side_new_1109402.awb") ~= 0 then
					local var_478_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402116", "story_v_side_new_1109402.awb") / 1000

					if var_478_23 + var_478_15 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_23 + var_478_15
					end

					if var_478_18.prefab_name ~= "" and arg_475_1.actors_[var_478_18.prefab_name] ~= nil then
						local var_478_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_18.prefab_name].transform, "story_v_side_new_1109402", "1109402116", "story_v_side_new_1109402.awb")

						arg_475_1:RecordAudio("1109402116", var_478_24)
						arg_475_1:RecordAudio("1109402116", var_478_24)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402116", "story_v_side_new_1109402.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402116", "story_v_side_new_1109402.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_25 = math.max(var_478_16, arg_475_1.talkMaxDuration)

			if var_478_15 <= arg_475_1.time_ and arg_475_1.time_ < var_478_15 + var_478_25 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_15) / var_478_25

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_15 + var_478_25 and arg_475_1.time_ < var_478_15 + var_478_25 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 1109402117
		arg_479_1.duration_ = 7.066

		local var_479_0 = {
			ja = 7.066,
			ko = 6.166,
			zh = 6.166
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
				arg_479_0:Play1109402118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["1094ui_story"]
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 and arg_479_1.var_.characterEffect1094ui_story == nil then
				arg_479_1.var_.characterEffect1094ui_story = var_482_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_2 = 0.200000002980232

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2

				if arg_479_1.var_.characterEffect1094ui_story then
					local var_482_4 = Mathf.Lerp(0, 0.5, var_482_3)

					arg_479_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_479_1.var_.characterEffect1094ui_story.fillRatio = var_482_4
				end
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 and arg_479_1.var_.characterEffect1094ui_story then
				local var_482_5 = 0.5

				arg_479_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_479_1.var_.characterEffect1094ui_story.fillRatio = var_482_5
			end

			local var_482_6 = 0
			local var_482_7 = 0.825

			if var_482_6 < arg_479_1.time_ and arg_479_1.time_ <= var_482_6 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_8 = arg_479_1:FormatText(StoryNameCfg[426].name)

				arg_479_1.leftNameTxt_.text = var_482_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, true)
				arg_479_1.iconController_:SetSelectedState("hero")

				arg_479_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_9 = arg_479_1:GetWordFromCfg(1109402117)
				local var_482_10 = arg_479_1:FormatText(var_482_9.content)

				arg_479_1.text_.text = var_482_10

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_11 = 33
				local var_482_12 = utf8.len(var_482_10)
				local var_482_13 = var_482_11 <= 0 and var_482_7 or var_482_7 * (var_482_12 / var_482_11)

				if var_482_13 > 0 and var_482_7 < var_482_13 then
					arg_479_1.talkMaxDuration = var_482_13

					if var_482_13 + var_482_6 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_13 + var_482_6
					end
				end

				arg_479_1.text_.text = var_482_10
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402117", "story_v_side_new_1109402.awb") ~= 0 then
					local var_482_14 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402117", "story_v_side_new_1109402.awb") / 1000

					if var_482_14 + var_482_6 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_14 + var_482_6
					end

					if var_482_9.prefab_name ~= "" and arg_479_1.actors_[var_482_9.prefab_name] ~= nil then
						local var_482_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_9.prefab_name].transform, "story_v_side_new_1109402", "1109402117", "story_v_side_new_1109402.awb")

						arg_479_1:RecordAudio("1109402117", var_482_15)
						arg_479_1:RecordAudio("1109402117", var_482_15)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402117", "story_v_side_new_1109402.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402117", "story_v_side_new_1109402.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_16 = math.max(var_482_7, arg_479_1.talkMaxDuration)

			if var_482_6 <= arg_479_1.time_ and arg_479_1.time_ < var_482_6 + var_482_16 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_6) / var_482_16

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_6 + var_482_16 and arg_479_1.time_ < var_482_6 + var_482_16 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402118 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 1109402118
		arg_483_1.duration_ = 6.733

		local var_483_0 = {
			ja = 3.566,
			ko = 6.733,
			zh = 6.733
		}
		local var_483_1 = manager.audio:GetLocalizationFlag()

		if var_483_0[var_483_1] ~= nil then
			arg_483_1.duration_ = var_483_0[var_483_1]
		end

		SetActive(arg_483_1.tipsGo_, false)

		function arg_483_1.onSingleLineFinish_()
			arg_483_1.onSingleLineUpdate_ = nil
			arg_483_1.onSingleLineFinish_ = nil
			arg_483_1.state_ = "waiting"
		end

		function arg_483_1.playNext_(arg_485_0)
			if arg_485_0 == 1 then
				arg_483_0:Play1109402119(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = 0
			local var_486_1 = 0.55

			if var_486_0 < arg_483_1.time_ and arg_483_1.time_ <= var_486_0 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_2 = arg_483_1:FormatText(StoryNameCfg[189].name)

				arg_483_1.leftNameTxt_.text = var_486_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, true)
				arg_483_1.iconController_:SetSelectedState("hero")

				arg_483_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_3 = arg_483_1:GetWordFromCfg(1109402118)
				local var_486_4 = arg_483_1:FormatText(var_486_3.content)

				arg_483_1.text_.text = var_486_4

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_5 = 22
				local var_486_6 = utf8.len(var_486_4)
				local var_486_7 = var_486_5 <= 0 and var_486_1 or var_486_1 * (var_486_6 / var_486_5)

				if var_486_7 > 0 and var_486_1 < var_486_7 then
					arg_483_1.talkMaxDuration = var_486_7

					if var_486_7 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_7 + var_486_0
					end
				end

				arg_483_1.text_.text = var_486_4
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402118", "story_v_side_new_1109402.awb") ~= 0 then
					local var_486_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402118", "story_v_side_new_1109402.awb") / 1000

					if var_486_8 + var_486_0 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_8 + var_486_0
					end

					if var_486_3.prefab_name ~= "" and arg_483_1.actors_[var_486_3.prefab_name] ~= nil then
						local var_486_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_3.prefab_name].transform, "story_v_side_new_1109402", "1109402118", "story_v_side_new_1109402.awb")

						arg_483_1:RecordAudio("1109402118", var_486_9)
						arg_483_1:RecordAudio("1109402118", var_486_9)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402118", "story_v_side_new_1109402.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402118", "story_v_side_new_1109402.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_10 = math.max(var_486_1, arg_483_1.talkMaxDuration)

			if var_486_0 <= arg_483_1.time_ and arg_483_1.time_ < var_486_0 + var_486_10 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_0) / var_486_10

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_0 + var_486_10 and arg_483_1.time_ < var_486_0 + var_486_10 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402119 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 1109402119
		arg_487_1.duration_ = 9.8

		local var_487_0 = {
			ja = 9.8,
			ko = 6.6,
			zh = 6.6
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
				arg_487_0:Play1109402120(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = 0
			local var_490_1 = 0.775

			if var_490_0 < arg_487_1.time_ and arg_487_1.time_ <= var_490_0 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_2 = arg_487_1:FormatText(StoryNameCfg[426].name)

				arg_487_1.leftNameTxt_.text = var_490_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, true)
				arg_487_1.iconController_:SetSelectedState("hero")

				arg_487_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_3 = arg_487_1:GetWordFromCfg(1109402119)
				local var_490_4 = arg_487_1:FormatText(var_490_3.content)

				arg_487_1.text_.text = var_490_4

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_5 = 31
				local var_490_6 = utf8.len(var_490_4)
				local var_490_7 = var_490_5 <= 0 and var_490_1 or var_490_1 * (var_490_6 / var_490_5)

				if var_490_7 > 0 and var_490_1 < var_490_7 then
					arg_487_1.talkMaxDuration = var_490_7

					if var_490_7 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_7 + var_490_0
					end
				end

				arg_487_1.text_.text = var_490_4
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402119", "story_v_side_new_1109402.awb") ~= 0 then
					local var_490_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402119", "story_v_side_new_1109402.awb") / 1000

					if var_490_8 + var_490_0 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_8 + var_490_0
					end

					if var_490_3.prefab_name ~= "" and arg_487_1.actors_[var_490_3.prefab_name] ~= nil then
						local var_490_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_3.prefab_name].transform, "story_v_side_new_1109402", "1109402119", "story_v_side_new_1109402.awb")

						arg_487_1:RecordAudio("1109402119", var_490_9)
						arg_487_1:RecordAudio("1109402119", var_490_9)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402119", "story_v_side_new_1109402.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402119", "story_v_side_new_1109402.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_10 = math.max(var_490_1, arg_487_1.talkMaxDuration)

			if var_490_0 <= arg_487_1.time_ and arg_487_1.time_ < var_490_0 + var_490_10 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_0) / var_490_10

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_0 + var_490_10 and arg_487_1.time_ < var_490_0 + var_490_10 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 1109402120
		arg_491_1.duration_ = 5

		SetActive(arg_491_1.tipsGo_, false)

		function arg_491_1.onSingleLineFinish_()
			arg_491_1.onSingleLineUpdate_ = nil
			arg_491_1.onSingleLineFinish_ = nil
			arg_491_1.state_ = "waiting"
		end

		function arg_491_1.playNext_(arg_493_0)
			if arg_493_0 == 1 then
				arg_491_0:Play1109402121(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = 0
			local var_494_1 = 0.55

			if var_494_0 < arg_491_1.time_ and arg_491_1.time_ <= var_494_0 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_2 = arg_491_1:FormatText(StoryNameCfg[7].name)

				arg_491_1.leftNameTxt_.text = var_494_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_3 = arg_491_1:GetWordFromCfg(1109402120)
				local var_494_4 = arg_491_1:FormatText(var_494_3.content)

				arg_491_1.text_.text = var_494_4

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_5 = 22
				local var_494_6 = utf8.len(var_494_4)
				local var_494_7 = var_494_5 <= 0 and var_494_1 or var_494_1 * (var_494_6 / var_494_5)

				if var_494_7 > 0 and var_494_1 < var_494_7 then
					arg_491_1.talkMaxDuration = var_494_7

					if var_494_7 + var_494_0 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_7 + var_494_0
					end
				end

				arg_491_1.text_.text = var_494_4
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)
				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_8 = math.max(var_494_1, arg_491_1.talkMaxDuration)

			if var_494_0 <= arg_491_1.time_ and arg_491_1.time_ < var_494_0 + var_494_8 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_0) / var_494_8

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_0 + var_494_8 and arg_491_1.time_ < var_494_0 + var_494_8 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402121 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 1109402121
		arg_495_1.duration_ = 2.933

		local var_495_0 = {
			ja = 2.833,
			ko = 2.933,
			zh = 2.933
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
				arg_495_0:Play1109402122(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_1")
			end

			local var_498_1 = 0
			local var_498_2 = 0.325

			if var_498_1 < arg_495_1.time_ and arg_495_1.time_ <= var_498_1 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_3 = arg_495_1:FormatText(StoryNameCfg[426].name)

				arg_495_1.leftNameTxt_.text = var_498_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, true)
				arg_495_1.iconController_:SetSelectedState("hero")

				arg_495_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_4 = arg_495_1:GetWordFromCfg(1109402121)
				local var_498_5 = arg_495_1:FormatText(var_498_4.content)

				arg_495_1.text_.text = var_498_5

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_6 = 13
				local var_498_7 = utf8.len(var_498_5)
				local var_498_8 = var_498_6 <= 0 and var_498_2 or var_498_2 * (var_498_7 / var_498_6)

				if var_498_8 > 0 and var_498_2 < var_498_8 then
					arg_495_1.talkMaxDuration = var_498_8

					if var_498_8 + var_498_1 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_8 + var_498_1
					end
				end

				arg_495_1.text_.text = var_498_5
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402121", "story_v_side_new_1109402.awb") ~= 0 then
					local var_498_9 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402121", "story_v_side_new_1109402.awb") / 1000

					if var_498_9 + var_498_1 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_9 + var_498_1
					end

					if var_498_4.prefab_name ~= "" and arg_495_1.actors_[var_498_4.prefab_name] ~= nil then
						local var_498_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_4.prefab_name].transform, "story_v_side_new_1109402", "1109402121", "story_v_side_new_1109402.awb")

						arg_495_1:RecordAudio("1109402121", var_498_10)
						arg_495_1:RecordAudio("1109402121", var_498_10)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402121", "story_v_side_new_1109402.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402121", "story_v_side_new_1109402.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_11 = math.max(var_498_2, arg_495_1.talkMaxDuration)

			if var_498_1 <= arg_495_1.time_ and arg_495_1.time_ < var_498_1 + var_498_11 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_1) / var_498_11

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_1 + var_498_11 and arg_495_1.time_ < var_498_1 + var_498_11 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402122 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 1109402122
		arg_499_1.duration_ = 5

		SetActive(arg_499_1.tipsGo_, false)

		function arg_499_1.onSingleLineFinish_()
			arg_499_1.onSingleLineUpdate_ = nil
			arg_499_1.onSingleLineFinish_ = nil
			arg_499_1.state_ = "waiting"
		end

		function arg_499_1.playNext_(arg_501_0)
			if arg_501_0 == 1 then
				arg_499_0:Play1109402123(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = 0
			local var_502_1 = 0.45

			if var_502_0 < arg_499_1.time_ and arg_499_1.time_ <= var_502_0 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_2 = arg_499_1:FormatText(StoryNameCfg[7].name)

				arg_499_1.leftNameTxt_.text = var_502_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_3 = arg_499_1:GetWordFromCfg(1109402122)
				local var_502_4 = arg_499_1:FormatText(var_502_3.content)

				arg_499_1.text_.text = var_502_4

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_5 = 18
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
				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_8 = math.max(var_502_1, arg_499_1.talkMaxDuration)

			if var_502_0 <= arg_499_1.time_ and arg_499_1.time_ < var_502_0 + var_502_8 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_0) / var_502_8

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_0 + var_502_8 and arg_499_1.time_ < var_502_0 + var_502_8 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402123 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 1109402123
		arg_503_1.duration_ = 5

		SetActive(arg_503_1.tipsGo_, false)

		function arg_503_1.onSingleLineFinish_()
			arg_503_1.onSingleLineUpdate_ = nil
			arg_503_1.onSingleLineFinish_ = nil
			arg_503_1.state_ = "waiting"
		end

		function arg_503_1.playNext_(arg_505_0)
			if arg_505_0 == 1 then
				arg_503_0:Play1109402124(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = 0
			local var_506_1 = 0.375

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

				local var_506_2 = arg_503_1:GetWordFromCfg(1109402123)
				local var_506_3 = arg_503_1:FormatText(var_506_2.content)

				arg_503_1.text_.text = var_506_3

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_4 = 15
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
	Play1109402124 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 1109402124
		arg_507_1.duration_ = 6.266

		local var_507_0 = {
			ja = 6.266,
			ko = 6,
			zh = 6
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
				arg_507_0:Play1109402125(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 0.675

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_2 = arg_507_1:FormatText(StoryNameCfg[426].name)

				arg_507_1.leftNameTxt_.text = var_510_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, true)
				arg_507_1.iconController_:SetSelectedState("hero")

				arg_507_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_xh_citizenwa")

				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_3 = arg_507_1:GetWordFromCfg(1109402124)
				local var_510_4 = arg_507_1:FormatText(var_510_3.content)

				arg_507_1.text_.text = var_510_4

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_5 = 27
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402124", "story_v_side_new_1109402.awb") ~= 0 then
					local var_510_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402124", "story_v_side_new_1109402.awb") / 1000

					if var_510_8 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_8 + var_510_0
					end

					if var_510_3.prefab_name ~= "" and arg_507_1.actors_[var_510_3.prefab_name] ~= nil then
						local var_510_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_3.prefab_name].transform, "story_v_side_new_1109402", "1109402124", "story_v_side_new_1109402.awb")

						arg_507_1:RecordAudio("1109402124", var_510_9)
						arg_507_1:RecordAudio("1109402124", var_510_9)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402124", "story_v_side_new_1109402.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402124", "story_v_side_new_1109402.awb")
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
	Play1109402125 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 1109402125
		arg_511_1.duration_ = 8.466

		local var_511_0 = {
			ja = 8.466,
			ko = 5.7,
			zh = 5.7
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
				arg_511_0:Play1109402126(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0
			local var_514_1 = 0.575

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_2 = arg_511_1:FormatText(StoryNameCfg[189].name)

				arg_511_1.leftNameTxt_.text = var_514_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, true)
				arg_511_1.iconController_:SetSelectedState("hero")

				arg_511_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_3 = arg_511_1:GetWordFromCfg(1109402125)
				local var_514_4 = arg_511_1:FormatText(var_514_3.content)

				arg_511_1.text_.text = var_514_4

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402125", "story_v_side_new_1109402.awb") ~= 0 then
					local var_514_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402125", "story_v_side_new_1109402.awb") / 1000

					if var_514_8 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_8 + var_514_0
					end

					if var_514_3.prefab_name ~= "" and arg_511_1.actors_[var_514_3.prefab_name] ~= nil then
						local var_514_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_3.prefab_name].transform, "story_v_side_new_1109402", "1109402125", "story_v_side_new_1109402.awb")

						arg_511_1:RecordAudio("1109402125", var_514_9)
						arg_511_1:RecordAudio("1109402125", var_514_9)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402125", "story_v_side_new_1109402.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402125", "story_v_side_new_1109402.awb")
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
	Play1109402126 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 1109402126
		arg_515_1.duration_ = 7

		SetActive(arg_515_1.tipsGo_, false)

		function arg_515_1.onSingleLineFinish_()
			arg_515_1.onSingleLineUpdate_ = nil
			arg_515_1.onSingleLineFinish_ = nil
			arg_515_1.state_ = "waiting"
		end

		function arg_515_1.playNext_(arg_517_0)
			if arg_517_0 == 1 then
				arg_515_0:Play1109402127(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = "STblack"

			if arg_515_1.bgs_[var_518_0] == nil then
				local var_518_1 = Object.Instantiate(arg_515_1.paintGo_)

				var_518_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_518_0)
				var_518_1.name = var_518_0
				var_518_1.transform.parent = arg_515_1.stage_.transform
				var_518_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_515_1.bgs_[var_518_0] = var_518_1
			end

			local var_518_2 = 0

			if var_518_2 < arg_515_1.time_ and arg_515_1.time_ <= var_518_2 + arg_518_0 then
				local var_518_3 = manager.ui.mainCamera.transform.localPosition
				local var_518_4 = Vector3.New(0, 0, 10) + Vector3.New(var_518_3.x, var_518_3.y, 0)
				local var_518_5 = arg_515_1.bgs_.STblack

				var_518_5.transform.localPosition = var_518_4
				var_518_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_518_6 = var_518_5:GetComponent("SpriteRenderer")

				if var_518_6 and var_518_6.sprite then
					local var_518_7 = (var_518_5.transform.localPosition - var_518_3).z
					local var_518_8 = manager.ui.mainCameraCom_
					local var_518_9 = 2 * var_518_7 * Mathf.Tan(var_518_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_518_10 = var_518_9 * var_518_8.aspect
					local var_518_11 = var_518_6.sprite.bounds.size.x
					local var_518_12 = var_518_6.sprite.bounds.size.y
					local var_518_13 = var_518_10 / var_518_11
					local var_518_14 = var_518_9 / var_518_12
					local var_518_15 = var_518_14 < var_518_13 and var_518_13 or var_518_14

					var_518_5.transform.localScale = Vector3.New(var_518_15, var_518_15, 0)
				end

				for iter_518_0, iter_518_1 in pairs(arg_515_1.bgs_) do
					if iter_518_0 ~= "STblack" then
						iter_518_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_518_16 = arg_515_1.actors_["1094ui_story"].transform
			local var_518_17 = 0

			if var_518_17 < arg_515_1.time_ and arg_515_1.time_ <= var_518_17 + arg_518_0 then
				arg_515_1.var_.moveOldPos1094ui_story = var_518_16.localPosition
			end

			local var_518_18 = 0.001

			if var_518_17 <= arg_515_1.time_ and arg_515_1.time_ < var_518_17 + var_518_18 then
				local var_518_19 = (arg_515_1.time_ - var_518_17) / var_518_18
				local var_518_20 = Vector3.New(0, 100, 0)

				var_518_16.localPosition = Vector3.Lerp(arg_515_1.var_.moveOldPos1094ui_story, var_518_20, var_518_19)

				local var_518_21 = manager.ui.mainCamera.transform.position - var_518_16.position

				var_518_16.forward = Vector3.New(var_518_21.x, var_518_21.y, var_518_21.z)

				local var_518_22 = var_518_16.localEulerAngles

				var_518_22.z = 0
				var_518_22.x = 0
				var_518_16.localEulerAngles = var_518_22
			end

			if arg_515_1.time_ >= var_518_17 + var_518_18 and arg_515_1.time_ < var_518_17 + var_518_18 + arg_518_0 then
				var_518_16.localPosition = Vector3.New(0, 100, 0)

				local var_518_23 = manager.ui.mainCamera.transform.position - var_518_16.position

				var_518_16.forward = Vector3.New(var_518_23.x, var_518_23.y, var_518_23.z)

				local var_518_24 = var_518_16.localEulerAngles

				var_518_24.z = 0
				var_518_24.x = 0
				var_518_16.localEulerAngles = var_518_24
			end

			local var_518_25 = arg_515_1.actors_["1094ui_story"]
			local var_518_26 = 0

			if var_518_26 < arg_515_1.time_ and arg_515_1.time_ <= var_518_26 + arg_518_0 and arg_515_1.var_.characterEffect1094ui_story == nil then
				arg_515_1.var_.characterEffect1094ui_story = var_518_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_27 = 0.200000002980232

			if var_518_26 <= arg_515_1.time_ and arg_515_1.time_ < var_518_26 + var_518_27 then
				local var_518_28 = (arg_515_1.time_ - var_518_26) / var_518_27

				if arg_515_1.var_.characterEffect1094ui_story then
					local var_518_29 = Mathf.Lerp(0, 0.5, var_518_28)

					arg_515_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_515_1.var_.characterEffect1094ui_story.fillRatio = var_518_29
				end
			end

			if arg_515_1.time_ >= var_518_26 + var_518_27 and arg_515_1.time_ < var_518_26 + var_518_27 + arg_518_0 and arg_515_1.var_.characterEffect1094ui_story then
				local var_518_30 = 0.5

				arg_515_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_515_1.var_.characterEffect1094ui_story.fillRatio = var_518_30
			end

			local var_518_31 = 0

			if var_518_31 < arg_515_1.time_ and arg_515_1.time_ <= var_518_31 + arg_518_0 then
				arg_515_1.mask_.enabled = true
				arg_515_1.mask_.raycastTarget = true

				arg_515_1:SetGaussion(false)
			end

			local var_518_32 = 2

			if var_518_31 <= arg_515_1.time_ and arg_515_1.time_ < var_518_31 + var_518_32 then
				local var_518_33 = (arg_515_1.time_ - var_518_31) / var_518_32
				local var_518_34 = Color.New(0, 0, 0)

				var_518_34.a = Mathf.Lerp(1, 0, var_518_33)
				arg_515_1.mask_.color = var_518_34
			end

			if arg_515_1.time_ >= var_518_31 + var_518_32 and arg_515_1.time_ < var_518_31 + var_518_32 + arg_518_0 then
				local var_518_35 = Color.New(0, 0, 0)
				local var_518_36 = 0

				arg_515_1.mask_.enabled = false
				var_518_35.a = var_518_36
				arg_515_1.mask_.color = var_518_35
			end

			if arg_515_1.frameCnt_ <= 1 then
				arg_515_1.dialog_:SetActive(false)
			end

			local var_518_37 = 2
			local var_518_38 = 0.65

			if var_518_37 < arg_515_1.time_ and arg_515_1.time_ <= var_518_37 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0

				arg_515_1.dialog_:SetActive(true)

				local var_518_39 = LeanTween.value(arg_515_1.dialog_, 0, 1, 0.3)

				var_518_39:setOnUpdate(LuaHelper.FloatAction(function(arg_519_0)
					arg_515_1.dialogCg_.alpha = arg_519_0
				end))
				var_518_39:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_515_1.dialog_)
					var_518_39:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_515_1.duration_ = arg_515_1.duration_ + 0.3

				SetActive(arg_515_1.leftNameGo_, false)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_40 = arg_515_1:GetWordFromCfg(1109402126)
				local var_518_41 = arg_515_1:FormatText(var_518_40.content)

				arg_515_1.text_.text = var_518_41

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_42 = 26
				local var_518_43 = utf8.len(var_518_41)
				local var_518_44 = var_518_42 <= 0 and var_518_38 or var_518_38 * (var_518_43 / var_518_42)

				if var_518_44 > 0 and var_518_38 < var_518_44 then
					arg_515_1.talkMaxDuration = var_518_44
					var_518_37 = var_518_37 + 0.3

					if var_518_44 + var_518_37 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_44 + var_518_37
					end
				end

				arg_515_1.text_.text = var_518_41
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)
				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_45 = var_518_37 + 0.3
			local var_518_46 = math.max(var_518_38, arg_515_1.talkMaxDuration)

			if var_518_45 <= arg_515_1.time_ and arg_515_1.time_ < var_518_45 + var_518_46 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_45) / var_518_46

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_45 + var_518_46 and arg_515_1.time_ < var_518_45 + var_518_46 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402127 = function(arg_521_0, arg_521_1)
		arg_521_1.time_ = 0
		arg_521_1.frameCnt_ = 0
		arg_521_1.state_ = "playing"
		arg_521_1.curTalkId_ = 1109402127
		arg_521_1.duration_ = 5

		SetActive(arg_521_1.tipsGo_, false)

		function arg_521_1.onSingleLineFinish_()
			arg_521_1.onSingleLineUpdate_ = nil
			arg_521_1.onSingleLineFinish_ = nil
			arg_521_1.state_ = "waiting"
		end

		function arg_521_1.playNext_(arg_523_0)
			if arg_523_0 == 1 then
				arg_521_0:Play1109402128(arg_521_1)
			end
		end

		function arg_521_1.onSingleLineUpdate_(arg_524_0)
			local var_524_0 = 0
			local var_524_1 = 0.65

			if var_524_0 < arg_521_1.time_ and arg_521_1.time_ <= var_524_0 + arg_524_0 then
				arg_521_1.talkMaxDuration = 0
				arg_521_1.dialogCg_.alpha = 1

				arg_521_1.dialog_:SetActive(true)
				SetActive(arg_521_1.leftNameGo_, false)

				arg_521_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_521_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_521_1:RecordName(arg_521_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_521_1.iconTrs_.gameObject, false)
				arg_521_1.callingController_:SetSelectedState("normal")

				local var_524_2 = arg_521_1:GetWordFromCfg(1109402127)
				local var_524_3 = arg_521_1:FormatText(var_524_2.content)

				arg_521_1.text_.text = var_524_3

				LuaForUtil.ClearLinePrefixSymbol(arg_521_1.text_)

				local var_524_4 = 26
				local var_524_5 = utf8.len(var_524_3)
				local var_524_6 = var_524_4 <= 0 and var_524_1 or var_524_1 * (var_524_5 / var_524_4)

				if var_524_6 > 0 and var_524_1 < var_524_6 then
					arg_521_1.talkMaxDuration = var_524_6

					if var_524_6 + var_524_0 > arg_521_1.duration_ then
						arg_521_1.duration_ = var_524_6 + var_524_0
					end
				end

				arg_521_1.text_.text = var_524_3
				arg_521_1.typewritter.percent = 0

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(false)
				arg_521_1:RecordContent(arg_521_1.text_.text)
			end

			local var_524_7 = math.max(var_524_1, arg_521_1.talkMaxDuration)

			if var_524_0 <= arg_521_1.time_ and arg_521_1.time_ < var_524_0 + var_524_7 then
				arg_521_1.typewritter.percent = (arg_521_1.time_ - var_524_0) / var_524_7

				arg_521_1.typewritter:SetDirty()
			end

			if arg_521_1.time_ >= var_524_0 + var_524_7 and arg_521_1.time_ < var_524_0 + var_524_7 + arg_524_0 then
				arg_521_1.typewritter.percent = 1

				arg_521_1.typewritter:SetDirty()
				arg_521_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402128 = function(arg_525_0, arg_525_1)
		arg_525_1.time_ = 0
		arg_525_1.frameCnt_ = 0
		arg_525_1.state_ = "playing"
		arg_525_1.curTalkId_ = 1109402128
		arg_525_1.duration_ = 5

		SetActive(arg_525_1.tipsGo_, false)

		function arg_525_1.onSingleLineFinish_()
			arg_525_1.onSingleLineUpdate_ = nil
			arg_525_1.onSingleLineFinish_ = nil
			arg_525_1.state_ = "waiting"
		end

		function arg_525_1.playNext_(arg_527_0)
			if arg_527_0 == 1 then
				arg_525_0:Play1109402129(arg_525_1)
			end
		end

		function arg_525_1.onSingleLineUpdate_(arg_528_0)
			local var_528_0 = 0
			local var_528_1 = 0.675

			if var_528_0 < arg_525_1.time_ and arg_525_1.time_ <= var_528_0 + arg_528_0 then
				arg_525_1.talkMaxDuration = 0
				arg_525_1.dialogCg_.alpha = 1

				arg_525_1.dialog_:SetActive(true)
				SetActive(arg_525_1.leftNameGo_, false)

				arg_525_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_525_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_525_1:RecordName(arg_525_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_525_1.iconTrs_.gameObject, false)
				arg_525_1.callingController_:SetSelectedState("normal")

				local var_528_2 = arg_525_1:GetWordFromCfg(1109402128)
				local var_528_3 = arg_525_1:FormatText(var_528_2.content)

				arg_525_1.text_.text = var_528_3

				LuaForUtil.ClearLinePrefixSymbol(arg_525_1.text_)

				local var_528_4 = 27
				local var_528_5 = utf8.len(var_528_3)
				local var_528_6 = var_528_4 <= 0 and var_528_1 or var_528_1 * (var_528_5 / var_528_4)

				if var_528_6 > 0 and var_528_1 < var_528_6 then
					arg_525_1.talkMaxDuration = var_528_6

					if var_528_6 + var_528_0 > arg_525_1.duration_ then
						arg_525_1.duration_ = var_528_6 + var_528_0
					end
				end

				arg_525_1.text_.text = var_528_3
				arg_525_1.typewritter.percent = 0

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(false)
				arg_525_1:RecordContent(arg_525_1.text_.text)
			end

			local var_528_7 = math.max(var_528_1, arg_525_1.talkMaxDuration)

			if var_528_0 <= arg_525_1.time_ and arg_525_1.time_ < var_528_0 + var_528_7 then
				arg_525_1.typewritter.percent = (arg_525_1.time_ - var_528_0) / var_528_7

				arg_525_1.typewritter:SetDirty()
			end

			if arg_525_1.time_ >= var_528_0 + var_528_7 and arg_525_1.time_ < var_528_0 + var_528_7 + arg_528_0 then
				arg_525_1.typewritter.percent = 1

				arg_525_1.typewritter:SetDirty()
				arg_525_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402129 = function(arg_529_0, arg_529_1)
		arg_529_1.time_ = 0
		arg_529_1.frameCnt_ = 0
		arg_529_1.state_ = "playing"
		arg_529_1.curTalkId_ = 1109402129
		arg_529_1.duration_ = 7

		SetActive(arg_529_1.tipsGo_, false)

		function arg_529_1.onSingleLineFinish_()
			arg_529_1.onSingleLineUpdate_ = nil
			arg_529_1.onSingleLineFinish_ = nil
			arg_529_1.state_ = "waiting"
		end

		function arg_529_1.playNext_(arg_531_0)
			if arg_531_0 == 1 then
				arg_529_0:Play1109402130(arg_529_1)
			end
		end

		function arg_529_1.onSingleLineUpdate_(arg_532_0)
			local var_532_0 = "ST03a"

			if arg_529_1.bgs_[var_532_0] == nil then
				local var_532_1 = Object.Instantiate(arg_529_1.paintGo_)

				var_532_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_532_0)
				var_532_1.name = var_532_0
				var_532_1.transform.parent = arg_529_1.stage_.transform
				var_532_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_529_1.bgs_[var_532_0] = var_532_1
			end

			local var_532_2 = 0

			if var_532_2 < arg_529_1.time_ and arg_529_1.time_ <= var_532_2 + arg_532_0 then
				if arg_529_0.sceneSettingEffect_ then
					arg_529_1.sceneSettingEffect_.enabled = false
				end

				arg_529_1.sceneSettingGo_:SetActive(true)

				local var_532_3 = manager.ui.mainCamera.transform.localPosition
				local var_532_4 = Vector3.New(0, 0, 10) + Vector3.New(var_532_3.x, var_532_3.y, 0)
				local var_532_5 = arg_529_1.bgs_.ST03a

				var_532_5.transform.localPosition = var_532_4
				var_532_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_532_6 = var_532_5:GetComponent("SpriteRenderer")

				if var_532_6 and var_532_6.sprite then
					local var_532_7 = (var_532_5.transform.localPosition - var_532_3).z
					local var_532_8 = manager.ui.mainCameraCom_
					local var_532_9 = 2 * var_532_7 * Mathf.Tan(var_532_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_532_10 = var_532_9 * var_532_8.aspect
					local var_532_11 = var_532_6.sprite.bounds.size.x
					local var_532_12 = var_532_6.sprite.bounds.size.y
					local var_532_13 = var_532_10 / var_532_11
					local var_532_14 = var_532_9 / var_532_12
					local var_532_15 = var_532_14 < var_532_13 and var_532_13 or var_532_14

					var_532_5.transform.localScale = Vector3.New(var_532_15, var_532_15, 0)
				end

				for iter_532_0, iter_532_1 in pairs(arg_529_1.bgs_) do
					if iter_532_0 ~= "ST03a" then
						iter_532_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_532_16 = 0

			if var_532_16 < arg_529_1.time_ and arg_529_1.time_ <= var_532_16 + arg_532_0 then
				arg_529_1.mask_.enabled = true
				arg_529_1.mask_.raycastTarget = true

				arg_529_1:SetGaussion(false)
			end

			local var_532_17 = 2

			if var_532_16 <= arg_529_1.time_ and arg_529_1.time_ < var_532_16 + var_532_17 then
				local var_532_18 = (arg_529_1.time_ - var_532_16) / var_532_17
				local var_532_19 = Color.New(0, 0, 0)

				var_532_19.a = Mathf.Lerp(1, 0, var_532_18)
				arg_529_1.mask_.color = var_532_19
			end

			if arg_529_1.time_ >= var_532_16 + var_532_17 and arg_529_1.time_ < var_532_16 + var_532_17 + arg_532_0 then
				local var_532_20 = Color.New(0, 0, 0)
				local var_532_21 = 0

				arg_529_1.mask_.enabled = false
				var_532_20.a = var_532_21
				arg_529_1.mask_.color = var_532_20
			end

			if arg_529_1.frameCnt_ <= 1 then
				arg_529_1.dialog_:SetActive(false)
			end

			local var_532_22 = 2
			local var_532_23 = 0.75

			if var_532_22 < arg_529_1.time_ and arg_529_1.time_ <= var_532_22 + arg_532_0 then
				arg_529_1.talkMaxDuration = 0

				arg_529_1.dialog_:SetActive(true)

				local var_532_24 = LeanTween.value(arg_529_1.dialog_, 0, 1, 0.3)

				var_532_24:setOnUpdate(LuaHelper.FloatAction(function(arg_533_0)
					arg_529_1.dialogCg_.alpha = arg_533_0
				end))
				var_532_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_529_1.dialog_)
					var_532_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_529_1.duration_ = arg_529_1.duration_ + 0.3

				SetActive(arg_529_1.leftNameGo_, false)

				arg_529_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_529_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_529_1:RecordName(arg_529_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_529_1.iconTrs_.gameObject, false)
				arg_529_1.callingController_:SetSelectedState("normal")

				local var_532_25 = arg_529_1:GetWordFromCfg(1109402129)
				local var_532_26 = arg_529_1:FormatText(var_532_25.content)

				arg_529_1.text_.text = var_532_26

				LuaForUtil.ClearLinePrefixSymbol(arg_529_1.text_)

				local var_532_27 = 30
				local var_532_28 = utf8.len(var_532_26)
				local var_532_29 = var_532_27 <= 0 and var_532_23 or var_532_23 * (var_532_28 / var_532_27)

				if var_532_29 > 0 and var_532_23 < var_532_29 then
					arg_529_1.talkMaxDuration = var_532_29
					var_532_22 = var_532_22 + 0.3

					if var_532_29 + var_532_22 > arg_529_1.duration_ then
						arg_529_1.duration_ = var_532_29 + var_532_22
					end
				end

				arg_529_1.text_.text = var_532_26
				arg_529_1.typewritter.percent = 0

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(false)
				arg_529_1:RecordContent(arg_529_1.text_.text)
			end

			local var_532_30 = var_532_22 + 0.3
			local var_532_31 = math.max(var_532_23, arg_529_1.talkMaxDuration)

			if var_532_30 <= arg_529_1.time_ and arg_529_1.time_ < var_532_30 + var_532_31 then
				arg_529_1.typewritter.percent = (arg_529_1.time_ - var_532_30) / var_532_31

				arg_529_1.typewritter:SetDirty()
			end

			if arg_529_1.time_ >= var_532_30 + var_532_31 and arg_529_1.time_ < var_532_30 + var_532_31 + arg_532_0 then
				arg_529_1.typewritter.percent = 1

				arg_529_1.typewritter:SetDirty()
				arg_529_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402130 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 1109402130
		arg_535_1.duration_ = 5

		SetActive(arg_535_1.tipsGo_, false)

		function arg_535_1.onSingleLineFinish_()
			arg_535_1.onSingleLineUpdate_ = nil
			arg_535_1.onSingleLineFinish_ = nil
			arg_535_1.state_ = "waiting"
		end

		function arg_535_1.playNext_(arg_537_0)
			if arg_537_0 == 1 then
				arg_535_0:Play1109402131(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = 0
			local var_538_1 = 0.7

			if var_538_0 < arg_535_1.time_ and arg_535_1.time_ <= var_538_0 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, false)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_2 = arg_535_1:GetWordFromCfg(1109402130)
				local var_538_3 = arg_535_1:FormatText(var_538_2.content)

				arg_535_1.text_.text = var_538_3

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_4 = 28
				local var_538_5 = utf8.len(var_538_3)
				local var_538_6 = var_538_4 <= 0 and var_538_1 or var_538_1 * (var_538_5 / var_538_4)

				if var_538_6 > 0 and var_538_1 < var_538_6 then
					arg_535_1.talkMaxDuration = var_538_6

					if var_538_6 + var_538_0 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_6 + var_538_0
					end
				end

				arg_535_1.text_.text = var_538_3
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)
				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_7 = math.max(var_538_1, arg_535_1.talkMaxDuration)

			if var_538_0 <= arg_535_1.time_ and arg_535_1.time_ < var_538_0 + var_538_7 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_0) / var_538_7

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_0 + var_538_7 and arg_535_1.time_ < var_538_0 + var_538_7 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402131 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 1109402131
		arg_539_1.duration_ = 6.733

		local var_539_0 = {
			ja = 6.733,
			ko = 5.666,
			zh = 5.666
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
				arg_539_0:Play1109402132(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 0.625

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_2 = arg_539_1:FormatText(StoryNameCfg[189].name)

				arg_539_1.leftNameTxt_.text = var_542_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, true)
				arg_539_1.iconController_:SetSelectedState("hero")

				arg_539_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_3 = arg_539_1:GetWordFromCfg(1109402131)
				local var_542_4 = arg_539_1:FormatText(var_542_3.content)

				arg_539_1.text_.text = var_542_4

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402131", "story_v_side_new_1109402.awb") ~= 0 then
					local var_542_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402131", "story_v_side_new_1109402.awb") / 1000

					if var_542_8 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_8 + var_542_0
					end

					if var_542_3.prefab_name ~= "" and arg_539_1.actors_[var_542_3.prefab_name] ~= nil then
						local var_542_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_3.prefab_name].transform, "story_v_side_new_1109402", "1109402131", "story_v_side_new_1109402.awb")

						arg_539_1:RecordAudio("1109402131", var_542_9)
						arg_539_1:RecordAudio("1109402131", var_542_9)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402131", "story_v_side_new_1109402.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402131", "story_v_side_new_1109402.awb")
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
	Play1109402132 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 1109402132
		arg_543_1.duration_ = 5

		SetActive(arg_543_1.tipsGo_, false)

		function arg_543_1.onSingleLineFinish_()
			arg_543_1.onSingleLineUpdate_ = nil
			arg_543_1.onSingleLineFinish_ = nil
			arg_543_1.state_ = "waiting"
		end

		function arg_543_1.playNext_(arg_545_0)
			if arg_545_0 == 1 then
				arg_543_0:Play1109402133(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0
			local var_546_1 = 0.875

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_2 = arg_543_1:FormatText(StoryNameCfg[7].name)

				arg_543_1.leftNameTxt_.text = var_546_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_3 = arg_543_1:GetWordFromCfg(1109402132)
				local var_546_4 = arg_543_1:FormatText(var_546_3.content)

				arg_543_1.text_.text = var_546_4

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_5 = 35
				local var_546_6 = utf8.len(var_546_4)
				local var_546_7 = var_546_5 <= 0 and var_546_1 or var_546_1 * (var_546_6 / var_546_5)

				if var_546_7 > 0 and var_546_1 < var_546_7 then
					arg_543_1.talkMaxDuration = var_546_7

					if var_546_7 + var_546_0 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_7 + var_546_0
					end
				end

				arg_543_1.text_.text = var_546_4
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)
				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_8 = math.max(var_546_1, arg_543_1.talkMaxDuration)

			if var_546_0 <= arg_543_1.time_ and arg_543_1.time_ < var_546_0 + var_546_8 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_0) / var_546_8

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_0 + var_546_8 and arg_543_1.time_ < var_546_0 + var_546_8 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402133 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 1109402133
		arg_547_1.duration_ = 5

		SetActive(arg_547_1.tipsGo_, false)

		function arg_547_1.onSingleLineFinish_()
			arg_547_1.onSingleLineUpdate_ = nil
			arg_547_1.onSingleLineFinish_ = nil
			arg_547_1.state_ = "waiting"
		end

		function arg_547_1.playNext_(arg_549_0)
			if arg_549_0 == 1 then
				arg_547_0:Play1109402134(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = 0
			local var_550_1 = 0.7

			if var_550_0 < arg_547_1.time_ and arg_547_1.time_ <= var_550_0 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_2 = arg_547_1:FormatText(StoryNameCfg[7].name)

				arg_547_1.leftNameTxt_.text = var_550_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_3 = arg_547_1:GetWordFromCfg(1109402133)
				local var_550_4 = arg_547_1:FormatText(var_550_3.content)

				arg_547_1.text_.text = var_550_4

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_5 = 28
				local var_550_6 = utf8.len(var_550_4)
				local var_550_7 = var_550_5 <= 0 and var_550_1 or var_550_1 * (var_550_6 / var_550_5)

				if var_550_7 > 0 and var_550_1 < var_550_7 then
					arg_547_1.talkMaxDuration = var_550_7

					if var_550_7 + var_550_0 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_7 + var_550_0
					end
				end

				arg_547_1.text_.text = var_550_4
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)
				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_8 = math.max(var_550_1, arg_547_1.talkMaxDuration)

			if var_550_0 <= arg_547_1.time_ and arg_547_1.time_ < var_550_0 + var_550_8 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_0) / var_550_8

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_0 + var_550_8 and arg_547_1.time_ < var_550_0 + var_550_8 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402134 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 1109402134
		arg_551_1.duration_ = 3.166

		local var_551_0 = {
			ja = 3.166,
			ko = 1.233,
			zh = 1.233
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
				arg_551_0:Play1109402135(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1094ui_story"].transform
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 then
				arg_551_1.var_.moveOldPos1094ui_story = var_554_0.localPosition
			end

			local var_554_2 = 0.001

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2
				local var_554_4 = Vector3.New(0, -0.84, -6.1)

				var_554_0.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1094ui_story, var_554_4, var_554_3)

				local var_554_5 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_5.x, var_554_5.y, var_554_5.z)

				local var_554_6 = var_554_0.localEulerAngles

				var_554_6.z = 0
				var_554_6.x = 0
				var_554_0.localEulerAngles = var_554_6
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 then
				var_554_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_554_7 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_7.x, var_554_7.y, var_554_7.z)

				local var_554_8 = var_554_0.localEulerAngles

				var_554_8.z = 0
				var_554_8.x = 0
				var_554_0.localEulerAngles = var_554_8
			end

			local var_554_9 = arg_551_1.actors_["1094ui_story"]
			local var_554_10 = 0

			if var_554_10 < arg_551_1.time_ and arg_551_1.time_ <= var_554_10 + arg_554_0 and arg_551_1.var_.characterEffect1094ui_story == nil then
				arg_551_1.var_.characterEffect1094ui_story = var_554_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_554_11 = 0.200000002980232

			if var_554_10 <= arg_551_1.time_ and arg_551_1.time_ < var_554_10 + var_554_11 then
				local var_554_12 = (arg_551_1.time_ - var_554_10) / var_554_11

				if arg_551_1.var_.characterEffect1094ui_story then
					arg_551_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_551_1.time_ >= var_554_10 + var_554_11 and arg_551_1.time_ < var_554_10 + var_554_11 + arg_554_0 and arg_551_1.var_.characterEffect1094ui_story then
				arg_551_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_554_13 = 0

			if var_554_13 < arg_551_1.time_ and arg_551_1.time_ <= var_554_13 + arg_554_0 then
				arg_551_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_554_14 = 0

			if var_554_14 < arg_551_1.time_ and arg_551_1.time_ <= var_554_14 + arg_554_0 then
				arg_551_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_554_15 = 0
			local var_554_16 = 0.075

			if var_554_15 < arg_551_1.time_ and arg_551_1.time_ <= var_554_15 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_17 = arg_551_1:FormatText(StoryNameCfg[181].name)

				arg_551_1.leftNameTxt_.text = var_554_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_18 = arg_551_1:GetWordFromCfg(1109402134)
				local var_554_19 = arg_551_1:FormatText(var_554_18.content)

				arg_551_1.text_.text = var_554_19

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_20 = 3
				local var_554_21 = utf8.len(var_554_19)
				local var_554_22 = var_554_20 <= 0 and var_554_16 or var_554_16 * (var_554_21 / var_554_20)

				if var_554_22 > 0 and var_554_16 < var_554_22 then
					arg_551_1.talkMaxDuration = var_554_22

					if var_554_22 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_22 + var_554_15
					end
				end

				arg_551_1.text_.text = var_554_19
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402134", "story_v_side_new_1109402.awb") ~= 0 then
					local var_554_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402134", "story_v_side_new_1109402.awb") / 1000

					if var_554_23 + var_554_15 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_23 + var_554_15
					end

					if var_554_18.prefab_name ~= "" and arg_551_1.actors_[var_554_18.prefab_name] ~= nil then
						local var_554_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_18.prefab_name].transform, "story_v_side_new_1109402", "1109402134", "story_v_side_new_1109402.awb")

						arg_551_1:RecordAudio("1109402134", var_554_24)
						arg_551_1:RecordAudio("1109402134", var_554_24)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402134", "story_v_side_new_1109402.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402134", "story_v_side_new_1109402.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_25 = math.max(var_554_16, arg_551_1.talkMaxDuration)

			if var_554_15 <= arg_551_1.time_ and arg_551_1.time_ < var_554_15 + var_554_25 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_15) / var_554_25

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_15 + var_554_25 and arg_551_1.time_ < var_554_15 + var_554_25 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402135 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 1109402135
		arg_555_1.duration_ = 5

		SetActive(arg_555_1.tipsGo_, false)

		function arg_555_1.onSingleLineFinish_()
			arg_555_1.onSingleLineUpdate_ = nil
			arg_555_1.onSingleLineFinish_ = nil
			arg_555_1.state_ = "waiting"
		end

		function arg_555_1.playNext_(arg_557_0)
			if arg_557_0 == 1 then
				arg_555_0:Play1109402136(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1094ui_story"]
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 and arg_555_1.var_.characterEffect1094ui_story == nil then
				arg_555_1.var_.characterEffect1094ui_story = var_558_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_2 = 0.200000002980232

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2

				if arg_555_1.var_.characterEffect1094ui_story then
					local var_558_4 = Mathf.Lerp(0, 0.5, var_558_3)

					arg_555_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_555_1.var_.characterEffect1094ui_story.fillRatio = var_558_4
				end
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 and arg_555_1.var_.characterEffect1094ui_story then
				local var_558_5 = 0.5

				arg_555_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_555_1.var_.characterEffect1094ui_story.fillRatio = var_558_5
			end

			local var_558_6 = 0
			local var_558_7 = 0.625

			if var_558_6 < arg_555_1.time_ and arg_555_1.time_ <= var_558_6 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_8 = arg_555_1:FormatText(StoryNameCfg[7].name)

				arg_555_1.leftNameTxt_.text = var_558_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_9 = arg_555_1:GetWordFromCfg(1109402135)
				local var_558_10 = arg_555_1:FormatText(var_558_9.content)

				arg_555_1.text_.text = var_558_10

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_11 = 25
				local var_558_12 = utf8.len(var_558_10)
				local var_558_13 = var_558_11 <= 0 and var_558_7 or var_558_7 * (var_558_12 / var_558_11)

				if var_558_13 > 0 and var_558_7 < var_558_13 then
					arg_555_1.talkMaxDuration = var_558_13

					if var_558_13 + var_558_6 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_13 + var_558_6
					end
				end

				arg_555_1.text_.text = var_558_10
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)
				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_14 = math.max(var_558_7, arg_555_1.talkMaxDuration)

			if var_558_6 <= arg_555_1.time_ and arg_555_1.time_ < var_558_6 + var_558_14 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_6) / var_558_14

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_6 + var_558_14 and arg_555_1.time_ < var_558_6 + var_558_14 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402136 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 1109402136
		arg_559_1.duration_ = 5.2

		local var_559_0 = {
			ja = 5.2,
			ko = 3.433,
			zh = 3.433
		}
		local var_559_1 = manager.audio:GetLocalizationFlag()

		if var_559_0[var_559_1] ~= nil then
			arg_559_1.duration_ = var_559_0[var_559_1]
		end

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play1109402137(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1094ui_story"].transform
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 then
				arg_559_1.var_.moveOldPos1094ui_story = var_562_0.localPosition
			end

			local var_562_2 = 0.001

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2
				local var_562_4 = Vector3.New(0, -0.84, -6.1)

				var_562_0.localPosition = Vector3.Lerp(arg_559_1.var_.moveOldPos1094ui_story, var_562_4, var_562_3)

				local var_562_5 = manager.ui.mainCamera.transform.position - var_562_0.position

				var_562_0.forward = Vector3.New(var_562_5.x, var_562_5.y, var_562_5.z)

				local var_562_6 = var_562_0.localEulerAngles

				var_562_6.z = 0
				var_562_6.x = 0
				var_562_0.localEulerAngles = var_562_6
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 then
				var_562_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_562_7 = manager.ui.mainCamera.transform.position - var_562_0.position

				var_562_0.forward = Vector3.New(var_562_7.x, var_562_7.y, var_562_7.z)

				local var_562_8 = var_562_0.localEulerAngles

				var_562_8.z = 0
				var_562_8.x = 0
				var_562_0.localEulerAngles = var_562_8
			end

			local var_562_9 = arg_559_1.actors_["1094ui_story"]
			local var_562_10 = 0

			if var_562_10 < arg_559_1.time_ and arg_559_1.time_ <= var_562_10 + arg_562_0 and arg_559_1.var_.characterEffect1094ui_story == nil then
				arg_559_1.var_.characterEffect1094ui_story = var_562_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_11 = 0.200000002980232

			if var_562_10 <= arg_559_1.time_ and arg_559_1.time_ < var_562_10 + var_562_11 then
				local var_562_12 = (arg_559_1.time_ - var_562_10) / var_562_11

				if arg_559_1.var_.characterEffect1094ui_story then
					arg_559_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_559_1.time_ >= var_562_10 + var_562_11 and arg_559_1.time_ < var_562_10 + var_562_11 + arg_562_0 and arg_559_1.var_.characterEffect1094ui_story then
				arg_559_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_562_13 = 0

			if var_562_13 < arg_559_1.time_ and arg_559_1.time_ <= var_562_13 + arg_562_0 then
				arg_559_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_562_14 = 0
			local var_562_15 = 0.3

			if var_562_14 < arg_559_1.time_ and arg_559_1.time_ <= var_562_14 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_16 = arg_559_1:FormatText(StoryNameCfg[181].name)

				arg_559_1.leftNameTxt_.text = var_562_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_17 = arg_559_1:GetWordFromCfg(1109402136)
				local var_562_18 = arg_559_1:FormatText(var_562_17.content)

				arg_559_1.text_.text = var_562_18

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_19 = 12
				local var_562_20 = utf8.len(var_562_18)
				local var_562_21 = var_562_19 <= 0 and var_562_15 or var_562_15 * (var_562_20 / var_562_19)

				if var_562_21 > 0 and var_562_15 < var_562_21 then
					arg_559_1.talkMaxDuration = var_562_21

					if var_562_21 + var_562_14 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_21 + var_562_14
					end
				end

				arg_559_1.text_.text = var_562_18
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402136", "story_v_side_new_1109402.awb") ~= 0 then
					local var_562_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402136", "story_v_side_new_1109402.awb") / 1000

					if var_562_22 + var_562_14 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_22 + var_562_14
					end

					if var_562_17.prefab_name ~= "" and arg_559_1.actors_[var_562_17.prefab_name] ~= nil then
						local var_562_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_17.prefab_name].transform, "story_v_side_new_1109402", "1109402136", "story_v_side_new_1109402.awb")

						arg_559_1:RecordAudio("1109402136", var_562_23)
						arg_559_1:RecordAudio("1109402136", var_562_23)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402136", "story_v_side_new_1109402.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402136", "story_v_side_new_1109402.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_24 = math.max(var_562_15, arg_559_1.talkMaxDuration)

			if var_562_14 <= arg_559_1.time_ and arg_559_1.time_ < var_562_14 + var_562_24 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_14) / var_562_24

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_14 + var_562_24 and arg_559_1.time_ < var_562_14 + var_562_24 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402137 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 1109402137
		arg_563_1.duration_ = 5

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play1109402138(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1094ui_story"]
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 and arg_563_1.var_.characterEffect1094ui_story == nil then
				arg_563_1.var_.characterEffect1094ui_story = var_566_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_2 = 0.200000002980232

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2

				if arg_563_1.var_.characterEffect1094ui_story then
					local var_566_4 = Mathf.Lerp(0, 0.5, var_566_3)

					arg_563_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_563_1.var_.characterEffect1094ui_story.fillRatio = var_566_4
				end
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 and arg_563_1.var_.characterEffect1094ui_story then
				local var_566_5 = 0.5

				arg_563_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_563_1.var_.characterEffect1094ui_story.fillRatio = var_566_5
			end

			local var_566_6 = 0
			local var_566_7 = 0.425

			if var_566_6 < arg_563_1.time_ and arg_563_1.time_ <= var_566_6 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_8 = arg_563_1:FormatText(StoryNameCfg[7].name)

				arg_563_1.leftNameTxt_.text = var_566_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_9 = arg_563_1:GetWordFromCfg(1109402137)
				local var_566_10 = arg_563_1:FormatText(var_566_9.content)

				arg_563_1.text_.text = var_566_10

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_11 = 17
				local var_566_12 = utf8.len(var_566_10)
				local var_566_13 = var_566_11 <= 0 and var_566_7 or var_566_7 * (var_566_12 / var_566_11)

				if var_566_13 > 0 and var_566_7 < var_566_13 then
					arg_563_1.talkMaxDuration = var_566_13

					if var_566_13 + var_566_6 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_13 + var_566_6
					end
				end

				arg_563_1.text_.text = var_566_10
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_14 = math.max(var_566_7, arg_563_1.talkMaxDuration)

			if var_566_6 <= arg_563_1.time_ and arg_563_1.time_ < var_566_6 + var_566_14 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_6) / var_566_14

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_6 + var_566_14 and arg_563_1.time_ < var_566_6 + var_566_14 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402138 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 1109402138
		arg_567_1.duration_ = 1.999999999999

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play1109402139(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = arg_567_1.actors_["1094ui_story"].transform
			local var_570_1 = 0

			if var_570_1 < arg_567_1.time_ and arg_567_1.time_ <= var_570_1 + arg_570_0 then
				arg_567_1.var_.moveOldPos1094ui_story = var_570_0.localPosition
			end

			local var_570_2 = 0.001

			if var_570_1 <= arg_567_1.time_ and arg_567_1.time_ < var_570_1 + var_570_2 then
				local var_570_3 = (arg_567_1.time_ - var_570_1) / var_570_2
				local var_570_4 = Vector3.New(0, -0.84, -6.1)

				var_570_0.localPosition = Vector3.Lerp(arg_567_1.var_.moveOldPos1094ui_story, var_570_4, var_570_3)

				local var_570_5 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_5.x, var_570_5.y, var_570_5.z)

				local var_570_6 = var_570_0.localEulerAngles

				var_570_6.z = 0
				var_570_6.x = 0
				var_570_0.localEulerAngles = var_570_6
			end

			if arg_567_1.time_ >= var_570_1 + var_570_2 and arg_567_1.time_ < var_570_1 + var_570_2 + arg_570_0 then
				var_570_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_570_7 = manager.ui.mainCamera.transform.position - var_570_0.position

				var_570_0.forward = Vector3.New(var_570_7.x, var_570_7.y, var_570_7.z)

				local var_570_8 = var_570_0.localEulerAngles

				var_570_8.z = 0
				var_570_8.x = 0
				var_570_0.localEulerAngles = var_570_8
			end

			local var_570_9 = arg_567_1.actors_["1094ui_story"]
			local var_570_10 = 0

			if var_570_10 < arg_567_1.time_ and arg_567_1.time_ <= var_570_10 + arg_570_0 and arg_567_1.var_.characterEffect1094ui_story == nil then
				arg_567_1.var_.characterEffect1094ui_story = var_570_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_570_11 = 0.200000002980232

			if var_570_10 <= arg_567_1.time_ and arg_567_1.time_ < var_570_10 + var_570_11 then
				local var_570_12 = (arg_567_1.time_ - var_570_10) / var_570_11

				if arg_567_1.var_.characterEffect1094ui_story then
					arg_567_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_567_1.time_ >= var_570_10 + var_570_11 and arg_567_1.time_ < var_570_10 + var_570_11 + arg_570_0 and arg_567_1.var_.characterEffect1094ui_story then
				arg_567_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_570_13 = 0

			if var_570_13 < arg_567_1.time_ and arg_567_1.time_ <= var_570_13 + arg_570_0 then
				arg_567_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_570_14 = 0
			local var_570_15 = 0.15

			if var_570_14 < arg_567_1.time_ and arg_567_1.time_ <= var_570_14 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_16 = arg_567_1:FormatText(StoryNameCfg[181].name)

				arg_567_1.leftNameTxt_.text = var_570_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_17 = arg_567_1:GetWordFromCfg(1109402138)
				local var_570_18 = arg_567_1:FormatText(var_570_17.content)

				arg_567_1.text_.text = var_570_18

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_19 = 6
				local var_570_20 = utf8.len(var_570_18)
				local var_570_21 = var_570_19 <= 0 and var_570_15 or var_570_15 * (var_570_20 / var_570_19)

				if var_570_21 > 0 and var_570_15 < var_570_21 then
					arg_567_1.talkMaxDuration = var_570_21

					if var_570_21 + var_570_14 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_21 + var_570_14
					end
				end

				arg_567_1.text_.text = var_570_18
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402138", "story_v_side_new_1109402.awb") ~= 0 then
					local var_570_22 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402138", "story_v_side_new_1109402.awb") / 1000

					if var_570_22 + var_570_14 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_22 + var_570_14
					end

					if var_570_17.prefab_name ~= "" and arg_567_1.actors_[var_570_17.prefab_name] ~= nil then
						local var_570_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_17.prefab_name].transform, "story_v_side_new_1109402", "1109402138", "story_v_side_new_1109402.awb")

						arg_567_1:RecordAudio("1109402138", var_570_23)
						arg_567_1:RecordAudio("1109402138", var_570_23)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402138", "story_v_side_new_1109402.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402138", "story_v_side_new_1109402.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_24 = math.max(var_570_15, arg_567_1.talkMaxDuration)

			if var_570_14 <= arg_567_1.time_ and arg_567_1.time_ < var_570_14 + var_570_24 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_14) / var_570_24

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_14 + var_570_24 and arg_567_1.time_ < var_570_14 + var_570_24 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402139 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 1109402139
		arg_571_1.duration_ = 9

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play1109402140(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = "I05a"

			if arg_571_1.bgs_[var_574_0] == nil then
				local var_574_1 = Object.Instantiate(arg_571_1.paintGo_)

				var_574_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_574_0)
				var_574_1.name = var_574_0
				var_574_1.transform.parent = arg_571_1.stage_.transform
				var_574_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_571_1.bgs_[var_574_0] = var_574_1
			end

			local var_574_2 = 2

			if var_574_2 < arg_571_1.time_ and arg_571_1.time_ <= var_574_2 + arg_574_0 then
				if arg_571_0.sceneSettingEffect_ then
					arg_571_1.sceneSettingEffect_.enabled = false
				end

				arg_571_1.sceneSettingGo_:SetActive(true)

				local var_574_3 = manager.ui.mainCamera.transform.localPosition
				local var_574_4 = Vector3.New(0, 0, 10) + Vector3.New(var_574_3.x, var_574_3.y, 0)
				local var_574_5 = arg_571_1.bgs_.I05a

				var_574_5.transform.localPosition = var_574_4
				var_574_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_574_6 = var_574_5:GetComponent("SpriteRenderer")

				if var_574_6 and var_574_6.sprite then
					local var_574_7 = (var_574_5.transform.localPosition - var_574_3).z
					local var_574_8 = manager.ui.mainCameraCom_
					local var_574_9 = 2 * var_574_7 * Mathf.Tan(var_574_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_574_10 = var_574_9 * var_574_8.aspect
					local var_574_11 = var_574_6.sprite.bounds.size.x
					local var_574_12 = var_574_6.sprite.bounds.size.y
					local var_574_13 = var_574_10 / var_574_11
					local var_574_14 = var_574_9 / var_574_12
					local var_574_15 = var_574_14 < var_574_13 and var_574_13 or var_574_14

					var_574_5.transform.localScale = Vector3.New(var_574_15, var_574_15, 0)
				end

				for iter_574_0, iter_574_1 in pairs(arg_571_1.bgs_) do
					if iter_574_0 ~= "I05a" then
						iter_574_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_574_16 = 0

			if var_574_16 < arg_571_1.time_ and arg_571_1.time_ <= var_574_16 + arg_574_0 then
				arg_571_1.mask_.enabled = true
				arg_571_1.mask_.raycastTarget = true

				arg_571_1:SetGaussion(false)
			end

			local var_574_17 = 2

			if var_574_16 <= arg_571_1.time_ and arg_571_1.time_ < var_574_16 + var_574_17 then
				local var_574_18 = (arg_571_1.time_ - var_574_16) / var_574_17
				local var_574_19 = Color.New(0, 0, 0)

				var_574_19.a = Mathf.Lerp(0, 1, var_574_18)
				arg_571_1.mask_.color = var_574_19
			end

			if arg_571_1.time_ >= var_574_16 + var_574_17 and arg_571_1.time_ < var_574_16 + var_574_17 + arg_574_0 then
				local var_574_20 = Color.New(0, 0, 0)

				var_574_20.a = 1
				arg_571_1.mask_.color = var_574_20
			end

			local var_574_21 = 2

			if var_574_21 < arg_571_1.time_ and arg_571_1.time_ <= var_574_21 + arg_574_0 then
				arg_571_1.mask_.enabled = true
				arg_571_1.mask_.raycastTarget = true

				arg_571_1:SetGaussion(false)
			end

			local var_574_22 = 2

			if var_574_21 <= arg_571_1.time_ and arg_571_1.time_ < var_574_21 + var_574_22 then
				local var_574_23 = (arg_571_1.time_ - var_574_21) / var_574_22
				local var_574_24 = Color.New(0, 0, 0)

				var_574_24.a = Mathf.Lerp(1, 0, var_574_23)
				arg_571_1.mask_.color = var_574_24
			end

			if arg_571_1.time_ >= var_574_21 + var_574_22 and arg_571_1.time_ < var_574_21 + var_574_22 + arg_574_0 then
				local var_574_25 = Color.New(0, 0, 0)
				local var_574_26 = 0

				arg_571_1.mask_.enabled = false
				var_574_25.a = var_574_26
				arg_571_1.mask_.color = var_574_25
			end

			local var_574_27 = arg_571_1.actors_["1094ui_story"].transform
			local var_574_28 = 0

			if var_574_28 < arg_571_1.time_ and arg_571_1.time_ <= var_574_28 + arg_574_0 then
				arg_571_1.var_.moveOldPos1094ui_story = var_574_27.localPosition
			end

			local var_574_29 = 0.001

			if var_574_28 <= arg_571_1.time_ and arg_571_1.time_ < var_574_28 + var_574_29 then
				local var_574_30 = (arg_571_1.time_ - var_574_28) / var_574_29
				local var_574_31 = Vector3.New(0, 100, 0)

				var_574_27.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1094ui_story, var_574_31, var_574_30)

				local var_574_32 = manager.ui.mainCamera.transform.position - var_574_27.position

				var_574_27.forward = Vector3.New(var_574_32.x, var_574_32.y, var_574_32.z)

				local var_574_33 = var_574_27.localEulerAngles

				var_574_33.z = 0
				var_574_33.x = 0
				var_574_27.localEulerAngles = var_574_33
			end

			if arg_571_1.time_ >= var_574_28 + var_574_29 and arg_571_1.time_ < var_574_28 + var_574_29 + arg_574_0 then
				var_574_27.localPosition = Vector3.New(0, 100, 0)

				local var_574_34 = manager.ui.mainCamera.transform.position - var_574_27.position

				var_574_27.forward = Vector3.New(var_574_34.x, var_574_34.y, var_574_34.z)

				local var_574_35 = var_574_27.localEulerAngles

				var_574_35.z = 0
				var_574_35.x = 0
				var_574_27.localEulerAngles = var_574_35
			end

			local var_574_36 = arg_571_1.actors_["1094ui_story"]
			local var_574_37 = 0

			if var_574_37 < arg_571_1.time_ and arg_571_1.time_ <= var_574_37 + arg_574_0 and arg_571_1.var_.characterEffect1094ui_story == nil then
				arg_571_1.var_.characterEffect1094ui_story = var_574_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_574_38 = 0.200000002980232

			if var_574_37 <= arg_571_1.time_ and arg_571_1.time_ < var_574_37 + var_574_38 then
				local var_574_39 = (arg_571_1.time_ - var_574_37) / var_574_38

				if arg_571_1.var_.characterEffect1094ui_story then
					local var_574_40 = Mathf.Lerp(0, 0.5, var_574_39)

					arg_571_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_571_1.var_.characterEffect1094ui_story.fillRatio = var_574_40
				end
			end

			if arg_571_1.time_ >= var_574_37 + var_574_38 and arg_571_1.time_ < var_574_37 + var_574_38 + arg_574_0 and arg_571_1.var_.characterEffect1094ui_story then
				local var_574_41 = 0.5

				arg_571_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_571_1.var_.characterEffect1094ui_story.fillRatio = var_574_41
			end

			local var_574_42 = 4
			local var_574_43 = 1

			if var_574_42 < arg_571_1.time_ and arg_571_1.time_ <= var_574_42 + arg_574_0 then
				local var_574_44 = "play"
				local var_574_45 = "effect"

				arg_571_1:AudioAction(var_574_44, var_574_45, "se_story_side_1094", "se_story_1094_chime", "")
			end

			if arg_571_1.frameCnt_ <= 1 then
				arg_571_1.dialog_:SetActive(false)
			end

			local var_574_46 = 4
			local var_574_47 = 1

			if var_574_46 < arg_571_1.time_ and arg_571_1.time_ <= var_574_46 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0

				arg_571_1.dialog_:SetActive(true)

				local var_574_48 = LeanTween.value(arg_571_1.dialog_, 0, 1, 0.3)

				var_574_48:setOnUpdate(LuaHelper.FloatAction(function(arg_575_0)
					arg_571_1.dialogCg_.alpha = arg_575_0
				end))
				var_574_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_571_1.dialog_)
					var_574_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_571_1.duration_ = arg_571_1.duration_ + 0.3

				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_49 = arg_571_1:GetWordFromCfg(1109402139)
				local var_574_50 = arg_571_1:FormatText(var_574_49.content)

				arg_571_1.text_.text = var_574_50

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_51 = 40
				local var_574_52 = utf8.len(var_574_50)
				local var_574_53 = var_574_51 <= 0 and var_574_47 or var_574_47 * (var_574_52 / var_574_51)

				if var_574_53 > 0 and var_574_47 < var_574_53 then
					arg_571_1.talkMaxDuration = var_574_53
					var_574_46 = var_574_46 + 0.3

					if var_574_53 + var_574_46 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_53 + var_574_46
					end
				end

				arg_571_1.text_.text = var_574_50
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_54 = var_574_46 + 0.3
			local var_574_55 = math.max(var_574_47, arg_571_1.talkMaxDuration)

			if var_574_54 <= arg_571_1.time_ and arg_571_1.time_ < var_574_54 + var_574_55 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_54) / var_574_55

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_54 + var_574_55 and arg_571_1.time_ < var_574_54 + var_574_55 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402140 = function(arg_577_0, arg_577_1)
		arg_577_1.time_ = 0
		arg_577_1.frameCnt_ = 0
		arg_577_1.state_ = "playing"
		arg_577_1.curTalkId_ = 1109402140
		arg_577_1.duration_ = 3.933

		local var_577_0 = {
			ja = 3.933,
			ko = 3.9,
			zh = 3.9
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
				arg_577_0:Play1109402141(arg_577_1)
			end
		end

		function arg_577_1.onSingleLineUpdate_(arg_580_0)
			local var_580_0 = 0
			local var_580_1 = 0.35

			if var_580_0 < arg_577_1.time_ and arg_577_1.time_ <= var_580_0 + arg_580_0 then
				arg_577_1.talkMaxDuration = 0
				arg_577_1.dialogCg_.alpha = 1

				arg_577_1.dialog_:SetActive(true)
				SetActive(arg_577_1.leftNameGo_, true)

				local var_580_2 = arg_577_1:FormatText(StoryNameCfg[189].name)

				arg_577_1.leftNameTxt_.text = var_580_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_577_1.leftNameTxt_.transform)

				arg_577_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_577_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_577_1:RecordName(arg_577_1.leftNameTxt_.text)
				SetActive(arg_577_1.iconTrs_.gameObject, true)
				arg_577_1.iconController_:SetSelectedState("hero")

				arg_577_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_577_1.callingController_:SetSelectedState("normal")

				local var_580_3 = arg_577_1:GetWordFromCfg(1109402140)
				local var_580_4 = arg_577_1:FormatText(var_580_3.content)

				arg_577_1.text_.text = var_580_4

				LuaForUtil.ClearLinePrefixSymbol(arg_577_1.text_)

				local var_580_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402140", "story_v_side_new_1109402.awb") ~= 0 then
					local var_580_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402140", "story_v_side_new_1109402.awb") / 1000

					if var_580_8 + var_580_0 > arg_577_1.duration_ then
						arg_577_1.duration_ = var_580_8 + var_580_0
					end

					if var_580_3.prefab_name ~= "" and arg_577_1.actors_[var_580_3.prefab_name] ~= nil then
						local var_580_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_577_1.actors_[var_580_3.prefab_name].transform, "story_v_side_new_1109402", "1109402140", "story_v_side_new_1109402.awb")

						arg_577_1:RecordAudio("1109402140", var_580_9)
						arg_577_1:RecordAudio("1109402140", var_580_9)
					else
						arg_577_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402140", "story_v_side_new_1109402.awb")
					end

					arg_577_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402140", "story_v_side_new_1109402.awb")
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
	Play1109402141 = function(arg_581_0, arg_581_1)
		arg_581_1.time_ = 0
		arg_581_1.frameCnt_ = 0
		arg_581_1.state_ = "playing"
		arg_581_1.curTalkId_ = 1109402141
		arg_581_1.duration_ = 12.366

		local var_581_0 = {
			ja = 12.366,
			ko = 8.8,
			zh = 8.8
		}
		local var_581_1 = manager.audio:GetLocalizationFlag()

		if var_581_0[var_581_1] ~= nil then
			arg_581_1.duration_ = var_581_0[var_581_1]
		end

		SetActive(arg_581_1.tipsGo_, false)

		function arg_581_1.onSingleLineFinish_()
			arg_581_1.onSingleLineUpdate_ = nil
			arg_581_1.onSingleLineFinish_ = nil
			arg_581_1.state_ = "waiting"
		end

		function arg_581_1.playNext_(arg_583_0)
			if arg_583_0 == 1 then
				arg_581_0:Play1109402142(arg_581_1)
			end
		end

		function arg_581_1.onSingleLineUpdate_(arg_584_0)
			local var_584_0 = 0
			local var_584_1 = 1

			if var_584_0 < arg_581_1.time_ and arg_581_1.time_ <= var_584_0 + arg_584_0 then
				arg_581_1.talkMaxDuration = 0
				arg_581_1.dialogCg_.alpha = 1

				arg_581_1.dialog_:SetActive(true)
				SetActive(arg_581_1.leftNameGo_, true)

				local var_584_2 = arg_581_1:FormatText(StoryNameCfg[189].name)

				arg_581_1.leftNameTxt_.text = var_584_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_581_1.leftNameTxt_.transform)

				arg_581_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_581_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_581_1:RecordName(arg_581_1.leftNameTxt_.text)
				SetActive(arg_581_1.iconTrs_.gameObject, true)
				arg_581_1.iconController_:SetSelectedState("hero")

				arg_581_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_581_1.callingController_:SetSelectedState("normal")

				local var_584_3 = arg_581_1:GetWordFromCfg(1109402141)
				local var_584_4 = arg_581_1:FormatText(var_584_3.content)

				arg_581_1.text_.text = var_584_4

				LuaForUtil.ClearLinePrefixSymbol(arg_581_1.text_)

				local var_584_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402141", "story_v_side_new_1109402.awb") ~= 0 then
					local var_584_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402141", "story_v_side_new_1109402.awb") / 1000

					if var_584_8 + var_584_0 > arg_581_1.duration_ then
						arg_581_1.duration_ = var_584_8 + var_584_0
					end

					if var_584_3.prefab_name ~= "" and arg_581_1.actors_[var_584_3.prefab_name] ~= nil then
						local var_584_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_581_1.actors_[var_584_3.prefab_name].transform, "story_v_side_new_1109402", "1109402141", "story_v_side_new_1109402.awb")

						arg_581_1:RecordAudio("1109402141", var_584_9)
						arg_581_1:RecordAudio("1109402141", var_584_9)
					else
						arg_581_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402141", "story_v_side_new_1109402.awb")
					end

					arg_581_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402141", "story_v_side_new_1109402.awb")
				end

				arg_581_1:RecordContent(arg_581_1.text_.text)
			end

			local var_584_10 = math.max(var_584_1, arg_581_1.talkMaxDuration)

			if var_584_0 <= arg_581_1.time_ and arg_581_1.time_ < var_584_0 + var_584_10 then
				arg_581_1.typewritter.percent = (arg_581_1.time_ - var_584_0) / var_584_10

				arg_581_1.typewritter:SetDirty()
			end

			if arg_581_1.time_ >= var_584_0 + var_584_10 and arg_581_1.time_ < var_584_0 + var_584_10 + arg_584_0 then
				arg_581_1.typewritter.percent = 1

				arg_581_1.typewritter:SetDirty()
				arg_581_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402142 = function(arg_585_0, arg_585_1)
		arg_585_1.time_ = 0
		arg_585_1.frameCnt_ = 0
		arg_585_1.state_ = "playing"
		arg_585_1.curTalkId_ = 1109402142
		arg_585_1.duration_ = 5

		SetActive(arg_585_1.tipsGo_, false)

		function arg_585_1.onSingleLineFinish_()
			arg_585_1.onSingleLineUpdate_ = nil
			arg_585_1.onSingleLineFinish_ = nil
			arg_585_1.state_ = "waiting"
		end

		function arg_585_1.playNext_(arg_587_0)
			if arg_587_0 == 1 then
				arg_585_0:Play1109402143(arg_585_1)
			end
		end

		function arg_585_1.onSingleLineUpdate_(arg_588_0)
			local var_588_0 = 0
			local var_588_1 = 0.475

			if var_588_0 < arg_585_1.time_ and arg_585_1.time_ <= var_588_0 + arg_588_0 then
				arg_585_1.talkMaxDuration = 0
				arg_585_1.dialogCg_.alpha = 1

				arg_585_1.dialog_:SetActive(true)
				SetActive(arg_585_1.leftNameGo_, false)

				arg_585_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_585_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_585_1:RecordName(arg_585_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_585_1.iconTrs_.gameObject, false)
				arg_585_1.callingController_:SetSelectedState("normal")

				local var_588_2 = arg_585_1:GetWordFromCfg(1109402142)
				local var_588_3 = arg_585_1:FormatText(var_588_2.content)

				arg_585_1.text_.text = var_588_3

				LuaForUtil.ClearLinePrefixSymbol(arg_585_1.text_)

				local var_588_4 = 19
				local var_588_5 = utf8.len(var_588_3)
				local var_588_6 = var_588_4 <= 0 and var_588_1 or var_588_1 * (var_588_5 / var_588_4)

				if var_588_6 > 0 and var_588_1 < var_588_6 then
					arg_585_1.talkMaxDuration = var_588_6

					if var_588_6 + var_588_0 > arg_585_1.duration_ then
						arg_585_1.duration_ = var_588_6 + var_588_0
					end
				end

				arg_585_1.text_.text = var_588_3
				arg_585_1.typewritter.percent = 0

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(false)
				arg_585_1:RecordContent(arg_585_1.text_.text)
			end

			local var_588_7 = math.max(var_588_1, arg_585_1.talkMaxDuration)

			if var_588_0 <= arg_585_1.time_ and arg_585_1.time_ < var_588_0 + var_588_7 then
				arg_585_1.typewritter.percent = (arg_585_1.time_ - var_588_0) / var_588_7

				arg_585_1.typewritter:SetDirty()
			end

			if arg_585_1.time_ >= var_588_0 + var_588_7 and arg_585_1.time_ < var_588_0 + var_588_7 + arg_588_0 then
				arg_585_1.typewritter.percent = 1

				arg_585_1.typewritter:SetDirty()
				arg_585_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402143 = function(arg_589_0, arg_589_1)
		arg_589_1.time_ = 0
		arg_589_1.frameCnt_ = 0
		arg_589_1.state_ = "playing"
		arg_589_1.curTalkId_ = 1109402143
		arg_589_1.duration_ = 5

		SetActive(arg_589_1.tipsGo_, false)

		function arg_589_1.onSingleLineFinish_()
			arg_589_1.onSingleLineUpdate_ = nil
			arg_589_1.onSingleLineFinish_ = nil
			arg_589_1.state_ = "waiting"
		end

		function arg_589_1.playNext_(arg_591_0)
			if arg_591_0 == 1 then
				arg_589_0:Play1109402144(arg_589_1)
			end
		end

		function arg_589_1.onSingleLineUpdate_(arg_592_0)
			local var_592_0 = 0
			local var_592_1 = 0.6

			if var_592_0 < arg_589_1.time_ and arg_589_1.time_ <= var_592_0 + arg_592_0 then
				arg_589_1.talkMaxDuration = 0
				arg_589_1.dialogCg_.alpha = 1

				arg_589_1.dialog_:SetActive(true)
				SetActive(arg_589_1.leftNameGo_, true)

				local var_592_2 = arg_589_1:FormatText(StoryNameCfg[7].name)

				arg_589_1.leftNameTxt_.text = var_592_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_589_1.leftNameTxt_.transform)

				arg_589_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_589_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_589_1:RecordName(arg_589_1.leftNameTxt_.text)
				SetActive(arg_589_1.iconTrs_.gameObject, false)
				arg_589_1.callingController_:SetSelectedState("normal")

				local var_592_3 = arg_589_1:GetWordFromCfg(1109402143)
				local var_592_4 = arg_589_1:FormatText(var_592_3.content)

				arg_589_1.text_.text = var_592_4

				LuaForUtil.ClearLinePrefixSymbol(arg_589_1.text_)

				local var_592_5 = 24
				local var_592_6 = utf8.len(var_592_4)
				local var_592_7 = var_592_5 <= 0 and var_592_1 or var_592_1 * (var_592_6 / var_592_5)

				if var_592_7 > 0 and var_592_1 < var_592_7 then
					arg_589_1.talkMaxDuration = var_592_7

					if var_592_7 + var_592_0 > arg_589_1.duration_ then
						arg_589_1.duration_ = var_592_7 + var_592_0
					end
				end

				arg_589_1.text_.text = var_592_4
				arg_589_1.typewritter.percent = 0

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(false)
				arg_589_1:RecordContent(arg_589_1.text_.text)
			end

			local var_592_8 = math.max(var_592_1, arg_589_1.talkMaxDuration)

			if var_592_0 <= arg_589_1.time_ and arg_589_1.time_ < var_592_0 + var_592_8 then
				arg_589_1.typewritter.percent = (arg_589_1.time_ - var_592_0) / var_592_8

				arg_589_1.typewritter:SetDirty()
			end

			if arg_589_1.time_ >= var_592_0 + var_592_8 and arg_589_1.time_ < var_592_0 + var_592_8 + arg_592_0 then
				arg_589_1.typewritter.percent = 1

				arg_589_1.typewritter:SetDirty()
				arg_589_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402144 = function(arg_593_0, arg_593_1)
		arg_593_1.time_ = 0
		arg_593_1.frameCnt_ = 0
		arg_593_1.state_ = "playing"
		arg_593_1.curTalkId_ = 1109402144
		arg_593_1.duration_ = 5.966

		local var_593_0 = {
			ja = 5.433,
			ko = 5.966,
			zh = 5.966
		}
		local var_593_1 = manager.audio:GetLocalizationFlag()

		if var_593_0[var_593_1] ~= nil then
			arg_593_1.duration_ = var_593_0[var_593_1]
		end

		SetActive(arg_593_1.tipsGo_, false)

		function arg_593_1.onSingleLineFinish_()
			arg_593_1.onSingleLineUpdate_ = nil
			arg_593_1.onSingleLineFinish_ = nil
			arg_593_1.state_ = "waiting"
		end

		function arg_593_1.playNext_(arg_595_0)
			if arg_595_0 == 1 then
				arg_593_0:Play1109402145(arg_593_1)
			end
		end

		function arg_593_1.onSingleLineUpdate_(arg_596_0)
			local var_596_0 = arg_593_1.actors_["1094ui_story"].transform
			local var_596_1 = 0

			if var_596_1 < arg_593_1.time_ and arg_593_1.time_ <= var_596_1 + arg_596_0 then
				arg_593_1.var_.moveOldPos1094ui_story = var_596_0.localPosition
			end

			local var_596_2 = 0.001

			if var_596_1 <= arg_593_1.time_ and arg_593_1.time_ < var_596_1 + var_596_2 then
				local var_596_3 = (arg_593_1.time_ - var_596_1) / var_596_2
				local var_596_4 = Vector3.New(0, -0.84, -6.1)

				var_596_0.localPosition = Vector3.Lerp(arg_593_1.var_.moveOldPos1094ui_story, var_596_4, var_596_3)

				local var_596_5 = manager.ui.mainCamera.transform.position - var_596_0.position

				var_596_0.forward = Vector3.New(var_596_5.x, var_596_5.y, var_596_5.z)

				local var_596_6 = var_596_0.localEulerAngles

				var_596_6.z = 0
				var_596_6.x = 0
				var_596_0.localEulerAngles = var_596_6
			end

			if arg_593_1.time_ >= var_596_1 + var_596_2 and arg_593_1.time_ < var_596_1 + var_596_2 + arg_596_0 then
				var_596_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_596_7 = manager.ui.mainCamera.transform.position - var_596_0.position

				var_596_0.forward = Vector3.New(var_596_7.x, var_596_7.y, var_596_7.z)

				local var_596_8 = var_596_0.localEulerAngles

				var_596_8.z = 0
				var_596_8.x = 0
				var_596_0.localEulerAngles = var_596_8
			end

			local var_596_9 = arg_593_1.actors_["1094ui_story"]
			local var_596_10 = 0

			if var_596_10 < arg_593_1.time_ and arg_593_1.time_ <= var_596_10 + arg_596_0 and arg_593_1.var_.characterEffect1094ui_story == nil then
				arg_593_1.var_.characterEffect1094ui_story = var_596_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_596_11 = 0.200000002980232

			if var_596_10 <= arg_593_1.time_ and arg_593_1.time_ < var_596_10 + var_596_11 then
				local var_596_12 = (arg_593_1.time_ - var_596_10) / var_596_11

				if arg_593_1.var_.characterEffect1094ui_story then
					arg_593_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_593_1.time_ >= var_596_10 + var_596_11 and arg_593_1.time_ < var_596_10 + var_596_11 + arg_596_0 and arg_593_1.var_.characterEffect1094ui_story then
				arg_593_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_596_13 = 0

			if var_596_13 < arg_593_1.time_ and arg_593_1.time_ <= var_596_13 + arg_596_0 then
				arg_593_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_596_14 = 0

			if var_596_14 < arg_593_1.time_ and arg_593_1.time_ <= var_596_14 + arg_596_0 then
				arg_593_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_596_15 = 0
			local var_596_16 = 0.575

			if var_596_15 < arg_593_1.time_ and arg_593_1.time_ <= var_596_15 + arg_596_0 then
				arg_593_1.talkMaxDuration = 0
				arg_593_1.dialogCg_.alpha = 1

				arg_593_1.dialog_:SetActive(true)
				SetActive(arg_593_1.leftNameGo_, true)

				local var_596_17 = arg_593_1:FormatText(StoryNameCfg[181].name)

				arg_593_1.leftNameTxt_.text = var_596_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_593_1.leftNameTxt_.transform)

				arg_593_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_593_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_593_1:RecordName(arg_593_1.leftNameTxt_.text)
				SetActive(arg_593_1.iconTrs_.gameObject, false)
				arg_593_1.callingController_:SetSelectedState("normal")

				local var_596_18 = arg_593_1:GetWordFromCfg(1109402144)
				local var_596_19 = arg_593_1:FormatText(var_596_18.content)

				arg_593_1.text_.text = var_596_19

				LuaForUtil.ClearLinePrefixSymbol(arg_593_1.text_)

				local var_596_20 = 23
				local var_596_21 = utf8.len(var_596_19)
				local var_596_22 = var_596_20 <= 0 and var_596_16 or var_596_16 * (var_596_21 / var_596_20)

				if var_596_22 > 0 and var_596_16 < var_596_22 then
					arg_593_1.talkMaxDuration = var_596_22

					if var_596_22 + var_596_15 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_22 + var_596_15
					end
				end

				arg_593_1.text_.text = var_596_19
				arg_593_1.typewritter.percent = 0

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402144", "story_v_side_new_1109402.awb") ~= 0 then
					local var_596_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402144", "story_v_side_new_1109402.awb") / 1000

					if var_596_23 + var_596_15 > arg_593_1.duration_ then
						arg_593_1.duration_ = var_596_23 + var_596_15
					end

					if var_596_18.prefab_name ~= "" and arg_593_1.actors_[var_596_18.prefab_name] ~= nil then
						local var_596_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_593_1.actors_[var_596_18.prefab_name].transform, "story_v_side_new_1109402", "1109402144", "story_v_side_new_1109402.awb")

						arg_593_1:RecordAudio("1109402144", var_596_24)
						arg_593_1:RecordAudio("1109402144", var_596_24)
					else
						arg_593_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402144", "story_v_side_new_1109402.awb")
					end

					arg_593_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402144", "story_v_side_new_1109402.awb")
				end

				arg_593_1:RecordContent(arg_593_1.text_.text)
			end

			local var_596_25 = math.max(var_596_16, arg_593_1.talkMaxDuration)

			if var_596_15 <= arg_593_1.time_ and arg_593_1.time_ < var_596_15 + var_596_25 then
				arg_593_1.typewritter.percent = (arg_593_1.time_ - var_596_15) / var_596_25

				arg_593_1.typewritter:SetDirty()
			end

			if arg_593_1.time_ >= var_596_15 + var_596_25 and arg_593_1.time_ < var_596_15 + var_596_25 + arg_596_0 then
				arg_593_1.typewritter.percent = 1

				arg_593_1.typewritter:SetDirty()
				arg_593_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402145 = function(arg_597_0, arg_597_1)
		arg_597_1.time_ = 0
		arg_597_1.frameCnt_ = 0
		arg_597_1.state_ = "playing"
		arg_597_1.curTalkId_ = 1109402145
		arg_597_1.duration_ = 5

		SetActive(arg_597_1.tipsGo_, false)

		function arg_597_1.onSingleLineFinish_()
			arg_597_1.onSingleLineUpdate_ = nil
			arg_597_1.onSingleLineFinish_ = nil
			arg_597_1.state_ = "waiting"
		end

		function arg_597_1.playNext_(arg_599_0)
			if arg_599_0 == 1 then
				arg_597_0:Play1109402146(arg_597_1)
			end
		end

		function arg_597_1.onSingleLineUpdate_(arg_600_0)
			local var_600_0 = arg_597_1.actors_["1094ui_story"]
			local var_600_1 = 0

			if var_600_1 < arg_597_1.time_ and arg_597_1.time_ <= var_600_1 + arg_600_0 and arg_597_1.var_.characterEffect1094ui_story == nil then
				arg_597_1.var_.characterEffect1094ui_story = var_600_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_600_2 = 0.200000002980232

			if var_600_1 <= arg_597_1.time_ and arg_597_1.time_ < var_600_1 + var_600_2 then
				local var_600_3 = (arg_597_1.time_ - var_600_1) / var_600_2

				if arg_597_1.var_.characterEffect1094ui_story then
					local var_600_4 = Mathf.Lerp(0, 0.5, var_600_3)

					arg_597_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_597_1.var_.characterEffect1094ui_story.fillRatio = var_600_4
				end
			end

			if arg_597_1.time_ >= var_600_1 + var_600_2 and arg_597_1.time_ < var_600_1 + var_600_2 + arg_600_0 and arg_597_1.var_.characterEffect1094ui_story then
				local var_600_5 = 0.5

				arg_597_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_597_1.var_.characterEffect1094ui_story.fillRatio = var_600_5
			end

			local var_600_6 = 0
			local var_600_7 = 0.1

			if var_600_6 < arg_597_1.time_ and arg_597_1.time_ <= var_600_6 + arg_600_0 then
				arg_597_1.talkMaxDuration = 0
				arg_597_1.dialogCg_.alpha = 1

				arg_597_1.dialog_:SetActive(true)
				SetActive(arg_597_1.leftNameGo_, true)

				local var_600_8 = arg_597_1:FormatText(StoryNameCfg[7].name)

				arg_597_1.leftNameTxt_.text = var_600_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_597_1.leftNameTxt_.transform)

				arg_597_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_597_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_597_1:RecordName(arg_597_1.leftNameTxt_.text)
				SetActive(arg_597_1.iconTrs_.gameObject, false)
				arg_597_1.callingController_:SetSelectedState("normal")

				local var_600_9 = arg_597_1:GetWordFromCfg(1109402145)
				local var_600_10 = arg_597_1:FormatText(var_600_9.content)

				arg_597_1.text_.text = var_600_10

				LuaForUtil.ClearLinePrefixSymbol(arg_597_1.text_)

				local var_600_11 = 4
				local var_600_12 = utf8.len(var_600_10)
				local var_600_13 = var_600_11 <= 0 and var_600_7 or var_600_7 * (var_600_12 / var_600_11)

				if var_600_13 > 0 and var_600_7 < var_600_13 then
					arg_597_1.talkMaxDuration = var_600_13

					if var_600_13 + var_600_6 > arg_597_1.duration_ then
						arg_597_1.duration_ = var_600_13 + var_600_6
					end
				end

				arg_597_1.text_.text = var_600_10
				arg_597_1.typewritter.percent = 0

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(false)
				arg_597_1:RecordContent(arg_597_1.text_.text)
			end

			local var_600_14 = math.max(var_600_7, arg_597_1.talkMaxDuration)

			if var_600_6 <= arg_597_1.time_ and arg_597_1.time_ < var_600_6 + var_600_14 then
				arg_597_1.typewritter.percent = (arg_597_1.time_ - var_600_6) / var_600_14

				arg_597_1.typewritter:SetDirty()
			end

			if arg_597_1.time_ >= var_600_6 + var_600_14 and arg_597_1.time_ < var_600_6 + var_600_14 + arg_600_0 then
				arg_597_1.typewritter.percent = 1

				arg_597_1.typewritter:SetDirty()
				arg_597_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402146 = function(arg_601_0, arg_601_1)
		arg_601_1.time_ = 0
		arg_601_1.frameCnt_ = 0
		arg_601_1.state_ = "playing"
		arg_601_1.curTalkId_ = 1109402146
		arg_601_1.duration_ = 9.9

		local var_601_0 = {
			ja = 7.433,
			ko = 9.9,
			zh = 9.9
		}
		local var_601_1 = manager.audio:GetLocalizationFlag()

		if var_601_0[var_601_1] ~= nil then
			arg_601_1.duration_ = var_601_0[var_601_1]
		end

		SetActive(arg_601_1.tipsGo_, false)

		function arg_601_1.onSingleLineFinish_()
			arg_601_1.onSingleLineUpdate_ = nil
			arg_601_1.onSingleLineFinish_ = nil
			arg_601_1.state_ = "waiting"
		end

		function arg_601_1.playNext_(arg_603_0)
			if arg_603_0 == 1 then
				arg_601_0:Play1109402147(arg_601_1)
			end
		end

		function arg_601_1.onSingleLineUpdate_(arg_604_0)
			local var_604_0 = 0
			local var_604_1 = 0.825

			if var_604_0 < arg_601_1.time_ and arg_601_1.time_ <= var_604_0 + arg_604_0 then
				arg_601_1.talkMaxDuration = 0
				arg_601_1.dialogCg_.alpha = 1

				arg_601_1.dialog_:SetActive(true)
				SetActive(arg_601_1.leftNameGo_, true)

				local var_604_2 = arg_601_1:FormatText(StoryNameCfg[189].name)

				arg_601_1.leftNameTxt_.text = var_604_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_601_1.leftNameTxt_.transform)

				arg_601_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_601_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_601_1:RecordName(arg_601_1.leftNameTxt_.text)
				SetActive(arg_601_1.iconTrs_.gameObject, true)
				arg_601_1.iconController_:SetSelectedState("hero")

				arg_601_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_601_1.callingController_:SetSelectedState("normal")

				local var_604_3 = arg_601_1:GetWordFromCfg(1109402146)
				local var_604_4 = arg_601_1:FormatText(var_604_3.content)

				arg_601_1.text_.text = var_604_4

				LuaForUtil.ClearLinePrefixSymbol(arg_601_1.text_)

				local var_604_5 = 37
				local var_604_6 = utf8.len(var_604_4)
				local var_604_7 = var_604_5 <= 0 and var_604_1 or var_604_1 * (var_604_6 / var_604_5)

				if var_604_7 > 0 and var_604_1 < var_604_7 then
					arg_601_1.talkMaxDuration = var_604_7

					if var_604_7 + var_604_0 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_7 + var_604_0
					end
				end

				arg_601_1.text_.text = var_604_4
				arg_601_1.typewritter.percent = 0

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402146", "story_v_side_new_1109402.awb") ~= 0 then
					local var_604_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402146", "story_v_side_new_1109402.awb") / 1000

					if var_604_8 + var_604_0 > arg_601_1.duration_ then
						arg_601_1.duration_ = var_604_8 + var_604_0
					end

					if var_604_3.prefab_name ~= "" and arg_601_1.actors_[var_604_3.prefab_name] ~= nil then
						local var_604_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_601_1.actors_[var_604_3.prefab_name].transform, "story_v_side_new_1109402", "1109402146", "story_v_side_new_1109402.awb")

						arg_601_1:RecordAudio("1109402146", var_604_9)
						arg_601_1:RecordAudio("1109402146", var_604_9)
					else
						arg_601_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402146", "story_v_side_new_1109402.awb")
					end

					arg_601_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402146", "story_v_side_new_1109402.awb")
				end

				arg_601_1:RecordContent(arg_601_1.text_.text)
			end

			local var_604_10 = math.max(var_604_1, arg_601_1.talkMaxDuration)

			if var_604_0 <= arg_601_1.time_ and arg_601_1.time_ < var_604_0 + var_604_10 then
				arg_601_1.typewritter.percent = (arg_601_1.time_ - var_604_0) / var_604_10

				arg_601_1.typewritter:SetDirty()
			end

			if arg_601_1.time_ >= var_604_0 + var_604_10 and arg_601_1.time_ < var_604_0 + var_604_10 + arg_604_0 then
				arg_601_1.typewritter.percent = 1

				arg_601_1.typewritter:SetDirty()
				arg_601_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402147 = function(arg_605_0, arg_605_1)
		arg_605_1.time_ = 0
		arg_605_1.frameCnt_ = 0
		arg_605_1.state_ = "playing"
		arg_605_1.curTalkId_ = 1109402147
		arg_605_1.duration_ = 6.1

		local var_605_0 = {
			ja = 6.1,
			ko = 4.3,
			zh = 4.3
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
				arg_605_0:Play1109402148(arg_605_1)
			end
		end

		function arg_605_1.onSingleLineUpdate_(arg_608_0)
			local var_608_0 = arg_605_1.actors_["1094ui_story"].transform
			local var_608_1 = 0

			if var_608_1 < arg_605_1.time_ and arg_605_1.time_ <= var_608_1 + arg_608_0 then
				arg_605_1.var_.moveOldPos1094ui_story = var_608_0.localPosition
			end

			local var_608_2 = 0.001

			if var_608_1 <= arg_605_1.time_ and arg_605_1.time_ < var_608_1 + var_608_2 then
				local var_608_3 = (arg_605_1.time_ - var_608_1) / var_608_2
				local var_608_4 = Vector3.New(0, -0.84, -6.1)

				var_608_0.localPosition = Vector3.Lerp(arg_605_1.var_.moveOldPos1094ui_story, var_608_4, var_608_3)

				local var_608_5 = manager.ui.mainCamera.transform.position - var_608_0.position

				var_608_0.forward = Vector3.New(var_608_5.x, var_608_5.y, var_608_5.z)

				local var_608_6 = var_608_0.localEulerAngles

				var_608_6.z = 0
				var_608_6.x = 0
				var_608_0.localEulerAngles = var_608_6
			end

			if arg_605_1.time_ >= var_608_1 + var_608_2 and arg_605_1.time_ < var_608_1 + var_608_2 + arg_608_0 then
				var_608_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_608_7 = manager.ui.mainCamera.transform.position - var_608_0.position

				var_608_0.forward = Vector3.New(var_608_7.x, var_608_7.y, var_608_7.z)

				local var_608_8 = var_608_0.localEulerAngles

				var_608_8.z = 0
				var_608_8.x = 0
				var_608_0.localEulerAngles = var_608_8
			end

			local var_608_9 = arg_605_1.actors_["1094ui_story"]
			local var_608_10 = 0

			if var_608_10 < arg_605_1.time_ and arg_605_1.time_ <= var_608_10 + arg_608_0 and arg_605_1.var_.characterEffect1094ui_story == nil then
				arg_605_1.var_.characterEffect1094ui_story = var_608_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_608_11 = 0.200000002980232

			if var_608_10 <= arg_605_1.time_ and arg_605_1.time_ < var_608_10 + var_608_11 then
				local var_608_12 = (arg_605_1.time_ - var_608_10) / var_608_11

				if arg_605_1.var_.characterEffect1094ui_story then
					arg_605_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_605_1.time_ >= var_608_10 + var_608_11 and arg_605_1.time_ < var_608_10 + var_608_11 + arg_608_0 and arg_605_1.var_.characterEffect1094ui_story then
				arg_605_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_608_13 = 0

			if var_608_13 < arg_605_1.time_ and arg_605_1.time_ <= var_608_13 + arg_608_0 then
				arg_605_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_608_14 = 0

			if var_608_14 < arg_605_1.time_ and arg_605_1.time_ <= var_608_14 + arg_608_0 then
				arg_605_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_608_15 = 0
			local var_608_16 = 0.35

			if var_608_15 < arg_605_1.time_ and arg_605_1.time_ <= var_608_15 + arg_608_0 then
				arg_605_1.talkMaxDuration = 0
				arg_605_1.dialogCg_.alpha = 1

				arg_605_1.dialog_:SetActive(true)
				SetActive(arg_605_1.leftNameGo_, true)

				local var_608_17 = arg_605_1:FormatText(StoryNameCfg[181].name)

				arg_605_1.leftNameTxt_.text = var_608_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_605_1.leftNameTxt_.transform)

				arg_605_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_605_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_605_1:RecordName(arg_605_1.leftNameTxt_.text)
				SetActive(arg_605_1.iconTrs_.gameObject, false)
				arg_605_1.callingController_:SetSelectedState("normal")

				local var_608_18 = arg_605_1:GetWordFromCfg(1109402147)
				local var_608_19 = arg_605_1:FormatText(var_608_18.content)

				arg_605_1.text_.text = var_608_19

				LuaForUtil.ClearLinePrefixSymbol(arg_605_1.text_)

				local var_608_20 = 14
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

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402147", "story_v_side_new_1109402.awb") ~= 0 then
					local var_608_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402147", "story_v_side_new_1109402.awb") / 1000

					if var_608_23 + var_608_15 > arg_605_1.duration_ then
						arg_605_1.duration_ = var_608_23 + var_608_15
					end

					if var_608_18.prefab_name ~= "" and arg_605_1.actors_[var_608_18.prefab_name] ~= nil then
						local var_608_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_605_1.actors_[var_608_18.prefab_name].transform, "story_v_side_new_1109402", "1109402147", "story_v_side_new_1109402.awb")

						arg_605_1:RecordAudio("1109402147", var_608_24)
						arg_605_1:RecordAudio("1109402147", var_608_24)
					else
						arg_605_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402147", "story_v_side_new_1109402.awb")
					end

					arg_605_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402147", "story_v_side_new_1109402.awb")
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
	Play1109402148 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 1109402148
		arg_609_1.duration_ = 7.3

		local var_609_0 = {
			ja = 7.3,
			ko = 2.733,
			zh = 2.733
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
				arg_609_0:Play1109402149(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = arg_609_1.actors_["1094ui_story"]
			local var_612_1 = 0

			if var_612_1 < arg_609_1.time_ and arg_609_1.time_ <= var_612_1 + arg_612_0 and arg_609_1.var_.characterEffect1094ui_story == nil then
				arg_609_1.var_.characterEffect1094ui_story = var_612_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_612_2 = 0.200000002980232

			if var_612_1 <= arg_609_1.time_ and arg_609_1.time_ < var_612_1 + var_612_2 then
				local var_612_3 = (arg_609_1.time_ - var_612_1) / var_612_2

				if arg_609_1.var_.characterEffect1094ui_story then
					local var_612_4 = Mathf.Lerp(0, 0.5, var_612_3)

					arg_609_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_609_1.var_.characterEffect1094ui_story.fillRatio = var_612_4
				end
			end

			if arg_609_1.time_ >= var_612_1 + var_612_2 and arg_609_1.time_ < var_612_1 + var_612_2 + arg_612_0 and arg_609_1.var_.characterEffect1094ui_story then
				local var_612_5 = 0.5

				arg_609_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_609_1.var_.characterEffect1094ui_story.fillRatio = var_612_5
			end

			local var_612_6 = 0
			local var_612_7 = 0.275

			if var_612_6 < arg_609_1.time_ and arg_609_1.time_ <= var_612_6 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0
				arg_609_1.dialogCg_.alpha = 1

				arg_609_1.dialog_:SetActive(true)
				SetActive(arg_609_1.leftNameGo_, true)

				local var_612_8 = arg_609_1:FormatText(StoryNameCfg[189].name)

				arg_609_1.leftNameTxt_.text = var_612_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_609_1.leftNameTxt_.transform)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1.leftNameTxt_.text)
				SetActive(arg_609_1.iconTrs_.gameObject, true)
				arg_609_1.iconController_:SetSelectedState("hero")

				arg_609_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_9 = arg_609_1:GetWordFromCfg(1109402148)
				local var_612_10 = arg_609_1:FormatText(var_612_9.content)

				arg_609_1.text_.text = var_612_10

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_11 = 11
				local var_612_12 = utf8.len(var_612_10)
				local var_612_13 = var_612_11 <= 0 and var_612_7 or var_612_7 * (var_612_12 / var_612_11)

				if var_612_13 > 0 and var_612_7 < var_612_13 then
					arg_609_1.talkMaxDuration = var_612_13

					if var_612_13 + var_612_6 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_13 + var_612_6
					end
				end

				arg_609_1.text_.text = var_612_10
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402148", "story_v_side_new_1109402.awb") ~= 0 then
					local var_612_14 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402148", "story_v_side_new_1109402.awb") / 1000

					if var_612_14 + var_612_6 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_14 + var_612_6
					end

					if var_612_9.prefab_name ~= "" and arg_609_1.actors_[var_612_9.prefab_name] ~= nil then
						local var_612_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_609_1.actors_[var_612_9.prefab_name].transform, "story_v_side_new_1109402", "1109402148", "story_v_side_new_1109402.awb")

						arg_609_1:RecordAudio("1109402148", var_612_15)
						arg_609_1:RecordAudio("1109402148", var_612_15)
					else
						arg_609_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402148", "story_v_side_new_1109402.awb")
					end

					arg_609_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402148", "story_v_side_new_1109402.awb")
				end

				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_16 = math.max(var_612_7, arg_609_1.talkMaxDuration)

			if var_612_6 <= arg_609_1.time_ and arg_609_1.time_ < var_612_6 + var_612_16 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_6) / var_612_16

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_6 + var_612_16 and arg_609_1.time_ < var_612_6 + var_612_16 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402149 = function(arg_613_0, arg_613_1)
		arg_613_1.time_ = 0
		arg_613_1.frameCnt_ = 0
		arg_613_1.state_ = "playing"
		arg_613_1.curTalkId_ = 1109402149
		arg_613_1.duration_ = 5.466

		local var_613_0 = {
			ja = 5.466,
			ko = 3,
			zh = 3
		}
		local var_613_1 = manager.audio:GetLocalizationFlag()

		if var_613_0[var_613_1] ~= nil then
			arg_613_1.duration_ = var_613_0[var_613_1]
		end

		SetActive(arg_613_1.tipsGo_, false)

		function arg_613_1.onSingleLineFinish_()
			arg_613_1.onSingleLineUpdate_ = nil
			arg_613_1.onSingleLineFinish_ = nil
			arg_613_1.state_ = "waiting"
		end

		function arg_613_1.playNext_(arg_615_0)
			if arg_615_0 == 1 then
				arg_613_0:Play1109402150(arg_613_1)
			end
		end

		function arg_613_1.onSingleLineUpdate_(arg_616_0)
			local var_616_0 = 0
			local var_616_1 = 0.375

			if var_616_0 < arg_613_1.time_ and arg_613_1.time_ <= var_616_0 + arg_616_0 then
				arg_613_1.talkMaxDuration = 0
				arg_613_1.dialogCg_.alpha = 1

				arg_613_1.dialog_:SetActive(true)
				SetActive(arg_613_1.leftNameGo_, true)

				local var_616_2 = arg_613_1:FormatText(StoryNameCfg[189].name)

				arg_613_1.leftNameTxt_.text = var_616_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_613_1.leftNameTxt_.transform)

				arg_613_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_613_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_613_1:RecordName(arg_613_1.leftNameTxt_.text)
				SetActive(arg_613_1.iconTrs_.gameObject, true)
				arg_613_1.iconController_:SetSelectedState("hero")

				arg_613_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_613_1.callingController_:SetSelectedState("normal")

				local var_616_3 = arg_613_1:GetWordFromCfg(1109402149)
				local var_616_4 = arg_613_1:FormatText(var_616_3.content)

				arg_613_1.text_.text = var_616_4

				LuaForUtil.ClearLinePrefixSymbol(arg_613_1.text_)

				local var_616_5 = 15
				local var_616_6 = utf8.len(var_616_4)
				local var_616_7 = var_616_5 <= 0 and var_616_1 or var_616_1 * (var_616_6 / var_616_5)

				if var_616_7 > 0 and var_616_1 < var_616_7 then
					arg_613_1.talkMaxDuration = var_616_7

					if var_616_7 + var_616_0 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_7 + var_616_0
					end
				end

				arg_613_1.text_.text = var_616_4
				arg_613_1.typewritter.percent = 0

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402149", "story_v_side_new_1109402.awb") ~= 0 then
					local var_616_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402149", "story_v_side_new_1109402.awb") / 1000

					if var_616_8 + var_616_0 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_8 + var_616_0
					end

					if var_616_3.prefab_name ~= "" and arg_613_1.actors_[var_616_3.prefab_name] ~= nil then
						local var_616_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_613_1.actors_[var_616_3.prefab_name].transform, "story_v_side_new_1109402", "1109402149", "story_v_side_new_1109402.awb")

						arg_613_1:RecordAudio("1109402149", var_616_9)
						arg_613_1:RecordAudio("1109402149", var_616_9)
					else
						arg_613_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402149", "story_v_side_new_1109402.awb")
					end

					arg_613_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402149", "story_v_side_new_1109402.awb")
				end

				arg_613_1:RecordContent(arg_613_1.text_.text)
			end

			local var_616_10 = math.max(var_616_1, arg_613_1.talkMaxDuration)

			if var_616_0 <= arg_613_1.time_ and arg_613_1.time_ < var_616_0 + var_616_10 then
				arg_613_1.typewritter.percent = (arg_613_1.time_ - var_616_0) / var_616_10

				arg_613_1.typewritter:SetDirty()
			end

			if arg_613_1.time_ >= var_616_0 + var_616_10 and arg_613_1.time_ < var_616_0 + var_616_10 + arg_616_0 then
				arg_613_1.typewritter.percent = 1

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402150 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 1109402150
		arg_617_1.duration_ = 2.5

		local var_617_0 = {
			ja = 2.5,
			ko = 2.433,
			zh = 2.433
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
				arg_617_0:Play1109402151(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = arg_617_1.actors_["1094ui_story"].transform
			local var_620_1 = 0

			if var_620_1 < arg_617_1.time_ and arg_617_1.time_ <= var_620_1 + arg_620_0 then
				arg_617_1.var_.moveOldPos1094ui_story = var_620_0.localPosition
			end

			local var_620_2 = 0.001

			if var_620_1 <= arg_617_1.time_ and arg_617_1.time_ < var_620_1 + var_620_2 then
				local var_620_3 = (arg_617_1.time_ - var_620_1) / var_620_2
				local var_620_4 = Vector3.New(0, -0.84, -6.1)

				var_620_0.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos1094ui_story, var_620_4, var_620_3)

				local var_620_5 = manager.ui.mainCamera.transform.position - var_620_0.position

				var_620_0.forward = Vector3.New(var_620_5.x, var_620_5.y, var_620_5.z)

				local var_620_6 = var_620_0.localEulerAngles

				var_620_6.z = 0
				var_620_6.x = 0
				var_620_0.localEulerAngles = var_620_6
			end

			if arg_617_1.time_ >= var_620_1 + var_620_2 and arg_617_1.time_ < var_620_1 + var_620_2 + arg_620_0 then
				var_620_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_620_7 = manager.ui.mainCamera.transform.position - var_620_0.position

				var_620_0.forward = Vector3.New(var_620_7.x, var_620_7.y, var_620_7.z)

				local var_620_8 = var_620_0.localEulerAngles

				var_620_8.z = 0
				var_620_8.x = 0
				var_620_0.localEulerAngles = var_620_8
			end

			local var_620_9 = arg_617_1.actors_["1094ui_story"]
			local var_620_10 = 0

			if var_620_10 < arg_617_1.time_ and arg_617_1.time_ <= var_620_10 + arg_620_0 and arg_617_1.var_.characterEffect1094ui_story == nil then
				arg_617_1.var_.characterEffect1094ui_story = var_620_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_620_11 = 0.200000002980232

			if var_620_10 <= arg_617_1.time_ and arg_617_1.time_ < var_620_10 + var_620_11 then
				local var_620_12 = (arg_617_1.time_ - var_620_10) / var_620_11

				if arg_617_1.var_.characterEffect1094ui_story then
					arg_617_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_617_1.time_ >= var_620_10 + var_620_11 and arg_617_1.time_ < var_620_10 + var_620_11 + arg_620_0 and arg_617_1.var_.characterEffect1094ui_story then
				arg_617_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_620_13 = 0

			if var_620_13 < arg_617_1.time_ and arg_617_1.time_ <= var_620_13 + arg_620_0 then
				arg_617_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_620_14 = 0

			if var_620_14 < arg_617_1.time_ and arg_617_1.time_ <= var_620_14 + arg_620_0 then
				arg_617_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_620_15 = 0
			local var_620_16 = 0.175

			if var_620_15 < arg_617_1.time_ and arg_617_1.time_ <= var_620_15 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_17 = arg_617_1:FormatText(StoryNameCfg[181].name)

				arg_617_1.leftNameTxt_.text = var_620_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_18 = arg_617_1:GetWordFromCfg(1109402150)
				local var_620_19 = arg_617_1:FormatText(var_620_18.content)

				arg_617_1.text_.text = var_620_19

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_20 = 7
				local var_620_21 = utf8.len(var_620_19)
				local var_620_22 = var_620_20 <= 0 and var_620_16 or var_620_16 * (var_620_21 / var_620_20)

				if var_620_22 > 0 and var_620_16 < var_620_22 then
					arg_617_1.talkMaxDuration = var_620_22

					if var_620_22 + var_620_15 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_22 + var_620_15
					end
				end

				arg_617_1.text_.text = var_620_19
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402150", "story_v_side_new_1109402.awb") ~= 0 then
					local var_620_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402150", "story_v_side_new_1109402.awb") / 1000

					if var_620_23 + var_620_15 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_23 + var_620_15
					end

					if var_620_18.prefab_name ~= "" and arg_617_1.actors_[var_620_18.prefab_name] ~= nil then
						local var_620_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_617_1.actors_[var_620_18.prefab_name].transform, "story_v_side_new_1109402", "1109402150", "story_v_side_new_1109402.awb")

						arg_617_1:RecordAudio("1109402150", var_620_24)
						arg_617_1:RecordAudio("1109402150", var_620_24)
					else
						arg_617_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402150", "story_v_side_new_1109402.awb")
					end

					arg_617_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402150", "story_v_side_new_1109402.awb")
				end

				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_25 = math.max(var_620_16, arg_617_1.talkMaxDuration)

			if var_620_15 <= arg_617_1.time_ and arg_617_1.time_ < var_620_15 + var_620_25 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_15) / var_620_25

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_15 + var_620_25 and arg_617_1.time_ < var_620_15 + var_620_25 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402151 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 1109402151
		arg_621_1.duration_ = 5

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play1109402152(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = arg_621_1.actors_["1094ui_story"]
			local var_624_1 = 0

			if var_624_1 < arg_621_1.time_ and arg_621_1.time_ <= var_624_1 + arg_624_0 and arg_621_1.var_.characterEffect1094ui_story == nil then
				arg_621_1.var_.characterEffect1094ui_story = var_624_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_624_2 = 0.200000002980232

			if var_624_1 <= arg_621_1.time_ and arg_621_1.time_ < var_624_1 + var_624_2 then
				local var_624_3 = (arg_621_1.time_ - var_624_1) / var_624_2

				if arg_621_1.var_.characterEffect1094ui_story then
					local var_624_4 = Mathf.Lerp(0, 0.5, var_624_3)

					arg_621_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_621_1.var_.characterEffect1094ui_story.fillRatio = var_624_4
				end
			end

			if arg_621_1.time_ >= var_624_1 + var_624_2 and arg_621_1.time_ < var_624_1 + var_624_2 + arg_624_0 and arg_621_1.var_.characterEffect1094ui_story then
				local var_624_5 = 0.5

				arg_621_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_621_1.var_.characterEffect1094ui_story.fillRatio = var_624_5
			end

			local var_624_6 = 0
			local var_624_7 = 0.75

			if var_624_6 < arg_621_1.time_ and arg_621_1.time_ <= var_624_6 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, false)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_8 = arg_621_1:GetWordFromCfg(1109402151)
				local var_624_9 = arg_621_1:FormatText(var_624_8.content)

				arg_621_1.text_.text = var_624_9

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_10 = 35
				local var_624_11 = utf8.len(var_624_9)
				local var_624_12 = var_624_10 <= 0 and var_624_7 or var_624_7 * (var_624_11 / var_624_10)

				if var_624_12 > 0 and var_624_7 < var_624_12 then
					arg_621_1.talkMaxDuration = var_624_12

					if var_624_12 + var_624_6 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_12 + var_624_6
					end
				end

				arg_621_1.text_.text = var_624_9
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)
				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_13 = math.max(var_624_7, arg_621_1.talkMaxDuration)

			if var_624_6 <= arg_621_1.time_ and arg_621_1.time_ < var_624_6 + var_624_13 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_6) / var_624_13

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_6 + var_624_13 and arg_621_1.time_ < var_624_6 + var_624_13 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402152 = function(arg_625_0, arg_625_1)
		arg_625_1.time_ = 0
		arg_625_1.frameCnt_ = 0
		arg_625_1.state_ = "playing"
		arg_625_1.curTalkId_ = 1109402152
		arg_625_1.duration_ = 5

		SetActive(arg_625_1.tipsGo_, false)

		function arg_625_1.onSingleLineFinish_()
			arg_625_1.onSingleLineUpdate_ = nil
			arg_625_1.onSingleLineFinish_ = nil
			arg_625_1.state_ = "waiting"
		end

		function arg_625_1.playNext_(arg_627_0)
			if arg_627_0 == 1 then
				arg_625_0:Play1109402153(arg_625_1)
			end
		end

		function arg_625_1.onSingleLineUpdate_(arg_628_0)
			local var_628_0 = 0
			local var_628_1 = 0.275

			if var_628_0 < arg_625_1.time_ and arg_625_1.time_ <= var_628_0 + arg_628_0 then
				arg_625_1.talkMaxDuration = 0
				arg_625_1.dialogCg_.alpha = 1

				arg_625_1.dialog_:SetActive(true)
				SetActive(arg_625_1.leftNameGo_, true)

				local var_628_2 = arg_625_1:FormatText(StoryNameCfg[7].name)

				arg_625_1.leftNameTxt_.text = var_628_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_625_1.leftNameTxt_.transform)

				arg_625_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_625_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_625_1:RecordName(arg_625_1.leftNameTxt_.text)
				SetActive(arg_625_1.iconTrs_.gameObject, false)
				arg_625_1.callingController_:SetSelectedState("normal")

				local var_628_3 = arg_625_1:GetWordFromCfg(1109402152)
				local var_628_4 = arg_625_1:FormatText(var_628_3.content)

				arg_625_1.text_.text = var_628_4

				LuaForUtil.ClearLinePrefixSymbol(arg_625_1.text_)

				local var_628_5 = 11
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
				arg_625_1:RecordContent(arg_625_1.text_.text)
			end

			local var_628_8 = math.max(var_628_1, arg_625_1.talkMaxDuration)

			if var_628_0 <= arg_625_1.time_ and arg_625_1.time_ < var_628_0 + var_628_8 then
				arg_625_1.typewritter.percent = (arg_625_1.time_ - var_628_0) / var_628_8

				arg_625_1.typewritter:SetDirty()
			end

			if arg_625_1.time_ >= var_628_0 + var_628_8 and arg_625_1.time_ < var_628_0 + var_628_8 + arg_628_0 then
				arg_625_1.typewritter.percent = 1

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402153 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 1109402153
		arg_629_1.duration_ = 12.5

		local var_629_0 = {
			ja = 12.5,
			ko = 6.3,
			zh = 6.3
		}
		local var_629_1 = manager.audio:GetLocalizationFlag()

		if var_629_0[var_629_1] ~= nil then
			arg_629_1.duration_ = var_629_0[var_629_1]
		end

		SetActive(arg_629_1.tipsGo_, false)

		function arg_629_1.onSingleLineFinish_()
			arg_629_1.onSingleLineUpdate_ = nil
			arg_629_1.onSingleLineFinish_ = nil
			arg_629_1.state_ = "waiting"
		end

		function arg_629_1.playNext_(arg_631_0)
			if arg_631_0 == 1 then
				arg_629_0:Play1109402154(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = 0
			local var_632_1 = 0.55

			if var_632_0 < arg_629_1.time_ and arg_629_1.time_ <= var_632_0 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0
				arg_629_1.dialogCg_.alpha = 1

				arg_629_1.dialog_:SetActive(true)
				SetActive(arg_629_1.leftNameGo_, true)

				local var_632_2 = arg_629_1:FormatText(StoryNameCfg[189].name)

				arg_629_1.leftNameTxt_.text = var_632_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_629_1.leftNameTxt_.transform)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1.leftNameTxt_.text)
				SetActive(arg_629_1.iconTrs_.gameObject, true)
				arg_629_1.iconController_:SetSelectedState("hero")

				arg_629_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_3 = arg_629_1:GetWordFromCfg(1109402153)
				local var_632_4 = arg_629_1:FormatText(var_632_3.content)

				arg_629_1.text_.text = var_632_4

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_5 = 22
				local var_632_6 = utf8.len(var_632_4)
				local var_632_7 = var_632_5 <= 0 and var_632_1 or var_632_1 * (var_632_6 / var_632_5)

				if var_632_7 > 0 and var_632_1 < var_632_7 then
					arg_629_1.talkMaxDuration = var_632_7

					if var_632_7 + var_632_0 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_7 + var_632_0
					end
				end

				arg_629_1.text_.text = var_632_4
				arg_629_1.typewritter.percent = 0

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402153", "story_v_side_new_1109402.awb") ~= 0 then
					local var_632_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402153", "story_v_side_new_1109402.awb") / 1000

					if var_632_8 + var_632_0 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_8 + var_632_0
					end

					if var_632_3.prefab_name ~= "" and arg_629_1.actors_[var_632_3.prefab_name] ~= nil then
						local var_632_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_629_1.actors_[var_632_3.prefab_name].transform, "story_v_side_new_1109402", "1109402153", "story_v_side_new_1109402.awb")

						arg_629_1:RecordAudio("1109402153", var_632_9)
						arg_629_1:RecordAudio("1109402153", var_632_9)
					else
						arg_629_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402153", "story_v_side_new_1109402.awb")
					end

					arg_629_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402153", "story_v_side_new_1109402.awb")
				end

				arg_629_1:RecordContent(arg_629_1.text_.text)
			end

			local var_632_10 = math.max(var_632_1, arg_629_1.talkMaxDuration)

			if var_632_0 <= arg_629_1.time_ and arg_629_1.time_ < var_632_0 + var_632_10 then
				arg_629_1.typewritter.percent = (arg_629_1.time_ - var_632_0) / var_632_10

				arg_629_1.typewritter:SetDirty()
			end

			if arg_629_1.time_ >= var_632_0 + var_632_10 and arg_629_1.time_ < var_632_0 + var_632_10 + arg_632_0 then
				arg_629_1.typewritter.percent = 1

				arg_629_1.typewritter:SetDirty()
				arg_629_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402154 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 1109402154
		arg_633_1.duration_ = 12.266

		local var_633_0 = {
			ja = 12.266,
			ko = 4.666,
			zh = 4.666
		}
		local var_633_1 = manager.audio:GetLocalizationFlag()

		if var_633_0[var_633_1] ~= nil then
			arg_633_1.duration_ = var_633_0[var_633_1]
		end

		SetActive(arg_633_1.tipsGo_, false)

		function arg_633_1.onSingleLineFinish_()
			arg_633_1.onSingleLineUpdate_ = nil
			arg_633_1.onSingleLineFinish_ = nil
			arg_633_1.state_ = "waiting"
		end

		function arg_633_1.playNext_(arg_635_0)
			if arg_635_0 == 1 then
				arg_633_0:Play1109402155(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = 0
			local var_636_1 = 0.525

			if var_636_0 < arg_633_1.time_ and arg_633_1.time_ <= var_636_0 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0
				arg_633_1.dialogCg_.alpha = 1

				arg_633_1.dialog_:SetActive(true)
				SetActive(arg_633_1.leftNameGo_, true)

				local var_636_2 = arg_633_1:FormatText(StoryNameCfg[189].name)

				arg_633_1.leftNameTxt_.text = var_636_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_633_1.leftNameTxt_.transform)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1.leftNameTxt_.text)
				SetActive(arg_633_1.iconTrs_.gameObject, true)
				arg_633_1.iconController_:SetSelectedState("hero")

				arg_633_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_vina")

				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_3 = arg_633_1:GetWordFromCfg(1109402154)
				local var_636_4 = arg_633_1:FormatText(var_636_3.content)

				arg_633_1.text_.text = var_636_4

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_5 = 21
				local var_636_6 = utf8.len(var_636_4)
				local var_636_7 = var_636_5 <= 0 and var_636_1 or var_636_1 * (var_636_6 / var_636_5)

				if var_636_7 > 0 and var_636_1 < var_636_7 then
					arg_633_1.talkMaxDuration = var_636_7

					if var_636_7 + var_636_0 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_7 + var_636_0
					end
				end

				arg_633_1.text_.text = var_636_4
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402154", "story_v_side_new_1109402.awb") ~= 0 then
					local var_636_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402154", "story_v_side_new_1109402.awb") / 1000

					if var_636_8 + var_636_0 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_8 + var_636_0
					end

					if var_636_3.prefab_name ~= "" and arg_633_1.actors_[var_636_3.prefab_name] ~= nil then
						local var_636_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_633_1.actors_[var_636_3.prefab_name].transform, "story_v_side_new_1109402", "1109402154", "story_v_side_new_1109402.awb")

						arg_633_1:RecordAudio("1109402154", var_636_9)
						arg_633_1:RecordAudio("1109402154", var_636_9)
					else
						arg_633_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402154", "story_v_side_new_1109402.awb")
					end

					arg_633_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402154", "story_v_side_new_1109402.awb")
				end

				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_10 = math.max(var_636_1, arg_633_1.talkMaxDuration)

			if var_636_0 <= arg_633_1.time_ and arg_633_1.time_ < var_636_0 + var_636_10 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_0) / var_636_10

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_0 + var_636_10 and arg_633_1.time_ < var_636_0 + var_636_10 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402155 = function(arg_637_0, arg_637_1)
		arg_637_1.time_ = 0
		arg_637_1.frameCnt_ = 0
		arg_637_1.state_ = "playing"
		arg_637_1.curTalkId_ = 1109402155
		arg_637_1.duration_ = 3.033

		local var_637_0 = {
			ja = 3.033,
			ko = 2.366,
			zh = 2.366
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
				arg_637_0:Play1109402156(arg_637_1)
			end
		end

		function arg_637_1.onSingleLineUpdate_(arg_640_0)
			local var_640_0 = arg_637_1.actors_["1094ui_story"].transform
			local var_640_1 = 0

			if var_640_1 < arg_637_1.time_ and arg_637_1.time_ <= var_640_1 + arg_640_0 then
				arg_637_1.var_.moveOldPos1094ui_story = var_640_0.localPosition
			end

			local var_640_2 = 0.001

			if var_640_1 <= arg_637_1.time_ and arg_637_1.time_ < var_640_1 + var_640_2 then
				local var_640_3 = (arg_637_1.time_ - var_640_1) / var_640_2
				local var_640_4 = Vector3.New(0, -0.84, -6.1)

				var_640_0.localPosition = Vector3.Lerp(arg_637_1.var_.moveOldPos1094ui_story, var_640_4, var_640_3)

				local var_640_5 = manager.ui.mainCamera.transform.position - var_640_0.position

				var_640_0.forward = Vector3.New(var_640_5.x, var_640_5.y, var_640_5.z)

				local var_640_6 = var_640_0.localEulerAngles

				var_640_6.z = 0
				var_640_6.x = 0
				var_640_0.localEulerAngles = var_640_6
			end

			if arg_637_1.time_ >= var_640_1 + var_640_2 and arg_637_1.time_ < var_640_1 + var_640_2 + arg_640_0 then
				var_640_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_640_7 = manager.ui.mainCamera.transform.position - var_640_0.position

				var_640_0.forward = Vector3.New(var_640_7.x, var_640_7.y, var_640_7.z)

				local var_640_8 = var_640_0.localEulerAngles

				var_640_8.z = 0
				var_640_8.x = 0
				var_640_0.localEulerAngles = var_640_8
			end

			local var_640_9 = arg_637_1.actors_["1094ui_story"]
			local var_640_10 = 0

			if var_640_10 < arg_637_1.time_ and arg_637_1.time_ <= var_640_10 + arg_640_0 and arg_637_1.var_.characterEffect1094ui_story == nil then
				arg_637_1.var_.characterEffect1094ui_story = var_640_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_640_11 = 0.200000002980232

			if var_640_10 <= arg_637_1.time_ and arg_637_1.time_ < var_640_10 + var_640_11 then
				local var_640_12 = (arg_637_1.time_ - var_640_10) / var_640_11

				if arg_637_1.var_.characterEffect1094ui_story then
					arg_637_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_637_1.time_ >= var_640_10 + var_640_11 and arg_637_1.time_ < var_640_10 + var_640_11 + arg_640_0 and arg_637_1.var_.characterEffect1094ui_story then
				arg_637_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_640_13 = 0

			if var_640_13 < arg_637_1.time_ and arg_637_1.time_ <= var_640_13 + arg_640_0 then
				arg_637_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_640_14 = 0

			if var_640_14 < arg_637_1.time_ and arg_637_1.time_ <= var_640_14 + arg_640_0 then
				arg_637_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_640_15 = 0
			local var_640_16 = 0.225

			if var_640_15 < arg_637_1.time_ and arg_637_1.time_ <= var_640_15 + arg_640_0 then
				arg_637_1.talkMaxDuration = 0
				arg_637_1.dialogCg_.alpha = 1

				arg_637_1.dialog_:SetActive(true)
				SetActive(arg_637_1.leftNameGo_, true)

				local var_640_17 = arg_637_1:FormatText(StoryNameCfg[181].name)

				arg_637_1.leftNameTxt_.text = var_640_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_637_1.leftNameTxt_.transform)

				arg_637_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_637_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_637_1:RecordName(arg_637_1.leftNameTxt_.text)
				SetActive(arg_637_1.iconTrs_.gameObject, false)
				arg_637_1.callingController_:SetSelectedState("normal")

				local var_640_18 = arg_637_1:GetWordFromCfg(1109402155)
				local var_640_19 = arg_637_1:FormatText(var_640_18.content)

				arg_637_1.text_.text = var_640_19

				LuaForUtil.ClearLinePrefixSymbol(arg_637_1.text_)

				local var_640_20 = 9
				local var_640_21 = utf8.len(var_640_19)
				local var_640_22 = var_640_20 <= 0 and var_640_16 or var_640_16 * (var_640_21 / var_640_20)

				if var_640_22 > 0 and var_640_16 < var_640_22 then
					arg_637_1.talkMaxDuration = var_640_22

					if var_640_22 + var_640_15 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_22 + var_640_15
					end
				end

				arg_637_1.text_.text = var_640_19
				arg_637_1.typewritter.percent = 0

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402155", "story_v_side_new_1109402.awb") ~= 0 then
					local var_640_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402155", "story_v_side_new_1109402.awb") / 1000

					if var_640_23 + var_640_15 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_23 + var_640_15
					end

					if var_640_18.prefab_name ~= "" and arg_637_1.actors_[var_640_18.prefab_name] ~= nil then
						local var_640_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_637_1.actors_[var_640_18.prefab_name].transform, "story_v_side_new_1109402", "1109402155", "story_v_side_new_1109402.awb")

						arg_637_1:RecordAudio("1109402155", var_640_24)
						arg_637_1:RecordAudio("1109402155", var_640_24)
					else
						arg_637_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402155", "story_v_side_new_1109402.awb")
					end

					arg_637_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402155", "story_v_side_new_1109402.awb")
				end

				arg_637_1:RecordContent(arg_637_1.text_.text)
			end

			local var_640_25 = math.max(var_640_16, arg_637_1.talkMaxDuration)

			if var_640_15 <= arg_637_1.time_ and arg_637_1.time_ < var_640_15 + var_640_25 then
				arg_637_1.typewritter.percent = (arg_637_1.time_ - var_640_15) / var_640_25

				arg_637_1.typewritter:SetDirty()
			end

			if arg_637_1.time_ >= var_640_15 + var_640_25 and arg_637_1.time_ < var_640_15 + var_640_25 + arg_640_0 then
				arg_637_1.typewritter.percent = 1

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402156 = function(arg_641_0, arg_641_1)
		arg_641_1.time_ = 0
		arg_641_1.frameCnt_ = 0
		arg_641_1.state_ = "playing"
		arg_641_1.curTalkId_ = 1109402156
		arg_641_1.duration_ = 6.333

		local var_641_0 = {
			ja = 4.966,
			ko = 6.333,
			zh = 6.333
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
				arg_641_0:Play1109402157(arg_641_1)
			end
		end

		function arg_641_1.onSingleLineUpdate_(arg_644_0)
			local var_644_0 = arg_641_1.actors_["1094ui_story"].transform
			local var_644_1 = 0

			if var_644_1 < arg_641_1.time_ and arg_641_1.time_ <= var_644_1 + arg_644_0 then
				arg_641_1.var_.moveOldPos1094ui_story = var_644_0.localPosition
			end

			local var_644_2 = 0.001

			if var_644_1 <= arg_641_1.time_ and arg_641_1.time_ < var_644_1 + var_644_2 then
				local var_644_3 = (arg_641_1.time_ - var_644_1) / var_644_2
				local var_644_4 = Vector3.New(0, -0.84, -6.1)

				var_644_0.localPosition = Vector3.Lerp(arg_641_1.var_.moveOldPos1094ui_story, var_644_4, var_644_3)

				local var_644_5 = manager.ui.mainCamera.transform.position - var_644_0.position

				var_644_0.forward = Vector3.New(var_644_5.x, var_644_5.y, var_644_5.z)

				local var_644_6 = var_644_0.localEulerAngles

				var_644_6.z = 0
				var_644_6.x = 0
				var_644_0.localEulerAngles = var_644_6
			end

			if arg_641_1.time_ >= var_644_1 + var_644_2 and arg_641_1.time_ < var_644_1 + var_644_2 + arg_644_0 then
				var_644_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_644_7 = manager.ui.mainCamera.transform.position - var_644_0.position

				var_644_0.forward = Vector3.New(var_644_7.x, var_644_7.y, var_644_7.z)

				local var_644_8 = var_644_0.localEulerAngles

				var_644_8.z = 0
				var_644_8.x = 0
				var_644_0.localEulerAngles = var_644_8
			end

			local var_644_9 = arg_641_1.actors_["1094ui_story"]
			local var_644_10 = 0

			if var_644_10 < arg_641_1.time_ and arg_641_1.time_ <= var_644_10 + arg_644_0 and arg_641_1.var_.characterEffect1094ui_story == nil then
				arg_641_1.var_.characterEffect1094ui_story = var_644_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_644_11 = 0.200000002980232

			if var_644_10 <= arg_641_1.time_ and arg_641_1.time_ < var_644_10 + var_644_11 then
				local var_644_12 = (arg_641_1.time_ - var_644_10) / var_644_11

				if arg_641_1.var_.characterEffect1094ui_story then
					arg_641_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_641_1.time_ >= var_644_10 + var_644_11 and arg_641_1.time_ < var_644_10 + var_644_11 + arg_644_0 and arg_641_1.var_.characterEffect1094ui_story then
				arg_641_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_644_13 = 0

			if var_644_13 < arg_641_1.time_ and arg_641_1.time_ <= var_644_13 + arg_644_0 then
				arg_641_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action5_1")
			end

			local var_644_14 = 0

			if var_644_14 < arg_641_1.time_ and arg_641_1.time_ <= var_644_14 + arg_644_0 then
				arg_641_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_644_15 = 0
			local var_644_16 = 0.5

			if var_644_15 < arg_641_1.time_ and arg_641_1.time_ <= var_644_15 + arg_644_0 then
				arg_641_1.talkMaxDuration = 0
				arg_641_1.dialogCg_.alpha = 1

				arg_641_1.dialog_:SetActive(true)
				SetActive(arg_641_1.leftNameGo_, true)

				local var_644_17 = arg_641_1:FormatText(StoryNameCfg[181].name)

				arg_641_1.leftNameTxt_.text = var_644_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_641_1.leftNameTxt_.transform)

				arg_641_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_641_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_641_1:RecordName(arg_641_1.leftNameTxt_.text)
				SetActive(arg_641_1.iconTrs_.gameObject, false)
				arg_641_1.callingController_:SetSelectedState("normal")

				local var_644_18 = arg_641_1:GetWordFromCfg(1109402156)
				local var_644_19 = arg_641_1:FormatText(var_644_18.content)

				arg_641_1.text_.text = var_644_19

				LuaForUtil.ClearLinePrefixSymbol(arg_641_1.text_)

				local var_644_20 = 20
				local var_644_21 = utf8.len(var_644_19)
				local var_644_22 = var_644_20 <= 0 and var_644_16 or var_644_16 * (var_644_21 / var_644_20)

				if var_644_22 > 0 and var_644_16 < var_644_22 then
					arg_641_1.talkMaxDuration = var_644_22

					if var_644_22 + var_644_15 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_22 + var_644_15
					end
				end

				arg_641_1.text_.text = var_644_19
				arg_641_1.typewritter.percent = 0

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402156", "story_v_side_new_1109402.awb") ~= 0 then
					local var_644_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402156", "story_v_side_new_1109402.awb") / 1000

					if var_644_23 + var_644_15 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_23 + var_644_15
					end

					if var_644_18.prefab_name ~= "" and arg_641_1.actors_[var_644_18.prefab_name] ~= nil then
						local var_644_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_641_1.actors_[var_644_18.prefab_name].transform, "story_v_side_new_1109402", "1109402156", "story_v_side_new_1109402.awb")

						arg_641_1:RecordAudio("1109402156", var_644_24)
						arg_641_1:RecordAudio("1109402156", var_644_24)
					else
						arg_641_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402156", "story_v_side_new_1109402.awb")
					end

					arg_641_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402156", "story_v_side_new_1109402.awb")
				end

				arg_641_1:RecordContent(arg_641_1.text_.text)
			end

			local var_644_25 = math.max(var_644_16, arg_641_1.talkMaxDuration)

			if var_644_15 <= arg_641_1.time_ and arg_641_1.time_ < var_644_15 + var_644_25 then
				arg_641_1.typewritter.percent = (arg_641_1.time_ - var_644_15) / var_644_25

				arg_641_1.typewritter:SetDirty()
			end

			if arg_641_1.time_ >= var_644_15 + var_644_25 and arg_641_1.time_ < var_644_15 + var_644_25 + arg_644_0 then
				arg_641_1.typewritter.percent = 1

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402157 = function(arg_645_0, arg_645_1)
		arg_645_1.time_ = 0
		arg_645_1.frameCnt_ = 0
		arg_645_1.state_ = "playing"
		arg_645_1.curTalkId_ = 1109402157
		arg_645_1.duration_ = 0.200000002979

		SetActive(arg_645_1.tipsGo_, false)

		function arg_645_1.onSingleLineFinish_()
			arg_645_1.onSingleLineUpdate_ = nil
			arg_645_1.onSingleLineFinish_ = nil
			arg_645_1.state_ = "waiting"

			SetActive(arg_645_1.choicesGo_, true)

			for iter_646_0, iter_646_1 in ipairs(arg_645_1.choices_) do
				local var_646_0 = iter_646_0 <= 1

				SetActive(iter_646_1.go, var_646_0)
			end

			arg_645_1.choices_[1].txt.text = arg_645_1:FormatText(StoryChoiceCfg[407].name)
		end

		function arg_645_1.playNext_(arg_647_0)
			if arg_647_0 == 1 then
				arg_645_0:Play1109402158(arg_645_1)
			end
		end

		function arg_645_1.onSingleLineUpdate_(arg_648_0)
			local var_648_0 = arg_645_1.actors_["1094ui_story"]
			local var_648_1 = 0

			if var_648_1 < arg_645_1.time_ and arg_645_1.time_ <= var_648_1 + arg_648_0 and arg_645_1.var_.characterEffect1094ui_story == nil then
				arg_645_1.var_.characterEffect1094ui_story = var_648_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_648_2 = 0.200000002980232

			if var_648_1 <= arg_645_1.time_ and arg_645_1.time_ < var_648_1 + var_648_2 then
				local var_648_3 = (arg_645_1.time_ - var_648_1) / var_648_2

				if arg_645_1.var_.characterEffect1094ui_story then
					local var_648_4 = Mathf.Lerp(0, 0.5, var_648_3)

					arg_645_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_645_1.var_.characterEffect1094ui_story.fillRatio = var_648_4
				end
			end

			if arg_645_1.time_ >= var_648_1 + var_648_2 and arg_645_1.time_ < var_648_1 + var_648_2 + arg_648_0 and arg_645_1.var_.characterEffect1094ui_story then
				local var_648_5 = 0.5

				arg_645_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_645_1.var_.characterEffect1094ui_story.fillRatio = var_648_5
			end

			local var_648_6 = 0
			local var_648_7 = 0.2

			if var_648_6 < arg_645_1.time_ and arg_645_1.time_ <= var_648_6 + arg_648_0 then
				local var_648_8 = "play"
				local var_648_9 = "music"

				arg_645_1:AudioAction(var_648_8, var_648_9, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_648_10 = 0

			if var_648_10 < arg_645_1.time_ and arg_645_1.time_ <= var_648_10 + arg_648_0 then
				arg_645_1.allBtn_.enabled = false
			end

			local var_648_11 = 0.200000002980232

			if arg_645_1.time_ >= var_648_10 + var_648_11 and arg_645_1.time_ < var_648_10 + var_648_11 + arg_648_0 then
				arg_645_1.allBtn_.enabled = true
			end
		end
	end,
	Play1109402158 = function(arg_649_0, arg_649_1)
		arg_649_1.time_ = 0
		arg_649_1.frameCnt_ = 0
		arg_649_1.state_ = "playing"
		arg_649_1.curTalkId_ = 1109402158
		arg_649_1.duration_ = 7

		SetActive(arg_649_1.tipsGo_, false)

		function arg_649_1.onSingleLineFinish_()
			arg_649_1.onSingleLineUpdate_ = nil
			arg_649_1.onSingleLineFinish_ = nil
			arg_649_1.state_ = "waiting"
		end

		function arg_649_1.playNext_(arg_651_0)
			if arg_651_0 == 1 then
				arg_649_0:Play1109402159(arg_649_1)
			end
		end

		function arg_649_1.onSingleLineUpdate_(arg_652_0)
			local var_652_0 = 0

			if var_652_0 < arg_649_1.time_ and arg_649_1.time_ <= var_652_0 + arg_652_0 then
				local var_652_1 = manager.ui.mainCamera.transform.localPosition
				local var_652_2 = Vector3.New(0, 0, 10) + Vector3.New(var_652_1.x, var_652_1.y, 0)
				local var_652_3 = arg_649_1.bgs_.STblack

				var_652_3.transform.localPosition = var_652_2
				var_652_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_652_4 = var_652_3:GetComponent("SpriteRenderer")

				if var_652_4 and var_652_4.sprite then
					local var_652_5 = (var_652_3.transform.localPosition - var_652_1).z
					local var_652_6 = manager.ui.mainCameraCom_
					local var_652_7 = 2 * var_652_5 * Mathf.Tan(var_652_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_652_8 = var_652_7 * var_652_6.aspect
					local var_652_9 = var_652_4.sprite.bounds.size.x
					local var_652_10 = var_652_4.sprite.bounds.size.y
					local var_652_11 = var_652_8 / var_652_9
					local var_652_12 = var_652_7 / var_652_10
					local var_652_13 = var_652_12 < var_652_11 and var_652_11 or var_652_12

					var_652_3.transform.localScale = Vector3.New(var_652_13, var_652_13, 0)
				end

				for iter_652_0, iter_652_1 in pairs(arg_649_1.bgs_) do
					if iter_652_0 ~= "STblack" then
						iter_652_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_652_14 = 0

			if var_652_14 < arg_649_1.time_ and arg_649_1.time_ <= var_652_14 + arg_652_0 then
				arg_649_1.mask_.enabled = true
				arg_649_1.mask_.raycastTarget = true

				arg_649_1:SetGaussion(false)
			end

			local var_652_15 = 2

			if var_652_14 <= arg_649_1.time_ and arg_649_1.time_ < var_652_14 + var_652_15 then
				local var_652_16 = (arg_649_1.time_ - var_652_14) / var_652_15
				local var_652_17 = Color.New(0, 0, 0)

				var_652_17.a = Mathf.Lerp(1, 0, var_652_16)
				arg_649_1.mask_.color = var_652_17
			end

			if arg_649_1.time_ >= var_652_14 + var_652_15 and arg_649_1.time_ < var_652_14 + var_652_15 + arg_652_0 then
				local var_652_18 = Color.New(0, 0, 0)
				local var_652_19 = 0

				arg_649_1.mask_.enabled = false
				var_652_18.a = var_652_19
				arg_649_1.mask_.color = var_652_18
			end

			local var_652_20 = arg_649_1.actors_["1094ui_story"].transform
			local var_652_21 = 0

			if var_652_21 < arg_649_1.time_ and arg_649_1.time_ <= var_652_21 + arg_652_0 then
				arg_649_1.var_.moveOldPos1094ui_story = var_652_20.localPosition
			end

			local var_652_22 = 0.001

			if var_652_21 <= arg_649_1.time_ and arg_649_1.time_ < var_652_21 + var_652_22 then
				local var_652_23 = (arg_649_1.time_ - var_652_21) / var_652_22
				local var_652_24 = Vector3.New(0, 100, 0)

				var_652_20.localPosition = Vector3.Lerp(arg_649_1.var_.moveOldPos1094ui_story, var_652_24, var_652_23)

				local var_652_25 = manager.ui.mainCamera.transform.position - var_652_20.position

				var_652_20.forward = Vector3.New(var_652_25.x, var_652_25.y, var_652_25.z)

				local var_652_26 = var_652_20.localEulerAngles

				var_652_26.z = 0
				var_652_26.x = 0
				var_652_20.localEulerAngles = var_652_26
			end

			if arg_649_1.time_ >= var_652_21 + var_652_22 and arg_649_1.time_ < var_652_21 + var_652_22 + arg_652_0 then
				var_652_20.localPosition = Vector3.New(0, 100, 0)

				local var_652_27 = manager.ui.mainCamera.transform.position - var_652_20.position

				var_652_20.forward = Vector3.New(var_652_27.x, var_652_27.y, var_652_27.z)

				local var_652_28 = var_652_20.localEulerAngles

				var_652_28.z = 0
				var_652_28.x = 0
				var_652_20.localEulerAngles = var_652_28
			end

			local var_652_29 = arg_649_1.actors_["1094ui_story"]
			local var_652_30 = 0

			if var_652_30 < arg_649_1.time_ and arg_649_1.time_ <= var_652_30 + arg_652_0 and arg_649_1.var_.characterEffect1094ui_story == nil then
				arg_649_1.var_.characterEffect1094ui_story = var_652_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_652_31 = 0.200000002980232

			if var_652_30 <= arg_649_1.time_ and arg_649_1.time_ < var_652_30 + var_652_31 then
				local var_652_32 = (arg_649_1.time_ - var_652_30) / var_652_31

				if arg_649_1.var_.characterEffect1094ui_story then
					local var_652_33 = Mathf.Lerp(0, 0.5, var_652_32)

					arg_649_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_649_1.var_.characterEffect1094ui_story.fillRatio = var_652_33
				end
			end

			if arg_649_1.time_ >= var_652_30 + var_652_31 and arg_649_1.time_ < var_652_30 + var_652_31 + arg_652_0 and arg_649_1.var_.characterEffect1094ui_story then
				local var_652_34 = 0.5

				arg_649_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_649_1.var_.characterEffect1094ui_story.fillRatio = var_652_34
			end

			local var_652_35 = 0
			local var_652_36 = 0.2

			if var_652_35 < arg_649_1.time_ and arg_649_1.time_ <= var_652_35 + arg_652_0 then
				local var_652_37 = "play"
				local var_652_38 = "music"

				arg_649_1:AudioAction(var_652_37, var_652_38, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_652_39 = 1.46666666666667
			local var_652_40 = 1

			if var_652_39 < arg_649_1.time_ and arg_649_1.time_ <= var_652_39 + arg_652_0 then
				local var_652_41 = "play"
				local var_652_42 = "music"

				arg_649_1:AudioAction(var_652_41, var_652_42, "bgm_activity_1_1_hel_story_warm", "bgm_activity_1_1_hel_story_warm", "bgm_activity_1_1_hel_story_warm.awb")
			end

			if arg_649_1.frameCnt_ <= 1 then
				arg_649_1.dialog_:SetActive(false)
			end

			local var_652_43 = 2
			local var_652_44 = 0.525

			if var_652_43 < arg_649_1.time_ and arg_649_1.time_ <= var_652_43 + arg_652_0 then
				arg_649_1.talkMaxDuration = 0

				arg_649_1.dialog_:SetActive(true)

				local var_652_45 = LeanTween.value(arg_649_1.dialog_, 0, 1, 0.3)

				var_652_45:setOnUpdate(LuaHelper.FloatAction(function(arg_653_0)
					arg_649_1.dialogCg_.alpha = arg_653_0
				end))
				var_652_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_649_1.dialog_)
					var_652_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_649_1.duration_ = arg_649_1.duration_ + 0.3

				SetActive(arg_649_1.leftNameGo_, false)

				arg_649_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_649_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_649_1:RecordName(arg_649_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_649_1.iconTrs_.gameObject, false)
				arg_649_1.callingController_:SetSelectedState("normal")

				local var_652_46 = arg_649_1:GetWordFromCfg(1109402158)
				local var_652_47 = arg_649_1:FormatText(var_652_46.content)

				arg_649_1.text_.text = var_652_47

				LuaForUtil.ClearLinePrefixSymbol(arg_649_1.text_)

				local var_652_48 = 24
				local var_652_49 = utf8.len(var_652_47)
				local var_652_50 = var_652_48 <= 0 and var_652_44 or var_652_44 * (var_652_49 / var_652_48)

				if var_652_50 > 0 and var_652_44 < var_652_50 then
					arg_649_1.talkMaxDuration = var_652_50
					var_652_43 = var_652_43 + 0.3

					if var_652_50 + var_652_43 > arg_649_1.duration_ then
						arg_649_1.duration_ = var_652_50 + var_652_43
					end
				end

				arg_649_1.text_.text = var_652_47
				arg_649_1.typewritter.percent = 0

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(false)
				arg_649_1:RecordContent(arg_649_1.text_.text)
			end

			local var_652_51 = var_652_43 + 0.3
			local var_652_52 = math.max(var_652_44, arg_649_1.talkMaxDuration)

			if var_652_51 <= arg_649_1.time_ and arg_649_1.time_ < var_652_51 + var_652_52 then
				arg_649_1.typewritter.percent = (arg_649_1.time_ - var_652_51) / var_652_52

				arg_649_1.typewritter:SetDirty()
			end

			if arg_649_1.time_ >= var_652_51 + var_652_52 and arg_649_1.time_ < var_652_51 + var_652_52 + arg_652_0 then
				arg_649_1.typewritter.percent = 1

				arg_649_1.typewritter:SetDirty()
				arg_649_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402159 = function(arg_655_0, arg_655_1)
		arg_655_1.time_ = 0
		arg_655_1.frameCnt_ = 0
		arg_655_1.state_ = "playing"
		arg_655_1.curTalkId_ = 1109402159
		arg_655_1.duration_ = 2.833

		local var_655_0 = {
			ja = 2.833,
			ko = 2.666,
			zh = 2.666
		}
		local var_655_1 = manager.audio:GetLocalizationFlag()

		if var_655_0[var_655_1] ~= nil then
			arg_655_1.duration_ = var_655_0[var_655_1]
		end

		SetActive(arg_655_1.tipsGo_, false)

		function arg_655_1.onSingleLineFinish_()
			arg_655_1.onSingleLineUpdate_ = nil
			arg_655_1.onSingleLineFinish_ = nil
			arg_655_1.state_ = "waiting"
		end

		function arg_655_1.playNext_(arg_657_0)
			if arg_657_0 == 1 then
				arg_655_0:Play1109402160(arg_655_1)
			end
		end

		function arg_655_1.onSingleLineUpdate_(arg_658_0)
			local var_658_0 = 0
			local var_658_1 = 0.225

			if var_658_0 < arg_655_1.time_ and arg_655_1.time_ <= var_658_0 + arg_658_0 then
				arg_655_1.talkMaxDuration = 0
				arg_655_1.dialogCg_.alpha = 1

				arg_655_1.dialog_:SetActive(true)
				SetActive(arg_655_1.leftNameGo_, true)

				local var_658_2 = arg_655_1:FormatText(StoryNameCfg[181].name)

				arg_655_1.leftNameTxt_.text = var_658_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_655_1.leftNameTxt_.transform)

				arg_655_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_655_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_655_1:RecordName(arg_655_1.leftNameTxt_.text)
				SetActive(arg_655_1.iconTrs_.gameObject, true)
				arg_655_1.iconController_:SetSelectedState("hero")

				arg_655_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1094")

				arg_655_1.callingController_:SetSelectedState("normal")

				local var_658_3 = arg_655_1:GetWordFromCfg(1109402159)
				local var_658_4 = arg_655_1:FormatText(var_658_3.content)

				arg_655_1.text_.text = var_658_4

				LuaForUtil.ClearLinePrefixSymbol(arg_655_1.text_)

				local var_658_5 = 9
				local var_658_6 = utf8.len(var_658_4)
				local var_658_7 = var_658_5 <= 0 and var_658_1 or var_658_1 * (var_658_6 / var_658_5)

				if var_658_7 > 0 and var_658_1 < var_658_7 then
					arg_655_1.talkMaxDuration = var_658_7

					if var_658_7 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_7 + var_658_0
					end
				end

				arg_655_1.text_.text = var_658_4
				arg_655_1.typewritter.percent = 0

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402159", "story_v_side_new_1109402.awb") ~= 0 then
					local var_658_8 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402159", "story_v_side_new_1109402.awb") / 1000

					if var_658_8 + var_658_0 > arg_655_1.duration_ then
						arg_655_1.duration_ = var_658_8 + var_658_0
					end

					if var_658_3.prefab_name ~= "" and arg_655_1.actors_[var_658_3.prefab_name] ~= nil then
						local var_658_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_655_1.actors_[var_658_3.prefab_name].transform, "story_v_side_new_1109402", "1109402159", "story_v_side_new_1109402.awb")

						arg_655_1:RecordAudio("1109402159", var_658_9)
						arg_655_1:RecordAudio("1109402159", var_658_9)
					else
						arg_655_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402159", "story_v_side_new_1109402.awb")
					end

					arg_655_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402159", "story_v_side_new_1109402.awb")
				end

				arg_655_1:RecordContent(arg_655_1.text_.text)
			end

			local var_658_10 = math.max(var_658_1, arg_655_1.talkMaxDuration)

			if var_658_0 <= arg_655_1.time_ and arg_655_1.time_ < var_658_0 + var_658_10 then
				arg_655_1.typewritter.percent = (arg_655_1.time_ - var_658_0) / var_658_10

				arg_655_1.typewritter:SetDirty()
			end

			if arg_655_1.time_ >= var_658_0 + var_658_10 and arg_655_1.time_ < var_658_0 + var_658_10 + arg_658_0 then
				arg_655_1.typewritter.percent = 1

				arg_655_1.typewritter:SetDirty()
				arg_655_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402160 = function(arg_659_0, arg_659_1)
		arg_659_1.time_ = 0
		arg_659_1.frameCnt_ = 0
		arg_659_1.state_ = "playing"
		arg_659_1.curTalkId_ = 1109402160
		arg_659_1.duration_ = 7.965999999999

		SetActive(arg_659_1.tipsGo_, false)

		function arg_659_1.onSingleLineFinish_()
			arg_659_1.onSingleLineUpdate_ = nil
			arg_659_1.onSingleLineFinish_ = nil
			arg_659_1.state_ = "waiting"
		end

		function arg_659_1.playNext_(arg_661_0)
			if arg_661_0 == 1 then
				arg_659_0:Play1109402161(arg_659_1)
			end
		end

		function arg_659_1.onSingleLineUpdate_(arg_662_0)
			local var_662_0 = 0

			if var_662_0 < arg_659_1.time_ and arg_659_1.time_ <= var_662_0 + arg_662_0 then
				arg_659_1.fswbg_:SetActive(true)
				arg_659_1.dialog_:SetActive(false)

				arg_659_1.fswtw_.percent = 0

				local var_662_1 = arg_659_1:GetWordFromCfg(1109402160)
				local var_662_2 = arg_659_1:FormatText(var_662_1.content)

				arg_659_1.fswt_.text = var_662_2

				LuaForUtil.ClearLinePrefixSymbol(arg_659_1.fswt_)

				arg_659_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_659_1.fswtw_:SetDirty()

				arg_659_1.typewritterCharCountI18N = 0

				arg_659_1:ShowNextGo(false)
			end

			local var_662_3 = 0.0166666666666667

			if var_662_3 < arg_659_1.time_ and arg_659_1.time_ <= var_662_3 + arg_662_0 then
				arg_659_1.var_.oldValueTypewriter = arg_659_1.fswtw_.percent

				arg_659_1:ShowNextGo(false)
			end

			local var_662_4 = 0
			local var_662_5 = -9.33333333333333
			local var_662_6 = arg_659_1:GetWordFromCfg(1109402160)
			local var_662_7 = arg_659_1:FormatText(var_662_6.content)
			local var_662_8, var_662_9 = arg_659_1:GetPercentByPara(var_662_7, 1)

			if var_662_3 < arg_659_1.time_ and arg_659_1.time_ <= var_662_3 + arg_662_0 then
				arg_659_1.talkMaxDuration = 0

				local var_662_10 = var_662_4 <= 0 and var_662_5 or var_662_5 * ((var_662_9 - arg_659_1.typewritterCharCountI18N) / var_662_4)

				if var_662_10 > 0 and var_662_5 < var_662_10 then
					arg_659_1.talkMaxDuration = var_662_10

					if var_662_10 + var_662_3 > arg_659_1.duration_ then
						arg_659_1.duration_ = var_662_10 + var_662_3
					end
				end
			end

			local var_662_11 = -9.33333333333333
			local var_662_12 = math.max(var_662_11, arg_659_1.talkMaxDuration)

			if var_662_3 <= arg_659_1.time_ and arg_659_1.time_ < var_662_3 + var_662_12 then
				local var_662_13 = (arg_659_1.time_ - var_662_3) / var_662_12

				arg_659_1.fswtw_.percent = Mathf.Lerp(arg_659_1.var_.oldValueTypewriter, var_662_8, var_662_13)
				arg_659_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_659_1.fswtw_:SetDirty()
			end

			if arg_659_1.time_ >= var_662_3 + var_662_12 and arg_659_1.time_ < var_662_3 + var_662_12 + arg_662_0 then
				arg_659_1.fswtw_.percent = var_662_8

				arg_659_1.fswtw_:SetDirty()
				arg_659_1:ShowNextGo(true)

				arg_659_1.typewritterCharCountI18N = var_662_9
			end

			local var_662_14 = 0
			local var_662_15 = 7.966
			local var_662_16 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402160", "story_v_side_new_1109402.awb") / 1000

			if var_662_16 > 0 and var_662_15 < var_662_16 and var_662_16 + var_662_14 > arg_659_1.duration_ then
				local var_662_17 = var_662_16

				arg_659_1.duration_ = var_662_16 + var_662_14
			end

			if var_662_14 < arg_659_1.time_ and arg_659_1.time_ <= var_662_14 + arg_662_0 then
				local var_662_18 = "play"
				local var_662_19 = "voice"

				arg_659_1:AudioAction(var_662_18, var_662_19, "story_v_side_new_1109402", "1109402160", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402161 = function(arg_663_0, arg_663_1)
		arg_663_1.time_ = 0
		arg_663_1.frameCnt_ = 0
		arg_663_1.state_ = "playing"
		arg_663_1.curTalkId_ = 1109402161
		arg_663_1.duration_ = 5.665999999999

		SetActive(arg_663_1.tipsGo_, false)

		function arg_663_1.onSingleLineFinish_()
			arg_663_1.onSingleLineUpdate_ = nil
			arg_663_1.onSingleLineFinish_ = nil
			arg_663_1.state_ = "waiting"
		end

		function arg_663_1.playNext_(arg_665_0)
			if arg_665_0 == 1 then
				arg_663_0:Play1109402162(arg_663_1)
			end
		end

		function arg_663_1.onSingleLineUpdate_(arg_666_0)
			local var_666_0 = 0

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.var_.oldValueTypewriter = arg_663_1.fswtw_.percent

				arg_663_1:ShowNextGo(false)
			end

			local var_666_1 = 0
			local var_666_2 = 0
			local var_666_3 = arg_663_1:GetWordFromCfg(1109402160)
			local var_666_4 = arg_663_1:FormatText(var_666_3.content)
			local var_666_5, var_666_6 = arg_663_1:GetPercentByPara(var_666_4, 6)

			if var_666_0 < arg_663_1.time_ and arg_663_1.time_ <= var_666_0 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0

				local var_666_7 = var_666_1 <= 0 and var_666_2 or var_666_2 * ((var_666_6 - arg_663_1.typewritterCharCountI18N) / var_666_1)

				if var_666_7 > 0 and var_666_2 < var_666_7 then
					arg_663_1.talkMaxDuration = var_666_7

					if var_666_7 + var_666_0 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_7 + var_666_0
					end
				end
			end

			local var_666_8 = 0
			local var_666_9 = math.max(var_666_8, arg_663_1.talkMaxDuration)

			if var_666_0 <= arg_663_1.time_ and arg_663_1.time_ < var_666_0 + var_666_9 then
				local var_666_10 = (arg_663_1.time_ - var_666_0) / var_666_9

				arg_663_1.fswtw_.percent = Mathf.Lerp(arg_663_1.var_.oldValueTypewriter, var_666_5, var_666_10)
				arg_663_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_663_1.fswtw_:SetDirty()
			end

			if arg_663_1.time_ >= var_666_0 + var_666_9 and arg_663_1.time_ < var_666_0 + var_666_9 + arg_666_0 then
				arg_663_1.fswtw_.percent = var_666_5

				arg_663_1.fswtw_:SetDirty()
				arg_663_1:ShowNextGo(true)

				arg_663_1.typewritterCharCountI18N = var_666_6
			end

			local var_666_11 = 0

			if var_666_11 < arg_663_1.time_ and arg_663_1.time_ <= var_666_11 + arg_666_0 then
				arg_663_1.var_.oldValueTypewriter = arg_663_1.fswtw_.percent

				arg_663_1:ShowNextGo(false)
			end

			local var_666_12 = 42
			local var_666_13 = 2.8
			local var_666_14 = arg_663_1:GetWordFromCfg(1109402160)
			local var_666_15 = arg_663_1:FormatText(var_666_14.content)
			local var_666_16, var_666_17 = arg_663_1:GetPercentByPara(var_666_15, 1)

			if var_666_11 < arg_663_1.time_ and arg_663_1.time_ <= var_666_11 + arg_666_0 then
				arg_663_1.talkMaxDuration = 0

				local var_666_18 = var_666_12 <= 0 and var_666_13 or var_666_13 * ((var_666_17 - arg_663_1.typewritterCharCountI18N) / var_666_12)

				if var_666_18 > 0 and var_666_13 < var_666_18 then
					arg_663_1.talkMaxDuration = var_666_18

					if var_666_18 + var_666_11 > arg_663_1.duration_ then
						arg_663_1.duration_ = var_666_18 + var_666_11
					end
				end
			end

			local var_666_19 = 2.8
			local var_666_20 = math.max(var_666_19, arg_663_1.talkMaxDuration)

			if var_666_11 <= arg_663_1.time_ and arg_663_1.time_ < var_666_11 + var_666_20 then
				local var_666_21 = (arg_663_1.time_ - var_666_11) / var_666_20

				arg_663_1.fswtw_.percent = Mathf.Lerp(arg_663_1.var_.oldValueTypewriter, var_666_16, var_666_21)
				arg_663_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_663_1.fswtw_:SetDirty()
			end

			if arg_663_1.time_ >= var_666_11 + var_666_20 and arg_663_1.time_ < var_666_11 + var_666_20 + arg_666_0 then
				arg_663_1.fswtw_.percent = var_666_16

				arg_663_1.fswtw_:SetDirty()
				arg_663_1:ShowNextGo(true)

				arg_663_1.typewritterCharCountI18N = var_666_17
			end

			local var_666_22 = 0
			local var_666_23 = 5.666
			local var_666_24 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402161", "story_v_side_new_1109402.awb") / 1000

			if var_666_24 > 0 and var_666_23 < var_666_24 and var_666_24 + var_666_22 > arg_663_1.duration_ then
				local var_666_25 = var_666_24

				arg_663_1.duration_ = var_666_24 + var_666_22
			end

			if var_666_22 < arg_663_1.time_ and arg_663_1.time_ <= var_666_22 + arg_666_0 then
				local var_666_26 = "play"
				local var_666_27 = "voice"

				arg_663_1:AudioAction(var_666_26, var_666_27, "story_v_side_new_1109402", "1109402161", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402162 = function(arg_667_0, arg_667_1)
		arg_667_1.time_ = 0
		arg_667_1.frameCnt_ = 0
		arg_667_1.state_ = "playing"
		arg_667_1.curTalkId_ = 1109402162
		arg_667_1.duration_ = 3.465999999999

		SetActive(arg_667_1.tipsGo_, false)

		function arg_667_1.onSingleLineFinish_()
			arg_667_1.onSingleLineUpdate_ = nil
			arg_667_1.onSingleLineFinish_ = nil
			arg_667_1.state_ = "waiting"
		end

		function arg_667_1.playNext_(arg_669_0)
			if arg_669_0 == 1 then
				arg_667_0:Play1109402163(arg_667_1)
			end
		end

		function arg_667_1.onSingleLineUpdate_(arg_670_0)
			local var_670_0 = 0

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.var_.oldValueTypewriter = arg_667_1.fswtw_.percent

				arg_667_1:ShowNextGo(false)
			end

			local var_670_1 = 0
			local var_670_2 = 0
			local var_670_3 = arg_667_1:GetWordFromCfg(1109402160)
			local var_670_4 = arg_667_1:FormatText(var_670_3.content)
			local var_670_5, var_670_6 = arg_667_1:GetPercentByPara(var_670_4, 6)

			if var_670_0 < arg_667_1.time_ and arg_667_1.time_ <= var_670_0 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0

				local var_670_7 = var_670_1 <= 0 and var_670_2 or var_670_2 * ((var_670_6 - arg_667_1.typewritterCharCountI18N) / var_670_1)

				if var_670_7 > 0 and var_670_2 < var_670_7 then
					arg_667_1.talkMaxDuration = var_670_7

					if var_670_7 + var_670_0 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_7 + var_670_0
					end
				end
			end

			local var_670_8 = 0
			local var_670_9 = math.max(var_670_8, arg_667_1.talkMaxDuration)

			if var_670_0 <= arg_667_1.time_ and arg_667_1.time_ < var_670_0 + var_670_9 then
				local var_670_10 = (arg_667_1.time_ - var_670_0) / var_670_9

				arg_667_1.fswtw_.percent = Mathf.Lerp(arg_667_1.var_.oldValueTypewriter, var_670_5, var_670_10)
				arg_667_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_667_1.fswtw_:SetDirty()
			end

			if arg_667_1.time_ >= var_670_0 + var_670_9 and arg_667_1.time_ < var_670_0 + var_670_9 + arg_670_0 then
				arg_667_1.fswtw_.percent = var_670_5

				arg_667_1.fswtw_:SetDirty()
				arg_667_1:ShowNextGo(true)

				arg_667_1.typewritterCharCountI18N = var_670_6
			end

			local var_670_11 = 0

			if var_670_11 < arg_667_1.time_ and arg_667_1.time_ <= var_670_11 + arg_670_0 then
				arg_667_1.var_.oldValueTypewriter = arg_667_1.fswtw_.percent

				arg_667_1:ShowNextGo(false)
			end

			local var_670_12 = 40
			local var_670_13 = 1.26666666666667
			local var_670_14 = arg_667_1:GetWordFromCfg(1109402160)
			local var_670_15 = arg_667_1:FormatText(var_670_14.content)
			local var_670_16, var_670_17 = arg_667_1:GetPercentByPara(var_670_15, 3)

			if var_670_11 < arg_667_1.time_ and arg_667_1.time_ <= var_670_11 + arg_670_0 then
				arg_667_1.talkMaxDuration = 0

				local var_670_18 = var_670_12 <= 0 and var_670_13 or var_670_13 * ((var_670_17 - arg_667_1.typewritterCharCountI18N) / var_670_12)

				if var_670_18 > 0 and var_670_13 < var_670_18 then
					arg_667_1.talkMaxDuration = var_670_18

					if var_670_18 + var_670_11 > arg_667_1.duration_ then
						arg_667_1.duration_ = var_670_18 + var_670_11
					end
				end
			end

			local var_670_19 = 1.26666666666667
			local var_670_20 = math.max(var_670_19, arg_667_1.talkMaxDuration)

			if var_670_11 <= arg_667_1.time_ and arg_667_1.time_ < var_670_11 + var_670_20 then
				local var_670_21 = (arg_667_1.time_ - var_670_11) / var_670_20

				arg_667_1.fswtw_.percent = Mathf.Lerp(arg_667_1.var_.oldValueTypewriter, var_670_16, var_670_21)
				arg_667_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_667_1.fswtw_:SetDirty()
			end

			if arg_667_1.time_ >= var_670_11 + var_670_20 and arg_667_1.time_ < var_670_11 + var_670_20 + arg_670_0 then
				arg_667_1.fswtw_.percent = var_670_16

				arg_667_1.fswtw_:SetDirty()
				arg_667_1:ShowNextGo(true)

				arg_667_1.typewritterCharCountI18N = var_670_17
			end

			local var_670_22 = 0
			local var_670_23 = 3.466
			local var_670_24 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402162", "story_v_side_new_1109402.awb") / 1000

			if var_670_24 > 0 and var_670_23 < var_670_24 and var_670_24 + var_670_22 > arg_667_1.duration_ then
				local var_670_25 = var_670_24

				arg_667_1.duration_ = var_670_24 + var_670_22
			end

			if var_670_22 < arg_667_1.time_ and arg_667_1.time_ <= var_670_22 + arg_670_0 then
				local var_670_26 = "play"
				local var_670_27 = "voice"

				arg_667_1:AudioAction(var_670_26, var_670_27, "story_v_side_new_1109402", "1109402162", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402163 = function(arg_671_0, arg_671_1)
		arg_671_1.time_ = 0
		arg_671_1.frameCnt_ = 0
		arg_671_1.state_ = "playing"
		arg_671_1.curTalkId_ = 1109402163
		arg_671_1.duration_ = 1.399999999999

		SetActive(arg_671_1.tipsGo_, false)

		function arg_671_1.onSingleLineFinish_()
			arg_671_1.onSingleLineUpdate_ = nil
			arg_671_1.onSingleLineFinish_ = nil
			arg_671_1.state_ = "waiting"
		end

		function arg_671_1.playNext_(arg_673_0)
			if arg_673_0 == 1 then
				arg_671_0:Play1109402164(arg_671_1)
			end
		end

		function arg_671_1.onSingleLineUpdate_(arg_674_0)
			local var_674_0 = 0

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.var_.oldValueTypewriter = arg_671_1.fswtw_.percent

				arg_671_1:ShowNextGo(false)
			end

			local var_674_1 = 0
			local var_674_2 = 0
			local var_674_3 = arg_671_1:GetWordFromCfg(1109402160)
			local var_674_4 = arg_671_1:FormatText(var_674_3.content)
			local var_674_5, var_674_6 = arg_671_1:GetPercentByPara(var_674_4, 6)

			if var_674_0 < arg_671_1.time_ and arg_671_1.time_ <= var_674_0 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0

				local var_674_7 = var_674_1 <= 0 and var_674_2 or var_674_2 * ((var_674_6 - arg_671_1.typewritterCharCountI18N) / var_674_1)

				if var_674_7 > 0 and var_674_2 < var_674_7 then
					arg_671_1.talkMaxDuration = var_674_7

					if var_674_7 + var_674_0 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_7 + var_674_0
					end
				end
			end

			local var_674_8 = 0
			local var_674_9 = math.max(var_674_8, arg_671_1.talkMaxDuration)

			if var_674_0 <= arg_671_1.time_ and arg_671_1.time_ < var_674_0 + var_674_9 then
				local var_674_10 = (arg_671_1.time_ - var_674_0) / var_674_9

				arg_671_1.fswtw_.percent = Mathf.Lerp(arg_671_1.var_.oldValueTypewriter, var_674_5, var_674_10)
				arg_671_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_671_1.fswtw_:SetDirty()
			end

			if arg_671_1.time_ >= var_674_0 + var_674_9 and arg_671_1.time_ < var_674_0 + var_674_9 + arg_674_0 then
				arg_671_1.fswtw_.percent = var_674_5

				arg_671_1.fswtw_:SetDirty()
				arg_671_1:ShowNextGo(true)

				arg_671_1.typewritterCharCountI18N = var_674_6
			end

			local var_674_11 = 0

			if var_674_11 < arg_671_1.time_ and arg_671_1.time_ <= var_674_11 + arg_674_0 then
				arg_671_1.var_.oldValueTypewriter = arg_671_1.fswtw_.percent

				arg_671_1:ShowNextGo(false)
			end

			local var_674_12 = 21
			local var_674_13 = 1.4
			local var_674_14 = arg_671_1:GetWordFromCfg(1109402160)
			local var_674_15 = arg_671_1:FormatText(var_674_14.content)
			local var_674_16, var_674_17 = arg_671_1:GetPercentByPara(var_674_15, 4)

			if var_674_11 < arg_671_1.time_ and arg_671_1.time_ <= var_674_11 + arg_674_0 then
				arg_671_1.talkMaxDuration = 0

				local var_674_18 = var_674_12 <= 0 and var_674_13 or var_674_13 * ((var_674_17 - arg_671_1.typewritterCharCountI18N) / var_674_12)

				if var_674_18 > 0 and var_674_13 < var_674_18 then
					arg_671_1.talkMaxDuration = var_674_18

					if var_674_18 + var_674_11 > arg_671_1.duration_ then
						arg_671_1.duration_ = var_674_18 + var_674_11
					end
				end
			end

			local var_674_19 = 1.4
			local var_674_20 = math.max(var_674_19, arg_671_1.talkMaxDuration)

			if var_674_11 <= arg_671_1.time_ and arg_671_1.time_ < var_674_11 + var_674_20 then
				local var_674_21 = (arg_671_1.time_ - var_674_11) / var_674_20

				arg_671_1.fswtw_.percent = Mathf.Lerp(arg_671_1.var_.oldValueTypewriter, var_674_16, var_674_21)
				arg_671_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_671_1.fswtw_:SetDirty()
			end

			if arg_671_1.time_ >= var_674_11 + var_674_20 and arg_671_1.time_ < var_674_11 + var_674_20 + arg_674_0 then
				arg_671_1.fswtw_.percent = var_674_16

				arg_671_1.fswtw_:SetDirty()
				arg_671_1:ShowNextGo(true)

				arg_671_1.typewritterCharCountI18N = var_674_17
			end
		end
	end,
	Play1109402164 = function(arg_675_0, arg_675_1)
		arg_675_1.time_ = 0
		arg_675_1.frameCnt_ = 0
		arg_675_1.state_ = "playing"
		arg_675_1.curTalkId_ = 1109402164
		arg_675_1.duration_ = 2.466666666666

		SetActive(arg_675_1.tipsGo_, false)

		function arg_675_1.onSingleLineFinish_()
			arg_675_1.onSingleLineUpdate_ = nil
			arg_675_1.onSingleLineFinish_ = nil
			arg_675_1.state_ = "waiting"
		end

		function arg_675_1.playNext_(arg_677_0)
			if arg_677_0 == 1 then
				arg_675_0:Play1109402165(arg_675_1)
			end
		end

		function arg_675_1.onSingleLineUpdate_(arg_678_0)
			local var_678_0 = 0

			if var_678_0 < arg_675_1.time_ and arg_675_1.time_ <= var_678_0 + arg_678_0 then
				arg_675_1.var_.oldValueTypewriter = arg_675_1.fswtw_.percent

				arg_675_1:ShowNextGo(false)
			end

			local var_678_1 = 0
			local var_678_2 = 0
			local var_678_3 = arg_675_1:GetWordFromCfg(1109402160)
			local var_678_4 = arg_675_1:FormatText(var_678_3.content)
			local var_678_5, var_678_6 = arg_675_1:GetPercentByPara(var_678_4, 6)

			if var_678_0 < arg_675_1.time_ and arg_675_1.time_ <= var_678_0 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0

				local var_678_7 = var_678_1 <= 0 and var_678_2 or var_678_2 * ((var_678_6 - arg_675_1.typewritterCharCountI18N) / var_678_1)

				if var_678_7 > 0 and var_678_2 < var_678_7 then
					arg_675_1.talkMaxDuration = var_678_7

					if var_678_7 + var_678_0 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_7 + var_678_0
					end
				end
			end

			local var_678_8 = 0
			local var_678_9 = math.max(var_678_8, arg_675_1.talkMaxDuration)

			if var_678_0 <= arg_675_1.time_ and arg_675_1.time_ < var_678_0 + var_678_9 then
				local var_678_10 = (arg_675_1.time_ - var_678_0) / var_678_9

				arg_675_1.fswtw_.percent = Mathf.Lerp(arg_675_1.var_.oldValueTypewriter, var_678_5, var_678_10)
				arg_675_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_675_1.fswtw_:SetDirty()
			end

			if arg_675_1.time_ >= var_678_0 + var_678_9 and arg_675_1.time_ < var_678_0 + var_678_9 + arg_678_0 then
				arg_675_1.fswtw_.percent = var_678_5

				arg_675_1.fswtw_:SetDirty()
				arg_675_1:ShowNextGo(true)

				arg_675_1.typewritterCharCountI18N = var_678_6
			end

			local var_678_11 = 0

			if var_678_11 < arg_675_1.time_ and arg_675_1.time_ <= var_678_11 + arg_678_0 then
				arg_675_1.var_.oldValueTypewriter = arg_675_1.fswtw_.percent

				arg_675_1:ShowNextGo(false)
			end

			local var_678_12 = 37
			local var_678_13 = 2.46666666666667
			local var_678_14 = arg_675_1:GetWordFromCfg(1109402160)
			local var_678_15 = arg_675_1:FormatText(var_678_14.content)
			local var_678_16, var_678_17 = arg_675_1:GetPercentByPara(var_678_15, 5)

			if var_678_11 < arg_675_1.time_ and arg_675_1.time_ <= var_678_11 + arg_678_0 then
				arg_675_1.talkMaxDuration = 0

				local var_678_18 = var_678_12 <= 0 and var_678_13 or var_678_13 * ((var_678_17 - arg_675_1.typewritterCharCountI18N) / var_678_12)

				if var_678_18 > 0 and var_678_13 < var_678_18 then
					arg_675_1.talkMaxDuration = var_678_18

					if var_678_18 + var_678_11 > arg_675_1.duration_ then
						arg_675_1.duration_ = var_678_18 + var_678_11
					end
				end
			end

			local var_678_19 = 2.46666666666667
			local var_678_20 = math.max(var_678_19, arg_675_1.talkMaxDuration)

			if var_678_11 <= arg_675_1.time_ and arg_675_1.time_ < var_678_11 + var_678_20 then
				local var_678_21 = (arg_675_1.time_ - var_678_11) / var_678_20

				arg_675_1.fswtw_.percent = Mathf.Lerp(arg_675_1.var_.oldValueTypewriter, var_678_16, var_678_21)
				arg_675_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_675_1.fswtw_:SetDirty()
			end

			if arg_675_1.time_ >= var_678_11 + var_678_20 and arg_675_1.time_ < var_678_11 + var_678_20 + arg_678_0 then
				arg_675_1.fswtw_.percent = var_678_16

				arg_675_1.fswtw_:SetDirty()
				arg_675_1:ShowNextGo(true)

				arg_675_1.typewritterCharCountI18N = var_678_17
			end
		end
	end,
	Play1109402165 = function(arg_679_0, arg_679_1)
		arg_679_1.time_ = 0
		arg_679_1.frameCnt_ = 0
		arg_679_1.state_ = "playing"
		arg_679_1.curTalkId_ = 1109402165
		arg_679_1.duration_ = 5.399999999999

		SetActive(arg_679_1.tipsGo_, false)

		function arg_679_1.onSingleLineFinish_()
			arg_679_1.onSingleLineUpdate_ = nil
			arg_679_1.onSingleLineFinish_ = nil
			arg_679_1.state_ = "waiting"
		end

		function arg_679_1.playNext_(arg_681_0)
			if arg_681_0 == 1 then
				arg_679_0:Play1109402166(arg_679_1)
			end
		end

		function arg_679_1.onSingleLineUpdate_(arg_682_0)
			local var_682_0 = 0

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.var_.oldValueTypewriter = arg_679_1.fswtw_.percent

				arg_679_1:ShowNextGo(false)
			end

			local var_682_1 = 0
			local var_682_2 = 0
			local var_682_3 = arg_679_1:GetWordFromCfg(1109402160)
			local var_682_4 = arg_679_1:FormatText(var_682_3.content)
			local var_682_5, var_682_6 = arg_679_1:GetPercentByPara(var_682_4, 6)

			if var_682_0 < arg_679_1.time_ and arg_679_1.time_ <= var_682_0 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0

				local var_682_7 = var_682_1 <= 0 and var_682_2 or var_682_2 * ((var_682_6 - arg_679_1.typewritterCharCountI18N) / var_682_1)

				if var_682_7 > 0 and var_682_2 < var_682_7 then
					arg_679_1.talkMaxDuration = var_682_7

					if var_682_7 + var_682_0 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_7 + var_682_0
					end
				end
			end

			local var_682_8 = 0
			local var_682_9 = math.max(var_682_8, arg_679_1.talkMaxDuration)

			if var_682_0 <= arg_679_1.time_ and arg_679_1.time_ < var_682_0 + var_682_9 then
				local var_682_10 = (arg_679_1.time_ - var_682_0) / var_682_9

				arg_679_1.fswtw_.percent = Mathf.Lerp(arg_679_1.var_.oldValueTypewriter, var_682_5, var_682_10)
				arg_679_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_679_1.fswtw_:SetDirty()
			end

			if arg_679_1.time_ >= var_682_0 + var_682_9 and arg_679_1.time_ < var_682_0 + var_682_9 + arg_682_0 then
				arg_679_1.fswtw_.percent = var_682_5

				arg_679_1.fswtw_:SetDirty()
				arg_679_1:ShowNextGo(true)

				arg_679_1.typewritterCharCountI18N = var_682_6
			end

			local var_682_11 = 0

			if var_682_11 < arg_679_1.time_ and arg_679_1.time_ <= var_682_11 + arg_682_0 then
				arg_679_1.var_.oldValueTypewriter = arg_679_1.fswtw_.percent

				arg_679_1:ShowNextGo(false)
			end

			local var_682_12 = 25
			local var_682_13 = 1.66666666666667
			local var_682_14 = arg_679_1:GetWordFromCfg(1109402160)
			local var_682_15 = arg_679_1:FormatText(var_682_14.content)
			local var_682_16, var_682_17 = arg_679_1:GetPercentByPara(var_682_15, 6)

			if var_682_11 < arg_679_1.time_ and arg_679_1.time_ <= var_682_11 + arg_682_0 then
				arg_679_1.talkMaxDuration = 0

				local var_682_18 = var_682_12 <= 0 and var_682_13 or var_682_13 * ((var_682_17 - arg_679_1.typewritterCharCountI18N) / var_682_12)

				if var_682_18 > 0 and var_682_13 < var_682_18 then
					arg_679_1.talkMaxDuration = var_682_18

					if var_682_18 + var_682_11 > arg_679_1.duration_ then
						arg_679_1.duration_ = var_682_18 + var_682_11
					end
				end
			end

			local var_682_19 = 1.66666666666667
			local var_682_20 = math.max(var_682_19, arg_679_1.talkMaxDuration)

			if var_682_11 <= arg_679_1.time_ and arg_679_1.time_ < var_682_11 + var_682_20 then
				local var_682_21 = (arg_679_1.time_ - var_682_11) / var_682_20

				arg_679_1.fswtw_.percent = Mathf.Lerp(arg_679_1.var_.oldValueTypewriter, var_682_16, var_682_21)
				arg_679_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_679_1.fswtw_:SetDirty()
			end

			if arg_679_1.time_ >= var_682_11 + var_682_20 and arg_679_1.time_ < var_682_11 + var_682_20 + arg_682_0 then
				arg_679_1.fswtw_.percent = var_682_16

				arg_679_1.fswtw_:SetDirty()
				arg_679_1:ShowNextGo(true)

				arg_679_1.typewritterCharCountI18N = var_682_17
			end

			local var_682_22 = 0
			local var_682_23 = 5.4
			local var_682_24 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402165", "story_v_side_new_1109402.awb") / 1000

			if var_682_24 > 0 and var_682_23 < var_682_24 and var_682_24 + var_682_22 > arg_679_1.duration_ then
				local var_682_25 = var_682_24

				arg_679_1.duration_ = var_682_24 + var_682_22
			end

			if var_682_22 < arg_679_1.time_ and arg_679_1.time_ <= var_682_22 + arg_682_0 then
				local var_682_26 = "play"
				local var_682_27 = "voice"

				arg_679_1:AudioAction(var_682_26, var_682_27, "story_v_side_new_1109402", "1109402165", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402166 = function(arg_683_0, arg_683_1)
		arg_683_1.time_ = 0
		arg_683_1.frameCnt_ = 0
		arg_683_1.state_ = "playing"
		arg_683_1.curTalkId_ = 1109402166
		arg_683_1.duration_ = 5.932999999999

		SetActive(arg_683_1.tipsGo_, false)

		function arg_683_1.onSingleLineFinish_()
			arg_683_1.onSingleLineUpdate_ = nil
			arg_683_1.onSingleLineFinish_ = nil
			arg_683_1.state_ = "waiting"
		end

		function arg_683_1.playNext_(arg_685_0)
			if arg_685_0 == 1 then
				arg_683_0:Play1109402167(arg_683_1)
			end
		end

		function arg_683_1.onSingleLineUpdate_(arg_686_0)
			local var_686_0 = 0

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1.var_.oldValueTypewriter = arg_683_1.fswtw_.percent

				arg_683_1:ShowNextGo(false)
			end

			local var_686_1 = 0
			local var_686_2 = 0
			local var_686_3 = arg_683_1:GetWordFromCfg(1109402160)
			local var_686_4 = arg_683_1:FormatText(var_686_3.content)
			local var_686_5, var_686_6 = arg_683_1:GetPercentByPara(var_686_4, 6)

			if var_686_0 < arg_683_1.time_ and arg_683_1.time_ <= var_686_0 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0

				local var_686_7 = var_686_1 <= 0 and var_686_2 or var_686_2 * ((var_686_6 - arg_683_1.typewritterCharCountI18N) / var_686_1)

				if var_686_7 > 0 and var_686_2 < var_686_7 then
					arg_683_1.talkMaxDuration = var_686_7

					if var_686_7 + var_686_0 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_7 + var_686_0
					end
				end
			end

			local var_686_8 = 0
			local var_686_9 = math.max(var_686_8, arg_683_1.talkMaxDuration)

			if var_686_0 <= arg_683_1.time_ and arg_683_1.time_ < var_686_0 + var_686_9 then
				local var_686_10 = (arg_683_1.time_ - var_686_0) / var_686_9

				arg_683_1.fswtw_.percent = Mathf.Lerp(arg_683_1.var_.oldValueTypewriter, var_686_5, var_686_10)
				arg_683_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_683_1.fswtw_:SetDirty()
			end

			if arg_683_1.time_ >= var_686_0 + var_686_9 and arg_683_1.time_ < var_686_0 + var_686_9 + arg_686_0 then
				arg_683_1.fswtw_.percent = var_686_5

				arg_683_1.fswtw_:SetDirty()
				arg_683_1:ShowNextGo(true)

				arg_683_1.typewritterCharCountI18N = var_686_6
			end

			local var_686_11 = 0

			if var_686_11 < arg_683_1.time_ and arg_683_1.time_ <= var_686_11 + arg_686_0 then
				arg_683_1.fswbg_:SetActive(true)
				arg_683_1.dialog_:SetActive(false)

				arg_683_1.fswtw_.percent = 0

				local var_686_12 = arg_683_1:GetWordFromCfg(1109402166)
				local var_686_13 = arg_683_1:FormatText(var_686_12.content)

				arg_683_1.fswt_.text = var_686_13

				LuaForUtil.ClearLinePrefixSymbol(arg_683_1.fswt_)

				arg_683_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_683_1.fswtw_:SetDirty()

				arg_683_1.typewritterCharCountI18N = 0

				arg_683_1:ShowNextGo(false)
			end

			local var_686_14 = 0.0166666666666667

			if var_686_14 < arg_683_1.time_ and arg_683_1.time_ <= var_686_14 + arg_686_0 then
				arg_683_1.var_.oldValueTypewriter = arg_683_1.fswtw_.percent

				arg_683_1:ShowNextGo(false)
			end

			local var_686_15 = 24
			local var_686_16 = 1.6
			local var_686_17 = arg_683_1:GetWordFromCfg(1109402166)
			local var_686_18 = arg_683_1:FormatText(var_686_17.content)
			local var_686_19, var_686_20 = arg_683_1:GetPercentByPara(var_686_18, 1)

			if var_686_14 < arg_683_1.time_ and arg_683_1.time_ <= var_686_14 + arg_686_0 then
				arg_683_1.talkMaxDuration = 0

				local var_686_21 = var_686_15 <= 0 and var_686_16 or var_686_16 * ((var_686_20 - arg_683_1.typewritterCharCountI18N) / var_686_15)

				if var_686_21 > 0 and var_686_16 < var_686_21 then
					arg_683_1.talkMaxDuration = var_686_21

					if var_686_21 + var_686_14 > arg_683_1.duration_ then
						arg_683_1.duration_ = var_686_21 + var_686_14
					end
				end
			end

			local var_686_22 = 1.6
			local var_686_23 = math.max(var_686_22, arg_683_1.talkMaxDuration)

			if var_686_14 <= arg_683_1.time_ and arg_683_1.time_ < var_686_14 + var_686_23 then
				local var_686_24 = (arg_683_1.time_ - var_686_14) / var_686_23

				arg_683_1.fswtw_.percent = Mathf.Lerp(arg_683_1.var_.oldValueTypewriter, var_686_19, var_686_24)
				arg_683_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_683_1.fswtw_:SetDirty()
			end

			if arg_683_1.time_ >= var_686_14 + var_686_23 and arg_683_1.time_ < var_686_14 + var_686_23 + arg_686_0 then
				arg_683_1.fswtw_.percent = var_686_19

				arg_683_1.fswtw_:SetDirty()
				arg_683_1:ShowNextGo(true)

				arg_683_1.typewritterCharCountI18N = var_686_20
			end

			local var_686_25 = 0
			local var_686_26 = 5.933
			local var_686_27 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402166", "story_v_side_new_1109402.awb") / 1000

			if var_686_27 > 0 and var_686_26 < var_686_27 and var_686_27 + var_686_25 > arg_683_1.duration_ then
				local var_686_28 = var_686_27

				arg_683_1.duration_ = var_686_27 + var_686_25
			end

			if var_686_25 < arg_683_1.time_ and arg_683_1.time_ <= var_686_25 + arg_686_0 then
				local var_686_29 = "play"
				local var_686_30 = "voice"

				arg_683_1:AudioAction(var_686_29, var_686_30, "story_v_side_new_1109402", "1109402166", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402167 = function(arg_687_0, arg_687_1)
		arg_687_1.time_ = 0
		arg_687_1.frameCnt_ = 0
		arg_687_1.state_ = "playing"
		arg_687_1.curTalkId_ = 1109402167
		arg_687_1.duration_ = 6.432999999999

		SetActive(arg_687_1.tipsGo_, false)

		function arg_687_1.onSingleLineFinish_()
			arg_687_1.onSingleLineUpdate_ = nil
			arg_687_1.onSingleLineFinish_ = nil
			arg_687_1.state_ = "waiting"
		end

		function arg_687_1.playNext_(arg_689_0)
			if arg_689_0 == 1 then
				arg_687_0:Play1109402168(arg_687_1)
			end
		end

		function arg_687_1.onSingleLineUpdate_(arg_690_0)
			local var_690_0 = 0

			if var_690_0 < arg_687_1.time_ and arg_687_1.time_ <= var_690_0 + arg_690_0 then
				arg_687_1.var_.oldValueTypewriter = arg_687_1.fswtw_.percent

				arg_687_1:ShowNextGo(false)
			end

			local var_690_1 = 26
			local var_690_2 = 1.73333333333333
			local var_690_3 = arg_687_1:GetWordFromCfg(1109402166)
			local var_690_4 = arg_687_1:FormatText(var_690_3.content)
			local var_690_5, var_690_6 = arg_687_1:GetPercentByPara(var_690_4, 2)

			if var_690_0 < arg_687_1.time_ and arg_687_1.time_ <= var_690_0 + arg_690_0 then
				arg_687_1.talkMaxDuration = 0

				local var_690_7 = var_690_1 <= 0 and var_690_2 or var_690_2 * ((var_690_6 - arg_687_1.typewritterCharCountI18N) / var_690_1)

				if var_690_7 > 0 and var_690_2 < var_690_7 then
					arg_687_1.talkMaxDuration = var_690_7

					if var_690_7 + var_690_0 > arg_687_1.duration_ then
						arg_687_1.duration_ = var_690_7 + var_690_0
					end
				end
			end

			local var_690_8 = 1.73333333333333
			local var_690_9 = math.max(var_690_8, arg_687_1.talkMaxDuration)

			if var_690_0 <= arg_687_1.time_ and arg_687_1.time_ < var_690_0 + var_690_9 then
				local var_690_10 = (arg_687_1.time_ - var_690_0) / var_690_9

				arg_687_1.fswtw_.percent = Mathf.Lerp(arg_687_1.var_.oldValueTypewriter, var_690_5, var_690_10)
				arg_687_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_687_1.fswtw_:SetDirty()
			end

			if arg_687_1.time_ >= var_690_0 + var_690_9 and arg_687_1.time_ < var_690_0 + var_690_9 + arg_690_0 then
				arg_687_1.fswtw_.percent = var_690_5

				arg_687_1.fswtw_:SetDirty()
				arg_687_1:ShowNextGo(true)

				arg_687_1.typewritterCharCountI18N = var_690_6
			end

			local var_690_11 = 0
			local var_690_12 = 6.433
			local var_690_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402167", "story_v_side_new_1109402.awb") / 1000

			if var_690_13 > 0 and var_690_12 < var_690_13 and var_690_13 + var_690_11 > arg_687_1.duration_ then
				local var_690_14 = var_690_13

				arg_687_1.duration_ = var_690_13 + var_690_11
			end

			if var_690_11 < arg_687_1.time_ and arg_687_1.time_ <= var_690_11 + arg_690_0 then
				local var_690_15 = "play"
				local var_690_16 = "voice"

				arg_687_1:AudioAction(var_690_15, var_690_16, "story_v_side_new_1109402", "1109402167", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402168 = function(arg_691_0, arg_691_1)
		arg_691_1.time_ = 0
		arg_691_1.frameCnt_ = 0
		arg_691_1.state_ = "playing"
		arg_691_1.curTalkId_ = 1109402168
		arg_691_1.duration_ = 6.165999999999

		SetActive(arg_691_1.tipsGo_, false)

		function arg_691_1.onSingleLineFinish_()
			arg_691_1.onSingleLineUpdate_ = nil
			arg_691_1.onSingleLineFinish_ = nil
			arg_691_1.state_ = "waiting"
		end

		function arg_691_1.playNext_(arg_693_0)
			if arg_693_0 == 1 then
				arg_691_0:Play1109402169(arg_691_1)
			end
		end

		function arg_691_1.onSingleLineUpdate_(arg_694_0)
			local var_694_0 = 0

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.var_.oldValueTypewriter = arg_691_1.fswtw_.percent

				arg_691_1:ShowNextGo(false)
			end

			local var_694_1 = 28
			local var_694_2 = 1.86666666666667
			local var_694_3 = arg_691_1:GetWordFromCfg(1109402166)
			local var_694_4 = arg_691_1:FormatText(var_694_3.content)
			local var_694_5, var_694_6 = arg_691_1:GetPercentByPara(var_694_4, 3)

			if var_694_0 < arg_691_1.time_ and arg_691_1.time_ <= var_694_0 + arg_694_0 then
				arg_691_1.talkMaxDuration = 0

				local var_694_7 = var_694_1 <= 0 and var_694_2 or var_694_2 * ((var_694_6 - arg_691_1.typewritterCharCountI18N) / var_694_1)

				if var_694_7 > 0 and var_694_2 < var_694_7 then
					arg_691_1.talkMaxDuration = var_694_7

					if var_694_7 + var_694_0 > arg_691_1.duration_ then
						arg_691_1.duration_ = var_694_7 + var_694_0
					end
				end
			end

			local var_694_8 = 1.86666666666667
			local var_694_9 = math.max(var_694_8, arg_691_1.talkMaxDuration)

			if var_694_0 <= arg_691_1.time_ and arg_691_1.time_ < var_694_0 + var_694_9 then
				local var_694_10 = (arg_691_1.time_ - var_694_0) / var_694_9

				arg_691_1.fswtw_.percent = Mathf.Lerp(arg_691_1.var_.oldValueTypewriter, var_694_5, var_694_10)
				arg_691_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_691_1.fswtw_:SetDirty()
			end

			if arg_691_1.time_ >= var_694_0 + var_694_9 and arg_691_1.time_ < var_694_0 + var_694_9 + arg_694_0 then
				arg_691_1.fswtw_.percent = var_694_5

				arg_691_1.fswtw_:SetDirty()
				arg_691_1:ShowNextGo(true)

				arg_691_1.typewritterCharCountI18N = var_694_6
			end

			local var_694_11 = 0
			local var_694_12 = 6.166
			local var_694_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402168", "story_v_side_new_1109402.awb") / 1000

			if var_694_13 > 0 and var_694_12 < var_694_13 and var_694_13 + var_694_11 > arg_691_1.duration_ then
				local var_694_14 = var_694_13

				arg_691_1.duration_ = var_694_13 + var_694_11
			end

			if var_694_11 < arg_691_1.time_ and arg_691_1.time_ <= var_694_11 + arg_694_0 then
				local var_694_15 = "play"
				local var_694_16 = "voice"

				arg_691_1:AudioAction(var_694_15, var_694_16, "story_v_side_new_1109402", "1109402168", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402169 = function(arg_695_0, arg_695_1)
		arg_695_1.time_ = 0
		arg_695_1.frameCnt_ = 0
		arg_695_1.state_ = "playing"
		arg_695_1.curTalkId_ = 1109402169
		arg_695_1.duration_ = 2.533333333332

		SetActive(arg_695_1.tipsGo_, false)

		function arg_695_1.onSingleLineFinish_()
			arg_695_1.onSingleLineUpdate_ = nil
			arg_695_1.onSingleLineFinish_ = nil
			arg_695_1.state_ = "waiting"
		end

		function arg_695_1.playNext_(arg_697_0)
			if arg_697_0 == 1 then
				arg_695_0:Play1109402170(arg_695_1)
			end
		end

		function arg_695_1.onSingleLineUpdate_(arg_698_0)
			local var_698_0 = 0

			if var_698_0 < arg_695_1.time_ and arg_695_1.time_ <= var_698_0 + arg_698_0 then
				arg_695_1.var_.oldValueTypewriter = arg_695_1.fswtw_.percent

				arg_695_1:ShowNextGo(false)
			end

			local var_698_1 = 38
			local var_698_2 = 2.53333333333333
			local var_698_3 = arg_695_1:GetWordFromCfg(1109402166)
			local var_698_4 = arg_695_1:FormatText(var_698_3.content)
			local var_698_5, var_698_6 = arg_695_1:GetPercentByPara(var_698_4, 4)

			if var_698_0 < arg_695_1.time_ and arg_695_1.time_ <= var_698_0 + arg_698_0 then
				arg_695_1.talkMaxDuration = 0

				local var_698_7 = var_698_1 <= 0 and var_698_2 or var_698_2 * ((var_698_6 - arg_695_1.typewritterCharCountI18N) / var_698_1)

				if var_698_7 > 0 and var_698_2 < var_698_7 then
					arg_695_1.talkMaxDuration = var_698_7

					if var_698_7 + var_698_0 > arg_695_1.duration_ then
						arg_695_1.duration_ = var_698_7 + var_698_0
					end
				end
			end

			local var_698_8 = 2.53333333333333
			local var_698_9 = math.max(var_698_8, arg_695_1.talkMaxDuration)

			if var_698_0 <= arg_695_1.time_ and arg_695_1.time_ < var_698_0 + var_698_9 then
				local var_698_10 = (arg_695_1.time_ - var_698_0) / var_698_9

				arg_695_1.fswtw_.percent = Mathf.Lerp(arg_695_1.var_.oldValueTypewriter, var_698_5, var_698_10)
				arg_695_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_695_1.fswtw_:SetDirty()
			end

			if arg_695_1.time_ >= var_698_0 + var_698_9 and arg_695_1.time_ < var_698_0 + var_698_9 + arg_698_0 then
				arg_695_1.fswtw_.percent = var_698_5

				arg_695_1.fswtw_:SetDirty()
				arg_695_1:ShowNextGo(true)

				arg_695_1.typewritterCharCountI18N = var_698_6
			end
		end
	end,
	Play1109402170 = function(arg_699_0, arg_699_1)
		arg_699_1.time_ = 0
		arg_699_1.frameCnt_ = 0
		arg_699_1.state_ = "playing"
		arg_699_1.curTalkId_ = 1109402170
		arg_699_1.duration_ = 6.932999999999

		SetActive(arg_699_1.tipsGo_, false)

		function arg_699_1.onSingleLineFinish_()
			arg_699_1.onSingleLineUpdate_ = nil
			arg_699_1.onSingleLineFinish_ = nil
			arg_699_1.state_ = "waiting"
		end

		function arg_699_1.playNext_(arg_701_0)
			if arg_701_0 == 1 then
				arg_699_0:Play1109402171(arg_699_1)
			end
		end

		function arg_699_1.onSingleLineUpdate_(arg_702_0)
			local var_702_0 = 0

			if var_702_0 < arg_699_1.time_ and arg_699_1.time_ <= var_702_0 + arg_702_0 then
				arg_699_1.var_.oldValueTypewriter = arg_699_1.fswtw_.percent

				arg_699_1:ShowNextGo(false)
			end

			local var_702_1 = 35
			local var_702_2 = 2.33333333333333
			local var_702_3 = arg_699_1:GetWordFromCfg(1109402166)
			local var_702_4 = arg_699_1:FormatText(var_702_3.content)
			local var_702_5, var_702_6 = arg_699_1:GetPercentByPara(var_702_4, 5)

			if var_702_0 < arg_699_1.time_ and arg_699_1.time_ <= var_702_0 + arg_702_0 then
				arg_699_1.talkMaxDuration = 0

				local var_702_7 = var_702_1 <= 0 and var_702_2 or var_702_2 * ((var_702_6 - arg_699_1.typewritterCharCountI18N) / var_702_1)

				if var_702_7 > 0 and var_702_2 < var_702_7 then
					arg_699_1.talkMaxDuration = var_702_7

					if var_702_7 + var_702_0 > arg_699_1.duration_ then
						arg_699_1.duration_ = var_702_7 + var_702_0
					end
				end
			end

			local var_702_8 = 2.33333333333333
			local var_702_9 = math.max(var_702_8, arg_699_1.talkMaxDuration)

			if var_702_0 <= arg_699_1.time_ and arg_699_1.time_ < var_702_0 + var_702_9 then
				local var_702_10 = (arg_699_1.time_ - var_702_0) / var_702_9

				arg_699_1.fswtw_.percent = Mathf.Lerp(arg_699_1.var_.oldValueTypewriter, var_702_5, var_702_10)
				arg_699_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_699_1.fswtw_:SetDirty()
			end

			if arg_699_1.time_ >= var_702_0 + var_702_9 and arg_699_1.time_ < var_702_0 + var_702_9 + arg_702_0 then
				arg_699_1.fswtw_.percent = var_702_5

				arg_699_1.fswtw_:SetDirty()
				arg_699_1:ShowNextGo(true)

				arg_699_1.typewritterCharCountI18N = var_702_6
			end

			local var_702_11 = 0
			local var_702_12 = 6.933
			local var_702_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402170", "story_v_side_new_1109402.awb") / 1000

			if var_702_13 > 0 and var_702_12 < var_702_13 and var_702_13 + var_702_11 > arg_699_1.duration_ then
				local var_702_14 = var_702_13

				arg_699_1.duration_ = var_702_13 + var_702_11
			end

			if var_702_11 < arg_699_1.time_ and arg_699_1.time_ <= var_702_11 + arg_702_0 then
				local var_702_15 = "play"
				local var_702_16 = "voice"

				arg_699_1:AudioAction(var_702_15, var_702_16, "story_v_side_new_1109402", "1109402170", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402171 = function(arg_703_0, arg_703_1)
		arg_703_1.time_ = 0
		arg_703_1.frameCnt_ = 0
		arg_703_1.state_ = "playing"
		arg_703_1.curTalkId_ = 1109402171
		arg_703_1.duration_ = 2.333333333332

		SetActive(arg_703_1.tipsGo_, false)

		function arg_703_1.onSingleLineFinish_()
			arg_703_1.onSingleLineUpdate_ = nil
			arg_703_1.onSingleLineFinish_ = nil
			arg_703_1.state_ = "waiting"
		end

		function arg_703_1.playNext_(arg_705_0)
			if arg_705_0 == 1 then
				arg_703_0:Play1109402172(arg_703_1)
			end
		end

		function arg_703_1.onSingleLineUpdate_(arg_706_0)
			local var_706_0 = 0

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				arg_703_1.var_.oldValueTypewriter = arg_703_1.fswtw_.percent

				arg_703_1:ShowNextGo(false)
			end

			local var_706_1 = 35
			local var_706_2 = 2.33333333333333
			local var_706_3 = arg_703_1:GetWordFromCfg(1109402166)
			local var_706_4 = arg_703_1:FormatText(var_706_3.content)
			local var_706_5, var_706_6 = arg_703_1:GetPercentByPara(var_706_4, 6)

			if var_706_0 < arg_703_1.time_ and arg_703_1.time_ <= var_706_0 + arg_706_0 then
				arg_703_1.talkMaxDuration = 0

				local var_706_7 = var_706_1 <= 0 and var_706_2 or var_706_2 * ((var_706_6 - arg_703_1.typewritterCharCountI18N) / var_706_1)

				if var_706_7 > 0 and var_706_2 < var_706_7 then
					arg_703_1.talkMaxDuration = var_706_7

					if var_706_7 + var_706_0 > arg_703_1.duration_ then
						arg_703_1.duration_ = var_706_7 + var_706_0
					end
				end
			end

			local var_706_8 = 2.33333333333333
			local var_706_9 = math.max(var_706_8, arg_703_1.talkMaxDuration)

			if var_706_0 <= arg_703_1.time_ and arg_703_1.time_ < var_706_0 + var_706_9 then
				local var_706_10 = (arg_703_1.time_ - var_706_0) / var_706_9

				arg_703_1.fswtw_.percent = Mathf.Lerp(arg_703_1.var_.oldValueTypewriter, var_706_5, var_706_10)
				arg_703_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_703_1.fswtw_:SetDirty()
			end

			if arg_703_1.time_ >= var_706_0 + var_706_9 and arg_703_1.time_ < var_706_0 + var_706_9 + arg_706_0 then
				arg_703_1.fswtw_.percent = var_706_5

				arg_703_1.fswtw_:SetDirty()
				arg_703_1:ShowNextGo(true)

				arg_703_1.typewritterCharCountI18N = var_706_6
			end
		end
	end,
	Play1109402172 = function(arg_707_0, arg_707_1)
		arg_707_1.time_ = 0
		arg_707_1.frameCnt_ = 0
		arg_707_1.state_ = "playing"
		arg_707_1.curTalkId_ = 1109402172
		arg_707_1.duration_ = 0.999999999999

		SetActive(arg_707_1.tipsGo_, false)

		function arg_707_1.onSingleLineFinish_()
			arg_707_1.onSingleLineUpdate_ = nil
			arg_707_1.onSingleLineFinish_ = nil
			arg_707_1.state_ = "waiting"
		end

		function arg_707_1.playNext_(arg_709_0)
			if arg_709_0 == 1 then
				arg_707_0:Play1109402173(arg_707_1)
			end
		end

		function arg_707_1.onSingleLineUpdate_(arg_710_0)
			local var_710_0 = 0

			if var_710_0 < arg_707_1.time_ and arg_707_1.time_ <= var_710_0 + arg_710_0 then
				arg_707_1.fswbg_:SetActive(true)
				arg_707_1.dialog_:SetActive(false)

				arg_707_1.fswtw_.percent = 0

				local var_710_1 = arg_707_1:GetWordFromCfg(1109402172)
				local var_710_2 = arg_707_1:FormatText(var_710_1.content)

				arg_707_1.fswt_.text = var_710_2

				LuaForUtil.ClearLinePrefixSymbol(arg_707_1.fswt_)

				arg_707_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_707_1.fswtw_:SetDirty()

				arg_707_1.typewritterCharCountI18N = 0

				arg_707_1:ShowNextGo(false)
			end

			local var_710_3 = 0.0166666666666667

			if var_710_3 < arg_707_1.time_ and arg_707_1.time_ <= var_710_3 + arg_710_0 then
				arg_707_1.var_.oldValueTypewriter = arg_707_1.fswtw_.percent

				arg_707_1:ShowNextGo(false)
			end

			local var_710_4 = 12
			local var_710_5 = 0.8
			local var_710_6 = arg_707_1:GetWordFromCfg(1109402172)
			local var_710_7 = arg_707_1:FormatText(var_710_6.content)
			local var_710_8, var_710_9 = arg_707_1:GetPercentByPara(var_710_7, 1)

			if var_710_3 < arg_707_1.time_ and arg_707_1.time_ <= var_710_3 + arg_710_0 then
				arg_707_1.talkMaxDuration = 0

				local var_710_10 = var_710_4 <= 0 and var_710_5 or var_710_5 * ((var_710_9 - arg_707_1.typewritterCharCountI18N) / var_710_4)

				if var_710_10 > 0 and var_710_5 < var_710_10 then
					arg_707_1.talkMaxDuration = var_710_10

					if var_710_10 + var_710_3 > arg_707_1.duration_ then
						arg_707_1.duration_ = var_710_10 + var_710_3
					end
				end
			end

			local var_710_11 = 0.8
			local var_710_12 = math.max(var_710_11, arg_707_1.talkMaxDuration)

			if var_710_3 <= arg_707_1.time_ and arg_707_1.time_ < var_710_3 + var_710_12 then
				local var_710_13 = (arg_707_1.time_ - var_710_3) / var_710_12

				arg_707_1.fswtw_.percent = Mathf.Lerp(arg_707_1.var_.oldValueTypewriter, var_710_8, var_710_13)
				arg_707_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_707_1.fswtw_:SetDirty()
			end

			if arg_707_1.time_ >= var_710_3 + var_710_12 and arg_707_1.time_ < var_710_3 + var_710_12 + arg_710_0 then
				arg_707_1.fswtw_.percent = var_710_8

				arg_707_1.fswtw_:SetDirty()
				arg_707_1:ShowNextGo(true)

				arg_707_1.typewritterCharCountI18N = var_710_9
			end
		end
	end,
	Play1109402173 = function(arg_711_0, arg_711_1)
		arg_711_1.time_ = 0
		arg_711_1.frameCnt_ = 0
		arg_711_1.state_ = "playing"
		arg_711_1.curTalkId_ = 1109402173
		arg_711_1.duration_ = 2.133333333332

		SetActive(arg_711_1.tipsGo_, false)

		function arg_711_1.onSingleLineFinish_()
			arg_711_1.onSingleLineUpdate_ = nil
			arg_711_1.onSingleLineFinish_ = nil
			arg_711_1.state_ = "waiting"
		end

		function arg_711_1.playNext_(arg_713_0)
			if arg_713_0 == 1 then
				arg_711_0:Play1109402174(arg_711_1)
			end
		end

		function arg_711_1.onSingleLineUpdate_(arg_714_0)
			local var_714_0 = 0

			if var_714_0 < arg_711_1.time_ and arg_711_1.time_ <= var_714_0 + arg_714_0 then
				arg_711_1.var_.oldValueTypewriter = arg_711_1.fswtw_.percent

				arg_711_1:ShowNextGo(false)
			end

			local var_714_1 = 32
			local var_714_2 = 2.13333333333333
			local var_714_3 = arg_711_1:GetWordFromCfg(1109402172)
			local var_714_4 = arg_711_1:FormatText(var_714_3.content)
			local var_714_5, var_714_6 = arg_711_1:GetPercentByPara(var_714_4, 2)

			if var_714_0 < arg_711_1.time_ and arg_711_1.time_ <= var_714_0 + arg_714_0 then
				arg_711_1.talkMaxDuration = 0

				local var_714_7 = var_714_1 <= 0 and var_714_2 or var_714_2 * ((var_714_6 - arg_711_1.typewritterCharCountI18N) / var_714_1)

				if var_714_7 > 0 and var_714_2 < var_714_7 then
					arg_711_1.talkMaxDuration = var_714_7

					if var_714_7 + var_714_0 > arg_711_1.duration_ then
						arg_711_1.duration_ = var_714_7 + var_714_0
					end
				end
			end

			local var_714_8 = 2.13333333333333
			local var_714_9 = math.max(var_714_8, arg_711_1.talkMaxDuration)

			if var_714_0 <= arg_711_1.time_ and arg_711_1.time_ < var_714_0 + var_714_9 then
				local var_714_10 = (arg_711_1.time_ - var_714_0) / var_714_9

				arg_711_1.fswtw_.percent = Mathf.Lerp(arg_711_1.var_.oldValueTypewriter, var_714_5, var_714_10)
				arg_711_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_711_1.fswtw_:SetDirty()
			end

			if arg_711_1.time_ >= var_714_0 + var_714_9 and arg_711_1.time_ < var_714_0 + var_714_9 + arg_714_0 then
				arg_711_1.fswtw_.percent = var_714_5

				arg_711_1.fswtw_:SetDirty()
				arg_711_1:ShowNextGo(true)

				arg_711_1.typewritterCharCountI18N = var_714_6
			end
		end
	end,
	Play1109402174 = function(arg_715_0, arg_715_1)
		arg_715_1.time_ = 0
		arg_715_1.frameCnt_ = 0
		arg_715_1.state_ = "playing"
		arg_715_1.curTalkId_ = 1109402174
		arg_715_1.duration_ = 2.699999999999

		SetActive(arg_715_1.tipsGo_, false)

		function arg_715_1.onSingleLineFinish_()
			arg_715_1.onSingleLineUpdate_ = nil
			arg_715_1.onSingleLineFinish_ = nil
			arg_715_1.state_ = "waiting"
		end

		function arg_715_1.playNext_(arg_717_0)
			if arg_717_0 == 1 then
				arg_715_0:Play1109402175(arg_715_1)
			end
		end

		function arg_715_1.onSingleLineUpdate_(arg_718_0)
			local var_718_0 = 0

			if var_718_0 < arg_715_1.time_ and arg_715_1.time_ <= var_718_0 + arg_718_0 then
				arg_715_1.var_.oldValueTypewriter = arg_715_1.fswtw_.percent

				arg_715_1:ShowNextGo(false)
			end

			local var_718_1 = 13
			local var_718_2 = 0.866666666666667
			local var_718_3 = arg_715_1:GetWordFromCfg(1109402172)
			local var_718_4 = arg_715_1:FormatText(var_718_3.content)
			local var_718_5, var_718_6 = arg_715_1:GetPercentByPara(var_718_4, 3)

			if var_718_0 < arg_715_1.time_ and arg_715_1.time_ <= var_718_0 + arg_718_0 then
				arg_715_1.talkMaxDuration = 0

				local var_718_7 = var_718_1 <= 0 and var_718_2 or var_718_2 * ((var_718_6 - arg_715_1.typewritterCharCountI18N) / var_718_1)

				if var_718_7 > 0 and var_718_2 < var_718_7 then
					arg_715_1.talkMaxDuration = var_718_7

					if var_718_7 + var_718_0 > arg_715_1.duration_ then
						arg_715_1.duration_ = var_718_7 + var_718_0
					end
				end
			end

			local var_718_8 = 0.866666666666667
			local var_718_9 = math.max(var_718_8, arg_715_1.talkMaxDuration)

			if var_718_0 <= arg_715_1.time_ and arg_715_1.time_ < var_718_0 + var_718_9 then
				local var_718_10 = (arg_715_1.time_ - var_718_0) / var_718_9

				arg_715_1.fswtw_.percent = Mathf.Lerp(arg_715_1.var_.oldValueTypewriter, var_718_5, var_718_10)
				arg_715_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_715_1.fswtw_:SetDirty()
			end

			if arg_715_1.time_ >= var_718_0 + var_718_9 and arg_715_1.time_ < var_718_0 + var_718_9 + arg_718_0 then
				arg_715_1.fswtw_.percent = var_718_5

				arg_715_1.fswtw_:SetDirty()
				arg_715_1:ShowNextGo(true)

				arg_715_1.typewritterCharCountI18N = var_718_6
			end

			local var_718_11 = 0
			local var_718_12 = 2.7
			local var_718_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402174", "story_v_side_new_1109402.awb") / 1000

			if var_718_13 > 0 and var_718_12 < var_718_13 and var_718_13 + var_718_11 > arg_715_1.duration_ then
				local var_718_14 = var_718_13

				arg_715_1.duration_ = var_718_13 + var_718_11
			end

			if var_718_11 < arg_715_1.time_ and arg_715_1.time_ <= var_718_11 + arg_718_0 then
				local var_718_15 = "play"
				local var_718_16 = "voice"

				arg_715_1:AudioAction(var_718_15, var_718_16, "story_v_side_new_1109402", "1109402174", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402175 = function(arg_719_0, arg_719_1)
		arg_719_1.time_ = 0
		arg_719_1.frameCnt_ = 0
		arg_719_1.state_ = "playing"
		arg_719_1.curTalkId_ = 1109402175
		arg_719_1.duration_ = 2.432999999999

		SetActive(arg_719_1.tipsGo_, false)

		function arg_719_1.onSingleLineFinish_()
			arg_719_1.onSingleLineUpdate_ = nil
			arg_719_1.onSingleLineFinish_ = nil
			arg_719_1.state_ = "waiting"
		end

		function arg_719_1.playNext_(arg_721_0)
			if arg_721_0 == 1 then
				arg_719_0:Play1109402176(arg_719_1)
			end
		end

		function arg_719_1.onSingleLineUpdate_(arg_722_0)
			local var_722_0 = 0

			if var_722_0 < arg_719_1.time_ and arg_719_1.time_ <= var_722_0 + arg_722_0 then
				arg_719_1.var_.oldValueTypewriter = arg_719_1.fswtw_.percent

				arg_719_1:ShowNextGo(false)
			end

			local var_722_1 = 10
			local var_722_2 = 0.666666666666667
			local var_722_3 = arg_719_1:GetWordFromCfg(1109402172)
			local var_722_4 = arg_719_1:FormatText(var_722_3.content)
			local var_722_5, var_722_6 = arg_719_1:GetPercentByPara(var_722_4, 4)

			if var_722_0 < arg_719_1.time_ and arg_719_1.time_ <= var_722_0 + arg_722_0 then
				arg_719_1.talkMaxDuration = 0

				local var_722_7 = var_722_1 <= 0 and var_722_2 or var_722_2 * ((var_722_6 - arg_719_1.typewritterCharCountI18N) / var_722_1)

				if var_722_7 > 0 and var_722_2 < var_722_7 then
					arg_719_1.talkMaxDuration = var_722_7

					if var_722_7 + var_722_0 > arg_719_1.duration_ then
						arg_719_1.duration_ = var_722_7 + var_722_0
					end
				end
			end

			local var_722_8 = 0.666666666666667
			local var_722_9 = math.max(var_722_8, arg_719_1.talkMaxDuration)

			if var_722_0 <= arg_719_1.time_ and arg_719_1.time_ < var_722_0 + var_722_9 then
				local var_722_10 = (arg_719_1.time_ - var_722_0) / var_722_9

				arg_719_1.fswtw_.percent = Mathf.Lerp(arg_719_1.var_.oldValueTypewriter, var_722_5, var_722_10)
				arg_719_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_719_1.fswtw_:SetDirty()
			end

			if arg_719_1.time_ >= var_722_0 + var_722_9 and arg_719_1.time_ < var_722_0 + var_722_9 + arg_722_0 then
				arg_719_1.fswtw_.percent = var_722_5

				arg_719_1.fswtw_:SetDirty()
				arg_719_1:ShowNextGo(true)

				arg_719_1.typewritterCharCountI18N = var_722_6
			end

			local var_722_11 = 0
			local var_722_12 = 2.433
			local var_722_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402175", "story_v_side_new_1109402.awb") / 1000

			if var_722_13 > 0 and var_722_12 < var_722_13 and var_722_13 + var_722_11 > arg_719_1.duration_ then
				local var_722_14 = var_722_13

				arg_719_1.duration_ = var_722_13 + var_722_11
			end

			if var_722_11 < arg_719_1.time_ and arg_719_1.time_ <= var_722_11 + arg_722_0 then
				local var_722_15 = "play"
				local var_722_16 = "voice"

				arg_719_1:AudioAction(var_722_15, var_722_16, "story_v_side_new_1109402", "1109402175", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402176 = function(arg_723_0, arg_723_1)
		arg_723_1.time_ = 0
		arg_723_1.frameCnt_ = 0
		arg_723_1.state_ = "playing"
		arg_723_1.curTalkId_ = 1109402176
		arg_723_1.duration_ = 1.965999999999

		SetActive(arg_723_1.tipsGo_, false)

		function arg_723_1.onSingleLineFinish_()
			arg_723_1.onSingleLineUpdate_ = nil
			arg_723_1.onSingleLineFinish_ = nil
			arg_723_1.state_ = "waiting"
		end

		function arg_723_1.playNext_(arg_725_0)
			if arg_725_0 == 1 then
				arg_723_0:Play1109402177(arg_723_1)
			end
		end

		function arg_723_1.onSingleLineUpdate_(arg_726_0)
			local var_726_0 = 0

			if var_726_0 < arg_723_1.time_ and arg_723_1.time_ <= var_726_0 + arg_726_0 then
				arg_723_1.var_.oldValueTypewriter = arg_723_1.fswtw_.percent

				arg_723_1:ShowNextGo(false)
			end

			local var_726_1 = 6
			local var_726_2 = 0.4
			local var_726_3 = arg_723_1:GetWordFromCfg(1109402172)
			local var_726_4 = arg_723_1:FormatText(var_726_3.content)
			local var_726_5, var_726_6 = arg_723_1:GetPercentByPara(var_726_4, 5)

			if var_726_0 < arg_723_1.time_ and arg_723_1.time_ <= var_726_0 + arg_726_0 then
				arg_723_1.talkMaxDuration = 0

				local var_726_7 = var_726_1 <= 0 and var_726_2 or var_726_2 * ((var_726_6 - arg_723_1.typewritterCharCountI18N) / var_726_1)

				if var_726_7 > 0 and var_726_2 < var_726_7 then
					arg_723_1.talkMaxDuration = var_726_7

					if var_726_7 + var_726_0 > arg_723_1.duration_ then
						arg_723_1.duration_ = var_726_7 + var_726_0
					end
				end
			end

			local var_726_8 = 0.4
			local var_726_9 = math.max(var_726_8, arg_723_1.talkMaxDuration)

			if var_726_0 <= arg_723_1.time_ and arg_723_1.time_ < var_726_0 + var_726_9 then
				local var_726_10 = (arg_723_1.time_ - var_726_0) / var_726_9

				arg_723_1.fswtw_.percent = Mathf.Lerp(arg_723_1.var_.oldValueTypewriter, var_726_5, var_726_10)
				arg_723_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_723_1.fswtw_:SetDirty()
			end

			if arg_723_1.time_ >= var_726_0 + var_726_9 and arg_723_1.time_ < var_726_0 + var_726_9 + arg_726_0 then
				arg_723_1.fswtw_.percent = var_726_5

				arg_723_1.fswtw_:SetDirty()
				arg_723_1:ShowNextGo(true)

				arg_723_1.typewritterCharCountI18N = var_726_6
			end

			local var_726_11 = 0
			local var_726_12 = 1.966
			local var_726_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402176", "story_v_side_new_1109402.awb") / 1000

			if var_726_13 > 0 and var_726_12 < var_726_13 and var_726_13 + var_726_11 > arg_723_1.duration_ then
				local var_726_14 = var_726_13

				arg_723_1.duration_ = var_726_13 + var_726_11
			end

			if var_726_11 < arg_723_1.time_ and arg_723_1.time_ <= var_726_11 + arg_726_0 then
				local var_726_15 = "play"
				local var_726_16 = "voice"

				arg_723_1:AudioAction(var_726_15, var_726_16, "story_v_side_new_1109402", "1109402176", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402177 = function(arg_727_0, arg_727_1)
		arg_727_1.time_ = 0
		arg_727_1.frameCnt_ = 0
		arg_727_1.state_ = "playing"
		arg_727_1.curTalkId_ = 1109402177
		arg_727_1.duration_ = 3.265999999999

		SetActive(arg_727_1.tipsGo_, false)

		function arg_727_1.onSingleLineFinish_()
			arg_727_1.onSingleLineUpdate_ = nil
			arg_727_1.onSingleLineFinish_ = nil
			arg_727_1.state_ = "waiting"
		end

		function arg_727_1.playNext_(arg_729_0)
			if arg_729_0 == 1 then
				arg_727_0:Play1109402178(arg_727_1)
			end
		end

		function arg_727_1.onSingleLineUpdate_(arg_730_0)
			local var_730_0 = 0

			if var_730_0 < arg_727_1.time_ and arg_727_1.time_ <= var_730_0 + arg_730_0 then
				arg_727_1.var_.oldValueTypewriter = arg_727_1.fswtw_.percent

				arg_727_1:ShowNextGo(false)
			end

			local var_730_1 = 11
			local var_730_2 = 0.733333333333333
			local var_730_3 = arg_727_1:GetWordFromCfg(1109402172)
			local var_730_4 = arg_727_1:FormatText(var_730_3.content)
			local var_730_5, var_730_6 = arg_727_1:GetPercentByPara(var_730_4, 6)

			if var_730_0 < arg_727_1.time_ and arg_727_1.time_ <= var_730_0 + arg_730_0 then
				arg_727_1.talkMaxDuration = 0

				local var_730_7 = var_730_1 <= 0 and var_730_2 or var_730_2 * ((var_730_6 - arg_727_1.typewritterCharCountI18N) / var_730_1)

				if var_730_7 > 0 and var_730_2 < var_730_7 then
					arg_727_1.talkMaxDuration = var_730_7

					if var_730_7 + var_730_0 > arg_727_1.duration_ then
						arg_727_1.duration_ = var_730_7 + var_730_0
					end
				end
			end

			local var_730_8 = 0.733333333333333
			local var_730_9 = math.max(var_730_8, arg_727_1.talkMaxDuration)

			if var_730_0 <= arg_727_1.time_ and arg_727_1.time_ < var_730_0 + var_730_9 then
				local var_730_10 = (arg_727_1.time_ - var_730_0) / var_730_9

				arg_727_1.fswtw_.percent = Mathf.Lerp(arg_727_1.var_.oldValueTypewriter, var_730_5, var_730_10)
				arg_727_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_727_1.fswtw_:SetDirty()
			end

			if arg_727_1.time_ >= var_730_0 + var_730_9 and arg_727_1.time_ < var_730_0 + var_730_9 + arg_730_0 then
				arg_727_1.fswtw_.percent = var_730_5

				arg_727_1.fswtw_:SetDirty()
				arg_727_1:ShowNextGo(true)

				arg_727_1.typewritterCharCountI18N = var_730_6
			end

			local var_730_11 = 0
			local var_730_12 = 3.266
			local var_730_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402177", "story_v_side_new_1109402.awb") / 1000

			if var_730_13 > 0 and var_730_12 < var_730_13 and var_730_13 + var_730_11 > arg_727_1.duration_ then
				local var_730_14 = var_730_13

				arg_727_1.duration_ = var_730_13 + var_730_11
			end

			if var_730_11 < arg_727_1.time_ and arg_727_1.time_ <= var_730_11 + arg_730_0 then
				local var_730_15 = "play"
				local var_730_16 = "voice"

				arg_727_1:AudioAction(var_730_15, var_730_16, "story_v_side_new_1109402", "1109402177", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402178 = function(arg_731_0, arg_731_1)
		arg_731_1.time_ = 0
		arg_731_1.frameCnt_ = 0
		arg_731_1.state_ = "playing"
		arg_731_1.curTalkId_ = 1109402178
		arg_731_1.duration_ = 3.832999999999

		SetActive(arg_731_1.tipsGo_, false)

		function arg_731_1.onSingleLineFinish_()
			arg_731_1.onSingleLineUpdate_ = nil
			arg_731_1.onSingleLineFinish_ = nil
			arg_731_1.state_ = "waiting"
		end

		function arg_731_1.playNext_(arg_733_0)
			if arg_733_0 == 1 then
				arg_731_0:Play1109402179(arg_731_1)
			end
		end

		function arg_731_1.onSingleLineUpdate_(arg_734_0)
			local var_734_0 = 0

			if var_734_0 < arg_731_1.time_ and arg_731_1.time_ <= var_734_0 + arg_734_0 then
				arg_731_1.fswbg_:SetActive(true)
				arg_731_1.dialog_:SetActive(false)

				arg_731_1.fswtw_.percent = 0

				local var_734_1 = arg_731_1:GetWordFromCfg(1109402178)
				local var_734_2 = arg_731_1:FormatText(var_734_1.content)

				arg_731_1.fswt_.text = var_734_2

				LuaForUtil.ClearLinePrefixSymbol(arg_731_1.fswt_)

				arg_731_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_731_1.fswtw_:SetDirty()

				arg_731_1.typewritterCharCountI18N = 0

				arg_731_1:ShowNextGo(false)
			end

			local var_734_3 = 0.0166666666666667

			if var_734_3 < arg_731_1.time_ and arg_731_1.time_ <= var_734_3 + arg_734_0 then
				arg_731_1.var_.oldValueTypewriter = arg_731_1.fswtw_.percent

				arg_731_1:ShowNextGo(false)
			end

			local var_734_4 = 12
			local var_734_5 = 0.8
			local var_734_6 = arg_731_1:GetWordFromCfg(1109402178)
			local var_734_7 = arg_731_1:FormatText(var_734_6.content)
			local var_734_8, var_734_9 = arg_731_1:GetPercentByPara(var_734_7, 1)

			if var_734_3 < arg_731_1.time_ and arg_731_1.time_ <= var_734_3 + arg_734_0 then
				arg_731_1.talkMaxDuration = 0

				local var_734_10 = var_734_4 <= 0 and var_734_5 or var_734_5 * ((var_734_9 - arg_731_1.typewritterCharCountI18N) / var_734_4)

				if var_734_10 > 0 and var_734_5 < var_734_10 then
					arg_731_1.talkMaxDuration = var_734_10

					if var_734_10 + var_734_3 > arg_731_1.duration_ then
						arg_731_1.duration_ = var_734_10 + var_734_3
					end
				end
			end

			local var_734_11 = 0.8
			local var_734_12 = math.max(var_734_11, arg_731_1.talkMaxDuration)

			if var_734_3 <= arg_731_1.time_ and arg_731_1.time_ < var_734_3 + var_734_12 then
				local var_734_13 = (arg_731_1.time_ - var_734_3) / var_734_12

				arg_731_1.fswtw_.percent = Mathf.Lerp(arg_731_1.var_.oldValueTypewriter, var_734_8, var_734_13)
				arg_731_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_731_1.fswtw_:SetDirty()
			end

			if arg_731_1.time_ >= var_734_3 + var_734_12 and arg_731_1.time_ < var_734_3 + var_734_12 + arg_734_0 then
				arg_731_1.fswtw_.percent = var_734_8

				arg_731_1.fswtw_:SetDirty()
				arg_731_1:ShowNextGo(true)

				arg_731_1.typewritterCharCountI18N = var_734_9
			end

			local var_734_14 = 0
			local var_734_15 = 3.833
			local var_734_16 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402178", "story_v_side_new_1109402.awb") / 1000

			if var_734_16 > 0 and var_734_15 < var_734_16 and var_734_16 + var_734_14 > arg_731_1.duration_ then
				local var_734_17 = var_734_16

				arg_731_1.duration_ = var_734_16 + var_734_14
			end

			if var_734_14 < arg_731_1.time_ and arg_731_1.time_ <= var_734_14 + arg_734_0 then
				local var_734_18 = "play"
				local var_734_19 = "voice"

				arg_731_1:AudioAction(var_734_18, var_734_19, "story_v_side_new_1109402", "1109402178", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402179 = function(arg_735_0, arg_735_1)
		arg_735_1.time_ = 0
		arg_735_1.frameCnt_ = 0
		arg_735_1.state_ = "playing"
		arg_735_1.curTalkId_ = 1109402179
		arg_735_1.duration_ = 1.466666666666

		SetActive(arg_735_1.tipsGo_, false)

		function arg_735_1.onSingleLineFinish_()
			arg_735_1.onSingleLineUpdate_ = nil
			arg_735_1.onSingleLineFinish_ = nil
			arg_735_1.state_ = "waiting"
		end

		function arg_735_1.playNext_(arg_737_0)
			if arg_737_0 == 1 then
				arg_735_0:Play1109402180(arg_735_1)
			end
		end

		function arg_735_1.onSingleLineUpdate_(arg_738_0)
			local var_738_0 = 0

			if var_738_0 < arg_735_1.time_ and arg_735_1.time_ <= var_738_0 + arg_738_0 then
				arg_735_1.var_.oldValueTypewriter = arg_735_1.fswtw_.percent

				arg_735_1:ShowNextGo(false)
			end

			local var_738_1 = 22
			local var_738_2 = 1.46666666666667
			local var_738_3 = arg_735_1:GetWordFromCfg(1109402178)
			local var_738_4 = arg_735_1:FormatText(var_738_3.content)
			local var_738_5, var_738_6 = arg_735_1:GetPercentByPara(var_738_4, 2)

			if var_738_0 < arg_735_1.time_ and arg_735_1.time_ <= var_738_0 + arg_738_0 then
				arg_735_1.talkMaxDuration = 0

				local var_738_7 = var_738_1 <= 0 and var_738_2 or var_738_2 * ((var_738_6 - arg_735_1.typewritterCharCountI18N) / var_738_1)

				if var_738_7 > 0 and var_738_2 < var_738_7 then
					arg_735_1.talkMaxDuration = var_738_7

					if var_738_7 + var_738_0 > arg_735_1.duration_ then
						arg_735_1.duration_ = var_738_7 + var_738_0
					end
				end
			end

			local var_738_8 = 1.46666666666667
			local var_738_9 = math.max(var_738_8, arg_735_1.talkMaxDuration)

			if var_738_0 <= arg_735_1.time_ and arg_735_1.time_ < var_738_0 + var_738_9 then
				local var_738_10 = (arg_735_1.time_ - var_738_0) / var_738_9

				arg_735_1.fswtw_.percent = Mathf.Lerp(arg_735_1.var_.oldValueTypewriter, var_738_5, var_738_10)
				arg_735_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_735_1.fswtw_:SetDirty()
			end

			if arg_735_1.time_ >= var_738_0 + var_738_9 and arg_735_1.time_ < var_738_0 + var_738_9 + arg_738_0 then
				arg_735_1.fswtw_.percent = var_738_5

				arg_735_1.fswtw_:SetDirty()
				arg_735_1:ShowNextGo(true)

				arg_735_1.typewritterCharCountI18N = var_738_6
			end
		end
	end,
	Play1109402180 = function(arg_739_0, arg_739_1)
		arg_739_1.time_ = 0
		arg_739_1.frameCnt_ = 0
		arg_739_1.state_ = "playing"
		arg_739_1.curTalkId_ = 1109402180
		arg_739_1.duration_ = 4.399999999999

		SetActive(arg_739_1.tipsGo_, false)

		function arg_739_1.onSingleLineFinish_()
			arg_739_1.onSingleLineUpdate_ = nil
			arg_739_1.onSingleLineFinish_ = nil
			arg_739_1.state_ = "waiting"
		end

		function arg_739_1.playNext_(arg_741_0)
			if arg_741_0 == 1 then
				arg_739_0:Play1109402181(arg_739_1)
			end
		end

		function arg_739_1.onSingleLineUpdate_(arg_742_0)
			local var_742_0 = 0

			if var_742_0 < arg_739_1.time_ and arg_739_1.time_ <= var_742_0 + arg_742_0 then
				arg_739_1.var_.oldValueTypewriter = arg_739_1.fswtw_.percent

				arg_739_1:ShowNextGo(false)
			end

			local var_742_1 = 18
			local var_742_2 = 1.2
			local var_742_3 = arg_739_1:GetWordFromCfg(1109402178)
			local var_742_4 = arg_739_1:FormatText(var_742_3.content)
			local var_742_5, var_742_6 = arg_739_1:GetPercentByPara(var_742_4, 3)

			if var_742_0 < arg_739_1.time_ and arg_739_1.time_ <= var_742_0 + arg_742_0 then
				arg_739_1.talkMaxDuration = 0

				local var_742_7 = var_742_1 <= 0 and var_742_2 or var_742_2 * ((var_742_6 - arg_739_1.typewritterCharCountI18N) / var_742_1)

				if var_742_7 > 0 and var_742_2 < var_742_7 then
					arg_739_1.talkMaxDuration = var_742_7

					if var_742_7 + var_742_0 > arg_739_1.duration_ then
						arg_739_1.duration_ = var_742_7 + var_742_0
					end
				end
			end

			local var_742_8 = 1.2
			local var_742_9 = math.max(var_742_8, arg_739_1.talkMaxDuration)

			if var_742_0 <= arg_739_1.time_ and arg_739_1.time_ < var_742_0 + var_742_9 then
				local var_742_10 = (arg_739_1.time_ - var_742_0) / var_742_9

				arg_739_1.fswtw_.percent = Mathf.Lerp(arg_739_1.var_.oldValueTypewriter, var_742_5, var_742_10)
				arg_739_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_739_1.fswtw_:SetDirty()
			end

			if arg_739_1.time_ >= var_742_0 + var_742_9 and arg_739_1.time_ < var_742_0 + var_742_9 + arg_742_0 then
				arg_739_1.fswtw_.percent = var_742_5

				arg_739_1.fswtw_:SetDirty()
				arg_739_1:ShowNextGo(true)

				arg_739_1.typewritterCharCountI18N = var_742_6
			end

			local var_742_11 = 0
			local var_742_12 = 4.4
			local var_742_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402180", "story_v_side_new_1109402.awb") / 1000

			if var_742_13 > 0 and var_742_12 < var_742_13 and var_742_13 + var_742_11 > arg_739_1.duration_ then
				local var_742_14 = var_742_13

				arg_739_1.duration_ = var_742_13 + var_742_11
			end

			if var_742_11 < arg_739_1.time_ and arg_739_1.time_ <= var_742_11 + arg_742_0 then
				local var_742_15 = "play"
				local var_742_16 = "voice"

				arg_739_1:AudioAction(var_742_15, var_742_16, "story_v_side_new_1109402", "1109402180", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402181 = function(arg_743_0, arg_743_1)
		arg_743_1.time_ = 0
		arg_743_1.frameCnt_ = 0
		arg_743_1.state_ = "playing"
		arg_743_1.curTalkId_ = 1109402181
		arg_743_1.duration_ = 0.999999999999

		SetActive(arg_743_1.tipsGo_, false)

		function arg_743_1.onSingleLineFinish_()
			arg_743_1.onSingleLineUpdate_ = nil
			arg_743_1.onSingleLineFinish_ = nil
			arg_743_1.state_ = "waiting"
		end

		function arg_743_1.playNext_(arg_745_0)
			if arg_745_0 == 1 then
				arg_743_0:Play1109402182(arg_743_1)
			end
		end

		function arg_743_1.onSingleLineUpdate_(arg_746_0)
			local var_746_0 = 0

			if var_746_0 < arg_743_1.time_ and arg_743_1.time_ <= var_746_0 + arg_746_0 then
				arg_743_1.var_.oldValueTypewriter = arg_743_1.fswtw_.percent

				arg_743_1:ShowNextGo(false)
			end

			local var_746_1 = 11
			local var_746_2 = 0.733333333333333
			local var_746_3 = arg_743_1:GetWordFromCfg(1109402178)
			local var_746_4 = arg_743_1:FormatText(var_746_3.content)
			local var_746_5, var_746_6 = arg_743_1:GetPercentByPara(var_746_4, 4)

			if var_746_0 < arg_743_1.time_ and arg_743_1.time_ <= var_746_0 + arg_746_0 then
				arg_743_1.talkMaxDuration = 0

				local var_746_7 = var_746_1 <= 0 and var_746_2 or var_746_2 * ((var_746_6 - arg_743_1.typewritterCharCountI18N) / var_746_1)

				if var_746_7 > 0 and var_746_2 < var_746_7 then
					arg_743_1.talkMaxDuration = var_746_7

					if var_746_7 + var_746_0 > arg_743_1.duration_ then
						arg_743_1.duration_ = var_746_7 + var_746_0
					end
				end
			end

			local var_746_8 = 0.733333333333333
			local var_746_9 = math.max(var_746_8, arg_743_1.talkMaxDuration)

			if var_746_0 <= arg_743_1.time_ and arg_743_1.time_ < var_746_0 + var_746_9 then
				local var_746_10 = (arg_743_1.time_ - var_746_0) / var_746_9

				arg_743_1.fswtw_.percent = Mathf.Lerp(arg_743_1.var_.oldValueTypewriter, var_746_5, var_746_10)
				arg_743_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_743_1.fswtw_:SetDirty()
			end

			if arg_743_1.time_ >= var_746_0 + var_746_9 and arg_743_1.time_ < var_746_0 + var_746_9 + arg_746_0 then
				arg_743_1.fswtw_.percent = var_746_5

				arg_743_1.fswtw_:SetDirty()
				arg_743_1:ShowNextGo(true)

				arg_743_1.typewritterCharCountI18N = var_746_6
			end
		end
	end,
	Play1109402182 = function(arg_747_0, arg_747_1)
		arg_747_1.time_ = 0
		arg_747_1.frameCnt_ = 0
		arg_747_1.state_ = "playing"
		arg_747_1.curTalkId_ = 1109402182
		arg_747_1.duration_ = 6.065999999999

		SetActive(arg_747_1.tipsGo_, false)

		function arg_747_1.onSingleLineFinish_()
			arg_747_1.onSingleLineUpdate_ = nil
			arg_747_1.onSingleLineFinish_ = nil
			arg_747_1.state_ = "waiting"
		end

		function arg_747_1.playNext_(arg_749_0)
			if arg_749_0 == 1 then
				arg_747_0:Play1109402183(arg_747_1)
			end
		end

		function arg_747_1.onSingleLineUpdate_(arg_750_0)
			local var_750_0 = 0

			if var_750_0 < arg_747_1.time_ and arg_747_1.time_ <= var_750_0 + arg_750_0 then
				arg_747_1.var_.oldValueTypewriter = arg_747_1.fswtw_.percent

				arg_747_1:ShowNextGo(false)
			end

			local var_750_1 = 27
			local var_750_2 = 1.8
			local var_750_3 = arg_747_1:GetWordFromCfg(1109402178)
			local var_750_4 = arg_747_1:FormatText(var_750_3.content)
			local var_750_5, var_750_6 = arg_747_1:GetPercentByPara(var_750_4, 5)

			if var_750_0 < arg_747_1.time_ and arg_747_1.time_ <= var_750_0 + arg_750_0 then
				arg_747_1.talkMaxDuration = 0

				local var_750_7 = var_750_1 <= 0 and var_750_2 or var_750_2 * ((var_750_6 - arg_747_1.typewritterCharCountI18N) / var_750_1)

				if var_750_7 > 0 and var_750_2 < var_750_7 then
					arg_747_1.talkMaxDuration = var_750_7

					if var_750_7 + var_750_0 > arg_747_1.duration_ then
						arg_747_1.duration_ = var_750_7 + var_750_0
					end
				end
			end

			local var_750_8 = 1.8
			local var_750_9 = math.max(var_750_8, arg_747_1.talkMaxDuration)

			if var_750_0 <= arg_747_1.time_ and arg_747_1.time_ < var_750_0 + var_750_9 then
				local var_750_10 = (arg_747_1.time_ - var_750_0) / var_750_9

				arg_747_1.fswtw_.percent = Mathf.Lerp(arg_747_1.var_.oldValueTypewriter, var_750_5, var_750_10)
				arg_747_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_747_1.fswtw_:SetDirty()
			end

			if arg_747_1.time_ >= var_750_0 + var_750_9 and arg_747_1.time_ < var_750_0 + var_750_9 + arg_750_0 then
				arg_747_1.fswtw_.percent = var_750_5

				arg_747_1.fswtw_:SetDirty()
				arg_747_1:ShowNextGo(true)

				arg_747_1.typewritterCharCountI18N = var_750_6
			end

			local var_750_11 = 0
			local var_750_12 = 6.066
			local var_750_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402182", "story_v_side_new_1109402.awb") / 1000

			if var_750_13 > 0 and var_750_12 < var_750_13 and var_750_13 + var_750_11 > arg_747_1.duration_ then
				local var_750_14 = var_750_13

				arg_747_1.duration_ = var_750_13 + var_750_11
			end

			if var_750_11 < arg_747_1.time_ and arg_747_1.time_ <= var_750_11 + arg_750_0 then
				local var_750_15 = "play"
				local var_750_16 = "voice"

				arg_747_1:AudioAction(var_750_15, var_750_16, "story_v_side_new_1109402", "1109402182", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402183 = function(arg_751_0, arg_751_1)
		arg_751_1.time_ = 0
		arg_751_1.frameCnt_ = 0
		arg_751_1.state_ = "playing"
		arg_751_1.curTalkId_ = 1109402183
		arg_751_1.duration_ = 1.432999999999

		SetActive(arg_751_1.tipsGo_, false)

		function arg_751_1.onSingleLineFinish_()
			arg_751_1.onSingleLineUpdate_ = nil
			arg_751_1.onSingleLineFinish_ = nil
			arg_751_1.state_ = "waiting"
		end

		function arg_751_1.playNext_(arg_753_0)
			if arg_753_0 == 1 then
				arg_751_0:Play1109402184(arg_751_1)
			end
		end

		function arg_751_1.onSingleLineUpdate_(arg_754_0)
			local var_754_0 = 0

			if var_754_0 < arg_751_1.time_ and arg_751_1.time_ <= var_754_0 + arg_754_0 then
				arg_751_1.var_.oldValueTypewriter = arg_751_1.fswtw_.percent

				arg_751_1:ShowNextGo(false)
			end

			local var_754_1 = 5
			local var_754_2 = 0.333333333333333
			local var_754_3 = arg_751_1:GetWordFromCfg(1109402178)
			local var_754_4 = arg_751_1:FormatText(var_754_3.content)
			local var_754_5, var_754_6 = arg_751_1:GetPercentByPara(var_754_4, 6)

			if var_754_0 < arg_751_1.time_ and arg_751_1.time_ <= var_754_0 + arg_754_0 then
				arg_751_1.talkMaxDuration = 0

				local var_754_7 = var_754_1 <= 0 and var_754_2 or var_754_2 * ((var_754_6 - arg_751_1.typewritterCharCountI18N) / var_754_1)

				if var_754_7 > 0 and var_754_2 < var_754_7 then
					arg_751_1.talkMaxDuration = var_754_7

					if var_754_7 + var_754_0 > arg_751_1.duration_ then
						arg_751_1.duration_ = var_754_7 + var_754_0
					end
				end
			end

			local var_754_8 = 0.333333333333333
			local var_754_9 = math.max(var_754_8, arg_751_1.talkMaxDuration)

			if var_754_0 <= arg_751_1.time_ and arg_751_1.time_ < var_754_0 + var_754_9 then
				local var_754_10 = (arg_751_1.time_ - var_754_0) / var_754_9

				arg_751_1.fswtw_.percent = Mathf.Lerp(arg_751_1.var_.oldValueTypewriter, var_754_5, var_754_10)
				arg_751_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_751_1.fswtw_:SetDirty()
			end

			if arg_751_1.time_ >= var_754_0 + var_754_9 and arg_751_1.time_ < var_754_0 + var_754_9 + arg_754_0 then
				arg_751_1.fswtw_.percent = var_754_5

				arg_751_1.fswtw_:SetDirty()
				arg_751_1:ShowNextGo(true)

				arg_751_1.typewritterCharCountI18N = var_754_6
			end

			local var_754_11 = 0
			local var_754_12 = 1.433
			local var_754_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402183", "story_v_side_new_1109402.awb") / 1000

			if var_754_13 > 0 and var_754_12 < var_754_13 and var_754_13 + var_754_11 > arg_751_1.duration_ then
				local var_754_14 = var_754_13

				arg_751_1.duration_ = var_754_13 + var_754_11
			end

			if var_754_11 < arg_751_1.time_ and arg_751_1.time_ <= var_754_11 + arg_754_0 then
				local var_754_15 = "play"
				local var_754_16 = "voice"

				arg_751_1:AudioAction(var_754_15, var_754_16, "story_v_side_new_1109402", "1109402183", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402184 = function(arg_755_0, arg_755_1)
		arg_755_1.time_ = 0
		arg_755_1.frameCnt_ = 0
		arg_755_1.state_ = "playing"
		arg_755_1.curTalkId_ = 1109402184
		arg_755_1.duration_ = 1.949999999999

		SetActive(arg_755_1.tipsGo_, false)

		function arg_755_1.onSingleLineFinish_()
			arg_755_1.onSingleLineUpdate_ = nil
			arg_755_1.onSingleLineFinish_ = nil
			arg_755_1.state_ = "waiting"
		end

		function arg_755_1.playNext_(arg_757_0)
			if arg_757_0 == 1 then
				arg_755_0:Play1109402185(arg_755_1)
			end
		end

		function arg_755_1.onSingleLineUpdate_(arg_758_0)
			local var_758_0 = 0

			if var_758_0 < arg_755_1.time_ and arg_755_1.time_ <= var_758_0 + arg_758_0 then
				arg_755_1.fswbg_:SetActive(true)
				arg_755_1.dialog_:SetActive(false)

				arg_755_1.fswtw_.percent = 0

				local var_758_1 = arg_755_1:GetWordFromCfg(1109402184)
				local var_758_2 = arg_755_1:FormatText(var_758_1.content)

				arg_755_1.fswt_.text = var_758_2

				LuaForUtil.ClearLinePrefixSymbol(arg_755_1.fswt_)

				arg_755_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_755_1.fswtw_:SetDirty()

				arg_755_1.typewritterCharCountI18N = 0

				arg_755_1:ShowNextGo(false)
			end

			local var_758_3 = 0.0166666666666667

			if var_758_3 < arg_755_1.time_ and arg_755_1.time_ <= var_758_3 + arg_758_0 then
				arg_755_1.var_.oldValueTypewriter = arg_755_1.fswtw_.percent

				arg_755_1:ShowNextGo(false)
			end

			local var_758_4 = 29
			local var_758_5 = 1.93333333333333
			local var_758_6 = arg_755_1:GetWordFromCfg(1109402184)
			local var_758_7 = arg_755_1:FormatText(var_758_6.content)
			local var_758_8, var_758_9 = arg_755_1:GetPercentByPara(var_758_7, 1)

			if var_758_3 < arg_755_1.time_ and arg_755_1.time_ <= var_758_3 + arg_758_0 then
				arg_755_1.talkMaxDuration = 0

				local var_758_10 = var_758_4 <= 0 and var_758_5 or var_758_5 * ((var_758_9 - arg_755_1.typewritterCharCountI18N) / var_758_4)

				if var_758_10 > 0 and var_758_5 < var_758_10 then
					arg_755_1.talkMaxDuration = var_758_10

					if var_758_10 + var_758_3 > arg_755_1.duration_ then
						arg_755_1.duration_ = var_758_10 + var_758_3
					end
				end
			end

			local var_758_11 = 1.93333333333333
			local var_758_12 = math.max(var_758_11, arg_755_1.talkMaxDuration)

			if var_758_3 <= arg_755_1.time_ and arg_755_1.time_ < var_758_3 + var_758_12 then
				local var_758_13 = (arg_755_1.time_ - var_758_3) / var_758_12

				arg_755_1.fswtw_.percent = Mathf.Lerp(arg_755_1.var_.oldValueTypewriter, var_758_8, var_758_13)
				arg_755_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_755_1.fswtw_:SetDirty()
			end

			if arg_755_1.time_ >= var_758_3 + var_758_12 and arg_755_1.time_ < var_758_3 + var_758_12 + arg_758_0 then
				arg_755_1.fswtw_.percent = var_758_8

				arg_755_1.fswtw_:SetDirty()
				arg_755_1:ShowNextGo(true)

				arg_755_1.typewritterCharCountI18N = var_758_9
			end
		end
	end,
	Play1109402185 = function(arg_759_0, arg_759_1)
		arg_759_1.time_ = 0
		arg_759_1.frameCnt_ = 0
		arg_759_1.state_ = "playing"
		arg_759_1.curTalkId_ = 1109402185
		arg_759_1.duration_ = 9.299999999999

		SetActive(arg_759_1.tipsGo_, false)

		function arg_759_1.onSingleLineFinish_()
			arg_759_1.onSingleLineUpdate_ = nil
			arg_759_1.onSingleLineFinish_ = nil
			arg_759_1.state_ = "waiting"
		end

		function arg_759_1.playNext_(arg_761_0)
			if arg_761_0 == 1 then
				arg_759_0:Play1109402186(arg_759_1)
			end
		end

		function arg_759_1.onSingleLineUpdate_(arg_762_0)
			local var_762_0 = 0

			if var_762_0 < arg_759_1.time_ and arg_759_1.time_ <= var_762_0 + arg_762_0 then
				arg_759_1.var_.oldValueTypewriter = arg_759_1.fswtw_.percent

				arg_759_1:ShowNextGo(false)
			end

			local var_762_1 = 43
			local var_762_2 = 2.86666666666667
			local var_762_3 = arg_759_1:GetWordFromCfg(1109402184)
			local var_762_4 = arg_759_1:FormatText(var_762_3.content)
			local var_762_5, var_762_6 = arg_759_1:GetPercentByPara(var_762_4, 2)

			if var_762_0 < arg_759_1.time_ and arg_759_1.time_ <= var_762_0 + arg_762_0 then
				arg_759_1.talkMaxDuration = 0

				local var_762_7 = var_762_1 <= 0 and var_762_2 or var_762_2 * ((var_762_6 - arg_759_1.typewritterCharCountI18N) / var_762_1)

				if var_762_7 > 0 and var_762_2 < var_762_7 then
					arg_759_1.talkMaxDuration = var_762_7

					if var_762_7 + var_762_0 > arg_759_1.duration_ then
						arg_759_1.duration_ = var_762_7 + var_762_0
					end
				end
			end

			local var_762_8 = 2.86666666666667
			local var_762_9 = math.max(var_762_8, arg_759_1.talkMaxDuration)

			if var_762_0 <= arg_759_1.time_ and arg_759_1.time_ < var_762_0 + var_762_9 then
				local var_762_10 = (arg_759_1.time_ - var_762_0) / var_762_9

				arg_759_1.fswtw_.percent = Mathf.Lerp(arg_759_1.var_.oldValueTypewriter, var_762_5, var_762_10)
				arg_759_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_759_1.fswtw_:SetDirty()
			end

			if arg_759_1.time_ >= var_762_0 + var_762_9 and arg_759_1.time_ < var_762_0 + var_762_9 + arg_762_0 then
				arg_759_1.fswtw_.percent = var_762_5

				arg_759_1.fswtw_:SetDirty()
				arg_759_1:ShowNextGo(true)

				arg_759_1.typewritterCharCountI18N = var_762_6
			end

			local var_762_11 = 0
			local var_762_12 = 9.3
			local var_762_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402185", "story_v_side_new_1109402.awb") / 1000

			if var_762_13 > 0 and var_762_12 < var_762_13 and var_762_13 + var_762_11 > arg_759_1.duration_ then
				local var_762_14 = var_762_13

				arg_759_1.duration_ = var_762_13 + var_762_11
			end

			if var_762_11 < arg_759_1.time_ and arg_759_1.time_ <= var_762_11 + arg_762_0 then
				local var_762_15 = "play"
				local var_762_16 = "voice"

				arg_759_1:AudioAction(var_762_15, var_762_16, "story_v_side_new_1109402", "1109402185", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402186 = function(arg_763_0, arg_763_1)
		arg_763_1.time_ = 0
		arg_763_1.frameCnt_ = 0
		arg_763_1.state_ = "playing"
		arg_763_1.curTalkId_ = 1109402186
		arg_763_1.duration_ = 1.132999999999

		SetActive(arg_763_1.tipsGo_, false)

		function arg_763_1.onSingleLineFinish_()
			arg_763_1.onSingleLineUpdate_ = nil
			arg_763_1.onSingleLineFinish_ = nil
			arg_763_1.state_ = "waiting"
		end

		function arg_763_1.playNext_(arg_765_0)
			if arg_765_0 == 1 then
				arg_763_0:Play1109402187(arg_763_1)
			end
		end

		function arg_763_1.onSingleLineUpdate_(arg_766_0)
			local var_766_0 = 0

			if var_766_0 < arg_763_1.time_ and arg_763_1.time_ <= var_766_0 + arg_766_0 then
				arg_763_1.var_.oldValueTypewriter = arg_763_1.fswtw_.percent

				arg_763_1:ShowNextGo(false)
			end

			local var_766_1 = 7
			local var_766_2 = 0.466666666666667
			local var_766_3 = arg_763_1:GetWordFromCfg(1109402184)
			local var_766_4 = arg_763_1:FormatText(var_766_3.content)
			local var_766_5, var_766_6 = arg_763_1:GetPercentByPara(var_766_4, 3)

			if var_766_0 < arg_763_1.time_ and arg_763_1.time_ <= var_766_0 + arg_766_0 then
				arg_763_1.talkMaxDuration = 0

				local var_766_7 = var_766_1 <= 0 and var_766_2 or var_766_2 * ((var_766_6 - arg_763_1.typewritterCharCountI18N) / var_766_1)

				if var_766_7 > 0 and var_766_2 < var_766_7 then
					arg_763_1.talkMaxDuration = var_766_7

					if var_766_7 + var_766_0 > arg_763_1.duration_ then
						arg_763_1.duration_ = var_766_7 + var_766_0
					end
				end
			end

			local var_766_8 = 0.466666666666667
			local var_766_9 = math.max(var_766_8, arg_763_1.talkMaxDuration)

			if var_766_0 <= arg_763_1.time_ and arg_763_1.time_ < var_766_0 + var_766_9 then
				local var_766_10 = (arg_763_1.time_ - var_766_0) / var_766_9

				arg_763_1.fswtw_.percent = Mathf.Lerp(arg_763_1.var_.oldValueTypewriter, var_766_5, var_766_10)
				arg_763_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_763_1.fswtw_:SetDirty()
			end

			if arg_763_1.time_ >= var_766_0 + var_766_9 and arg_763_1.time_ < var_766_0 + var_766_9 + arg_766_0 then
				arg_763_1.fswtw_.percent = var_766_5

				arg_763_1.fswtw_:SetDirty()
				arg_763_1:ShowNextGo(true)

				arg_763_1.typewritterCharCountI18N = var_766_6
			end

			local var_766_11 = 0
			local var_766_12 = 1.133
			local var_766_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402186", "story_v_side_new_1109402.awb") / 1000

			if var_766_13 > 0 and var_766_12 < var_766_13 and var_766_13 + var_766_11 > arg_763_1.duration_ then
				local var_766_14 = var_766_13

				arg_763_1.duration_ = var_766_13 + var_766_11
			end

			if var_766_11 < arg_763_1.time_ and arg_763_1.time_ <= var_766_11 + arg_766_0 then
				local var_766_15 = "play"
				local var_766_16 = "voice"

				arg_763_1:AudioAction(var_766_15, var_766_16, "story_v_side_new_1109402", "1109402186", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402187 = function(arg_767_0, arg_767_1)
		arg_767_1.time_ = 0
		arg_767_1.frameCnt_ = 0
		arg_767_1.state_ = "playing"
		arg_767_1.curTalkId_ = 1109402187
		arg_767_1.duration_ = 7.899999999999

		SetActive(arg_767_1.tipsGo_, false)

		function arg_767_1.onSingleLineFinish_()
			arg_767_1.onSingleLineUpdate_ = nil
			arg_767_1.onSingleLineFinish_ = nil
			arg_767_1.state_ = "waiting"
		end

		function arg_767_1.playNext_(arg_769_0)
			if arg_769_0 == 1 then
				arg_767_0:Play1109402188(arg_767_1)
			end
		end

		function arg_767_1.onSingleLineUpdate_(arg_770_0)
			local var_770_0 = 0

			if var_770_0 < arg_767_1.time_ and arg_767_1.time_ <= var_770_0 + arg_770_0 then
				arg_767_1.var_.oldValueTypewriter = arg_767_1.fswtw_.percent

				arg_767_1:ShowNextGo(false)
			end

			local var_770_1 = 38
			local var_770_2 = 2.53333333333333
			local var_770_3 = arg_767_1:GetWordFromCfg(1109402184)
			local var_770_4 = arg_767_1:FormatText(var_770_3.content)
			local var_770_5, var_770_6 = arg_767_1:GetPercentByPara(var_770_4, 4)

			if var_770_0 < arg_767_1.time_ and arg_767_1.time_ <= var_770_0 + arg_770_0 then
				arg_767_1.talkMaxDuration = 0

				local var_770_7 = var_770_1 <= 0 and var_770_2 or var_770_2 * ((var_770_6 - arg_767_1.typewritterCharCountI18N) / var_770_1)

				if var_770_7 > 0 and var_770_2 < var_770_7 then
					arg_767_1.talkMaxDuration = var_770_7

					if var_770_7 + var_770_0 > arg_767_1.duration_ then
						arg_767_1.duration_ = var_770_7 + var_770_0
					end
				end
			end

			local var_770_8 = 2.53333333333333
			local var_770_9 = math.max(var_770_8, arg_767_1.talkMaxDuration)

			if var_770_0 <= arg_767_1.time_ and arg_767_1.time_ < var_770_0 + var_770_9 then
				local var_770_10 = (arg_767_1.time_ - var_770_0) / var_770_9

				arg_767_1.fswtw_.percent = Mathf.Lerp(arg_767_1.var_.oldValueTypewriter, var_770_5, var_770_10)
				arg_767_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_767_1.fswtw_:SetDirty()
			end

			if arg_767_1.time_ >= var_770_0 + var_770_9 and arg_767_1.time_ < var_770_0 + var_770_9 + arg_770_0 then
				arg_767_1.fswtw_.percent = var_770_5

				arg_767_1.fswtw_:SetDirty()
				arg_767_1:ShowNextGo(true)

				arg_767_1.typewritterCharCountI18N = var_770_6
			end

			local var_770_11 = 0
			local var_770_12 = 7.9
			local var_770_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402187", "story_v_side_new_1109402.awb") / 1000

			if var_770_13 > 0 and var_770_12 < var_770_13 and var_770_13 + var_770_11 > arg_767_1.duration_ then
				local var_770_14 = var_770_13

				arg_767_1.duration_ = var_770_13 + var_770_11
			end

			if var_770_11 < arg_767_1.time_ and arg_767_1.time_ <= var_770_11 + arg_770_0 then
				local var_770_15 = "play"
				local var_770_16 = "voice"

				arg_767_1:AudioAction(var_770_15, var_770_16, "story_v_side_new_1109402", "1109402187", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402188 = function(arg_771_0, arg_771_1)
		arg_771_1.time_ = 0
		arg_771_1.frameCnt_ = 0
		arg_771_1.state_ = "playing"
		arg_771_1.curTalkId_ = 1109402188
		arg_771_1.duration_ = 0.666666666666

		SetActive(arg_771_1.tipsGo_, false)

		function arg_771_1.onSingleLineFinish_()
			arg_771_1.onSingleLineUpdate_ = nil
			arg_771_1.onSingleLineFinish_ = nil
			arg_771_1.state_ = "waiting"
		end

		function arg_771_1.playNext_(arg_773_0)
			if arg_773_0 == 1 then
				arg_771_0:Play1109402189(arg_771_1)
			end
		end

		function arg_771_1.onSingleLineUpdate_(arg_774_0)
			local var_774_0 = 0

			if var_774_0 < arg_771_1.time_ and arg_771_1.time_ <= var_774_0 + arg_774_0 then
				arg_771_1.var_.oldValueTypewriter = arg_771_1.fswtw_.percent

				arg_771_1:ShowNextGo(false)
			end

			local var_774_1 = 10
			local var_774_2 = 0.666666666666667
			local var_774_3 = arg_771_1:GetWordFromCfg(1109402184)
			local var_774_4 = arg_771_1:FormatText(var_774_3.content)
			local var_774_5, var_774_6 = arg_771_1:GetPercentByPara(var_774_4, 5)

			if var_774_0 < arg_771_1.time_ and arg_771_1.time_ <= var_774_0 + arg_774_0 then
				arg_771_1.talkMaxDuration = 0

				local var_774_7 = var_774_1 <= 0 and var_774_2 or var_774_2 * ((var_774_6 - arg_771_1.typewritterCharCountI18N) / var_774_1)

				if var_774_7 > 0 and var_774_2 < var_774_7 then
					arg_771_1.talkMaxDuration = var_774_7

					if var_774_7 + var_774_0 > arg_771_1.duration_ then
						arg_771_1.duration_ = var_774_7 + var_774_0
					end
				end
			end

			local var_774_8 = 0.666666666666667
			local var_774_9 = math.max(var_774_8, arg_771_1.talkMaxDuration)

			if var_774_0 <= arg_771_1.time_ and arg_771_1.time_ < var_774_0 + var_774_9 then
				local var_774_10 = (arg_771_1.time_ - var_774_0) / var_774_9

				arg_771_1.fswtw_.percent = Mathf.Lerp(arg_771_1.var_.oldValueTypewriter, var_774_5, var_774_10)
				arg_771_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_771_1.fswtw_:SetDirty()
			end

			if arg_771_1.time_ >= var_774_0 + var_774_9 and arg_771_1.time_ < var_774_0 + var_774_9 + arg_774_0 then
				arg_771_1.fswtw_.percent = var_774_5

				arg_771_1.fswtw_:SetDirty()
				arg_771_1:ShowNextGo(true)

				arg_771_1.typewritterCharCountI18N = var_774_6
			end
		end
	end,
	Play1109402189 = function(arg_775_0, arg_775_1)
		arg_775_1.time_ = 0
		arg_775_1.frameCnt_ = 0
		arg_775_1.state_ = "playing"
		arg_775_1.curTalkId_ = 1109402189
		arg_775_1.duration_ = 1.299999999999

		SetActive(arg_775_1.tipsGo_, false)

		function arg_775_1.onSingleLineFinish_()
			arg_775_1.onSingleLineUpdate_ = nil
			arg_775_1.onSingleLineFinish_ = nil
			arg_775_1.state_ = "waiting"
		end

		function arg_775_1.playNext_(arg_777_0)
			if arg_777_0 == 1 then
				arg_775_0:Play1109402190(arg_775_1)
			end
		end

		function arg_775_1.onSingleLineUpdate_(arg_778_0)
			local var_778_0 = 0

			if var_778_0 < arg_775_1.time_ and arg_775_1.time_ <= var_778_0 + arg_778_0 then
				arg_775_1.var_.oldValueTypewriter = arg_775_1.fswtw_.percent

				arg_775_1:ShowNextGo(false)
			end

			local var_778_1 = 5
			local var_778_2 = 0.333333333333333
			local var_778_3 = arg_775_1:GetWordFromCfg(1109402184)
			local var_778_4 = arg_775_1:FormatText(var_778_3.content)
			local var_778_5, var_778_6 = arg_775_1:GetPercentByPara(var_778_4, 6)

			if var_778_0 < arg_775_1.time_ and arg_775_1.time_ <= var_778_0 + arg_778_0 then
				arg_775_1.talkMaxDuration = 0

				local var_778_7 = var_778_1 <= 0 and var_778_2 or var_778_2 * ((var_778_6 - arg_775_1.typewritterCharCountI18N) / var_778_1)

				if var_778_7 > 0 and var_778_2 < var_778_7 then
					arg_775_1.talkMaxDuration = var_778_7

					if var_778_7 + var_778_0 > arg_775_1.duration_ then
						arg_775_1.duration_ = var_778_7 + var_778_0
					end
				end
			end

			local var_778_8 = 0.333333333333333
			local var_778_9 = math.max(var_778_8, arg_775_1.talkMaxDuration)

			if var_778_0 <= arg_775_1.time_ and arg_775_1.time_ < var_778_0 + var_778_9 then
				local var_778_10 = (arg_775_1.time_ - var_778_0) / var_778_9

				arg_775_1.fswtw_.percent = Mathf.Lerp(arg_775_1.var_.oldValueTypewriter, var_778_5, var_778_10)
				arg_775_1.fswt_:GetComponent("Text").color = Color(1, 1, 1)

				arg_775_1.fswtw_:SetDirty()
			end

			if arg_775_1.time_ >= var_778_0 + var_778_9 and arg_775_1.time_ < var_778_0 + var_778_9 + arg_778_0 then
				arg_775_1.fswtw_.percent = var_778_5

				arg_775_1.fswtw_:SetDirty()
				arg_775_1:ShowNextGo(true)

				arg_775_1.typewritterCharCountI18N = var_778_6
			end

			local var_778_11 = 0
			local var_778_12 = 1.3
			local var_778_13 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402189", "story_v_side_new_1109402.awb") / 1000

			if var_778_13 > 0 and var_778_12 < var_778_13 and var_778_13 + var_778_11 > arg_775_1.duration_ then
				local var_778_14 = var_778_13

				arg_775_1.duration_ = var_778_13 + var_778_11
			end

			if var_778_11 < arg_775_1.time_ and arg_775_1.time_ <= var_778_11 + arg_778_0 then
				local var_778_15 = "play"
				local var_778_16 = "voice"

				arg_775_1:AudioAction(var_778_15, var_778_16, "story_v_side_new_1109402", "1109402189", "story_v_side_new_1109402.awb")
			end
		end
	end,
	Play1109402190 = function(arg_779_0, arg_779_1)
		arg_779_1.time_ = 0
		arg_779_1.frameCnt_ = 0
		arg_779_1.state_ = "playing"
		arg_779_1.curTalkId_ = 1109402190
		arg_779_1.duration_ = 7

		SetActive(arg_779_1.tipsGo_, false)

		function arg_779_1.onSingleLineFinish_()
			arg_779_1.onSingleLineUpdate_ = nil
			arg_779_1.onSingleLineFinish_ = nil
			arg_779_1.state_ = "waiting"
		end

		function arg_779_1.playNext_(arg_781_0)
			if arg_781_0 == 1 then
				arg_779_0:Play1109402191(arg_779_1)
			end
		end

		function arg_779_1.onSingleLineUpdate_(arg_782_0)
			local var_782_0 = 0

			if var_782_0 < arg_779_1.time_ and arg_779_1.time_ <= var_782_0 + arg_782_0 then
				if arg_779_0.sceneSettingEffect_ then
					arg_779_1.sceneSettingEffect_.enabled = false
				end

				arg_779_1.sceneSettingGo_:SetActive(true)

				local var_782_1 = manager.ui.mainCamera.transform.localPosition
				local var_782_2 = Vector3.New(0, 0, 10) + Vector3.New(var_782_1.x, var_782_1.y, 0)
				local var_782_3 = arg_779_1.bgs_.ST03a

				var_782_3.transform.localPosition = var_782_2
				var_782_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_782_4 = var_782_3:GetComponent("SpriteRenderer")

				if var_782_4 and var_782_4.sprite then
					local var_782_5 = (var_782_3.transform.localPosition - var_782_1).z
					local var_782_6 = manager.ui.mainCameraCom_
					local var_782_7 = 2 * var_782_5 * Mathf.Tan(var_782_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_782_8 = var_782_7 * var_782_6.aspect
					local var_782_9 = var_782_4.sprite.bounds.size.x
					local var_782_10 = var_782_4.sprite.bounds.size.y
					local var_782_11 = var_782_8 / var_782_9
					local var_782_12 = var_782_7 / var_782_10
					local var_782_13 = var_782_12 < var_782_11 and var_782_11 or var_782_12

					var_782_3.transform.localScale = Vector3.New(var_782_13, var_782_13, 0)
				end

				for iter_782_0, iter_782_1 in pairs(arg_779_1.bgs_) do
					if iter_782_0 ~= "ST03a" then
						iter_782_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_782_14 = 0

			if var_782_14 < arg_779_1.time_ and arg_779_1.time_ <= var_782_14 + arg_782_0 then
				arg_779_1.mask_.enabled = true
				arg_779_1.mask_.raycastTarget = true

				arg_779_1:SetGaussion(false)
			end

			local var_782_15 = 2

			if var_782_14 <= arg_779_1.time_ and arg_779_1.time_ < var_782_14 + var_782_15 then
				local var_782_16 = (arg_779_1.time_ - var_782_14) / var_782_15
				local var_782_17 = Color.New(0, 0, 0)

				var_782_17.a = Mathf.Lerp(1, 0, var_782_16)
				arg_779_1.mask_.color = var_782_17
			end

			if arg_779_1.time_ >= var_782_14 + var_782_15 and arg_779_1.time_ < var_782_14 + var_782_15 + arg_782_0 then
				local var_782_18 = Color.New(0, 0, 0)
				local var_782_19 = 0

				arg_779_1.mask_.enabled = false
				var_782_18.a = var_782_19
				arg_779_1.mask_.color = var_782_18
			end

			local var_782_20 = 0

			if var_782_20 < arg_779_1.time_ and arg_779_1.time_ <= var_782_20 + arg_782_0 then
				arg_779_1.fswbg_:SetActive(false)
				arg_779_1.dialog_:SetActive(false)
				arg_779_1:ShowNextGo(false)
			end

			if arg_779_1.frameCnt_ <= 1 then
				arg_779_1.dialog_:SetActive(false)
			end

			local var_782_21 = 2
			local var_782_22 = 1

			if var_782_21 < arg_779_1.time_ and arg_779_1.time_ <= var_782_21 + arg_782_0 then
				arg_779_1.talkMaxDuration = 0

				arg_779_1.dialog_:SetActive(true)

				local var_782_23 = LeanTween.value(arg_779_1.dialog_, 0, 1, 0.3)

				var_782_23:setOnUpdate(LuaHelper.FloatAction(function(arg_783_0)
					arg_779_1.dialogCg_.alpha = arg_783_0
				end))
				var_782_23:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_779_1.dialog_)
					var_782_23:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_779_1.duration_ = arg_779_1.duration_ + 0.3

				SetActive(arg_779_1.leftNameGo_, false)

				arg_779_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_779_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_779_1:RecordName(arg_779_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_779_1.iconTrs_.gameObject, false)
				arg_779_1.callingController_:SetSelectedState("normal")

				local var_782_24 = arg_779_1:GetWordFromCfg(1109402190)
				local var_782_25 = arg_779_1:FormatText(var_782_24.content)

				arg_779_1.text_.text = var_782_25

				LuaForUtil.ClearLinePrefixSymbol(arg_779_1.text_)

				local var_782_26 = 40
				local var_782_27 = utf8.len(var_782_25)
				local var_782_28 = var_782_26 <= 0 and var_782_22 or var_782_22 * (var_782_27 / var_782_26)

				if var_782_28 > 0 and var_782_22 < var_782_28 then
					arg_779_1.talkMaxDuration = var_782_28
					var_782_21 = var_782_21 + 0.3

					if var_782_28 + var_782_21 > arg_779_1.duration_ then
						arg_779_1.duration_ = var_782_28 + var_782_21
					end
				end

				arg_779_1.text_.text = var_782_25
				arg_779_1.typewritter.percent = 0

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(false)
				arg_779_1:RecordContent(arg_779_1.text_.text)
			end

			local var_782_29 = var_782_21 + 0.3
			local var_782_30 = math.max(var_782_22, arg_779_1.talkMaxDuration)

			if var_782_29 <= arg_779_1.time_ and arg_779_1.time_ < var_782_29 + var_782_30 then
				arg_779_1.typewritter.percent = (arg_779_1.time_ - var_782_29) / var_782_30

				arg_779_1.typewritter:SetDirty()
			end

			if arg_779_1.time_ >= var_782_29 + var_782_30 and arg_779_1.time_ < var_782_29 + var_782_30 + arg_782_0 then
				arg_779_1.typewritter.percent = 1

				arg_779_1.typewritter:SetDirty()
				arg_779_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402191 = function(arg_785_0, arg_785_1)
		arg_785_1.time_ = 0
		arg_785_1.frameCnt_ = 0
		arg_785_1.state_ = "playing"
		arg_785_1.curTalkId_ = 1109402191
		arg_785_1.duration_ = 5

		SetActive(arg_785_1.tipsGo_, false)

		function arg_785_1.onSingleLineFinish_()
			arg_785_1.onSingleLineUpdate_ = nil
			arg_785_1.onSingleLineFinish_ = nil
			arg_785_1.state_ = "waiting"
		end

		function arg_785_1.playNext_(arg_787_0)
			if arg_787_0 == 1 then
				arg_785_0:Play1109402192(arg_785_1)
			end
		end

		function arg_785_1.onSingleLineUpdate_(arg_788_0)
			local var_788_0 = 0
			local var_788_1 = 1

			if var_788_0 < arg_785_1.time_ and arg_785_1.time_ <= var_788_0 + arg_788_0 then
				local var_788_2 = "play"
				local var_788_3 = "effect"

				arg_785_1:AudioAction(var_788_2, var_788_3, "se_story_activity_1_5_3", "se_story_activity_1_5_3_fireworks_loop", "")
			end

			local var_788_4 = 0
			local var_788_5 = 1

			if var_788_4 < arg_785_1.time_ and arg_785_1.time_ <= var_788_4 + arg_788_0 then
				arg_785_1.talkMaxDuration = 0
				arg_785_1.dialogCg_.alpha = 1

				arg_785_1.dialog_:SetActive(true)
				SetActive(arg_785_1.leftNameGo_, false)

				arg_785_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_785_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_785_1:RecordName(arg_785_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_785_1.iconTrs_.gameObject, false)
				arg_785_1.callingController_:SetSelectedState("normal")

				local var_788_6 = arg_785_1:GetWordFromCfg(1109402191)
				local var_788_7 = arg_785_1:FormatText(var_788_6.content)

				arg_785_1.text_.text = var_788_7

				LuaForUtil.ClearLinePrefixSymbol(arg_785_1.text_)

				local var_788_8 = 40
				local var_788_9 = utf8.len(var_788_7)
				local var_788_10 = var_788_8 <= 0 and var_788_5 or var_788_5 * (var_788_9 / var_788_8)

				if var_788_10 > 0 and var_788_5 < var_788_10 then
					arg_785_1.talkMaxDuration = var_788_10

					if var_788_10 + var_788_4 > arg_785_1.duration_ then
						arg_785_1.duration_ = var_788_10 + var_788_4
					end
				end

				arg_785_1.text_.text = var_788_7
				arg_785_1.typewritter.percent = 0

				arg_785_1.typewritter:SetDirty()
				arg_785_1:ShowNextGo(false)
				arg_785_1:RecordContent(arg_785_1.text_.text)
			end

			local var_788_11 = math.max(var_788_5, arg_785_1.talkMaxDuration)

			if var_788_4 <= arg_785_1.time_ and arg_785_1.time_ < var_788_4 + var_788_11 then
				arg_785_1.typewritter.percent = (arg_785_1.time_ - var_788_4) / var_788_11

				arg_785_1.typewritter:SetDirty()
			end

			if arg_785_1.time_ >= var_788_4 + var_788_11 and arg_785_1.time_ < var_788_4 + var_788_11 + arg_788_0 then
				arg_785_1.typewritter.percent = 1

				arg_785_1.typewritter:SetDirty()
				arg_785_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402192 = function(arg_789_0, arg_789_1)
		arg_789_1.time_ = 0
		arg_789_1.frameCnt_ = 0
		arg_789_1.state_ = "playing"
		arg_789_1.curTalkId_ = 1109402192
		arg_789_1.duration_ = 3.433

		local var_789_0 = {
			ja = 3.333,
			ko = 3.433,
			zh = 3.433
		}
		local var_789_1 = manager.audio:GetLocalizationFlag()

		if var_789_0[var_789_1] ~= nil then
			arg_789_1.duration_ = var_789_0[var_789_1]
		end

		SetActive(arg_789_1.tipsGo_, false)

		function arg_789_1.onSingleLineFinish_()
			arg_789_1.onSingleLineUpdate_ = nil
			arg_789_1.onSingleLineFinish_ = nil
			arg_789_1.state_ = "waiting"
		end

		function arg_789_1.playNext_(arg_791_0)
			if arg_791_0 == 1 then
				arg_789_0:Play1109402193(arg_789_1)
			end
		end

		function arg_789_1.onSingleLineUpdate_(arg_792_0)
			local var_792_0 = arg_789_1.actors_["1094ui_story"].transform
			local var_792_1 = 0

			if var_792_1 < arg_789_1.time_ and arg_789_1.time_ <= var_792_1 + arg_792_0 then
				arg_789_1.var_.moveOldPos1094ui_story = var_792_0.localPosition
			end

			local var_792_2 = 0.001

			if var_792_1 <= arg_789_1.time_ and arg_789_1.time_ < var_792_1 + var_792_2 then
				local var_792_3 = (arg_789_1.time_ - var_792_1) / var_792_2
				local var_792_4 = Vector3.New(0, -0.84, -6.1)

				var_792_0.localPosition = Vector3.Lerp(arg_789_1.var_.moveOldPos1094ui_story, var_792_4, var_792_3)

				local var_792_5 = manager.ui.mainCamera.transform.position - var_792_0.position

				var_792_0.forward = Vector3.New(var_792_5.x, var_792_5.y, var_792_5.z)

				local var_792_6 = var_792_0.localEulerAngles

				var_792_6.z = 0
				var_792_6.x = 0
				var_792_0.localEulerAngles = var_792_6
			end

			if arg_789_1.time_ >= var_792_1 + var_792_2 and arg_789_1.time_ < var_792_1 + var_792_2 + arg_792_0 then
				var_792_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_792_7 = manager.ui.mainCamera.transform.position - var_792_0.position

				var_792_0.forward = Vector3.New(var_792_7.x, var_792_7.y, var_792_7.z)

				local var_792_8 = var_792_0.localEulerAngles

				var_792_8.z = 0
				var_792_8.x = 0
				var_792_0.localEulerAngles = var_792_8
			end

			local var_792_9 = arg_789_1.actors_["1094ui_story"]
			local var_792_10 = 0

			if var_792_10 < arg_789_1.time_ and arg_789_1.time_ <= var_792_10 + arg_792_0 and arg_789_1.var_.characterEffect1094ui_story == nil then
				arg_789_1.var_.characterEffect1094ui_story = var_792_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_792_11 = 0.200000002980232

			if var_792_10 <= arg_789_1.time_ and arg_789_1.time_ < var_792_10 + var_792_11 then
				local var_792_12 = (arg_789_1.time_ - var_792_10) / var_792_11

				if arg_789_1.var_.characterEffect1094ui_story then
					arg_789_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_789_1.time_ >= var_792_10 + var_792_11 and arg_789_1.time_ < var_792_10 + var_792_11 + arg_792_0 and arg_789_1.var_.characterEffect1094ui_story then
				arg_789_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_792_13 = 0

			if var_792_13 < arg_789_1.time_ and arg_789_1.time_ <= var_792_13 + arg_792_0 then
				arg_789_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_792_14 = 0

			if var_792_14 < arg_789_1.time_ and arg_789_1.time_ <= var_792_14 + arg_792_0 then
				arg_789_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_792_15 = 0
			local var_792_16 = 0.225

			if var_792_15 < arg_789_1.time_ and arg_789_1.time_ <= var_792_15 + arg_792_0 then
				arg_789_1.talkMaxDuration = 0
				arg_789_1.dialogCg_.alpha = 1

				arg_789_1.dialog_:SetActive(true)
				SetActive(arg_789_1.leftNameGo_, true)

				local var_792_17 = arg_789_1:FormatText(StoryNameCfg[181].name)

				arg_789_1.leftNameTxt_.text = var_792_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_789_1.leftNameTxt_.transform)

				arg_789_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_789_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_789_1:RecordName(arg_789_1.leftNameTxt_.text)
				SetActive(arg_789_1.iconTrs_.gameObject, false)
				arg_789_1.callingController_:SetSelectedState("normal")

				local var_792_18 = arg_789_1:GetWordFromCfg(1109402192)
				local var_792_19 = arg_789_1:FormatText(var_792_18.content)

				arg_789_1.text_.text = var_792_19

				LuaForUtil.ClearLinePrefixSymbol(arg_789_1.text_)

				local var_792_20 = 9
				local var_792_21 = utf8.len(var_792_19)
				local var_792_22 = var_792_20 <= 0 and var_792_16 or var_792_16 * (var_792_21 / var_792_20)

				if var_792_22 > 0 and var_792_16 < var_792_22 then
					arg_789_1.talkMaxDuration = var_792_22

					if var_792_22 + var_792_15 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_22 + var_792_15
					end
				end

				arg_789_1.text_.text = var_792_19
				arg_789_1.typewritter.percent = 0

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402192", "story_v_side_new_1109402.awb") ~= 0 then
					local var_792_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402192", "story_v_side_new_1109402.awb") / 1000

					if var_792_23 + var_792_15 > arg_789_1.duration_ then
						arg_789_1.duration_ = var_792_23 + var_792_15
					end

					if var_792_18.prefab_name ~= "" and arg_789_1.actors_[var_792_18.prefab_name] ~= nil then
						local var_792_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_789_1.actors_[var_792_18.prefab_name].transform, "story_v_side_new_1109402", "1109402192", "story_v_side_new_1109402.awb")

						arg_789_1:RecordAudio("1109402192", var_792_24)
						arg_789_1:RecordAudio("1109402192", var_792_24)
					else
						arg_789_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402192", "story_v_side_new_1109402.awb")
					end

					arg_789_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402192", "story_v_side_new_1109402.awb")
				end

				arg_789_1:RecordContent(arg_789_1.text_.text)
			end

			local var_792_25 = math.max(var_792_16, arg_789_1.talkMaxDuration)

			if var_792_15 <= arg_789_1.time_ and arg_789_1.time_ < var_792_15 + var_792_25 then
				arg_789_1.typewritter.percent = (arg_789_1.time_ - var_792_15) / var_792_25

				arg_789_1.typewritter:SetDirty()
			end

			if arg_789_1.time_ >= var_792_15 + var_792_25 and arg_789_1.time_ < var_792_15 + var_792_25 + arg_792_0 then
				arg_789_1.typewritter.percent = 1

				arg_789_1.typewritter:SetDirty()
				arg_789_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402193 = function(arg_793_0, arg_793_1)
		arg_793_1.time_ = 0
		arg_793_1.frameCnt_ = 0
		arg_793_1.state_ = "playing"
		arg_793_1.curTalkId_ = 1109402193
		arg_793_1.duration_ = 5

		SetActive(arg_793_1.tipsGo_, false)

		function arg_793_1.onSingleLineFinish_()
			arg_793_1.onSingleLineUpdate_ = nil
			arg_793_1.onSingleLineFinish_ = nil
			arg_793_1.state_ = "waiting"
		end

		function arg_793_1.playNext_(arg_795_0)
			if arg_795_0 == 1 then
				arg_793_0:Play1109402194(arg_793_1)
			end
		end

		function arg_793_1.onSingleLineUpdate_(arg_796_0)
			local var_796_0 = arg_793_1.actors_["1094ui_story"]
			local var_796_1 = 0

			if var_796_1 < arg_793_1.time_ and arg_793_1.time_ <= var_796_1 + arg_796_0 and arg_793_1.var_.characterEffect1094ui_story == nil then
				arg_793_1.var_.characterEffect1094ui_story = var_796_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_796_2 = 0.200000002980232

			if var_796_1 <= arg_793_1.time_ and arg_793_1.time_ < var_796_1 + var_796_2 then
				local var_796_3 = (arg_793_1.time_ - var_796_1) / var_796_2

				if arg_793_1.var_.characterEffect1094ui_story then
					local var_796_4 = Mathf.Lerp(0, 0.5, var_796_3)

					arg_793_1.var_.characterEffect1094ui_story.fillFlat = true
					arg_793_1.var_.characterEffect1094ui_story.fillRatio = var_796_4
				end
			end

			if arg_793_1.time_ >= var_796_1 + var_796_2 and arg_793_1.time_ < var_796_1 + var_796_2 + arg_796_0 and arg_793_1.var_.characterEffect1094ui_story then
				local var_796_5 = 0.5

				arg_793_1.var_.characterEffect1094ui_story.fillFlat = true
				arg_793_1.var_.characterEffect1094ui_story.fillRatio = var_796_5
			end

			local var_796_6 = 0
			local var_796_7 = 0.975

			if var_796_6 < arg_793_1.time_ and arg_793_1.time_ <= var_796_6 + arg_796_0 then
				arg_793_1.talkMaxDuration = 0
				arg_793_1.dialogCg_.alpha = 1

				arg_793_1.dialog_:SetActive(true)
				SetActive(arg_793_1.leftNameGo_, true)

				local var_796_8 = arg_793_1:FormatText(StoryNameCfg[7].name)

				arg_793_1.leftNameTxt_.text = var_796_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_793_1.leftNameTxt_.transform)

				arg_793_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_793_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_793_1:RecordName(arg_793_1.leftNameTxt_.text)
				SetActive(arg_793_1.iconTrs_.gameObject, false)
				arg_793_1.callingController_:SetSelectedState("normal")

				local var_796_9 = arg_793_1:GetWordFromCfg(1109402193)
				local var_796_10 = arg_793_1:FormatText(var_796_9.content)

				arg_793_1.text_.text = var_796_10

				LuaForUtil.ClearLinePrefixSymbol(arg_793_1.text_)

				local var_796_11 = 39
				local var_796_12 = utf8.len(var_796_10)
				local var_796_13 = var_796_11 <= 0 and var_796_7 or var_796_7 * (var_796_12 / var_796_11)

				if var_796_13 > 0 and var_796_7 < var_796_13 then
					arg_793_1.talkMaxDuration = var_796_13

					if var_796_13 + var_796_6 > arg_793_1.duration_ then
						arg_793_1.duration_ = var_796_13 + var_796_6
					end
				end

				arg_793_1.text_.text = var_796_10
				arg_793_1.typewritter.percent = 0

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(false)
				arg_793_1:RecordContent(arg_793_1.text_.text)
			end

			local var_796_14 = math.max(var_796_7, arg_793_1.talkMaxDuration)

			if var_796_6 <= arg_793_1.time_ and arg_793_1.time_ < var_796_6 + var_796_14 then
				arg_793_1.typewritter.percent = (arg_793_1.time_ - var_796_6) / var_796_14

				arg_793_1.typewritter:SetDirty()
			end

			if arg_793_1.time_ >= var_796_6 + var_796_14 and arg_793_1.time_ < var_796_6 + var_796_14 + arg_796_0 then
				arg_793_1.typewritter.percent = 1

				arg_793_1.typewritter:SetDirty()
				arg_793_1:ShowNextGo(true)
			end
		end
	end,
	Play1109402194 = function(arg_797_0, arg_797_1)
		arg_797_1.time_ = 0
		arg_797_1.frameCnt_ = 0
		arg_797_1.state_ = "playing"
		arg_797_1.curTalkId_ = 1109402194
		arg_797_1.duration_ = 4.3

		local var_797_0 = {
			ja = 1.999999999999,
			ko = 4.3,
			zh = 4.3
		}
		local var_797_1 = manager.audio:GetLocalizationFlag()

		if var_797_0[var_797_1] ~= nil then
			arg_797_1.duration_ = var_797_0[var_797_1]
		end

		SetActive(arg_797_1.tipsGo_, false)

		function arg_797_1.onSingleLineFinish_()
			arg_797_1.onSingleLineUpdate_ = nil
			arg_797_1.onSingleLineFinish_ = nil
			arg_797_1.state_ = "waiting"
			arg_797_1.auto_ = false
		end

		function arg_797_1.playNext_(arg_799_0)
			arg_797_1.onStoryFinished_()
		end

		function arg_797_1.onSingleLineUpdate_(arg_800_0)
			local var_800_0 = arg_797_1.actors_["1094ui_story"].transform
			local var_800_1 = 0

			if var_800_1 < arg_797_1.time_ and arg_797_1.time_ <= var_800_1 + arg_800_0 then
				arg_797_1.var_.moveOldPos1094ui_story = var_800_0.localPosition
			end

			local var_800_2 = 0.001

			if var_800_1 <= arg_797_1.time_ and arg_797_1.time_ < var_800_1 + var_800_2 then
				local var_800_3 = (arg_797_1.time_ - var_800_1) / var_800_2
				local var_800_4 = Vector3.New(0, -0.84, -6.1)

				var_800_0.localPosition = Vector3.Lerp(arg_797_1.var_.moveOldPos1094ui_story, var_800_4, var_800_3)

				local var_800_5 = manager.ui.mainCamera.transform.position - var_800_0.position

				var_800_0.forward = Vector3.New(var_800_5.x, var_800_5.y, var_800_5.z)

				local var_800_6 = var_800_0.localEulerAngles

				var_800_6.z = 0
				var_800_6.x = 0
				var_800_0.localEulerAngles = var_800_6
			end

			if arg_797_1.time_ >= var_800_1 + var_800_2 and arg_797_1.time_ < var_800_1 + var_800_2 + arg_800_0 then
				var_800_0.localPosition = Vector3.New(0, -0.84, -6.1)

				local var_800_7 = manager.ui.mainCamera.transform.position - var_800_0.position

				var_800_0.forward = Vector3.New(var_800_7.x, var_800_7.y, var_800_7.z)

				local var_800_8 = var_800_0.localEulerAngles

				var_800_8.z = 0
				var_800_8.x = 0
				var_800_0.localEulerAngles = var_800_8
			end

			local var_800_9 = arg_797_1.actors_["1094ui_story"]
			local var_800_10 = 0

			if var_800_10 < arg_797_1.time_ and arg_797_1.time_ <= var_800_10 + arg_800_0 and arg_797_1.var_.characterEffect1094ui_story == nil then
				arg_797_1.var_.characterEffect1094ui_story = var_800_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_800_11 = 0.200000002980232

			if var_800_10 <= arg_797_1.time_ and arg_797_1.time_ < var_800_10 + var_800_11 then
				local var_800_12 = (arg_797_1.time_ - var_800_10) / var_800_11

				if arg_797_1.var_.characterEffect1094ui_story then
					arg_797_1.var_.characterEffect1094ui_story.fillFlat = false
				end
			end

			if arg_797_1.time_ >= var_800_10 + var_800_11 and arg_797_1.time_ < var_800_10 + var_800_11 + arg_800_0 and arg_797_1.var_.characterEffect1094ui_story then
				arg_797_1.var_.characterEffect1094ui_story.fillFlat = false
			end

			local var_800_13 = 0

			if var_800_13 < arg_797_1.time_ and arg_797_1.time_ <= var_800_13 + arg_800_0 then
				arg_797_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/1094/1094action/1094action1_1")
			end

			local var_800_14 = 0

			if var_800_14 < arg_797_1.time_ and arg_797_1.time_ <= var_800_14 + arg_800_0 then
				arg_797_1:PlayTimeline("1094ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1102cva")
			end

			local var_800_15 = 0
			local var_800_16 = 0.275

			if var_800_15 < arg_797_1.time_ and arg_797_1.time_ <= var_800_15 + arg_800_0 then
				arg_797_1.talkMaxDuration = 0
				arg_797_1.dialogCg_.alpha = 1

				arg_797_1.dialog_:SetActive(true)
				SetActive(arg_797_1.leftNameGo_, true)

				local var_800_17 = arg_797_1:FormatText(StoryNameCfg[181].name)

				arg_797_1.leftNameTxt_.text = var_800_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_797_1.leftNameTxt_.transform)

				arg_797_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_797_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_797_1:RecordName(arg_797_1.leftNameTxt_.text)
				SetActive(arg_797_1.iconTrs_.gameObject, false)
				arg_797_1.callingController_:SetSelectedState("normal")

				local var_800_18 = arg_797_1:GetWordFromCfg(1109402194)
				local var_800_19 = arg_797_1:FormatText(var_800_18.content)

				arg_797_1.text_.text = var_800_19

				LuaForUtil.ClearLinePrefixSymbol(arg_797_1.text_)

				local var_800_20 = 11
				local var_800_21 = utf8.len(var_800_19)
				local var_800_22 = var_800_20 <= 0 and var_800_16 or var_800_16 * (var_800_21 / var_800_20)

				if var_800_22 > 0 and var_800_16 < var_800_22 then
					arg_797_1.talkMaxDuration = var_800_22

					if var_800_22 + var_800_15 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_22 + var_800_15
					end
				end

				arg_797_1.text_.text = var_800_19
				arg_797_1.typewritter.percent = 0

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402194", "story_v_side_new_1109402.awb") ~= 0 then
					local var_800_23 = manager.audio:GetVoiceLength("story_v_side_new_1109402", "1109402194", "story_v_side_new_1109402.awb") / 1000

					if var_800_23 + var_800_15 > arg_797_1.duration_ then
						arg_797_1.duration_ = var_800_23 + var_800_15
					end

					if var_800_18.prefab_name ~= "" and arg_797_1.actors_[var_800_18.prefab_name] ~= nil then
						local var_800_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_797_1.actors_[var_800_18.prefab_name].transform, "story_v_side_new_1109402", "1109402194", "story_v_side_new_1109402.awb")

						arg_797_1:RecordAudio("1109402194", var_800_24)
						arg_797_1:RecordAudio("1109402194", var_800_24)
					else
						arg_797_1:AudioAction("play", "voice", "story_v_side_new_1109402", "1109402194", "story_v_side_new_1109402.awb")
					end

					arg_797_1:RecordHistoryTalkVoice("story_v_side_new_1109402", "1109402194", "story_v_side_new_1109402.awb")
				end

				arg_797_1:RecordContent(arg_797_1.text_.text)
			end

			local var_800_25 = math.max(var_800_16, arg_797_1.talkMaxDuration)

			if var_800_15 <= arg_797_1.time_ and arg_797_1.time_ < var_800_15 + var_800_25 then
				arg_797_1.typewritter.percent = (arg_797_1.time_ - var_800_15) / var_800_25

				arg_797_1.typewritter:SetDirty()
			end

			if arg_797_1.time_ >= var_800_15 + var_800_25 and arg_797_1.time_ < var_800_15 + var_800_25 + arg_800_0 then
				arg_797_1.typewritter.percent = 1

				arg_797_1.typewritter:SetDirty()
				arg_797_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05d",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D06_1",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST17",
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/I05a"
	},
	voices = {
		"story_v_side_new_1109402.awb"
	}
}
