return {
	Play117041001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 117041001
		arg_1_1.duration_ = 13.566

		local var_1_0 = {
			zh = 13.566,
			ja = 8.966
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
				arg_1_0:Play117041002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "TI0101"

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
				local var_4_5 = arg_1_1.bgs_.TI0101

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
					if iter_4_0 ~= "TI0101" then
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

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_26 = 2
			local var_4_27 = 1.425

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_28 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_28:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_28:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_28:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_29 = arg_1_1:FormatText(StoryNameCfg[368].name)

				arg_1_1.leftNameTxt_.text = var_4_29

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_30 = arg_1_1:GetWordFromCfg(117041001)
				local var_4_31 = arg_1_1:FormatText(var_4_30.content)

				arg_1_1.text_.text = var_4_31

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_32 = 57
				local var_4_33 = utf8.len(var_4_31)
				local var_4_34 = var_4_32 <= 0 and var_4_27 or var_4_27 * (var_4_33 / var_4_32)

				if var_4_34 > 0 and var_4_27 < var_4_34 then
					arg_1_1.talkMaxDuration = var_4_34
					var_4_26 = var_4_26 + 0.3

					if var_4_34 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_34 + var_4_26
					end
				end

				arg_1_1.text_.text = var_4_31
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041001", "story_v_out_117041.awb") ~= 0 then
					local var_4_35 = manager.audio:GetVoiceLength("story_v_out_117041", "117041001", "story_v_out_117041.awb") / 1000

					if var_4_35 + var_4_26 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_35 + var_4_26
					end

					if var_4_30.prefab_name ~= "" and arg_1_1.actors_[var_4_30.prefab_name] ~= nil then
						local var_4_36 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_30.prefab_name].transform, "story_v_out_117041", "117041001", "story_v_out_117041.awb")

						arg_1_1:RecordAudio("117041001", var_4_36)
						arg_1_1:RecordAudio("117041001", var_4_36)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_117041", "117041001", "story_v_out_117041.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_117041", "117041001", "story_v_out_117041.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_37 = var_4_26 + 0.3
			local var_4_38 = math.max(var_4_27, arg_1_1.talkMaxDuration)

			if var_4_37 <= arg_1_1.time_ and arg_1_1.time_ < var_4_37 + var_4_38 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_37) / var_4_38

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_37 + var_4_38 and arg_1_1.time_ < var_4_37 + var_4_38 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play117041002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 117041002
		arg_7_1.duration_ = 13.033

		local var_7_0 = {
			zh = 13.033,
			ja = 9.133
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
				arg_7_0:Play117041003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 1.625

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[368].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(117041002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 65
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041002", "story_v_out_117041.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041002", "story_v_out_117041.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_117041", "117041002", "story_v_out_117041.awb")

						arg_7_1:RecordAudio("117041002", var_10_9)
						arg_7_1:RecordAudio("117041002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_117041", "117041002", "story_v_out_117041.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_117041", "117041002", "story_v_out_117041.awb")
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
	Play117041003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 117041003
		arg_11_1.duration_ = 11.2

		local var_11_0 = {
			zh = 11.2,
			ja = 10.266
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
				arg_11_0:Play117041004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1.325

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[368].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(117041003)
				local var_14_4 = arg_11_1:FormatText(var_14_3.content)

				arg_11_1.text_.text = var_14_4

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_5 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041003", "story_v_out_117041.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041003", "story_v_out_117041.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_117041", "117041003", "story_v_out_117041.awb")

						arg_11_1:RecordAudio("117041003", var_14_9)
						arg_11_1:RecordAudio("117041003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_117041", "117041003", "story_v_out_117041.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_117041", "117041003", "story_v_out_117041.awb")
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
	Play117041004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 117041004
		arg_15_1.duration_ = 9

		SetActive(arg_15_1.tipsGo_, false)

		function arg_15_1.onSingleLineFinish_()
			arg_15_1.onSingleLineUpdate_ = nil
			arg_15_1.onSingleLineFinish_ = nil
			arg_15_1.state_ = "waiting"
		end

		function arg_15_1.playNext_(arg_17_0)
			if arg_17_0 == 1 then
				arg_15_0:Play117041005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = "ST12"

			if arg_15_1.bgs_[var_18_0] == nil then
				local var_18_1 = Object.Instantiate(arg_15_1.paintGo_)

				var_18_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_18_0)
				var_18_1.name = var_18_0
				var_18_1.transform.parent = arg_15_1.stage_.transform
				var_18_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_15_1.bgs_[var_18_0] = var_18_1
			end

			local var_18_2 = 2

			if var_18_2 < arg_15_1.time_ and arg_15_1.time_ <= var_18_2 + arg_18_0 then
				local var_18_3 = manager.ui.mainCamera.transform.localPosition
				local var_18_4 = Vector3.New(0, 0, 10) + Vector3.New(var_18_3.x, var_18_3.y, 0)
				local var_18_5 = arg_15_1.bgs_.ST12

				var_18_5.transform.localPosition = var_18_4
				var_18_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_18_6 = var_18_5:GetComponent("SpriteRenderer")

				if var_18_6 and var_18_6.sprite then
					local var_18_7 = (var_18_5.transform.localPosition - var_18_3).z
					local var_18_8 = manager.ui.mainCameraCom_
					local var_18_9 = 2 * var_18_7 * Mathf.Tan(var_18_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_18_10 = var_18_9 * var_18_8.aspect
					local var_18_11 = var_18_6.sprite.bounds.size.x
					local var_18_12 = var_18_6.sprite.bounds.size.y
					local var_18_13 = var_18_10 / var_18_11
					local var_18_14 = var_18_9 / var_18_12
					local var_18_15 = var_18_14 < var_18_13 and var_18_13 or var_18_14

					var_18_5.transform.localScale = Vector3.New(var_18_15, var_18_15, 0)
				end

				for iter_18_0, iter_18_1 in pairs(arg_15_1.bgs_) do
					if iter_18_0 ~= "ST12" then
						iter_18_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_18_16 = 0

			if var_18_16 < arg_15_1.time_ and arg_15_1.time_ <= var_18_16 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_17 = 2

			if var_18_16 <= arg_15_1.time_ and arg_15_1.time_ < var_18_16 + var_18_17 then
				local var_18_18 = (arg_15_1.time_ - var_18_16) / var_18_17
				local var_18_19 = Color.New(0, 0, 0)

				var_18_19.a = Mathf.Lerp(0, 1, var_18_18)
				arg_15_1.mask_.color = var_18_19
			end

			if arg_15_1.time_ >= var_18_16 + var_18_17 and arg_15_1.time_ < var_18_16 + var_18_17 + arg_18_0 then
				local var_18_20 = Color.New(0, 0, 0)

				var_18_20.a = 1
				arg_15_1.mask_.color = var_18_20
			end

			local var_18_21 = 2

			if var_18_21 < arg_15_1.time_ and arg_15_1.time_ <= var_18_21 + arg_18_0 then
				arg_15_1.mask_.enabled = true
				arg_15_1.mask_.raycastTarget = true

				arg_15_1:SetGaussion(false)
			end

			local var_18_22 = 2

			if var_18_21 <= arg_15_1.time_ and arg_15_1.time_ < var_18_21 + var_18_22 then
				local var_18_23 = (arg_15_1.time_ - var_18_21) / var_18_22
				local var_18_24 = Color.New(0, 0, 0)

				var_18_24.a = Mathf.Lerp(1, 0, var_18_23)
				arg_15_1.mask_.color = var_18_24
			end

			if arg_15_1.time_ >= var_18_21 + var_18_22 and arg_15_1.time_ < var_18_21 + var_18_22 + arg_18_0 then
				local var_18_25 = Color.New(0, 0, 0)
				local var_18_26 = 0

				arg_15_1.mask_.enabled = false
				var_18_25.a = var_18_26
				arg_15_1.mask_.color = var_18_25
			end

			local var_18_27 = 4
			local var_18_28 = 0.45

			if var_18_27 < arg_15_1.time_ and arg_15_1.time_ <= var_18_27 + arg_18_0 then
				local var_18_29 = "play"
				local var_18_30 = "music"

				arg_15_1:AudioAction(var_18_29, var_18_30, "bgm_side_daily04", "bgm_side_daily04", "bgm_side_daily04.awb")
			end

			local var_18_31 = 0
			local var_18_32 = 1

			if var_18_31 < arg_15_1.time_ and arg_15_1.time_ <= var_18_31 + arg_18_0 then
				local var_18_33 = "play"
				local var_18_34 = "music"

				arg_15_1:AudioAction(var_18_33, var_18_34, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_15_1.frameCnt_ <= 1 then
				arg_15_1.dialog_:SetActive(false)
			end

			local var_18_35 = 4
			local var_18_36 = 0.45

			if var_18_35 < arg_15_1.time_ and arg_15_1.time_ <= var_18_35 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0

				arg_15_1.dialog_:SetActive(true)

				local var_18_37 = LeanTween.value(arg_15_1.dialog_, 0, 1, 0.3)

				var_18_37:setOnUpdate(LuaHelper.FloatAction(function(arg_19_0)
					arg_15_1.dialogCg_.alpha = arg_19_0
				end))
				var_18_37:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_15_1.dialog_)
					var_18_37:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_15_1.duration_ = arg_15_1.duration_ + 0.3

				SetActive(arg_15_1.leftNameGo_, false)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_38 = arg_15_1:GetWordFromCfg(117041004)
				local var_18_39 = arg_15_1:FormatText(var_18_38.content)

				arg_15_1.text_.text = var_18_39

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_40 = 18
				local var_18_41 = utf8.len(var_18_39)
				local var_18_42 = var_18_40 <= 0 and var_18_36 or var_18_36 * (var_18_41 / var_18_40)

				if var_18_42 > 0 and var_18_36 < var_18_42 then
					arg_15_1.talkMaxDuration = var_18_42
					var_18_35 = var_18_35 + 0.3

					if var_18_42 + var_18_35 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_42 + var_18_35
					end
				end

				arg_15_1.text_.text = var_18_39
				arg_15_1.typewritter.percent = 0

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(false)
				arg_15_1:RecordContent(arg_15_1.text_.text)
			end

			local var_18_43 = var_18_35 + 0.3
			local var_18_44 = math.max(var_18_36, arg_15_1.talkMaxDuration)

			if var_18_43 <= arg_15_1.time_ and arg_15_1.time_ < var_18_43 + var_18_44 then
				arg_15_1.typewritter.percent = (arg_15_1.time_ - var_18_43) / var_18_44

				arg_15_1.typewritter:SetDirty()
			end

			if arg_15_1.time_ >= var_18_43 + var_18_44 and arg_15_1.time_ < var_18_43 + var_18_44 + arg_18_0 then
				arg_15_1.typewritter.percent = 1

				arg_15_1.typewritter:SetDirty()
				arg_15_1:ShowNextGo(true)
			end
		end
	end,
	Play117041005 = function(arg_21_0, arg_21_1)
		arg_21_1.time_ = 0
		arg_21_1.frameCnt_ = 0
		arg_21_1.state_ = "playing"
		arg_21_1.curTalkId_ = 117041005
		arg_21_1.duration_ = 4.9

		local var_21_0 = {
			zh = 4.9,
			ja = 4.333
		}
		local var_21_1 = manager.audio:GetLocalizationFlag()

		if var_21_0[var_21_1] ~= nil then
			arg_21_1.duration_ = var_21_0[var_21_1]
		end

		SetActive(arg_21_1.tipsGo_, false)

		function arg_21_1.onSingleLineFinish_()
			arg_21_1.onSingleLineUpdate_ = nil
			arg_21_1.onSingleLineFinish_ = nil
			arg_21_1.state_ = "waiting"
		end

		function arg_21_1.playNext_(arg_23_0)
			if arg_23_0 == 1 then
				arg_21_0:Play117041006(arg_21_1)
			end
		end

		function arg_21_1.onSingleLineUpdate_(arg_24_0)
			local var_24_0 = "1029"

			if arg_21_1.actors_[var_24_0] == nil then
				local var_24_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_24_0), arg_21_1.canvasGo_.transform)

				var_24_1.transform:SetSiblingIndex(1)

				var_24_1.name = var_24_0
				var_24_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_21_1.actors_[var_24_0] = var_24_1
			end

			local var_24_2 = arg_21_1.actors_["1029"].transform
			local var_24_3 = 0

			if var_24_3 < arg_21_1.time_ and arg_21_1.time_ <= var_24_3 + arg_24_0 then
				arg_21_1.var_.moveOldPos1029 = var_24_2.localPosition
				var_24_2.localScale = Vector3.New(1, 1, 1)

				arg_21_1:CheckSpriteTmpPos("1029", 2)

				local var_24_4 = var_24_2.childCount

				for iter_24_0 = 0, var_24_4 - 1 do
					local var_24_5 = var_24_2:GetChild(iter_24_0)

					if var_24_5.name == "split_1" or not string.find(var_24_5.name, "split") then
						var_24_5.gameObject:SetActive(true)
					else
						var_24_5.gameObject:SetActive(false)
					end
				end
			end

			local var_24_6 = 0.001

			if var_24_3 <= arg_21_1.time_ and arg_21_1.time_ < var_24_3 + var_24_6 then
				local var_24_7 = (arg_21_1.time_ - var_24_3) / var_24_6
				local var_24_8 = Vector3.New(-390, -355, -140)

				var_24_2.localPosition = Vector3.Lerp(arg_21_1.var_.moveOldPos1029, var_24_8, var_24_7)
			end

			if arg_21_1.time_ >= var_24_3 + var_24_6 and arg_21_1.time_ < var_24_3 + var_24_6 + arg_24_0 then
				var_24_2.localPosition = Vector3.New(-390, -355, -140)
			end

			local var_24_9 = arg_21_1.actors_["1029"]
			local var_24_10 = 0

			if var_24_10 < arg_21_1.time_ and arg_21_1.time_ <= var_24_10 + arg_24_0 then
				local var_24_11 = var_24_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_24_11 then
					arg_21_1.var_.alphaOldValue1029 = var_24_11.alpha
					arg_21_1.var_.characterEffect1029 = var_24_11
				end

				arg_21_1.var_.alphaOldValue1029 = 0
			end

			local var_24_12 = 0.333333333333333

			if var_24_10 <= arg_21_1.time_ and arg_21_1.time_ < var_24_10 + var_24_12 then
				local var_24_13 = (arg_21_1.time_ - var_24_10) / var_24_12
				local var_24_14 = Mathf.Lerp(arg_21_1.var_.alphaOldValue1029, 1, var_24_13)

				if arg_21_1.var_.characterEffect1029 then
					arg_21_1.var_.characterEffect1029.alpha = var_24_14
				end
			end

			if arg_21_1.time_ >= var_24_10 + var_24_12 and arg_21_1.time_ < var_24_10 + var_24_12 + arg_24_0 and arg_21_1.var_.characterEffect1029 then
				arg_21_1.var_.characterEffect1029.alpha = 1
			end

			local var_24_15 = arg_21_1.actors_["1029"]
			local var_24_16 = 0

			if var_24_16 < arg_21_1.time_ and arg_21_1.time_ <= var_24_16 + arg_24_0 and arg_21_1.var_.actorSpriteComps1029 == nil then
				arg_21_1.var_.actorSpriteComps1029 = var_24_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_24_17 = 0.2

			if var_24_16 <= arg_21_1.time_ and arg_21_1.time_ < var_24_16 + var_24_17 then
				local var_24_18 = (arg_21_1.time_ - var_24_16) / var_24_17

				if arg_21_1.var_.actorSpriteComps1029 then
					for iter_24_1, iter_24_2 in pairs(arg_21_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_24_2 then
							local var_24_19 = Mathf.Lerp(iter_24_2.color.r, 1, var_24_18)

							iter_24_2.color = Color.New(var_24_19, var_24_19, var_24_19)
						end
					end
				end
			end

			if arg_21_1.time_ >= var_24_16 + var_24_17 and arg_21_1.time_ < var_24_16 + var_24_17 + arg_24_0 and arg_21_1.var_.actorSpriteComps1029 then
				local var_24_20 = 1

				for iter_24_3, iter_24_4 in pairs(arg_21_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_24_4 then
						iter_24_4.color = Color.New(var_24_20, var_24_20, var_24_20)
					end
				end

				arg_21_1.var_.actorSpriteComps1029 = nil
			end

			local var_24_21 = 0
			local var_24_22 = 0.625

			if var_24_21 < arg_21_1.time_ and arg_21_1.time_ <= var_24_21 + arg_24_0 then
				arg_21_1.talkMaxDuration = 0
				arg_21_1.dialogCg_.alpha = 1

				arg_21_1.dialog_:SetActive(true)
				SetActive(arg_21_1.leftNameGo_, true)

				local var_24_23 = arg_21_1:FormatText(StoryNameCfg[319].name)

				arg_21_1.leftNameTxt_.text = var_24_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_21_1.leftNameTxt_.transform)

				arg_21_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_21_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_21_1:RecordName(arg_21_1.leftNameTxt_.text)
				SetActive(arg_21_1.iconTrs_.gameObject, false)
				arg_21_1.callingController_:SetSelectedState("normal")

				local var_24_24 = arg_21_1:GetWordFromCfg(117041005)
				local var_24_25 = arg_21_1:FormatText(var_24_24.content)

				arg_21_1.text_.text = var_24_25

				LuaForUtil.ClearLinePrefixSymbol(arg_21_1.text_)

				local var_24_26 = 25
				local var_24_27 = utf8.len(var_24_25)
				local var_24_28 = var_24_26 <= 0 and var_24_22 or var_24_22 * (var_24_27 / var_24_26)

				if var_24_28 > 0 and var_24_22 < var_24_28 then
					arg_21_1.talkMaxDuration = var_24_28

					if var_24_28 + var_24_21 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_28 + var_24_21
					end
				end

				arg_21_1.text_.text = var_24_25
				arg_21_1.typewritter.percent = 0

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041005", "story_v_out_117041.awb") ~= 0 then
					local var_24_29 = manager.audio:GetVoiceLength("story_v_out_117041", "117041005", "story_v_out_117041.awb") / 1000

					if var_24_29 + var_24_21 > arg_21_1.duration_ then
						arg_21_1.duration_ = var_24_29 + var_24_21
					end

					if var_24_24.prefab_name ~= "" and arg_21_1.actors_[var_24_24.prefab_name] ~= nil then
						local var_24_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_21_1.actors_[var_24_24.prefab_name].transform, "story_v_out_117041", "117041005", "story_v_out_117041.awb")

						arg_21_1:RecordAudio("117041005", var_24_30)
						arg_21_1:RecordAudio("117041005", var_24_30)
					else
						arg_21_1:AudioAction("play", "voice", "story_v_out_117041", "117041005", "story_v_out_117041.awb")
					end

					arg_21_1:RecordHistoryTalkVoice("story_v_out_117041", "117041005", "story_v_out_117041.awb")
				end

				arg_21_1:RecordContent(arg_21_1.text_.text)
			end

			local var_24_31 = math.max(var_24_22, arg_21_1.talkMaxDuration)

			if var_24_21 <= arg_21_1.time_ and arg_21_1.time_ < var_24_21 + var_24_31 then
				arg_21_1.typewritter.percent = (arg_21_1.time_ - var_24_21) / var_24_31

				arg_21_1.typewritter:SetDirty()
			end

			if arg_21_1.time_ >= var_24_21 + var_24_31 and arg_21_1.time_ < var_24_21 + var_24_31 + arg_24_0 then
				arg_21_1.typewritter.percent = 1

				arg_21_1.typewritter:SetDirty()
				arg_21_1:ShowNextGo(true)
			end
		end
	end,
	Play117041006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 117041006
		arg_25_1.duration_ = 9.4

		local var_25_0 = {
			zh = 3.933,
			ja = 9.4
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
				arg_25_0:Play117041007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "1033"

			if arg_25_1.actors_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_28_0), arg_25_1.canvasGo_.transform)

				var_28_1.transform:SetSiblingIndex(1)

				var_28_1.name = var_28_0
				var_28_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_25_1.actors_[var_28_0] = var_28_1
			end

			local var_28_2 = arg_25_1.actors_["1033"].transform
			local var_28_3 = 0

			if var_28_3 < arg_25_1.time_ and arg_25_1.time_ <= var_28_3 + arg_28_0 then
				arg_25_1.var_.moveOldPos1033 = var_28_2.localPosition
				var_28_2.localScale = Vector3.New(1, 1, 1)

				arg_25_1:CheckSpriteTmpPos("1033", 4)

				local var_28_4 = var_28_2.childCount

				for iter_28_0 = 0, var_28_4 - 1 do
					local var_28_5 = var_28_2:GetChild(iter_28_0)

					if var_28_5.name == "split_6" or not string.find(var_28_5.name, "split") then
						var_28_5.gameObject:SetActive(true)
					else
						var_28_5.gameObject:SetActive(false)
					end
				end
			end

			local var_28_6 = 0.001

			if var_28_3 <= arg_25_1.time_ and arg_25_1.time_ < var_28_3 + var_28_6 then
				local var_28_7 = (arg_25_1.time_ - var_28_3) / var_28_6
				local var_28_8 = Vector3.New(390, -420, 0)

				var_28_2.localPosition = Vector3.Lerp(arg_25_1.var_.moveOldPos1033, var_28_8, var_28_7)
			end

			if arg_25_1.time_ >= var_28_3 + var_28_6 and arg_25_1.time_ < var_28_3 + var_28_6 + arg_28_0 then
				var_28_2.localPosition = Vector3.New(390, -420, 0)
			end

			local var_28_9 = arg_25_1.actors_["1029"]
			local var_28_10 = 0

			if var_28_10 < arg_25_1.time_ and arg_25_1.time_ <= var_28_10 + arg_28_0 and arg_25_1.var_.actorSpriteComps1029 == nil then
				arg_25_1.var_.actorSpriteComps1029 = var_28_9:GetComponentsInChildren(typeof(Image), true)
			end

			local var_28_11 = 0.2

			if var_28_10 <= arg_25_1.time_ and arg_25_1.time_ < var_28_10 + var_28_11 then
				local var_28_12 = (arg_25_1.time_ - var_28_10) / var_28_11

				if arg_25_1.var_.actorSpriteComps1029 then
					for iter_28_1, iter_28_2 in pairs(arg_25_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_28_2 then
							local var_28_13 = Mathf.Lerp(iter_28_2.color.r, 0.5, var_28_12)

							iter_28_2.color = Color.New(var_28_13, var_28_13, var_28_13)
						end
					end
				end
			end

			if arg_25_1.time_ >= var_28_10 + var_28_11 and arg_25_1.time_ < var_28_10 + var_28_11 + arg_28_0 and arg_25_1.var_.actorSpriteComps1029 then
				local var_28_14 = 0.5

				for iter_28_3, iter_28_4 in pairs(arg_25_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_28_4 then
						iter_28_4.color = Color.New(var_28_14, var_28_14, var_28_14)
					end
				end

				arg_25_1.var_.actorSpriteComps1029 = nil
			end

			local var_28_15 = arg_25_1.actors_["1033"]
			local var_28_16 = 0

			if var_28_16 < arg_25_1.time_ and arg_25_1.time_ <= var_28_16 + arg_28_0 then
				local var_28_17 = var_28_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_28_17 then
					arg_25_1.var_.alphaOldValue1033 = var_28_17.alpha
					arg_25_1.var_.characterEffect1033 = var_28_17
				end

				arg_25_1.var_.alphaOldValue1033 = 0
			end

			local var_28_18 = 0.2

			if var_28_16 <= arg_25_1.time_ and arg_25_1.time_ < var_28_16 + var_28_18 then
				local var_28_19 = (arg_25_1.time_ - var_28_16) / var_28_18
				local var_28_20 = Mathf.Lerp(arg_25_1.var_.alphaOldValue1033, 1, var_28_19)

				if arg_25_1.var_.characterEffect1033 then
					arg_25_1.var_.characterEffect1033.alpha = var_28_20
				end
			end

			if arg_25_1.time_ >= var_28_16 + var_28_18 and arg_25_1.time_ < var_28_16 + var_28_18 + arg_28_0 and arg_25_1.var_.characterEffect1033 then
				arg_25_1.var_.characterEffect1033.alpha = 1
			end

			local var_28_21 = 0
			local var_28_22 = 0.45

			if var_28_21 < arg_25_1.time_ and arg_25_1.time_ <= var_28_21 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_23 = arg_25_1:FormatText(StoryNameCfg[236].name)

				arg_25_1.leftNameTxt_.text = var_28_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_24 = arg_25_1:GetWordFromCfg(117041006)
				local var_28_25 = arg_25_1:FormatText(var_28_24.content)

				arg_25_1.text_.text = var_28_25

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_26 = 18
				local var_28_27 = utf8.len(var_28_25)
				local var_28_28 = var_28_26 <= 0 and var_28_22 or var_28_22 * (var_28_27 / var_28_26)

				if var_28_28 > 0 and var_28_22 < var_28_28 then
					arg_25_1.talkMaxDuration = var_28_28

					if var_28_28 + var_28_21 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_28 + var_28_21
					end
				end

				arg_25_1.text_.text = var_28_25
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041006", "story_v_out_117041.awb") ~= 0 then
					local var_28_29 = manager.audio:GetVoiceLength("story_v_out_117041", "117041006", "story_v_out_117041.awb") / 1000

					if var_28_29 + var_28_21 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_29 + var_28_21
					end

					if var_28_24.prefab_name ~= "" and arg_25_1.actors_[var_28_24.prefab_name] ~= nil then
						local var_28_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_24.prefab_name].transform, "story_v_out_117041", "117041006", "story_v_out_117041.awb")

						arg_25_1:RecordAudio("117041006", var_28_30)
						arg_25_1:RecordAudio("117041006", var_28_30)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_117041", "117041006", "story_v_out_117041.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_117041", "117041006", "story_v_out_117041.awb")
				end

				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_31 = math.max(var_28_22, arg_25_1.talkMaxDuration)

			if var_28_21 <= arg_25_1.time_ and arg_25_1.time_ < var_28_21 + var_28_31 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_21) / var_28_31

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_21 + var_28_31 and arg_25_1.time_ < var_28_21 + var_28_31 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play117041007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 117041007
		arg_29_1.duration_ = 2.833

		local var_29_0 = {
			zh = 1.233,
			ja = 2.833
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
				arg_29_0:Play117041008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = arg_29_1.actors_["1033"]
			local var_32_1 = 0

			if var_32_1 < arg_29_1.time_ and arg_29_1.time_ <= var_32_1 + arg_32_0 and arg_29_1.var_.actorSpriteComps1033 == nil then
				arg_29_1.var_.actorSpriteComps1033 = var_32_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_2 = 0.2

			if var_32_1 <= arg_29_1.time_ and arg_29_1.time_ < var_32_1 + var_32_2 then
				local var_32_3 = (arg_29_1.time_ - var_32_1) / var_32_2

				if arg_29_1.var_.actorSpriteComps1033 then
					for iter_32_0, iter_32_1 in pairs(arg_29_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_32_1 then
							local var_32_4 = Mathf.Lerp(iter_32_1.color.r, 0.5, var_32_3)

							iter_32_1.color = Color.New(var_32_4, var_32_4, var_32_4)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_1 + var_32_2 and arg_29_1.time_ < var_32_1 + var_32_2 + arg_32_0 and arg_29_1.var_.actorSpriteComps1033 then
				local var_32_5 = 0.5

				for iter_32_2, iter_32_3 in pairs(arg_29_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_32_3 then
						iter_32_3.color = Color.New(var_32_5, var_32_5, var_32_5)
					end
				end

				arg_29_1.var_.actorSpriteComps1033 = nil
			end

			local var_32_6 = arg_29_1.actors_["1029"]
			local var_32_7 = 0

			if var_32_7 < arg_29_1.time_ and arg_29_1.time_ <= var_32_7 + arg_32_0 and arg_29_1.var_.actorSpriteComps1029 == nil then
				arg_29_1.var_.actorSpriteComps1029 = var_32_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_32_8 = 0.2

			if var_32_7 <= arg_29_1.time_ and arg_29_1.time_ < var_32_7 + var_32_8 then
				local var_32_9 = (arg_29_1.time_ - var_32_7) / var_32_8

				if arg_29_1.var_.actorSpriteComps1029 then
					for iter_32_4, iter_32_5 in pairs(arg_29_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_32_5 then
							local var_32_10 = Mathf.Lerp(iter_32_5.color.r, 1, var_32_9)

							iter_32_5.color = Color.New(var_32_10, var_32_10, var_32_10)
						end
					end
				end
			end

			if arg_29_1.time_ >= var_32_7 + var_32_8 and arg_29_1.time_ < var_32_7 + var_32_8 + arg_32_0 and arg_29_1.var_.actorSpriteComps1029 then
				local var_32_11 = 1

				for iter_32_6, iter_32_7 in pairs(arg_29_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_32_7 then
						iter_32_7.color = Color.New(var_32_11, var_32_11, var_32_11)
					end
				end

				arg_29_1.var_.actorSpriteComps1029 = nil
			end

			local var_32_12 = 0
			local var_32_13 = 0.075

			if var_32_12 < arg_29_1.time_ and arg_29_1.time_ <= var_32_12 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0
				arg_29_1.dialogCg_.alpha = 1

				arg_29_1.dialog_:SetActive(true)
				SetActive(arg_29_1.leftNameGo_, true)

				local var_32_14 = arg_29_1:FormatText(StoryNameCfg[319].name)

				arg_29_1.leftNameTxt_.text = var_32_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_29_1.leftNameTxt_.transform)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1.leftNameTxt_.text)
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_15 = arg_29_1:GetWordFromCfg(117041007)
				local var_32_16 = arg_29_1:FormatText(var_32_15.content)

				arg_29_1.text_.text = var_32_16

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_17 = 3
				local var_32_18 = utf8.len(var_32_16)
				local var_32_19 = var_32_17 <= 0 and var_32_13 or var_32_13 * (var_32_18 / var_32_17)

				if var_32_19 > 0 and var_32_13 < var_32_19 then
					arg_29_1.talkMaxDuration = var_32_19

					if var_32_19 + var_32_12 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_19 + var_32_12
					end
				end

				arg_29_1.text_.text = var_32_16
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041007", "story_v_out_117041.awb") ~= 0 then
					local var_32_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041007", "story_v_out_117041.awb") / 1000

					if var_32_20 + var_32_12 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_20 + var_32_12
					end

					if var_32_15.prefab_name ~= "" and arg_29_1.actors_[var_32_15.prefab_name] ~= nil then
						local var_32_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_29_1.actors_[var_32_15.prefab_name].transform, "story_v_out_117041", "117041007", "story_v_out_117041.awb")

						arg_29_1:RecordAudio("117041007", var_32_21)
						arg_29_1:RecordAudio("117041007", var_32_21)
					else
						arg_29_1:AudioAction("play", "voice", "story_v_out_117041", "117041007", "story_v_out_117041.awb")
					end

					arg_29_1:RecordHistoryTalkVoice("story_v_out_117041", "117041007", "story_v_out_117041.awb")
				end

				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_22 = math.max(var_32_13, arg_29_1.talkMaxDuration)

			if var_32_12 <= arg_29_1.time_ and arg_29_1.time_ < var_32_12 + var_32_22 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_12) / var_32_22

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_12 + var_32_22 and arg_29_1.time_ < var_32_12 + var_32_22 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play117041008 = function(arg_33_0, arg_33_1)
		arg_33_1.time_ = 0
		arg_33_1.frameCnt_ = 0
		arg_33_1.state_ = "playing"
		arg_33_1.curTalkId_ = 117041008
		arg_33_1.duration_ = 1.6

		local var_33_0 = {
			zh = 1.566,
			ja = 1.6
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
				arg_33_0:Play117041009(arg_33_1)
			end
		end

		function arg_33_1.onSingleLineUpdate_(arg_36_0)
			local var_36_0 = arg_33_1.actors_["1033"]
			local var_36_1 = 0

			if var_36_1 < arg_33_1.time_ and arg_33_1.time_ <= var_36_1 + arg_36_0 and arg_33_1.var_.actorSpriteComps1033 == nil then
				arg_33_1.var_.actorSpriteComps1033 = var_36_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_36_2 = 0.2

			if var_36_1 <= arg_33_1.time_ and arg_33_1.time_ < var_36_1 + var_36_2 then
				local var_36_3 = (arg_33_1.time_ - var_36_1) / var_36_2

				if arg_33_1.var_.actorSpriteComps1033 then
					for iter_36_0, iter_36_1 in pairs(arg_33_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_36_1 then
							local var_36_4 = Mathf.Lerp(iter_36_1.color.r, 1, var_36_3)

							iter_36_1.color = Color.New(var_36_4, var_36_4, var_36_4)
						end
					end
				end
			end

			if arg_33_1.time_ >= var_36_1 + var_36_2 and arg_33_1.time_ < var_36_1 + var_36_2 + arg_36_0 and arg_33_1.var_.actorSpriteComps1033 then
				local var_36_5 = 1

				for iter_36_2, iter_36_3 in pairs(arg_33_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_36_3 then
						iter_36_3.color = Color.New(var_36_5, var_36_5, var_36_5)
					end
				end

				arg_33_1.var_.actorSpriteComps1033 = nil
			end

			local var_36_6 = arg_33_1.actors_["1029"]
			local var_36_7 = 0

			if var_36_7 < arg_33_1.time_ and arg_33_1.time_ <= var_36_7 + arg_36_0 and arg_33_1.var_.actorSpriteComps1029 == nil then
				arg_33_1.var_.actorSpriteComps1029 = var_36_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_36_8 = 0.2

			if var_36_7 <= arg_33_1.time_ and arg_33_1.time_ < var_36_7 + var_36_8 then
				local var_36_9 = (arg_33_1.time_ - var_36_7) / var_36_8

				if arg_33_1.var_.actorSpriteComps1029 then
					for iter_36_4, iter_36_5 in pairs(arg_33_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_36_5 then
							local var_36_10 = Mathf.Lerp(iter_36_5.color.r, 0.5, var_36_9)

							iter_36_5.color = Color.New(var_36_10, var_36_10, var_36_10)
						end
					end
				end
			end

			if arg_33_1.time_ >= var_36_7 + var_36_8 and arg_33_1.time_ < var_36_7 + var_36_8 + arg_36_0 and arg_33_1.var_.actorSpriteComps1029 then
				local var_36_11 = 0.5

				for iter_36_6, iter_36_7 in pairs(arg_33_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_36_7 then
						iter_36_7.color = Color.New(var_36_11, var_36_11, var_36_11)
					end
				end

				arg_33_1.var_.actorSpriteComps1029 = nil
			end

			local var_36_12 = 0
			local var_36_13 = 0.075

			if var_36_12 < arg_33_1.time_ and arg_33_1.time_ <= var_36_12 + arg_36_0 then
				arg_33_1.talkMaxDuration = 0
				arg_33_1.dialogCg_.alpha = 1

				arg_33_1.dialog_:SetActive(true)
				SetActive(arg_33_1.leftNameGo_, true)

				local var_36_14 = arg_33_1:FormatText(StoryNameCfg[236].name)

				arg_33_1.leftNameTxt_.text = var_36_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_33_1.leftNameTxt_.transform)

				arg_33_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_33_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_33_1:RecordName(arg_33_1.leftNameTxt_.text)
				SetActive(arg_33_1.iconTrs_.gameObject, false)
				arg_33_1.callingController_:SetSelectedState("normal")

				local var_36_15 = arg_33_1:GetWordFromCfg(117041008)
				local var_36_16 = arg_33_1:FormatText(var_36_15.content)

				arg_33_1.text_.text = var_36_16

				LuaForUtil.ClearLinePrefixSymbol(arg_33_1.text_)

				local var_36_17 = 3
				local var_36_18 = utf8.len(var_36_16)
				local var_36_19 = var_36_17 <= 0 and var_36_13 or var_36_13 * (var_36_18 / var_36_17)

				if var_36_19 > 0 and var_36_13 < var_36_19 then
					arg_33_1.talkMaxDuration = var_36_19

					if var_36_19 + var_36_12 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_19 + var_36_12
					end
				end

				arg_33_1.text_.text = var_36_16
				arg_33_1.typewritter.percent = 0

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041008", "story_v_out_117041.awb") ~= 0 then
					local var_36_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041008", "story_v_out_117041.awb") / 1000

					if var_36_20 + var_36_12 > arg_33_1.duration_ then
						arg_33_1.duration_ = var_36_20 + var_36_12
					end

					if var_36_15.prefab_name ~= "" and arg_33_1.actors_[var_36_15.prefab_name] ~= nil then
						local var_36_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_33_1.actors_[var_36_15.prefab_name].transform, "story_v_out_117041", "117041008", "story_v_out_117041.awb")

						arg_33_1:RecordAudio("117041008", var_36_21)
						arg_33_1:RecordAudio("117041008", var_36_21)
					else
						arg_33_1:AudioAction("play", "voice", "story_v_out_117041", "117041008", "story_v_out_117041.awb")
					end

					arg_33_1:RecordHistoryTalkVoice("story_v_out_117041", "117041008", "story_v_out_117041.awb")
				end

				arg_33_1:RecordContent(arg_33_1.text_.text)
			end

			local var_36_22 = math.max(var_36_13, arg_33_1.talkMaxDuration)

			if var_36_12 <= arg_33_1.time_ and arg_33_1.time_ < var_36_12 + var_36_22 then
				arg_33_1.typewritter.percent = (arg_33_1.time_ - var_36_12) / var_36_22

				arg_33_1.typewritter:SetDirty()
			end

			if arg_33_1.time_ >= var_36_12 + var_36_22 and arg_33_1.time_ < var_36_12 + var_36_22 + arg_36_0 then
				arg_33_1.typewritter.percent = 1

				arg_33_1.typewritter:SetDirty()
				arg_33_1:ShowNextGo(true)
			end
		end
	end,
	Play117041009 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 117041009
		arg_37_1.duration_ = 2.633

		local var_37_0 = {
			zh = 1.6,
			ja = 2.633
		}
		local var_37_1 = manager.audio:GetLocalizationFlag()

		if var_37_0[var_37_1] ~= nil then
			arg_37_1.duration_ = var_37_0[var_37_1]
		end

		SetActive(arg_37_1.tipsGo_, false)

		function arg_37_1.onSingleLineFinish_()
			arg_37_1.onSingleLineUpdate_ = nil
			arg_37_1.onSingleLineFinish_ = nil
			arg_37_1.state_ = "waiting"
		end

		function arg_37_1.playNext_(arg_39_0)
			if arg_39_0 == 1 then
				arg_37_0:Play117041010(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = arg_37_1.actors_["1033"]
			local var_40_1 = 0

			if var_40_1 < arg_37_1.time_ and arg_37_1.time_ <= var_40_1 + arg_40_0 and arg_37_1.var_.actorSpriteComps1033 == nil then
				arg_37_1.var_.actorSpriteComps1033 = var_40_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_2 = 0.2

			if var_40_1 <= arg_37_1.time_ and arg_37_1.time_ < var_40_1 + var_40_2 then
				local var_40_3 = (arg_37_1.time_ - var_40_1) / var_40_2

				if arg_37_1.var_.actorSpriteComps1033 then
					for iter_40_0, iter_40_1 in pairs(arg_37_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_40_1 then
							local var_40_4 = Mathf.Lerp(iter_40_1.color.r, 0.5, var_40_3)

							iter_40_1.color = Color.New(var_40_4, var_40_4, var_40_4)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_1 + var_40_2 and arg_37_1.time_ < var_40_1 + var_40_2 + arg_40_0 and arg_37_1.var_.actorSpriteComps1033 then
				local var_40_5 = 0.5

				for iter_40_2, iter_40_3 in pairs(arg_37_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_40_3 then
						iter_40_3.color = Color.New(var_40_5, var_40_5, var_40_5)
					end
				end

				arg_37_1.var_.actorSpriteComps1033 = nil
			end

			local var_40_6 = arg_37_1.actors_["1029"]
			local var_40_7 = 0

			if var_40_7 < arg_37_1.time_ and arg_37_1.time_ <= var_40_7 + arg_40_0 and arg_37_1.var_.actorSpriteComps1029 == nil then
				arg_37_1.var_.actorSpriteComps1029 = var_40_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_40_8 = 0.2

			if var_40_7 <= arg_37_1.time_ and arg_37_1.time_ < var_40_7 + var_40_8 then
				local var_40_9 = (arg_37_1.time_ - var_40_7) / var_40_8

				if arg_37_1.var_.actorSpriteComps1029 then
					for iter_40_4, iter_40_5 in pairs(arg_37_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_40_5 then
							local var_40_10 = Mathf.Lerp(iter_40_5.color.r, 1, var_40_9)

							iter_40_5.color = Color.New(var_40_10, var_40_10, var_40_10)
						end
					end
				end
			end

			if arg_37_1.time_ >= var_40_7 + var_40_8 and arg_37_1.time_ < var_40_7 + var_40_8 + arg_40_0 and arg_37_1.var_.actorSpriteComps1029 then
				local var_40_11 = 1

				for iter_40_6, iter_40_7 in pairs(arg_37_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_40_7 then
						iter_40_7.color = Color.New(var_40_11, var_40_11, var_40_11)
					end
				end

				arg_37_1.var_.actorSpriteComps1029 = nil
			end

			local var_40_12 = 0
			local var_40_13 = 0.2

			if var_40_12 < arg_37_1.time_ and arg_37_1.time_ <= var_40_12 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_14 = arg_37_1:FormatText(StoryNameCfg[319].name)

				arg_37_1.leftNameTxt_.text = var_40_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_15 = arg_37_1:GetWordFromCfg(117041009)
				local var_40_16 = arg_37_1:FormatText(var_40_15.content)

				arg_37_1.text_.text = var_40_16

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_17 = 8
				local var_40_18 = utf8.len(var_40_16)
				local var_40_19 = var_40_17 <= 0 and var_40_13 or var_40_13 * (var_40_18 / var_40_17)

				if var_40_19 > 0 and var_40_13 < var_40_19 then
					arg_37_1.talkMaxDuration = var_40_19

					if var_40_19 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_19 + var_40_12
					end
				end

				arg_37_1.text_.text = var_40_16
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041009", "story_v_out_117041.awb") ~= 0 then
					local var_40_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041009", "story_v_out_117041.awb") / 1000

					if var_40_20 + var_40_12 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_20 + var_40_12
					end

					if var_40_15.prefab_name ~= "" and arg_37_1.actors_[var_40_15.prefab_name] ~= nil then
						local var_40_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_15.prefab_name].transform, "story_v_out_117041", "117041009", "story_v_out_117041.awb")

						arg_37_1:RecordAudio("117041009", var_40_21)
						arg_37_1:RecordAudio("117041009", var_40_21)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_117041", "117041009", "story_v_out_117041.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_117041", "117041009", "story_v_out_117041.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_22 = math.max(var_40_13, arg_37_1.talkMaxDuration)

			if var_40_12 <= arg_37_1.time_ and arg_37_1.time_ < var_40_12 + var_40_22 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_12) / var_40_22

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_12 + var_40_22 and arg_37_1.time_ < var_40_12 + var_40_22 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play117041010 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 117041010
		arg_41_1.duration_ = 4.466

		local var_41_0 = {
			zh = 3.966,
			ja = 4.466
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
				arg_41_0:Play117041011(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = arg_41_1.actors_["1033"]
			local var_44_1 = 0

			if var_44_1 < arg_41_1.time_ and arg_41_1.time_ <= var_44_1 + arg_44_0 and arg_41_1.var_.actorSpriteComps1033 == nil then
				arg_41_1.var_.actorSpriteComps1033 = var_44_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_2 = 0.2

			if var_44_1 <= arg_41_1.time_ and arg_41_1.time_ < var_44_1 + var_44_2 then
				local var_44_3 = (arg_41_1.time_ - var_44_1) / var_44_2

				if arg_41_1.var_.actorSpriteComps1033 then
					for iter_44_0, iter_44_1 in pairs(arg_41_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_44_1 then
							local var_44_4 = Mathf.Lerp(iter_44_1.color.r, 1, var_44_3)

							iter_44_1.color = Color.New(var_44_4, var_44_4, var_44_4)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_1 + var_44_2 and arg_41_1.time_ < var_44_1 + var_44_2 + arg_44_0 and arg_41_1.var_.actorSpriteComps1033 then
				local var_44_5 = 1

				for iter_44_2, iter_44_3 in pairs(arg_41_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_44_3 then
						iter_44_3.color = Color.New(var_44_5, var_44_5, var_44_5)
					end
				end

				arg_41_1.var_.actorSpriteComps1033 = nil
			end

			local var_44_6 = arg_41_1.actors_["1029"]
			local var_44_7 = 0

			if var_44_7 < arg_41_1.time_ and arg_41_1.time_ <= var_44_7 + arg_44_0 and arg_41_1.var_.actorSpriteComps1029 == nil then
				arg_41_1.var_.actorSpriteComps1029 = var_44_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_44_8 = 0.2

			if var_44_7 <= arg_41_1.time_ and arg_41_1.time_ < var_44_7 + var_44_8 then
				local var_44_9 = (arg_41_1.time_ - var_44_7) / var_44_8

				if arg_41_1.var_.actorSpriteComps1029 then
					for iter_44_4, iter_44_5 in pairs(arg_41_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_44_5 then
							local var_44_10 = Mathf.Lerp(iter_44_5.color.r, 0.5, var_44_9)

							iter_44_5.color = Color.New(var_44_10, var_44_10, var_44_10)
						end
					end
				end
			end

			if arg_41_1.time_ >= var_44_7 + var_44_8 and arg_41_1.time_ < var_44_7 + var_44_8 + arg_44_0 and arg_41_1.var_.actorSpriteComps1029 then
				local var_44_11 = 0.5

				for iter_44_6, iter_44_7 in pairs(arg_41_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_44_7 then
						iter_44_7.color = Color.New(var_44_11, var_44_11, var_44_11)
					end
				end

				arg_41_1.var_.actorSpriteComps1029 = nil
			end

			local var_44_12 = 0
			local var_44_13 = 0.5

			if var_44_12 < arg_41_1.time_ and arg_41_1.time_ <= var_44_12 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_14 = arg_41_1:FormatText(StoryNameCfg[236].name)

				arg_41_1.leftNameTxt_.text = var_44_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, false)
				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_15 = arg_41_1:GetWordFromCfg(117041010)
				local var_44_16 = arg_41_1:FormatText(var_44_15.content)

				arg_41_1.text_.text = var_44_16

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_17 = 20
				local var_44_18 = utf8.len(var_44_16)
				local var_44_19 = var_44_17 <= 0 and var_44_13 or var_44_13 * (var_44_18 / var_44_17)

				if var_44_19 > 0 and var_44_13 < var_44_19 then
					arg_41_1.talkMaxDuration = var_44_19

					if var_44_19 + var_44_12 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_19 + var_44_12
					end
				end

				arg_41_1.text_.text = var_44_16
				arg_41_1.typewritter.percent = 0

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041010", "story_v_out_117041.awb") ~= 0 then
					local var_44_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041010", "story_v_out_117041.awb") / 1000

					if var_44_20 + var_44_12 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_20 + var_44_12
					end

					if var_44_15.prefab_name ~= "" and arg_41_1.actors_[var_44_15.prefab_name] ~= nil then
						local var_44_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_15.prefab_name].transform, "story_v_out_117041", "117041010", "story_v_out_117041.awb")

						arg_41_1:RecordAudio("117041010", var_44_21)
						arg_41_1:RecordAudio("117041010", var_44_21)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_117041", "117041010", "story_v_out_117041.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_117041", "117041010", "story_v_out_117041.awb")
				end

				arg_41_1:RecordContent(arg_41_1.text_.text)
			end

			local var_44_22 = math.max(var_44_13, arg_41_1.talkMaxDuration)

			if var_44_12 <= arg_41_1.time_ and arg_41_1.time_ < var_44_12 + var_44_22 then
				arg_41_1.typewritter.percent = (arg_41_1.time_ - var_44_12) / var_44_22

				arg_41_1.typewritter:SetDirty()
			end

			if arg_41_1.time_ >= var_44_12 + var_44_22 and arg_41_1.time_ < var_44_12 + var_44_22 + arg_44_0 then
				arg_41_1.typewritter.percent = 1

				arg_41_1.typewritter:SetDirty()
				arg_41_1:ShowNextGo(true)
			end
		end
	end,
	Play117041011 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 117041011
		arg_45_1.duration_ = 11.033

		local var_45_0 = {
			zh = 11.033,
			ja = 7.766
		}
		local var_45_1 = manager.audio:GetLocalizationFlag()

		if var_45_0[var_45_1] ~= nil then
			arg_45_1.duration_ = var_45_0[var_45_1]
		end

		SetActive(arg_45_1.tipsGo_, false)

		function arg_45_1.onSingleLineFinish_()
			arg_45_1.onSingleLineUpdate_ = nil
			arg_45_1.onSingleLineFinish_ = nil
			arg_45_1.state_ = "waiting"
		end

		function arg_45_1.playNext_(arg_47_0)
			if arg_47_0 == 1 then
				arg_45_0:Play117041012(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = arg_45_1.actors_["1033"]
			local var_48_1 = 0

			if var_48_1 < arg_45_1.time_ and arg_45_1.time_ <= var_48_1 + arg_48_0 and arg_45_1.var_.actorSpriteComps1033 == nil then
				arg_45_1.var_.actorSpriteComps1033 = var_48_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_2 = 0.2

			if var_48_1 <= arg_45_1.time_ and arg_45_1.time_ < var_48_1 + var_48_2 then
				local var_48_3 = (arg_45_1.time_ - var_48_1) / var_48_2

				if arg_45_1.var_.actorSpriteComps1033 then
					for iter_48_0, iter_48_1 in pairs(arg_45_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_48_1 then
							local var_48_4 = Mathf.Lerp(iter_48_1.color.r, 0.5, var_48_3)

							iter_48_1.color = Color.New(var_48_4, var_48_4, var_48_4)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_1 + var_48_2 and arg_45_1.time_ < var_48_1 + var_48_2 + arg_48_0 and arg_45_1.var_.actorSpriteComps1033 then
				local var_48_5 = 0.5

				for iter_48_2, iter_48_3 in pairs(arg_45_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_48_3 then
						iter_48_3.color = Color.New(var_48_5, var_48_5, var_48_5)
					end
				end

				arg_45_1.var_.actorSpriteComps1033 = nil
			end

			local var_48_6 = arg_45_1.actors_["1029"]
			local var_48_7 = 0

			if var_48_7 < arg_45_1.time_ and arg_45_1.time_ <= var_48_7 + arg_48_0 and arg_45_1.var_.actorSpriteComps1029 == nil then
				arg_45_1.var_.actorSpriteComps1029 = var_48_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_48_8 = 0.2

			if var_48_7 <= arg_45_1.time_ and arg_45_1.time_ < var_48_7 + var_48_8 then
				local var_48_9 = (arg_45_1.time_ - var_48_7) / var_48_8

				if arg_45_1.var_.actorSpriteComps1029 then
					for iter_48_4, iter_48_5 in pairs(arg_45_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_48_5 then
							local var_48_10 = Mathf.Lerp(iter_48_5.color.r, 1, var_48_9)

							iter_48_5.color = Color.New(var_48_10, var_48_10, var_48_10)
						end
					end
				end
			end

			if arg_45_1.time_ >= var_48_7 + var_48_8 and arg_45_1.time_ < var_48_7 + var_48_8 + arg_48_0 and arg_45_1.var_.actorSpriteComps1029 then
				local var_48_11 = 1

				for iter_48_6, iter_48_7 in pairs(arg_45_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_48_7 then
						iter_48_7.color = Color.New(var_48_11, var_48_11, var_48_11)
					end
				end

				arg_45_1.var_.actorSpriteComps1029 = nil
			end

			local var_48_12 = 0
			local var_48_13 = 0.825

			if var_48_12 < arg_45_1.time_ and arg_45_1.time_ <= var_48_12 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_14 = arg_45_1:FormatText(StoryNameCfg[319].name)

				arg_45_1.leftNameTxt_.text = var_48_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_15 = arg_45_1:GetWordFromCfg(117041011)
				local var_48_16 = arg_45_1:FormatText(var_48_15.content)

				arg_45_1.text_.text = var_48_16

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_17 = 33
				local var_48_18 = utf8.len(var_48_16)
				local var_48_19 = var_48_17 <= 0 and var_48_13 or var_48_13 * (var_48_18 / var_48_17)

				if var_48_19 > 0 and var_48_13 < var_48_19 then
					arg_45_1.talkMaxDuration = var_48_19

					if var_48_19 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_19 + var_48_12
					end
				end

				arg_45_1.text_.text = var_48_16
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041011", "story_v_out_117041.awb") ~= 0 then
					local var_48_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041011", "story_v_out_117041.awb") / 1000

					if var_48_20 + var_48_12 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_20 + var_48_12
					end

					if var_48_15.prefab_name ~= "" and arg_45_1.actors_[var_48_15.prefab_name] ~= nil then
						local var_48_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_15.prefab_name].transform, "story_v_out_117041", "117041011", "story_v_out_117041.awb")

						arg_45_1:RecordAudio("117041011", var_48_21)
						arg_45_1:RecordAudio("117041011", var_48_21)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_117041", "117041011", "story_v_out_117041.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_117041", "117041011", "story_v_out_117041.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_22 = math.max(var_48_13, arg_45_1.talkMaxDuration)

			if var_48_12 <= arg_45_1.time_ and arg_45_1.time_ < var_48_12 + var_48_22 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_12) / var_48_22

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_12 + var_48_22 and arg_45_1.time_ < var_48_12 + var_48_22 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play117041012 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 117041012
		arg_49_1.duration_ = 9.7

		local var_49_0 = {
			zh = 9.066,
			ja = 9.7
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
				arg_49_0:Play117041013(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = arg_49_1.actors_["1033"]
			local var_52_1 = 0

			if var_52_1 < arg_49_1.time_ and arg_49_1.time_ <= var_52_1 + arg_52_0 and arg_49_1.var_.actorSpriteComps1033 == nil then
				arg_49_1.var_.actorSpriteComps1033 = var_52_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_2 = 0.2

			if var_52_1 <= arg_49_1.time_ and arg_49_1.time_ < var_52_1 + var_52_2 then
				local var_52_3 = (arg_49_1.time_ - var_52_1) / var_52_2

				if arg_49_1.var_.actorSpriteComps1033 then
					for iter_52_0, iter_52_1 in pairs(arg_49_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_52_1 then
							local var_52_4 = Mathf.Lerp(iter_52_1.color.r, 1, var_52_3)

							iter_52_1.color = Color.New(var_52_4, var_52_4, var_52_4)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_1 + var_52_2 and arg_49_1.time_ < var_52_1 + var_52_2 + arg_52_0 and arg_49_1.var_.actorSpriteComps1033 then
				local var_52_5 = 1

				for iter_52_2, iter_52_3 in pairs(arg_49_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_52_3 then
						iter_52_3.color = Color.New(var_52_5, var_52_5, var_52_5)
					end
				end

				arg_49_1.var_.actorSpriteComps1033 = nil
			end

			local var_52_6 = arg_49_1.actors_["1029"]
			local var_52_7 = 0

			if var_52_7 < arg_49_1.time_ and arg_49_1.time_ <= var_52_7 + arg_52_0 and arg_49_1.var_.actorSpriteComps1029 == nil then
				arg_49_1.var_.actorSpriteComps1029 = var_52_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_52_8 = 0.2

			if var_52_7 <= arg_49_1.time_ and arg_49_1.time_ < var_52_7 + var_52_8 then
				local var_52_9 = (arg_49_1.time_ - var_52_7) / var_52_8

				if arg_49_1.var_.actorSpriteComps1029 then
					for iter_52_4, iter_52_5 in pairs(arg_49_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_52_5 then
							local var_52_10 = Mathf.Lerp(iter_52_5.color.r, 0.5, var_52_9)

							iter_52_5.color = Color.New(var_52_10, var_52_10, var_52_10)
						end
					end
				end
			end

			if arg_49_1.time_ >= var_52_7 + var_52_8 and arg_49_1.time_ < var_52_7 + var_52_8 + arg_52_0 and arg_49_1.var_.actorSpriteComps1029 then
				local var_52_11 = 0.5

				for iter_52_6, iter_52_7 in pairs(arg_49_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_52_7 then
						iter_52_7.color = Color.New(var_52_11, var_52_11, var_52_11)
					end
				end

				arg_49_1.var_.actorSpriteComps1029 = nil
			end

			local var_52_12 = 0
			local var_52_13 = 1.1

			if var_52_12 < arg_49_1.time_ and arg_49_1.time_ <= var_52_12 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0
				arg_49_1.dialogCg_.alpha = 1

				arg_49_1.dialog_:SetActive(true)
				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_14 = arg_49_1:FormatText(StoryNameCfg[236].name)

				arg_49_1.leftNameTxt_.text = var_52_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_15 = arg_49_1:GetWordFromCfg(117041012)
				local var_52_16 = arg_49_1:FormatText(var_52_15.content)

				arg_49_1.text_.text = var_52_16

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_17 = 44
				local var_52_18 = utf8.len(var_52_16)
				local var_52_19 = var_52_17 <= 0 and var_52_13 or var_52_13 * (var_52_18 / var_52_17)

				if var_52_19 > 0 and var_52_13 < var_52_19 then
					arg_49_1.talkMaxDuration = var_52_19

					if var_52_19 + var_52_12 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_19 + var_52_12
					end
				end

				arg_49_1.text_.text = var_52_16
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041012", "story_v_out_117041.awb") ~= 0 then
					local var_52_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041012", "story_v_out_117041.awb") / 1000

					if var_52_20 + var_52_12 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_20 + var_52_12
					end

					if var_52_15.prefab_name ~= "" and arg_49_1.actors_[var_52_15.prefab_name] ~= nil then
						local var_52_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_15.prefab_name].transform, "story_v_out_117041", "117041012", "story_v_out_117041.awb")

						arg_49_1:RecordAudio("117041012", var_52_21)
						arg_49_1:RecordAudio("117041012", var_52_21)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_117041", "117041012", "story_v_out_117041.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_117041", "117041012", "story_v_out_117041.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_22 = math.max(var_52_13, arg_49_1.talkMaxDuration)

			if var_52_12 <= arg_49_1.time_ and arg_49_1.time_ < var_52_12 + var_52_22 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_12) / var_52_22

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_12 + var_52_22 and arg_49_1.time_ < var_52_12 + var_52_22 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play117041013 = function(arg_53_0, arg_53_1)
		arg_53_1.time_ = 0
		arg_53_1.frameCnt_ = 0
		arg_53_1.state_ = "playing"
		arg_53_1.curTalkId_ = 117041013
		arg_53_1.duration_ = 9.5

		local var_53_0 = {
			zh = 7.066,
			ja = 9.5
		}
		local var_53_1 = manager.audio:GetLocalizationFlag()

		if var_53_0[var_53_1] ~= nil then
			arg_53_1.duration_ = var_53_0[var_53_1]
		end

		SetActive(arg_53_1.tipsGo_, false)

		function arg_53_1.onSingleLineFinish_()
			arg_53_1.onSingleLineUpdate_ = nil
			arg_53_1.onSingleLineFinish_ = nil
			arg_53_1.state_ = "waiting"
		end

		function arg_53_1.playNext_(arg_55_0)
			if arg_55_0 == 1 then
				arg_53_0:Play117041014(arg_53_1)
			end
		end

		function arg_53_1.onSingleLineUpdate_(arg_56_0)
			local var_56_0 = arg_53_1.actors_["1033"]
			local var_56_1 = 0

			if var_56_1 < arg_53_1.time_ and arg_53_1.time_ <= var_56_1 + arg_56_0 and arg_53_1.var_.actorSpriteComps1033 == nil then
				arg_53_1.var_.actorSpriteComps1033 = var_56_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_2 = 0.2

			if var_56_1 <= arg_53_1.time_ and arg_53_1.time_ < var_56_1 + var_56_2 then
				local var_56_3 = (arg_53_1.time_ - var_56_1) / var_56_2

				if arg_53_1.var_.actorSpriteComps1033 then
					for iter_56_0, iter_56_1 in pairs(arg_53_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_56_1 then
							local var_56_4 = Mathf.Lerp(iter_56_1.color.r, 0.5, var_56_3)

							iter_56_1.color = Color.New(var_56_4, var_56_4, var_56_4)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_1 + var_56_2 and arg_53_1.time_ < var_56_1 + var_56_2 + arg_56_0 and arg_53_1.var_.actorSpriteComps1033 then
				local var_56_5 = 0.5

				for iter_56_2, iter_56_3 in pairs(arg_53_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_56_3 then
						iter_56_3.color = Color.New(var_56_5, var_56_5, var_56_5)
					end
				end

				arg_53_1.var_.actorSpriteComps1033 = nil
			end

			local var_56_6 = arg_53_1.actors_["1029"]
			local var_56_7 = 0

			if var_56_7 < arg_53_1.time_ and arg_53_1.time_ <= var_56_7 + arg_56_0 and arg_53_1.var_.actorSpriteComps1029 == nil then
				arg_53_1.var_.actorSpriteComps1029 = var_56_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_56_8 = 0.2

			if var_56_7 <= arg_53_1.time_ and arg_53_1.time_ < var_56_7 + var_56_8 then
				local var_56_9 = (arg_53_1.time_ - var_56_7) / var_56_8

				if arg_53_1.var_.actorSpriteComps1029 then
					for iter_56_4, iter_56_5 in pairs(arg_53_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_56_5 then
							local var_56_10 = Mathf.Lerp(iter_56_5.color.r, 1, var_56_9)

							iter_56_5.color = Color.New(var_56_10, var_56_10, var_56_10)
						end
					end
				end
			end

			if arg_53_1.time_ >= var_56_7 + var_56_8 and arg_53_1.time_ < var_56_7 + var_56_8 + arg_56_0 and arg_53_1.var_.actorSpriteComps1029 then
				local var_56_11 = 1

				for iter_56_6, iter_56_7 in pairs(arg_53_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_56_7 then
						iter_56_7.color = Color.New(var_56_11, var_56_11, var_56_11)
					end
				end

				arg_53_1.var_.actorSpriteComps1029 = nil
			end

			local var_56_12 = 0
			local var_56_13 = 0.775

			if var_56_12 < arg_53_1.time_ and arg_53_1.time_ <= var_56_12 + arg_56_0 then
				arg_53_1.talkMaxDuration = 0
				arg_53_1.dialogCg_.alpha = 1

				arg_53_1.dialog_:SetActive(true)
				SetActive(arg_53_1.leftNameGo_, true)

				local var_56_14 = arg_53_1:FormatText(StoryNameCfg[319].name)

				arg_53_1.leftNameTxt_.text = var_56_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_53_1.leftNameTxt_.transform)

				arg_53_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_53_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_53_1:RecordName(arg_53_1.leftNameTxt_.text)
				SetActive(arg_53_1.iconTrs_.gameObject, false)
				arg_53_1.callingController_:SetSelectedState("normal")

				local var_56_15 = arg_53_1:GetWordFromCfg(117041013)
				local var_56_16 = arg_53_1:FormatText(var_56_15.content)

				arg_53_1.text_.text = var_56_16

				LuaForUtil.ClearLinePrefixSymbol(arg_53_1.text_)

				local var_56_17 = 32
				local var_56_18 = utf8.len(var_56_16)
				local var_56_19 = var_56_17 <= 0 and var_56_13 or var_56_13 * (var_56_18 / var_56_17)

				if var_56_19 > 0 and var_56_13 < var_56_19 then
					arg_53_1.talkMaxDuration = var_56_19

					if var_56_19 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_19 + var_56_12
					end
				end

				arg_53_1.text_.text = var_56_16
				arg_53_1.typewritter.percent = 0

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041013", "story_v_out_117041.awb") ~= 0 then
					local var_56_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041013", "story_v_out_117041.awb") / 1000

					if var_56_20 + var_56_12 > arg_53_1.duration_ then
						arg_53_1.duration_ = var_56_20 + var_56_12
					end

					if var_56_15.prefab_name ~= "" and arg_53_1.actors_[var_56_15.prefab_name] ~= nil then
						local var_56_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_53_1.actors_[var_56_15.prefab_name].transform, "story_v_out_117041", "117041013", "story_v_out_117041.awb")

						arg_53_1:RecordAudio("117041013", var_56_21)
						arg_53_1:RecordAudio("117041013", var_56_21)
					else
						arg_53_1:AudioAction("play", "voice", "story_v_out_117041", "117041013", "story_v_out_117041.awb")
					end

					arg_53_1:RecordHistoryTalkVoice("story_v_out_117041", "117041013", "story_v_out_117041.awb")
				end

				arg_53_1:RecordContent(arg_53_1.text_.text)
			end

			local var_56_22 = math.max(var_56_13, arg_53_1.talkMaxDuration)

			if var_56_12 <= arg_53_1.time_ and arg_53_1.time_ < var_56_12 + var_56_22 then
				arg_53_1.typewritter.percent = (arg_53_1.time_ - var_56_12) / var_56_22

				arg_53_1.typewritter:SetDirty()
			end

			if arg_53_1.time_ >= var_56_12 + var_56_22 and arg_53_1.time_ < var_56_12 + var_56_22 + arg_56_0 then
				arg_53_1.typewritter.percent = 1

				arg_53_1.typewritter:SetDirty()
				arg_53_1:ShowNextGo(true)
			end
		end
	end,
	Play117041014 = function(arg_57_0, arg_57_1)
		arg_57_1.time_ = 0
		arg_57_1.frameCnt_ = 0
		arg_57_1.state_ = "playing"
		arg_57_1.curTalkId_ = 117041014
		arg_57_1.duration_ = 2.133

		local var_57_0 = {
			zh = 1.166,
			ja = 2.133
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
				arg_57_0:Play117041015(arg_57_1)
			end
		end

		function arg_57_1.onSingleLineUpdate_(arg_60_0)
			local var_60_0 = arg_57_1.actors_["1033"]
			local var_60_1 = 0

			if var_60_1 < arg_57_1.time_ and arg_57_1.time_ <= var_60_1 + arg_60_0 and arg_57_1.var_.actorSpriteComps1033 == nil then
				arg_57_1.var_.actorSpriteComps1033 = var_60_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_2 = 0.2

			if var_60_1 <= arg_57_1.time_ and arg_57_1.time_ < var_60_1 + var_60_2 then
				local var_60_3 = (arg_57_1.time_ - var_60_1) / var_60_2

				if arg_57_1.var_.actorSpriteComps1033 then
					for iter_60_0, iter_60_1 in pairs(arg_57_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_60_1 then
							local var_60_4 = Mathf.Lerp(iter_60_1.color.r, 1, var_60_3)

							iter_60_1.color = Color.New(var_60_4, var_60_4, var_60_4)
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_1 + var_60_2 and arg_57_1.time_ < var_60_1 + var_60_2 + arg_60_0 and arg_57_1.var_.actorSpriteComps1033 then
				local var_60_5 = 1

				for iter_60_2, iter_60_3 in pairs(arg_57_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_60_3 then
						iter_60_3.color = Color.New(var_60_5, var_60_5, var_60_5)
					end
				end

				arg_57_1.var_.actorSpriteComps1033 = nil
			end

			local var_60_6 = arg_57_1.actors_["1029"]
			local var_60_7 = 0

			if var_60_7 < arg_57_1.time_ and arg_57_1.time_ <= var_60_7 + arg_60_0 and arg_57_1.var_.actorSpriteComps1029 == nil then
				arg_57_1.var_.actorSpriteComps1029 = var_60_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_60_8 = 0.2

			if var_60_7 <= arg_57_1.time_ and arg_57_1.time_ < var_60_7 + var_60_8 then
				local var_60_9 = (arg_57_1.time_ - var_60_7) / var_60_8

				if arg_57_1.var_.actorSpriteComps1029 then
					for iter_60_4, iter_60_5 in pairs(arg_57_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_60_5 then
							local var_60_10 = Mathf.Lerp(iter_60_5.color.r, 0.5, var_60_9)

							iter_60_5.color = Color.New(var_60_10, var_60_10, var_60_10)
						end
					end
				end
			end

			if arg_57_1.time_ >= var_60_7 + var_60_8 and arg_57_1.time_ < var_60_7 + var_60_8 + arg_60_0 and arg_57_1.var_.actorSpriteComps1029 then
				local var_60_11 = 0.5

				for iter_60_6, iter_60_7 in pairs(arg_57_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_60_7 then
						iter_60_7.color = Color.New(var_60_11, var_60_11, var_60_11)
					end
				end

				arg_57_1.var_.actorSpriteComps1029 = nil
			end

			local var_60_12 = 0
			local var_60_13 = 0.1

			if var_60_12 < arg_57_1.time_ and arg_57_1.time_ <= var_60_12 + arg_60_0 then
				arg_57_1.talkMaxDuration = 0
				arg_57_1.dialogCg_.alpha = 1

				arg_57_1.dialog_:SetActive(true)
				SetActive(arg_57_1.leftNameGo_, true)

				local var_60_14 = arg_57_1:FormatText(StoryNameCfg[236].name)

				arg_57_1.leftNameTxt_.text = var_60_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_57_1.leftNameTxt_.transform)

				arg_57_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_57_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_57_1:RecordName(arg_57_1.leftNameTxt_.text)
				SetActive(arg_57_1.iconTrs_.gameObject, false)
				arg_57_1.callingController_:SetSelectedState("normal")

				local var_60_15 = arg_57_1:GetWordFromCfg(117041014)
				local var_60_16 = arg_57_1:FormatText(var_60_15.content)

				arg_57_1.text_.text = var_60_16

				LuaForUtil.ClearLinePrefixSymbol(arg_57_1.text_)

				local var_60_17 = 4
				local var_60_18 = utf8.len(var_60_16)
				local var_60_19 = var_60_17 <= 0 and var_60_13 or var_60_13 * (var_60_18 / var_60_17)

				if var_60_19 > 0 and var_60_13 < var_60_19 then
					arg_57_1.talkMaxDuration = var_60_19

					if var_60_19 + var_60_12 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_19 + var_60_12
					end
				end

				arg_57_1.text_.text = var_60_16
				arg_57_1.typewritter.percent = 0

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041014", "story_v_out_117041.awb") ~= 0 then
					local var_60_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041014", "story_v_out_117041.awb") / 1000

					if var_60_20 + var_60_12 > arg_57_1.duration_ then
						arg_57_1.duration_ = var_60_20 + var_60_12
					end

					if var_60_15.prefab_name ~= "" and arg_57_1.actors_[var_60_15.prefab_name] ~= nil then
						local var_60_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_57_1.actors_[var_60_15.prefab_name].transform, "story_v_out_117041", "117041014", "story_v_out_117041.awb")

						arg_57_1:RecordAudio("117041014", var_60_21)
						arg_57_1:RecordAudio("117041014", var_60_21)
					else
						arg_57_1:AudioAction("play", "voice", "story_v_out_117041", "117041014", "story_v_out_117041.awb")
					end

					arg_57_1:RecordHistoryTalkVoice("story_v_out_117041", "117041014", "story_v_out_117041.awb")
				end

				arg_57_1:RecordContent(arg_57_1.text_.text)
			end

			local var_60_22 = math.max(var_60_13, arg_57_1.talkMaxDuration)

			if var_60_12 <= arg_57_1.time_ and arg_57_1.time_ < var_60_12 + var_60_22 then
				arg_57_1.typewritter.percent = (arg_57_1.time_ - var_60_12) / var_60_22

				arg_57_1.typewritter:SetDirty()
			end

			if arg_57_1.time_ >= var_60_12 + var_60_22 and arg_57_1.time_ < var_60_12 + var_60_22 + arg_60_0 then
				arg_57_1.typewritter.percent = 1

				arg_57_1.typewritter:SetDirty()
				arg_57_1:ShowNextGo(true)
			end
		end
	end,
	Play117041015 = function(arg_61_0, arg_61_1)
		arg_61_1.time_ = 0
		arg_61_1.frameCnt_ = 0
		arg_61_1.state_ = "playing"
		arg_61_1.curTalkId_ = 117041015
		arg_61_1.duration_ = 11.866

		local var_61_0 = {
			zh = 11.4,
			ja = 11.866
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
				arg_61_0:Play117041016(arg_61_1)
			end
		end

		function arg_61_1.onSingleLineUpdate_(arg_64_0)
			local var_64_0 = arg_61_1.actors_["1033"]
			local var_64_1 = 0

			if var_64_1 < arg_61_1.time_ and arg_61_1.time_ <= var_64_1 + arg_64_0 and arg_61_1.var_.actorSpriteComps1033 == nil then
				arg_61_1.var_.actorSpriteComps1033 = var_64_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_2 = 0.2

			if var_64_1 <= arg_61_1.time_ and arg_61_1.time_ < var_64_1 + var_64_2 then
				local var_64_3 = (arg_61_1.time_ - var_64_1) / var_64_2

				if arg_61_1.var_.actorSpriteComps1033 then
					for iter_64_0, iter_64_1 in pairs(arg_61_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_64_1 then
							local var_64_4 = Mathf.Lerp(iter_64_1.color.r, 0.5, var_64_3)

							iter_64_1.color = Color.New(var_64_4, var_64_4, var_64_4)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_1 + var_64_2 and arg_61_1.time_ < var_64_1 + var_64_2 + arg_64_0 and arg_61_1.var_.actorSpriteComps1033 then
				local var_64_5 = 0.5

				for iter_64_2, iter_64_3 in pairs(arg_61_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_64_3 then
						iter_64_3.color = Color.New(var_64_5, var_64_5, var_64_5)
					end
				end

				arg_61_1.var_.actorSpriteComps1033 = nil
			end

			local var_64_6 = arg_61_1.actors_["1029"]
			local var_64_7 = 0

			if var_64_7 < arg_61_1.time_ and arg_61_1.time_ <= var_64_7 + arg_64_0 and arg_61_1.var_.actorSpriteComps1029 == nil then
				arg_61_1.var_.actorSpriteComps1029 = var_64_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_64_8 = 0.2

			if var_64_7 <= arg_61_1.time_ and arg_61_1.time_ < var_64_7 + var_64_8 then
				local var_64_9 = (arg_61_1.time_ - var_64_7) / var_64_8

				if arg_61_1.var_.actorSpriteComps1029 then
					for iter_64_4, iter_64_5 in pairs(arg_61_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_64_5 then
							local var_64_10 = Mathf.Lerp(iter_64_5.color.r, 1, var_64_9)

							iter_64_5.color = Color.New(var_64_10, var_64_10, var_64_10)
						end
					end
				end
			end

			if arg_61_1.time_ >= var_64_7 + var_64_8 and arg_61_1.time_ < var_64_7 + var_64_8 + arg_64_0 and arg_61_1.var_.actorSpriteComps1029 then
				local var_64_11 = 1

				for iter_64_6, iter_64_7 in pairs(arg_61_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_64_7 then
						iter_64_7.color = Color.New(var_64_11, var_64_11, var_64_11)
					end
				end

				arg_61_1.var_.actorSpriteComps1029 = nil
			end

			local var_64_12 = 0
			local var_64_13 = 1.525

			if var_64_12 < arg_61_1.time_ and arg_61_1.time_ <= var_64_12 + arg_64_0 then
				arg_61_1.talkMaxDuration = 0
				arg_61_1.dialogCg_.alpha = 1

				arg_61_1.dialog_:SetActive(true)
				SetActive(arg_61_1.leftNameGo_, true)

				local var_64_14 = arg_61_1:FormatText(StoryNameCfg[319].name)

				arg_61_1.leftNameTxt_.text = var_64_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_61_1.leftNameTxt_.transform)

				arg_61_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_61_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_61_1:RecordName(arg_61_1.leftNameTxt_.text)
				SetActive(arg_61_1.iconTrs_.gameObject, false)
				arg_61_1.callingController_:SetSelectedState("normal")

				local var_64_15 = arg_61_1:GetWordFromCfg(117041015)
				local var_64_16 = arg_61_1:FormatText(var_64_15.content)

				arg_61_1.text_.text = var_64_16

				LuaForUtil.ClearLinePrefixSymbol(arg_61_1.text_)

				local var_64_17 = 61
				local var_64_18 = utf8.len(var_64_16)
				local var_64_19 = var_64_17 <= 0 and var_64_13 or var_64_13 * (var_64_18 / var_64_17)

				if var_64_19 > 0 and var_64_13 < var_64_19 then
					arg_61_1.talkMaxDuration = var_64_19

					if var_64_19 + var_64_12 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_19 + var_64_12
					end
				end

				arg_61_1.text_.text = var_64_16
				arg_61_1.typewritter.percent = 0

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041015", "story_v_out_117041.awb") ~= 0 then
					local var_64_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041015", "story_v_out_117041.awb") / 1000

					if var_64_20 + var_64_12 > arg_61_1.duration_ then
						arg_61_1.duration_ = var_64_20 + var_64_12
					end

					if var_64_15.prefab_name ~= "" and arg_61_1.actors_[var_64_15.prefab_name] ~= nil then
						local var_64_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_61_1.actors_[var_64_15.prefab_name].transform, "story_v_out_117041", "117041015", "story_v_out_117041.awb")

						arg_61_1:RecordAudio("117041015", var_64_21)
						arg_61_1:RecordAudio("117041015", var_64_21)
					else
						arg_61_1:AudioAction("play", "voice", "story_v_out_117041", "117041015", "story_v_out_117041.awb")
					end

					arg_61_1:RecordHistoryTalkVoice("story_v_out_117041", "117041015", "story_v_out_117041.awb")
				end

				arg_61_1:RecordContent(arg_61_1.text_.text)
			end

			local var_64_22 = math.max(var_64_13, arg_61_1.talkMaxDuration)

			if var_64_12 <= arg_61_1.time_ and arg_61_1.time_ < var_64_12 + var_64_22 then
				arg_61_1.typewritter.percent = (arg_61_1.time_ - var_64_12) / var_64_22

				arg_61_1.typewritter:SetDirty()
			end

			if arg_61_1.time_ >= var_64_12 + var_64_22 and arg_61_1.time_ < var_64_12 + var_64_22 + arg_64_0 then
				arg_61_1.typewritter.percent = 1

				arg_61_1.typewritter:SetDirty()
				arg_61_1:ShowNextGo(true)
			end
		end
	end,
	Play117041016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 117041016
		arg_65_1.duration_ = 12.266

		local var_65_0 = {
			zh = 8.3,
			ja = 12.266
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
				arg_65_0:Play117041017(arg_65_1)
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

				local var_68_2 = arg_65_1:FormatText(StoryNameCfg[319].name)

				arg_65_1.leftNameTxt_.text = var_68_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_65_1.leftNameTxt_.transform)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1.leftNameTxt_.text)
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_3 = arg_65_1:GetWordFromCfg(117041016)
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041016", "story_v_out_117041.awb") ~= 0 then
					local var_68_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041016", "story_v_out_117041.awb") / 1000

					if var_68_8 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_8 + var_68_0
					end

					if var_68_3.prefab_name ~= "" and arg_65_1.actors_[var_68_3.prefab_name] ~= nil then
						local var_68_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_65_1.actors_[var_68_3.prefab_name].transform, "story_v_out_117041", "117041016", "story_v_out_117041.awb")

						arg_65_1:RecordAudio("117041016", var_68_9)
						arg_65_1:RecordAudio("117041016", var_68_9)
					else
						arg_65_1:AudioAction("play", "voice", "story_v_out_117041", "117041016", "story_v_out_117041.awb")
					end

					arg_65_1:RecordHistoryTalkVoice("story_v_out_117041", "117041016", "story_v_out_117041.awb")
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
	Play117041017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 117041017
		arg_69_1.duration_ = 7.766

		local var_69_0 = {
			zh = 7.766,
			ja = 5.2
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
				arg_69_0:Play117041018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1033"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.actorSpriteComps1033 == nil then
				arg_69_1.var_.actorSpriteComps1033 = var_72_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_2 = 0.2

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.actorSpriteComps1033 then
					for iter_72_0, iter_72_1 in pairs(arg_69_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_72_1 then
							local var_72_4 = Mathf.Lerp(iter_72_1.color.r, 1, var_72_3)

							iter_72_1.color = Color.New(var_72_4, var_72_4, var_72_4)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.actorSpriteComps1033 then
				local var_72_5 = 1

				for iter_72_2, iter_72_3 in pairs(arg_69_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_72_3 then
						iter_72_3.color = Color.New(var_72_5, var_72_5, var_72_5)
					end
				end

				arg_69_1.var_.actorSpriteComps1033 = nil
			end

			local var_72_6 = arg_69_1.actors_["1029"]
			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 and arg_69_1.var_.actorSpriteComps1029 == nil then
				arg_69_1.var_.actorSpriteComps1029 = var_72_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_72_8 = 0.2

			if var_72_7 <= arg_69_1.time_ and arg_69_1.time_ < var_72_7 + var_72_8 then
				local var_72_9 = (arg_69_1.time_ - var_72_7) / var_72_8

				if arg_69_1.var_.actorSpriteComps1029 then
					for iter_72_4, iter_72_5 in pairs(arg_69_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_72_5 then
							local var_72_10 = Mathf.Lerp(iter_72_5.color.r, 0.5, var_72_9)

							iter_72_5.color = Color.New(var_72_10, var_72_10, var_72_10)
						end
					end
				end
			end

			if arg_69_1.time_ >= var_72_7 + var_72_8 and arg_69_1.time_ < var_72_7 + var_72_8 + arg_72_0 and arg_69_1.var_.actorSpriteComps1029 then
				local var_72_11 = 0.5

				for iter_72_6, iter_72_7 in pairs(arg_69_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_72_7 then
						iter_72_7.color = Color.New(var_72_11, var_72_11, var_72_11)
					end
				end

				arg_69_1.var_.actorSpriteComps1029 = nil
			end

			local var_72_12 = 0
			local var_72_13 = 0.875

			if var_72_12 < arg_69_1.time_ and arg_69_1.time_ <= var_72_12 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_14 = arg_69_1:FormatText(StoryNameCfg[236].name)

				arg_69_1.leftNameTxt_.text = var_72_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_15 = arg_69_1:GetWordFromCfg(117041017)
				local var_72_16 = arg_69_1:FormatText(var_72_15.content)

				arg_69_1.text_.text = var_72_16

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_17 = 35
				local var_72_18 = utf8.len(var_72_16)
				local var_72_19 = var_72_17 <= 0 and var_72_13 or var_72_13 * (var_72_18 / var_72_17)

				if var_72_19 > 0 and var_72_13 < var_72_19 then
					arg_69_1.talkMaxDuration = var_72_19

					if var_72_19 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_19 + var_72_12
					end
				end

				arg_69_1.text_.text = var_72_16
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041017", "story_v_out_117041.awb") ~= 0 then
					local var_72_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041017", "story_v_out_117041.awb") / 1000

					if var_72_20 + var_72_12 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_20 + var_72_12
					end

					if var_72_15.prefab_name ~= "" and arg_69_1.actors_[var_72_15.prefab_name] ~= nil then
						local var_72_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_15.prefab_name].transform, "story_v_out_117041", "117041017", "story_v_out_117041.awb")

						arg_69_1:RecordAudio("117041017", var_72_21)
						arg_69_1:RecordAudio("117041017", var_72_21)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_117041", "117041017", "story_v_out_117041.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_117041", "117041017", "story_v_out_117041.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_22 = math.max(var_72_13, arg_69_1.talkMaxDuration)

			if var_72_12 <= arg_69_1.time_ and arg_69_1.time_ < var_72_12 + var_72_22 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_12) / var_72_22

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_12 + var_72_22 and arg_69_1.time_ < var_72_12 + var_72_22 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play117041018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 117041018
		arg_73_1.duration_ = 7.866

		local var_73_0 = {
			zh = 7.866,
			ja = 7.066
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
				arg_73_0:Play117041019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = arg_73_1.actors_["1033"]
			local var_76_1 = 0

			if var_76_1 < arg_73_1.time_ and arg_73_1.time_ <= var_76_1 + arg_76_0 and arg_73_1.var_.actorSpriteComps1033 == nil then
				arg_73_1.var_.actorSpriteComps1033 = var_76_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_2 = 0.2

			if var_76_1 <= arg_73_1.time_ and arg_73_1.time_ < var_76_1 + var_76_2 then
				local var_76_3 = (arg_73_1.time_ - var_76_1) / var_76_2

				if arg_73_1.var_.actorSpriteComps1033 then
					for iter_76_0, iter_76_1 in pairs(arg_73_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_76_1 then
							local var_76_4 = Mathf.Lerp(iter_76_1.color.r, 0.5, var_76_3)

							iter_76_1.color = Color.New(var_76_4, var_76_4, var_76_4)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_1 + var_76_2 and arg_73_1.time_ < var_76_1 + var_76_2 + arg_76_0 and arg_73_1.var_.actorSpriteComps1033 then
				local var_76_5 = 0.5

				for iter_76_2, iter_76_3 in pairs(arg_73_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_76_3 then
						iter_76_3.color = Color.New(var_76_5, var_76_5, var_76_5)
					end
				end

				arg_73_1.var_.actorSpriteComps1033 = nil
			end

			local var_76_6 = arg_73_1.actors_["1029"]
			local var_76_7 = 0

			if var_76_7 < arg_73_1.time_ and arg_73_1.time_ <= var_76_7 + arg_76_0 and arg_73_1.var_.actorSpriteComps1029 == nil then
				arg_73_1.var_.actorSpriteComps1029 = var_76_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_76_8 = 0.2

			if var_76_7 <= arg_73_1.time_ and arg_73_1.time_ < var_76_7 + var_76_8 then
				local var_76_9 = (arg_73_1.time_ - var_76_7) / var_76_8

				if arg_73_1.var_.actorSpriteComps1029 then
					for iter_76_4, iter_76_5 in pairs(arg_73_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_76_5 then
							local var_76_10 = Mathf.Lerp(iter_76_5.color.r, 1, var_76_9)

							iter_76_5.color = Color.New(var_76_10, var_76_10, var_76_10)
						end
					end
				end
			end

			if arg_73_1.time_ >= var_76_7 + var_76_8 and arg_73_1.time_ < var_76_7 + var_76_8 + arg_76_0 and arg_73_1.var_.actorSpriteComps1029 then
				local var_76_11 = 1

				for iter_76_6, iter_76_7 in pairs(arg_73_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_76_7 then
						iter_76_7.color = Color.New(var_76_11, var_76_11, var_76_11)
					end
				end

				arg_73_1.var_.actorSpriteComps1029 = nil
			end

			local var_76_12 = 0
			local var_76_13 = 0.8

			if var_76_12 < arg_73_1.time_ and arg_73_1.time_ <= var_76_12 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_14 = arg_73_1:FormatText(StoryNameCfg[319].name)

				arg_73_1.leftNameTxt_.text = var_76_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_15 = arg_73_1:GetWordFromCfg(117041018)
				local var_76_16 = arg_73_1:FormatText(var_76_15.content)

				arg_73_1.text_.text = var_76_16

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_17 = 32
				local var_76_18 = utf8.len(var_76_16)
				local var_76_19 = var_76_17 <= 0 and var_76_13 or var_76_13 * (var_76_18 / var_76_17)

				if var_76_19 > 0 and var_76_13 < var_76_19 then
					arg_73_1.talkMaxDuration = var_76_19

					if var_76_19 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_19 + var_76_12
					end
				end

				arg_73_1.text_.text = var_76_16
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041018", "story_v_out_117041.awb") ~= 0 then
					local var_76_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041018", "story_v_out_117041.awb") / 1000

					if var_76_20 + var_76_12 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_20 + var_76_12
					end

					if var_76_15.prefab_name ~= "" and arg_73_1.actors_[var_76_15.prefab_name] ~= nil then
						local var_76_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_15.prefab_name].transform, "story_v_out_117041", "117041018", "story_v_out_117041.awb")

						arg_73_1:RecordAudio("117041018", var_76_21)
						arg_73_1:RecordAudio("117041018", var_76_21)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_117041", "117041018", "story_v_out_117041.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_117041", "117041018", "story_v_out_117041.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_22 = math.max(var_76_13, arg_73_1.talkMaxDuration)

			if var_76_12 <= arg_73_1.time_ and arg_73_1.time_ < var_76_12 + var_76_22 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_12) / var_76_22

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_12 + var_76_22 and arg_73_1.time_ < var_76_12 + var_76_22 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play117041019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 117041019
		arg_77_1.duration_ = 8.266

		local var_77_0 = {
			zh = 3.666,
			ja = 8.266
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
				arg_77_0:Play117041020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1033"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.actorSpriteComps1033 == nil then
				arg_77_1.var_.actorSpriteComps1033 = var_80_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_2 = 0.2

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.actorSpriteComps1033 then
					for iter_80_0, iter_80_1 in pairs(arg_77_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_80_1 then
							local var_80_4 = Mathf.Lerp(iter_80_1.color.r, 1, var_80_3)

							iter_80_1.color = Color.New(var_80_4, var_80_4, var_80_4)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.actorSpriteComps1033 then
				local var_80_5 = 1

				for iter_80_2, iter_80_3 in pairs(arg_77_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_80_3 then
						iter_80_3.color = Color.New(var_80_5, var_80_5, var_80_5)
					end
				end

				arg_77_1.var_.actorSpriteComps1033 = nil
			end

			local var_80_6 = arg_77_1.actors_["1029"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.actorSpriteComps1029 == nil then
				arg_77_1.var_.actorSpriteComps1029 = var_80_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_80_8 = 0.2

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.actorSpriteComps1029 then
					for iter_80_4, iter_80_5 in pairs(arg_77_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_80_5 then
							local var_80_10 = Mathf.Lerp(iter_80_5.color.r, 0.5, var_80_9)

							iter_80_5.color = Color.New(var_80_10, var_80_10, var_80_10)
						end
					end
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.actorSpriteComps1029 then
				local var_80_11 = 0.5

				for iter_80_6, iter_80_7 in pairs(arg_77_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_80_7 then
						iter_80_7.color = Color.New(var_80_11, var_80_11, var_80_11)
					end
				end

				arg_77_1.var_.actorSpriteComps1029 = nil
			end

			local var_80_12 = 0
			local var_80_13 = 0.325

			if var_80_12 < arg_77_1.time_ and arg_77_1.time_ <= var_80_12 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_14 = arg_77_1:FormatText(StoryNameCfg[236].name)

				arg_77_1.leftNameTxt_.text = var_80_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_15 = arg_77_1:GetWordFromCfg(117041019)
				local var_80_16 = arg_77_1:FormatText(var_80_15.content)

				arg_77_1.text_.text = var_80_16

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_17 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041019", "story_v_out_117041.awb") ~= 0 then
					local var_80_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041019", "story_v_out_117041.awb") / 1000

					if var_80_20 + var_80_12 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_20 + var_80_12
					end

					if var_80_15.prefab_name ~= "" and arg_77_1.actors_[var_80_15.prefab_name] ~= nil then
						local var_80_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_15.prefab_name].transform, "story_v_out_117041", "117041019", "story_v_out_117041.awb")

						arg_77_1:RecordAudio("117041019", var_80_21)
						arg_77_1:RecordAudio("117041019", var_80_21)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_117041", "117041019", "story_v_out_117041.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_117041", "117041019", "story_v_out_117041.awb")
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
	Play117041020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 117041020
		arg_81_1.duration_ = 5.9

		local var_81_0 = {
			zh = 2.566,
			ja = 5.9
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
				arg_81_0:Play117041021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1033"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.actorSpriteComps1033 == nil then
				arg_81_1.var_.actorSpriteComps1033 = var_84_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_2 = 0.2

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.actorSpriteComps1033 then
					for iter_84_0, iter_84_1 in pairs(arg_81_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_84_1 then
							local var_84_4 = Mathf.Lerp(iter_84_1.color.r, 0.5, var_84_3)

							iter_84_1.color = Color.New(var_84_4, var_84_4, var_84_4)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.actorSpriteComps1033 then
				local var_84_5 = 0.5

				for iter_84_2, iter_84_3 in pairs(arg_81_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_84_3 then
						iter_84_3.color = Color.New(var_84_5, var_84_5, var_84_5)
					end
				end

				arg_81_1.var_.actorSpriteComps1033 = nil
			end

			local var_84_6 = arg_81_1.actors_["1029"]
			local var_84_7 = 0

			if var_84_7 < arg_81_1.time_ and arg_81_1.time_ <= var_84_7 + arg_84_0 and arg_81_1.var_.actorSpriteComps1029 == nil then
				arg_81_1.var_.actorSpriteComps1029 = var_84_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_84_8 = 0.2

			if var_84_7 <= arg_81_1.time_ and arg_81_1.time_ < var_84_7 + var_84_8 then
				local var_84_9 = (arg_81_1.time_ - var_84_7) / var_84_8

				if arg_81_1.var_.actorSpriteComps1029 then
					for iter_84_4, iter_84_5 in pairs(arg_81_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_84_5 then
							local var_84_10 = Mathf.Lerp(iter_84_5.color.r, 1, var_84_9)

							iter_84_5.color = Color.New(var_84_10, var_84_10, var_84_10)
						end
					end
				end
			end

			if arg_81_1.time_ >= var_84_7 + var_84_8 and arg_81_1.time_ < var_84_7 + var_84_8 + arg_84_0 and arg_81_1.var_.actorSpriteComps1029 then
				local var_84_11 = 1

				for iter_84_6, iter_84_7 in pairs(arg_81_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_84_7 then
						iter_84_7.color = Color.New(var_84_11, var_84_11, var_84_11)
					end
				end

				arg_81_1.var_.actorSpriteComps1029 = nil
			end

			local var_84_12 = 0
			local var_84_13 = 0.25

			if var_84_12 < arg_81_1.time_ and arg_81_1.time_ <= var_84_12 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_14 = arg_81_1:FormatText(StoryNameCfg[319].name)

				arg_81_1.leftNameTxt_.text = var_84_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_15 = arg_81_1:GetWordFromCfg(117041020)
				local var_84_16 = arg_81_1:FormatText(var_84_15.content)

				arg_81_1.text_.text = var_84_16

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_17 = 10
				local var_84_18 = utf8.len(var_84_16)
				local var_84_19 = var_84_17 <= 0 and var_84_13 or var_84_13 * (var_84_18 / var_84_17)

				if var_84_19 > 0 and var_84_13 < var_84_19 then
					arg_81_1.talkMaxDuration = var_84_19

					if var_84_19 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_19 + var_84_12
					end
				end

				arg_81_1.text_.text = var_84_16
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041020", "story_v_out_117041.awb") ~= 0 then
					local var_84_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041020", "story_v_out_117041.awb") / 1000

					if var_84_20 + var_84_12 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_20 + var_84_12
					end

					if var_84_15.prefab_name ~= "" and arg_81_1.actors_[var_84_15.prefab_name] ~= nil then
						local var_84_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_15.prefab_name].transform, "story_v_out_117041", "117041020", "story_v_out_117041.awb")

						arg_81_1:RecordAudio("117041020", var_84_21)
						arg_81_1:RecordAudio("117041020", var_84_21)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_117041", "117041020", "story_v_out_117041.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_117041", "117041020", "story_v_out_117041.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_22 = math.max(var_84_13, arg_81_1.talkMaxDuration)

			if var_84_12 <= arg_81_1.time_ and arg_81_1.time_ < var_84_12 + var_84_22 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_12) / var_84_22

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_12 + var_84_22 and arg_81_1.time_ < var_84_12 + var_84_22 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play117041021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 117041021
		arg_85_1.duration_ = 1.566

		local var_85_0 = {
			zh = 1,
			ja = 1.566
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
				arg_85_0:Play117041022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = arg_85_1.actors_["1033"]
			local var_88_1 = 0

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 and arg_85_1.var_.actorSpriteComps1033 == nil then
				arg_85_1.var_.actorSpriteComps1033 = var_88_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_2 = 0.2

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_2 then
				local var_88_3 = (arg_85_1.time_ - var_88_1) / var_88_2

				if arg_85_1.var_.actorSpriteComps1033 then
					for iter_88_0, iter_88_1 in pairs(arg_85_1.var_.actorSpriteComps1033:ToTable()) do
						if iter_88_1 then
							local var_88_4 = Mathf.Lerp(iter_88_1.color.r, 1, var_88_3)

							iter_88_1.color = Color.New(var_88_4, var_88_4, var_88_4)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_1 + var_88_2 and arg_85_1.time_ < var_88_1 + var_88_2 + arg_88_0 and arg_85_1.var_.actorSpriteComps1033 then
				local var_88_5 = 1

				for iter_88_2, iter_88_3 in pairs(arg_85_1.var_.actorSpriteComps1033:ToTable()) do
					if iter_88_3 then
						iter_88_3.color = Color.New(var_88_5, var_88_5, var_88_5)
					end
				end

				arg_85_1.var_.actorSpriteComps1033 = nil
			end

			local var_88_6 = arg_85_1.actors_["1029"]
			local var_88_7 = 0

			if var_88_7 < arg_85_1.time_ and arg_85_1.time_ <= var_88_7 + arg_88_0 and arg_85_1.var_.actorSpriteComps1029 == nil then
				arg_85_1.var_.actorSpriteComps1029 = var_88_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_88_8 = 0.2

			if var_88_7 <= arg_85_1.time_ and arg_85_1.time_ < var_88_7 + var_88_8 then
				local var_88_9 = (arg_85_1.time_ - var_88_7) / var_88_8

				if arg_85_1.var_.actorSpriteComps1029 then
					for iter_88_4, iter_88_5 in pairs(arg_85_1.var_.actorSpriteComps1029:ToTable()) do
						if iter_88_5 then
							local var_88_10 = Mathf.Lerp(iter_88_5.color.r, 0.5, var_88_9)

							iter_88_5.color = Color.New(var_88_10, var_88_10, var_88_10)
						end
					end
				end
			end

			if arg_85_1.time_ >= var_88_7 + var_88_8 and arg_85_1.time_ < var_88_7 + var_88_8 + arg_88_0 and arg_85_1.var_.actorSpriteComps1029 then
				local var_88_11 = 0.5

				for iter_88_6, iter_88_7 in pairs(arg_85_1.var_.actorSpriteComps1029:ToTable()) do
					if iter_88_7 then
						iter_88_7.color = Color.New(var_88_11, var_88_11, var_88_11)
					end
				end

				arg_85_1.var_.actorSpriteComps1029 = nil
			end

			local var_88_12 = 0
			local var_88_13 = 0.075

			if var_88_12 < arg_85_1.time_ and arg_85_1.time_ <= var_88_12 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_14 = arg_85_1:FormatText(StoryNameCfg[236].name)

				arg_85_1.leftNameTxt_.text = var_88_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_15 = arg_85_1:GetWordFromCfg(117041021)
				local var_88_16 = arg_85_1:FormatText(var_88_15.content)

				arg_85_1.text_.text = var_88_16

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_17 = 3
				local var_88_18 = utf8.len(var_88_16)
				local var_88_19 = var_88_17 <= 0 and var_88_13 or var_88_13 * (var_88_18 / var_88_17)

				if var_88_19 > 0 and var_88_13 < var_88_19 then
					arg_85_1.talkMaxDuration = var_88_19

					if var_88_19 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_19 + var_88_12
					end
				end

				arg_85_1.text_.text = var_88_16
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041021", "story_v_out_117041.awb") ~= 0 then
					local var_88_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041021", "story_v_out_117041.awb") / 1000

					if var_88_20 + var_88_12 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_20 + var_88_12
					end

					if var_88_15.prefab_name ~= "" and arg_85_1.actors_[var_88_15.prefab_name] ~= nil then
						local var_88_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_15.prefab_name].transform, "story_v_out_117041", "117041021", "story_v_out_117041.awb")

						arg_85_1:RecordAudio("117041021", var_88_21)
						arg_85_1:RecordAudio("117041021", var_88_21)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_117041", "117041021", "story_v_out_117041.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_117041", "117041021", "story_v_out_117041.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_22 = math.max(var_88_13, arg_85_1.talkMaxDuration)

			if var_88_12 <= arg_85_1.time_ and arg_85_1.time_ < var_88_12 + var_88_22 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_12) / var_88_22

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_12 + var_88_22 and arg_85_1.time_ < var_88_12 + var_88_22 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play117041022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 117041022
		arg_89_1.duration_ = 10.233

		local var_89_0 = {
			zh = 10.233,
			ja = 9.633
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
				arg_89_0:Play117041023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = "ST03"

			if arg_89_1.bgs_[var_92_0] == nil then
				local var_92_1 = Object.Instantiate(arg_89_1.paintGo_)

				var_92_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_92_0)
				var_92_1.name = var_92_0
				var_92_1.transform.parent = arg_89_1.stage_.transform
				var_92_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_89_1.bgs_[var_92_0] = var_92_1
			end

			local var_92_2 = 2

			if var_92_2 < arg_89_1.time_ and arg_89_1.time_ <= var_92_2 + arg_92_0 then
				local var_92_3 = manager.ui.mainCamera.transform.localPosition
				local var_92_4 = Vector3.New(0, 0, 10) + Vector3.New(var_92_3.x, var_92_3.y, 0)
				local var_92_5 = arg_89_1.bgs_.ST03

				var_92_5.transform.localPosition = var_92_4
				var_92_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_92_6 = var_92_5:GetComponent("SpriteRenderer")

				if var_92_6 and var_92_6.sprite then
					local var_92_7 = (var_92_5.transform.localPosition - var_92_3).z
					local var_92_8 = manager.ui.mainCameraCom_
					local var_92_9 = 2 * var_92_7 * Mathf.Tan(var_92_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_92_10 = var_92_9 * var_92_8.aspect
					local var_92_11 = var_92_6.sprite.bounds.size.x
					local var_92_12 = var_92_6.sprite.bounds.size.y
					local var_92_13 = var_92_10 / var_92_11
					local var_92_14 = var_92_9 / var_92_12
					local var_92_15 = var_92_14 < var_92_13 and var_92_13 or var_92_14

					var_92_5.transform.localScale = Vector3.New(var_92_15, var_92_15, 0)
				end

				for iter_92_0, iter_92_1 in pairs(arg_89_1.bgs_) do
					if iter_92_0 ~= "ST03" then
						iter_92_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_92_16 = 0

			if var_92_16 < arg_89_1.time_ and arg_89_1.time_ <= var_92_16 + arg_92_0 then
				arg_89_1.mask_.enabled = true
				arg_89_1.mask_.raycastTarget = true

				arg_89_1:SetGaussion(false)
			end

			local var_92_17 = 2

			if var_92_16 <= arg_89_1.time_ and arg_89_1.time_ < var_92_16 + var_92_17 then
				local var_92_18 = (arg_89_1.time_ - var_92_16) / var_92_17
				local var_92_19 = Color.New(0, 0, 0)

				var_92_19.a = Mathf.Lerp(0, 1, var_92_18)
				arg_89_1.mask_.color = var_92_19
			end

			if arg_89_1.time_ >= var_92_16 + var_92_17 and arg_89_1.time_ < var_92_16 + var_92_17 + arg_92_0 then
				local var_92_20 = Color.New(0, 0, 0)

				var_92_20.a = 1
				arg_89_1.mask_.color = var_92_20
			end

			local var_92_21 = 2

			if var_92_21 < arg_89_1.time_ and arg_89_1.time_ <= var_92_21 + arg_92_0 then
				arg_89_1.mask_.enabled = true
				arg_89_1.mask_.raycastTarget = true

				arg_89_1:SetGaussion(false)
			end

			local var_92_22 = 2

			if var_92_21 <= arg_89_1.time_ and arg_89_1.time_ < var_92_21 + var_92_22 then
				local var_92_23 = (arg_89_1.time_ - var_92_21) / var_92_22
				local var_92_24 = Color.New(0, 0, 0)

				var_92_24.a = Mathf.Lerp(1, 0, var_92_23)
				arg_89_1.mask_.color = var_92_24
			end

			if arg_89_1.time_ >= var_92_21 + var_92_22 and arg_89_1.time_ < var_92_21 + var_92_22 + arg_92_0 then
				local var_92_25 = Color.New(0, 0, 0)
				local var_92_26 = 0

				arg_89_1.mask_.enabled = false
				var_92_25.a = var_92_26
				arg_89_1.mask_.color = var_92_25
			end

			local var_92_27 = arg_89_1.actors_["1033"].transform
			local var_92_28 = 2

			if var_92_28 < arg_89_1.time_ and arg_89_1.time_ <= var_92_28 + arg_92_0 then
				arg_89_1.var_.moveOldPos1033 = var_92_27.localPosition
				var_92_27.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("1033", 7)

				local var_92_29 = var_92_27.childCount

				for iter_92_2 = 0, var_92_29 - 1 do
					local var_92_30 = var_92_27:GetChild(iter_92_2)

					if var_92_30.name == "split_6" or not string.find(var_92_30.name, "split") then
						var_92_30.gameObject:SetActive(true)
					else
						var_92_30.gameObject:SetActive(false)
					end
				end
			end

			local var_92_31 = 0.001

			if var_92_28 <= arg_89_1.time_ and arg_89_1.time_ < var_92_28 + var_92_31 then
				local var_92_32 = (arg_89_1.time_ - var_92_28) / var_92_31
				local var_92_33 = Vector3.New(0, -2000, 0)

				var_92_27.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1033, var_92_33, var_92_32)
			end

			if arg_89_1.time_ >= var_92_28 + var_92_31 and arg_89_1.time_ < var_92_28 + var_92_31 + arg_92_0 then
				var_92_27.localPosition = Vector3.New(0, -2000, 0)
			end

			local var_92_34 = arg_89_1.actors_["1029"].transform
			local var_92_35 = 2

			if var_92_35 < arg_89_1.time_ and arg_89_1.time_ <= var_92_35 + arg_92_0 then
				arg_89_1.var_.moveOldPos1029 = var_92_34.localPosition
				var_92_34.localScale = Vector3.New(1, 1, 1)

				arg_89_1:CheckSpriteTmpPos("1029", 7)

				local var_92_36 = var_92_34.childCount

				for iter_92_3 = 0, var_92_36 - 1 do
					local var_92_37 = var_92_34:GetChild(iter_92_3)

					if var_92_37.name == "split_1" or not string.find(var_92_37.name, "split") then
						var_92_37.gameObject:SetActive(true)
					else
						var_92_37.gameObject:SetActive(false)
					end
				end
			end

			local var_92_38 = 0.001

			if var_92_35 <= arg_89_1.time_ and arg_89_1.time_ < var_92_35 + var_92_38 then
				local var_92_39 = (arg_89_1.time_ - var_92_35) / var_92_38
				local var_92_40 = Vector3.New(0, -2000, -140)

				var_92_34.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1029, var_92_40, var_92_39)
			end

			if arg_89_1.time_ >= var_92_35 + var_92_38 and arg_89_1.time_ < var_92_35 + var_92_38 + arg_92_0 then
				var_92_34.localPosition = Vector3.New(0, -2000, -140)
			end

			if arg_89_1.frameCnt_ <= 1 then
				arg_89_1.dialog_:SetActive(false)
			end

			local var_92_41 = 4
			local var_92_42 = 0.8

			if var_92_41 < arg_89_1.time_ and arg_89_1.time_ <= var_92_41 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0

				arg_89_1.dialog_:SetActive(true)

				local var_92_43 = LeanTween.value(arg_89_1.dialog_, 0, 1, 0.3)

				var_92_43:setOnUpdate(LuaHelper.FloatAction(function(arg_93_0)
					arg_89_1.dialogCg_.alpha = arg_93_0
				end))
				var_92_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_89_1.dialog_)
					var_92_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_89_1.duration_ = arg_89_1.duration_ + 0.3

				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_44 = arg_89_1:FormatText(StoryNameCfg[144].name)

				arg_89_1.leftNameTxt_.text = var_92_44

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, true)
				arg_89_1.iconController_:SetSelectedState("hero")

				arg_89_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_45 = arg_89_1:GetWordFromCfg(117041022)
				local var_92_46 = arg_89_1:FormatText(var_92_45.content)

				arg_89_1.text_.text = var_92_46

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_47 = 32
				local var_92_48 = utf8.len(var_92_46)
				local var_92_49 = var_92_47 <= 0 and var_92_42 or var_92_42 * (var_92_48 / var_92_47)

				if var_92_49 > 0 and var_92_42 < var_92_49 then
					arg_89_1.talkMaxDuration = var_92_49
					var_92_41 = var_92_41 + 0.3

					if var_92_49 + var_92_41 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_49 + var_92_41
					end
				end

				arg_89_1.text_.text = var_92_46
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041022", "story_v_out_117041.awb") ~= 0 then
					local var_92_50 = manager.audio:GetVoiceLength("story_v_out_117041", "117041022", "story_v_out_117041.awb") / 1000

					if var_92_50 + var_92_41 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_50 + var_92_41
					end

					if var_92_45.prefab_name ~= "" and arg_89_1.actors_[var_92_45.prefab_name] ~= nil then
						local var_92_51 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_45.prefab_name].transform, "story_v_out_117041", "117041022", "story_v_out_117041.awb")

						arg_89_1:RecordAudio("117041022", var_92_51)
						arg_89_1:RecordAudio("117041022", var_92_51)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_117041", "117041022", "story_v_out_117041.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_117041", "117041022", "story_v_out_117041.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_52 = var_92_41 + 0.3
			local var_92_53 = math.max(var_92_42, arg_89_1.talkMaxDuration)

			if var_92_52 <= arg_89_1.time_ and arg_89_1.time_ < var_92_52 + var_92_53 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_52) / var_92_53

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_52 + var_92_53 and arg_89_1.time_ < var_92_52 + var_92_53 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play117041023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 117041023
		arg_95_1.duration_ = 4.333

		local var_95_0 = {
			zh = 4.333,
			ja = 2.966
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
				arg_95_0:Play117041024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "10036"

			if arg_95_1.actors_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_98_0), arg_95_1.canvasGo_.transform)

				var_98_1.transform:SetSiblingIndex(1)

				var_98_1.name = var_98_0
				var_98_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_95_1.actors_[var_98_0] = var_98_1
			end

			local var_98_2 = arg_95_1.actors_["10036"].transform
			local var_98_3 = 0

			if var_98_3 < arg_95_1.time_ and arg_95_1.time_ <= var_98_3 + arg_98_0 then
				arg_95_1.var_.moveOldPos10036 = var_98_2.localPosition
				var_98_2.localScale = Vector3.New(1, 1, 1)

				arg_95_1:CheckSpriteTmpPos("10036", 3)

				local var_98_4 = var_98_2.childCount

				for iter_98_0 = 0, var_98_4 - 1 do
					local var_98_5 = var_98_2:GetChild(iter_98_0)

					if var_98_5.name == "split_1" or not string.find(var_98_5.name, "split") then
						var_98_5.gameObject:SetActive(true)
					else
						var_98_5.gameObject:SetActive(false)
					end
				end
			end

			local var_98_6 = 0.001

			if var_98_3 <= arg_95_1.time_ and arg_95_1.time_ < var_98_3 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_3) / var_98_6
				local var_98_8 = Vector3.New(0, -445, -290)

				var_98_2.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos10036, var_98_8, var_98_7)
			end

			if arg_95_1.time_ >= var_98_3 + var_98_6 and arg_95_1.time_ < var_98_3 + var_98_6 + arg_98_0 then
				var_98_2.localPosition = Vector3.New(0, -445, -290)
			end

			local var_98_9 = arg_95_1.actors_["10036"]
			local var_98_10 = 0

			if var_98_10 < arg_95_1.time_ and arg_95_1.time_ <= var_98_10 + arg_98_0 then
				local var_98_11 = var_98_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_98_11 then
					arg_95_1.var_.alphaOldValue10036 = var_98_11.alpha
					arg_95_1.var_.characterEffect10036 = var_98_11
				end

				arg_95_1.var_.alphaOldValue10036 = 0
			end

			local var_98_12 = 0.333333333333333

			if var_98_10 <= arg_95_1.time_ and arg_95_1.time_ < var_98_10 + var_98_12 then
				local var_98_13 = (arg_95_1.time_ - var_98_10) / var_98_12
				local var_98_14 = Mathf.Lerp(arg_95_1.var_.alphaOldValue10036, 1, var_98_13)

				if arg_95_1.var_.characterEffect10036 then
					arg_95_1.var_.characterEffect10036.alpha = var_98_14
				end
			end

			if arg_95_1.time_ >= var_98_10 + var_98_12 and arg_95_1.time_ < var_98_10 + var_98_12 + arg_98_0 and arg_95_1.var_.characterEffect10036 then
				arg_95_1.var_.characterEffect10036.alpha = 1
			end

			local var_98_15 = 0
			local var_98_16 = 0.525

			if var_98_15 < arg_95_1.time_ and arg_95_1.time_ <= var_98_15 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_17 = arg_95_1:FormatText(StoryNameCfg[370].name)

				arg_95_1.leftNameTxt_.text = var_98_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_18 = arg_95_1:GetWordFromCfg(117041023)
				local var_98_19 = arg_95_1:FormatText(var_98_18.content)

				arg_95_1.text_.text = var_98_19

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_20 = 21
				local var_98_21 = utf8.len(var_98_19)
				local var_98_22 = var_98_20 <= 0 and var_98_16 or var_98_16 * (var_98_21 / var_98_20)

				if var_98_22 > 0 and var_98_16 < var_98_22 then
					arg_95_1.talkMaxDuration = var_98_22

					if var_98_22 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_22 + var_98_15
					end
				end

				arg_95_1.text_.text = var_98_19
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041023", "story_v_out_117041.awb") ~= 0 then
					local var_98_23 = manager.audio:GetVoiceLength("story_v_out_117041", "117041023", "story_v_out_117041.awb") / 1000

					if var_98_23 + var_98_15 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_23 + var_98_15
					end

					if var_98_18.prefab_name ~= "" and arg_95_1.actors_[var_98_18.prefab_name] ~= nil then
						local var_98_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_18.prefab_name].transform, "story_v_out_117041", "117041023", "story_v_out_117041.awb")

						arg_95_1:RecordAudio("117041023", var_98_24)
						arg_95_1:RecordAudio("117041023", var_98_24)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_117041", "117041023", "story_v_out_117041.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_117041", "117041023", "story_v_out_117041.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_25 = math.max(var_98_16, arg_95_1.talkMaxDuration)

			if var_98_15 <= arg_95_1.time_ and arg_95_1.time_ < var_98_15 + var_98_25 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_15) / var_98_25

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_15 + var_98_25 and arg_95_1.time_ < var_98_15 + var_98_25 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play117041024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 117041024
		arg_99_1.duration_ = 5.433

		local var_99_0 = {
			zh = 5.433,
			ja = 5.233
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
				arg_99_0:Play117041025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10036"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.actorSpriteComps10036 == nil then
				arg_99_1.var_.actorSpriteComps10036 = var_102_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.actorSpriteComps10036 then
					for iter_102_0, iter_102_1 in pairs(arg_99_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_102_1 then
							local var_102_4 = Mathf.Lerp(iter_102_1.color.r, 0.5, var_102_3)

							iter_102_1.color = Color.New(var_102_4, var_102_4, var_102_4)
						end
					end
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.actorSpriteComps10036 then
				local var_102_5 = 0.5

				for iter_102_2, iter_102_3 in pairs(arg_99_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_102_3 then
						iter_102_3.color = Color.New(var_102_5, var_102_5, var_102_5)
					end
				end

				arg_99_1.var_.actorSpriteComps10036 = nil
			end

			local var_102_6 = 0
			local var_102_7 = 0.75

			if var_102_6 < arg_99_1.time_ and arg_99_1.time_ <= var_102_6 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_8 = arg_99_1:FormatText(StoryNameCfg[144].name)

				arg_99_1.leftNameTxt_.text = var_102_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, true)
				arg_99_1.iconController_:SetSelectedState("hero")

				arg_99_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_9 = arg_99_1:GetWordFromCfg(117041024)
				local var_102_10 = arg_99_1:FormatText(var_102_9.content)

				arg_99_1.text_.text = var_102_10

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_11 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041024", "story_v_out_117041.awb") ~= 0 then
					local var_102_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041024", "story_v_out_117041.awb") / 1000

					if var_102_14 + var_102_6 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_14 + var_102_6
					end

					if var_102_9.prefab_name ~= "" and arg_99_1.actors_[var_102_9.prefab_name] ~= nil then
						local var_102_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_9.prefab_name].transform, "story_v_out_117041", "117041024", "story_v_out_117041.awb")

						arg_99_1:RecordAudio("117041024", var_102_15)
						arg_99_1:RecordAudio("117041024", var_102_15)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_117041", "117041024", "story_v_out_117041.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_117041", "117041024", "story_v_out_117041.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_16 = math.max(var_102_7, arg_99_1.talkMaxDuration)

			if var_102_6 <= arg_99_1.time_ and arg_99_1.time_ < var_102_6 + var_102_16 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_6) / var_102_16

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_6 + var_102_16 and arg_99_1.time_ < var_102_6 + var_102_16 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play117041025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 117041025
		arg_103_1.duration_ = 5.2

		local var_103_0 = {
			zh = 5.2,
			ja = 5.066
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
				arg_103_0:Play117041026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10036"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.actorSpriteComps10036 == nil then
				arg_103_1.var_.actorSpriteComps10036 = var_106_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.actorSpriteComps10036 then
					for iter_106_0, iter_106_1 in pairs(arg_103_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_106_1 then
							local var_106_4 = Mathf.Lerp(iter_106_1.color.r, 1, var_106_3)

							iter_106_1.color = Color.New(var_106_4, var_106_4, var_106_4)
						end
					end
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.actorSpriteComps10036 then
				local var_106_5 = 1

				for iter_106_2, iter_106_3 in pairs(arg_103_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_106_3 then
						iter_106_3.color = Color.New(var_106_5, var_106_5, var_106_5)
					end
				end

				arg_103_1.var_.actorSpriteComps10036 = nil
			end

			local var_106_6 = 0
			local var_106_7 = 0.675

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_8 = arg_103_1:FormatText(StoryNameCfg[370].name)

				arg_103_1.leftNameTxt_.text = var_106_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_9 = arg_103_1:GetWordFromCfg(117041025)
				local var_106_10 = arg_103_1:FormatText(var_106_9.content)

				arg_103_1.text_.text = var_106_10

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_11 = 27
				local var_106_12 = utf8.len(var_106_10)
				local var_106_13 = var_106_11 <= 0 and var_106_7 or var_106_7 * (var_106_12 / var_106_11)

				if var_106_13 > 0 and var_106_7 < var_106_13 then
					arg_103_1.talkMaxDuration = var_106_13

					if var_106_13 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_13 + var_106_6
					end
				end

				arg_103_1.text_.text = var_106_10
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041025", "story_v_out_117041.awb") ~= 0 then
					local var_106_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041025", "story_v_out_117041.awb") / 1000

					if var_106_14 + var_106_6 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_14 + var_106_6
					end

					if var_106_9.prefab_name ~= "" and arg_103_1.actors_[var_106_9.prefab_name] ~= nil then
						local var_106_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_9.prefab_name].transform, "story_v_out_117041", "117041025", "story_v_out_117041.awb")

						arg_103_1:RecordAudio("117041025", var_106_15)
						arg_103_1:RecordAudio("117041025", var_106_15)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_117041", "117041025", "story_v_out_117041.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_117041", "117041025", "story_v_out_117041.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_16 = math.max(var_106_7, arg_103_1.talkMaxDuration)

			if var_106_6 <= arg_103_1.time_ and arg_103_1.time_ < var_106_6 + var_106_16 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_6) / var_106_16

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_6 + var_106_16 and arg_103_1.time_ < var_106_6 + var_106_16 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play117041026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 117041026
		arg_107_1.duration_ = 9.666

		local var_107_0 = {
			zh = 7.766,
			ja = 9.666
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
				arg_107_0:Play117041027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 0.95

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_2 = arg_107_1:FormatText(StoryNameCfg[370].name)

				arg_107_1.leftNameTxt_.text = var_110_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_3 = arg_107_1:GetWordFromCfg(117041026)
				local var_110_4 = arg_107_1:FormatText(var_110_3.content)

				arg_107_1.text_.text = var_110_4

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_5 = 38
				local var_110_6 = utf8.len(var_110_4)
				local var_110_7 = var_110_5 <= 0 and var_110_1 or var_110_1 * (var_110_6 / var_110_5)

				if var_110_7 > 0 and var_110_1 < var_110_7 then
					arg_107_1.talkMaxDuration = var_110_7

					if var_110_7 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_7 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_4
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041026", "story_v_out_117041.awb") ~= 0 then
					local var_110_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041026", "story_v_out_117041.awb") / 1000

					if var_110_8 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_8 + var_110_0
					end

					if var_110_3.prefab_name ~= "" and arg_107_1.actors_[var_110_3.prefab_name] ~= nil then
						local var_110_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_3.prefab_name].transform, "story_v_out_117041", "117041026", "story_v_out_117041.awb")

						arg_107_1:RecordAudio("117041026", var_110_9)
						arg_107_1:RecordAudio("117041026", var_110_9)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_117041", "117041026", "story_v_out_117041.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_117041", "117041026", "story_v_out_117041.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_10 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_10 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_10

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_10 and arg_107_1.time_ < var_110_0 + var_110_10 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play117041027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 117041027
		arg_111_1.duration_ = 5.166

		local var_111_0 = {
			zh = 3.166,
			ja = 5.166
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
				arg_111_0:Play117041028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["10036"]
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 and arg_111_1.var_.actorSpriteComps10036 == nil then
				arg_111_1.var_.actorSpriteComps10036 = var_114_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_114_2 = 0.2

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2

				if arg_111_1.var_.actorSpriteComps10036 then
					for iter_114_0, iter_114_1 in pairs(arg_111_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_114_1 then
							local var_114_4 = Mathf.Lerp(iter_114_1.color.r, 0.5, var_114_3)

							iter_114_1.color = Color.New(var_114_4, var_114_4, var_114_4)
						end
					end
				end
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 and arg_111_1.var_.actorSpriteComps10036 then
				local var_114_5 = 0.5

				for iter_114_2, iter_114_3 in pairs(arg_111_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_114_3 then
						iter_114_3.color = Color.New(var_114_5, var_114_5, var_114_5)
					end
				end

				arg_111_1.var_.actorSpriteComps10036 = nil
			end

			local var_114_6 = 0
			local var_114_7 = 0.4

			if var_114_6 < arg_111_1.time_ and arg_111_1.time_ <= var_114_6 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_8 = arg_111_1:FormatText(StoryNameCfg[144].name)

				arg_111_1.leftNameTxt_.text = var_114_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, true)
				arg_111_1.iconController_:SetSelectedState("hero")

				arg_111_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_reporterw")

				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_9 = arg_111_1:GetWordFromCfg(117041027)
				local var_114_10 = arg_111_1:FormatText(var_114_9.content)

				arg_111_1.text_.text = var_114_10

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_11 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041027", "story_v_out_117041.awb") ~= 0 then
					local var_114_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041027", "story_v_out_117041.awb") / 1000

					if var_114_14 + var_114_6 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_14 + var_114_6
					end

					if var_114_9.prefab_name ~= "" and arg_111_1.actors_[var_114_9.prefab_name] ~= nil then
						local var_114_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_9.prefab_name].transform, "story_v_out_117041", "117041027", "story_v_out_117041.awb")

						arg_111_1:RecordAudio("117041027", var_114_15)
						arg_111_1:RecordAudio("117041027", var_114_15)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_117041", "117041027", "story_v_out_117041.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_117041", "117041027", "story_v_out_117041.awb")
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
	Play117041028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 117041028
		arg_115_1.duration_ = 11.3

		local var_115_0 = {
			zh = 10.666,
			ja = 11.3
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
				arg_115_0:Play117041029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["10036"]
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 and arg_115_1.var_.actorSpriteComps10036 == nil then
				arg_115_1.var_.actorSpriteComps10036 = var_118_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_118_2 = 0.2

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_2 then
				local var_118_3 = (arg_115_1.time_ - var_118_1) / var_118_2

				if arg_115_1.var_.actorSpriteComps10036 then
					for iter_118_0, iter_118_1 in pairs(arg_115_1.var_.actorSpriteComps10036:ToTable()) do
						if iter_118_1 then
							local var_118_4 = Mathf.Lerp(iter_118_1.color.r, 1, var_118_3)

							iter_118_1.color = Color.New(var_118_4, var_118_4, var_118_4)
						end
					end
				end
			end

			if arg_115_1.time_ >= var_118_1 + var_118_2 and arg_115_1.time_ < var_118_1 + var_118_2 + arg_118_0 and arg_115_1.var_.actorSpriteComps10036 then
				local var_118_5 = 1

				for iter_118_2, iter_118_3 in pairs(arg_115_1.var_.actorSpriteComps10036:ToTable()) do
					if iter_118_3 then
						iter_118_3.color = Color.New(var_118_5, var_118_5, var_118_5)
					end
				end

				arg_115_1.var_.actorSpriteComps10036 = nil
			end

			local var_118_6 = 0
			local var_118_7 = 1.325

			if var_118_6 < arg_115_1.time_ and arg_115_1.time_ <= var_118_6 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_8 = arg_115_1:FormatText(StoryNameCfg[370].name)

				arg_115_1.leftNameTxt_.text = var_118_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_9 = arg_115_1:GetWordFromCfg(117041028)
				local var_118_10 = arg_115_1:FormatText(var_118_9.content)

				arg_115_1.text_.text = var_118_10

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_11 = 53
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041028", "story_v_out_117041.awb") ~= 0 then
					local var_118_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041028", "story_v_out_117041.awb") / 1000

					if var_118_14 + var_118_6 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_14 + var_118_6
					end

					if var_118_9.prefab_name ~= "" and arg_115_1.actors_[var_118_9.prefab_name] ~= nil then
						local var_118_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_9.prefab_name].transform, "story_v_out_117041", "117041028", "story_v_out_117041.awb")

						arg_115_1:RecordAudio("117041028", var_118_15)
						arg_115_1:RecordAudio("117041028", var_118_15)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_117041", "117041028", "story_v_out_117041.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_117041", "117041028", "story_v_out_117041.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_16 = math.max(var_118_7, arg_115_1.talkMaxDuration)

			if var_118_6 <= arg_115_1.time_ and arg_115_1.time_ < var_118_6 + var_118_16 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_6) / var_118_16

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_6 + var_118_16 and arg_115_1.time_ < var_118_6 + var_118_16 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play117041029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 117041029
		arg_119_1.duration_ = 9

		SetActive(arg_119_1.tipsGo_, false)

		function arg_119_1.onSingleLineFinish_()
			arg_119_1.onSingleLineUpdate_ = nil
			arg_119_1.onSingleLineFinish_ = nil
			arg_119_1.state_ = "waiting"
		end

		function arg_119_1.playNext_(arg_121_0)
			if arg_121_0 == 1 then
				arg_119_0:Play117041030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = "ST24a"

			if arg_119_1.bgs_[var_122_0] == nil then
				local var_122_1 = Object.Instantiate(arg_119_1.paintGo_)

				var_122_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_122_0)
				var_122_1.name = var_122_0
				var_122_1.transform.parent = arg_119_1.stage_.transform
				var_122_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_119_1.bgs_[var_122_0] = var_122_1
			end

			local var_122_2 = 2

			if var_122_2 < arg_119_1.time_ and arg_119_1.time_ <= var_122_2 + arg_122_0 then
				local var_122_3 = manager.ui.mainCamera.transform.localPosition
				local var_122_4 = Vector3.New(0, 0, 10) + Vector3.New(var_122_3.x, var_122_3.y, 0)
				local var_122_5 = arg_119_1.bgs_.ST24a

				var_122_5.transform.localPosition = var_122_4
				var_122_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_122_6 = var_122_5:GetComponent("SpriteRenderer")

				if var_122_6 and var_122_6.sprite then
					local var_122_7 = (var_122_5.transform.localPosition - var_122_3).z
					local var_122_8 = manager.ui.mainCameraCom_
					local var_122_9 = 2 * var_122_7 * Mathf.Tan(var_122_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_122_10 = var_122_9 * var_122_8.aspect
					local var_122_11 = var_122_6.sprite.bounds.size.x
					local var_122_12 = var_122_6.sprite.bounds.size.y
					local var_122_13 = var_122_10 / var_122_11
					local var_122_14 = var_122_9 / var_122_12
					local var_122_15 = var_122_14 < var_122_13 and var_122_13 or var_122_14

					var_122_5.transform.localScale = Vector3.New(var_122_15, var_122_15, 0)
				end

				for iter_122_0, iter_122_1 in pairs(arg_119_1.bgs_) do
					if iter_122_0 ~= "ST24a" then
						iter_122_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_122_16 = 0

			if var_122_16 < arg_119_1.time_ and arg_119_1.time_ <= var_122_16 + arg_122_0 then
				arg_119_1.mask_.enabled = true
				arg_119_1.mask_.raycastTarget = true

				arg_119_1:SetGaussion(false)
			end

			local var_122_17 = 2

			if var_122_16 <= arg_119_1.time_ and arg_119_1.time_ < var_122_16 + var_122_17 then
				local var_122_18 = (arg_119_1.time_ - var_122_16) / var_122_17
				local var_122_19 = Color.New(0, 0, 0)

				var_122_19.a = Mathf.Lerp(0, 1, var_122_18)
				arg_119_1.mask_.color = var_122_19
			end

			if arg_119_1.time_ >= var_122_16 + var_122_17 and arg_119_1.time_ < var_122_16 + var_122_17 + arg_122_0 then
				local var_122_20 = Color.New(0, 0, 0)

				var_122_20.a = 1
				arg_119_1.mask_.color = var_122_20
			end

			local var_122_21 = 2

			if var_122_21 < arg_119_1.time_ and arg_119_1.time_ <= var_122_21 + arg_122_0 then
				arg_119_1.mask_.enabled = true
				arg_119_1.mask_.raycastTarget = true

				arg_119_1:SetGaussion(false)
			end

			local var_122_22 = 2

			if var_122_21 <= arg_119_1.time_ and arg_119_1.time_ < var_122_21 + var_122_22 then
				local var_122_23 = (arg_119_1.time_ - var_122_21) / var_122_22
				local var_122_24 = Color.New(0, 0, 0)

				var_122_24.a = Mathf.Lerp(1, 0, var_122_23)
				arg_119_1.mask_.color = var_122_24
			end

			if arg_119_1.time_ >= var_122_21 + var_122_22 and arg_119_1.time_ < var_122_21 + var_122_22 + arg_122_0 then
				local var_122_25 = Color.New(0, 0, 0)
				local var_122_26 = 0

				arg_119_1.mask_.enabled = false
				var_122_25.a = var_122_26
				arg_119_1.mask_.color = var_122_25
			end

			local var_122_27 = arg_119_1.actors_["10036"].transform
			local var_122_28 = 2

			if var_122_28 < arg_119_1.time_ and arg_119_1.time_ <= var_122_28 + arg_122_0 then
				arg_119_1.var_.moveOldPos10036 = var_122_27.localPosition
				var_122_27.localScale = Vector3.New(1, 1, 1)

				arg_119_1:CheckSpriteTmpPos("10036", 7)

				local var_122_29 = var_122_27.childCount

				for iter_122_2 = 0, var_122_29 - 1 do
					local var_122_30 = var_122_27:GetChild(iter_122_2)

					if var_122_30.name == "split_1" or not string.find(var_122_30.name, "split") then
						var_122_30.gameObject:SetActive(true)
					else
						var_122_30.gameObject:SetActive(false)
					end
				end
			end

			local var_122_31 = 0.001

			if var_122_28 <= arg_119_1.time_ and arg_119_1.time_ < var_122_28 + var_122_31 then
				local var_122_32 = (arg_119_1.time_ - var_122_28) / var_122_31
				local var_122_33 = Vector3.New(0, -2000, -290)

				var_122_27.localPosition = Vector3.Lerp(arg_119_1.var_.moveOldPos10036, var_122_33, var_122_32)
			end

			if arg_119_1.time_ >= var_122_28 + var_122_31 and arg_119_1.time_ < var_122_28 + var_122_31 + arg_122_0 then
				var_122_27.localPosition = Vector3.New(0, -2000, -290)
			end

			local var_122_34 = 0
			local var_122_35 = 1

			if var_122_34 < arg_119_1.time_ and arg_119_1.time_ <= var_122_34 + arg_122_0 then
				local var_122_36 = "play"
				local var_122_37 = "music"

				arg_119_1:AudioAction(var_122_36, var_122_37, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_119_1.frameCnt_ <= 1 then
				arg_119_1.dialog_:SetActive(false)
			end

			local var_122_38 = 4
			local var_122_39 = 1.425

			if var_122_38 < arg_119_1.time_ and arg_119_1.time_ <= var_122_38 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0

				arg_119_1.dialog_:SetActive(true)

				local var_122_40 = LeanTween.value(arg_119_1.dialog_, 0, 1, 0.3)

				var_122_40:setOnUpdate(LuaHelper.FloatAction(function(arg_123_0)
					arg_119_1.dialogCg_.alpha = arg_123_0
				end))
				var_122_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_119_1.dialog_)
					var_122_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_119_1.duration_ = arg_119_1.duration_ + 0.3

				SetActive(arg_119_1.leftNameGo_, false)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_41 = arg_119_1:GetWordFromCfg(117041029)
				local var_122_42 = arg_119_1:FormatText(var_122_41.content)

				arg_119_1.text_.text = var_122_42

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_43 = 57
				local var_122_44 = utf8.len(var_122_42)
				local var_122_45 = var_122_43 <= 0 and var_122_39 or var_122_39 * (var_122_44 / var_122_43)

				if var_122_45 > 0 and var_122_39 < var_122_45 then
					arg_119_1.talkMaxDuration = var_122_45
					var_122_38 = var_122_38 + 0.3

					if var_122_45 + var_122_38 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_45 + var_122_38
					end
				end

				arg_119_1.text_.text = var_122_42
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)
				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_46 = var_122_38 + 0.3
			local var_122_47 = math.max(var_122_39, arg_119_1.talkMaxDuration)

			if var_122_46 <= arg_119_1.time_ and arg_119_1.time_ < var_122_46 + var_122_47 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_46) / var_122_47

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_46 + var_122_47 and arg_119_1.time_ < var_122_46 + var_122_47 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play117041030 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 117041030
		arg_125_1.duration_ = 5

		SetActive(arg_125_1.tipsGo_, false)

		function arg_125_1.onSingleLineFinish_()
			arg_125_1.onSingleLineUpdate_ = nil
			arg_125_1.onSingleLineFinish_ = nil
			arg_125_1.state_ = "waiting"
		end

		function arg_125_1.playNext_(arg_127_0)
			if arg_127_0 == 1 then
				arg_125_0:Play117041031(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.166666666666667

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				local var_128_2 = "play"
				local var_128_3 = "music"

				arg_125_1:AudioAction(var_128_2, var_128_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_128_4 = 0.3
			local var_128_5 = 0.7

			if var_128_4 < arg_125_1.time_ and arg_125_1.time_ <= var_128_4 + arg_128_0 then
				local var_128_6 = "play"
				local var_128_7 = "music"

				arg_125_1:AudioAction(var_128_6, var_128_7, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_128_8 = 0
			local var_128_9 = 0.625

			if var_128_8 < arg_125_1.time_ and arg_125_1.time_ <= var_128_8 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, false)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_10 = arg_125_1:GetWordFromCfg(117041030)
				local var_128_11 = arg_125_1:FormatText(var_128_10.content)

				arg_125_1.text_.text = var_128_11

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_12 = 25
				local var_128_13 = utf8.len(var_128_11)
				local var_128_14 = var_128_12 <= 0 and var_128_9 or var_128_9 * (var_128_13 / var_128_12)

				if var_128_14 > 0 and var_128_9 < var_128_14 then
					arg_125_1.talkMaxDuration = var_128_14

					if var_128_14 + var_128_8 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_14 + var_128_8
					end
				end

				arg_125_1.text_.text = var_128_11
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)
				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_15 = math.max(var_128_9, arg_125_1.talkMaxDuration)

			if var_128_8 <= arg_125_1.time_ and arg_125_1.time_ < var_128_8 + var_128_15 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_8) / var_128_15

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_8 + var_128_15 and arg_125_1.time_ < var_128_8 + var_128_15 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play117041031 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 117041031
		arg_129_1.duration_ = 9.066

		local var_129_0 = {
			zh = 7.8,
			ja = 9.066
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
				arg_129_0:Play117041032(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = "10034"

			if arg_129_1.actors_[var_132_0] == nil then
				local var_132_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_132_0), arg_129_1.canvasGo_.transform)

				var_132_1.transform:SetSiblingIndex(1)

				var_132_1.name = var_132_0
				var_132_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_129_1.actors_[var_132_0] = var_132_1
			end

			local var_132_2 = arg_129_1.actors_["10034"].transform
			local var_132_3 = 0

			if var_132_3 < arg_129_1.time_ and arg_129_1.time_ <= var_132_3 + arg_132_0 then
				arg_129_1.var_.moveOldPos10034 = var_132_2.localPosition
				var_132_2.localScale = Vector3.New(1, 1, 1)

				arg_129_1:CheckSpriteTmpPos("10034", 3)

				local var_132_4 = var_132_2.childCount

				for iter_132_0 = 0, var_132_4 - 1 do
					local var_132_5 = var_132_2:GetChild(iter_132_0)

					if var_132_5.name == "split_3" or not string.find(var_132_5.name, "split") then
						var_132_5.gameObject:SetActive(true)
					else
						var_132_5.gameObject:SetActive(false)
					end
				end
			end

			local var_132_6 = 0.001

			if var_132_3 <= arg_129_1.time_ and arg_129_1.time_ < var_132_3 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_3) / var_132_6
				local var_132_8 = Vector3.New(0, -415, -290)

				var_132_2.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10034, var_132_8, var_132_7)
			end

			if arg_129_1.time_ >= var_132_3 + var_132_6 and arg_129_1.time_ < var_132_3 + var_132_6 + arg_132_0 then
				var_132_2.localPosition = Vector3.New(0, -415, -290)
			end

			local var_132_9 = arg_129_1.actors_["10034"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				local var_132_11 = var_132_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_132_11 then
					arg_129_1.var_.alphaOldValue10034 = var_132_11.alpha
					arg_129_1.var_.characterEffect10034 = var_132_11
				end

				arg_129_1.var_.alphaOldValue10034 = 0
			end

			local var_132_12 = 0.333333333333333

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_12 then
				local var_132_13 = (arg_129_1.time_ - var_132_10) / var_132_12
				local var_132_14 = Mathf.Lerp(arg_129_1.var_.alphaOldValue10034, 1, var_132_13)

				if arg_129_1.var_.characterEffect10034 then
					arg_129_1.var_.characterEffect10034.alpha = var_132_14
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_12 and arg_129_1.time_ < var_132_10 + var_132_12 + arg_132_0 and arg_129_1.var_.characterEffect10034 then
				arg_129_1.var_.characterEffect10034.alpha = 1
			end

			local var_132_15 = arg_129_1.actors_["10034"]
			local var_132_16 = 0

			if var_132_16 < arg_129_1.time_ and arg_129_1.time_ <= var_132_16 + arg_132_0 and arg_129_1.var_.actorSpriteComps10034 == nil then
				arg_129_1.var_.actorSpriteComps10034 = var_132_15:GetComponentsInChildren(typeof(Image), true)
			end

			local var_132_17 = 0.2

			if var_132_16 <= arg_129_1.time_ and arg_129_1.time_ < var_132_16 + var_132_17 then
				local var_132_18 = (arg_129_1.time_ - var_132_16) / var_132_17

				if arg_129_1.var_.actorSpriteComps10034 then
					for iter_132_1, iter_132_2 in pairs(arg_129_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_132_2 then
							local var_132_19 = Mathf.Lerp(iter_132_2.color.r, 1, var_132_18)

							iter_132_2.color = Color.New(var_132_19, var_132_19, var_132_19)
						end
					end
				end
			end

			if arg_129_1.time_ >= var_132_16 + var_132_17 and arg_129_1.time_ < var_132_16 + var_132_17 + arg_132_0 and arg_129_1.var_.actorSpriteComps10034 then
				local var_132_20 = 1

				for iter_132_3, iter_132_4 in pairs(arg_129_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_132_4 then
						iter_132_4.color = Color.New(var_132_20, var_132_20, var_132_20)
					end
				end

				arg_129_1.var_.actorSpriteComps10034 = nil
			end

			local var_132_21 = 0
			local var_132_22 = 0.775

			if var_132_21 < arg_129_1.time_ and arg_129_1.time_ <= var_132_21 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_23 = arg_129_1:FormatText(StoryNameCfg[367].name)

				arg_129_1.leftNameTxt_.text = var_132_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_24 = arg_129_1:GetWordFromCfg(117041031)
				local var_132_25 = arg_129_1:FormatText(var_132_24.content)

				arg_129_1.text_.text = var_132_25

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_26 = 31
				local var_132_27 = utf8.len(var_132_25)
				local var_132_28 = var_132_26 <= 0 and var_132_22 or var_132_22 * (var_132_27 / var_132_26)

				if var_132_28 > 0 and var_132_22 < var_132_28 then
					arg_129_1.talkMaxDuration = var_132_28

					if var_132_28 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_28 + var_132_21
					end
				end

				arg_129_1.text_.text = var_132_25
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041031", "story_v_out_117041.awb") ~= 0 then
					local var_132_29 = manager.audio:GetVoiceLength("story_v_out_117041", "117041031", "story_v_out_117041.awb") / 1000

					if var_132_29 + var_132_21 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_29 + var_132_21
					end

					if var_132_24.prefab_name ~= "" and arg_129_1.actors_[var_132_24.prefab_name] ~= nil then
						local var_132_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_24.prefab_name].transform, "story_v_out_117041", "117041031", "story_v_out_117041.awb")

						arg_129_1:RecordAudio("117041031", var_132_30)
						arg_129_1:RecordAudio("117041031", var_132_30)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_117041", "117041031", "story_v_out_117041.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_117041", "117041031", "story_v_out_117041.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_31 = math.max(var_132_22, arg_129_1.talkMaxDuration)

			if var_132_21 <= arg_129_1.time_ and arg_129_1.time_ < var_132_21 + var_132_31 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_21) / var_132_31

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_21 + var_132_31 and arg_129_1.time_ < var_132_21 + var_132_31 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play117041032 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 117041032
		arg_133_1.duration_ = 12.266

		local var_133_0 = {
			zh = 12.266,
			ja = 12
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
				arg_133_0:Play117041033(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = 0
			local var_136_1 = 1.325

			if var_136_0 < arg_133_1.time_ and arg_133_1.time_ <= var_136_0 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_2 = arg_133_1:FormatText(StoryNameCfg[367].name)

				arg_133_1.leftNameTxt_.text = var_136_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_3 = arg_133_1:GetWordFromCfg(117041032)
				local var_136_4 = arg_133_1:FormatText(var_136_3.content)

				arg_133_1.text_.text = var_136_4

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_5 = 53
				local var_136_6 = utf8.len(var_136_4)
				local var_136_7 = var_136_5 <= 0 and var_136_1 or var_136_1 * (var_136_6 / var_136_5)

				if var_136_7 > 0 and var_136_1 < var_136_7 then
					arg_133_1.talkMaxDuration = var_136_7

					if var_136_7 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_7 + var_136_0
					end
				end

				arg_133_1.text_.text = var_136_4
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041032", "story_v_out_117041.awb") ~= 0 then
					local var_136_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041032", "story_v_out_117041.awb") / 1000

					if var_136_8 + var_136_0 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_8 + var_136_0
					end

					if var_136_3.prefab_name ~= "" and arg_133_1.actors_[var_136_3.prefab_name] ~= nil then
						local var_136_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_3.prefab_name].transform, "story_v_out_117041", "117041032", "story_v_out_117041.awb")

						arg_133_1:RecordAudio("117041032", var_136_9)
						arg_133_1:RecordAudio("117041032", var_136_9)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_117041", "117041032", "story_v_out_117041.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_117041", "117041032", "story_v_out_117041.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_10 = math.max(var_136_1, arg_133_1.talkMaxDuration)

			if var_136_0 <= arg_133_1.time_ and arg_133_1.time_ < var_136_0 + var_136_10 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_0) / var_136_10

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_0 + var_136_10 and arg_133_1.time_ < var_136_0 + var_136_10 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play117041033 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 117041033
		arg_137_1.duration_ = 4.966

		local var_137_0 = {
			zh = 4.333,
			ja = 4.966
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
				arg_137_0:Play117041034(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = 0
			local var_140_1 = 0.35

			if var_140_0 < arg_137_1.time_ and arg_137_1.time_ <= var_140_0 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_2 = arg_137_1:FormatText(StoryNameCfg[367].name)

				arg_137_1.leftNameTxt_.text = var_140_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_3 = arg_137_1:GetWordFromCfg(117041033)
				local var_140_4 = arg_137_1:FormatText(var_140_3.content)

				arg_137_1.text_.text = var_140_4

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041033", "story_v_out_117041.awb") ~= 0 then
					local var_140_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041033", "story_v_out_117041.awb") / 1000

					if var_140_8 + var_140_0 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_8 + var_140_0
					end

					if var_140_3.prefab_name ~= "" and arg_137_1.actors_[var_140_3.prefab_name] ~= nil then
						local var_140_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_3.prefab_name].transform, "story_v_out_117041", "117041033", "story_v_out_117041.awb")

						arg_137_1:RecordAudio("117041033", var_140_9)
						arg_137_1:RecordAudio("117041033", var_140_9)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_117041", "117041033", "story_v_out_117041.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_117041", "117041033", "story_v_out_117041.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_10 = math.max(var_140_1, arg_137_1.talkMaxDuration)

			if var_140_0 <= arg_137_1.time_ and arg_137_1.time_ < var_140_0 + var_140_10 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_0) / var_140_10

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_0 + var_140_10 and arg_137_1.time_ < var_140_0 + var_140_10 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play117041034 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 117041034
		arg_141_1.duration_ = 7.166

		local var_141_0 = {
			zh = 4.833,
			ja = 7.166
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
				arg_141_0:Play117041035(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10034"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos10034 = var_144_0.localPosition
				var_144_0.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10034", 2)

				local var_144_2 = var_144_0.childCount

				for iter_144_0 = 0, var_144_2 - 1 do
					local var_144_3 = var_144_0:GetChild(iter_144_0)

					if var_144_3.name == "split_3" or not string.find(var_144_3.name, "split") then
						var_144_3.gameObject:SetActive(true)
					else
						var_144_3.gameObject:SetActive(false)
					end
				end
			end

			local var_144_4 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_4 then
				local var_144_5 = (arg_141_1.time_ - var_144_1) / var_144_4
				local var_144_6 = Vector3.New(-390, -415, -290)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10034, var_144_6, var_144_5)
			end

			if arg_141_1.time_ >= var_144_1 + var_144_4 and arg_141_1.time_ < var_144_1 + var_144_4 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_144_7 = "10035"

			if arg_141_1.actors_[var_144_7] == nil then
				local var_144_8 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_144_7), arg_141_1.canvasGo_.transform)

				var_144_8.transform:SetSiblingIndex(1)

				var_144_8.name = var_144_7
				var_144_8.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_141_1.actors_[var_144_7] = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["10035"].transform
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 then
				arg_141_1.var_.moveOldPos10035 = var_144_9.localPosition
				var_144_9.localScale = Vector3.New(1, 1, 1)

				arg_141_1:CheckSpriteTmpPos("10035", 4)

				local var_144_11 = var_144_9.childCount

				for iter_144_1 = 0, var_144_11 - 1 do
					local var_144_12 = var_144_9:GetChild(iter_144_1)

					if var_144_12.name == "split_1" or not string.find(var_144_12.name, "split") then
						var_144_12.gameObject:SetActive(true)
					else
						var_144_12.gameObject:SetActive(false)
					end
				end
			end

			local var_144_13 = 0.001

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_13 then
				local var_144_14 = (arg_141_1.time_ - var_144_10) / var_144_13
				local var_144_15 = Vector3.New(390, -410, -235)

				var_144_9.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10035, var_144_15, var_144_14)
			end

			if arg_141_1.time_ >= var_144_10 + var_144_13 and arg_141_1.time_ < var_144_10 + var_144_13 + arg_144_0 then
				var_144_9.localPosition = Vector3.New(390, -410, -235)
			end

			local var_144_16 = arg_141_1.actors_["10035"]
			local var_144_17 = 0

			if var_144_17 < arg_141_1.time_ and arg_141_1.time_ <= var_144_17 + arg_144_0 then
				local var_144_18 = var_144_16:GetComponentInChildren(typeof(CanvasGroup))

				if var_144_18 then
					arg_141_1.var_.alphaOldValue10035 = var_144_18.alpha
					arg_141_1.var_.characterEffect10035 = var_144_18
				end

				arg_141_1.var_.alphaOldValue10035 = 0
			end

			local var_144_19 = 0.2

			if var_144_17 <= arg_141_1.time_ and arg_141_1.time_ < var_144_17 + var_144_19 then
				local var_144_20 = (arg_141_1.time_ - var_144_17) / var_144_19
				local var_144_21 = Mathf.Lerp(arg_141_1.var_.alphaOldValue10035, 1, var_144_20)

				if arg_141_1.var_.characterEffect10035 then
					arg_141_1.var_.characterEffect10035.alpha = var_144_21
				end
			end

			if arg_141_1.time_ >= var_144_17 + var_144_19 and arg_141_1.time_ < var_144_17 + var_144_19 + arg_144_0 and arg_141_1.var_.characterEffect10035 then
				arg_141_1.var_.characterEffect10035.alpha = 1
			end

			local var_144_22 = arg_141_1.actors_["10034"]
			local var_144_23 = 0

			if var_144_23 < arg_141_1.time_ and arg_141_1.time_ <= var_144_23 + arg_144_0 and arg_141_1.var_.actorSpriteComps10034 == nil then
				arg_141_1.var_.actorSpriteComps10034 = var_144_22:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_24 = 0.2

			if var_144_23 <= arg_141_1.time_ and arg_141_1.time_ < var_144_23 + var_144_24 then
				local var_144_25 = (arg_141_1.time_ - var_144_23) / var_144_24

				if arg_141_1.var_.actorSpriteComps10034 then
					for iter_144_2, iter_144_3 in pairs(arg_141_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_144_3 then
							local var_144_26 = Mathf.Lerp(iter_144_3.color.r, 0.5, var_144_25)

							iter_144_3.color = Color.New(var_144_26, var_144_26, var_144_26)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_23 + var_144_24 and arg_141_1.time_ < var_144_23 + var_144_24 + arg_144_0 and arg_141_1.var_.actorSpriteComps10034 then
				local var_144_27 = 0.5

				for iter_144_4, iter_144_5 in pairs(arg_141_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_144_5 then
						iter_144_5.color = Color.New(var_144_27, var_144_27, var_144_27)
					end
				end

				arg_141_1.var_.actorSpriteComps10034 = nil
			end

			local var_144_28 = arg_141_1.actors_["10035"]
			local var_144_29 = 0

			if var_144_29 < arg_141_1.time_ and arg_141_1.time_ <= var_144_29 + arg_144_0 and arg_141_1.var_.actorSpriteComps10035 == nil then
				arg_141_1.var_.actorSpriteComps10035 = var_144_28:GetComponentsInChildren(typeof(Image), true)
			end

			local var_144_30 = 0.2

			if var_144_29 <= arg_141_1.time_ and arg_141_1.time_ < var_144_29 + var_144_30 then
				local var_144_31 = (arg_141_1.time_ - var_144_29) / var_144_30

				if arg_141_1.var_.actorSpriteComps10035 then
					for iter_144_6, iter_144_7 in pairs(arg_141_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_144_7 then
							local var_144_32 = Mathf.Lerp(iter_144_7.color.r, 1, var_144_31)

							iter_144_7.color = Color.New(var_144_32, var_144_32, var_144_32)
						end
					end
				end
			end

			if arg_141_1.time_ >= var_144_29 + var_144_30 and arg_141_1.time_ < var_144_29 + var_144_30 + arg_144_0 and arg_141_1.var_.actorSpriteComps10035 then
				local var_144_33 = 1

				for iter_144_8, iter_144_9 in pairs(arg_141_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_144_9 then
						iter_144_9.color = Color.New(var_144_33, var_144_33, var_144_33)
					end
				end

				arg_141_1.var_.actorSpriteComps10035 = nil
			end

			local var_144_34 = 0
			local var_144_35 = 0.4

			if var_144_34 < arg_141_1.time_ and arg_141_1.time_ <= var_144_34 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_36 = arg_141_1:FormatText(StoryNameCfg[369].name)

				arg_141_1.leftNameTxt_.text = var_144_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_37 = arg_141_1:GetWordFromCfg(117041034)
				local var_144_38 = arg_141_1:FormatText(var_144_37.content)

				arg_141_1.text_.text = var_144_38

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_39 = 16
				local var_144_40 = utf8.len(var_144_38)
				local var_144_41 = var_144_39 <= 0 and var_144_35 or var_144_35 * (var_144_40 / var_144_39)

				if var_144_41 > 0 and var_144_35 < var_144_41 then
					arg_141_1.talkMaxDuration = var_144_41

					if var_144_41 + var_144_34 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_41 + var_144_34
					end
				end

				arg_141_1.text_.text = var_144_38
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041034", "story_v_out_117041.awb") ~= 0 then
					local var_144_42 = manager.audio:GetVoiceLength("story_v_out_117041", "117041034", "story_v_out_117041.awb") / 1000

					if var_144_42 + var_144_34 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_42 + var_144_34
					end

					if var_144_37.prefab_name ~= "" and arg_141_1.actors_[var_144_37.prefab_name] ~= nil then
						local var_144_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_37.prefab_name].transform, "story_v_out_117041", "117041034", "story_v_out_117041.awb")

						arg_141_1:RecordAudio("117041034", var_144_43)
						arg_141_1:RecordAudio("117041034", var_144_43)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_117041", "117041034", "story_v_out_117041.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_117041", "117041034", "story_v_out_117041.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_44 = math.max(var_144_35, arg_141_1.talkMaxDuration)

			if var_144_34 <= arg_141_1.time_ and arg_141_1.time_ < var_144_34 + var_144_44 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_34) / var_144_44

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_34 + var_144_44 and arg_141_1.time_ < var_144_34 + var_144_44 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play117041035 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 117041035
		arg_145_1.duration_ = 14.3

		local var_145_0 = {
			zh = 10.7,
			ja = 14.3
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
				arg_145_0:Play117041036(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10034"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.actorSpriteComps10034 == nil then
				arg_145_1.var_.actorSpriteComps10034 = var_148_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_2 = 0.2

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.actorSpriteComps10034 then
					for iter_148_0, iter_148_1 in pairs(arg_145_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_148_1 then
							local var_148_4 = Mathf.Lerp(iter_148_1.color.r, 1, var_148_3)

							iter_148_1.color = Color.New(var_148_4, var_148_4, var_148_4)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.actorSpriteComps10034 then
				local var_148_5 = 1

				for iter_148_2, iter_148_3 in pairs(arg_145_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_148_3 then
						iter_148_3.color = Color.New(var_148_5, var_148_5, var_148_5)
					end
				end

				arg_145_1.var_.actorSpriteComps10034 = nil
			end

			local var_148_6 = arg_145_1.actors_["10035"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.actorSpriteComps10035 == nil then
				arg_145_1.var_.actorSpriteComps10035 = var_148_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_148_8 = 0.2

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.actorSpriteComps10035 then
					for iter_148_4, iter_148_5 in pairs(arg_145_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_148_5 then
							local var_148_10 = Mathf.Lerp(iter_148_5.color.r, 0.5, var_148_9)

							iter_148_5.color = Color.New(var_148_10, var_148_10, var_148_10)
						end
					end
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.actorSpriteComps10035 then
				local var_148_11 = 0.5

				for iter_148_6, iter_148_7 in pairs(arg_145_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_148_7 then
						iter_148_7.color = Color.New(var_148_11, var_148_11, var_148_11)
					end
				end

				arg_145_1.var_.actorSpriteComps10035 = nil
			end

			local var_148_12 = 0
			local var_148_13 = 0.925

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[367].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(117041035)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 37
				local var_148_18 = utf8.len(var_148_16)
				local var_148_19 = var_148_17 <= 0 and var_148_13 or var_148_13 * (var_148_18 / var_148_17)

				if var_148_19 > 0 and var_148_13 < var_148_19 then
					arg_145_1.talkMaxDuration = var_148_19

					if var_148_19 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_19 + var_148_12
					end
				end

				arg_145_1.text_.text = var_148_16
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041035", "story_v_out_117041.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041035", "story_v_out_117041.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_out_117041", "117041035", "story_v_out_117041.awb")

						arg_145_1:RecordAudio("117041035", var_148_21)
						arg_145_1:RecordAudio("117041035", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_117041", "117041035", "story_v_out_117041.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_117041", "117041035", "story_v_out_117041.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_22 = math.max(var_148_13, arg_145_1.talkMaxDuration)

			if var_148_12 <= arg_145_1.time_ and arg_145_1.time_ < var_148_12 + var_148_22 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_12) / var_148_22

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_12 + var_148_22 and arg_145_1.time_ < var_148_12 + var_148_22 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play117041036 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 117041036
		arg_149_1.duration_ = 3.2

		local var_149_0 = {
			zh = 3.2,
			ja = 2.266
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
				arg_149_0:Play117041037(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10034"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos10034 = var_152_0.localPosition
				var_152_0.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("10034", 2)

				local var_152_2 = var_152_0.childCount

				for iter_152_0 = 0, var_152_2 - 1 do
					local var_152_3 = var_152_0:GetChild(iter_152_0)

					if var_152_3.name == "split_3" or not string.find(var_152_3.name, "split") then
						var_152_3.gameObject:SetActive(true)
					else
						var_152_3.gameObject:SetActive(false)
					end
				end
			end

			local var_152_4 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_4 then
				local var_152_5 = (arg_149_1.time_ - var_152_1) / var_152_4
				local var_152_6 = Vector3.New(-390, -415, -290)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10034, var_152_6, var_152_5)
			end

			if arg_149_1.time_ >= var_152_1 + var_152_4 and arg_149_1.time_ < var_152_1 + var_152_4 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_152_7 = arg_149_1.actors_["10035"].transform
			local var_152_8 = 0

			if var_152_8 < arg_149_1.time_ and arg_149_1.time_ <= var_152_8 + arg_152_0 then
				arg_149_1.var_.moveOldPos10035 = var_152_7.localPosition
				var_152_7.localScale = Vector3.New(1, 1, 1)

				arg_149_1:CheckSpriteTmpPos("10035", 4)

				local var_152_9 = var_152_7.childCount

				for iter_152_1 = 0, var_152_9 - 1 do
					local var_152_10 = var_152_7:GetChild(iter_152_1)

					if var_152_10.name == "split_1" or not string.find(var_152_10.name, "split") then
						var_152_10.gameObject:SetActive(true)
					else
						var_152_10.gameObject:SetActive(false)
					end
				end
			end

			local var_152_11 = 0.001

			if var_152_8 <= arg_149_1.time_ and arg_149_1.time_ < var_152_8 + var_152_11 then
				local var_152_12 = (arg_149_1.time_ - var_152_8) / var_152_11
				local var_152_13 = Vector3.New(390, -410, -235)

				var_152_7.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10035, var_152_13, var_152_12)
			end

			if arg_149_1.time_ >= var_152_8 + var_152_11 and arg_149_1.time_ < var_152_8 + var_152_11 + arg_152_0 then
				var_152_7.localPosition = Vector3.New(390, -410, -235)
			end

			local var_152_14 = arg_149_1.actors_["10034"]
			local var_152_15 = 0

			if var_152_15 < arg_149_1.time_ and arg_149_1.time_ <= var_152_15 + arg_152_0 and arg_149_1.var_.actorSpriteComps10034 == nil then
				arg_149_1.var_.actorSpriteComps10034 = var_152_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_16 = 0.2

			if var_152_15 <= arg_149_1.time_ and arg_149_1.time_ < var_152_15 + var_152_16 then
				local var_152_17 = (arg_149_1.time_ - var_152_15) / var_152_16

				if arg_149_1.var_.actorSpriteComps10034 then
					for iter_152_2, iter_152_3 in pairs(arg_149_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_152_3 then
							local var_152_18 = Mathf.Lerp(iter_152_3.color.r, 0.5, var_152_17)

							iter_152_3.color = Color.New(var_152_18, var_152_18, var_152_18)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_15 + var_152_16 and arg_149_1.time_ < var_152_15 + var_152_16 + arg_152_0 and arg_149_1.var_.actorSpriteComps10034 then
				local var_152_19 = 0.5

				for iter_152_4, iter_152_5 in pairs(arg_149_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_152_5 then
						iter_152_5.color = Color.New(var_152_19, var_152_19, var_152_19)
					end
				end

				arg_149_1.var_.actorSpriteComps10034 = nil
			end

			local var_152_20 = arg_149_1.actors_["10035"]
			local var_152_21 = 0

			if var_152_21 < arg_149_1.time_ and arg_149_1.time_ <= var_152_21 + arg_152_0 and arg_149_1.var_.actorSpriteComps10035 == nil then
				arg_149_1.var_.actorSpriteComps10035 = var_152_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_152_22 = 0.2

			if var_152_21 <= arg_149_1.time_ and arg_149_1.time_ < var_152_21 + var_152_22 then
				local var_152_23 = (arg_149_1.time_ - var_152_21) / var_152_22

				if arg_149_1.var_.actorSpriteComps10035 then
					for iter_152_6, iter_152_7 in pairs(arg_149_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_152_7 then
							local var_152_24 = Mathf.Lerp(iter_152_7.color.r, 1, var_152_23)

							iter_152_7.color = Color.New(var_152_24, var_152_24, var_152_24)
						end
					end
				end
			end

			if arg_149_1.time_ >= var_152_21 + var_152_22 and arg_149_1.time_ < var_152_21 + var_152_22 + arg_152_0 and arg_149_1.var_.actorSpriteComps10035 then
				local var_152_25 = 1

				for iter_152_8, iter_152_9 in pairs(arg_149_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_152_9 then
						iter_152_9.color = Color.New(var_152_25, var_152_25, var_152_25)
					end
				end

				arg_149_1.var_.actorSpriteComps10035 = nil
			end

			local var_152_26 = 0
			local var_152_27 = 0.325

			if var_152_26 < arg_149_1.time_ and arg_149_1.time_ <= var_152_26 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_28 = arg_149_1:FormatText(StoryNameCfg[369].name)

				arg_149_1.leftNameTxt_.text = var_152_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_29 = arg_149_1:GetWordFromCfg(117041036)
				local var_152_30 = arg_149_1:FormatText(var_152_29.content)

				arg_149_1.text_.text = var_152_30

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_31 = 13
				local var_152_32 = utf8.len(var_152_30)
				local var_152_33 = var_152_31 <= 0 and var_152_27 or var_152_27 * (var_152_32 / var_152_31)

				if var_152_33 > 0 and var_152_27 < var_152_33 then
					arg_149_1.talkMaxDuration = var_152_33

					if var_152_33 + var_152_26 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_33 + var_152_26
					end
				end

				arg_149_1.text_.text = var_152_30
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041036", "story_v_out_117041.awb") ~= 0 then
					local var_152_34 = manager.audio:GetVoiceLength("story_v_out_117041", "117041036", "story_v_out_117041.awb") / 1000

					if var_152_34 + var_152_26 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_34 + var_152_26
					end

					if var_152_29.prefab_name ~= "" and arg_149_1.actors_[var_152_29.prefab_name] ~= nil then
						local var_152_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_29.prefab_name].transform, "story_v_out_117041", "117041036", "story_v_out_117041.awb")

						arg_149_1:RecordAudio("117041036", var_152_35)
						arg_149_1:RecordAudio("117041036", var_152_35)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_117041", "117041036", "story_v_out_117041.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_117041", "117041036", "story_v_out_117041.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_36 = math.max(var_152_27, arg_149_1.talkMaxDuration)

			if var_152_26 <= arg_149_1.time_ and arg_149_1.time_ < var_152_26 + var_152_36 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_26) / var_152_36

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_26 + var_152_36 and arg_149_1.time_ < var_152_26 + var_152_36 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play117041037 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 117041037
		arg_153_1.duration_ = 7.733

		local var_153_0 = {
			zh = 6.133,
			ja = 7.733
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
				arg_153_0:Play117041038(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = 0
			local var_156_1 = 0.725

			if var_156_0 < arg_153_1.time_ and arg_153_1.time_ <= var_156_0 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_2 = arg_153_1:FormatText(StoryNameCfg[369].name)

				arg_153_1.leftNameTxt_.text = var_156_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_3 = arg_153_1:GetWordFromCfg(117041037)
				local var_156_4 = arg_153_1:FormatText(var_156_3.content)

				arg_153_1.text_.text = var_156_4

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_5 = 29
				local var_156_6 = utf8.len(var_156_4)
				local var_156_7 = var_156_5 <= 0 and var_156_1 or var_156_1 * (var_156_6 / var_156_5)

				if var_156_7 > 0 and var_156_1 < var_156_7 then
					arg_153_1.talkMaxDuration = var_156_7

					if var_156_7 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_7 + var_156_0
					end
				end

				arg_153_1.text_.text = var_156_4
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041037", "story_v_out_117041.awb") ~= 0 then
					local var_156_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041037", "story_v_out_117041.awb") / 1000

					if var_156_8 + var_156_0 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_8 + var_156_0
					end

					if var_156_3.prefab_name ~= "" and arg_153_1.actors_[var_156_3.prefab_name] ~= nil then
						local var_156_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_3.prefab_name].transform, "story_v_out_117041", "117041037", "story_v_out_117041.awb")

						arg_153_1:RecordAudio("117041037", var_156_9)
						arg_153_1:RecordAudio("117041037", var_156_9)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_117041", "117041037", "story_v_out_117041.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_117041", "117041037", "story_v_out_117041.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_10 = math.max(var_156_1, arg_153_1.talkMaxDuration)

			if var_156_0 <= arg_153_1.time_ and arg_153_1.time_ < var_156_0 + var_156_10 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_0) / var_156_10

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_0 + var_156_10 and arg_153_1.time_ < var_156_0 + var_156_10 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play117041038 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 117041038
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play117041039(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10035"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.actorSpriteComps10035 == nil then
				arg_157_1.var_.actorSpriteComps10035 = var_160_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_160_2 = 0.2

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.actorSpriteComps10035 then
					for iter_160_0, iter_160_1 in pairs(arg_157_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_160_1 then
							local var_160_4 = Mathf.Lerp(iter_160_1.color.r, 0.5, var_160_3)

							iter_160_1.color = Color.New(var_160_4, var_160_4, var_160_4)
						end
					end
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.actorSpriteComps10035 then
				local var_160_5 = 0.5

				for iter_160_2, iter_160_3 in pairs(arg_157_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_160_3 then
						iter_160_3.color = Color.New(var_160_5, var_160_5, var_160_5)
					end
				end

				arg_157_1.var_.actorSpriteComps10035 = nil
			end

			local var_160_6 = 0
			local var_160_7 = 0.45

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

				local var_160_8 = arg_157_1:GetWordFromCfg(117041038)
				local var_160_9 = arg_157_1:FormatText(var_160_8.content)

				arg_157_1.text_.text = var_160_9

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_10 = 18
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
	Play117041039 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 117041039
		arg_161_1.duration_ = 6.233

		local var_161_0 = {
			zh = 6.1,
			ja = 6.233
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
				arg_161_0:Play117041040(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["10034"]
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 and arg_161_1.var_.actorSpriteComps10034 == nil then
				arg_161_1.var_.actorSpriteComps10034 = var_164_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_164_2 = 0.2

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2

				if arg_161_1.var_.actorSpriteComps10034 then
					for iter_164_0, iter_164_1 in pairs(arg_161_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_164_1 then
							local var_164_4 = Mathf.Lerp(iter_164_1.color.r, 1, var_164_3)

							iter_164_1.color = Color.New(var_164_4, var_164_4, var_164_4)
						end
					end
				end
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 and arg_161_1.var_.actorSpriteComps10034 then
				local var_164_5 = 1

				for iter_164_2, iter_164_3 in pairs(arg_161_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_164_3 then
						iter_164_3.color = Color.New(var_164_5, var_164_5, var_164_5)
					end
				end

				arg_161_1.var_.actorSpriteComps10034 = nil
			end

			local var_164_6 = arg_161_1.actors_["10034"].transform
			local var_164_7 = 0

			if var_164_7 < arg_161_1.time_ and arg_161_1.time_ <= var_164_7 + arg_164_0 then
				arg_161_1.var_.moveOldPos10034 = var_164_6.localPosition
				var_164_6.localScale = Vector3.New(1, 1, 1)

				arg_161_1:CheckSpriteTmpPos("10034", 2)

				local var_164_8 = var_164_6.childCount

				for iter_164_4 = 0, var_164_8 - 1 do
					local var_164_9 = var_164_6:GetChild(iter_164_4)

					if var_164_9.name == "split_2" or not string.find(var_164_9.name, "split") then
						var_164_9.gameObject:SetActive(true)
					else
						var_164_9.gameObject:SetActive(false)
					end
				end
			end

			local var_164_10 = 0.001

			if var_164_7 <= arg_161_1.time_ and arg_161_1.time_ < var_164_7 + var_164_10 then
				local var_164_11 = (arg_161_1.time_ - var_164_7) / var_164_10
				local var_164_12 = Vector3.New(-390, -415, -290)

				var_164_6.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10034, var_164_12, var_164_11)
			end

			if arg_161_1.time_ >= var_164_7 + var_164_10 and arg_161_1.time_ < var_164_7 + var_164_10 + arg_164_0 then
				var_164_6.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_164_13 = 0
			local var_164_14 = 0.675

			if var_164_13 < arg_161_1.time_ and arg_161_1.time_ <= var_164_13 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_15 = arg_161_1:FormatText(StoryNameCfg[367].name)

				arg_161_1.leftNameTxt_.text = var_164_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_16 = arg_161_1:GetWordFromCfg(117041039)
				local var_164_17 = arg_161_1:FormatText(var_164_16.content)

				arg_161_1.text_.text = var_164_17

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_18 = 27
				local var_164_19 = utf8.len(var_164_17)
				local var_164_20 = var_164_18 <= 0 and var_164_14 or var_164_14 * (var_164_19 / var_164_18)

				if var_164_20 > 0 and var_164_14 < var_164_20 then
					arg_161_1.talkMaxDuration = var_164_20

					if var_164_20 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_20 + var_164_13
					end
				end

				arg_161_1.text_.text = var_164_17
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041039", "story_v_out_117041.awb") ~= 0 then
					local var_164_21 = manager.audio:GetVoiceLength("story_v_out_117041", "117041039", "story_v_out_117041.awb") / 1000

					if var_164_21 + var_164_13 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_21 + var_164_13
					end

					if var_164_16.prefab_name ~= "" and arg_161_1.actors_[var_164_16.prefab_name] ~= nil then
						local var_164_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_16.prefab_name].transform, "story_v_out_117041", "117041039", "story_v_out_117041.awb")

						arg_161_1:RecordAudio("117041039", var_164_22)
						arg_161_1:RecordAudio("117041039", var_164_22)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_117041", "117041039", "story_v_out_117041.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_117041", "117041039", "story_v_out_117041.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_23 = math.max(var_164_14, arg_161_1.talkMaxDuration)

			if var_164_13 <= arg_161_1.time_ and arg_161_1.time_ < var_164_13 + var_164_23 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_13) / var_164_23

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_13 + var_164_23 and arg_161_1.time_ < var_164_13 + var_164_23 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play117041040 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 117041040
		arg_165_1.duration_ = 4.7

		local var_165_0 = {
			zh = 4.7,
			ja = 2.166
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
				arg_165_0:Play117041041(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10034"]
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 and arg_165_1.var_.actorSpriteComps10034 == nil then
				arg_165_1.var_.actorSpriteComps10034 = var_168_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_2 = 0.2

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2

				if arg_165_1.var_.actorSpriteComps10034 then
					for iter_168_0, iter_168_1 in pairs(arg_165_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_168_1 then
							local var_168_4 = Mathf.Lerp(iter_168_1.color.r, 0.5, var_168_3)

							iter_168_1.color = Color.New(var_168_4, var_168_4, var_168_4)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 and arg_165_1.var_.actorSpriteComps10034 then
				local var_168_5 = 0.5

				for iter_168_2, iter_168_3 in pairs(arg_165_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_168_3 then
						iter_168_3.color = Color.New(var_168_5, var_168_5, var_168_5)
					end
				end

				arg_165_1.var_.actorSpriteComps10034 = nil
			end

			local var_168_6 = arg_165_1.actors_["10035"]
			local var_168_7 = 0

			if var_168_7 < arg_165_1.time_ and arg_165_1.time_ <= var_168_7 + arg_168_0 and arg_165_1.var_.actorSpriteComps10035 == nil then
				arg_165_1.var_.actorSpriteComps10035 = var_168_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_168_8 = 0.2

			if var_168_7 <= arg_165_1.time_ and arg_165_1.time_ < var_168_7 + var_168_8 then
				local var_168_9 = (arg_165_1.time_ - var_168_7) / var_168_8

				if arg_165_1.var_.actorSpriteComps10035 then
					for iter_168_4, iter_168_5 in pairs(arg_165_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_168_5 then
							local var_168_10 = Mathf.Lerp(iter_168_5.color.r, 1, var_168_9)

							iter_168_5.color = Color.New(var_168_10, var_168_10, var_168_10)
						end
					end
				end
			end

			if arg_165_1.time_ >= var_168_7 + var_168_8 and arg_165_1.time_ < var_168_7 + var_168_8 + arg_168_0 and arg_165_1.var_.actorSpriteComps10035 then
				local var_168_11 = 1

				for iter_168_6, iter_168_7 in pairs(arg_165_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_168_7 then
						iter_168_7.color = Color.New(var_168_11, var_168_11, var_168_11)
					end
				end

				arg_165_1.var_.actorSpriteComps10035 = nil
			end

			local var_168_12 = 0
			local var_168_13 = 0.475

			if var_168_12 < arg_165_1.time_ and arg_165_1.time_ <= var_168_12 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_14 = arg_165_1:FormatText(StoryNameCfg[369].name)

				arg_165_1.leftNameTxt_.text = var_168_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_15 = arg_165_1:GetWordFromCfg(117041040)
				local var_168_16 = arg_165_1:FormatText(var_168_15.content)

				arg_165_1.text_.text = var_168_16

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_17 = 19
				local var_168_18 = utf8.len(var_168_16)
				local var_168_19 = var_168_17 <= 0 and var_168_13 or var_168_13 * (var_168_18 / var_168_17)

				if var_168_19 > 0 and var_168_13 < var_168_19 then
					arg_165_1.talkMaxDuration = var_168_19

					if var_168_19 + var_168_12 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_19 + var_168_12
					end
				end

				arg_165_1.text_.text = var_168_16
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041040", "story_v_out_117041.awb") ~= 0 then
					local var_168_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041040", "story_v_out_117041.awb") / 1000

					if var_168_20 + var_168_12 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_20 + var_168_12
					end

					if var_168_15.prefab_name ~= "" and arg_165_1.actors_[var_168_15.prefab_name] ~= nil then
						local var_168_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_15.prefab_name].transform, "story_v_out_117041", "117041040", "story_v_out_117041.awb")

						arg_165_1:RecordAudio("117041040", var_168_21)
						arg_165_1:RecordAudio("117041040", var_168_21)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_117041", "117041040", "story_v_out_117041.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_117041", "117041040", "story_v_out_117041.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_22 = math.max(var_168_13, arg_165_1.talkMaxDuration)

			if var_168_12 <= arg_165_1.time_ and arg_165_1.time_ < var_168_12 + var_168_22 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_12) / var_168_22

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_12 + var_168_22 and arg_165_1.time_ < var_168_12 + var_168_22 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play117041041 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 117041041
		arg_169_1.duration_ = 5.866

		local var_169_0 = {
			zh = 5.866,
			ja = 5.466
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
				arg_169_0:Play117041042(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["10034"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos10034 = var_172_0.localPosition
				var_172_0.localScale = Vector3.New(1, 1, 1)

				arg_169_1:CheckSpriteTmpPos("10034", 2)

				local var_172_2 = var_172_0.childCount

				for iter_172_0 = 0, var_172_2 - 1 do
					local var_172_3 = var_172_0:GetChild(iter_172_0)

					if var_172_3.name == "split_2" or not string.find(var_172_3.name, "split") then
						var_172_3.gameObject:SetActive(true)
					else
						var_172_3.gameObject:SetActive(false)
					end
				end
			end

			local var_172_4 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_4 then
				local var_172_5 = (arg_169_1.time_ - var_172_1) / var_172_4
				local var_172_6 = Vector3.New(-390, -415, -290)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos10034, var_172_6, var_172_5)
			end

			if arg_169_1.time_ >= var_172_1 + var_172_4 and arg_169_1.time_ < var_172_1 + var_172_4 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_172_7 = arg_169_1.actors_["10035"]
			local var_172_8 = 0

			if var_172_8 < arg_169_1.time_ and arg_169_1.time_ <= var_172_8 + arg_172_0 and arg_169_1.var_.actorSpriteComps10035 == nil then
				arg_169_1.var_.actorSpriteComps10035 = var_172_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_9 = 0.2

			if var_172_8 <= arg_169_1.time_ and arg_169_1.time_ < var_172_8 + var_172_9 then
				local var_172_10 = (arg_169_1.time_ - var_172_8) / var_172_9

				if arg_169_1.var_.actorSpriteComps10035 then
					for iter_172_1, iter_172_2 in pairs(arg_169_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_172_2 then
							local var_172_11 = Mathf.Lerp(iter_172_2.color.r, 0.5, var_172_10)

							iter_172_2.color = Color.New(var_172_11, var_172_11, var_172_11)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_8 + var_172_9 and arg_169_1.time_ < var_172_8 + var_172_9 + arg_172_0 and arg_169_1.var_.actorSpriteComps10035 then
				local var_172_12 = 0.5

				for iter_172_3, iter_172_4 in pairs(arg_169_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_172_4 then
						iter_172_4.color = Color.New(var_172_12, var_172_12, var_172_12)
					end
				end

				arg_169_1.var_.actorSpriteComps10035 = nil
			end

			local var_172_13 = arg_169_1.actors_["10034"]
			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 and arg_169_1.var_.actorSpriteComps10034 == nil then
				arg_169_1.var_.actorSpriteComps10034 = var_172_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_172_15 = 0.2

			if var_172_14 <= arg_169_1.time_ and arg_169_1.time_ < var_172_14 + var_172_15 then
				local var_172_16 = (arg_169_1.time_ - var_172_14) / var_172_15

				if arg_169_1.var_.actorSpriteComps10034 then
					for iter_172_5, iter_172_6 in pairs(arg_169_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_172_6 then
							local var_172_17 = Mathf.Lerp(iter_172_6.color.r, 1, var_172_16)

							iter_172_6.color = Color.New(var_172_17, var_172_17, var_172_17)
						end
					end
				end
			end

			if arg_169_1.time_ >= var_172_14 + var_172_15 and arg_169_1.time_ < var_172_14 + var_172_15 + arg_172_0 and arg_169_1.var_.actorSpriteComps10034 then
				local var_172_18 = 1

				for iter_172_7, iter_172_8 in pairs(arg_169_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_172_8 then
						iter_172_8.color = Color.New(var_172_18, var_172_18, var_172_18)
					end
				end

				arg_169_1.var_.actorSpriteComps10034 = nil
			end

			local var_172_19 = 0
			local var_172_20 = 0.6

			if var_172_19 < arg_169_1.time_ and arg_169_1.time_ <= var_172_19 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_21 = arg_169_1:FormatText(StoryNameCfg[367].name)

				arg_169_1.leftNameTxt_.text = var_172_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_22 = arg_169_1:GetWordFromCfg(117041041)
				local var_172_23 = arg_169_1:FormatText(var_172_22.content)

				arg_169_1.text_.text = var_172_23

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_24 = 24
				local var_172_25 = utf8.len(var_172_23)
				local var_172_26 = var_172_24 <= 0 and var_172_20 or var_172_20 * (var_172_25 / var_172_24)

				if var_172_26 > 0 and var_172_20 < var_172_26 then
					arg_169_1.talkMaxDuration = var_172_26

					if var_172_26 + var_172_19 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_26 + var_172_19
					end
				end

				arg_169_1.text_.text = var_172_23
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041041", "story_v_out_117041.awb") ~= 0 then
					local var_172_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041041", "story_v_out_117041.awb") / 1000

					if var_172_27 + var_172_19 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_27 + var_172_19
					end

					if var_172_22.prefab_name ~= "" and arg_169_1.actors_[var_172_22.prefab_name] ~= nil then
						local var_172_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_22.prefab_name].transform, "story_v_out_117041", "117041041", "story_v_out_117041.awb")

						arg_169_1:RecordAudio("117041041", var_172_28)
						arg_169_1:RecordAudio("117041041", var_172_28)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_117041", "117041041", "story_v_out_117041.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_117041", "117041041", "story_v_out_117041.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_29 = math.max(var_172_20, arg_169_1.talkMaxDuration)

			if var_172_19 <= arg_169_1.time_ and arg_169_1.time_ < var_172_19 + var_172_29 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_19) / var_172_29

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_19 + var_172_29 and arg_169_1.time_ < var_172_19 + var_172_29 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play117041042 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 117041042
		arg_173_1.duration_ = 11.5

		local var_173_0 = {
			zh = 11.5,
			ja = 4.2
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
				arg_173_0:Play117041043(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["10034"]
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 and arg_173_1.var_.actorSpriteComps10034 == nil then
				arg_173_1.var_.actorSpriteComps10034 = var_176_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_2 = 0.2

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2

				if arg_173_1.var_.actorSpriteComps10034 then
					for iter_176_0, iter_176_1 in pairs(arg_173_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_176_1 then
							local var_176_4 = Mathf.Lerp(iter_176_1.color.r, 0.5, var_176_3)

							iter_176_1.color = Color.New(var_176_4, var_176_4, var_176_4)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 and arg_173_1.var_.actorSpriteComps10034 then
				local var_176_5 = 0.5

				for iter_176_2, iter_176_3 in pairs(arg_173_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_176_3 then
						iter_176_3.color = Color.New(var_176_5, var_176_5, var_176_5)
					end
				end

				arg_173_1.var_.actorSpriteComps10034 = nil
			end

			local var_176_6 = arg_173_1.actors_["10035"].transform
			local var_176_7 = 0

			if var_176_7 < arg_173_1.time_ and arg_173_1.time_ <= var_176_7 + arg_176_0 then
				arg_173_1.var_.moveOldPos10035 = var_176_6.localPosition
				var_176_6.localScale = Vector3.New(1, 1, 1)

				arg_173_1:CheckSpriteTmpPos("10035", 4)

				local var_176_8 = var_176_6.childCount

				for iter_176_4 = 0, var_176_8 - 1 do
					local var_176_9 = var_176_6:GetChild(iter_176_4)

					if var_176_9.name == "split_4" or not string.find(var_176_9.name, "split") then
						var_176_9.gameObject:SetActive(true)
					else
						var_176_9.gameObject:SetActive(false)
					end
				end
			end

			local var_176_10 = 0.001

			if var_176_7 <= arg_173_1.time_ and arg_173_1.time_ < var_176_7 + var_176_10 then
				local var_176_11 = (arg_173_1.time_ - var_176_7) / var_176_10
				local var_176_12 = Vector3.New(390, -410, -235)

				var_176_6.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos10035, var_176_12, var_176_11)
			end

			if arg_173_1.time_ >= var_176_7 + var_176_10 and arg_173_1.time_ < var_176_7 + var_176_10 + arg_176_0 then
				var_176_6.localPosition = Vector3.New(390, -410, -235)
			end

			local var_176_13 = arg_173_1.actors_["10035"]
			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 and arg_173_1.var_.actorSpriteComps10035 == nil then
				arg_173_1.var_.actorSpriteComps10035 = var_176_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_176_15 = 0.2

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15

				if arg_173_1.var_.actorSpriteComps10035 then
					for iter_176_5, iter_176_6 in pairs(arg_173_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_176_6 then
							local var_176_17 = Mathf.Lerp(iter_176_6.color.r, 1, var_176_16)

							iter_176_6.color = Color.New(var_176_17, var_176_17, var_176_17)
						end
					end
				end
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 and arg_173_1.var_.actorSpriteComps10035 then
				local var_176_18 = 1

				for iter_176_7, iter_176_8 in pairs(arg_173_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_176_8 then
						iter_176_8.color = Color.New(var_176_18, var_176_18, var_176_18)
					end
				end

				arg_173_1.var_.actorSpriteComps10035 = nil
			end

			local var_176_19 = 0
			local var_176_20 = 1.075

			if var_176_19 < arg_173_1.time_ and arg_173_1.time_ <= var_176_19 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_21 = arg_173_1:FormatText(StoryNameCfg[369].name)

				arg_173_1.leftNameTxt_.text = var_176_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_22 = arg_173_1:GetWordFromCfg(117041042)
				local var_176_23 = arg_173_1:FormatText(var_176_22.content)

				arg_173_1.text_.text = var_176_23

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_24 = 42
				local var_176_25 = utf8.len(var_176_23)
				local var_176_26 = var_176_24 <= 0 and var_176_20 or var_176_20 * (var_176_25 / var_176_24)

				if var_176_26 > 0 and var_176_20 < var_176_26 then
					arg_173_1.talkMaxDuration = var_176_26

					if var_176_26 + var_176_19 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_26 + var_176_19
					end
				end

				arg_173_1.text_.text = var_176_23
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041042", "story_v_out_117041.awb") ~= 0 then
					local var_176_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041042", "story_v_out_117041.awb") / 1000

					if var_176_27 + var_176_19 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_27 + var_176_19
					end

					if var_176_22.prefab_name ~= "" and arg_173_1.actors_[var_176_22.prefab_name] ~= nil then
						local var_176_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_22.prefab_name].transform, "story_v_out_117041", "117041042", "story_v_out_117041.awb")

						arg_173_1:RecordAudio("117041042", var_176_28)
						arg_173_1:RecordAudio("117041042", var_176_28)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_117041", "117041042", "story_v_out_117041.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_117041", "117041042", "story_v_out_117041.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_29 = math.max(var_176_20, arg_173_1.talkMaxDuration)

			if var_176_19 <= arg_173_1.time_ and arg_173_1.time_ < var_176_19 + var_176_29 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_19) / var_176_29

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_19 + var_176_29 and arg_173_1.time_ < var_176_19 + var_176_29 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play117041043 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 117041043
		arg_177_1.duration_ = 5

		local var_177_0 = {
			zh = 5,
			ja = 4.7
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
				arg_177_0:Play117041044(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["10034"]
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 and arg_177_1.var_.actorSpriteComps10034 == nil then
				arg_177_1.var_.actorSpriteComps10034 = var_180_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_180_2 = 0.2

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2

				if arg_177_1.var_.actorSpriteComps10034 then
					for iter_180_0, iter_180_1 in pairs(arg_177_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_180_1 then
							local var_180_4 = Mathf.Lerp(iter_180_1.color.r, 1, var_180_3)

							iter_180_1.color = Color.New(var_180_4, var_180_4, var_180_4)
						end
					end
				end
			end

			if arg_177_1.time_ >= var_180_1 + var_180_2 and arg_177_1.time_ < var_180_1 + var_180_2 + arg_180_0 and arg_177_1.var_.actorSpriteComps10034 then
				local var_180_5 = 1

				for iter_180_2, iter_180_3 in pairs(arg_177_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_180_3 then
						iter_180_3.color = Color.New(var_180_5, var_180_5, var_180_5)
					end
				end

				arg_177_1.var_.actorSpriteComps10034 = nil
			end

			local var_180_6 = 0
			local var_180_7 = 0.575

			if var_180_6 < arg_177_1.time_ and arg_177_1.time_ <= var_180_6 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, true)

				local var_180_8 = arg_177_1:FormatText(StoryNameCfg[369].name)

				arg_177_1.leftNameTxt_.text = var_180_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_177_1.leftNameTxt_.transform)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1.leftNameTxt_.text)
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_9 = arg_177_1:GetWordFromCfg(117041043)
				local var_180_10 = arg_177_1:FormatText(var_180_9.content)

				arg_177_1.text_.text = var_180_10

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_11 = 23
				local var_180_12 = utf8.len(var_180_10)
				local var_180_13 = var_180_11 <= 0 and var_180_7 or var_180_7 * (var_180_12 / var_180_11)

				if var_180_13 > 0 and var_180_7 < var_180_13 then
					arg_177_1.talkMaxDuration = var_180_13

					if var_180_13 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_13 + var_180_6
					end
				end

				arg_177_1.text_.text = var_180_10
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041043", "story_v_out_117041.awb") ~= 0 then
					local var_180_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041043", "story_v_out_117041.awb") / 1000

					if var_180_14 + var_180_6 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_14 + var_180_6
					end

					if var_180_9.prefab_name ~= "" and arg_177_1.actors_[var_180_9.prefab_name] ~= nil then
						local var_180_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_177_1.actors_[var_180_9.prefab_name].transform, "story_v_out_117041", "117041043", "story_v_out_117041.awb")

						arg_177_1:RecordAudio("117041043", var_180_15)
						arg_177_1:RecordAudio("117041043", var_180_15)
					else
						arg_177_1:AudioAction("play", "voice", "story_v_out_117041", "117041043", "story_v_out_117041.awb")
					end

					arg_177_1:RecordHistoryTalkVoice("story_v_out_117041", "117041043", "story_v_out_117041.awb")
				end

				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_16 = math.max(var_180_7, arg_177_1.talkMaxDuration)

			if var_180_6 <= arg_177_1.time_ and arg_177_1.time_ < var_180_6 + var_180_16 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_6) / var_180_16

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_6 + var_180_16 and arg_177_1.time_ < var_180_6 + var_180_16 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play117041044 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 117041044
		arg_181_1.duration_ = 7.066

		local var_181_0 = {
			zh = 4.8,
			ja = 7.066
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
				arg_181_0:Play117041045(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["10034"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos10034 = var_184_0.localPosition
				var_184_0.localScale = Vector3.New(1, 1, 1)

				arg_181_1:CheckSpriteTmpPos("10034", 2)

				local var_184_2 = var_184_0.childCount

				for iter_184_0 = 0, var_184_2 - 1 do
					local var_184_3 = var_184_0:GetChild(iter_184_0)

					if var_184_3.name == "split_5" or not string.find(var_184_3.name, "split") then
						var_184_3.gameObject:SetActive(true)
					else
						var_184_3.gameObject:SetActive(false)
					end
				end
			end

			local var_184_4 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_4 then
				local var_184_5 = (arg_181_1.time_ - var_184_1) / var_184_4
				local var_184_6 = Vector3.New(-390, -415, -290)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos10034, var_184_6, var_184_5)
			end

			if arg_181_1.time_ >= var_184_1 + var_184_4 and arg_181_1.time_ < var_184_1 + var_184_4 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_184_7 = arg_181_1.actors_["10035"]
			local var_184_8 = 0

			if var_184_8 < arg_181_1.time_ and arg_181_1.time_ <= var_184_8 + arg_184_0 and arg_181_1.var_.actorSpriteComps10035 == nil then
				arg_181_1.var_.actorSpriteComps10035 = var_184_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_9 = 0.2

			if var_184_8 <= arg_181_1.time_ and arg_181_1.time_ < var_184_8 + var_184_9 then
				local var_184_10 = (arg_181_1.time_ - var_184_8) / var_184_9

				if arg_181_1.var_.actorSpriteComps10035 then
					for iter_184_1, iter_184_2 in pairs(arg_181_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_184_2 then
							local var_184_11 = Mathf.Lerp(iter_184_2.color.r, 0.5, var_184_10)

							iter_184_2.color = Color.New(var_184_11, var_184_11, var_184_11)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_8 + var_184_9 and arg_181_1.time_ < var_184_8 + var_184_9 + arg_184_0 and arg_181_1.var_.actorSpriteComps10035 then
				local var_184_12 = 0.5

				for iter_184_3, iter_184_4 in pairs(arg_181_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_184_4 then
						iter_184_4.color = Color.New(var_184_12, var_184_12, var_184_12)
					end
				end

				arg_181_1.var_.actorSpriteComps10035 = nil
			end

			local var_184_13 = arg_181_1.actors_["10034"]
			local var_184_14 = 0

			if var_184_14 < arg_181_1.time_ and arg_181_1.time_ <= var_184_14 + arg_184_0 and arg_181_1.var_.actorSpriteComps10034 == nil then
				arg_181_1.var_.actorSpriteComps10034 = var_184_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_184_15 = 0.2

			if var_184_14 <= arg_181_1.time_ and arg_181_1.time_ < var_184_14 + var_184_15 then
				local var_184_16 = (arg_181_1.time_ - var_184_14) / var_184_15

				if arg_181_1.var_.actorSpriteComps10034 then
					for iter_184_5, iter_184_6 in pairs(arg_181_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_184_6 then
							local var_184_17 = Mathf.Lerp(iter_184_6.color.r, 1, var_184_16)

							iter_184_6.color = Color.New(var_184_17, var_184_17, var_184_17)
						end
					end
				end
			end

			if arg_181_1.time_ >= var_184_14 + var_184_15 and arg_181_1.time_ < var_184_14 + var_184_15 + arg_184_0 and arg_181_1.var_.actorSpriteComps10034 then
				local var_184_18 = 1

				for iter_184_7, iter_184_8 in pairs(arg_181_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_184_8 then
						iter_184_8.color = Color.New(var_184_18, var_184_18, var_184_18)
					end
				end

				arg_181_1.var_.actorSpriteComps10034 = nil
			end

			local var_184_19 = 0
			local var_184_20 = 0.525

			if var_184_19 < arg_181_1.time_ and arg_181_1.time_ <= var_184_19 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_21 = arg_181_1:FormatText(StoryNameCfg[367].name)

				arg_181_1.leftNameTxt_.text = var_184_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_22 = arg_181_1:GetWordFromCfg(117041044)
				local var_184_23 = arg_181_1:FormatText(var_184_22.content)

				arg_181_1.text_.text = var_184_23

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_24 = 21
				local var_184_25 = utf8.len(var_184_23)
				local var_184_26 = var_184_24 <= 0 and var_184_20 or var_184_20 * (var_184_25 / var_184_24)

				if var_184_26 > 0 and var_184_20 < var_184_26 then
					arg_181_1.talkMaxDuration = var_184_26

					if var_184_26 + var_184_19 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_26 + var_184_19
					end
				end

				arg_181_1.text_.text = var_184_23
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041044", "story_v_out_117041.awb") ~= 0 then
					local var_184_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041044", "story_v_out_117041.awb") / 1000

					if var_184_27 + var_184_19 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_27 + var_184_19
					end

					if var_184_22.prefab_name ~= "" and arg_181_1.actors_[var_184_22.prefab_name] ~= nil then
						local var_184_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_22.prefab_name].transform, "story_v_out_117041", "117041044", "story_v_out_117041.awb")

						arg_181_1:RecordAudio("117041044", var_184_28)
						arg_181_1:RecordAudio("117041044", var_184_28)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_117041", "117041044", "story_v_out_117041.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_117041", "117041044", "story_v_out_117041.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_29 = math.max(var_184_20, arg_181_1.talkMaxDuration)

			if var_184_19 <= arg_181_1.time_ and arg_181_1.time_ < var_184_19 + var_184_29 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_19) / var_184_29

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_19 + var_184_29 and arg_181_1.time_ < var_184_19 + var_184_29 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play117041045 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 117041045
		arg_185_1.duration_ = 6.233

		local var_185_0 = {
			zh = 6.233,
			ja = 5.3
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
				arg_185_0:Play117041046(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = arg_185_1.actors_["10034"]
			local var_188_1 = 0

			if var_188_1 < arg_185_1.time_ and arg_185_1.time_ <= var_188_1 + arg_188_0 and arg_185_1.var_.actorSpriteComps10034 == nil then
				arg_185_1.var_.actorSpriteComps10034 = var_188_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_2 = 0.2

			if var_188_1 <= arg_185_1.time_ and arg_185_1.time_ < var_188_1 + var_188_2 then
				local var_188_3 = (arg_185_1.time_ - var_188_1) / var_188_2

				if arg_185_1.var_.actorSpriteComps10034 then
					for iter_188_0, iter_188_1 in pairs(arg_185_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_188_1 then
							local var_188_4 = Mathf.Lerp(iter_188_1.color.r, 0.5, var_188_3)

							iter_188_1.color = Color.New(var_188_4, var_188_4, var_188_4)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_1 + var_188_2 and arg_185_1.time_ < var_188_1 + var_188_2 + arg_188_0 and arg_185_1.var_.actorSpriteComps10034 then
				local var_188_5 = 0.5

				for iter_188_2, iter_188_3 in pairs(arg_185_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_188_3 then
						iter_188_3.color = Color.New(var_188_5, var_188_5, var_188_5)
					end
				end

				arg_185_1.var_.actorSpriteComps10034 = nil
			end

			local var_188_6 = arg_185_1.actors_["10035"]
			local var_188_7 = 0

			if var_188_7 < arg_185_1.time_ and arg_185_1.time_ <= var_188_7 + arg_188_0 and arg_185_1.var_.actorSpriteComps10035 == nil then
				arg_185_1.var_.actorSpriteComps10035 = var_188_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_188_8 = 0.2

			if var_188_7 <= arg_185_1.time_ and arg_185_1.time_ < var_188_7 + var_188_8 then
				local var_188_9 = (arg_185_1.time_ - var_188_7) / var_188_8

				if arg_185_1.var_.actorSpriteComps10035 then
					for iter_188_4, iter_188_5 in pairs(arg_185_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_188_5 then
							local var_188_10 = Mathf.Lerp(iter_188_5.color.r, 1, var_188_9)

							iter_188_5.color = Color.New(var_188_10, var_188_10, var_188_10)
						end
					end
				end
			end

			if arg_185_1.time_ >= var_188_7 + var_188_8 and arg_185_1.time_ < var_188_7 + var_188_8 + arg_188_0 and arg_185_1.var_.actorSpriteComps10035 then
				local var_188_11 = 1

				for iter_188_6, iter_188_7 in pairs(arg_185_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_188_7 then
						iter_188_7.color = Color.New(var_188_11, var_188_11, var_188_11)
					end
				end

				arg_185_1.var_.actorSpriteComps10035 = nil
			end

			local var_188_12 = 0
			local var_188_13 = 0.7

			if var_188_12 < arg_185_1.time_ and arg_185_1.time_ <= var_188_12 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_14 = arg_185_1:FormatText(StoryNameCfg[369].name)

				arg_185_1.leftNameTxt_.text = var_188_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_15 = arg_185_1:GetWordFromCfg(117041045)
				local var_188_16 = arg_185_1:FormatText(var_188_15.content)

				arg_185_1.text_.text = var_188_16

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_17 = 28
				local var_188_18 = utf8.len(var_188_16)
				local var_188_19 = var_188_17 <= 0 and var_188_13 or var_188_13 * (var_188_18 / var_188_17)

				if var_188_19 > 0 and var_188_13 < var_188_19 then
					arg_185_1.talkMaxDuration = var_188_19

					if var_188_19 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_19 + var_188_12
					end
				end

				arg_185_1.text_.text = var_188_16
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041045", "story_v_out_117041.awb") ~= 0 then
					local var_188_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041045", "story_v_out_117041.awb") / 1000

					if var_188_20 + var_188_12 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_20 + var_188_12
					end

					if var_188_15.prefab_name ~= "" and arg_185_1.actors_[var_188_15.prefab_name] ~= nil then
						local var_188_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_15.prefab_name].transform, "story_v_out_117041", "117041045", "story_v_out_117041.awb")

						arg_185_1:RecordAudio("117041045", var_188_21)
						arg_185_1:RecordAudio("117041045", var_188_21)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_117041", "117041045", "story_v_out_117041.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_117041", "117041045", "story_v_out_117041.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_22 = math.max(var_188_13, arg_185_1.talkMaxDuration)

			if var_188_12 <= arg_185_1.time_ and arg_185_1.time_ < var_188_12 + var_188_22 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_12) / var_188_22

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_12 + var_188_22 and arg_185_1.time_ < var_188_12 + var_188_22 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play117041046 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 117041046
		arg_189_1.duration_ = 13.666

		local var_189_0 = {
			zh = 9.8,
			ja = 13.666
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
				arg_189_0:Play117041047(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = arg_189_1.actors_["10034"]
			local var_192_1 = 0

			if var_192_1 < arg_189_1.time_ and arg_189_1.time_ <= var_192_1 + arg_192_0 and arg_189_1.var_.actorSpriteComps10034 == nil then
				arg_189_1.var_.actorSpriteComps10034 = var_192_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_2 = 0.2

			if var_192_1 <= arg_189_1.time_ and arg_189_1.time_ < var_192_1 + var_192_2 then
				local var_192_3 = (arg_189_1.time_ - var_192_1) / var_192_2

				if arg_189_1.var_.actorSpriteComps10034 then
					for iter_192_0, iter_192_1 in pairs(arg_189_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_192_1 then
							local var_192_4 = Mathf.Lerp(iter_192_1.color.r, 1, var_192_3)

							iter_192_1.color = Color.New(var_192_4, var_192_4, var_192_4)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_1 + var_192_2 and arg_189_1.time_ < var_192_1 + var_192_2 + arg_192_0 and arg_189_1.var_.actorSpriteComps10034 then
				local var_192_5 = 1

				for iter_192_2, iter_192_3 in pairs(arg_189_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_192_3 then
						iter_192_3.color = Color.New(var_192_5, var_192_5, var_192_5)
					end
				end

				arg_189_1.var_.actorSpriteComps10034 = nil
			end

			local var_192_6 = arg_189_1.actors_["10035"]
			local var_192_7 = 0

			if var_192_7 < arg_189_1.time_ and arg_189_1.time_ <= var_192_7 + arg_192_0 and arg_189_1.var_.actorSpriteComps10035 == nil then
				arg_189_1.var_.actorSpriteComps10035 = var_192_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_192_8 = 0.2

			if var_192_7 <= arg_189_1.time_ and arg_189_1.time_ < var_192_7 + var_192_8 then
				local var_192_9 = (arg_189_1.time_ - var_192_7) / var_192_8

				if arg_189_1.var_.actorSpriteComps10035 then
					for iter_192_4, iter_192_5 in pairs(arg_189_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_192_5 then
							local var_192_10 = Mathf.Lerp(iter_192_5.color.r, 0.5, var_192_9)

							iter_192_5.color = Color.New(var_192_10, var_192_10, var_192_10)
						end
					end
				end
			end

			if arg_189_1.time_ >= var_192_7 + var_192_8 and arg_189_1.time_ < var_192_7 + var_192_8 + arg_192_0 and arg_189_1.var_.actorSpriteComps10035 then
				local var_192_11 = 0.5

				for iter_192_6, iter_192_7 in pairs(arg_189_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_192_7 then
						iter_192_7.color = Color.New(var_192_11, var_192_11, var_192_11)
					end
				end

				arg_189_1.var_.actorSpriteComps10035 = nil
			end

			local var_192_12 = arg_189_1.actors_["10034"].transform
			local var_192_13 = 0

			if var_192_13 < arg_189_1.time_ and arg_189_1.time_ <= var_192_13 + arg_192_0 then
				arg_189_1.var_.moveOldPos10034 = var_192_12.localPosition
				var_192_12.localScale = Vector3.New(1, 1, 1)

				arg_189_1:CheckSpriteTmpPos("10034", 2)

				local var_192_14 = var_192_12.childCount

				for iter_192_8 = 0, var_192_14 - 1 do
					local var_192_15 = var_192_12:GetChild(iter_192_8)

					if var_192_15.name == "split_2" or not string.find(var_192_15.name, "split") then
						var_192_15.gameObject:SetActive(true)
					else
						var_192_15.gameObject:SetActive(false)
					end
				end
			end

			local var_192_16 = 0.001

			if var_192_13 <= arg_189_1.time_ and arg_189_1.time_ < var_192_13 + var_192_16 then
				local var_192_17 = (arg_189_1.time_ - var_192_13) / var_192_16
				local var_192_18 = Vector3.New(-390, -415, -290)

				var_192_12.localPosition = Vector3.Lerp(arg_189_1.var_.moveOldPos10034, var_192_18, var_192_17)
			end

			if arg_189_1.time_ >= var_192_13 + var_192_16 and arg_189_1.time_ < var_192_13 + var_192_16 + arg_192_0 then
				var_192_12.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_192_19 = 0
			local var_192_20 = 0.95

			if var_192_19 < arg_189_1.time_ and arg_189_1.time_ <= var_192_19 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_21 = arg_189_1:FormatText(StoryNameCfg[367].name)

				arg_189_1.leftNameTxt_.text = var_192_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_22 = arg_189_1:GetWordFromCfg(117041046)
				local var_192_23 = arg_189_1:FormatText(var_192_22.content)

				arg_189_1.text_.text = var_192_23

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_24 = 38
				local var_192_25 = utf8.len(var_192_23)
				local var_192_26 = var_192_24 <= 0 and var_192_20 or var_192_20 * (var_192_25 / var_192_24)

				if var_192_26 > 0 and var_192_20 < var_192_26 then
					arg_189_1.talkMaxDuration = var_192_26

					if var_192_26 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_26 + var_192_19
					end
				end

				arg_189_1.text_.text = var_192_23
				arg_189_1.typewritter.percent = 0

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041046", "story_v_out_117041.awb") ~= 0 then
					local var_192_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041046", "story_v_out_117041.awb") / 1000

					if var_192_27 + var_192_19 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_27 + var_192_19
					end

					if var_192_22.prefab_name ~= "" and arg_189_1.actors_[var_192_22.prefab_name] ~= nil then
						local var_192_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_22.prefab_name].transform, "story_v_out_117041", "117041046", "story_v_out_117041.awb")

						arg_189_1:RecordAudio("117041046", var_192_28)
						arg_189_1:RecordAudio("117041046", var_192_28)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_117041", "117041046", "story_v_out_117041.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_117041", "117041046", "story_v_out_117041.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_29 = math.max(var_192_20, arg_189_1.talkMaxDuration)

			if var_192_19 <= arg_189_1.time_ and arg_189_1.time_ < var_192_19 + var_192_29 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_19) / var_192_29

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_19 + var_192_29 and arg_189_1.time_ < var_192_19 + var_192_29 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play117041047 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 117041047
		arg_193_1.duration_ = 2.266

		local var_193_0 = {
			zh = 2,
			ja = 2.266
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
				arg_193_0:Play117041048(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = arg_193_1.actors_["10034"]
			local var_196_1 = 0

			if var_196_1 < arg_193_1.time_ and arg_193_1.time_ <= var_196_1 + arg_196_0 and arg_193_1.var_.actorSpriteComps10034 == nil then
				arg_193_1.var_.actorSpriteComps10034 = var_196_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_196_2 = 0.2

			if var_196_1 <= arg_193_1.time_ and arg_193_1.time_ < var_196_1 + var_196_2 then
				local var_196_3 = (arg_193_1.time_ - var_196_1) / var_196_2

				if arg_193_1.var_.actorSpriteComps10034 then
					for iter_196_0, iter_196_1 in pairs(arg_193_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_196_1 then
							local var_196_4 = Mathf.Lerp(iter_196_1.color.r, 0.5, var_196_3)

							iter_196_1.color = Color.New(var_196_4, var_196_4, var_196_4)
						end
					end
				end
			end

			if arg_193_1.time_ >= var_196_1 + var_196_2 and arg_193_1.time_ < var_196_1 + var_196_2 + arg_196_0 and arg_193_1.var_.actorSpriteComps10034 then
				local var_196_5 = 0.5

				for iter_196_2, iter_196_3 in pairs(arg_193_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_196_3 then
						iter_196_3.color = Color.New(var_196_5, var_196_5, var_196_5)
					end
				end

				arg_193_1.var_.actorSpriteComps10034 = nil
			end

			local var_196_6 = 0
			local var_196_7 = 0.275

			if var_196_6 < arg_193_1.time_ and arg_193_1.time_ <= var_196_6 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_8 = arg_193_1:FormatText(StoryNameCfg[61].name)

				arg_193_1.leftNameTxt_.text = var_196_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, true)
				arg_193_1.iconController_:SetSelectedState("hero")

				arg_193_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1132_split_2")

				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_9 = arg_193_1:GetWordFromCfg(117041047)
				local var_196_10 = arg_193_1:FormatText(var_196_9.content)

				arg_193_1.text_.text = var_196_10

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_11 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041047", "story_v_out_117041.awb") ~= 0 then
					local var_196_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041047", "story_v_out_117041.awb") / 1000

					if var_196_14 + var_196_6 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_14 + var_196_6
					end

					if var_196_9.prefab_name ~= "" and arg_193_1.actors_[var_196_9.prefab_name] ~= nil then
						local var_196_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_9.prefab_name].transform, "story_v_out_117041", "117041047", "story_v_out_117041.awb")

						arg_193_1:RecordAudio("117041047", var_196_15)
						arg_193_1:RecordAudio("117041047", var_196_15)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_117041", "117041047", "story_v_out_117041.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_117041", "117041047", "story_v_out_117041.awb")
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
	Play117041048 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 117041048
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play117041049(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = 0
			local var_200_1 = 0.8

			if var_200_0 < arg_197_1.time_ and arg_197_1.time_ <= var_200_0 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_2 = arg_197_1:GetWordFromCfg(117041048)
				local var_200_3 = arg_197_1:FormatText(var_200_2.content)

				arg_197_1.text_.text = var_200_3

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_4 = 32
				local var_200_5 = utf8.len(var_200_3)
				local var_200_6 = var_200_4 <= 0 and var_200_1 or var_200_1 * (var_200_5 / var_200_4)

				if var_200_6 > 0 and var_200_1 < var_200_6 then
					arg_197_1.talkMaxDuration = var_200_6

					if var_200_6 + var_200_0 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_6 + var_200_0
					end
				end

				arg_197_1.text_.text = var_200_3
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_7 = math.max(var_200_1, arg_197_1.talkMaxDuration)

			if var_200_0 <= arg_197_1.time_ and arg_197_1.time_ < var_200_0 + var_200_7 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_0) / var_200_7

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_0 + var_200_7 and arg_197_1.time_ < var_200_0 + var_200_7 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play117041049 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 117041049
		arg_201_1.duration_ = 4.966

		local var_201_0 = {
			zh = 1.533,
			ja = 4.966
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
				arg_201_0:Play117041050(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["10034"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos10034 = var_204_0.localPosition
				var_204_0.localScale = Vector3.New(1, 1, 1)

				arg_201_1:CheckSpriteTmpPos("10034", 2)

				local var_204_2 = var_204_0.childCount

				for iter_204_0 = 0, var_204_2 - 1 do
					local var_204_3 = var_204_0:GetChild(iter_204_0)

					if var_204_3.name == "split_1" or not string.find(var_204_3.name, "split") then
						var_204_3.gameObject:SetActive(true)
					else
						var_204_3.gameObject:SetActive(false)
					end
				end
			end

			local var_204_4 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_4 then
				local var_204_5 = (arg_201_1.time_ - var_204_1) / var_204_4
				local var_204_6 = Vector3.New(-390, -415, -290)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos10034, var_204_6, var_204_5)
			end

			if arg_201_1.time_ >= var_204_1 + var_204_4 and arg_201_1.time_ < var_204_1 + var_204_4 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_204_7 = arg_201_1.actors_["10034"]
			local var_204_8 = 0

			if var_204_8 < arg_201_1.time_ and arg_201_1.time_ <= var_204_8 + arg_204_0 and arg_201_1.var_.actorSpriteComps10034 == nil then
				arg_201_1.var_.actorSpriteComps10034 = var_204_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_204_9 = 0.2

			if var_204_8 <= arg_201_1.time_ and arg_201_1.time_ < var_204_8 + var_204_9 then
				local var_204_10 = (arg_201_1.time_ - var_204_8) / var_204_9

				if arg_201_1.var_.actorSpriteComps10034 then
					for iter_204_1, iter_204_2 in pairs(arg_201_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_204_2 then
							local var_204_11 = Mathf.Lerp(iter_204_2.color.r, 1, var_204_10)

							iter_204_2.color = Color.New(var_204_11, var_204_11, var_204_11)
						end
					end
				end
			end

			if arg_201_1.time_ >= var_204_8 + var_204_9 and arg_201_1.time_ < var_204_8 + var_204_9 + arg_204_0 and arg_201_1.var_.actorSpriteComps10034 then
				local var_204_12 = 1

				for iter_204_3, iter_204_4 in pairs(arg_201_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_204_4 then
						iter_204_4.color = Color.New(var_204_12, var_204_12, var_204_12)
					end
				end

				arg_201_1.var_.actorSpriteComps10034 = nil
			end

			local var_204_13 = 0
			local var_204_14 = 0.15

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_15 = arg_201_1:FormatText(StoryNameCfg[367].name)

				arg_201_1.leftNameTxt_.text = var_204_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_16 = arg_201_1:GetWordFromCfg(117041049)
				local var_204_17 = arg_201_1:FormatText(var_204_16.content)

				arg_201_1.text_.text = var_204_17

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_18 = 6
				local var_204_19 = utf8.len(var_204_17)
				local var_204_20 = var_204_18 <= 0 and var_204_14 or var_204_14 * (var_204_19 / var_204_18)

				if var_204_20 > 0 and var_204_14 < var_204_20 then
					arg_201_1.talkMaxDuration = var_204_20

					if var_204_20 + var_204_13 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_20 + var_204_13
					end
				end

				arg_201_1.text_.text = var_204_17
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041049", "story_v_out_117041.awb") ~= 0 then
					local var_204_21 = manager.audio:GetVoiceLength("story_v_out_117041", "117041049", "story_v_out_117041.awb") / 1000

					if var_204_21 + var_204_13 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_21 + var_204_13
					end

					if var_204_16.prefab_name ~= "" and arg_201_1.actors_[var_204_16.prefab_name] ~= nil then
						local var_204_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_16.prefab_name].transform, "story_v_out_117041", "117041049", "story_v_out_117041.awb")

						arg_201_1:RecordAudio("117041049", var_204_22)
						arg_201_1:RecordAudio("117041049", var_204_22)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_117041", "117041049", "story_v_out_117041.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_117041", "117041049", "story_v_out_117041.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_23 = math.max(var_204_14, arg_201_1.talkMaxDuration)

			if var_204_13 <= arg_201_1.time_ and arg_201_1.time_ < var_204_13 + var_204_23 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_13) / var_204_23

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_13 + var_204_23 and arg_201_1.time_ < var_204_13 + var_204_23 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play117041050 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 117041050
		arg_205_1.duration_ = 1.833

		local var_205_0 = {
			zh = 1.833,
			ja = 1.3
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
				arg_205_0:Play117041051(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["10034"]
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 and arg_205_1.var_.actorSpriteComps10034 == nil then
				arg_205_1.var_.actorSpriteComps10034 = var_208_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_2 = 0.2

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2

				if arg_205_1.var_.actorSpriteComps10034 then
					for iter_208_0, iter_208_1 in pairs(arg_205_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_208_1 then
							local var_208_4 = Mathf.Lerp(iter_208_1.color.r, 0.5, var_208_3)

							iter_208_1.color = Color.New(var_208_4, var_208_4, var_208_4)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 and arg_205_1.var_.actorSpriteComps10034 then
				local var_208_5 = 0.5

				for iter_208_2, iter_208_3 in pairs(arg_205_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_208_3 then
						iter_208_3.color = Color.New(var_208_5, var_208_5, var_208_5)
					end
				end

				arg_205_1.var_.actorSpriteComps10034 = nil
			end

			local var_208_6 = arg_205_1.actors_["10035"].transform
			local var_208_7 = 0

			if var_208_7 < arg_205_1.time_ and arg_205_1.time_ <= var_208_7 + arg_208_0 then
				arg_205_1.var_.moveOldPos10035 = var_208_6.localPosition
				var_208_6.localScale = Vector3.New(1, 1, 1)

				arg_205_1:CheckSpriteTmpPos("10035", 4)

				local var_208_8 = var_208_6.childCount

				for iter_208_4 = 0, var_208_8 - 1 do
					local var_208_9 = var_208_6:GetChild(iter_208_4)

					if var_208_9.name == "split_5" or not string.find(var_208_9.name, "split") then
						var_208_9.gameObject:SetActive(true)
					else
						var_208_9.gameObject:SetActive(false)
					end
				end
			end

			local var_208_10 = 0.001

			if var_208_7 <= arg_205_1.time_ and arg_205_1.time_ < var_208_7 + var_208_10 then
				local var_208_11 = (arg_205_1.time_ - var_208_7) / var_208_10
				local var_208_12 = Vector3.New(390, -410, -235)

				var_208_6.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos10035, var_208_12, var_208_11)
			end

			if arg_205_1.time_ >= var_208_7 + var_208_10 and arg_205_1.time_ < var_208_7 + var_208_10 + arg_208_0 then
				var_208_6.localPosition = Vector3.New(390, -410, -235)
			end

			local var_208_13 = arg_205_1.actors_["10035"]
			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 and arg_205_1.var_.actorSpriteComps10035 == nil then
				arg_205_1.var_.actorSpriteComps10035 = var_208_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_208_15 = 0.2

			if var_208_14 <= arg_205_1.time_ and arg_205_1.time_ < var_208_14 + var_208_15 then
				local var_208_16 = (arg_205_1.time_ - var_208_14) / var_208_15

				if arg_205_1.var_.actorSpriteComps10035 then
					for iter_208_5, iter_208_6 in pairs(arg_205_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_208_6 then
							local var_208_17 = Mathf.Lerp(iter_208_6.color.r, 1, var_208_16)

							iter_208_6.color = Color.New(var_208_17, var_208_17, var_208_17)
						end
					end
				end
			end

			if arg_205_1.time_ >= var_208_14 + var_208_15 and arg_205_1.time_ < var_208_14 + var_208_15 + arg_208_0 and arg_205_1.var_.actorSpriteComps10035 then
				local var_208_18 = 1

				for iter_208_7, iter_208_8 in pairs(arg_205_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_208_8 then
						iter_208_8.color = Color.New(var_208_18, var_208_18, var_208_18)
					end
				end

				arg_205_1.var_.actorSpriteComps10035 = nil
			end

			local var_208_19 = 0
			local var_208_20 = 0.15

			if var_208_19 < arg_205_1.time_ and arg_205_1.time_ <= var_208_19 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_21 = arg_205_1:FormatText(StoryNameCfg[369].name)

				arg_205_1.leftNameTxt_.text = var_208_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_22 = arg_205_1:GetWordFromCfg(117041050)
				local var_208_23 = arg_205_1:FormatText(var_208_22.content)

				arg_205_1.text_.text = var_208_23

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_24 = 6
				local var_208_25 = utf8.len(var_208_23)
				local var_208_26 = var_208_24 <= 0 and var_208_20 or var_208_20 * (var_208_25 / var_208_24)

				if var_208_26 > 0 and var_208_20 < var_208_26 then
					arg_205_1.talkMaxDuration = var_208_26

					if var_208_26 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_26 + var_208_19
					end
				end

				arg_205_1.text_.text = var_208_23
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041050", "story_v_out_117041.awb") ~= 0 then
					local var_208_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041050", "story_v_out_117041.awb") / 1000

					if var_208_27 + var_208_19 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_27 + var_208_19
					end

					if var_208_22.prefab_name ~= "" and arg_205_1.actors_[var_208_22.prefab_name] ~= nil then
						local var_208_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_22.prefab_name].transform, "story_v_out_117041", "117041050", "story_v_out_117041.awb")

						arg_205_1:RecordAudio("117041050", var_208_28)
						arg_205_1:RecordAudio("117041050", var_208_28)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_117041", "117041050", "story_v_out_117041.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_117041", "117041050", "story_v_out_117041.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_29 = math.max(var_208_20, arg_205_1.talkMaxDuration)

			if var_208_19 <= arg_205_1.time_ and arg_205_1.time_ < var_208_19 + var_208_29 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_19) / var_208_29

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_19 + var_208_29 and arg_205_1.time_ < var_208_19 + var_208_29 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play117041051 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 117041051
		arg_209_1.duration_ = 5.5

		local var_209_0 = {
			zh = 5.5,
			ja = 4.466
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
				arg_209_0:Play117041052(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = "1132"

			if arg_209_1.actors_[var_212_0] == nil then
				local var_212_1 = Object.Instantiate(Asset.Load("UI/StoryExpression/" .. var_212_0), arg_209_1.canvasGo_.transform)

				var_212_1.transform:SetSiblingIndex(1)

				var_212_1.name = var_212_0
				var_212_1.transform.localPosition = Vector3.New(0, 100000, 0)
				arg_209_1.actors_[var_212_0] = var_212_1
			end

			local var_212_2 = arg_209_1.actors_["1132"].transform
			local var_212_3 = 0

			if var_212_3 < arg_209_1.time_ and arg_209_1.time_ <= var_212_3 + arg_212_0 then
				arg_209_1.var_.moveOldPos1132 = var_212_2.localPosition
				var_212_2.localScale = Vector3.New(1, 1, 1)

				arg_209_1:CheckSpriteTmpPos("1132", 3)

				local var_212_4 = var_212_2.childCount

				for iter_212_0 = 0, var_212_4 - 1 do
					local var_212_5 = var_212_2:GetChild(iter_212_0)

					if var_212_5.name == "split_2" or not string.find(var_212_5.name, "split") then
						var_212_5.gameObject:SetActive(true)
					else
						var_212_5.gameObject:SetActive(false)
					end
				end
			end

			local var_212_6 = 0.001

			if var_212_3 <= arg_209_1.time_ and arg_209_1.time_ < var_212_3 + var_212_6 then
				local var_212_7 = (arg_209_1.time_ - var_212_3) / var_212_6
				local var_212_8 = Vector3.New(0, -413, -185)

				var_212_2.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1132, var_212_8, var_212_7)
			end

			if arg_209_1.time_ >= var_212_3 + var_212_6 and arg_209_1.time_ < var_212_3 + var_212_6 + arg_212_0 then
				var_212_2.localPosition = Vector3.New(0, -413, -185)
			end

			local var_212_9 = arg_209_1.actors_["1132"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 then
				local var_212_11 = var_212_9:GetComponentInChildren(typeof(CanvasGroup))

				if var_212_11 then
					arg_209_1.var_.alphaOldValue1132 = var_212_11.alpha
					arg_209_1.var_.characterEffect1132 = var_212_11
				end

				arg_209_1.var_.alphaOldValue1132 = 0
			end

			local var_212_12 = 0.333333333333333

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_12 then
				local var_212_13 = (arg_209_1.time_ - var_212_10) / var_212_12
				local var_212_14 = Mathf.Lerp(arg_209_1.var_.alphaOldValue1132, 1, var_212_13)

				if arg_209_1.var_.characterEffect1132 then
					arg_209_1.var_.characterEffect1132.alpha = var_212_14
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_12 and arg_209_1.time_ < var_212_10 + var_212_12 + arg_212_0 and arg_209_1.var_.characterEffect1132 then
				arg_209_1.var_.characterEffect1132.alpha = 1
			end

			local var_212_15 = arg_209_1.actors_["10035"]
			local var_212_16 = 0

			if var_212_16 < arg_209_1.time_ and arg_209_1.time_ <= var_212_16 + arg_212_0 then
				local var_212_17 = var_212_15:GetComponentInChildren(typeof(CanvasGroup))

				if var_212_17 then
					arg_209_1.var_.alphaOldValue10035 = var_212_17.alpha
					arg_209_1.var_.characterEffect10035 = var_212_17
				end

				arg_209_1.var_.alphaOldValue10035 = 1
			end

			local var_212_18 = 0.333333333333333

			if var_212_16 <= arg_209_1.time_ and arg_209_1.time_ < var_212_16 + var_212_18 then
				local var_212_19 = (arg_209_1.time_ - var_212_16) / var_212_18
				local var_212_20 = Mathf.Lerp(arg_209_1.var_.alphaOldValue10035, 0, var_212_19)

				if arg_209_1.var_.characterEffect10035 then
					arg_209_1.var_.characterEffect10035.alpha = var_212_20
				end
			end

			if arg_209_1.time_ >= var_212_16 + var_212_18 and arg_209_1.time_ < var_212_16 + var_212_18 + arg_212_0 and arg_209_1.var_.characterEffect10035 then
				arg_209_1.var_.characterEffect10035.alpha = 0
			end

			local var_212_21 = arg_209_1.actors_["10034"]
			local var_212_22 = 0

			if var_212_22 < arg_209_1.time_ and arg_209_1.time_ <= var_212_22 + arg_212_0 then
				local var_212_23 = var_212_21:GetComponentInChildren(typeof(CanvasGroup))

				if var_212_23 then
					arg_209_1.var_.alphaOldValue10034 = var_212_23.alpha
					arg_209_1.var_.characterEffect10034 = var_212_23
				end

				arg_209_1.var_.alphaOldValue10034 = 1
			end

			local var_212_24 = 0.333333333333333

			if var_212_22 <= arg_209_1.time_ and arg_209_1.time_ < var_212_22 + var_212_24 then
				local var_212_25 = (arg_209_1.time_ - var_212_22) / var_212_24
				local var_212_26 = Mathf.Lerp(arg_209_1.var_.alphaOldValue10034, 0, var_212_25)

				if arg_209_1.var_.characterEffect10034 then
					arg_209_1.var_.characterEffect10034.alpha = var_212_26
				end
			end

			if arg_209_1.time_ >= var_212_22 + var_212_24 and arg_209_1.time_ < var_212_22 + var_212_24 + arg_212_0 and arg_209_1.var_.characterEffect10034 then
				arg_209_1.var_.characterEffect10034.alpha = 0
			end

			local var_212_27 = arg_209_1.actors_["1132"]
			local var_212_28 = 0

			if var_212_28 < arg_209_1.time_ and arg_209_1.time_ <= var_212_28 + arg_212_0 and arg_209_1.var_.actorSpriteComps1132 == nil then
				arg_209_1.var_.actorSpriteComps1132 = var_212_27:GetComponentsInChildren(typeof(Image), true)
			end

			local var_212_29 = 0.2

			if var_212_28 <= arg_209_1.time_ and arg_209_1.time_ < var_212_28 + var_212_29 then
				local var_212_30 = (arg_209_1.time_ - var_212_28) / var_212_29

				if arg_209_1.var_.actorSpriteComps1132 then
					for iter_212_1, iter_212_2 in pairs(arg_209_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_212_2 then
							local var_212_31 = Mathf.Lerp(iter_212_2.color.r, 1, var_212_30)

							iter_212_2.color = Color.New(var_212_31, var_212_31, var_212_31)
						end
					end
				end
			end

			if arg_209_1.time_ >= var_212_28 + var_212_29 and arg_209_1.time_ < var_212_28 + var_212_29 + arg_212_0 and arg_209_1.var_.actorSpriteComps1132 then
				local var_212_32 = 1

				for iter_212_3, iter_212_4 in pairs(arg_209_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_212_4 then
						iter_212_4.color = Color.New(var_212_32, var_212_32, var_212_32)
					end
				end

				arg_209_1.var_.actorSpriteComps1132 = nil
			end

			local var_212_33 = 0
			local var_212_34 = 0.65

			if var_212_33 < arg_209_1.time_ and arg_209_1.time_ <= var_212_33 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_35 = arg_209_1:FormatText(StoryNameCfg[61].name)

				arg_209_1.leftNameTxt_.text = var_212_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_36 = arg_209_1:GetWordFromCfg(117041051)
				local var_212_37 = arg_209_1:FormatText(var_212_36.content)

				arg_209_1.text_.text = var_212_37

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_38 = 26
				local var_212_39 = utf8.len(var_212_37)
				local var_212_40 = var_212_38 <= 0 and var_212_34 or var_212_34 * (var_212_39 / var_212_38)

				if var_212_40 > 0 and var_212_34 < var_212_40 then
					arg_209_1.talkMaxDuration = var_212_40

					if var_212_40 + var_212_33 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_40 + var_212_33
					end
				end

				arg_209_1.text_.text = var_212_37
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041051", "story_v_out_117041.awb") ~= 0 then
					local var_212_41 = manager.audio:GetVoiceLength("story_v_out_117041", "117041051", "story_v_out_117041.awb") / 1000

					if var_212_41 + var_212_33 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_41 + var_212_33
					end

					if var_212_36.prefab_name ~= "" and arg_209_1.actors_[var_212_36.prefab_name] ~= nil then
						local var_212_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_36.prefab_name].transform, "story_v_out_117041", "117041051", "story_v_out_117041.awb")

						arg_209_1:RecordAudio("117041051", var_212_42)
						arg_209_1:RecordAudio("117041051", var_212_42)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_117041", "117041051", "story_v_out_117041.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_117041", "117041051", "story_v_out_117041.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_43 = math.max(var_212_34, arg_209_1.talkMaxDuration)

			if var_212_33 <= arg_209_1.time_ and arg_209_1.time_ < var_212_33 + var_212_43 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_33) / var_212_43

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_33 + var_212_43 and arg_209_1.time_ < var_212_33 + var_212_43 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play117041052 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 117041052
		arg_213_1.duration_ = 2.2

		local var_213_0 = {
			zh = 2.2,
			ja = 1.9
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
				arg_213_0:Play117041053(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1132"]
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 and arg_213_1.var_.actorSpriteComps1132 == nil then
				arg_213_1.var_.actorSpriteComps1132 = var_216_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_216_2 = 0.2

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2

				if arg_213_1.var_.actorSpriteComps1132 then
					for iter_216_0, iter_216_1 in pairs(arg_213_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_216_1 then
							local var_216_4 = Mathf.Lerp(iter_216_1.color.r, 0.5, var_216_3)

							iter_216_1.color = Color.New(var_216_4, var_216_4, var_216_4)
						end
					end
				end
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 and arg_213_1.var_.actorSpriteComps1132 then
				local var_216_5 = 0.5

				for iter_216_2, iter_216_3 in pairs(arg_213_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_216_3 then
						iter_216_3.color = Color.New(var_216_5, var_216_5, var_216_5)
					end
				end

				arg_213_1.var_.actorSpriteComps1132 = nil
			end

			local var_216_6 = 0
			local var_216_7 = 0.2

			if var_216_6 < arg_213_1.time_ and arg_213_1.time_ <= var_216_6 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, true)

				local var_216_8 = arg_213_1:FormatText(StoryNameCfg[369].name)

				arg_213_1.leftNameTxt_.text = var_216_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_213_1.leftNameTxt_.transform)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1.leftNameTxt_.text)
				SetActive(arg_213_1.iconTrs_.gameObject, true)
				arg_213_1.iconController_:SetSelectedState("hero")

				arg_213_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10035_split_4")

				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_9 = arg_213_1:GetWordFromCfg(117041052)
				local var_216_10 = arg_213_1:FormatText(var_216_9.content)

				arg_213_1.text_.text = var_216_10

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_11 = 8
				local var_216_12 = utf8.len(var_216_10)
				local var_216_13 = var_216_11 <= 0 and var_216_7 or var_216_7 * (var_216_12 / var_216_11)

				if var_216_13 > 0 and var_216_7 < var_216_13 then
					arg_213_1.talkMaxDuration = var_216_13

					if var_216_13 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_13 + var_216_6
					end
				end

				arg_213_1.text_.text = var_216_10
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041052", "story_v_out_117041.awb") ~= 0 then
					local var_216_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041052", "story_v_out_117041.awb") / 1000

					if var_216_14 + var_216_6 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_14 + var_216_6
					end

					if var_216_9.prefab_name ~= "" and arg_213_1.actors_[var_216_9.prefab_name] ~= nil then
						local var_216_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_213_1.actors_[var_216_9.prefab_name].transform, "story_v_out_117041", "117041052", "story_v_out_117041.awb")

						arg_213_1:RecordAudio("117041052", var_216_15)
						arg_213_1:RecordAudio("117041052", var_216_15)
					else
						arg_213_1:AudioAction("play", "voice", "story_v_out_117041", "117041052", "story_v_out_117041.awb")
					end

					arg_213_1:RecordHistoryTalkVoice("story_v_out_117041", "117041052", "story_v_out_117041.awb")
				end

				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_16 = math.max(var_216_7, arg_213_1.talkMaxDuration)

			if var_216_6 <= arg_213_1.time_ and arg_213_1.time_ < var_216_6 + var_216_16 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_6) / var_216_16

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_6 + var_216_16 and arg_213_1.time_ < var_216_6 + var_216_16 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play117041053 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 117041053
		arg_217_1.duration_ = 5

		SetActive(arg_217_1.tipsGo_, false)

		function arg_217_1.onSingleLineFinish_()
			arg_217_1.onSingleLineUpdate_ = nil
			arg_217_1.onSingleLineFinish_ = nil
			arg_217_1.state_ = "waiting"
		end

		function arg_217_1.playNext_(arg_219_0)
			if arg_219_0 == 1 then
				arg_217_0:Play117041054(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["1132"]
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				local var_220_2 = var_220_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_220_2 then
					arg_217_1.var_.alphaOldValue1132 = var_220_2.alpha
					arg_217_1.var_.characterEffect1132 = var_220_2
				end

				arg_217_1.var_.alphaOldValue1132 = 1
			end

			local var_220_3 = 0.333333333333333

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_3 then
				local var_220_4 = (arg_217_1.time_ - var_220_1) / var_220_3
				local var_220_5 = Mathf.Lerp(arg_217_1.var_.alphaOldValue1132, 0, var_220_4)

				if arg_217_1.var_.characterEffect1132 then
					arg_217_1.var_.characterEffect1132.alpha = var_220_5
				end
			end

			if arg_217_1.time_ >= var_220_1 + var_220_3 and arg_217_1.time_ < var_220_1 + var_220_3 + arg_220_0 and arg_217_1.var_.characterEffect1132 then
				arg_217_1.var_.characterEffect1132.alpha = 0
			end

			local var_220_6 = 0
			local var_220_7 = 0.675

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

				local var_220_8 = arg_217_1:GetWordFromCfg(117041053)
				local var_220_9 = arg_217_1:FormatText(var_220_8.content)

				arg_217_1.text_.text = var_220_9

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_10 = 27
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
	Play117041054 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 117041054
		arg_221_1.duration_ = 13.6

		local var_221_0 = {
			zh = 12.1,
			ja = 13.6
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
				arg_221_0:Play117041055(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["10034"]
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				local var_224_2 = var_224_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_224_2 then
					arg_221_1.var_.alphaOldValue10034 = var_224_2.alpha
					arg_221_1.var_.characterEffect10034 = var_224_2
				end

				arg_221_1.var_.alphaOldValue10034 = 0
			end

			local var_224_3 = 0.333333333333333

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_3 then
				local var_224_4 = (arg_221_1.time_ - var_224_1) / var_224_3
				local var_224_5 = Mathf.Lerp(arg_221_1.var_.alphaOldValue10034, 1, var_224_4)

				if arg_221_1.var_.characterEffect10034 then
					arg_221_1.var_.characterEffect10034.alpha = var_224_5
				end
			end

			if arg_221_1.time_ >= var_224_1 + var_224_3 and arg_221_1.time_ < var_224_1 + var_224_3 + arg_224_0 and arg_221_1.var_.characterEffect10034 then
				arg_221_1.var_.characterEffect10034.alpha = 1
			end

			local var_224_6 = arg_221_1.actors_["10035"]
			local var_224_7 = 0

			if var_224_7 < arg_221_1.time_ and arg_221_1.time_ <= var_224_7 + arg_224_0 then
				local var_224_8 = var_224_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_224_8 then
					arg_221_1.var_.alphaOldValue10035 = var_224_8.alpha
					arg_221_1.var_.characterEffect10035 = var_224_8
				end

				arg_221_1.var_.alphaOldValue10035 = 0
			end

			local var_224_9 = 0.333333333333333

			if var_224_7 <= arg_221_1.time_ and arg_221_1.time_ < var_224_7 + var_224_9 then
				local var_224_10 = (arg_221_1.time_ - var_224_7) / var_224_9
				local var_224_11 = Mathf.Lerp(arg_221_1.var_.alphaOldValue10035, 1, var_224_10)

				if arg_221_1.var_.characterEffect10035 then
					arg_221_1.var_.characterEffect10035.alpha = var_224_11
				end
			end

			if arg_221_1.time_ >= var_224_7 + var_224_9 and arg_221_1.time_ < var_224_7 + var_224_9 + arg_224_0 and arg_221_1.var_.characterEffect10035 then
				arg_221_1.var_.characterEffect10035.alpha = 1
			end

			local var_224_12 = arg_221_1.actors_["10035"].transform
			local var_224_13 = 0

			if var_224_13 < arg_221_1.time_ and arg_221_1.time_ <= var_224_13 + arg_224_0 then
				arg_221_1.var_.moveOldPos10035 = var_224_12.localPosition
				var_224_12.localScale = Vector3.New(1, 1, 1)

				arg_221_1:CheckSpriteTmpPos("10035", 4)

				local var_224_14 = var_224_12.childCount

				for iter_224_0 = 0, var_224_14 - 1 do
					local var_224_15 = var_224_12:GetChild(iter_224_0)

					if var_224_15.name == "split_1" or not string.find(var_224_15.name, "split") then
						var_224_15.gameObject:SetActive(true)
					else
						var_224_15.gameObject:SetActive(false)
					end
				end
			end

			local var_224_16 = 0.001

			if var_224_13 <= arg_221_1.time_ and arg_221_1.time_ < var_224_13 + var_224_16 then
				local var_224_17 = (arg_221_1.time_ - var_224_13) / var_224_16
				local var_224_18 = Vector3.New(390, -410, -235)

				var_224_12.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10035, var_224_18, var_224_17)
			end

			if arg_221_1.time_ >= var_224_13 + var_224_16 and arg_221_1.time_ < var_224_13 + var_224_16 + arg_224_0 then
				var_224_12.localPosition = Vector3.New(390, -410, -235)
			end

			local var_224_19 = arg_221_1.actors_["10034"]
			local var_224_20 = 0

			if var_224_20 < arg_221_1.time_ and arg_221_1.time_ <= var_224_20 + arg_224_0 and arg_221_1.var_.actorSpriteComps10034 == nil then
				arg_221_1.var_.actorSpriteComps10034 = var_224_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_224_21 = 0.2

			if var_224_20 <= arg_221_1.time_ and arg_221_1.time_ < var_224_20 + var_224_21 then
				local var_224_22 = (arg_221_1.time_ - var_224_20) / var_224_21

				if arg_221_1.var_.actorSpriteComps10034 then
					for iter_224_1, iter_224_2 in pairs(arg_221_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_224_2 then
							local var_224_23 = Mathf.Lerp(iter_224_2.color.r, 1, var_224_22)

							iter_224_2.color = Color.New(var_224_23, var_224_23, var_224_23)
						end
					end
				end
			end

			if arg_221_1.time_ >= var_224_20 + var_224_21 and arg_221_1.time_ < var_224_20 + var_224_21 + arg_224_0 and arg_221_1.var_.actorSpriteComps10034 then
				local var_224_24 = 1

				for iter_224_3, iter_224_4 in pairs(arg_221_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_224_4 then
						iter_224_4.color = Color.New(var_224_24, var_224_24, var_224_24)
					end
				end

				arg_221_1.var_.actorSpriteComps10034 = nil
			end

			local var_224_25 = 0
			local var_224_26 = 1.125

			if var_224_25 < arg_221_1.time_ and arg_221_1.time_ <= var_224_25 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_27 = arg_221_1:FormatText(StoryNameCfg[367].name)

				arg_221_1.leftNameTxt_.text = var_224_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_28 = arg_221_1:GetWordFromCfg(117041054)
				local var_224_29 = arg_221_1:FormatText(var_224_28.content)

				arg_221_1.text_.text = var_224_29

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_30 = 45
				local var_224_31 = utf8.len(var_224_29)
				local var_224_32 = var_224_30 <= 0 and var_224_26 or var_224_26 * (var_224_31 / var_224_30)

				if var_224_32 > 0 and var_224_26 < var_224_32 then
					arg_221_1.talkMaxDuration = var_224_32

					if var_224_32 + var_224_25 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_32 + var_224_25
					end
				end

				arg_221_1.text_.text = var_224_29
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041054", "story_v_out_117041.awb") ~= 0 then
					local var_224_33 = manager.audio:GetVoiceLength("story_v_out_117041", "117041054", "story_v_out_117041.awb") / 1000

					if var_224_33 + var_224_25 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_33 + var_224_25
					end

					if var_224_28.prefab_name ~= "" and arg_221_1.actors_[var_224_28.prefab_name] ~= nil then
						local var_224_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_28.prefab_name].transform, "story_v_out_117041", "117041054", "story_v_out_117041.awb")

						arg_221_1:RecordAudio("117041054", var_224_34)
						arg_221_1:RecordAudio("117041054", var_224_34)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_117041", "117041054", "story_v_out_117041.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_117041", "117041054", "story_v_out_117041.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_35 = math.max(var_224_26, arg_221_1.talkMaxDuration)

			if var_224_25 <= arg_221_1.time_ and arg_221_1.time_ < var_224_25 + var_224_35 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_25) / var_224_35

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_25 + var_224_35 and arg_221_1.time_ < var_224_25 + var_224_35 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play117041055 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 117041055
		arg_225_1.duration_ = 6.966

		local var_225_0 = {
			zh = 6.766,
			ja = 6.966
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
				arg_225_0:Play117041056(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10035"]
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 and arg_225_1.var_.actorSpriteComps10035 == nil then
				arg_225_1.var_.actorSpriteComps10035 = var_228_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_2 = 0.2

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2

				if arg_225_1.var_.actorSpriteComps10035 then
					for iter_228_0, iter_228_1 in pairs(arg_225_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_228_1 then
							local var_228_4 = Mathf.Lerp(iter_228_1.color.r, 1, var_228_3)

							iter_228_1.color = Color.New(var_228_4, var_228_4, var_228_4)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 and arg_225_1.var_.actorSpriteComps10035 then
				local var_228_5 = 1

				for iter_228_2, iter_228_3 in pairs(arg_225_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_228_3 then
						iter_228_3.color = Color.New(var_228_5, var_228_5, var_228_5)
					end
				end

				arg_225_1.var_.actorSpriteComps10035 = nil
			end

			local var_228_6 = arg_225_1.actors_["10034"]
			local var_228_7 = 0

			if var_228_7 < arg_225_1.time_ and arg_225_1.time_ <= var_228_7 + arg_228_0 and arg_225_1.var_.actorSpriteComps10034 == nil then
				arg_225_1.var_.actorSpriteComps10034 = var_228_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_228_8 = 0.2

			if var_228_7 <= arg_225_1.time_ and arg_225_1.time_ < var_228_7 + var_228_8 then
				local var_228_9 = (arg_225_1.time_ - var_228_7) / var_228_8

				if arg_225_1.var_.actorSpriteComps10034 then
					for iter_228_4, iter_228_5 in pairs(arg_225_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_228_5 then
							local var_228_10 = Mathf.Lerp(iter_228_5.color.r, 0.5, var_228_9)

							iter_228_5.color = Color.New(var_228_10, var_228_10, var_228_10)
						end
					end
				end
			end

			if arg_225_1.time_ >= var_228_7 + var_228_8 and arg_225_1.time_ < var_228_7 + var_228_8 + arg_228_0 and arg_225_1.var_.actorSpriteComps10034 then
				local var_228_11 = 0.5

				for iter_228_6, iter_228_7 in pairs(arg_225_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_228_7 then
						iter_228_7.color = Color.New(var_228_11, var_228_11, var_228_11)
					end
				end

				arg_225_1.var_.actorSpriteComps10034 = nil
			end

			local var_228_12 = 0
			local var_228_13 = 0.775

			if var_228_12 < arg_225_1.time_ and arg_225_1.time_ <= var_228_12 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_14 = arg_225_1:FormatText(StoryNameCfg[369].name)

				arg_225_1.leftNameTxt_.text = var_228_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_15 = arg_225_1:GetWordFromCfg(117041055)
				local var_228_16 = arg_225_1:FormatText(var_228_15.content)

				arg_225_1.text_.text = var_228_16

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_17 = 31
				local var_228_18 = utf8.len(var_228_16)
				local var_228_19 = var_228_17 <= 0 and var_228_13 or var_228_13 * (var_228_18 / var_228_17)

				if var_228_19 > 0 and var_228_13 < var_228_19 then
					arg_225_1.talkMaxDuration = var_228_19

					if var_228_19 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_19 + var_228_12
					end
				end

				arg_225_1.text_.text = var_228_16
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041055", "story_v_out_117041.awb") ~= 0 then
					local var_228_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041055", "story_v_out_117041.awb") / 1000

					if var_228_20 + var_228_12 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_20 + var_228_12
					end

					if var_228_15.prefab_name ~= "" and arg_225_1.actors_[var_228_15.prefab_name] ~= nil then
						local var_228_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_15.prefab_name].transform, "story_v_out_117041", "117041055", "story_v_out_117041.awb")

						arg_225_1:RecordAudio("117041055", var_228_21)
						arg_225_1:RecordAudio("117041055", var_228_21)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_117041", "117041055", "story_v_out_117041.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_117041", "117041055", "story_v_out_117041.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_22 = math.max(var_228_13, arg_225_1.talkMaxDuration)

			if var_228_12 <= arg_225_1.time_ and arg_225_1.time_ < var_228_12 + var_228_22 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_12) / var_228_22

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_12 + var_228_22 and arg_225_1.time_ < var_228_12 + var_228_22 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play117041056 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 117041056
		arg_229_1.duration_ = 7.166

		local var_229_0 = {
			zh = 7.166,
			ja = 6.266
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
				arg_229_0:Play117041057(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10035"]
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 and arg_229_1.var_.actorSpriteComps10035 == nil then
				arg_229_1.var_.actorSpriteComps10035 = var_232_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_232_2 = 0.2

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2

				if arg_229_1.var_.actorSpriteComps10035 then
					for iter_232_0, iter_232_1 in pairs(arg_229_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_232_1 then
							local var_232_4 = Mathf.Lerp(iter_232_1.color.r, 0.5, var_232_3)

							iter_232_1.color = Color.New(var_232_4, var_232_4, var_232_4)
						end
					end
				end
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 and arg_229_1.var_.actorSpriteComps10035 then
				local var_232_5 = 0.5

				for iter_232_2, iter_232_3 in pairs(arg_229_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_232_3 then
						iter_232_3.color = Color.New(var_232_5, var_232_5, var_232_5)
					end
				end

				arg_229_1.var_.actorSpriteComps10035 = nil
			end

			local var_232_6 = 0
			local var_232_7 = 0.95

			if var_232_6 < arg_229_1.time_ and arg_229_1.time_ <= var_232_6 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, true)

				local var_232_8 = arg_229_1:FormatText(StoryNameCfg[61].name)

				arg_229_1.leftNameTxt_.text = var_232_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_229_1.leftNameTxt_.transform)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1.leftNameTxt_.text)
				SetActive(arg_229_1.iconTrs_.gameObject, true)
				arg_229_1.iconController_:SetSelectedState("hero")

				arg_229_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1132_split_6")

				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_9 = arg_229_1:GetWordFromCfg(117041056)
				local var_232_10 = arg_229_1:FormatText(var_232_9.content)

				arg_229_1.text_.text = var_232_10

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_11 = 38
				local var_232_12 = utf8.len(var_232_10)
				local var_232_13 = var_232_11 <= 0 and var_232_7 or var_232_7 * (var_232_12 / var_232_11)

				if var_232_13 > 0 and var_232_7 < var_232_13 then
					arg_229_1.talkMaxDuration = var_232_13

					if var_232_13 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_13 + var_232_6
					end
				end

				arg_229_1.text_.text = var_232_10
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041056", "story_v_out_117041.awb") ~= 0 then
					local var_232_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041056", "story_v_out_117041.awb") / 1000

					if var_232_14 + var_232_6 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_14 + var_232_6
					end

					if var_232_9.prefab_name ~= "" and arg_229_1.actors_[var_232_9.prefab_name] ~= nil then
						local var_232_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_229_1.actors_[var_232_9.prefab_name].transform, "story_v_out_117041", "117041056", "story_v_out_117041.awb")

						arg_229_1:RecordAudio("117041056", var_232_15)
						arg_229_1:RecordAudio("117041056", var_232_15)
					else
						arg_229_1:AudioAction("play", "voice", "story_v_out_117041", "117041056", "story_v_out_117041.awb")
					end

					arg_229_1:RecordHistoryTalkVoice("story_v_out_117041", "117041056", "story_v_out_117041.awb")
				end

				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_16 = math.max(var_232_7, arg_229_1.talkMaxDuration)

			if var_232_6 <= arg_229_1.time_ and arg_229_1.time_ < var_232_6 + var_232_16 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_6) / var_232_16

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_6 + var_232_16 and arg_229_1.time_ < var_232_6 + var_232_16 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play117041057 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 117041057
		arg_233_1.duration_ = 3.4

		local var_233_0 = {
			zh = 3.066,
			ja = 3.4
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
				arg_233_0:Play117041058(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["10035"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos10035 = var_236_0.localPosition
				var_236_0.localScale = Vector3.New(1, 1, 1)

				arg_233_1:CheckSpriteTmpPos("10035", 4)

				local var_236_2 = var_236_0.childCount

				for iter_236_0 = 0, var_236_2 - 1 do
					local var_236_3 = var_236_0:GetChild(iter_236_0)

					if var_236_3.name == "split_4" or not string.find(var_236_3.name, "split") then
						var_236_3.gameObject:SetActive(true)
					else
						var_236_3.gameObject:SetActive(false)
					end
				end
			end

			local var_236_4 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_4 then
				local var_236_5 = (arg_233_1.time_ - var_236_1) / var_236_4
				local var_236_6 = Vector3.New(390, -410, -235)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos10035, var_236_6, var_236_5)
			end

			if arg_233_1.time_ >= var_236_1 + var_236_4 and arg_233_1.time_ < var_236_1 + var_236_4 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_236_7 = arg_233_1.actors_["10035"]
			local var_236_8 = 0

			if var_236_8 < arg_233_1.time_ and arg_233_1.time_ <= var_236_8 + arg_236_0 and arg_233_1.var_.actorSpriteComps10035 == nil then
				arg_233_1.var_.actorSpriteComps10035 = var_236_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_236_9 = 0.2

			if var_236_8 <= arg_233_1.time_ and arg_233_1.time_ < var_236_8 + var_236_9 then
				local var_236_10 = (arg_233_1.time_ - var_236_8) / var_236_9

				if arg_233_1.var_.actorSpriteComps10035 then
					for iter_236_1, iter_236_2 in pairs(arg_233_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_236_2 then
							local var_236_11 = Mathf.Lerp(iter_236_2.color.r, 1, var_236_10)

							iter_236_2.color = Color.New(var_236_11, var_236_11, var_236_11)
						end
					end
				end
			end

			if arg_233_1.time_ >= var_236_8 + var_236_9 and arg_233_1.time_ < var_236_8 + var_236_9 + arg_236_0 and arg_233_1.var_.actorSpriteComps10035 then
				local var_236_12 = 1

				for iter_236_3, iter_236_4 in pairs(arg_233_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_236_4 then
						iter_236_4.color = Color.New(var_236_12, var_236_12, var_236_12)
					end
				end

				arg_233_1.var_.actorSpriteComps10035 = nil
			end

			local var_236_13 = 0
			local var_236_14 = 0.4

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_15 = arg_233_1:FormatText(StoryNameCfg[369].name)

				arg_233_1.leftNameTxt_.text = var_236_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_16 = arg_233_1:GetWordFromCfg(117041057)
				local var_236_17 = arg_233_1:FormatText(var_236_16.content)

				arg_233_1.text_.text = var_236_17

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_18 = 16
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041057", "story_v_out_117041.awb") ~= 0 then
					local var_236_21 = manager.audio:GetVoiceLength("story_v_out_117041", "117041057", "story_v_out_117041.awb") / 1000

					if var_236_21 + var_236_13 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_21 + var_236_13
					end

					if var_236_16.prefab_name ~= "" and arg_233_1.actors_[var_236_16.prefab_name] ~= nil then
						local var_236_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_16.prefab_name].transform, "story_v_out_117041", "117041057", "story_v_out_117041.awb")

						arg_233_1:RecordAudio("117041057", var_236_22)
						arg_233_1:RecordAudio("117041057", var_236_22)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_117041", "117041057", "story_v_out_117041.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_117041", "117041057", "story_v_out_117041.awb")
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
	Play117041058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 117041058
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play117041059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10035"]
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 and arg_237_1.var_.actorSpriteComps10035 == nil then
				arg_237_1.var_.actorSpriteComps10035 = var_240_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_240_2 = 0.2

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2

				if arg_237_1.var_.actorSpriteComps10035 then
					for iter_240_0, iter_240_1 in pairs(arg_237_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_240_1 then
							local var_240_4 = Mathf.Lerp(iter_240_1.color.r, 0.5, var_240_3)

							iter_240_1.color = Color.New(var_240_4, var_240_4, var_240_4)
						end
					end
				end
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 and arg_237_1.var_.actorSpriteComps10035 then
				local var_240_5 = 0.5

				for iter_240_2, iter_240_3 in pairs(arg_237_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_240_3 then
						iter_240_3.color = Color.New(var_240_5, var_240_5, var_240_5)
					end
				end

				arg_237_1.var_.actorSpriteComps10035 = nil
			end

			local var_240_6 = 0
			local var_240_7 = 0.775

			if var_240_6 < arg_237_1.time_ and arg_237_1.time_ <= var_240_6 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, false)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_8 = arg_237_1:GetWordFromCfg(117041058)
				local var_240_9 = arg_237_1:FormatText(var_240_8.content)

				arg_237_1.text_.text = var_240_9

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_10 = 31
				local var_240_11 = utf8.len(var_240_9)
				local var_240_12 = var_240_10 <= 0 and var_240_7 or var_240_7 * (var_240_11 / var_240_10)

				if var_240_12 > 0 and var_240_7 < var_240_12 then
					arg_237_1.talkMaxDuration = var_240_12

					if var_240_12 + var_240_6 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_12 + var_240_6
					end
				end

				arg_237_1.text_.text = var_240_9
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_13 = math.max(var_240_7, arg_237_1.talkMaxDuration)

			if var_240_6 <= arg_237_1.time_ and arg_237_1.time_ < var_240_6 + var_240_13 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_6) / var_240_13

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_6 + var_240_13 and arg_237_1.time_ < var_240_6 + var_240_13 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play117041059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 117041059
		arg_241_1.duration_ = 9.8

		local var_241_0 = {
			zh = 9.8,
			ja = 7.4
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
				arg_241_0:Play117041060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10034"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.actorSpriteComps10034 == nil then
				arg_241_1.var_.actorSpriteComps10034 = var_244_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_244_2 = 0.2

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.actorSpriteComps10034 then
					for iter_244_0, iter_244_1 in pairs(arg_241_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_244_1 then
							local var_244_4 = Mathf.Lerp(iter_244_1.color.r, 1, var_244_3)

							iter_244_1.color = Color.New(var_244_4, var_244_4, var_244_4)
						end
					end
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.actorSpriteComps10034 then
				local var_244_5 = 1

				for iter_244_2, iter_244_3 in pairs(arg_241_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_244_3 then
						iter_244_3.color = Color.New(var_244_5, var_244_5, var_244_5)
					end
				end

				arg_241_1.var_.actorSpriteComps10034 = nil
			end

			local var_244_6 = 0
			local var_244_7 = 0.85

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_8 = arg_241_1:FormatText(StoryNameCfg[367].name)

				arg_241_1.leftNameTxt_.text = var_244_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_9 = arg_241_1:GetWordFromCfg(117041059)
				local var_244_10 = arg_241_1:FormatText(var_244_9.content)

				arg_241_1.text_.text = var_244_10

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_11 = 34
				local var_244_12 = utf8.len(var_244_10)
				local var_244_13 = var_244_11 <= 0 and var_244_7 or var_244_7 * (var_244_12 / var_244_11)

				if var_244_13 > 0 and var_244_7 < var_244_13 then
					arg_241_1.talkMaxDuration = var_244_13

					if var_244_13 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_13 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_10
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041059", "story_v_out_117041.awb") ~= 0 then
					local var_244_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041059", "story_v_out_117041.awb") / 1000

					if var_244_14 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_14 + var_244_6
					end

					if var_244_9.prefab_name ~= "" and arg_241_1.actors_[var_244_9.prefab_name] ~= nil then
						local var_244_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_9.prefab_name].transform, "story_v_out_117041", "117041059", "story_v_out_117041.awb")

						arg_241_1:RecordAudio("117041059", var_244_15)
						arg_241_1:RecordAudio("117041059", var_244_15)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_117041", "117041059", "story_v_out_117041.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_117041", "117041059", "story_v_out_117041.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_16 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_16 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_16

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_16 and arg_241_1.time_ < var_244_6 + var_244_16 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play117041060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 117041060
		arg_245_1.duration_ = 5

		SetActive(arg_245_1.tipsGo_, false)

		function arg_245_1.onSingleLineFinish_()
			arg_245_1.onSingleLineUpdate_ = nil
			arg_245_1.onSingleLineFinish_ = nil
			arg_245_1.state_ = "waiting"
		end

		function arg_245_1.playNext_(arg_247_0)
			if arg_247_0 == 1 then
				arg_245_0:Play117041061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10035"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 then
				local var_248_2 = var_248_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_248_2 then
					arg_245_1.var_.alphaOldValue10035 = var_248_2.alpha
					arg_245_1.var_.characterEffect10035 = var_248_2
				end

				arg_245_1.var_.alphaOldValue10035 = 1
			end

			local var_248_3 = 0.333333333333333

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_3 then
				local var_248_4 = (arg_245_1.time_ - var_248_1) / var_248_3
				local var_248_5 = Mathf.Lerp(arg_245_1.var_.alphaOldValue10035, 0, var_248_4)

				if arg_245_1.var_.characterEffect10035 then
					arg_245_1.var_.characterEffect10035.alpha = var_248_5
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_3 and arg_245_1.time_ < var_248_1 + var_248_3 + arg_248_0 and arg_245_1.var_.characterEffect10035 then
				arg_245_1.var_.characterEffect10035.alpha = 0
			end

			local var_248_6 = arg_245_1.actors_["10034"]
			local var_248_7 = 0

			if var_248_7 < arg_245_1.time_ and arg_245_1.time_ <= var_248_7 + arg_248_0 then
				local var_248_8 = var_248_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_248_8 then
					arg_245_1.var_.alphaOldValue10034 = var_248_8.alpha
					arg_245_1.var_.characterEffect10034 = var_248_8
				end

				arg_245_1.var_.alphaOldValue10034 = 1
			end

			local var_248_9 = 0.333333333333333

			if var_248_7 <= arg_245_1.time_ and arg_245_1.time_ < var_248_7 + var_248_9 then
				local var_248_10 = (arg_245_1.time_ - var_248_7) / var_248_9
				local var_248_11 = Mathf.Lerp(arg_245_1.var_.alphaOldValue10034, 0, var_248_10)

				if arg_245_1.var_.characterEffect10034 then
					arg_245_1.var_.characterEffect10034.alpha = var_248_11
				end
			end

			if arg_245_1.time_ >= var_248_7 + var_248_9 and arg_245_1.time_ < var_248_7 + var_248_9 + arg_248_0 and arg_245_1.var_.characterEffect10034 then
				arg_245_1.var_.characterEffect10034.alpha = 0
			end

			local var_248_12 = 0
			local var_248_13 = 0.975

			if var_248_12 < arg_245_1.time_ and arg_245_1.time_ <= var_248_12 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, false)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_14 = arg_245_1:GetWordFromCfg(117041060)
				local var_248_15 = arg_245_1:FormatText(var_248_14.content)

				arg_245_1.text_.text = var_248_15

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_16 = 39
				local var_248_17 = utf8.len(var_248_15)
				local var_248_18 = var_248_16 <= 0 and var_248_13 or var_248_13 * (var_248_17 / var_248_16)

				if var_248_18 > 0 and var_248_13 < var_248_18 then
					arg_245_1.talkMaxDuration = var_248_18

					if var_248_18 + var_248_12 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_18 + var_248_12
					end
				end

				arg_245_1.text_.text = var_248_15
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)
				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_19 = math.max(var_248_13, arg_245_1.talkMaxDuration)

			if var_248_12 <= arg_245_1.time_ and arg_245_1.time_ < var_248_12 + var_248_19 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_12) / var_248_19

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_12 + var_248_19 and arg_245_1.time_ < var_248_12 + var_248_19 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play117041061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 117041061
		arg_249_1.duration_ = 6.7

		local var_249_0 = {
			zh = 3.966,
			ja = 6.7
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
				arg_249_0:Play117041062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1132"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 then
				local var_252_2 = var_252_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_252_2 then
					arg_249_1.var_.alphaOldValue1132 = var_252_2.alpha
					arg_249_1.var_.characterEffect1132 = var_252_2
				end

				arg_249_1.var_.alphaOldValue1132 = 0
			end

			local var_252_3 = 0.333333333333333

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_3 then
				local var_252_4 = (arg_249_1.time_ - var_252_1) / var_252_3
				local var_252_5 = Mathf.Lerp(arg_249_1.var_.alphaOldValue1132, 1, var_252_4)

				if arg_249_1.var_.characterEffect1132 then
					arg_249_1.var_.characterEffect1132.alpha = var_252_5
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_3 and arg_249_1.time_ < var_252_1 + var_252_3 + arg_252_0 and arg_249_1.var_.characterEffect1132 then
				arg_249_1.var_.characterEffect1132.alpha = 1
			end

			local var_252_6 = arg_249_1.actors_["1132"]
			local var_252_7 = 0

			if var_252_7 < arg_249_1.time_ and arg_249_1.time_ <= var_252_7 + arg_252_0 and arg_249_1.var_.actorSpriteComps1132 == nil then
				arg_249_1.var_.actorSpriteComps1132 = var_252_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_252_8 = 0.2

			if var_252_7 <= arg_249_1.time_ and arg_249_1.time_ < var_252_7 + var_252_8 then
				local var_252_9 = (arg_249_1.time_ - var_252_7) / var_252_8

				if arg_249_1.var_.actorSpriteComps1132 then
					for iter_252_0, iter_252_1 in pairs(arg_249_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_252_1 then
							local var_252_10 = Mathf.Lerp(iter_252_1.color.r, 1, var_252_9)

							iter_252_1.color = Color.New(var_252_10, var_252_10, var_252_10)
						end
					end
				end
			end

			if arg_249_1.time_ >= var_252_7 + var_252_8 and arg_249_1.time_ < var_252_7 + var_252_8 + arg_252_0 and arg_249_1.var_.actorSpriteComps1132 then
				local var_252_11 = 1

				for iter_252_2, iter_252_3 in pairs(arg_249_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_252_3 then
						iter_252_3.color = Color.New(var_252_11, var_252_11, var_252_11)
					end
				end

				arg_249_1.var_.actorSpriteComps1132 = nil
			end

			local var_252_12 = 0
			local var_252_13 = 0.4

			if var_252_12 < arg_249_1.time_ and arg_249_1.time_ <= var_252_12 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_14 = arg_249_1:FormatText(StoryNameCfg[61].name)

				arg_249_1.leftNameTxt_.text = var_252_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_15 = arg_249_1:GetWordFromCfg(117041061)
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041061", "story_v_out_117041.awb") ~= 0 then
					local var_252_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041061", "story_v_out_117041.awb") / 1000

					if var_252_20 + var_252_12 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_20 + var_252_12
					end

					if var_252_15.prefab_name ~= "" and arg_249_1.actors_[var_252_15.prefab_name] ~= nil then
						local var_252_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_15.prefab_name].transform, "story_v_out_117041", "117041061", "story_v_out_117041.awb")

						arg_249_1:RecordAudio("117041061", var_252_21)
						arg_249_1:RecordAudio("117041061", var_252_21)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_117041", "117041061", "story_v_out_117041.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_117041", "117041061", "story_v_out_117041.awb")
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
	Play117041062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 117041062
		arg_253_1.duration_ = 5.966

		local var_253_0 = {
			zh = 5.2,
			ja = 5.966
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
				arg_253_0:Play117041063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1132"].transform
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 then
				arg_253_1.var_.moveOldPos1132 = var_256_0.localPosition
				var_256_0.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("1132", 2)

				local var_256_2 = var_256_0.childCount

				for iter_256_0 = 0, var_256_2 - 1 do
					local var_256_3 = var_256_0:GetChild(iter_256_0)

					if var_256_3.name == "split_2" or not string.find(var_256_3.name, "split") then
						var_256_3.gameObject:SetActive(true)
					else
						var_256_3.gameObject:SetActive(false)
					end
				end
			end

			local var_256_4 = 0.001

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_4 then
				local var_256_5 = (arg_253_1.time_ - var_256_1) / var_256_4
				local var_256_6 = Vector3.New(-390, -413, -185)

				var_256_0.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos1132, var_256_6, var_256_5)
			end

			if arg_253_1.time_ >= var_256_1 + var_256_4 and arg_253_1.time_ < var_256_1 + var_256_4 + arg_256_0 then
				var_256_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_256_7 = arg_253_1.actors_["10035"].transform
			local var_256_8 = 0

			if var_256_8 < arg_253_1.time_ and arg_253_1.time_ <= var_256_8 + arg_256_0 then
				arg_253_1.var_.moveOldPos10035 = var_256_7.localPosition
				var_256_7.localScale = Vector3.New(1, 1, 1)

				arg_253_1:CheckSpriteTmpPos("10035", 4)

				local var_256_9 = var_256_7.childCount

				for iter_256_1 = 0, var_256_9 - 1 do
					local var_256_10 = var_256_7:GetChild(iter_256_1)

					if var_256_10.name == "split_2" or not string.find(var_256_10.name, "split") then
						var_256_10.gameObject:SetActive(true)
					else
						var_256_10.gameObject:SetActive(false)
					end
				end
			end

			local var_256_11 = 0.001

			if var_256_8 <= arg_253_1.time_ and arg_253_1.time_ < var_256_8 + var_256_11 then
				local var_256_12 = (arg_253_1.time_ - var_256_8) / var_256_11
				local var_256_13 = Vector3.New(390, -410, -235)

				var_256_7.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPos10035, var_256_13, var_256_12)
			end

			if arg_253_1.time_ >= var_256_8 + var_256_11 and arg_253_1.time_ < var_256_8 + var_256_11 + arg_256_0 then
				var_256_7.localPosition = Vector3.New(390, -410, -235)
			end

			local var_256_14 = arg_253_1.actors_["1132"]
			local var_256_15 = 0

			if var_256_15 < arg_253_1.time_ and arg_253_1.time_ <= var_256_15 + arg_256_0 and arg_253_1.var_.actorSpriteComps1132 == nil then
				arg_253_1.var_.actorSpriteComps1132 = var_256_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_256_16 = 0.2

			if var_256_15 <= arg_253_1.time_ and arg_253_1.time_ < var_256_15 + var_256_16 then
				local var_256_17 = (arg_253_1.time_ - var_256_15) / var_256_16

				if arg_253_1.var_.actorSpriteComps1132 then
					for iter_256_2, iter_256_3 in pairs(arg_253_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_256_3 then
							local var_256_18 = Mathf.Lerp(iter_256_3.color.r, 0.5, var_256_17)

							iter_256_3.color = Color.New(var_256_18, var_256_18, var_256_18)
						end
					end
				end
			end

			if arg_253_1.time_ >= var_256_15 + var_256_16 and arg_253_1.time_ < var_256_15 + var_256_16 + arg_256_0 and arg_253_1.var_.actorSpriteComps1132 then
				local var_256_19 = 0.5

				for iter_256_4, iter_256_5 in pairs(arg_253_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_256_5 then
						iter_256_5.color = Color.New(var_256_19, var_256_19, var_256_19)
					end
				end

				arg_253_1.var_.actorSpriteComps1132 = nil
			end

			local var_256_20 = arg_253_1.actors_["10035"]
			local var_256_21 = 0

			if var_256_21 < arg_253_1.time_ and arg_253_1.time_ <= var_256_21 + arg_256_0 and arg_253_1.var_.actorSpriteComps10035 == nil then
				arg_253_1.var_.actorSpriteComps10035 = var_256_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_256_22 = 0.2

			if var_256_21 <= arg_253_1.time_ and arg_253_1.time_ < var_256_21 + var_256_22 then
				local var_256_23 = (arg_253_1.time_ - var_256_21) / var_256_22

				if arg_253_1.var_.actorSpriteComps10035 then
					for iter_256_6, iter_256_7 in pairs(arg_253_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_256_7 then
							local var_256_24 = Mathf.Lerp(iter_256_7.color.r, 1, var_256_23)

							iter_256_7.color = Color.New(var_256_24, var_256_24, var_256_24)
						end
					end
				end
			end

			if arg_253_1.time_ >= var_256_21 + var_256_22 and arg_253_1.time_ < var_256_21 + var_256_22 + arg_256_0 and arg_253_1.var_.actorSpriteComps10035 then
				local var_256_25 = 1

				for iter_256_8, iter_256_9 in pairs(arg_253_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_256_9 then
						iter_256_9.color = Color.New(var_256_25, var_256_25, var_256_25)
					end
				end

				arg_253_1.var_.actorSpriteComps10035 = nil
			end

			local var_256_26 = arg_253_1.actors_["10035"]
			local var_256_27 = 0

			if var_256_27 < arg_253_1.time_ and arg_253_1.time_ <= var_256_27 + arg_256_0 then
				local var_256_28 = var_256_26:GetComponentInChildren(typeof(CanvasGroup))

				if var_256_28 then
					arg_253_1.var_.alphaOldValue10035 = var_256_28.alpha
					arg_253_1.var_.characterEffect10035 = var_256_28
				end

				arg_253_1.var_.alphaOldValue10035 = 0
			end

			local var_256_29 = 0.333333333333333

			if var_256_27 <= arg_253_1.time_ and arg_253_1.time_ < var_256_27 + var_256_29 then
				local var_256_30 = (arg_253_1.time_ - var_256_27) / var_256_29
				local var_256_31 = Mathf.Lerp(arg_253_1.var_.alphaOldValue10035, 1, var_256_30)

				if arg_253_1.var_.characterEffect10035 then
					arg_253_1.var_.characterEffect10035.alpha = var_256_31
				end
			end

			if arg_253_1.time_ >= var_256_27 + var_256_29 and arg_253_1.time_ < var_256_27 + var_256_29 + arg_256_0 and arg_253_1.var_.characterEffect10035 then
				arg_253_1.var_.characterEffect10035.alpha = 1
			end

			local var_256_32 = 0
			local var_256_33 = 0.625

			if var_256_32 < arg_253_1.time_ and arg_253_1.time_ <= var_256_32 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_34 = arg_253_1:FormatText(StoryNameCfg[369].name)

				arg_253_1.leftNameTxt_.text = var_256_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_35 = arg_253_1:GetWordFromCfg(117041062)
				local var_256_36 = arg_253_1:FormatText(var_256_35.content)

				arg_253_1.text_.text = var_256_36

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_37 = 25
				local var_256_38 = utf8.len(var_256_36)
				local var_256_39 = var_256_37 <= 0 and var_256_33 or var_256_33 * (var_256_38 / var_256_37)

				if var_256_39 > 0 and var_256_33 < var_256_39 then
					arg_253_1.talkMaxDuration = var_256_39

					if var_256_39 + var_256_32 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_39 + var_256_32
					end
				end

				arg_253_1.text_.text = var_256_36
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041062", "story_v_out_117041.awb") ~= 0 then
					local var_256_40 = manager.audio:GetVoiceLength("story_v_out_117041", "117041062", "story_v_out_117041.awb") / 1000

					if var_256_40 + var_256_32 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_40 + var_256_32
					end

					if var_256_35.prefab_name ~= "" and arg_253_1.actors_[var_256_35.prefab_name] ~= nil then
						local var_256_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_35.prefab_name].transform, "story_v_out_117041", "117041062", "story_v_out_117041.awb")

						arg_253_1:RecordAudio("117041062", var_256_41)
						arg_253_1:RecordAudio("117041062", var_256_41)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_117041", "117041062", "story_v_out_117041.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_117041", "117041062", "story_v_out_117041.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_42 = math.max(var_256_33, arg_253_1.talkMaxDuration)

			if var_256_32 <= arg_253_1.time_ and arg_253_1.time_ < var_256_32 + var_256_42 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_32) / var_256_42

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_32 + var_256_42 and arg_253_1.time_ < var_256_32 + var_256_42 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play117041063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 117041063
		arg_257_1.duration_ = 5.133

		local var_257_0 = {
			zh = 5.1,
			ja = 5.133
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
				arg_257_0:Play117041064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.6

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[369].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(117041063)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 24
				local var_260_6 = utf8.len(var_260_4)
				local var_260_7 = var_260_5 <= 0 and var_260_1 or var_260_1 * (var_260_6 / var_260_5)

				if var_260_7 > 0 and var_260_1 < var_260_7 then
					arg_257_1.talkMaxDuration = var_260_7

					if var_260_7 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_7 + var_260_0
					end
				end

				arg_257_1.text_.text = var_260_4
				arg_257_1.typewritter.percent = 0

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041063", "story_v_out_117041.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041063", "story_v_out_117041.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_117041", "117041063", "story_v_out_117041.awb")

						arg_257_1:RecordAudio("117041063", var_260_9)
						arg_257_1:RecordAudio("117041063", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_117041", "117041063", "story_v_out_117041.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_117041", "117041063", "story_v_out_117041.awb")
				end

				arg_257_1:RecordContent(arg_257_1.text_.text)
			end

			local var_260_10 = math.max(var_260_1, arg_257_1.talkMaxDuration)

			if var_260_0 <= arg_257_1.time_ and arg_257_1.time_ < var_260_0 + var_260_10 then
				arg_257_1.typewritter.percent = (arg_257_1.time_ - var_260_0) / var_260_10

				arg_257_1.typewritter:SetDirty()
			end

			if arg_257_1.time_ >= var_260_0 + var_260_10 and arg_257_1.time_ < var_260_0 + var_260_10 + arg_260_0 then
				arg_257_1.typewritter.percent = 1

				arg_257_1.typewritter:SetDirty()
				arg_257_1:ShowNextGo(true)
			end
		end
	end,
	Play117041064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 117041064
		arg_261_1.duration_ = 4.066

		local var_261_0 = {
			zh = 3.8,
			ja = 4.066
		}
		local var_261_1 = manager.audio:GetLocalizationFlag()

		if var_261_0[var_261_1] ~= nil then
			arg_261_1.duration_ = var_261_0[var_261_1]
		end

		SetActive(arg_261_1.tipsGo_, false)

		function arg_261_1.onSingleLineFinish_()
			arg_261_1.onSingleLineUpdate_ = nil
			arg_261_1.onSingleLineFinish_ = nil
			arg_261_1.state_ = "waiting"
		end

		function arg_261_1.playNext_(arg_263_0)
			if arg_263_0 == 1 then
				arg_261_0:Play117041065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1132"].transform
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 then
				arg_261_1.var_.moveOldPos1132 = var_264_0.localPosition
				var_264_0.localScale = Vector3.New(1, 1, 1)

				arg_261_1:CheckSpriteTmpPos("1132", 2)

				local var_264_2 = var_264_0.childCount

				for iter_264_0 = 0, var_264_2 - 1 do
					local var_264_3 = var_264_0:GetChild(iter_264_0)

					if var_264_3.name == "split_6" or not string.find(var_264_3.name, "split") then
						var_264_3.gameObject:SetActive(true)
					else
						var_264_3.gameObject:SetActive(false)
					end
				end
			end

			local var_264_4 = 0.001

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_4 then
				local var_264_5 = (arg_261_1.time_ - var_264_1) / var_264_4
				local var_264_6 = Vector3.New(-390, -413, -185)

				var_264_0.localPosition = Vector3.Lerp(arg_261_1.var_.moveOldPos1132, var_264_6, var_264_5)
			end

			if arg_261_1.time_ >= var_264_1 + var_264_4 and arg_261_1.time_ < var_264_1 + var_264_4 + arg_264_0 then
				var_264_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_264_7 = arg_261_1.actors_["1132"]
			local var_264_8 = 0

			if var_264_8 < arg_261_1.time_ and arg_261_1.time_ <= var_264_8 + arg_264_0 and arg_261_1.var_.actorSpriteComps1132 == nil then
				arg_261_1.var_.actorSpriteComps1132 = var_264_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_264_9 = 0.2

			if var_264_8 <= arg_261_1.time_ and arg_261_1.time_ < var_264_8 + var_264_9 then
				local var_264_10 = (arg_261_1.time_ - var_264_8) / var_264_9

				if arg_261_1.var_.actorSpriteComps1132 then
					for iter_264_1, iter_264_2 in pairs(arg_261_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_264_2 then
							local var_264_11 = Mathf.Lerp(iter_264_2.color.r, 1, var_264_10)

							iter_264_2.color = Color.New(var_264_11, var_264_11, var_264_11)
						end
					end
				end
			end

			if arg_261_1.time_ >= var_264_8 + var_264_9 and arg_261_1.time_ < var_264_8 + var_264_9 + arg_264_0 and arg_261_1.var_.actorSpriteComps1132 then
				local var_264_12 = 1

				for iter_264_3, iter_264_4 in pairs(arg_261_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_264_4 then
						iter_264_4.color = Color.New(var_264_12, var_264_12, var_264_12)
					end
				end

				arg_261_1.var_.actorSpriteComps1132 = nil
			end

			local var_264_13 = arg_261_1.actors_["10035"]
			local var_264_14 = 0

			if var_264_14 < arg_261_1.time_ and arg_261_1.time_ <= var_264_14 + arg_264_0 and arg_261_1.var_.actorSpriteComps10035 == nil then
				arg_261_1.var_.actorSpriteComps10035 = var_264_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_264_15 = 0.2

			if var_264_14 <= arg_261_1.time_ and arg_261_1.time_ < var_264_14 + var_264_15 then
				local var_264_16 = (arg_261_1.time_ - var_264_14) / var_264_15

				if arg_261_1.var_.actorSpriteComps10035 then
					for iter_264_5, iter_264_6 in pairs(arg_261_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_264_6 then
							local var_264_17 = Mathf.Lerp(iter_264_6.color.r, 0.5, var_264_16)

							iter_264_6.color = Color.New(var_264_17, var_264_17, var_264_17)
						end
					end
				end
			end

			if arg_261_1.time_ >= var_264_14 + var_264_15 and arg_261_1.time_ < var_264_14 + var_264_15 + arg_264_0 and arg_261_1.var_.actorSpriteComps10035 then
				local var_264_18 = 0.5

				for iter_264_7, iter_264_8 in pairs(arg_261_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_264_8 then
						iter_264_8.color = Color.New(var_264_18, var_264_18, var_264_18)
					end
				end

				arg_261_1.var_.actorSpriteComps10035 = nil
			end

			local var_264_19 = arg_261_1.actors_["10035"]
			local var_264_20 = 0

			if var_264_20 < arg_261_1.time_ and arg_261_1.time_ <= var_264_20 + arg_264_0 then
				local var_264_21 = var_264_19:GetComponentInChildren(typeof(CanvasGroup))

				if var_264_21 then
					arg_261_1.var_.alphaOldValue10035 = var_264_21.alpha
					arg_261_1.var_.characterEffect10035 = var_264_21
				end

				arg_261_1.var_.alphaOldValue10035 = 0
			end

			local var_264_22 = 0.0166666666666667

			if var_264_20 <= arg_261_1.time_ and arg_261_1.time_ < var_264_20 + var_264_22 then
				local var_264_23 = (arg_261_1.time_ - var_264_20) / var_264_22
				local var_264_24 = Mathf.Lerp(arg_261_1.var_.alphaOldValue10035, 1, var_264_23)

				if arg_261_1.var_.characterEffect10035 then
					arg_261_1.var_.characterEffect10035.alpha = var_264_24
				end
			end

			if arg_261_1.time_ >= var_264_20 + var_264_22 and arg_261_1.time_ < var_264_20 + var_264_22 + arg_264_0 and arg_261_1.var_.characterEffect10035 then
				arg_261_1.var_.characterEffect10035.alpha = 1
			end

			local var_264_25 = 0
			local var_264_26 = 0.5

			if var_264_25 < arg_261_1.time_ and arg_261_1.time_ <= var_264_25 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_27 = arg_261_1:FormatText(StoryNameCfg[61].name)

				arg_261_1.leftNameTxt_.text = var_264_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_28 = arg_261_1:GetWordFromCfg(117041064)
				local var_264_29 = arg_261_1:FormatText(var_264_28.content)

				arg_261_1.text_.text = var_264_29

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_30 = 20
				local var_264_31 = utf8.len(var_264_29)
				local var_264_32 = var_264_30 <= 0 and var_264_26 or var_264_26 * (var_264_31 / var_264_30)

				if var_264_32 > 0 and var_264_26 < var_264_32 then
					arg_261_1.talkMaxDuration = var_264_32

					if var_264_32 + var_264_25 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_32 + var_264_25
					end
				end

				arg_261_1.text_.text = var_264_29
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041064", "story_v_out_117041.awb") ~= 0 then
					local var_264_33 = manager.audio:GetVoiceLength("story_v_out_117041", "117041064", "story_v_out_117041.awb") / 1000

					if var_264_33 + var_264_25 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_33 + var_264_25
					end

					if var_264_28.prefab_name ~= "" and arg_261_1.actors_[var_264_28.prefab_name] ~= nil then
						local var_264_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_28.prefab_name].transform, "story_v_out_117041", "117041064", "story_v_out_117041.awb")

						arg_261_1:RecordAudio("117041064", var_264_34)
						arg_261_1:RecordAudio("117041064", var_264_34)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_117041", "117041064", "story_v_out_117041.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_117041", "117041064", "story_v_out_117041.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_35 = math.max(var_264_26, arg_261_1.talkMaxDuration)

			if var_264_25 <= arg_261_1.time_ and arg_261_1.time_ < var_264_25 + var_264_35 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_25) / var_264_35

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_25 + var_264_35 and arg_261_1.time_ < var_264_25 + var_264_35 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play117041065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 117041065
		arg_265_1.duration_ = 2.833

		local var_265_0 = {
			zh = 1.466,
			ja = 2.833
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
				arg_265_0:Play117041066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["10035"].transform
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 then
				arg_265_1.var_.moveOldPos10035 = var_268_0.localPosition
				var_268_0.localScale = Vector3.New(1, 1, 1)

				arg_265_1:CheckSpriteTmpPos("10035", 4)

				local var_268_2 = var_268_0.childCount

				for iter_268_0 = 0, var_268_2 - 1 do
					local var_268_3 = var_268_0:GetChild(iter_268_0)

					if var_268_3.name == "split_4" or not string.find(var_268_3.name, "split") then
						var_268_3.gameObject:SetActive(true)
					else
						var_268_3.gameObject:SetActive(false)
					end
				end
			end

			local var_268_4 = 0.001

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_4 then
				local var_268_5 = (arg_265_1.time_ - var_268_1) / var_268_4
				local var_268_6 = Vector3.New(390, -410, -235)

				var_268_0.localPosition = Vector3.Lerp(arg_265_1.var_.moveOldPos10035, var_268_6, var_268_5)
			end

			if arg_265_1.time_ >= var_268_1 + var_268_4 and arg_265_1.time_ < var_268_1 + var_268_4 + arg_268_0 then
				var_268_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_268_7 = arg_265_1.actors_["1132"]
			local var_268_8 = 0

			if var_268_8 < arg_265_1.time_ and arg_265_1.time_ <= var_268_8 + arg_268_0 and arg_265_1.var_.actorSpriteComps1132 == nil then
				arg_265_1.var_.actorSpriteComps1132 = var_268_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_9 = 0.2

			if var_268_8 <= arg_265_1.time_ and arg_265_1.time_ < var_268_8 + var_268_9 then
				local var_268_10 = (arg_265_1.time_ - var_268_8) / var_268_9

				if arg_265_1.var_.actorSpriteComps1132 then
					for iter_268_1, iter_268_2 in pairs(arg_265_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_268_2 then
							local var_268_11 = Mathf.Lerp(iter_268_2.color.r, 0.5, var_268_10)

							iter_268_2.color = Color.New(var_268_11, var_268_11, var_268_11)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_8 + var_268_9 and arg_265_1.time_ < var_268_8 + var_268_9 + arg_268_0 and arg_265_1.var_.actorSpriteComps1132 then
				local var_268_12 = 0.5

				for iter_268_3, iter_268_4 in pairs(arg_265_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_268_4 then
						iter_268_4.color = Color.New(var_268_12, var_268_12, var_268_12)
					end
				end

				arg_265_1.var_.actorSpriteComps1132 = nil
			end

			local var_268_13 = arg_265_1.actors_["10035"]
			local var_268_14 = 0

			if var_268_14 < arg_265_1.time_ and arg_265_1.time_ <= var_268_14 + arg_268_0 and arg_265_1.var_.actorSpriteComps10035 == nil then
				arg_265_1.var_.actorSpriteComps10035 = var_268_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_268_15 = 0.2

			if var_268_14 <= arg_265_1.time_ and arg_265_1.time_ < var_268_14 + var_268_15 then
				local var_268_16 = (arg_265_1.time_ - var_268_14) / var_268_15

				if arg_265_1.var_.actorSpriteComps10035 then
					for iter_268_5, iter_268_6 in pairs(arg_265_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_268_6 then
							local var_268_17 = Mathf.Lerp(iter_268_6.color.r, 1, var_268_16)

							iter_268_6.color = Color.New(var_268_17, var_268_17, var_268_17)
						end
					end
				end
			end

			if arg_265_1.time_ >= var_268_14 + var_268_15 and arg_265_1.time_ < var_268_14 + var_268_15 + arg_268_0 and arg_265_1.var_.actorSpriteComps10035 then
				local var_268_18 = 1

				for iter_268_7, iter_268_8 in pairs(arg_265_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_268_8 then
						iter_268_8.color = Color.New(var_268_18, var_268_18, var_268_18)
					end
				end

				arg_265_1.var_.actorSpriteComps10035 = nil
			end

			local var_268_19 = 0
			local var_268_20 = 0.075

			if var_268_19 < arg_265_1.time_ and arg_265_1.time_ <= var_268_19 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_21 = arg_265_1:FormatText(StoryNameCfg[369].name)

				arg_265_1.leftNameTxt_.text = var_268_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_22 = arg_265_1:GetWordFromCfg(117041065)
				local var_268_23 = arg_265_1:FormatText(var_268_22.content)

				arg_265_1.text_.text = var_268_23

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_24 = 3
				local var_268_25 = utf8.len(var_268_23)
				local var_268_26 = var_268_24 <= 0 and var_268_20 or var_268_20 * (var_268_25 / var_268_24)

				if var_268_26 > 0 and var_268_20 < var_268_26 then
					arg_265_1.talkMaxDuration = var_268_26

					if var_268_26 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_26 + var_268_19
					end
				end

				arg_265_1.text_.text = var_268_23
				arg_265_1.typewritter.percent = 0

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041065", "story_v_out_117041.awb") ~= 0 then
					local var_268_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041065", "story_v_out_117041.awb") / 1000

					if var_268_27 + var_268_19 > arg_265_1.duration_ then
						arg_265_1.duration_ = var_268_27 + var_268_19
					end

					if var_268_22.prefab_name ~= "" and arg_265_1.actors_[var_268_22.prefab_name] ~= nil then
						local var_268_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_265_1.actors_[var_268_22.prefab_name].transform, "story_v_out_117041", "117041065", "story_v_out_117041.awb")

						arg_265_1:RecordAudio("117041065", var_268_28)
						arg_265_1:RecordAudio("117041065", var_268_28)
					else
						arg_265_1:AudioAction("play", "voice", "story_v_out_117041", "117041065", "story_v_out_117041.awb")
					end

					arg_265_1:RecordHistoryTalkVoice("story_v_out_117041", "117041065", "story_v_out_117041.awb")
				end

				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_29 = math.max(var_268_20, arg_265_1.talkMaxDuration)

			if var_268_19 <= arg_265_1.time_ and arg_265_1.time_ < var_268_19 + var_268_29 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_19) / var_268_29

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_19 + var_268_29 and arg_265_1.time_ < var_268_19 + var_268_29 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play117041066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 117041066
		arg_269_1.duration_ = 5

		SetActive(arg_269_1.tipsGo_, false)

		function arg_269_1.onSingleLineFinish_()
			arg_269_1.onSingleLineUpdate_ = nil
			arg_269_1.onSingleLineFinish_ = nil
			arg_269_1.state_ = "waiting"
		end

		function arg_269_1.playNext_(arg_271_0)
			if arg_271_0 == 1 then
				arg_269_0:Play117041067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["10035"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.actorSpriteComps10035 == nil then
				arg_269_1.var_.actorSpriteComps10035 = var_272_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.actorSpriteComps10035 then
					for iter_272_0, iter_272_1 in pairs(arg_269_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_272_1 then
							local var_272_4 = Mathf.Lerp(iter_272_1.color.r, 0.5, var_272_3)

							iter_272_1.color = Color.New(var_272_4, var_272_4, var_272_4)
						end
					end
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.actorSpriteComps10035 then
				local var_272_5 = 0.5

				for iter_272_2, iter_272_3 in pairs(arg_269_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_272_3 then
						iter_272_3.color = Color.New(var_272_5, var_272_5, var_272_5)
					end
				end

				arg_269_1.var_.actorSpriteComps10035 = nil
			end

			local var_272_6 = 0
			local var_272_7 = 0.975

			if var_272_6 < arg_269_1.time_ and arg_269_1.time_ <= var_272_6 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, false)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_8 = arg_269_1:GetWordFromCfg(117041066)
				local var_272_9 = arg_269_1:FormatText(var_272_8.content)

				arg_269_1.text_.text = var_272_9

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_10 = 39
				local var_272_11 = utf8.len(var_272_9)
				local var_272_12 = var_272_10 <= 0 and var_272_7 or var_272_7 * (var_272_11 / var_272_10)

				if var_272_12 > 0 and var_272_7 < var_272_12 then
					arg_269_1.talkMaxDuration = var_272_12

					if var_272_12 + var_272_6 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_12 + var_272_6
					end
				end

				arg_269_1.text_.text = var_272_9
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)
				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_13 = math.max(var_272_7, arg_269_1.talkMaxDuration)

			if var_272_6 <= arg_269_1.time_ and arg_269_1.time_ < var_272_6 + var_272_13 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_6) / var_272_13

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_6 + var_272_13 and arg_269_1.time_ < var_272_6 + var_272_13 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play117041067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 117041067
		arg_273_1.duration_ = 7.8

		local var_273_0 = {
			zh = 6.9,
			ja = 7.8
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
				arg_273_0:Play117041068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = arg_273_1.actors_["10035"]
			local var_276_1 = 0

			if var_276_1 < arg_273_1.time_ and arg_273_1.time_ <= var_276_1 + arg_276_0 and arg_273_1.var_.actorSpriteComps10035 == nil then
				arg_273_1.var_.actorSpriteComps10035 = var_276_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_276_2 = 0.2

			if var_276_1 <= arg_273_1.time_ and arg_273_1.time_ < var_276_1 + var_276_2 then
				local var_276_3 = (arg_273_1.time_ - var_276_1) / var_276_2

				if arg_273_1.var_.actorSpriteComps10035 then
					for iter_276_0, iter_276_1 in pairs(arg_273_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_276_1 then
							local var_276_4 = Mathf.Lerp(iter_276_1.color.r, 1, var_276_3)

							iter_276_1.color = Color.New(var_276_4, var_276_4, var_276_4)
						end
					end
				end
			end

			if arg_273_1.time_ >= var_276_1 + var_276_2 and arg_273_1.time_ < var_276_1 + var_276_2 + arg_276_0 and arg_273_1.var_.actorSpriteComps10035 then
				local var_276_5 = 1

				for iter_276_2, iter_276_3 in pairs(arg_273_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_276_3 then
						iter_276_3.color = Color.New(var_276_5, var_276_5, var_276_5)
					end
				end

				arg_273_1.var_.actorSpriteComps10035 = nil
			end

			local var_276_6 = 0
			local var_276_7 = 0.725

			if var_276_6 < arg_273_1.time_ and arg_273_1.time_ <= var_276_6 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_8 = arg_273_1:FormatText(StoryNameCfg[369].name)

				arg_273_1.leftNameTxt_.text = var_276_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_9 = arg_273_1:GetWordFromCfg(117041067)
				local var_276_10 = arg_273_1:FormatText(var_276_9.content)

				arg_273_1.text_.text = var_276_10

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_11 = 29
				local var_276_12 = utf8.len(var_276_10)
				local var_276_13 = var_276_11 <= 0 and var_276_7 or var_276_7 * (var_276_12 / var_276_11)

				if var_276_13 > 0 and var_276_7 < var_276_13 then
					arg_273_1.talkMaxDuration = var_276_13

					if var_276_13 + var_276_6 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_13 + var_276_6
					end
				end

				arg_273_1.text_.text = var_276_10
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041067", "story_v_out_117041.awb") ~= 0 then
					local var_276_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041067", "story_v_out_117041.awb") / 1000

					if var_276_14 + var_276_6 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_14 + var_276_6
					end

					if var_276_9.prefab_name ~= "" and arg_273_1.actors_[var_276_9.prefab_name] ~= nil then
						local var_276_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_9.prefab_name].transform, "story_v_out_117041", "117041067", "story_v_out_117041.awb")

						arg_273_1:RecordAudio("117041067", var_276_15)
						arg_273_1:RecordAudio("117041067", var_276_15)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_117041", "117041067", "story_v_out_117041.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_117041", "117041067", "story_v_out_117041.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_16 = math.max(var_276_7, arg_273_1.talkMaxDuration)

			if var_276_6 <= arg_273_1.time_ and arg_273_1.time_ < var_276_6 + var_276_16 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_6) / var_276_16

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_6 + var_276_16 and arg_273_1.time_ < var_276_6 + var_276_16 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play117041068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 117041068
		arg_277_1.duration_ = 6.3

		local var_277_0 = {
			zh = 6.3,
			ja = 1.6
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
				arg_277_0:Play117041069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.625

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[369].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(117041068)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 25
				local var_280_6 = utf8.len(var_280_4)
				local var_280_7 = var_280_5 <= 0 and var_280_1 or var_280_1 * (var_280_6 / var_280_5)

				if var_280_7 > 0 and var_280_1 < var_280_7 then
					arg_277_1.talkMaxDuration = var_280_7

					if var_280_7 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_7 + var_280_0
					end
				end

				arg_277_1.text_.text = var_280_4
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041068", "story_v_out_117041.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041068", "story_v_out_117041.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_117041", "117041068", "story_v_out_117041.awb")

						arg_277_1:RecordAudio("117041068", var_280_9)
						arg_277_1:RecordAudio("117041068", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_117041", "117041068", "story_v_out_117041.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_117041", "117041068", "story_v_out_117041.awb")
				end

				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_10 = math.max(var_280_1, arg_277_1.talkMaxDuration)

			if var_280_0 <= arg_277_1.time_ and arg_277_1.time_ < var_280_0 + var_280_10 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_0) / var_280_10

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_0 + var_280_10 and arg_277_1.time_ < var_280_0 + var_280_10 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play117041069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 117041069
		arg_281_1.duration_ = 6.233

		local var_281_0 = {
			zh = 4.5,
			ja = 6.233
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
				arg_281_0:Play117041070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1132"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.actorSpriteComps1132 == nil then
				arg_281_1.var_.actorSpriteComps1132 = var_284_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_2 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.actorSpriteComps1132 then
					for iter_284_0, iter_284_1 in pairs(arg_281_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_284_1 then
							local var_284_4 = Mathf.Lerp(iter_284_1.color.r, 1, var_284_3)

							iter_284_1.color = Color.New(var_284_4, var_284_4, var_284_4)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.actorSpriteComps1132 then
				local var_284_5 = 1

				for iter_284_2, iter_284_3 in pairs(arg_281_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_284_3 then
						iter_284_3.color = Color.New(var_284_5, var_284_5, var_284_5)
					end
				end

				arg_281_1.var_.actorSpriteComps1132 = nil
			end

			local var_284_6 = arg_281_1.actors_["10035"]
			local var_284_7 = 0

			if var_284_7 < arg_281_1.time_ and arg_281_1.time_ <= var_284_7 + arg_284_0 and arg_281_1.var_.actorSpriteComps10035 == nil then
				arg_281_1.var_.actorSpriteComps10035 = var_284_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_284_8 = 0.2

			if var_284_7 <= arg_281_1.time_ and arg_281_1.time_ < var_284_7 + var_284_8 then
				local var_284_9 = (arg_281_1.time_ - var_284_7) / var_284_8

				if arg_281_1.var_.actorSpriteComps10035 then
					for iter_284_4, iter_284_5 in pairs(arg_281_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_284_5 then
							local var_284_10 = Mathf.Lerp(iter_284_5.color.r, 0.5, var_284_9)

							iter_284_5.color = Color.New(var_284_10, var_284_10, var_284_10)
						end
					end
				end
			end

			if arg_281_1.time_ >= var_284_7 + var_284_8 and arg_281_1.time_ < var_284_7 + var_284_8 + arg_284_0 and arg_281_1.var_.actorSpriteComps10035 then
				local var_284_11 = 0.5

				for iter_284_6, iter_284_7 in pairs(arg_281_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_284_7 then
						iter_284_7.color = Color.New(var_284_11, var_284_11, var_284_11)
					end
				end

				arg_281_1.var_.actorSpriteComps10035 = nil
			end

			local var_284_12 = arg_281_1.actors_["10035"]
			local var_284_13 = 0

			if var_284_13 < arg_281_1.time_ and arg_281_1.time_ <= var_284_13 + arg_284_0 then
				local var_284_14 = var_284_12:GetComponentInChildren(typeof(CanvasGroup))

				if var_284_14 then
					arg_281_1.var_.alphaOldValue10035 = var_284_14.alpha
					arg_281_1.var_.characterEffect10035 = var_284_14
				end

				arg_281_1.var_.alphaOldValue10035 = 0
			end

			local var_284_15 = 0.0166666666666667

			if var_284_13 <= arg_281_1.time_ and arg_281_1.time_ < var_284_13 + var_284_15 then
				local var_284_16 = (arg_281_1.time_ - var_284_13) / var_284_15
				local var_284_17 = Mathf.Lerp(arg_281_1.var_.alphaOldValue10035, 1, var_284_16)

				if arg_281_1.var_.characterEffect10035 then
					arg_281_1.var_.characterEffect10035.alpha = var_284_17
				end
			end

			if arg_281_1.time_ >= var_284_13 + var_284_15 and arg_281_1.time_ < var_284_13 + var_284_15 + arg_284_0 and arg_281_1.var_.characterEffect10035 then
				arg_281_1.var_.characterEffect10035.alpha = 1
			end

			local var_284_18 = 0
			local var_284_19 = 0.575

			if var_284_18 < arg_281_1.time_ and arg_281_1.time_ <= var_284_18 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_20 = arg_281_1:FormatText(StoryNameCfg[61].name)

				arg_281_1.leftNameTxt_.text = var_284_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_21 = arg_281_1:GetWordFromCfg(117041069)
				local var_284_22 = arg_281_1:FormatText(var_284_21.content)

				arg_281_1.text_.text = var_284_22

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_23 = 23
				local var_284_24 = utf8.len(var_284_22)
				local var_284_25 = var_284_23 <= 0 and var_284_19 or var_284_19 * (var_284_24 / var_284_23)

				if var_284_25 > 0 and var_284_19 < var_284_25 then
					arg_281_1.talkMaxDuration = var_284_25

					if var_284_25 + var_284_18 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_25 + var_284_18
					end
				end

				arg_281_1.text_.text = var_284_22
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041069", "story_v_out_117041.awb") ~= 0 then
					local var_284_26 = manager.audio:GetVoiceLength("story_v_out_117041", "117041069", "story_v_out_117041.awb") / 1000

					if var_284_26 + var_284_18 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_26 + var_284_18
					end

					if var_284_21.prefab_name ~= "" and arg_281_1.actors_[var_284_21.prefab_name] ~= nil then
						local var_284_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_21.prefab_name].transform, "story_v_out_117041", "117041069", "story_v_out_117041.awb")

						arg_281_1:RecordAudio("117041069", var_284_27)
						arg_281_1:RecordAudio("117041069", var_284_27)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_117041", "117041069", "story_v_out_117041.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_117041", "117041069", "story_v_out_117041.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_28 = math.max(var_284_19, arg_281_1.talkMaxDuration)

			if var_284_18 <= arg_281_1.time_ and arg_281_1.time_ < var_284_18 + var_284_28 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_18) / var_284_28

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_18 + var_284_28 and arg_281_1.time_ < var_284_18 + var_284_28 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play117041070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 117041070
		arg_285_1.duration_ = 5.333

		local var_285_0 = {
			zh = 3.266,
			ja = 5.333
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
				arg_285_0:Play117041071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = arg_285_1.actors_["1132"]
			local var_288_1 = 0

			if var_288_1 < arg_285_1.time_ and arg_285_1.time_ <= var_288_1 + arg_288_0 and arg_285_1.var_.actorSpriteComps1132 == nil then
				arg_285_1.var_.actorSpriteComps1132 = var_288_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_2 = 0.2

			if var_288_1 <= arg_285_1.time_ and arg_285_1.time_ < var_288_1 + var_288_2 then
				local var_288_3 = (arg_285_1.time_ - var_288_1) / var_288_2

				if arg_285_1.var_.actorSpriteComps1132 then
					for iter_288_0, iter_288_1 in pairs(arg_285_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_288_1 then
							local var_288_4 = Mathf.Lerp(iter_288_1.color.r, 0.5, var_288_3)

							iter_288_1.color = Color.New(var_288_4, var_288_4, var_288_4)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_1 + var_288_2 and arg_285_1.time_ < var_288_1 + var_288_2 + arg_288_0 and arg_285_1.var_.actorSpriteComps1132 then
				local var_288_5 = 0.5

				for iter_288_2, iter_288_3 in pairs(arg_285_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_288_3 then
						iter_288_3.color = Color.New(var_288_5, var_288_5, var_288_5)
					end
				end

				arg_285_1.var_.actorSpriteComps1132 = nil
			end

			local var_288_6 = arg_285_1.actors_["10035"].transform
			local var_288_7 = 0

			if var_288_7 < arg_285_1.time_ and arg_285_1.time_ <= var_288_7 + arg_288_0 then
				arg_285_1.var_.moveOldPos10035 = var_288_6.localPosition
				var_288_6.localScale = Vector3.New(1, 1, 1)

				arg_285_1:CheckSpriteTmpPos("10035", 4)

				local var_288_8 = var_288_6.childCount

				for iter_288_4 = 0, var_288_8 - 1 do
					local var_288_9 = var_288_6:GetChild(iter_288_4)

					if var_288_9.name == "split_5" or not string.find(var_288_9.name, "split") then
						var_288_9.gameObject:SetActive(true)
					else
						var_288_9.gameObject:SetActive(false)
					end
				end
			end

			local var_288_10 = 0.001

			if var_288_7 <= arg_285_1.time_ and arg_285_1.time_ < var_288_7 + var_288_10 then
				local var_288_11 = (arg_285_1.time_ - var_288_7) / var_288_10
				local var_288_12 = Vector3.New(390, -410, -235)

				var_288_6.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos10035, var_288_12, var_288_11)
			end

			if arg_285_1.time_ >= var_288_7 + var_288_10 and arg_285_1.time_ < var_288_7 + var_288_10 + arg_288_0 then
				var_288_6.localPosition = Vector3.New(390, -410, -235)
			end

			local var_288_13 = arg_285_1.actors_["10035"]
			local var_288_14 = 0

			if var_288_14 < arg_285_1.time_ and arg_285_1.time_ <= var_288_14 + arg_288_0 and arg_285_1.var_.actorSpriteComps10035 == nil then
				arg_285_1.var_.actorSpriteComps10035 = var_288_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_288_15 = 0.2

			if var_288_14 <= arg_285_1.time_ and arg_285_1.time_ < var_288_14 + var_288_15 then
				local var_288_16 = (arg_285_1.time_ - var_288_14) / var_288_15

				if arg_285_1.var_.actorSpriteComps10035 then
					for iter_288_5, iter_288_6 in pairs(arg_285_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_288_6 then
							local var_288_17 = Mathf.Lerp(iter_288_6.color.r, 1, var_288_16)

							iter_288_6.color = Color.New(var_288_17, var_288_17, var_288_17)
						end
					end
				end
			end

			if arg_285_1.time_ >= var_288_14 + var_288_15 and arg_285_1.time_ < var_288_14 + var_288_15 + arg_288_0 and arg_285_1.var_.actorSpriteComps10035 then
				local var_288_18 = 1

				for iter_288_7, iter_288_8 in pairs(arg_285_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_288_8 then
						iter_288_8.color = Color.New(var_288_18, var_288_18, var_288_18)
					end
				end

				arg_285_1.var_.actorSpriteComps10035 = nil
			end

			local var_288_19 = 0
			local var_288_20 = 0.35

			if var_288_19 < arg_285_1.time_ and arg_285_1.time_ <= var_288_19 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_21 = arg_285_1:FormatText(StoryNameCfg[369].name)

				arg_285_1.leftNameTxt_.text = var_288_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_22 = arg_285_1:GetWordFromCfg(117041070)
				local var_288_23 = arg_285_1:FormatText(var_288_22.content)

				arg_285_1.text_.text = var_288_23

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_24 = 14
				local var_288_25 = utf8.len(var_288_23)
				local var_288_26 = var_288_24 <= 0 and var_288_20 or var_288_20 * (var_288_25 / var_288_24)

				if var_288_26 > 0 and var_288_20 < var_288_26 then
					arg_285_1.talkMaxDuration = var_288_26

					if var_288_26 + var_288_19 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_26 + var_288_19
					end
				end

				arg_285_1.text_.text = var_288_23
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041070", "story_v_out_117041.awb") ~= 0 then
					local var_288_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041070", "story_v_out_117041.awb") / 1000

					if var_288_27 + var_288_19 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_27 + var_288_19
					end

					if var_288_22.prefab_name ~= "" and arg_285_1.actors_[var_288_22.prefab_name] ~= nil then
						local var_288_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_22.prefab_name].transform, "story_v_out_117041", "117041070", "story_v_out_117041.awb")

						arg_285_1:RecordAudio("117041070", var_288_28)
						arg_285_1:RecordAudio("117041070", var_288_28)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_117041", "117041070", "story_v_out_117041.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_117041", "117041070", "story_v_out_117041.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_29 = math.max(var_288_20, arg_285_1.talkMaxDuration)

			if var_288_19 <= arg_285_1.time_ and arg_285_1.time_ < var_288_19 + var_288_29 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_19) / var_288_29

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_19 + var_288_29 and arg_285_1.time_ < var_288_19 + var_288_29 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play117041071 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 117041071
		arg_289_1.duration_ = 5

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play117041072(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = arg_289_1.actors_["10035"].transform
			local var_292_1 = 0

			if var_292_1 < arg_289_1.time_ and arg_289_1.time_ <= var_292_1 + arg_292_0 then
				arg_289_1.var_.moveOldPos10035 = var_292_0.localPosition
				var_292_0.localScale = Vector3.New(1, 1, 1)

				arg_289_1:CheckSpriteTmpPos("10035", 4)

				local var_292_2 = var_292_0.childCount

				for iter_292_0 = 0, var_292_2 - 1 do
					local var_292_3 = var_292_0:GetChild(iter_292_0)

					if var_292_3.name == "split_4" or not string.find(var_292_3.name, "split") then
						var_292_3.gameObject:SetActive(true)
					else
						var_292_3.gameObject:SetActive(false)
					end
				end
			end

			local var_292_4 = 0.001

			if var_292_1 <= arg_289_1.time_ and arg_289_1.time_ < var_292_1 + var_292_4 then
				local var_292_5 = (arg_289_1.time_ - var_292_1) / var_292_4
				local var_292_6 = Vector3.New(390, -410, -235)

				var_292_0.localPosition = Vector3.Lerp(arg_289_1.var_.moveOldPos10035, var_292_6, var_292_5)
			end

			if arg_289_1.time_ >= var_292_1 + var_292_4 and arg_289_1.time_ < var_292_1 + var_292_4 + arg_292_0 then
				var_292_0.localPosition = Vector3.New(390, -410, -235)
			end

			local var_292_7 = 0
			local var_292_8 = 0.75

			if var_292_7 < arg_289_1.time_ and arg_289_1.time_ <= var_292_7 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, false)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_9 = arg_289_1:GetWordFromCfg(117041071)
				local var_292_10 = arg_289_1:FormatText(var_292_9.content)

				arg_289_1.text_.text = var_292_10

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_11 = 30
				local var_292_12 = utf8.len(var_292_10)
				local var_292_13 = var_292_11 <= 0 and var_292_8 or var_292_8 * (var_292_12 / var_292_11)

				if var_292_13 > 0 and var_292_8 < var_292_13 then
					arg_289_1.talkMaxDuration = var_292_13

					if var_292_13 + var_292_7 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_13 + var_292_7
					end
				end

				arg_289_1.text_.text = var_292_10
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)
				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_14 = math.max(var_292_8, arg_289_1.talkMaxDuration)

			if var_292_7 <= arg_289_1.time_ and arg_289_1.time_ < var_292_7 + var_292_14 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_7) / var_292_14

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_7 + var_292_14 and arg_289_1.time_ < var_292_7 + var_292_14 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play117041072 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 117041072
		arg_293_1.duration_ = 4.2

		local var_293_0 = {
			zh = 2.5,
			ja = 4.2
		}
		local var_293_1 = manager.audio:GetLocalizationFlag()

		if var_293_0[var_293_1] ~= nil then
			arg_293_1.duration_ = var_293_0[var_293_1]
		end

		SetActive(arg_293_1.tipsGo_, false)

		function arg_293_1.onSingleLineFinish_()
			arg_293_1.onSingleLineUpdate_ = nil
			arg_293_1.onSingleLineFinish_ = nil
			arg_293_1.state_ = "waiting"
		end

		function arg_293_1.playNext_(arg_295_0)
			if arg_295_0 == 1 then
				arg_293_0:Play117041073(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.325

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[367].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, true)
				arg_293_1.iconController_:SetSelectedState("hero")

				arg_293_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(117041072)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 13
				local var_296_6 = utf8.len(var_296_4)
				local var_296_7 = var_296_5 <= 0 and var_296_1 or var_296_1 * (var_296_6 / var_296_5)

				if var_296_7 > 0 and var_296_1 < var_296_7 then
					arg_293_1.talkMaxDuration = var_296_7

					if var_296_7 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_7 + var_296_0
					end
				end

				arg_293_1.text_.text = var_296_4
				arg_293_1.typewritter.percent = 0

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041072", "story_v_out_117041.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041072", "story_v_out_117041.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_117041", "117041072", "story_v_out_117041.awb")

						arg_293_1:RecordAudio("117041072", var_296_9)
						arg_293_1:RecordAudio("117041072", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_117041", "117041072", "story_v_out_117041.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_117041", "117041072", "story_v_out_117041.awb")
				end

				arg_293_1:RecordContent(arg_293_1.text_.text)
			end

			local var_296_10 = math.max(var_296_1, arg_293_1.talkMaxDuration)

			if var_296_0 <= arg_293_1.time_ and arg_293_1.time_ < var_296_0 + var_296_10 then
				arg_293_1.typewritter.percent = (arg_293_1.time_ - var_296_0) / var_296_10

				arg_293_1.typewritter:SetDirty()
			end

			if arg_293_1.time_ >= var_296_0 + var_296_10 and arg_293_1.time_ < var_296_0 + var_296_10 + arg_296_0 then
				arg_293_1.typewritter.percent = 1

				arg_293_1.typewritter:SetDirty()
				arg_293_1:ShowNextGo(true)
			end
		end
	end,
	Play117041073 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 117041073
		arg_297_1.duration_ = 3.066

		local var_297_0 = {
			zh = 3.066,
			ja = 0.999999999999
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
				arg_297_0:Play117041074(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = arg_297_1.actors_["1132"]
			local var_300_1 = 0

			if var_300_1 < arg_297_1.time_ and arg_297_1.time_ <= var_300_1 + arg_300_0 and arg_297_1.var_.actorSpriteComps1132 == nil then
				arg_297_1.var_.actorSpriteComps1132 = var_300_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_300_2 = 0.2

			if var_300_1 <= arg_297_1.time_ and arg_297_1.time_ < var_300_1 + var_300_2 then
				local var_300_3 = (arg_297_1.time_ - var_300_1) / var_300_2

				if arg_297_1.var_.actorSpriteComps1132 then
					for iter_300_0, iter_300_1 in pairs(arg_297_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_300_1 then
							local var_300_4 = Mathf.Lerp(iter_300_1.color.r, 1, var_300_3)

							iter_300_1.color = Color.New(var_300_4, var_300_4, var_300_4)
						end
					end
				end
			end

			if arg_297_1.time_ >= var_300_1 + var_300_2 and arg_297_1.time_ < var_300_1 + var_300_2 + arg_300_0 and arg_297_1.var_.actorSpriteComps1132 then
				local var_300_5 = 1

				for iter_300_2, iter_300_3 in pairs(arg_297_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_300_3 then
						iter_300_3.color = Color.New(var_300_5, var_300_5, var_300_5)
					end
				end

				arg_297_1.var_.actorSpriteComps1132 = nil
			end

			local var_300_6 = 0
			local var_300_7 = 0.05

			if var_300_6 < arg_297_1.time_ and arg_297_1.time_ <= var_300_6 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_8 = arg_297_1:FormatText(StoryNameCfg[61].name)

				arg_297_1.leftNameTxt_.text = var_300_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_9 = arg_297_1:GetWordFromCfg(117041073)
				local var_300_10 = arg_297_1:FormatText(var_300_9.content)

				arg_297_1.text_.text = var_300_10

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_11 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041073", "story_v_out_117041.awb") ~= 0 then
					local var_300_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041073", "story_v_out_117041.awb") / 1000

					if var_300_14 + var_300_6 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_14 + var_300_6
					end

					if var_300_9.prefab_name ~= "" and arg_297_1.actors_[var_300_9.prefab_name] ~= nil then
						local var_300_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_9.prefab_name].transform, "story_v_out_117041", "117041073", "story_v_out_117041.awb")

						arg_297_1:RecordAudio("117041073", var_300_15)
						arg_297_1:RecordAudio("117041073", var_300_15)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_117041", "117041073", "story_v_out_117041.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_117041", "117041073", "story_v_out_117041.awb")
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
	Play117041074 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 117041074
		arg_301_1.duration_ = 1.9

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play117041075(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 0.25

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[61].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(117041074)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 10
				local var_304_6 = utf8.len(var_304_4)
				local var_304_7 = var_304_5 <= 0 and var_304_1 or var_304_1 * (var_304_6 / var_304_5)

				if var_304_7 > 0 and var_304_1 < var_304_7 then
					arg_301_1.talkMaxDuration = var_304_7

					if var_304_7 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_7 + var_304_0
					end
				end

				arg_301_1.text_.text = var_304_4
				arg_301_1.typewritter.percent = 0

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041074", "story_v_out_117041.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041074", "story_v_out_117041.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_117041", "117041074", "story_v_out_117041.awb")

						arg_301_1:RecordAudio("117041074", var_304_9)
						arg_301_1:RecordAudio("117041074", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_117041", "117041074", "story_v_out_117041.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_117041", "117041074", "story_v_out_117041.awb")
				end

				arg_301_1:RecordContent(arg_301_1.text_.text)
			end

			local var_304_10 = math.max(var_304_1, arg_301_1.talkMaxDuration)

			if var_304_0 <= arg_301_1.time_ and arg_301_1.time_ < var_304_0 + var_304_10 then
				arg_301_1.typewritter.percent = (arg_301_1.time_ - var_304_0) / var_304_10

				arg_301_1.typewritter:SetDirty()
			end

			if arg_301_1.time_ >= var_304_0 + var_304_10 and arg_301_1.time_ < var_304_0 + var_304_10 + arg_304_0 then
				arg_301_1.typewritter.percent = 1

				arg_301_1.typewritter:SetDirty()
				arg_301_1:ShowNextGo(true)
			end
		end
	end,
	Play117041075 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 117041075
		arg_305_1.duration_ = 5

		SetActive(arg_305_1.tipsGo_, false)

		function arg_305_1.onSingleLineFinish_()
			arg_305_1.onSingleLineUpdate_ = nil
			arg_305_1.onSingleLineFinish_ = nil
			arg_305_1.state_ = "waiting"
		end

		function arg_305_1.playNext_(arg_307_0)
			if arg_307_0 == 1 then
				arg_305_0:Play117041076(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = arg_305_1.actors_["1132"]
			local var_308_1 = 0

			if var_308_1 < arg_305_1.time_ and arg_305_1.time_ <= var_308_1 + arg_308_0 and arg_305_1.var_.actorSpriteComps1132 == nil then
				arg_305_1.var_.actorSpriteComps1132 = var_308_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_308_2 = 0.2

			if var_308_1 <= arg_305_1.time_ and arg_305_1.time_ < var_308_1 + var_308_2 then
				local var_308_3 = (arg_305_1.time_ - var_308_1) / var_308_2

				if arg_305_1.var_.actorSpriteComps1132 then
					for iter_308_0, iter_308_1 in pairs(arg_305_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_308_1 then
							local var_308_4 = Mathf.Lerp(iter_308_1.color.r, 0.5, var_308_3)

							iter_308_1.color = Color.New(var_308_4, var_308_4, var_308_4)
						end
					end
				end
			end

			if arg_305_1.time_ >= var_308_1 + var_308_2 and arg_305_1.time_ < var_308_1 + var_308_2 + arg_308_0 and arg_305_1.var_.actorSpriteComps1132 then
				local var_308_5 = 0.5

				for iter_308_2, iter_308_3 in pairs(arg_305_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_308_3 then
						iter_308_3.color = Color.New(var_308_5, var_308_5, var_308_5)
					end
				end

				arg_305_1.var_.actorSpriteComps1132 = nil
			end

			local var_308_6 = 0
			local var_308_7 = 0.625

			if var_308_6 < arg_305_1.time_ and arg_305_1.time_ <= var_308_6 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, false)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_8 = arg_305_1:GetWordFromCfg(117041075)
				local var_308_9 = arg_305_1:FormatText(var_308_8.content)

				arg_305_1.text_.text = var_308_9

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_10 = 25
				local var_308_11 = utf8.len(var_308_9)
				local var_308_12 = var_308_10 <= 0 and var_308_7 or var_308_7 * (var_308_11 / var_308_10)

				if var_308_12 > 0 and var_308_7 < var_308_12 then
					arg_305_1.talkMaxDuration = var_308_12

					if var_308_12 + var_308_6 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_12 + var_308_6
					end
				end

				arg_305_1.text_.text = var_308_9
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)
				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_13 = math.max(var_308_7, arg_305_1.talkMaxDuration)

			if var_308_6 <= arg_305_1.time_ and arg_305_1.time_ < var_308_6 + var_308_13 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_6) / var_308_13

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_6 + var_308_13 and arg_305_1.time_ < var_308_6 + var_308_13 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play117041076 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 117041076
		arg_309_1.duration_ = 2.733

		local var_309_0 = {
			zh = 1.366,
			ja = 2.733
		}
		local var_309_1 = manager.audio:GetLocalizationFlag()

		if var_309_0[var_309_1] ~= nil then
			arg_309_1.duration_ = var_309_0[var_309_1]
		end

		SetActive(arg_309_1.tipsGo_, false)

		function arg_309_1.onSingleLineFinish_()
			arg_309_1.onSingleLineUpdate_ = nil
			arg_309_1.onSingleLineFinish_ = nil
			arg_309_1.state_ = "waiting"
		end

		function arg_309_1.playNext_(arg_311_0)
			if arg_311_0 == 1 then
				arg_309_0:Play117041077(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = arg_309_1.actors_["1132"]
			local var_312_1 = 0

			if var_312_1 < arg_309_1.time_ and arg_309_1.time_ <= var_312_1 + arg_312_0 then
				local var_312_2 = var_312_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_312_2 then
					arg_309_1.var_.alphaOldValue1132 = var_312_2.alpha
					arg_309_1.var_.characterEffect1132 = var_312_2
				end

				arg_309_1.var_.alphaOldValue1132 = 1
			end

			local var_312_3 = 0.333333333333333

			if var_312_1 <= arg_309_1.time_ and arg_309_1.time_ < var_312_1 + var_312_3 then
				local var_312_4 = (arg_309_1.time_ - var_312_1) / var_312_3
				local var_312_5 = Mathf.Lerp(arg_309_1.var_.alphaOldValue1132, 0, var_312_4)

				if arg_309_1.var_.characterEffect1132 then
					arg_309_1.var_.characterEffect1132.alpha = var_312_5
				end
			end

			if arg_309_1.time_ >= var_312_1 + var_312_3 and arg_309_1.time_ < var_312_1 + var_312_3 + arg_312_0 and arg_309_1.var_.characterEffect1132 then
				arg_309_1.var_.characterEffect1132.alpha = 0
			end

			local var_312_6 = arg_309_1.actors_["10034"]
			local var_312_7 = 0

			if var_312_7 < arg_309_1.time_ and arg_309_1.time_ <= var_312_7 + arg_312_0 then
				local var_312_8 = var_312_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_312_8 then
					arg_309_1.var_.alphaOldValue10034 = var_312_8.alpha
					arg_309_1.var_.characterEffect10034 = var_312_8
				end

				arg_309_1.var_.alphaOldValue10034 = 0
			end

			local var_312_9 = 0.333333333333333

			if var_312_7 <= arg_309_1.time_ and arg_309_1.time_ < var_312_7 + var_312_9 then
				local var_312_10 = (arg_309_1.time_ - var_312_7) / var_312_9
				local var_312_11 = Mathf.Lerp(arg_309_1.var_.alphaOldValue10034, 1, var_312_10)

				if arg_309_1.var_.characterEffect10034 then
					arg_309_1.var_.characterEffect10034.alpha = var_312_11
				end
			end

			if arg_309_1.time_ >= var_312_7 + var_312_9 and arg_309_1.time_ < var_312_7 + var_312_9 + arg_312_0 and arg_309_1.var_.characterEffect10034 then
				arg_309_1.var_.characterEffect10034.alpha = 1
			end

			local var_312_12 = arg_309_1.actors_["10034"].transform
			local var_312_13 = 0

			if var_312_13 < arg_309_1.time_ and arg_309_1.time_ <= var_312_13 + arg_312_0 then
				arg_309_1.var_.moveOldPos10034 = var_312_12.localPosition
				var_312_12.localScale = Vector3.New(1, 1, 1)

				arg_309_1:CheckSpriteTmpPos("10034", 2)

				local var_312_14 = var_312_12.childCount

				for iter_312_0 = 0, var_312_14 - 1 do
					local var_312_15 = var_312_12:GetChild(iter_312_0)

					if var_312_15.name == "split_2" or not string.find(var_312_15.name, "split") then
						var_312_15.gameObject:SetActive(true)
					else
						var_312_15.gameObject:SetActive(false)
					end
				end
			end

			local var_312_16 = 0.001

			if var_312_13 <= arg_309_1.time_ and arg_309_1.time_ < var_312_13 + var_312_16 then
				local var_312_17 = (arg_309_1.time_ - var_312_13) / var_312_16
				local var_312_18 = Vector3.New(-390, -415, -290)

				var_312_12.localPosition = Vector3.Lerp(arg_309_1.var_.moveOldPos10034, var_312_18, var_312_17)
			end

			if arg_309_1.time_ >= var_312_13 + var_312_16 and arg_309_1.time_ < var_312_13 + var_312_16 + arg_312_0 then
				var_312_12.localPosition = Vector3.New(-390, -415, -290)
			end

			local var_312_19 = arg_309_1.actors_["10034"]
			local var_312_20 = 0

			if var_312_20 < arg_309_1.time_ and arg_309_1.time_ <= var_312_20 + arg_312_0 and arg_309_1.var_.actorSpriteComps10034 == nil then
				arg_309_1.var_.actorSpriteComps10034 = var_312_19:GetComponentsInChildren(typeof(Image), true)
			end

			local var_312_21 = 0.2

			if var_312_20 <= arg_309_1.time_ and arg_309_1.time_ < var_312_20 + var_312_21 then
				local var_312_22 = (arg_309_1.time_ - var_312_20) / var_312_21

				if arg_309_1.var_.actorSpriteComps10034 then
					for iter_312_1, iter_312_2 in pairs(arg_309_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_312_2 then
							local var_312_23 = Mathf.Lerp(iter_312_2.color.r, 1, var_312_22)

							iter_312_2.color = Color.New(var_312_23, var_312_23, var_312_23)
						end
					end
				end
			end

			if arg_309_1.time_ >= var_312_20 + var_312_21 and arg_309_1.time_ < var_312_20 + var_312_21 + arg_312_0 and arg_309_1.var_.actorSpriteComps10034 then
				local var_312_24 = 1

				for iter_312_3, iter_312_4 in pairs(arg_309_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_312_4 then
						iter_312_4.color = Color.New(var_312_24, var_312_24, var_312_24)
					end
				end

				arg_309_1.var_.actorSpriteComps10034 = nil
			end

			local var_312_25 = 0
			local var_312_26 = 0.1

			if var_312_25 < arg_309_1.time_ and arg_309_1.time_ <= var_312_25 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_27 = arg_309_1:FormatText(StoryNameCfg[367].name)

				arg_309_1.leftNameTxt_.text = var_312_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_28 = arg_309_1:GetWordFromCfg(117041076)
				local var_312_29 = arg_309_1:FormatText(var_312_28.content)

				arg_309_1.text_.text = var_312_29

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_30 = 4
				local var_312_31 = utf8.len(var_312_29)
				local var_312_32 = var_312_30 <= 0 and var_312_26 or var_312_26 * (var_312_31 / var_312_30)

				if var_312_32 > 0 and var_312_26 < var_312_32 then
					arg_309_1.talkMaxDuration = var_312_32

					if var_312_32 + var_312_25 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_32 + var_312_25
					end
				end

				arg_309_1.text_.text = var_312_29
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041076", "story_v_out_117041.awb") ~= 0 then
					local var_312_33 = manager.audio:GetVoiceLength("story_v_out_117041", "117041076", "story_v_out_117041.awb") / 1000

					if var_312_33 + var_312_25 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_33 + var_312_25
					end

					if var_312_28.prefab_name ~= "" and arg_309_1.actors_[var_312_28.prefab_name] ~= nil then
						local var_312_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_28.prefab_name].transform, "story_v_out_117041", "117041076", "story_v_out_117041.awb")

						arg_309_1:RecordAudio("117041076", var_312_34)
						arg_309_1:RecordAudio("117041076", var_312_34)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_117041", "117041076", "story_v_out_117041.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_117041", "117041076", "story_v_out_117041.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_35 = math.max(var_312_26, arg_309_1.talkMaxDuration)

			if var_312_25 <= arg_309_1.time_ and arg_309_1.time_ < var_312_25 + var_312_35 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_25) / var_312_35

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_25 + var_312_35 and arg_309_1.time_ < var_312_25 + var_312_35 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play117041077 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 117041077
		arg_313_1.duration_ = 4.966

		local var_313_0 = {
			zh = 2.066,
			ja = 4.966
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
				arg_313_0:Play117041078(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = arg_313_1.actors_["10034"]
			local var_316_1 = 0

			if var_316_1 < arg_313_1.time_ and arg_313_1.time_ <= var_316_1 + arg_316_0 and arg_313_1.var_.actorSpriteComps10034 == nil then
				arg_313_1.var_.actorSpriteComps10034 = var_316_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_2 = 0.2

			if var_316_1 <= arg_313_1.time_ and arg_313_1.time_ < var_316_1 + var_316_2 then
				local var_316_3 = (arg_313_1.time_ - var_316_1) / var_316_2

				if arg_313_1.var_.actorSpriteComps10034 then
					for iter_316_0, iter_316_1 in pairs(arg_313_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_316_1 then
							local var_316_4 = Mathf.Lerp(iter_316_1.color.r, 0.5, var_316_3)

							iter_316_1.color = Color.New(var_316_4, var_316_4, var_316_4)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_1 + var_316_2 and arg_313_1.time_ < var_316_1 + var_316_2 + arg_316_0 and arg_313_1.var_.actorSpriteComps10034 then
				local var_316_5 = 0.5

				for iter_316_2, iter_316_3 in pairs(arg_313_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_316_3 then
						iter_316_3.color = Color.New(var_316_5, var_316_5, var_316_5)
					end
				end

				arg_313_1.var_.actorSpriteComps10034 = nil
			end

			local var_316_6 = arg_313_1.actors_["10035"]
			local var_316_7 = 0

			if var_316_7 < arg_313_1.time_ and arg_313_1.time_ <= var_316_7 + arg_316_0 and arg_313_1.var_.actorSpriteComps10035 == nil then
				arg_313_1.var_.actorSpriteComps10035 = var_316_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_316_8 = 0.2

			if var_316_7 <= arg_313_1.time_ and arg_313_1.time_ < var_316_7 + var_316_8 then
				local var_316_9 = (arg_313_1.time_ - var_316_7) / var_316_8

				if arg_313_1.var_.actorSpriteComps10035 then
					for iter_316_4, iter_316_5 in pairs(arg_313_1.var_.actorSpriteComps10035:ToTable()) do
						if iter_316_5 then
							local var_316_10 = Mathf.Lerp(iter_316_5.color.r, 1, var_316_9)

							iter_316_5.color = Color.New(var_316_10, var_316_10, var_316_10)
						end
					end
				end
			end

			if arg_313_1.time_ >= var_316_7 + var_316_8 and arg_313_1.time_ < var_316_7 + var_316_8 + arg_316_0 and arg_313_1.var_.actorSpriteComps10035 then
				local var_316_11 = 1

				for iter_316_6, iter_316_7 in pairs(arg_313_1.var_.actorSpriteComps10035:ToTable()) do
					if iter_316_7 then
						iter_316_7.color = Color.New(var_316_11, var_316_11, var_316_11)
					end
				end

				arg_313_1.var_.actorSpriteComps10035 = nil
			end

			local var_316_12 = 0
			local var_316_13 = 0.3

			if var_316_12 < arg_313_1.time_ and arg_313_1.time_ <= var_316_12 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_14 = arg_313_1:FormatText(StoryNameCfg[369].name)

				arg_313_1.leftNameTxt_.text = var_316_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_15 = arg_313_1:GetWordFromCfg(117041077)
				local var_316_16 = arg_313_1:FormatText(var_316_15.content)

				arg_313_1.text_.text = var_316_16

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_17 = 12
				local var_316_18 = utf8.len(var_316_16)
				local var_316_19 = var_316_17 <= 0 and var_316_13 or var_316_13 * (var_316_18 / var_316_17)

				if var_316_19 > 0 and var_316_13 < var_316_19 then
					arg_313_1.talkMaxDuration = var_316_19

					if var_316_19 + var_316_12 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_19 + var_316_12
					end
				end

				arg_313_1.text_.text = var_316_16
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041077", "story_v_out_117041.awb") ~= 0 then
					local var_316_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041077", "story_v_out_117041.awb") / 1000

					if var_316_20 + var_316_12 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_20 + var_316_12
					end

					if var_316_15.prefab_name ~= "" and arg_313_1.actors_[var_316_15.prefab_name] ~= nil then
						local var_316_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_15.prefab_name].transform, "story_v_out_117041", "117041077", "story_v_out_117041.awb")

						arg_313_1:RecordAudio("117041077", var_316_21)
						arg_313_1:RecordAudio("117041077", var_316_21)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_117041", "117041077", "story_v_out_117041.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_117041", "117041077", "story_v_out_117041.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_22 = math.max(var_316_13, arg_313_1.talkMaxDuration)

			if var_316_12 <= arg_313_1.time_ and arg_313_1.time_ < var_316_12 + var_316_22 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_12) / var_316_22

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_12 + var_316_22 and arg_313_1.time_ < var_316_12 + var_316_22 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play117041078 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 117041078
		arg_317_1.duration_ = 5

		SetActive(arg_317_1.tipsGo_, false)

		function arg_317_1.onSingleLineFinish_()
			arg_317_1.onSingleLineUpdate_ = nil
			arg_317_1.onSingleLineFinish_ = nil
			arg_317_1.state_ = "waiting"
		end

		function arg_317_1.playNext_(arg_319_0)
			if arg_319_0 == 1 then
				arg_317_0:Play117041079(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = arg_317_1.actors_["10035"]
			local var_320_1 = 0

			if var_320_1 < arg_317_1.time_ and arg_317_1.time_ <= var_320_1 + arg_320_0 then
				local var_320_2 = var_320_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_320_2 then
					arg_317_1.var_.alphaOldValue10035 = var_320_2.alpha
					arg_317_1.var_.characterEffect10035 = var_320_2
				end

				arg_317_1.var_.alphaOldValue10035 = 1
			end

			local var_320_3 = 0.333333333333333

			if var_320_1 <= arg_317_1.time_ and arg_317_1.time_ < var_320_1 + var_320_3 then
				local var_320_4 = (arg_317_1.time_ - var_320_1) / var_320_3
				local var_320_5 = Mathf.Lerp(arg_317_1.var_.alphaOldValue10035, 0, var_320_4)

				if arg_317_1.var_.characterEffect10035 then
					arg_317_1.var_.characterEffect10035.alpha = var_320_5
				end
			end

			if arg_317_1.time_ >= var_320_1 + var_320_3 and arg_317_1.time_ < var_320_1 + var_320_3 + arg_320_0 and arg_317_1.var_.characterEffect10035 then
				arg_317_1.var_.characterEffect10035.alpha = 0
			end

			local var_320_6 = arg_317_1.actors_["10034"]
			local var_320_7 = 0

			if var_320_7 < arg_317_1.time_ and arg_317_1.time_ <= var_320_7 + arg_320_0 then
				local var_320_8 = var_320_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_320_8 then
					arg_317_1.var_.alphaOldValue10034 = var_320_8.alpha
					arg_317_1.var_.characterEffect10034 = var_320_8
				end

				arg_317_1.var_.alphaOldValue10034 = 1
			end

			local var_320_9 = 0.333333333333333

			if var_320_7 <= arg_317_1.time_ and arg_317_1.time_ < var_320_7 + var_320_9 then
				local var_320_10 = (arg_317_1.time_ - var_320_7) / var_320_9
				local var_320_11 = Mathf.Lerp(arg_317_1.var_.alphaOldValue10034, 0, var_320_10)

				if arg_317_1.var_.characterEffect10034 then
					arg_317_1.var_.characterEffect10034.alpha = var_320_11
				end
			end

			if arg_317_1.time_ >= var_320_7 + var_320_9 and arg_317_1.time_ < var_320_7 + var_320_9 + arg_320_0 and arg_317_1.var_.characterEffect10034 then
				arg_317_1.var_.characterEffect10034.alpha = 0
			end

			local var_320_12 = 0
			local var_320_13 = 0.575

			if var_320_12 < arg_317_1.time_ and arg_317_1.time_ <= var_320_12 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, false)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_14 = arg_317_1:GetWordFromCfg(117041078)
				local var_320_15 = arg_317_1:FormatText(var_320_14.content)

				arg_317_1.text_.text = var_320_15

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_16 = 23
				local var_320_17 = utf8.len(var_320_15)
				local var_320_18 = var_320_16 <= 0 and var_320_13 or var_320_13 * (var_320_17 / var_320_16)

				if var_320_18 > 0 and var_320_13 < var_320_18 then
					arg_317_1.talkMaxDuration = var_320_18

					if var_320_18 + var_320_12 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_18 + var_320_12
					end
				end

				arg_317_1.text_.text = var_320_15
				arg_317_1.typewritter.percent = 0

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(false)
				arg_317_1:RecordContent(arg_317_1.text_.text)
			end

			local var_320_19 = math.max(var_320_13, arg_317_1.talkMaxDuration)

			if var_320_12 <= arg_317_1.time_ and arg_317_1.time_ < var_320_12 + var_320_19 then
				arg_317_1.typewritter.percent = (arg_317_1.time_ - var_320_12) / var_320_19

				arg_317_1.typewritter:SetDirty()
			end

			if arg_317_1.time_ >= var_320_12 + var_320_19 and arg_317_1.time_ < var_320_12 + var_320_19 + arg_320_0 then
				arg_317_1.typewritter.percent = 1

				arg_317_1.typewritter:SetDirty()
				arg_317_1:ShowNextGo(true)
			end
		end
	end,
	Play117041079 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 117041079
		arg_321_1.duration_ = 9

		SetActive(arg_321_1.tipsGo_, false)

		function arg_321_1.onSingleLineFinish_()
			arg_321_1.onSingleLineUpdate_ = nil
			arg_321_1.onSingleLineFinish_ = nil
			arg_321_1.state_ = "waiting"
		end

		function arg_321_1.playNext_(arg_323_0)
			if arg_323_0 == 1 then
				arg_321_0:Play117041080(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.mask_.enabled = true
				arg_321_1.mask_.raycastTarget = true

				arg_321_1:SetGaussion(false)
			end

			local var_324_1 = 2

			if var_324_0 <= arg_321_1.time_ and arg_321_1.time_ < var_324_0 + var_324_1 then
				local var_324_2 = (arg_321_1.time_ - var_324_0) / var_324_1
				local var_324_3 = Color.New(0, 0, 0)

				var_324_3.a = Mathf.Lerp(0, 1, var_324_2)
				arg_321_1.mask_.color = var_324_3
			end

			if arg_321_1.time_ >= var_324_0 + var_324_1 and arg_321_1.time_ < var_324_0 + var_324_1 + arg_324_0 then
				local var_324_4 = Color.New(0, 0, 0)

				var_324_4.a = 1
				arg_321_1.mask_.color = var_324_4
			end

			local var_324_5 = 2

			if var_324_5 < arg_321_1.time_ and arg_321_1.time_ <= var_324_5 + arg_324_0 then
				arg_321_1.mask_.enabled = true
				arg_321_1.mask_.raycastTarget = true

				arg_321_1:SetGaussion(false)
			end

			local var_324_6 = 2

			if var_324_5 <= arg_321_1.time_ and arg_321_1.time_ < var_324_5 + var_324_6 then
				local var_324_7 = (arg_321_1.time_ - var_324_5) / var_324_6
				local var_324_8 = Color.New(0, 0, 0)

				var_324_8.a = Mathf.Lerp(1, 0, var_324_7)
				arg_321_1.mask_.color = var_324_8
			end

			if arg_321_1.time_ >= var_324_5 + var_324_6 and arg_321_1.time_ < var_324_5 + var_324_6 + arg_324_0 then
				local var_324_9 = Color.New(0, 0, 0)
				local var_324_10 = 0

				arg_321_1.mask_.enabled = false
				var_324_9.a = var_324_10
				arg_321_1.mask_.color = var_324_9
			end

			local var_324_11 = 4
			local var_324_12 = 1

			if var_324_11 < arg_321_1.time_ and arg_321_1.time_ <= var_324_11 + arg_324_0 then
				local var_324_13 = "play"
				local var_324_14 = "effect"

				arg_321_1:AudioAction(var_324_13, var_324_14, "se_story_17", "se_story_17_door_close", "")
			end

			if arg_321_1.frameCnt_ <= 1 then
				arg_321_1.dialog_:SetActive(false)
			end

			local var_324_15 = 4
			local var_324_16 = 0.775

			if var_324_15 < arg_321_1.time_ and arg_321_1.time_ <= var_324_15 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0

				arg_321_1.dialog_:SetActive(true)

				local var_324_17 = LeanTween.value(arg_321_1.dialog_, 0, 1, 0.3)

				var_324_17:setOnUpdate(LuaHelper.FloatAction(function(arg_325_0)
					arg_321_1.dialogCg_.alpha = arg_325_0
				end))
				var_324_17:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_321_1.dialog_)
					var_324_17:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_321_1.duration_ = arg_321_1.duration_ + 0.3

				SetActive(arg_321_1.leftNameGo_, false)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_18 = arg_321_1:GetWordFromCfg(117041079)
				local var_324_19 = arg_321_1:FormatText(var_324_18.content)

				arg_321_1.text_.text = var_324_19

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_20 = 31
				local var_324_21 = utf8.len(var_324_19)
				local var_324_22 = var_324_20 <= 0 and var_324_16 or var_324_16 * (var_324_21 / var_324_20)

				if var_324_22 > 0 and var_324_16 < var_324_22 then
					arg_321_1.talkMaxDuration = var_324_22
					var_324_15 = var_324_15 + 0.3

					if var_324_22 + var_324_15 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_22 + var_324_15
					end
				end

				arg_321_1.text_.text = var_324_19
				arg_321_1.typewritter.percent = 0

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(false)
				arg_321_1:RecordContent(arg_321_1.text_.text)
			end

			local var_324_23 = var_324_15 + 0.3
			local var_324_24 = math.max(var_324_16, arg_321_1.talkMaxDuration)

			if var_324_23 <= arg_321_1.time_ and arg_321_1.time_ < var_324_23 + var_324_24 then
				arg_321_1.typewritter.percent = (arg_321_1.time_ - var_324_23) / var_324_24

				arg_321_1.typewritter:SetDirty()
			end

			if arg_321_1.time_ >= var_324_23 + var_324_24 and arg_321_1.time_ < var_324_23 + var_324_24 + arg_324_0 then
				arg_321_1.typewritter.percent = 1

				arg_321_1.typewritter:SetDirty()
				arg_321_1:ShowNextGo(true)
			end
		end
	end,
	Play117041080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 117041080
		arg_327_1.duration_ = 10.166

		local var_327_0 = {
			zh = 10.166,
			ja = 5.133
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
				arg_327_0:Play117041081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["10034"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 then
				local var_330_2 = var_330_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_330_2 then
					arg_327_1.var_.alphaOldValue10034 = var_330_2.alpha
					arg_327_1.var_.characterEffect10034 = var_330_2
				end

				arg_327_1.var_.alphaOldValue10034 = 0
			end

			local var_330_3 = 0.333333333333333

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_3 then
				local var_330_4 = (arg_327_1.time_ - var_330_1) / var_330_3
				local var_330_5 = Mathf.Lerp(arg_327_1.var_.alphaOldValue10034, 1, var_330_4)

				if arg_327_1.var_.characterEffect10034 then
					arg_327_1.var_.characterEffect10034.alpha = var_330_5
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_3 and arg_327_1.time_ < var_330_1 + var_330_3 + arg_330_0 and arg_327_1.var_.characterEffect10034 then
				arg_327_1.var_.characterEffect10034.alpha = 1
			end

			local var_330_6 = arg_327_1.actors_["1132"]
			local var_330_7 = 0

			if var_330_7 < arg_327_1.time_ and arg_327_1.time_ <= var_330_7 + arg_330_0 then
				local var_330_8 = var_330_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_330_8 then
					arg_327_1.var_.alphaOldValue1132 = var_330_8.alpha
					arg_327_1.var_.characterEffect1132 = var_330_8
				end

				arg_327_1.var_.alphaOldValue1132 = 0
			end

			local var_330_9 = 0.333333333333333

			if var_330_7 <= arg_327_1.time_ and arg_327_1.time_ < var_330_7 + var_330_9 then
				local var_330_10 = (arg_327_1.time_ - var_330_7) / var_330_9
				local var_330_11 = Mathf.Lerp(arg_327_1.var_.alphaOldValue1132, 1, var_330_10)

				if arg_327_1.var_.characterEffect1132 then
					arg_327_1.var_.characterEffect1132.alpha = var_330_11
				end
			end

			if arg_327_1.time_ >= var_330_7 + var_330_9 and arg_327_1.time_ < var_330_7 + var_330_9 + arg_330_0 and arg_327_1.var_.characterEffect1132 then
				arg_327_1.var_.characterEffect1132.alpha = 1
			end

			local var_330_12 = arg_327_1.actors_["10034"].transform
			local var_330_13 = 0

			if var_330_13 < arg_327_1.time_ and arg_327_1.time_ <= var_330_13 + arg_330_0 then
				arg_327_1.var_.moveOldPos10034 = var_330_12.localPosition
				var_330_12.localScale = Vector3.New(1, 1, 1)

				arg_327_1:CheckSpriteTmpPos("10034", 4)

				local var_330_14 = var_330_12.childCount

				for iter_330_0 = 0, var_330_14 - 1 do
					local var_330_15 = var_330_12:GetChild(iter_330_0)

					if var_330_15.name == "split_2" or not string.find(var_330_15.name, "split") then
						var_330_15.gameObject:SetActive(true)
					else
						var_330_15.gameObject:SetActive(false)
					end
				end
			end

			local var_330_16 = 0.001

			if var_330_13 <= arg_327_1.time_ and arg_327_1.time_ < var_330_13 + var_330_16 then
				local var_330_17 = (arg_327_1.time_ - var_330_13) / var_330_16
				local var_330_18 = Vector3.New(390, -415, -290)

				var_330_12.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos10034, var_330_18, var_330_17)
			end

			if arg_327_1.time_ >= var_330_13 + var_330_16 and arg_327_1.time_ < var_330_13 + var_330_16 + arg_330_0 then
				var_330_12.localPosition = Vector3.New(390, -415, -290)
			end

			local var_330_19 = arg_327_1.actors_["1132"].transform
			local var_330_20 = 0

			if var_330_20 < arg_327_1.time_ and arg_327_1.time_ <= var_330_20 + arg_330_0 then
				arg_327_1.var_.moveOldPos1132 = var_330_19.localPosition
				var_330_19.localScale = Vector3.New(1, 1, 1)

				arg_327_1:CheckSpriteTmpPos("1132", 2)

				local var_330_21 = var_330_19.childCount

				for iter_330_1 = 0, var_330_21 - 1 do
					local var_330_22 = var_330_19:GetChild(iter_330_1)

					if var_330_22.name == "split_6" or not string.find(var_330_22.name, "split") then
						var_330_22.gameObject:SetActive(true)
					else
						var_330_22.gameObject:SetActive(false)
					end
				end
			end

			local var_330_23 = 0.001

			if var_330_20 <= arg_327_1.time_ and arg_327_1.time_ < var_330_20 + var_330_23 then
				local var_330_24 = (arg_327_1.time_ - var_330_20) / var_330_23
				local var_330_25 = Vector3.New(-390, -413, -185)

				var_330_19.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1132, var_330_25, var_330_24)
			end

			if arg_327_1.time_ >= var_330_20 + var_330_23 and arg_327_1.time_ < var_330_20 + var_330_23 + arg_330_0 then
				var_330_19.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_330_26 = arg_327_1.actors_["10034"]
			local var_330_27 = 0

			if var_330_27 < arg_327_1.time_ and arg_327_1.time_ <= var_330_27 + arg_330_0 and arg_327_1.var_.actorSpriteComps10034 == nil then
				arg_327_1.var_.actorSpriteComps10034 = var_330_26:GetComponentsInChildren(typeof(Image), true)
			end

			local var_330_28 = 0.2

			if var_330_27 <= arg_327_1.time_ and arg_327_1.time_ < var_330_27 + var_330_28 then
				local var_330_29 = (arg_327_1.time_ - var_330_27) / var_330_28

				if arg_327_1.var_.actorSpriteComps10034 then
					for iter_330_2, iter_330_3 in pairs(arg_327_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_330_3 then
							local var_330_30 = Mathf.Lerp(iter_330_3.color.r, 1, var_330_29)

							iter_330_3.color = Color.New(var_330_30, var_330_30, var_330_30)
						end
					end
				end
			end

			if arg_327_1.time_ >= var_330_27 + var_330_28 and arg_327_1.time_ < var_330_27 + var_330_28 + arg_330_0 and arg_327_1.var_.actorSpriteComps10034 then
				local var_330_31 = 1

				for iter_330_4, iter_330_5 in pairs(arg_327_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_330_5 then
						iter_330_5.color = Color.New(var_330_31, var_330_31, var_330_31)
					end
				end

				arg_327_1.var_.actorSpriteComps10034 = nil
			end

			local var_330_32 = 0
			local var_330_33 = 1.05

			if var_330_32 < arg_327_1.time_ and arg_327_1.time_ <= var_330_32 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_34 = arg_327_1:FormatText(StoryNameCfg[367].name)

				arg_327_1.leftNameTxt_.text = var_330_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_35 = arg_327_1:GetWordFromCfg(117041080)
				local var_330_36 = arg_327_1:FormatText(var_330_35.content)

				arg_327_1.text_.text = var_330_36

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_37 = 42
				local var_330_38 = utf8.len(var_330_36)
				local var_330_39 = var_330_37 <= 0 and var_330_33 or var_330_33 * (var_330_38 / var_330_37)

				if var_330_39 > 0 and var_330_33 < var_330_39 then
					arg_327_1.talkMaxDuration = var_330_39

					if var_330_39 + var_330_32 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_39 + var_330_32
					end
				end

				arg_327_1.text_.text = var_330_36
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041080", "story_v_out_117041.awb") ~= 0 then
					local var_330_40 = manager.audio:GetVoiceLength("story_v_out_117041", "117041080", "story_v_out_117041.awb") / 1000

					if var_330_40 + var_330_32 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_40 + var_330_32
					end

					if var_330_35.prefab_name ~= "" and arg_327_1.actors_[var_330_35.prefab_name] ~= nil then
						local var_330_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_35.prefab_name].transform, "story_v_out_117041", "117041080", "story_v_out_117041.awb")

						arg_327_1:RecordAudio("117041080", var_330_41)
						arg_327_1:RecordAudio("117041080", var_330_41)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_117041", "117041080", "story_v_out_117041.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_117041", "117041080", "story_v_out_117041.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_42 = math.max(var_330_33, arg_327_1.talkMaxDuration)

			if var_330_32 <= arg_327_1.time_ and arg_327_1.time_ < var_330_32 + var_330_42 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_32) / var_330_42

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_32 + var_330_42 and arg_327_1.time_ < var_330_32 + var_330_42 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play117041081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 117041081
		arg_331_1.duration_ = 5.366

		local var_331_0 = {
			zh = 5.366,
			ja = 4.633
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
				arg_331_0:Play117041082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["10034"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.actorSpriteComps10034 == nil then
				arg_331_1.var_.actorSpriteComps10034 = var_334_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.actorSpriteComps10034 then
					for iter_334_0, iter_334_1 in pairs(arg_331_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_334_1 then
							local var_334_4 = Mathf.Lerp(iter_334_1.color.r, 0.5, var_334_3)

							iter_334_1.color = Color.New(var_334_4, var_334_4, var_334_4)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.actorSpriteComps10034 then
				local var_334_5 = 0.5

				for iter_334_2, iter_334_3 in pairs(arg_331_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_334_3 then
						iter_334_3.color = Color.New(var_334_5, var_334_5, var_334_5)
					end
				end

				arg_331_1.var_.actorSpriteComps10034 = nil
			end

			local var_334_6 = arg_331_1.actors_["1132"]
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 and arg_331_1.var_.actorSpriteComps1132 == nil then
				arg_331_1.var_.actorSpriteComps1132 = var_334_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_334_8 = 0.2

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8

				if arg_331_1.var_.actorSpriteComps1132 then
					for iter_334_4, iter_334_5 in pairs(arg_331_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_334_5 then
							local var_334_10 = Mathf.Lerp(iter_334_5.color.r, 1, var_334_9)

							iter_334_5.color = Color.New(var_334_10, var_334_10, var_334_10)
						end
					end
				end
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 and arg_331_1.var_.actorSpriteComps1132 then
				local var_334_11 = 1

				for iter_334_6, iter_334_7 in pairs(arg_331_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_334_7 then
						iter_334_7.color = Color.New(var_334_11, var_334_11, var_334_11)
					end
				end

				arg_331_1.var_.actorSpriteComps1132 = nil
			end

			local var_334_12 = 0
			local var_334_13 = 0.725

			if var_334_12 < arg_331_1.time_ and arg_331_1.time_ <= var_334_12 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_14 = arg_331_1:FormatText(StoryNameCfg[61].name)

				arg_331_1.leftNameTxt_.text = var_334_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_15 = arg_331_1:GetWordFromCfg(117041081)
				local var_334_16 = arg_331_1:FormatText(var_334_15.content)

				arg_331_1.text_.text = var_334_16

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_17 = 29
				local var_334_18 = utf8.len(var_334_16)
				local var_334_19 = var_334_17 <= 0 and var_334_13 or var_334_13 * (var_334_18 / var_334_17)

				if var_334_19 > 0 and var_334_13 < var_334_19 then
					arg_331_1.talkMaxDuration = var_334_19

					if var_334_19 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_19 + var_334_12
					end
				end

				arg_331_1.text_.text = var_334_16
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041081", "story_v_out_117041.awb") ~= 0 then
					local var_334_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041081", "story_v_out_117041.awb") / 1000

					if var_334_20 + var_334_12 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_20 + var_334_12
					end

					if var_334_15.prefab_name ~= "" and arg_331_1.actors_[var_334_15.prefab_name] ~= nil then
						local var_334_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_15.prefab_name].transform, "story_v_out_117041", "117041081", "story_v_out_117041.awb")

						arg_331_1:RecordAudio("117041081", var_334_21)
						arg_331_1:RecordAudio("117041081", var_334_21)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_117041", "117041081", "story_v_out_117041.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_117041", "117041081", "story_v_out_117041.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_22 = math.max(var_334_13, arg_331_1.talkMaxDuration)

			if var_334_12 <= arg_331_1.time_ and arg_331_1.time_ < var_334_12 + var_334_22 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_12) / var_334_22

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_12 + var_334_22 and arg_331_1.time_ < var_334_12 + var_334_22 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play117041082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 117041082
		arg_335_1.duration_ = 8.933

		local var_335_0 = {
			zh = 3.366,
			ja = 8.933
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
				arg_335_0:Play117041083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["10034"].transform
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 then
				arg_335_1.var_.moveOldPos10034 = var_338_0.localPosition
				var_338_0.localScale = Vector3.New(1, 1, 1)

				arg_335_1:CheckSpriteTmpPos("10034", 4)

				local var_338_2 = var_338_0.childCount

				for iter_338_0 = 0, var_338_2 - 1 do
					local var_338_3 = var_338_0:GetChild(iter_338_0)

					if var_338_3.name == "split_2" or not string.find(var_338_3.name, "split") then
						var_338_3.gameObject:SetActive(true)
					else
						var_338_3.gameObject:SetActive(false)
					end
				end
			end

			local var_338_4 = 0.001

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_4 then
				local var_338_5 = (arg_335_1.time_ - var_338_1) / var_338_4
				local var_338_6 = Vector3.New(390, -415, -290)

				var_338_0.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos10034, var_338_6, var_338_5)
			end

			if arg_335_1.time_ >= var_338_1 + var_338_4 and arg_335_1.time_ < var_338_1 + var_338_4 + arg_338_0 then
				var_338_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_338_7 = arg_335_1.actors_["1132"]
			local var_338_8 = 0

			if var_338_8 < arg_335_1.time_ and arg_335_1.time_ <= var_338_8 + arg_338_0 and arg_335_1.var_.actorSpriteComps1132 == nil then
				arg_335_1.var_.actorSpriteComps1132 = var_338_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_338_9 = 0.2

			if var_338_8 <= arg_335_1.time_ and arg_335_1.time_ < var_338_8 + var_338_9 then
				local var_338_10 = (arg_335_1.time_ - var_338_8) / var_338_9

				if arg_335_1.var_.actorSpriteComps1132 then
					for iter_338_1, iter_338_2 in pairs(arg_335_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_338_2 then
							local var_338_11 = Mathf.Lerp(iter_338_2.color.r, 0.5, var_338_10)

							iter_338_2.color = Color.New(var_338_11, var_338_11, var_338_11)
						end
					end
				end
			end

			if arg_335_1.time_ >= var_338_8 + var_338_9 and arg_335_1.time_ < var_338_8 + var_338_9 + arg_338_0 and arg_335_1.var_.actorSpriteComps1132 then
				local var_338_12 = 0.5

				for iter_338_3, iter_338_4 in pairs(arg_335_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_338_4 then
						iter_338_4.color = Color.New(var_338_12, var_338_12, var_338_12)
					end
				end

				arg_335_1.var_.actorSpriteComps1132 = nil
			end

			local var_338_13 = arg_335_1.actors_["10034"]
			local var_338_14 = 0

			if var_338_14 < arg_335_1.time_ and arg_335_1.time_ <= var_338_14 + arg_338_0 and arg_335_1.var_.actorSpriteComps10034 == nil then
				arg_335_1.var_.actorSpriteComps10034 = var_338_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_338_15 = 0.2

			if var_338_14 <= arg_335_1.time_ and arg_335_1.time_ < var_338_14 + var_338_15 then
				local var_338_16 = (arg_335_1.time_ - var_338_14) / var_338_15

				if arg_335_1.var_.actorSpriteComps10034 then
					for iter_338_5, iter_338_6 in pairs(arg_335_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_338_6 then
							local var_338_17 = Mathf.Lerp(iter_338_6.color.r, 1, var_338_16)

							iter_338_6.color = Color.New(var_338_17, var_338_17, var_338_17)
						end
					end
				end
			end

			if arg_335_1.time_ >= var_338_14 + var_338_15 and arg_335_1.time_ < var_338_14 + var_338_15 + arg_338_0 and arg_335_1.var_.actorSpriteComps10034 then
				local var_338_18 = 1

				for iter_338_7, iter_338_8 in pairs(arg_335_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_338_8 then
						iter_338_8.color = Color.New(var_338_18, var_338_18, var_338_18)
					end
				end

				arg_335_1.var_.actorSpriteComps10034 = nil
			end

			local var_338_19 = 0
			local var_338_20 = 0.325

			if var_338_19 < arg_335_1.time_ and arg_335_1.time_ <= var_338_19 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_21 = arg_335_1:FormatText(StoryNameCfg[367].name)

				arg_335_1.leftNameTxt_.text = var_338_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_22 = arg_335_1:GetWordFromCfg(117041082)
				local var_338_23 = arg_335_1:FormatText(var_338_22.content)

				arg_335_1.text_.text = var_338_23

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_24 = 13
				local var_338_25 = utf8.len(var_338_23)
				local var_338_26 = var_338_24 <= 0 and var_338_20 or var_338_20 * (var_338_25 / var_338_24)

				if var_338_26 > 0 and var_338_20 < var_338_26 then
					arg_335_1.talkMaxDuration = var_338_26

					if var_338_26 + var_338_19 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_26 + var_338_19
					end
				end

				arg_335_1.text_.text = var_338_23
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041082", "story_v_out_117041.awb") ~= 0 then
					local var_338_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041082", "story_v_out_117041.awb") / 1000

					if var_338_27 + var_338_19 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_27 + var_338_19
					end

					if var_338_22.prefab_name ~= "" and arg_335_1.actors_[var_338_22.prefab_name] ~= nil then
						local var_338_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_22.prefab_name].transform, "story_v_out_117041", "117041082", "story_v_out_117041.awb")

						arg_335_1:RecordAudio("117041082", var_338_28)
						arg_335_1:RecordAudio("117041082", var_338_28)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_117041", "117041082", "story_v_out_117041.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_117041", "117041082", "story_v_out_117041.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_29 = math.max(var_338_20, arg_335_1.talkMaxDuration)

			if var_338_19 <= arg_335_1.time_ and arg_335_1.time_ < var_338_19 + var_338_29 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_19) / var_338_29

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_19 + var_338_29 and arg_335_1.time_ < var_338_19 + var_338_29 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play117041083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 117041083
		arg_339_1.duration_ = 3.2

		local var_339_0 = {
			zh = 3.2,
			ja = 3.133
		}
		local var_339_1 = manager.audio:GetLocalizationFlag()

		if var_339_0[var_339_1] ~= nil then
			arg_339_1.duration_ = var_339_0[var_339_1]
		end

		SetActive(arg_339_1.tipsGo_, false)

		function arg_339_1.onSingleLineFinish_()
			arg_339_1.onSingleLineUpdate_ = nil
			arg_339_1.onSingleLineFinish_ = nil
			arg_339_1.state_ = "waiting"
		end

		function arg_339_1.playNext_(arg_341_0)
			if arg_341_0 == 1 then
				arg_339_0:Play117041084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 0.25

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_2 = arg_339_1:FormatText(StoryNameCfg[367].name)

				arg_339_1.leftNameTxt_.text = var_342_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_3 = arg_339_1:GetWordFromCfg(117041083)
				local var_342_4 = arg_339_1:FormatText(var_342_3.content)

				arg_339_1.text_.text = var_342_4

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_5 = 10
				local var_342_6 = utf8.len(var_342_4)
				local var_342_7 = var_342_5 <= 0 and var_342_1 or var_342_1 * (var_342_6 / var_342_5)

				if var_342_7 > 0 and var_342_1 < var_342_7 then
					arg_339_1.talkMaxDuration = var_342_7

					if var_342_7 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_7 + var_342_0
					end
				end

				arg_339_1.text_.text = var_342_4
				arg_339_1.typewritter.percent = 0

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041083", "story_v_out_117041.awb") ~= 0 then
					local var_342_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041083", "story_v_out_117041.awb") / 1000

					if var_342_8 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_8 + var_342_0
					end

					if var_342_3.prefab_name ~= "" and arg_339_1.actors_[var_342_3.prefab_name] ~= nil then
						local var_342_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_3.prefab_name].transform, "story_v_out_117041", "117041083", "story_v_out_117041.awb")

						arg_339_1:RecordAudio("117041083", var_342_9)
						arg_339_1:RecordAudio("117041083", var_342_9)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_117041", "117041083", "story_v_out_117041.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_117041", "117041083", "story_v_out_117041.awb")
				end

				arg_339_1:RecordContent(arg_339_1.text_.text)
			end

			local var_342_10 = math.max(var_342_1, arg_339_1.talkMaxDuration)

			if var_342_0 <= arg_339_1.time_ and arg_339_1.time_ < var_342_0 + var_342_10 then
				arg_339_1.typewritter.percent = (arg_339_1.time_ - var_342_0) / var_342_10

				arg_339_1.typewritter:SetDirty()
			end

			if arg_339_1.time_ >= var_342_0 + var_342_10 and arg_339_1.time_ < var_342_0 + var_342_10 + arg_342_0 then
				arg_339_1.typewritter.percent = 1

				arg_339_1.typewritter:SetDirty()
				arg_339_1:ShowNextGo(true)
			end
		end
	end,
	Play117041084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 117041084
		arg_343_1.duration_ = 6

		local var_343_0 = {
			zh = 2,
			ja = 6
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
				arg_343_0:Play117041085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1132"]
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 and arg_343_1.var_.actorSpriteComps1132 == nil then
				arg_343_1.var_.actorSpriteComps1132 = var_346_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_2 = 0.2

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2

				if arg_343_1.var_.actorSpriteComps1132 then
					for iter_346_0, iter_346_1 in pairs(arg_343_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_346_1 then
							local var_346_4 = Mathf.Lerp(iter_346_1.color.r, 1, var_346_3)

							iter_346_1.color = Color.New(var_346_4, var_346_4, var_346_4)
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 and arg_343_1.var_.actorSpriteComps1132 then
				local var_346_5 = 1

				for iter_346_2, iter_346_3 in pairs(arg_343_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_346_3 then
						iter_346_3.color = Color.New(var_346_5, var_346_5, var_346_5)
					end
				end

				arg_343_1.var_.actorSpriteComps1132 = nil
			end

			local var_346_6 = arg_343_1.actors_["10034"]
			local var_346_7 = 0

			if var_346_7 < arg_343_1.time_ and arg_343_1.time_ <= var_346_7 + arg_346_0 and arg_343_1.var_.actorSpriteComps10034 == nil then
				arg_343_1.var_.actorSpriteComps10034 = var_346_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_346_8 = 0.2

			if var_346_7 <= arg_343_1.time_ and arg_343_1.time_ < var_346_7 + var_346_8 then
				local var_346_9 = (arg_343_1.time_ - var_346_7) / var_346_8

				if arg_343_1.var_.actorSpriteComps10034 then
					for iter_346_4, iter_346_5 in pairs(arg_343_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_346_5 then
							local var_346_10 = Mathf.Lerp(iter_346_5.color.r, 0.5, var_346_9)

							iter_346_5.color = Color.New(var_346_10, var_346_10, var_346_10)
						end
					end
				end
			end

			if arg_343_1.time_ >= var_346_7 + var_346_8 and arg_343_1.time_ < var_346_7 + var_346_8 + arg_346_0 and arg_343_1.var_.actorSpriteComps10034 then
				local var_346_11 = 0.5

				for iter_346_6, iter_346_7 in pairs(arg_343_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_346_7 then
						iter_346_7.color = Color.New(var_346_11, var_346_11, var_346_11)
					end
				end

				arg_343_1.var_.actorSpriteComps10034 = nil
			end

			local var_346_12 = 0
			local var_346_13 = 0.275

			if var_346_12 < arg_343_1.time_ and arg_343_1.time_ <= var_346_12 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, true)

				local var_346_14 = arg_343_1:FormatText(StoryNameCfg[61].name)

				arg_343_1.leftNameTxt_.text = var_346_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_343_1.leftNameTxt_.transform)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1.leftNameTxt_.text)
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_15 = arg_343_1:GetWordFromCfg(117041084)
				local var_346_16 = arg_343_1:FormatText(var_346_15.content)

				arg_343_1.text_.text = var_346_16

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_17 = 11
				local var_346_18 = utf8.len(var_346_16)
				local var_346_19 = var_346_17 <= 0 and var_346_13 or var_346_13 * (var_346_18 / var_346_17)

				if var_346_19 > 0 and var_346_13 < var_346_19 then
					arg_343_1.talkMaxDuration = var_346_19

					if var_346_19 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_19 + var_346_12
					end
				end

				arg_343_1.text_.text = var_346_16
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041084", "story_v_out_117041.awb") ~= 0 then
					local var_346_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041084", "story_v_out_117041.awb") / 1000

					if var_346_20 + var_346_12 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_20 + var_346_12
					end

					if var_346_15.prefab_name ~= "" and arg_343_1.actors_[var_346_15.prefab_name] ~= nil then
						local var_346_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_343_1.actors_[var_346_15.prefab_name].transform, "story_v_out_117041", "117041084", "story_v_out_117041.awb")

						arg_343_1:RecordAudio("117041084", var_346_21)
						arg_343_1:RecordAudio("117041084", var_346_21)
					else
						arg_343_1:AudioAction("play", "voice", "story_v_out_117041", "117041084", "story_v_out_117041.awb")
					end

					arg_343_1:RecordHistoryTalkVoice("story_v_out_117041", "117041084", "story_v_out_117041.awb")
				end

				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_22 = math.max(var_346_13, arg_343_1.talkMaxDuration)

			if var_346_12 <= arg_343_1.time_ and arg_343_1.time_ < var_346_12 + var_346_22 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_12) / var_346_22

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_12 + var_346_22 and arg_343_1.time_ < var_346_12 + var_346_22 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play117041085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 117041085
		arg_347_1.duration_ = 7.5

		local var_347_0 = {
			zh = 7.5,
			ja = 3.766
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
				arg_347_0:Play117041086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["10034"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.actorSpriteComps10034 == nil then
				arg_347_1.var_.actorSpriteComps10034 = var_350_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_2 = 0.2

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.actorSpriteComps10034 then
					for iter_350_0, iter_350_1 in pairs(arg_347_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_350_1 then
							local var_350_4 = Mathf.Lerp(iter_350_1.color.r, 1, var_350_3)

							iter_350_1.color = Color.New(var_350_4, var_350_4, var_350_4)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.actorSpriteComps10034 then
				local var_350_5 = 1

				for iter_350_2, iter_350_3 in pairs(arg_347_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_350_3 then
						iter_350_3.color = Color.New(var_350_5, var_350_5, var_350_5)
					end
				end

				arg_347_1.var_.actorSpriteComps10034 = nil
			end

			local var_350_6 = arg_347_1.actors_["1132"]
			local var_350_7 = 0

			if var_350_7 < arg_347_1.time_ and arg_347_1.time_ <= var_350_7 + arg_350_0 and arg_347_1.var_.actorSpriteComps1132 == nil then
				arg_347_1.var_.actorSpriteComps1132 = var_350_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_350_8 = 0.2

			if var_350_7 <= arg_347_1.time_ and arg_347_1.time_ < var_350_7 + var_350_8 then
				local var_350_9 = (arg_347_1.time_ - var_350_7) / var_350_8

				if arg_347_1.var_.actorSpriteComps1132 then
					for iter_350_4, iter_350_5 in pairs(arg_347_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_350_5 then
							local var_350_10 = Mathf.Lerp(iter_350_5.color.r, 0.5, var_350_9)

							iter_350_5.color = Color.New(var_350_10, var_350_10, var_350_10)
						end
					end
				end
			end

			if arg_347_1.time_ >= var_350_7 + var_350_8 and arg_347_1.time_ < var_350_7 + var_350_8 + arg_350_0 and arg_347_1.var_.actorSpriteComps1132 then
				local var_350_11 = 0.5

				for iter_350_6, iter_350_7 in pairs(arg_347_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_350_7 then
						iter_350_7.color = Color.New(var_350_11, var_350_11, var_350_11)
					end
				end

				arg_347_1.var_.actorSpriteComps1132 = nil
			end

			local var_350_12 = 0
			local var_350_13 = 0.675

			if var_350_12 < arg_347_1.time_ and arg_347_1.time_ <= var_350_12 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_14 = arg_347_1:FormatText(StoryNameCfg[367].name)

				arg_347_1.leftNameTxt_.text = var_350_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_15 = arg_347_1:GetWordFromCfg(117041085)
				local var_350_16 = arg_347_1:FormatText(var_350_15.content)

				arg_347_1.text_.text = var_350_16

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_17 = 27
				local var_350_18 = utf8.len(var_350_16)
				local var_350_19 = var_350_17 <= 0 and var_350_13 or var_350_13 * (var_350_18 / var_350_17)

				if var_350_19 > 0 and var_350_13 < var_350_19 then
					arg_347_1.talkMaxDuration = var_350_19

					if var_350_19 + var_350_12 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_19 + var_350_12
					end
				end

				arg_347_1.text_.text = var_350_16
				arg_347_1.typewritter.percent = 0

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041085", "story_v_out_117041.awb") ~= 0 then
					local var_350_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041085", "story_v_out_117041.awb") / 1000

					if var_350_20 + var_350_12 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_20 + var_350_12
					end

					if var_350_15.prefab_name ~= "" and arg_347_1.actors_[var_350_15.prefab_name] ~= nil then
						local var_350_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_15.prefab_name].transform, "story_v_out_117041", "117041085", "story_v_out_117041.awb")

						arg_347_1:RecordAudio("117041085", var_350_21)
						arg_347_1:RecordAudio("117041085", var_350_21)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_117041", "117041085", "story_v_out_117041.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_117041", "117041085", "story_v_out_117041.awb")
				end

				arg_347_1:RecordContent(arg_347_1.text_.text)
			end

			local var_350_22 = math.max(var_350_13, arg_347_1.talkMaxDuration)

			if var_350_12 <= arg_347_1.time_ and arg_347_1.time_ < var_350_12 + var_350_22 then
				arg_347_1.typewritter.percent = (arg_347_1.time_ - var_350_12) / var_350_22

				arg_347_1.typewritter:SetDirty()
			end

			if arg_347_1.time_ >= var_350_12 + var_350_22 and arg_347_1.time_ < var_350_12 + var_350_22 + arg_350_0 then
				arg_347_1.typewritter.percent = 1

				arg_347_1.typewritter:SetDirty()
				arg_347_1:ShowNextGo(true)
			end
		end
	end,
	Play117041086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 117041086
		arg_351_1.duration_ = 8.9

		local var_351_0 = {
			zh = 8.533,
			ja = 8.9
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
				arg_351_0:Play117041087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1132"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.actorSpriteComps1132 == nil then
				arg_351_1.var_.actorSpriteComps1132 = var_354_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_2 = 0.2

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.actorSpriteComps1132 then
					for iter_354_0, iter_354_1 in pairs(arg_351_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_354_1 then
							local var_354_4 = Mathf.Lerp(iter_354_1.color.r, 1, var_354_3)

							iter_354_1.color = Color.New(var_354_4, var_354_4, var_354_4)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.actorSpriteComps1132 then
				local var_354_5 = 1

				for iter_354_2, iter_354_3 in pairs(arg_351_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_354_3 then
						iter_354_3.color = Color.New(var_354_5, var_354_5, var_354_5)
					end
				end

				arg_351_1.var_.actorSpriteComps1132 = nil
			end

			local var_354_6 = arg_351_1.actors_["10034"]
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 and arg_351_1.var_.actorSpriteComps10034 == nil then
				arg_351_1.var_.actorSpriteComps10034 = var_354_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_354_8 = 0.2

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8

				if arg_351_1.var_.actorSpriteComps10034 then
					for iter_354_4, iter_354_5 in pairs(arg_351_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_354_5 then
							local var_354_10 = Mathf.Lerp(iter_354_5.color.r, 0.5, var_354_9)

							iter_354_5.color = Color.New(var_354_10, var_354_10, var_354_10)
						end
					end
				end
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 and arg_351_1.var_.actorSpriteComps10034 then
				local var_354_11 = 0.5

				for iter_354_6, iter_354_7 in pairs(arg_351_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_354_7 then
						iter_354_7.color = Color.New(var_354_11, var_354_11, var_354_11)
					end
				end

				arg_351_1.var_.actorSpriteComps10034 = nil
			end

			local var_354_12 = 0
			local var_354_13 = 1.2

			if var_354_12 < arg_351_1.time_ and arg_351_1.time_ <= var_354_12 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_14 = arg_351_1:FormatText(StoryNameCfg[61].name)

				arg_351_1.leftNameTxt_.text = var_354_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_15 = arg_351_1:GetWordFromCfg(117041086)
				local var_354_16 = arg_351_1:FormatText(var_354_15.content)

				arg_351_1.text_.text = var_354_16

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_17 = 48
				local var_354_18 = utf8.len(var_354_16)
				local var_354_19 = var_354_17 <= 0 and var_354_13 or var_354_13 * (var_354_18 / var_354_17)

				if var_354_19 > 0 and var_354_13 < var_354_19 then
					arg_351_1.talkMaxDuration = var_354_19

					if var_354_19 + var_354_12 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_19 + var_354_12
					end
				end

				arg_351_1.text_.text = var_354_16
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041086", "story_v_out_117041.awb") ~= 0 then
					local var_354_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041086", "story_v_out_117041.awb") / 1000

					if var_354_20 + var_354_12 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_20 + var_354_12
					end

					if var_354_15.prefab_name ~= "" and arg_351_1.actors_[var_354_15.prefab_name] ~= nil then
						local var_354_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_15.prefab_name].transform, "story_v_out_117041", "117041086", "story_v_out_117041.awb")

						arg_351_1:RecordAudio("117041086", var_354_21)
						arg_351_1:RecordAudio("117041086", var_354_21)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_117041", "117041086", "story_v_out_117041.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_117041", "117041086", "story_v_out_117041.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_22 = math.max(var_354_13, arg_351_1.talkMaxDuration)

			if var_354_12 <= arg_351_1.time_ and arg_351_1.time_ < var_354_12 + var_354_22 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_12) / var_354_22

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_12 + var_354_22 and arg_351_1.time_ < var_354_12 + var_354_22 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play117041087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 117041087
		arg_355_1.duration_ = 1.733

		local var_355_0 = {
			zh = 1.733,
			ja = 1.4
		}
		local var_355_1 = manager.audio:GetLocalizationFlag()

		if var_355_0[var_355_1] ~= nil then
			arg_355_1.duration_ = var_355_0[var_355_1]
		end

		SetActive(arg_355_1.tipsGo_, false)

		function arg_355_1.onSingleLineFinish_()
			arg_355_1.onSingleLineUpdate_ = nil
			arg_355_1.onSingleLineFinish_ = nil
			arg_355_1.state_ = "waiting"
		end

		function arg_355_1.playNext_(arg_357_0)
			if arg_357_0 == 1 then
				arg_355_0:Play117041088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["10034"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos10034 = var_358_0.localPosition
				var_358_0.localScale = Vector3.New(1, 1, 1)

				arg_355_1:CheckSpriteTmpPos("10034", 4)

				local var_358_2 = var_358_0.childCount

				for iter_358_0 = 0, var_358_2 - 1 do
					local var_358_3 = var_358_0:GetChild(iter_358_0)

					if var_358_3.name == "split_2" or not string.find(var_358_3.name, "split") then
						var_358_3.gameObject:SetActive(true)
					else
						var_358_3.gameObject:SetActive(false)
					end
				end
			end

			local var_358_4 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_4 then
				local var_358_5 = (arg_355_1.time_ - var_358_1) / var_358_4
				local var_358_6 = Vector3.New(390, -415, -290)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos10034, var_358_6, var_358_5)
			end

			if arg_355_1.time_ >= var_358_1 + var_358_4 and arg_355_1.time_ < var_358_1 + var_358_4 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_358_7 = arg_355_1.actors_["1132"]
			local var_358_8 = 0

			if var_358_8 < arg_355_1.time_ and arg_355_1.time_ <= var_358_8 + arg_358_0 and arg_355_1.var_.actorSpriteComps1132 == nil then
				arg_355_1.var_.actorSpriteComps1132 = var_358_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_9 = 0.2

			if var_358_8 <= arg_355_1.time_ and arg_355_1.time_ < var_358_8 + var_358_9 then
				local var_358_10 = (arg_355_1.time_ - var_358_8) / var_358_9

				if arg_355_1.var_.actorSpriteComps1132 then
					for iter_358_1, iter_358_2 in pairs(arg_355_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_358_2 then
							local var_358_11 = Mathf.Lerp(iter_358_2.color.r, 0.5, var_358_10)

							iter_358_2.color = Color.New(var_358_11, var_358_11, var_358_11)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_8 + var_358_9 and arg_355_1.time_ < var_358_8 + var_358_9 + arg_358_0 and arg_355_1.var_.actorSpriteComps1132 then
				local var_358_12 = 0.5

				for iter_358_3, iter_358_4 in pairs(arg_355_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_358_4 then
						iter_358_4.color = Color.New(var_358_12, var_358_12, var_358_12)
					end
				end

				arg_355_1.var_.actorSpriteComps1132 = nil
			end

			local var_358_13 = arg_355_1.actors_["10034"]
			local var_358_14 = 0

			if var_358_14 < arg_355_1.time_ and arg_355_1.time_ <= var_358_14 + arg_358_0 and arg_355_1.var_.actorSpriteComps10034 == nil then
				arg_355_1.var_.actorSpriteComps10034 = var_358_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_358_15 = 0.2

			if var_358_14 <= arg_355_1.time_ and arg_355_1.time_ < var_358_14 + var_358_15 then
				local var_358_16 = (arg_355_1.time_ - var_358_14) / var_358_15

				if arg_355_1.var_.actorSpriteComps10034 then
					for iter_358_5, iter_358_6 in pairs(arg_355_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_358_6 then
							local var_358_17 = Mathf.Lerp(iter_358_6.color.r, 1, var_358_16)

							iter_358_6.color = Color.New(var_358_17, var_358_17, var_358_17)
						end
					end
				end
			end

			if arg_355_1.time_ >= var_358_14 + var_358_15 and arg_355_1.time_ < var_358_14 + var_358_15 + arg_358_0 and arg_355_1.var_.actorSpriteComps10034 then
				local var_358_18 = 1

				for iter_358_7, iter_358_8 in pairs(arg_355_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_358_8 then
						iter_358_8.color = Color.New(var_358_18, var_358_18, var_358_18)
					end
				end

				arg_355_1.var_.actorSpriteComps10034 = nil
			end

			local var_358_19 = 0
			local var_358_20 = 0.075

			if var_358_19 < arg_355_1.time_ and arg_355_1.time_ <= var_358_19 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_21 = arg_355_1:FormatText(StoryNameCfg[367].name)

				arg_355_1.leftNameTxt_.text = var_358_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_22 = arg_355_1:GetWordFromCfg(117041087)
				local var_358_23 = arg_355_1:FormatText(var_358_22.content)

				arg_355_1.text_.text = var_358_23

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_24 = 3
				local var_358_25 = utf8.len(var_358_23)
				local var_358_26 = var_358_24 <= 0 and var_358_20 or var_358_20 * (var_358_25 / var_358_24)

				if var_358_26 > 0 and var_358_20 < var_358_26 then
					arg_355_1.talkMaxDuration = var_358_26

					if var_358_26 + var_358_19 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_26 + var_358_19
					end
				end

				arg_355_1.text_.text = var_358_23
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041087", "story_v_out_117041.awb") ~= 0 then
					local var_358_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041087", "story_v_out_117041.awb") / 1000

					if var_358_27 + var_358_19 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_27 + var_358_19
					end

					if var_358_22.prefab_name ~= "" and arg_355_1.actors_[var_358_22.prefab_name] ~= nil then
						local var_358_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_22.prefab_name].transform, "story_v_out_117041", "117041087", "story_v_out_117041.awb")

						arg_355_1:RecordAudio("117041087", var_358_28)
						arg_355_1:RecordAudio("117041087", var_358_28)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_117041", "117041087", "story_v_out_117041.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_117041", "117041087", "story_v_out_117041.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_29 = math.max(var_358_20, arg_355_1.talkMaxDuration)

			if var_358_19 <= arg_355_1.time_ and arg_355_1.time_ < var_358_19 + var_358_29 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_19) / var_358_29

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_19 + var_358_29 and arg_355_1.time_ < var_358_19 + var_358_29 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play117041088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 117041088
		arg_359_1.duration_ = 12.5

		local var_359_0 = {
			zh = 12.5,
			ja = 8.7
		}
		local var_359_1 = manager.audio:GetLocalizationFlag()

		if var_359_0[var_359_1] ~= nil then
			arg_359_1.duration_ = var_359_0[var_359_1]
		end

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play117041089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = 0
			local var_362_1 = 1.175

			if var_362_0 < arg_359_1.time_ and arg_359_1.time_ <= var_362_0 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_2 = arg_359_1:FormatText(StoryNameCfg[367].name)

				arg_359_1.leftNameTxt_.text = var_362_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_3 = arg_359_1:GetWordFromCfg(117041088)
				local var_362_4 = arg_359_1:FormatText(var_362_3.content)

				arg_359_1.text_.text = var_362_4

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_5 = 47
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041088", "story_v_out_117041.awb") ~= 0 then
					local var_362_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041088", "story_v_out_117041.awb") / 1000

					if var_362_8 + var_362_0 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_8 + var_362_0
					end

					if var_362_3.prefab_name ~= "" and arg_359_1.actors_[var_362_3.prefab_name] ~= nil then
						local var_362_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_3.prefab_name].transform, "story_v_out_117041", "117041088", "story_v_out_117041.awb")

						arg_359_1:RecordAudio("117041088", var_362_9)
						arg_359_1:RecordAudio("117041088", var_362_9)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_117041", "117041088", "story_v_out_117041.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_117041", "117041088", "story_v_out_117041.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_10 = math.max(var_362_1, arg_359_1.talkMaxDuration)

			if var_362_0 <= arg_359_1.time_ and arg_359_1.time_ < var_362_0 + var_362_10 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_0) / var_362_10

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_0 + var_362_10 and arg_359_1.time_ < var_362_0 + var_362_10 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play117041089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 117041089
		arg_363_1.duration_ = 4.866

		local var_363_0 = {
			zh = 2.366,
			ja = 4.866
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
				arg_363_0:Play117041090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1132"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1132 = var_366_0.localPosition
				var_366_0.localScale = Vector3.New(1, 1, 1)

				arg_363_1:CheckSpriteTmpPos("1132", 2)

				local var_366_2 = var_366_0.childCount

				for iter_366_0 = 0, var_366_2 - 1 do
					local var_366_3 = var_366_0:GetChild(iter_366_0)

					if var_366_3.name == "split_5" or not string.find(var_366_3.name, "split") then
						var_366_3.gameObject:SetActive(true)
					else
						var_366_3.gameObject:SetActive(false)
					end
				end
			end

			local var_366_4 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_4 then
				local var_366_5 = (arg_363_1.time_ - var_366_1) / var_366_4
				local var_366_6 = Vector3.New(-390, -413, -185)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1132, var_366_6, var_366_5)
			end

			if arg_363_1.time_ >= var_366_1 + var_366_4 and arg_363_1.time_ < var_366_1 + var_366_4 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_366_7 = arg_363_1.actors_["1132"]
			local var_366_8 = 0

			if var_366_8 < arg_363_1.time_ and arg_363_1.time_ <= var_366_8 + arg_366_0 and arg_363_1.var_.actorSpriteComps1132 == nil then
				arg_363_1.var_.actorSpriteComps1132 = var_366_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_9 = 0.2

			if var_366_8 <= arg_363_1.time_ and arg_363_1.time_ < var_366_8 + var_366_9 then
				local var_366_10 = (arg_363_1.time_ - var_366_8) / var_366_9

				if arg_363_1.var_.actorSpriteComps1132 then
					for iter_366_1, iter_366_2 in pairs(arg_363_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_366_2 then
							local var_366_11 = Mathf.Lerp(iter_366_2.color.r, 1, var_366_10)

							iter_366_2.color = Color.New(var_366_11, var_366_11, var_366_11)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_8 + var_366_9 and arg_363_1.time_ < var_366_8 + var_366_9 + arg_366_0 and arg_363_1.var_.actorSpriteComps1132 then
				local var_366_12 = 1

				for iter_366_3, iter_366_4 in pairs(arg_363_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_366_4 then
						iter_366_4.color = Color.New(var_366_12, var_366_12, var_366_12)
					end
				end

				arg_363_1.var_.actorSpriteComps1132 = nil
			end

			local var_366_13 = arg_363_1.actors_["10034"]
			local var_366_14 = 0

			if var_366_14 < arg_363_1.time_ and arg_363_1.time_ <= var_366_14 + arg_366_0 and arg_363_1.var_.actorSpriteComps10034 == nil then
				arg_363_1.var_.actorSpriteComps10034 = var_366_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_366_15 = 0.2

			if var_366_14 <= arg_363_1.time_ and arg_363_1.time_ < var_366_14 + var_366_15 then
				local var_366_16 = (arg_363_1.time_ - var_366_14) / var_366_15

				if arg_363_1.var_.actorSpriteComps10034 then
					for iter_366_5, iter_366_6 in pairs(arg_363_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_366_6 then
							local var_366_17 = Mathf.Lerp(iter_366_6.color.r, 0.5, var_366_16)

							iter_366_6.color = Color.New(var_366_17, var_366_17, var_366_17)
						end
					end
				end
			end

			if arg_363_1.time_ >= var_366_14 + var_366_15 and arg_363_1.time_ < var_366_14 + var_366_15 + arg_366_0 and arg_363_1.var_.actorSpriteComps10034 then
				local var_366_18 = 0.5

				for iter_366_7, iter_366_8 in pairs(arg_363_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_366_8 then
						iter_366_8.color = Color.New(var_366_18, var_366_18, var_366_18)
					end
				end

				arg_363_1.var_.actorSpriteComps10034 = nil
			end

			local var_366_19 = 0
			local var_366_20 = 0.3

			if var_366_19 < arg_363_1.time_ and arg_363_1.time_ <= var_366_19 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, true)

				local var_366_21 = arg_363_1:FormatText(StoryNameCfg[61].name)

				arg_363_1.leftNameTxt_.text = var_366_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_363_1.leftNameTxt_.transform)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1.leftNameTxt_.text)
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_22 = arg_363_1:GetWordFromCfg(117041089)
				local var_366_23 = arg_363_1:FormatText(var_366_22.content)

				arg_363_1.text_.text = var_366_23

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_24 = 12
				local var_366_25 = utf8.len(var_366_23)
				local var_366_26 = var_366_24 <= 0 and var_366_20 or var_366_20 * (var_366_25 / var_366_24)

				if var_366_26 > 0 and var_366_20 < var_366_26 then
					arg_363_1.talkMaxDuration = var_366_26

					if var_366_26 + var_366_19 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_26 + var_366_19
					end
				end

				arg_363_1.text_.text = var_366_23
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041089", "story_v_out_117041.awb") ~= 0 then
					local var_366_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041089", "story_v_out_117041.awb") / 1000

					if var_366_27 + var_366_19 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_27 + var_366_19
					end

					if var_366_22.prefab_name ~= "" and arg_363_1.actors_[var_366_22.prefab_name] ~= nil then
						local var_366_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_363_1.actors_[var_366_22.prefab_name].transform, "story_v_out_117041", "117041089", "story_v_out_117041.awb")

						arg_363_1:RecordAudio("117041089", var_366_28)
						arg_363_1:RecordAudio("117041089", var_366_28)
					else
						arg_363_1:AudioAction("play", "voice", "story_v_out_117041", "117041089", "story_v_out_117041.awb")
					end

					arg_363_1:RecordHistoryTalkVoice("story_v_out_117041", "117041089", "story_v_out_117041.awb")
				end

				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_29 = math.max(var_366_20, arg_363_1.talkMaxDuration)

			if var_366_19 <= arg_363_1.time_ and arg_363_1.time_ < var_366_19 + var_366_29 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_19) / var_366_29

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_19 + var_366_29 and arg_363_1.time_ < var_366_19 + var_366_29 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play117041090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 117041090
		arg_367_1.duration_ = 9.233

		local var_367_0 = {
			zh = 7.6,
			ja = 9.233
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
				arg_367_0:Play117041091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = arg_367_1.actors_["10034"]
			local var_370_1 = 0

			if var_370_1 < arg_367_1.time_ and arg_367_1.time_ <= var_370_1 + arg_370_0 and arg_367_1.var_.actorSpriteComps10034 == nil then
				arg_367_1.var_.actorSpriteComps10034 = var_370_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_2 = 0.2

			if var_370_1 <= arg_367_1.time_ and arg_367_1.time_ < var_370_1 + var_370_2 then
				local var_370_3 = (arg_367_1.time_ - var_370_1) / var_370_2

				if arg_367_1.var_.actorSpriteComps10034 then
					for iter_370_0, iter_370_1 in pairs(arg_367_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_370_1 then
							local var_370_4 = Mathf.Lerp(iter_370_1.color.r, 1, var_370_3)

							iter_370_1.color = Color.New(var_370_4, var_370_4, var_370_4)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_1 + var_370_2 and arg_367_1.time_ < var_370_1 + var_370_2 + arg_370_0 and arg_367_1.var_.actorSpriteComps10034 then
				local var_370_5 = 1

				for iter_370_2, iter_370_3 in pairs(arg_367_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_370_3 then
						iter_370_3.color = Color.New(var_370_5, var_370_5, var_370_5)
					end
				end

				arg_367_1.var_.actorSpriteComps10034 = nil
			end

			local var_370_6 = arg_367_1.actors_["1132"]
			local var_370_7 = 0

			if var_370_7 < arg_367_1.time_ and arg_367_1.time_ <= var_370_7 + arg_370_0 and arg_367_1.var_.actorSpriteComps1132 == nil then
				arg_367_1.var_.actorSpriteComps1132 = var_370_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_370_8 = 0.2

			if var_370_7 <= arg_367_1.time_ and arg_367_1.time_ < var_370_7 + var_370_8 then
				local var_370_9 = (arg_367_1.time_ - var_370_7) / var_370_8

				if arg_367_1.var_.actorSpriteComps1132 then
					for iter_370_4, iter_370_5 in pairs(arg_367_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_370_5 then
							local var_370_10 = Mathf.Lerp(iter_370_5.color.r, 0.5, var_370_9)

							iter_370_5.color = Color.New(var_370_10, var_370_10, var_370_10)
						end
					end
				end
			end

			if arg_367_1.time_ >= var_370_7 + var_370_8 and arg_367_1.time_ < var_370_7 + var_370_8 + arg_370_0 and arg_367_1.var_.actorSpriteComps1132 then
				local var_370_11 = 0.5

				for iter_370_6, iter_370_7 in pairs(arg_367_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_370_7 then
						iter_370_7.color = Color.New(var_370_11, var_370_11, var_370_11)
					end
				end

				arg_367_1.var_.actorSpriteComps1132 = nil
			end

			local var_370_12 = 0
			local var_370_13 = 0.825

			if var_370_12 < arg_367_1.time_ and arg_367_1.time_ <= var_370_12 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0
				arg_367_1.dialogCg_.alpha = 1

				arg_367_1.dialog_:SetActive(true)
				SetActive(arg_367_1.leftNameGo_, true)

				local var_370_14 = arg_367_1:FormatText(StoryNameCfg[367].name)

				arg_367_1.leftNameTxt_.text = var_370_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_367_1.leftNameTxt_.transform)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1.leftNameTxt_.text)
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_15 = arg_367_1:GetWordFromCfg(117041090)
				local var_370_16 = arg_367_1:FormatText(var_370_15.content)

				arg_367_1.text_.text = var_370_16

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_17 = 33
				local var_370_18 = utf8.len(var_370_16)
				local var_370_19 = var_370_17 <= 0 and var_370_13 or var_370_13 * (var_370_18 / var_370_17)

				if var_370_19 > 0 and var_370_13 < var_370_19 then
					arg_367_1.talkMaxDuration = var_370_19

					if var_370_19 + var_370_12 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_19 + var_370_12
					end
				end

				arg_367_1.text_.text = var_370_16
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041090", "story_v_out_117041.awb") ~= 0 then
					local var_370_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041090", "story_v_out_117041.awb") / 1000

					if var_370_20 + var_370_12 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_20 + var_370_12
					end

					if var_370_15.prefab_name ~= "" and arg_367_1.actors_[var_370_15.prefab_name] ~= nil then
						local var_370_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_367_1.actors_[var_370_15.prefab_name].transform, "story_v_out_117041", "117041090", "story_v_out_117041.awb")

						arg_367_1:RecordAudio("117041090", var_370_21)
						arg_367_1:RecordAudio("117041090", var_370_21)
					else
						arg_367_1:AudioAction("play", "voice", "story_v_out_117041", "117041090", "story_v_out_117041.awb")
					end

					arg_367_1:RecordHistoryTalkVoice("story_v_out_117041", "117041090", "story_v_out_117041.awb")
				end

				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_22 = math.max(var_370_13, arg_367_1.talkMaxDuration)

			if var_370_12 <= arg_367_1.time_ and arg_367_1.time_ < var_370_12 + var_370_22 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_12) / var_370_22

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_12 + var_370_22 and arg_367_1.time_ < var_370_12 + var_370_22 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play117041091 = function(arg_371_0, arg_371_1)
		arg_371_1.time_ = 0
		arg_371_1.frameCnt_ = 0
		arg_371_1.state_ = "playing"
		arg_371_1.curTalkId_ = 117041091
		arg_371_1.duration_ = 15

		local var_371_0 = {
			zh = 15,
			ja = 5.2
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
				arg_371_0:Play117041092(arg_371_1)
			end
		end

		function arg_371_1.onSingleLineUpdate_(arg_374_0)
			local var_374_0 = arg_371_1.actors_["1132"].transform
			local var_374_1 = 0

			if var_374_1 < arg_371_1.time_ and arg_371_1.time_ <= var_374_1 + arg_374_0 then
				arg_371_1.var_.moveOldPos1132 = var_374_0.localPosition
				var_374_0.localScale = Vector3.New(1, 1, 1)

				arg_371_1:CheckSpriteTmpPos("1132", 2)

				local var_374_2 = var_374_0.childCount

				for iter_374_0 = 0, var_374_2 - 1 do
					local var_374_3 = var_374_0:GetChild(iter_374_0)

					if var_374_3.name == "split_6" or not string.find(var_374_3.name, "split") then
						var_374_3.gameObject:SetActive(true)
					else
						var_374_3.gameObject:SetActive(false)
					end
				end
			end

			local var_374_4 = 0.001

			if var_374_1 <= arg_371_1.time_ and arg_371_1.time_ < var_374_1 + var_374_4 then
				local var_374_5 = (arg_371_1.time_ - var_374_1) / var_374_4
				local var_374_6 = Vector3.New(-390, -413, -185)

				var_374_0.localPosition = Vector3.Lerp(arg_371_1.var_.moveOldPos1132, var_374_6, var_374_5)
			end

			if arg_371_1.time_ >= var_374_1 + var_374_4 and arg_371_1.time_ < var_374_1 + var_374_4 + arg_374_0 then
				var_374_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_374_7 = arg_371_1.actors_["10034"]
			local var_374_8 = 0

			if var_374_8 < arg_371_1.time_ and arg_371_1.time_ <= var_374_8 + arg_374_0 and arg_371_1.var_.actorSpriteComps10034 == nil then
				arg_371_1.var_.actorSpriteComps10034 = var_374_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_9 = 0.2

			if var_374_8 <= arg_371_1.time_ and arg_371_1.time_ < var_374_8 + var_374_9 then
				local var_374_10 = (arg_371_1.time_ - var_374_8) / var_374_9

				if arg_371_1.var_.actorSpriteComps10034 then
					for iter_374_1, iter_374_2 in pairs(arg_371_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_374_2 then
							local var_374_11 = Mathf.Lerp(iter_374_2.color.r, 0.5, var_374_10)

							iter_374_2.color = Color.New(var_374_11, var_374_11, var_374_11)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_8 + var_374_9 and arg_371_1.time_ < var_374_8 + var_374_9 + arg_374_0 and arg_371_1.var_.actorSpriteComps10034 then
				local var_374_12 = 0.5

				for iter_374_3, iter_374_4 in pairs(arg_371_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_374_4 then
						iter_374_4.color = Color.New(var_374_12, var_374_12, var_374_12)
					end
				end

				arg_371_1.var_.actorSpriteComps10034 = nil
			end

			local var_374_13 = arg_371_1.actors_["1132"]
			local var_374_14 = 0

			if var_374_14 < arg_371_1.time_ and arg_371_1.time_ <= var_374_14 + arg_374_0 and arg_371_1.var_.actorSpriteComps1132 == nil then
				arg_371_1.var_.actorSpriteComps1132 = var_374_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_374_15 = 0.2

			if var_374_14 <= arg_371_1.time_ and arg_371_1.time_ < var_374_14 + var_374_15 then
				local var_374_16 = (arg_371_1.time_ - var_374_14) / var_374_15

				if arg_371_1.var_.actorSpriteComps1132 then
					for iter_374_5, iter_374_6 in pairs(arg_371_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_374_6 then
							local var_374_17 = Mathf.Lerp(iter_374_6.color.r, 1, var_374_16)

							iter_374_6.color = Color.New(var_374_17, var_374_17, var_374_17)
						end
					end
				end
			end

			if arg_371_1.time_ >= var_374_14 + var_374_15 and arg_371_1.time_ < var_374_14 + var_374_15 + arg_374_0 and arg_371_1.var_.actorSpriteComps1132 then
				local var_374_18 = 1

				for iter_374_7, iter_374_8 in pairs(arg_371_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_374_8 then
						iter_374_8.color = Color.New(var_374_18, var_374_18, var_374_18)
					end
				end

				arg_371_1.var_.actorSpriteComps1132 = nil
			end

			local var_374_19 = 0
			local var_374_20 = 1.375

			if var_374_19 < arg_371_1.time_ and arg_371_1.time_ <= var_374_19 + arg_374_0 then
				arg_371_1.talkMaxDuration = 0
				arg_371_1.dialogCg_.alpha = 1

				arg_371_1.dialog_:SetActive(true)
				SetActive(arg_371_1.leftNameGo_, true)

				local var_374_21 = arg_371_1:FormatText(StoryNameCfg[61].name)

				arg_371_1.leftNameTxt_.text = var_374_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_371_1.leftNameTxt_.transform)

				arg_371_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_371_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_371_1:RecordName(arg_371_1.leftNameTxt_.text)
				SetActive(arg_371_1.iconTrs_.gameObject, false)
				arg_371_1.callingController_:SetSelectedState("normal")

				local var_374_22 = arg_371_1:GetWordFromCfg(117041091)
				local var_374_23 = arg_371_1:FormatText(var_374_22.content)

				arg_371_1.text_.text = var_374_23

				LuaForUtil.ClearLinePrefixSymbol(arg_371_1.text_)

				local var_374_24 = 55
				local var_374_25 = utf8.len(var_374_23)
				local var_374_26 = var_374_24 <= 0 and var_374_20 or var_374_20 * (var_374_25 / var_374_24)

				if var_374_26 > 0 and var_374_20 < var_374_26 then
					arg_371_1.talkMaxDuration = var_374_26

					if var_374_26 + var_374_19 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_26 + var_374_19
					end
				end

				arg_371_1.text_.text = var_374_23
				arg_371_1.typewritter.percent = 0

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041091", "story_v_out_117041.awb") ~= 0 then
					local var_374_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041091", "story_v_out_117041.awb") / 1000

					if var_374_27 + var_374_19 > arg_371_1.duration_ then
						arg_371_1.duration_ = var_374_27 + var_374_19
					end

					if var_374_22.prefab_name ~= "" and arg_371_1.actors_[var_374_22.prefab_name] ~= nil then
						local var_374_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_371_1.actors_[var_374_22.prefab_name].transform, "story_v_out_117041", "117041091", "story_v_out_117041.awb")

						arg_371_1:RecordAudio("117041091", var_374_28)
						arg_371_1:RecordAudio("117041091", var_374_28)
					else
						arg_371_1:AudioAction("play", "voice", "story_v_out_117041", "117041091", "story_v_out_117041.awb")
					end

					arg_371_1:RecordHistoryTalkVoice("story_v_out_117041", "117041091", "story_v_out_117041.awb")
				end

				arg_371_1:RecordContent(arg_371_1.text_.text)
			end

			local var_374_29 = math.max(var_374_20, arg_371_1.talkMaxDuration)

			if var_374_19 <= arg_371_1.time_ and arg_371_1.time_ < var_374_19 + var_374_29 then
				arg_371_1.typewritter.percent = (arg_371_1.time_ - var_374_19) / var_374_29

				arg_371_1.typewritter:SetDirty()
			end

			if arg_371_1.time_ >= var_374_19 + var_374_29 and arg_371_1.time_ < var_374_19 + var_374_29 + arg_374_0 then
				arg_371_1.typewritter.percent = 1

				arg_371_1.typewritter:SetDirty()
				arg_371_1:ShowNextGo(true)
			end
		end
	end,
	Play117041092 = function(arg_375_0, arg_375_1)
		arg_375_1.time_ = 0
		arg_375_1.frameCnt_ = 0
		arg_375_1.state_ = "playing"
		arg_375_1.curTalkId_ = 117041092
		arg_375_1.duration_ = 3.8

		local var_375_0 = {
			zh = 3.8,
			ja = 1.833
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
				arg_375_0:Play117041093(arg_375_1)
			end
		end

		function arg_375_1.onSingleLineUpdate_(arg_378_0)
			local var_378_0 = arg_375_1.actors_["10034"].transform
			local var_378_1 = 0

			if var_378_1 < arg_375_1.time_ and arg_375_1.time_ <= var_378_1 + arg_378_0 then
				arg_375_1.var_.moveOldPos10034 = var_378_0.localPosition
				var_378_0.localScale = Vector3.New(1, 1, 1)

				arg_375_1:CheckSpriteTmpPos("10034", 4)

				local var_378_2 = var_378_0.childCount

				for iter_378_0 = 0, var_378_2 - 1 do
					local var_378_3 = var_378_0:GetChild(iter_378_0)

					if var_378_3.name == "split_2" or not string.find(var_378_3.name, "split") then
						var_378_3.gameObject:SetActive(true)
					else
						var_378_3.gameObject:SetActive(false)
					end
				end
			end

			local var_378_4 = 0.001

			if var_378_1 <= arg_375_1.time_ and arg_375_1.time_ < var_378_1 + var_378_4 then
				local var_378_5 = (arg_375_1.time_ - var_378_1) / var_378_4
				local var_378_6 = Vector3.New(390, -415, -290)

				var_378_0.localPosition = Vector3.Lerp(arg_375_1.var_.moveOldPos10034, var_378_6, var_378_5)
			end

			if arg_375_1.time_ >= var_378_1 + var_378_4 and arg_375_1.time_ < var_378_1 + var_378_4 + arg_378_0 then
				var_378_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_378_7 = arg_375_1.actors_["10034"]
			local var_378_8 = 0

			if var_378_8 < arg_375_1.time_ and arg_375_1.time_ <= var_378_8 + arg_378_0 and arg_375_1.var_.actorSpriteComps10034 == nil then
				arg_375_1.var_.actorSpriteComps10034 = var_378_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_378_9 = 0.2

			if var_378_8 <= arg_375_1.time_ and arg_375_1.time_ < var_378_8 + var_378_9 then
				local var_378_10 = (arg_375_1.time_ - var_378_8) / var_378_9

				if arg_375_1.var_.actorSpriteComps10034 then
					for iter_378_1, iter_378_2 in pairs(arg_375_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_378_2 then
							local var_378_11 = Mathf.Lerp(iter_378_2.color.r, 1, var_378_10)

							iter_378_2.color = Color.New(var_378_11, var_378_11, var_378_11)
						end
					end
				end
			end

			if arg_375_1.time_ >= var_378_8 + var_378_9 and arg_375_1.time_ < var_378_8 + var_378_9 + arg_378_0 and arg_375_1.var_.actorSpriteComps10034 then
				local var_378_12 = 1

				for iter_378_3, iter_378_4 in pairs(arg_375_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_378_4 then
						iter_378_4.color = Color.New(var_378_12, var_378_12, var_378_12)
					end
				end

				arg_375_1.var_.actorSpriteComps10034 = nil
			end

			local var_378_13 = arg_375_1.actors_["1132"]
			local var_378_14 = 0

			if var_378_14 < arg_375_1.time_ and arg_375_1.time_ <= var_378_14 + arg_378_0 and arg_375_1.var_.actorSpriteComps1132 == nil then
				arg_375_1.var_.actorSpriteComps1132 = var_378_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_378_15 = 0.2

			if var_378_14 <= arg_375_1.time_ and arg_375_1.time_ < var_378_14 + var_378_15 then
				local var_378_16 = (arg_375_1.time_ - var_378_14) / var_378_15

				if arg_375_1.var_.actorSpriteComps1132 then
					for iter_378_5, iter_378_6 in pairs(arg_375_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_378_6 then
							local var_378_17 = Mathf.Lerp(iter_378_6.color.r, 0.5, var_378_16)

							iter_378_6.color = Color.New(var_378_17, var_378_17, var_378_17)
						end
					end
				end
			end

			if arg_375_1.time_ >= var_378_14 + var_378_15 and arg_375_1.time_ < var_378_14 + var_378_15 + arg_378_0 and arg_375_1.var_.actorSpriteComps1132 then
				local var_378_18 = 0.5

				for iter_378_7, iter_378_8 in pairs(arg_375_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_378_8 then
						iter_378_8.color = Color.New(var_378_18, var_378_18, var_378_18)
					end
				end

				arg_375_1.var_.actorSpriteComps1132 = nil
			end

			local var_378_19 = 0
			local var_378_20 = 0.325

			if var_378_19 < arg_375_1.time_ and arg_375_1.time_ <= var_378_19 + arg_378_0 then
				arg_375_1.talkMaxDuration = 0
				arg_375_1.dialogCg_.alpha = 1

				arg_375_1.dialog_:SetActive(true)
				SetActive(arg_375_1.leftNameGo_, true)

				local var_378_21 = arg_375_1:FormatText(StoryNameCfg[367].name)

				arg_375_1.leftNameTxt_.text = var_378_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_375_1.leftNameTxt_.transform)

				arg_375_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_375_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_375_1:RecordName(arg_375_1.leftNameTxt_.text)
				SetActive(arg_375_1.iconTrs_.gameObject, false)
				arg_375_1.callingController_:SetSelectedState("normal")

				local var_378_22 = arg_375_1:GetWordFromCfg(117041092)
				local var_378_23 = arg_375_1:FormatText(var_378_22.content)

				arg_375_1.text_.text = var_378_23

				LuaForUtil.ClearLinePrefixSymbol(arg_375_1.text_)

				local var_378_24 = 13
				local var_378_25 = utf8.len(var_378_23)
				local var_378_26 = var_378_24 <= 0 and var_378_20 or var_378_20 * (var_378_25 / var_378_24)

				if var_378_26 > 0 and var_378_20 < var_378_26 then
					arg_375_1.talkMaxDuration = var_378_26

					if var_378_26 + var_378_19 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_26 + var_378_19
					end
				end

				arg_375_1.text_.text = var_378_23
				arg_375_1.typewritter.percent = 0

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041092", "story_v_out_117041.awb") ~= 0 then
					local var_378_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041092", "story_v_out_117041.awb") / 1000

					if var_378_27 + var_378_19 > arg_375_1.duration_ then
						arg_375_1.duration_ = var_378_27 + var_378_19
					end

					if var_378_22.prefab_name ~= "" and arg_375_1.actors_[var_378_22.prefab_name] ~= nil then
						local var_378_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_375_1.actors_[var_378_22.prefab_name].transform, "story_v_out_117041", "117041092", "story_v_out_117041.awb")

						arg_375_1:RecordAudio("117041092", var_378_28)
						arg_375_1:RecordAudio("117041092", var_378_28)
					else
						arg_375_1:AudioAction("play", "voice", "story_v_out_117041", "117041092", "story_v_out_117041.awb")
					end

					arg_375_1:RecordHistoryTalkVoice("story_v_out_117041", "117041092", "story_v_out_117041.awb")
				end

				arg_375_1:RecordContent(arg_375_1.text_.text)
			end

			local var_378_29 = math.max(var_378_20, arg_375_1.talkMaxDuration)

			if var_378_19 <= arg_375_1.time_ and arg_375_1.time_ < var_378_19 + var_378_29 then
				arg_375_1.typewritter.percent = (arg_375_1.time_ - var_378_19) / var_378_29

				arg_375_1.typewritter:SetDirty()
			end

			if arg_375_1.time_ >= var_378_19 + var_378_29 and arg_375_1.time_ < var_378_19 + var_378_29 + arg_378_0 then
				arg_375_1.typewritter.percent = 1

				arg_375_1.typewritter:SetDirty()
				arg_375_1:ShowNextGo(true)
			end
		end
	end,
	Play117041093 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 117041093
		arg_379_1.duration_ = 6.5

		local var_379_0 = {
			zh = 6.5,
			ja = 5.666
		}
		local var_379_1 = manager.audio:GetLocalizationFlag()

		if var_379_0[var_379_1] ~= nil then
			arg_379_1.duration_ = var_379_0[var_379_1]
		end

		SetActive(arg_379_1.tipsGo_, false)

		function arg_379_1.onSingleLineFinish_()
			arg_379_1.onSingleLineUpdate_ = nil
			arg_379_1.onSingleLineFinish_ = nil
			arg_379_1.state_ = "waiting"
		end

		function arg_379_1.playNext_(arg_381_0)
			if arg_381_0 == 1 then
				arg_379_0:Play117041094(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0
			local var_382_1 = 0.675

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_2 = arg_379_1:FormatText(StoryNameCfg[367].name)

				arg_379_1.leftNameTxt_.text = var_382_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_3 = arg_379_1:GetWordFromCfg(117041093)
				local var_382_4 = arg_379_1:FormatText(var_382_3.content)

				arg_379_1.text_.text = var_382_4

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_5 = 27
				local var_382_6 = utf8.len(var_382_4)
				local var_382_7 = var_382_5 <= 0 and var_382_1 or var_382_1 * (var_382_6 / var_382_5)

				if var_382_7 > 0 and var_382_1 < var_382_7 then
					arg_379_1.talkMaxDuration = var_382_7

					if var_382_7 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_7 + var_382_0
					end
				end

				arg_379_1.text_.text = var_382_4
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041093", "story_v_out_117041.awb") ~= 0 then
					local var_382_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041093", "story_v_out_117041.awb") / 1000

					if var_382_8 + var_382_0 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_8 + var_382_0
					end

					if var_382_3.prefab_name ~= "" and arg_379_1.actors_[var_382_3.prefab_name] ~= nil then
						local var_382_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_3.prefab_name].transform, "story_v_out_117041", "117041093", "story_v_out_117041.awb")

						arg_379_1:RecordAudio("117041093", var_382_9)
						arg_379_1:RecordAudio("117041093", var_382_9)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_117041", "117041093", "story_v_out_117041.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_117041", "117041093", "story_v_out_117041.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_10 = math.max(var_382_1, arg_379_1.talkMaxDuration)

			if var_382_0 <= arg_379_1.time_ and arg_379_1.time_ < var_382_0 + var_382_10 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_0) / var_382_10

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_0 + var_382_10 and arg_379_1.time_ < var_382_0 + var_382_10 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play117041094 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 117041094
		arg_383_1.duration_ = 7.633

		local var_383_0 = {
			zh = 7.333,
			ja = 7.633
		}
		local var_383_1 = manager.audio:GetLocalizationFlag()

		if var_383_0[var_383_1] ~= nil then
			arg_383_1.duration_ = var_383_0[var_383_1]
		end

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play117041095(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1132"].transform
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 then
				arg_383_1.var_.moveOldPos1132 = var_386_0.localPosition
				var_386_0.localScale = Vector3.New(1, 1, 1)

				arg_383_1:CheckSpriteTmpPos("1132", 2)

				local var_386_2 = var_386_0.childCount

				for iter_386_0 = 0, var_386_2 - 1 do
					local var_386_3 = var_386_0:GetChild(iter_386_0)

					if var_386_3.name == "split_2" or not string.find(var_386_3.name, "split") then
						var_386_3.gameObject:SetActive(true)
					else
						var_386_3.gameObject:SetActive(false)
					end
				end
			end

			local var_386_4 = 0.001

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_4 then
				local var_386_5 = (arg_383_1.time_ - var_386_1) / var_386_4
				local var_386_6 = Vector3.New(-390, -413, -185)

				var_386_0.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1132, var_386_6, var_386_5)
			end

			if arg_383_1.time_ >= var_386_1 + var_386_4 and arg_383_1.time_ < var_386_1 + var_386_4 + arg_386_0 then
				var_386_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_386_7 = arg_383_1.actors_["10034"]
			local var_386_8 = 0

			if var_386_8 < arg_383_1.time_ and arg_383_1.time_ <= var_386_8 + arg_386_0 and arg_383_1.var_.actorSpriteComps10034 == nil then
				arg_383_1.var_.actorSpriteComps10034 = var_386_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_386_9 = 0.2

			if var_386_8 <= arg_383_1.time_ and arg_383_1.time_ < var_386_8 + var_386_9 then
				local var_386_10 = (arg_383_1.time_ - var_386_8) / var_386_9

				if arg_383_1.var_.actorSpriteComps10034 then
					for iter_386_1, iter_386_2 in pairs(arg_383_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_386_2 then
							local var_386_11 = Mathf.Lerp(iter_386_2.color.r, 0.5, var_386_10)

							iter_386_2.color = Color.New(var_386_11, var_386_11, var_386_11)
						end
					end
				end
			end

			if arg_383_1.time_ >= var_386_8 + var_386_9 and arg_383_1.time_ < var_386_8 + var_386_9 + arg_386_0 and arg_383_1.var_.actorSpriteComps10034 then
				local var_386_12 = 0.5

				for iter_386_3, iter_386_4 in pairs(arg_383_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_386_4 then
						iter_386_4.color = Color.New(var_386_12, var_386_12, var_386_12)
					end
				end

				arg_383_1.var_.actorSpriteComps10034 = nil
			end

			local var_386_13 = arg_383_1.actors_["1132"]
			local var_386_14 = 0

			if var_386_14 < arg_383_1.time_ and arg_383_1.time_ <= var_386_14 + arg_386_0 and arg_383_1.var_.actorSpriteComps1132 == nil then
				arg_383_1.var_.actorSpriteComps1132 = var_386_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_386_15 = 0.2

			if var_386_14 <= arg_383_1.time_ and arg_383_1.time_ < var_386_14 + var_386_15 then
				local var_386_16 = (arg_383_1.time_ - var_386_14) / var_386_15

				if arg_383_1.var_.actorSpriteComps1132 then
					for iter_386_5, iter_386_6 in pairs(arg_383_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_386_6 then
							local var_386_17 = Mathf.Lerp(iter_386_6.color.r, 1, var_386_16)

							iter_386_6.color = Color.New(var_386_17, var_386_17, var_386_17)
						end
					end
				end
			end

			if arg_383_1.time_ >= var_386_14 + var_386_15 and arg_383_1.time_ < var_386_14 + var_386_15 + arg_386_0 and arg_383_1.var_.actorSpriteComps1132 then
				local var_386_18 = 1

				for iter_386_7, iter_386_8 in pairs(arg_383_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_386_8 then
						iter_386_8.color = Color.New(var_386_18, var_386_18, var_386_18)
					end
				end

				arg_383_1.var_.actorSpriteComps1132 = nil
			end

			local var_386_19 = 0
			local var_386_20 = 0.875

			if var_386_19 < arg_383_1.time_ and arg_383_1.time_ <= var_386_19 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, true)

				local var_386_21 = arg_383_1:FormatText(StoryNameCfg[61].name)

				arg_383_1.leftNameTxt_.text = var_386_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_383_1.leftNameTxt_.transform)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1.leftNameTxt_.text)
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_22 = arg_383_1:GetWordFromCfg(117041094)
				local var_386_23 = arg_383_1:FormatText(var_386_22.content)

				arg_383_1.text_.text = var_386_23

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_24 = 35
				local var_386_25 = utf8.len(var_386_23)
				local var_386_26 = var_386_24 <= 0 and var_386_20 or var_386_20 * (var_386_25 / var_386_24)

				if var_386_26 > 0 and var_386_20 < var_386_26 then
					arg_383_1.talkMaxDuration = var_386_26

					if var_386_26 + var_386_19 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_26 + var_386_19
					end
				end

				arg_383_1.text_.text = var_386_23
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041094", "story_v_out_117041.awb") ~= 0 then
					local var_386_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041094", "story_v_out_117041.awb") / 1000

					if var_386_27 + var_386_19 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_27 + var_386_19
					end

					if var_386_22.prefab_name ~= "" and arg_383_1.actors_[var_386_22.prefab_name] ~= nil then
						local var_386_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_383_1.actors_[var_386_22.prefab_name].transform, "story_v_out_117041", "117041094", "story_v_out_117041.awb")

						arg_383_1:RecordAudio("117041094", var_386_28)
						arg_383_1:RecordAudio("117041094", var_386_28)
					else
						arg_383_1:AudioAction("play", "voice", "story_v_out_117041", "117041094", "story_v_out_117041.awb")
					end

					arg_383_1:RecordHistoryTalkVoice("story_v_out_117041", "117041094", "story_v_out_117041.awb")
				end

				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_29 = math.max(var_386_20, arg_383_1.talkMaxDuration)

			if var_386_19 <= arg_383_1.time_ and arg_383_1.time_ < var_386_19 + var_386_29 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_19) / var_386_29

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_19 + var_386_29 and arg_383_1.time_ < var_386_19 + var_386_29 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play117041095 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 117041095
		arg_387_1.duration_ = 8.666

		local var_387_0 = {
			zh = 7.5,
			ja = 8.666
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
				arg_387_0:Play117041096(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = 0
			local var_390_1 = 0.75

			if var_390_0 < arg_387_1.time_ and arg_387_1.time_ <= var_390_0 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_2 = arg_387_1:FormatText(StoryNameCfg[61].name)

				arg_387_1.leftNameTxt_.text = var_390_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_3 = arg_387_1:GetWordFromCfg(117041095)
				local var_390_4 = arg_387_1:FormatText(var_390_3.content)

				arg_387_1.text_.text = var_390_4

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041095", "story_v_out_117041.awb") ~= 0 then
					local var_390_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041095", "story_v_out_117041.awb") / 1000

					if var_390_8 + var_390_0 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_8 + var_390_0
					end

					if var_390_3.prefab_name ~= "" and arg_387_1.actors_[var_390_3.prefab_name] ~= nil then
						local var_390_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_3.prefab_name].transform, "story_v_out_117041", "117041095", "story_v_out_117041.awb")

						arg_387_1:RecordAudio("117041095", var_390_9)
						arg_387_1:RecordAudio("117041095", var_390_9)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_117041", "117041095", "story_v_out_117041.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_117041", "117041095", "story_v_out_117041.awb")
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
	Play117041096 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 117041096
		arg_391_1.duration_ = 6.333

		local var_391_0 = {
			zh = 3.266,
			ja = 6.333
		}
		local var_391_1 = manager.audio:GetLocalizationFlag()

		if var_391_0[var_391_1] ~= nil then
			arg_391_1.duration_ = var_391_0[var_391_1]
		end

		SetActive(arg_391_1.tipsGo_, false)

		function arg_391_1.onSingleLineFinish_()
			arg_391_1.onSingleLineUpdate_ = nil
			arg_391_1.onSingleLineFinish_ = nil
			arg_391_1.state_ = "waiting"
		end

		function arg_391_1.playNext_(arg_393_0)
			if arg_393_0 == 1 then
				arg_391_0:Play117041097(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["10034"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and arg_391_1.var_.actorSpriteComps10034 == nil then
				arg_391_1.var_.actorSpriteComps10034 = var_394_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_394_2 = 0.2

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.actorSpriteComps10034 then
					for iter_394_0, iter_394_1 in pairs(arg_391_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_394_1 then
							local var_394_4 = Mathf.Lerp(iter_394_1.color.r, 1, var_394_3)

							iter_394_1.color = Color.New(var_394_4, var_394_4, var_394_4)
						end
					end
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and arg_391_1.var_.actorSpriteComps10034 then
				local var_394_5 = 1

				for iter_394_2, iter_394_3 in pairs(arg_391_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_394_3 then
						iter_394_3.color = Color.New(var_394_5, var_394_5, var_394_5)
					end
				end

				arg_391_1.var_.actorSpriteComps10034 = nil
			end

			local var_394_6 = arg_391_1.actors_["1132"]
			local var_394_7 = 0

			if var_394_7 < arg_391_1.time_ and arg_391_1.time_ <= var_394_7 + arg_394_0 and arg_391_1.var_.actorSpriteComps1132 == nil then
				arg_391_1.var_.actorSpriteComps1132 = var_394_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_394_8 = 0.2

			if var_394_7 <= arg_391_1.time_ and arg_391_1.time_ < var_394_7 + var_394_8 then
				local var_394_9 = (arg_391_1.time_ - var_394_7) / var_394_8

				if arg_391_1.var_.actorSpriteComps1132 then
					for iter_394_4, iter_394_5 in pairs(arg_391_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_394_5 then
							local var_394_10 = Mathf.Lerp(iter_394_5.color.r, 0.5, var_394_9)

							iter_394_5.color = Color.New(var_394_10, var_394_10, var_394_10)
						end
					end
				end
			end

			if arg_391_1.time_ >= var_394_7 + var_394_8 and arg_391_1.time_ < var_394_7 + var_394_8 + arg_394_0 and arg_391_1.var_.actorSpriteComps1132 then
				local var_394_11 = 0.5

				for iter_394_6, iter_394_7 in pairs(arg_391_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_394_7 then
						iter_394_7.color = Color.New(var_394_11, var_394_11, var_394_11)
					end
				end

				arg_391_1.var_.actorSpriteComps1132 = nil
			end

			local var_394_12 = 0
			local var_394_13 = 0.325

			if var_394_12 < arg_391_1.time_ and arg_391_1.time_ <= var_394_12 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_14 = arg_391_1:FormatText(StoryNameCfg[367].name)

				arg_391_1.leftNameTxt_.text = var_394_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_15 = arg_391_1:GetWordFromCfg(117041096)
				local var_394_16 = arg_391_1:FormatText(var_394_15.content)

				arg_391_1.text_.text = var_394_16

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_17 = 13
				local var_394_18 = utf8.len(var_394_16)
				local var_394_19 = var_394_17 <= 0 and var_394_13 or var_394_13 * (var_394_18 / var_394_17)

				if var_394_19 > 0 and var_394_13 < var_394_19 then
					arg_391_1.talkMaxDuration = var_394_19

					if var_394_19 + var_394_12 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_19 + var_394_12
					end
				end

				arg_391_1.text_.text = var_394_16
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041096", "story_v_out_117041.awb") ~= 0 then
					local var_394_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041096", "story_v_out_117041.awb") / 1000

					if var_394_20 + var_394_12 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_20 + var_394_12
					end

					if var_394_15.prefab_name ~= "" and arg_391_1.actors_[var_394_15.prefab_name] ~= nil then
						local var_394_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_15.prefab_name].transform, "story_v_out_117041", "117041096", "story_v_out_117041.awb")

						arg_391_1:RecordAudio("117041096", var_394_21)
						arg_391_1:RecordAudio("117041096", var_394_21)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_117041", "117041096", "story_v_out_117041.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_117041", "117041096", "story_v_out_117041.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_22 = math.max(var_394_13, arg_391_1.talkMaxDuration)

			if var_394_12 <= arg_391_1.time_ and arg_391_1.time_ < var_394_12 + var_394_22 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_12) / var_394_22

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_12 + var_394_22 and arg_391_1.time_ < var_394_12 + var_394_22 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play117041097 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 117041097
		arg_395_1.duration_ = 2.3

		local var_395_0 = {
			zh = 2.3,
			ja = 0.999999999999
		}
		local var_395_1 = manager.audio:GetLocalizationFlag()

		if var_395_0[var_395_1] ~= nil then
			arg_395_1.duration_ = var_395_0[var_395_1]
		end

		SetActive(arg_395_1.tipsGo_, false)

		function arg_395_1.onSingleLineFinish_()
			arg_395_1.onSingleLineUpdate_ = nil
			arg_395_1.onSingleLineFinish_ = nil
			arg_395_1.state_ = "waiting"
		end

		function arg_395_1.playNext_(arg_397_0)
			if arg_397_0 == 1 then
				arg_395_0:Play117041098(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1132"].transform
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 then
				arg_395_1.var_.moveOldPos1132 = var_398_0.localPosition
				var_398_0.localScale = Vector3.New(1, 1, 1)

				arg_395_1:CheckSpriteTmpPos("1132", 2)

				local var_398_2 = var_398_0.childCount

				for iter_398_0 = 0, var_398_2 - 1 do
					local var_398_3 = var_398_0:GetChild(iter_398_0)

					if var_398_3.name == "split_6" or not string.find(var_398_3.name, "split") then
						var_398_3.gameObject:SetActive(true)
					else
						var_398_3.gameObject:SetActive(false)
					end
				end
			end

			local var_398_4 = 0.001

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_4 then
				local var_398_5 = (arg_395_1.time_ - var_398_1) / var_398_4
				local var_398_6 = Vector3.New(-390, -413, -185)

				var_398_0.localPosition = Vector3.Lerp(arg_395_1.var_.moveOldPos1132, var_398_6, var_398_5)
			end

			if arg_395_1.time_ >= var_398_1 + var_398_4 and arg_395_1.time_ < var_398_1 + var_398_4 + arg_398_0 then
				var_398_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_398_7 = arg_395_1.actors_["10034"]
			local var_398_8 = 0

			if var_398_8 < arg_395_1.time_ and arg_395_1.time_ <= var_398_8 + arg_398_0 and arg_395_1.var_.actorSpriteComps10034 == nil then
				arg_395_1.var_.actorSpriteComps10034 = var_398_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_9 = 0.2

			if var_398_8 <= arg_395_1.time_ and arg_395_1.time_ < var_398_8 + var_398_9 then
				local var_398_10 = (arg_395_1.time_ - var_398_8) / var_398_9

				if arg_395_1.var_.actorSpriteComps10034 then
					for iter_398_1, iter_398_2 in pairs(arg_395_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_398_2 then
							local var_398_11 = Mathf.Lerp(iter_398_2.color.r, 0.5, var_398_10)

							iter_398_2.color = Color.New(var_398_11, var_398_11, var_398_11)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_8 + var_398_9 and arg_395_1.time_ < var_398_8 + var_398_9 + arg_398_0 and arg_395_1.var_.actorSpriteComps10034 then
				local var_398_12 = 0.5

				for iter_398_3, iter_398_4 in pairs(arg_395_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_398_4 then
						iter_398_4.color = Color.New(var_398_12, var_398_12, var_398_12)
					end
				end

				arg_395_1.var_.actorSpriteComps10034 = nil
			end

			local var_398_13 = arg_395_1.actors_["1132"]
			local var_398_14 = 0

			if var_398_14 < arg_395_1.time_ and arg_395_1.time_ <= var_398_14 + arg_398_0 and arg_395_1.var_.actorSpriteComps1132 == nil then
				arg_395_1.var_.actorSpriteComps1132 = var_398_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_398_15 = 0.2

			if var_398_14 <= arg_395_1.time_ and arg_395_1.time_ < var_398_14 + var_398_15 then
				local var_398_16 = (arg_395_1.time_ - var_398_14) / var_398_15

				if arg_395_1.var_.actorSpriteComps1132 then
					for iter_398_5, iter_398_6 in pairs(arg_395_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_398_6 then
							local var_398_17 = Mathf.Lerp(iter_398_6.color.r, 1, var_398_16)

							iter_398_6.color = Color.New(var_398_17, var_398_17, var_398_17)
						end
					end
				end
			end

			if arg_395_1.time_ >= var_398_14 + var_398_15 and arg_395_1.time_ < var_398_14 + var_398_15 + arg_398_0 and arg_395_1.var_.actorSpriteComps1132 then
				local var_398_18 = 1

				for iter_398_7, iter_398_8 in pairs(arg_395_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_398_8 then
						iter_398_8.color = Color.New(var_398_18, var_398_18, var_398_18)
					end
				end

				arg_395_1.var_.actorSpriteComps1132 = nil
			end

			local var_398_19 = 0
			local var_398_20 = 0.275

			if var_398_19 < arg_395_1.time_ and arg_395_1.time_ <= var_398_19 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_21 = arg_395_1:FormatText(StoryNameCfg[61].name)

				arg_395_1.leftNameTxt_.text = var_398_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_22 = arg_395_1:GetWordFromCfg(117041097)
				local var_398_23 = arg_395_1:FormatText(var_398_22.content)

				arg_395_1.text_.text = var_398_23

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_24 = 11
				local var_398_25 = utf8.len(var_398_23)
				local var_398_26 = var_398_24 <= 0 and var_398_20 or var_398_20 * (var_398_25 / var_398_24)

				if var_398_26 > 0 and var_398_20 < var_398_26 then
					arg_395_1.talkMaxDuration = var_398_26

					if var_398_26 + var_398_19 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_26 + var_398_19
					end
				end

				arg_395_1.text_.text = var_398_23
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041097", "story_v_out_117041.awb") ~= 0 then
					local var_398_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041097", "story_v_out_117041.awb") / 1000

					if var_398_27 + var_398_19 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_27 + var_398_19
					end

					if var_398_22.prefab_name ~= "" and arg_395_1.actors_[var_398_22.prefab_name] ~= nil then
						local var_398_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_22.prefab_name].transform, "story_v_out_117041", "117041097", "story_v_out_117041.awb")

						arg_395_1:RecordAudio("117041097", var_398_28)
						arg_395_1:RecordAudio("117041097", var_398_28)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_117041", "117041097", "story_v_out_117041.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_117041", "117041097", "story_v_out_117041.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_29 = math.max(var_398_20, arg_395_1.talkMaxDuration)

			if var_398_19 <= arg_395_1.time_ and arg_395_1.time_ < var_398_19 + var_398_29 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_19) / var_398_29

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_19 + var_398_29 and arg_395_1.time_ < var_398_19 + var_398_29 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play117041098 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 117041098
		arg_399_1.duration_ = 5

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play117041099(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = arg_399_1.actors_["1132"]
			local var_402_1 = 0

			if var_402_1 < arg_399_1.time_ and arg_399_1.time_ <= var_402_1 + arg_402_0 and arg_399_1.var_.actorSpriteComps1132 == nil then
				arg_399_1.var_.actorSpriteComps1132 = var_402_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_402_2 = 0.2

			if var_402_1 <= arg_399_1.time_ and arg_399_1.time_ < var_402_1 + var_402_2 then
				local var_402_3 = (arg_399_1.time_ - var_402_1) / var_402_2

				if arg_399_1.var_.actorSpriteComps1132 then
					for iter_402_0, iter_402_1 in pairs(arg_399_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_402_1 then
							local var_402_4 = Mathf.Lerp(iter_402_1.color.r, 0.5, var_402_3)

							iter_402_1.color = Color.New(var_402_4, var_402_4, var_402_4)
						end
					end
				end
			end

			if arg_399_1.time_ >= var_402_1 + var_402_2 and arg_399_1.time_ < var_402_1 + var_402_2 + arg_402_0 and arg_399_1.var_.actorSpriteComps1132 then
				local var_402_5 = 0.5

				for iter_402_2, iter_402_3 in pairs(arg_399_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_402_3 then
						iter_402_3.color = Color.New(var_402_5, var_402_5, var_402_5)
					end
				end

				arg_399_1.var_.actorSpriteComps1132 = nil
			end

			local var_402_6 = 0
			local var_402_7 = 0.45

			if var_402_6 < arg_399_1.time_ and arg_399_1.time_ <= var_402_6 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, false)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_8 = arg_399_1:GetWordFromCfg(117041098)
				local var_402_9 = arg_399_1:FormatText(var_402_8.content)

				arg_399_1.text_.text = var_402_9

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_10 = 18
				local var_402_11 = utf8.len(var_402_9)
				local var_402_12 = var_402_10 <= 0 and var_402_7 or var_402_7 * (var_402_11 / var_402_10)

				if var_402_12 > 0 and var_402_7 < var_402_12 then
					arg_399_1.talkMaxDuration = var_402_12

					if var_402_12 + var_402_6 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_12 + var_402_6
					end
				end

				arg_399_1.text_.text = var_402_9
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)
				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_13 = math.max(var_402_7, arg_399_1.talkMaxDuration)

			if var_402_6 <= arg_399_1.time_ and arg_399_1.time_ < var_402_6 + var_402_13 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_6) / var_402_13

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_6 + var_402_13 and arg_399_1.time_ < var_402_6 + var_402_13 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play117041099 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 117041099
		arg_403_1.duration_ = 3.8

		local var_403_0 = {
			zh = 3.8,
			ja = 3
		}
		local var_403_1 = manager.audio:GetLocalizationFlag()

		if var_403_0[var_403_1] ~= nil then
			arg_403_1.duration_ = var_403_0[var_403_1]
		end

		SetActive(arg_403_1.tipsGo_, false)

		function arg_403_1.onSingleLineFinish_()
			arg_403_1.onSingleLineUpdate_ = nil
			arg_403_1.onSingleLineFinish_ = nil
			arg_403_1.state_ = "waiting"
		end

		function arg_403_1.playNext_(arg_405_0)
			if arg_405_0 == 1 then
				arg_403_0:Play117041100(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1132"]
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 and arg_403_1.var_.actorSpriteComps1132 == nil then
				arg_403_1.var_.actorSpriteComps1132 = var_406_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_406_2 = 0.2

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2

				if arg_403_1.var_.actorSpriteComps1132 then
					for iter_406_0, iter_406_1 in pairs(arg_403_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_406_1 then
							local var_406_4 = Mathf.Lerp(iter_406_1.color.r, 1, var_406_3)

							iter_406_1.color = Color.New(var_406_4, var_406_4, var_406_4)
						end
					end
				end
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 and arg_403_1.var_.actorSpriteComps1132 then
				local var_406_5 = 1

				for iter_406_2, iter_406_3 in pairs(arg_403_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_406_3 then
						iter_406_3.color = Color.New(var_406_5, var_406_5, var_406_5)
					end
				end

				arg_403_1.var_.actorSpriteComps1132 = nil
			end

			local var_406_6 = 0
			local var_406_7 = 0.275

			if var_406_6 < arg_403_1.time_ and arg_403_1.time_ <= var_406_6 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_8 = arg_403_1:FormatText(StoryNameCfg[61].name)

				arg_403_1.leftNameTxt_.text = var_406_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_9 = arg_403_1:GetWordFromCfg(117041099)
				local var_406_10 = arg_403_1:FormatText(var_406_9.content)

				arg_403_1.text_.text = var_406_10

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_11 = 11
				local var_406_12 = utf8.len(var_406_10)
				local var_406_13 = var_406_11 <= 0 and var_406_7 or var_406_7 * (var_406_12 / var_406_11)

				if var_406_13 > 0 and var_406_7 < var_406_13 then
					arg_403_1.talkMaxDuration = var_406_13

					if var_406_13 + var_406_6 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_13 + var_406_6
					end
				end

				arg_403_1.text_.text = var_406_10
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041099", "story_v_out_117041.awb") ~= 0 then
					local var_406_14 = manager.audio:GetVoiceLength("story_v_out_117041", "117041099", "story_v_out_117041.awb") / 1000

					if var_406_14 + var_406_6 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_14 + var_406_6
					end

					if var_406_9.prefab_name ~= "" and arg_403_1.actors_[var_406_9.prefab_name] ~= nil then
						local var_406_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_9.prefab_name].transform, "story_v_out_117041", "117041099", "story_v_out_117041.awb")

						arg_403_1:RecordAudio("117041099", var_406_15)
						arg_403_1:RecordAudio("117041099", var_406_15)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_117041", "117041099", "story_v_out_117041.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_117041", "117041099", "story_v_out_117041.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_16 = math.max(var_406_7, arg_403_1.talkMaxDuration)

			if var_406_6 <= arg_403_1.time_ and arg_403_1.time_ < var_406_6 + var_406_16 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_6) / var_406_16

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_6 + var_406_16 and arg_403_1.time_ < var_406_6 + var_406_16 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play117041100 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 117041100
		arg_407_1.duration_ = 7.7

		local var_407_0 = {
			zh = 7.7,
			ja = 4.666
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
				arg_407_0:Play117041101(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = 0
			local var_410_1 = 0.725

			if var_410_0 < arg_407_1.time_ and arg_407_1.time_ <= var_410_0 + arg_410_0 then
				arg_407_1.talkMaxDuration = 0
				arg_407_1.dialogCg_.alpha = 1

				arg_407_1.dialog_:SetActive(true)
				SetActive(arg_407_1.leftNameGo_, true)

				local var_410_2 = arg_407_1:FormatText(StoryNameCfg[61].name)

				arg_407_1.leftNameTxt_.text = var_410_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_407_1.leftNameTxt_.transform)

				arg_407_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_407_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_407_1:RecordName(arg_407_1.leftNameTxt_.text)
				SetActive(arg_407_1.iconTrs_.gameObject, false)
				arg_407_1.callingController_:SetSelectedState("normal")

				local var_410_3 = arg_407_1:GetWordFromCfg(117041100)
				local var_410_4 = arg_407_1:FormatText(var_410_3.content)

				arg_407_1.text_.text = var_410_4

				LuaForUtil.ClearLinePrefixSymbol(arg_407_1.text_)

				local var_410_5 = 29
				local var_410_6 = utf8.len(var_410_4)
				local var_410_7 = var_410_5 <= 0 and var_410_1 or var_410_1 * (var_410_6 / var_410_5)

				if var_410_7 > 0 and var_410_1 < var_410_7 then
					arg_407_1.talkMaxDuration = var_410_7

					if var_410_7 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_7 + var_410_0
					end
				end

				arg_407_1.text_.text = var_410_4
				arg_407_1.typewritter.percent = 0

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041100", "story_v_out_117041.awb") ~= 0 then
					local var_410_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041100", "story_v_out_117041.awb") / 1000

					if var_410_8 + var_410_0 > arg_407_1.duration_ then
						arg_407_1.duration_ = var_410_8 + var_410_0
					end

					if var_410_3.prefab_name ~= "" and arg_407_1.actors_[var_410_3.prefab_name] ~= nil then
						local var_410_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_407_1.actors_[var_410_3.prefab_name].transform, "story_v_out_117041", "117041100", "story_v_out_117041.awb")

						arg_407_1:RecordAudio("117041100", var_410_9)
						arg_407_1:RecordAudio("117041100", var_410_9)
					else
						arg_407_1:AudioAction("play", "voice", "story_v_out_117041", "117041100", "story_v_out_117041.awb")
					end

					arg_407_1:RecordHistoryTalkVoice("story_v_out_117041", "117041100", "story_v_out_117041.awb")
				end

				arg_407_1:RecordContent(arg_407_1.text_.text)
			end

			local var_410_10 = math.max(var_410_1, arg_407_1.talkMaxDuration)

			if var_410_0 <= arg_407_1.time_ and arg_407_1.time_ < var_410_0 + var_410_10 then
				arg_407_1.typewritter.percent = (arg_407_1.time_ - var_410_0) / var_410_10

				arg_407_1.typewritter:SetDirty()
			end

			if arg_407_1.time_ >= var_410_0 + var_410_10 and arg_407_1.time_ < var_410_0 + var_410_10 + arg_410_0 then
				arg_407_1.typewritter.percent = 1

				arg_407_1.typewritter:SetDirty()
				arg_407_1:ShowNextGo(true)
			end
		end
	end,
	Play117041101 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 117041101
		arg_411_1.duration_ = 4.633

		local var_411_0 = {
			zh = 3.366,
			ja = 4.633
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
				arg_411_0:Play117041102(arg_411_1)
			end
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1132"]
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 and arg_411_1.var_.actorSpriteComps1132 == nil then
				arg_411_1.var_.actorSpriteComps1132 = var_414_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_414_2 = 0.2

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2

				if arg_411_1.var_.actorSpriteComps1132 then
					for iter_414_0, iter_414_1 in pairs(arg_411_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_414_1 then
							local var_414_4 = Mathf.Lerp(iter_414_1.color.r, 0.5, var_414_3)

							iter_414_1.color = Color.New(var_414_4, var_414_4, var_414_4)
						end
					end
				end
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 and arg_411_1.var_.actorSpriteComps1132 then
				local var_414_5 = 0.5

				for iter_414_2, iter_414_3 in pairs(arg_411_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_414_3 then
						iter_414_3.color = Color.New(var_414_5, var_414_5, var_414_5)
					end
				end

				arg_411_1.var_.actorSpriteComps1132 = nil
			end

			local var_414_6 = arg_411_1.actors_["10034"]
			local var_414_7 = 0

			if var_414_7 < arg_411_1.time_ and arg_411_1.time_ <= var_414_7 + arg_414_0 and arg_411_1.var_.actorSpriteComps10034 == nil then
				arg_411_1.var_.actorSpriteComps10034 = var_414_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_414_8 = 0.2

			if var_414_7 <= arg_411_1.time_ and arg_411_1.time_ < var_414_7 + var_414_8 then
				local var_414_9 = (arg_411_1.time_ - var_414_7) / var_414_8

				if arg_411_1.var_.actorSpriteComps10034 then
					for iter_414_4, iter_414_5 in pairs(arg_411_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_414_5 then
							local var_414_10 = Mathf.Lerp(iter_414_5.color.r, 1, var_414_9)

							iter_414_5.color = Color.New(var_414_10, var_414_10, var_414_10)
						end
					end
				end
			end

			if arg_411_1.time_ >= var_414_7 + var_414_8 and arg_411_1.time_ < var_414_7 + var_414_8 + arg_414_0 and arg_411_1.var_.actorSpriteComps10034 then
				local var_414_11 = 1

				for iter_414_6, iter_414_7 in pairs(arg_411_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_414_7 then
						iter_414_7.color = Color.New(var_414_11, var_414_11, var_414_11)
					end
				end

				arg_411_1.var_.actorSpriteComps10034 = nil
			end

			local var_414_12 = 0
			local var_414_13 = 0.225

			if var_414_12 < arg_411_1.time_ and arg_411_1.time_ <= var_414_12 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_14 = arg_411_1:FormatText(StoryNameCfg[367].name)

				arg_411_1.leftNameTxt_.text = var_414_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_15 = arg_411_1:GetWordFromCfg(117041101)
				local var_414_16 = arg_411_1:FormatText(var_414_15.content)

				arg_411_1.text_.text = var_414_16

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_17 = 9
				local var_414_18 = utf8.len(var_414_16)
				local var_414_19 = var_414_17 <= 0 and var_414_13 or var_414_13 * (var_414_18 / var_414_17)

				if var_414_19 > 0 and var_414_13 < var_414_19 then
					arg_411_1.talkMaxDuration = var_414_19

					if var_414_19 + var_414_12 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_19 + var_414_12
					end
				end

				arg_411_1.text_.text = var_414_16
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041101", "story_v_out_117041.awb") ~= 0 then
					local var_414_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041101", "story_v_out_117041.awb") / 1000

					if var_414_20 + var_414_12 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_20 + var_414_12
					end

					if var_414_15.prefab_name ~= "" and arg_411_1.actors_[var_414_15.prefab_name] ~= nil then
						local var_414_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_15.prefab_name].transform, "story_v_out_117041", "117041101", "story_v_out_117041.awb")

						arg_411_1:RecordAudio("117041101", var_414_21)
						arg_411_1:RecordAudio("117041101", var_414_21)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_117041", "117041101", "story_v_out_117041.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_117041", "117041101", "story_v_out_117041.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_22 = math.max(var_414_13, arg_411_1.talkMaxDuration)

			if var_414_12 <= arg_411_1.time_ and arg_411_1.time_ < var_414_12 + var_414_22 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_12) / var_414_22

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_12 + var_414_22 and arg_411_1.time_ < var_414_12 + var_414_22 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	Play117041102 = function(arg_415_0, arg_415_1)
		arg_415_1.time_ = 0
		arg_415_1.frameCnt_ = 0
		arg_415_1.state_ = "playing"
		arg_415_1.curTalkId_ = 117041102
		arg_415_1.duration_ = 9

		SetActive(arg_415_1.tipsGo_, false)

		function arg_415_1.onSingleLineFinish_()
			arg_415_1.onSingleLineUpdate_ = nil
			arg_415_1.onSingleLineFinish_ = nil
			arg_415_1.state_ = "waiting"
		end

		function arg_415_1.playNext_(arg_417_0)
			if arg_417_0 == 1 then
				arg_415_0:Play117041103(arg_415_1)
			end
		end

		function arg_415_1.onSingleLineUpdate_(arg_418_0)
			local var_418_0 = "TI0103"

			if arg_415_1.bgs_[var_418_0] == nil then
				local var_418_1 = Object.Instantiate(arg_415_1.paintGo_)

				var_418_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_418_0)
				var_418_1.name = var_418_0
				var_418_1.transform.parent = arg_415_1.stage_.transform
				var_418_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_415_1.bgs_[var_418_0] = var_418_1
			end

			local var_418_2 = 2

			if var_418_2 < arg_415_1.time_ and arg_415_1.time_ <= var_418_2 + arg_418_0 then
				local var_418_3 = manager.ui.mainCamera.transform.localPosition
				local var_418_4 = Vector3.New(0, 0, 10) + Vector3.New(var_418_3.x, var_418_3.y, 0)
				local var_418_5 = arg_415_1.bgs_.TI0103

				var_418_5.transform.localPosition = var_418_4
				var_418_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_418_6 = var_418_5:GetComponent("SpriteRenderer")

				if var_418_6 and var_418_6.sprite then
					local var_418_7 = (var_418_5.transform.localPosition - var_418_3).z
					local var_418_8 = manager.ui.mainCameraCom_
					local var_418_9 = 2 * var_418_7 * Mathf.Tan(var_418_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_418_10 = var_418_9 * var_418_8.aspect
					local var_418_11 = var_418_6.sprite.bounds.size.x
					local var_418_12 = var_418_6.sprite.bounds.size.y
					local var_418_13 = var_418_10 / var_418_11
					local var_418_14 = var_418_9 / var_418_12
					local var_418_15 = var_418_14 < var_418_13 and var_418_13 or var_418_14

					var_418_5.transform.localScale = Vector3.New(var_418_15, var_418_15, 0)
				end

				for iter_418_0, iter_418_1 in pairs(arg_415_1.bgs_) do
					if iter_418_0 ~= "TI0103" then
						iter_418_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_418_16 = 0

			if var_418_16 < arg_415_1.time_ and arg_415_1.time_ <= var_418_16 + arg_418_0 then
				arg_415_1.mask_.enabled = true
				arg_415_1.mask_.raycastTarget = true

				arg_415_1:SetGaussion(false)
			end

			local var_418_17 = 2

			if var_418_16 <= arg_415_1.time_ and arg_415_1.time_ < var_418_16 + var_418_17 then
				local var_418_18 = (arg_415_1.time_ - var_418_16) / var_418_17
				local var_418_19 = Color.New(0, 0, 0)

				var_418_19.a = Mathf.Lerp(0, 1, var_418_18)
				arg_415_1.mask_.color = var_418_19
			end

			if arg_415_1.time_ >= var_418_16 + var_418_17 and arg_415_1.time_ < var_418_16 + var_418_17 + arg_418_0 then
				local var_418_20 = Color.New(0, 0, 0)

				var_418_20.a = 1
				arg_415_1.mask_.color = var_418_20
			end

			local var_418_21 = 2

			if var_418_21 < arg_415_1.time_ and arg_415_1.time_ <= var_418_21 + arg_418_0 then
				arg_415_1.mask_.enabled = true
				arg_415_1.mask_.raycastTarget = true

				arg_415_1:SetGaussion(false)
			end

			local var_418_22 = 2

			if var_418_21 <= arg_415_1.time_ and arg_415_1.time_ < var_418_21 + var_418_22 then
				local var_418_23 = (arg_415_1.time_ - var_418_21) / var_418_22
				local var_418_24 = Color.New(0, 0, 0)

				var_418_24.a = Mathf.Lerp(1, 0, var_418_23)
				arg_415_1.mask_.color = var_418_24
			end

			if arg_415_1.time_ >= var_418_21 + var_418_22 and arg_415_1.time_ < var_418_21 + var_418_22 + arg_418_0 then
				local var_418_25 = Color.New(0, 0, 0)
				local var_418_26 = 0

				arg_415_1.mask_.enabled = false
				var_418_25.a = var_418_26
				arg_415_1.mask_.color = var_418_25
			end

			local var_418_27 = arg_415_1.actors_["1132"].transform
			local var_418_28 = 2

			if var_418_28 < arg_415_1.time_ and arg_415_1.time_ <= var_418_28 + arg_418_0 then
				arg_415_1.var_.moveOldPos1132 = var_418_27.localPosition
				var_418_27.localScale = Vector3.New(1, 1, 1)

				arg_415_1:CheckSpriteTmpPos("1132", 7)

				local var_418_29 = var_418_27.childCount

				for iter_418_2 = 0, var_418_29 - 1 do
					local var_418_30 = var_418_27:GetChild(iter_418_2)

					if var_418_30.name == "split_6" or not string.find(var_418_30.name, "split") then
						var_418_30.gameObject:SetActive(true)
					else
						var_418_30.gameObject:SetActive(false)
					end
				end
			end

			local var_418_31 = 0.001

			if var_418_28 <= arg_415_1.time_ and arg_415_1.time_ < var_418_28 + var_418_31 then
				local var_418_32 = (arg_415_1.time_ - var_418_28) / var_418_31
				local var_418_33 = Vector3.New(0, -2000, -185)

				var_418_27.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPos1132, var_418_33, var_418_32)
			end

			if arg_415_1.time_ >= var_418_28 + var_418_31 and arg_415_1.time_ < var_418_28 + var_418_31 + arg_418_0 then
				var_418_27.localPosition = Vector3.New(0, -2000, -185)
			end

			local var_418_34 = arg_415_1.actors_["10034"].transform
			local var_418_35 = 2

			if var_418_35 < arg_415_1.time_ and arg_415_1.time_ <= var_418_35 + arg_418_0 then
				arg_415_1.var_.moveOldPos10034 = var_418_34.localPosition
				var_418_34.localScale = Vector3.New(1, 1, 1)

				arg_415_1:CheckSpriteTmpPos("10034", 7)

				local var_418_36 = var_418_34.childCount

				for iter_418_3 = 0, var_418_36 - 1 do
					local var_418_37 = var_418_34:GetChild(iter_418_3)

					if var_418_37.name == "split_2" or not string.find(var_418_37.name, "split") then
						var_418_37.gameObject:SetActive(true)
					else
						var_418_37.gameObject:SetActive(false)
					end
				end
			end

			local var_418_38 = 0.001

			if var_418_35 <= arg_415_1.time_ and arg_415_1.time_ < var_418_35 + var_418_38 then
				local var_418_39 = (arg_415_1.time_ - var_418_35) / var_418_38
				local var_418_40 = Vector3.New(0, -2000, -290)

				var_418_34.localPosition = Vector3.Lerp(arg_415_1.var_.moveOldPos10034, var_418_40, var_418_39)
			end

			if arg_415_1.time_ >= var_418_35 + var_418_38 and arg_415_1.time_ < var_418_35 + var_418_38 + arg_418_0 then
				var_418_34.localPosition = Vector3.New(0, -2000, -290)
			end

			if arg_415_1.frameCnt_ <= 1 then
				arg_415_1.dialog_:SetActive(false)
			end

			local var_418_41 = 4
			local var_418_42 = 0.65

			if var_418_41 < arg_415_1.time_ and arg_415_1.time_ <= var_418_41 + arg_418_0 then
				arg_415_1.talkMaxDuration = 0

				arg_415_1.dialog_:SetActive(true)

				local var_418_43 = LeanTween.value(arg_415_1.dialog_, 0, 1, 0.3)

				var_418_43:setOnUpdate(LuaHelper.FloatAction(function(arg_419_0)
					arg_415_1.dialogCg_.alpha = arg_419_0
				end))
				var_418_43:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_415_1.dialog_)
					var_418_43:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_415_1.duration_ = arg_415_1.duration_ + 0.3

				SetActive(arg_415_1.leftNameGo_, false)

				arg_415_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_415_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_415_1:RecordName(arg_415_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_415_1.iconTrs_.gameObject, false)
				arg_415_1.callingController_:SetSelectedState("normal")

				local var_418_44 = arg_415_1:GetWordFromCfg(117041102)
				local var_418_45 = arg_415_1:FormatText(var_418_44.content)

				arg_415_1.text_.text = var_418_45

				LuaForUtil.ClearLinePrefixSymbol(arg_415_1.text_)

				local var_418_46 = 26
				local var_418_47 = utf8.len(var_418_45)
				local var_418_48 = var_418_46 <= 0 and var_418_42 or var_418_42 * (var_418_47 / var_418_46)

				if var_418_48 > 0 and var_418_42 < var_418_48 then
					arg_415_1.talkMaxDuration = var_418_48
					var_418_41 = var_418_41 + 0.3

					if var_418_48 + var_418_41 > arg_415_1.duration_ then
						arg_415_1.duration_ = var_418_48 + var_418_41
					end
				end

				arg_415_1.text_.text = var_418_45
				arg_415_1.typewritter.percent = 0

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(false)
				arg_415_1:RecordContent(arg_415_1.text_.text)
			end

			local var_418_49 = var_418_41 + 0.3
			local var_418_50 = math.max(var_418_42, arg_415_1.talkMaxDuration)

			if var_418_49 <= arg_415_1.time_ and arg_415_1.time_ < var_418_49 + var_418_50 then
				arg_415_1.typewritter.percent = (arg_415_1.time_ - var_418_49) / var_418_50

				arg_415_1.typewritter:SetDirty()
			end

			if arg_415_1.time_ >= var_418_49 + var_418_50 and arg_415_1.time_ < var_418_49 + var_418_50 + arg_418_0 then
				arg_415_1.typewritter.percent = 1

				arg_415_1.typewritter:SetDirty()
				arg_415_1:ShowNextGo(true)
			end
		end
	end,
	Play117041103 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 117041103
		arg_421_1.duration_ = 5

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play117041104(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = 0
			local var_424_1 = 1.125

			if var_424_0 < arg_421_1.time_ and arg_421_1.time_ <= var_424_0 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, false)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_2 = arg_421_1:GetWordFromCfg(117041103)
				local var_424_3 = arg_421_1:FormatText(var_424_2.content)

				arg_421_1.text_.text = var_424_3

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_4 = 45
				local var_424_5 = utf8.len(var_424_3)
				local var_424_6 = var_424_4 <= 0 and var_424_1 or var_424_1 * (var_424_5 / var_424_4)

				if var_424_6 > 0 and var_424_1 < var_424_6 then
					arg_421_1.talkMaxDuration = var_424_6

					if var_424_6 + var_424_0 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_6 + var_424_0
					end
				end

				arg_421_1.text_.text = var_424_3
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)
				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_7 = math.max(var_424_1, arg_421_1.talkMaxDuration)

			if var_424_0 <= arg_421_1.time_ and arg_421_1.time_ < var_424_0 + var_424_7 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_0) / var_424_7

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_0 + var_424_7 and arg_421_1.time_ < var_424_0 + var_424_7 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play117041104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 117041104
		arg_425_1.duration_ = 7.433

		local var_425_0 = {
			zh = 3.433,
			ja = 7.433
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
				arg_425_0:Play117041105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = 0
			local var_428_1 = 0.35

			if var_428_0 < arg_425_1.time_ and arg_425_1.time_ <= var_428_0 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_2 = arg_425_1:FormatText(StoryNameCfg[367].name)

				arg_425_1.leftNameTxt_.text = var_428_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, true)
				arg_425_1.iconController_:SetSelectedState("hero")

				arg_425_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_3 = arg_425_1:GetWordFromCfg(117041104)
				local var_428_4 = arg_425_1:FormatText(var_428_3.content)

				arg_425_1.text_.text = var_428_4

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041104", "story_v_out_117041.awb") ~= 0 then
					local var_428_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041104", "story_v_out_117041.awb") / 1000

					if var_428_8 + var_428_0 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_8 + var_428_0
					end

					if var_428_3.prefab_name ~= "" and arg_425_1.actors_[var_428_3.prefab_name] ~= nil then
						local var_428_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_3.prefab_name].transform, "story_v_out_117041", "117041104", "story_v_out_117041.awb")

						arg_425_1:RecordAudio("117041104", var_428_9)
						arg_425_1:RecordAudio("117041104", var_428_9)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_117041", "117041104", "story_v_out_117041.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_117041", "117041104", "story_v_out_117041.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_10 = math.max(var_428_1, arg_425_1.talkMaxDuration)

			if var_428_0 <= arg_425_1.time_ and arg_425_1.time_ < var_428_0 + var_428_10 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_0) / var_428_10

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_0 + var_428_10 and arg_425_1.time_ < var_428_0 + var_428_10 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play117041105 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 117041105
		arg_429_1.duration_ = 1.6

		local var_429_0 = {
			zh = 1.6,
			ja = 1.333
		}
		local var_429_1 = manager.audio:GetLocalizationFlag()

		if var_429_0[var_429_1] ~= nil then
			arg_429_1.duration_ = var_429_0[var_429_1]
		end

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play117041106(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = 0
			local var_432_1 = 0.125

			if var_432_0 < arg_429_1.time_ and arg_429_1.time_ <= var_432_0 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, true)

				local var_432_2 = arg_429_1:FormatText(StoryNameCfg[61].name)

				arg_429_1.leftNameTxt_.text = var_432_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_429_1.leftNameTxt_.transform)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1.leftNameTxt_.text)
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_3 = arg_429_1:GetWordFromCfg(117041105)
				local var_432_4 = arg_429_1:FormatText(var_432_3.content)

				arg_429_1.text_.text = var_432_4

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_5 = 5
				local var_432_6 = utf8.len(var_432_4)
				local var_432_7 = var_432_5 <= 0 and var_432_1 or var_432_1 * (var_432_6 / var_432_5)

				if var_432_7 > 0 and var_432_1 < var_432_7 then
					arg_429_1.talkMaxDuration = var_432_7

					if var_432_7 + var_432_0 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_7 + var_432_0
					end
				end

				arg_429_1.text_.text = var_432_4
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041105", "story_v_out_117041.awb") ~= 0 then
					local var_432_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041105", "story_v_out_117041.awb") / 1000

					if var_432_8 + var_432_0 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_8 + var_432_0
					end

					if var_432_3.prefab_name ~= "" and arg_429_1.actors_[var_432_3.prefab_name] ~= nil then
						local var_432_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_429_1.actors_[var_432_3.prefab_name].transform, "story_v_out_117041", "117041105", "story_v_out_117041.awb")

						arg_429_1:RecordAudio("117041105", var_432_9)
						arg_429_1:RecordAudio("117041105", var_432_9)
					else
						arg_429_1:AudioAction("play", "voice", "story_v_out_117041", "117041105", "story_v_out_117041.awb")
					end

					arg_429_1:RecordHistoryTalkVoice("story_v_out_117041", "117041105", "story_v_out_117041.awb")
				end

				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_10 = math.max(var_432_1, arg_429_1.talkMaxDuration)

			if var_432_0 <= arg_429_1.time_ and arg_429_1.time_ < var_432_0 + var_432_10 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_0) / var_432_10

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_0 + var_432_10 and arg_429_1.time_ < var_432_0 + var_432_10 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play117041106 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 117041106
		arg_433_1.duration_ = 15.4

		local var_433_0 = {
			zh = 13.3,
			ja = 15.4
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
				arg_433_0:Play117041107(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0
			local var_436_1 = 1.5

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0
				arg_433_1.dialogCg_.alpha = 1

				arg_433_1.dialog_:SetActive(true)
				SetActive(arg_433_1.leftNameGo_, true)

				local var_436_2 = arg_433_1:FormatText(StoryNameCfg[367].name)

				arg_433_1.leftNameTxt_.text = var_436_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_433_1.leftNameTxt_.transform)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1.leftNameTxt_.text)
				SetActive(arg_433_1.iconTrs_.gameObject, true)
				arg_433_1.iconController_:SetSelectedState("hero")

				arg_433_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_3 = arg_433_1:GetWordFromCfg(117041106)
				local var_436_4 = arg_433_1:FormatText(var_436_3.content)

				arg_433_1.text_.text = var_436_4

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_5 = 60
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041106", "story_v_out_117041.awb") ~= 0 then
					local var_436_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041106", "story_v_out_117041.awb") / 1000

					if var_436_8 + var_436_0 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_8 + var_436_0
					end

					if var_436_3.prefab_name ~= "" and arg_433_1.actors_[var_436_3.prefab_name] ~= nil then
						local var_436_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_433_1.actors_[var_436_3.prefab_name].transform, "story_v_out_117041", "117041106", "story_v_out_117041.awb")

						arg_433_1:RecordAudio("117041106", var_436_9)
						arg_433_1:RecordAudio("117041106", var_436_9)
					else
						arg_433_1:AudioAction("play", "voice", "story_v_out_117041", "117041106", "story_v_out_117041.awb")
					end

					arg_433_1:RecordHistoryTalkVoice("story_v_out_117041", "117041106", "story_v_out_117041.awb")
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
	Play117041107 = function(arg_437_0, arg_437_1)
		arg_437_1.time_ = 0
		arg_437_1.frameCnt_ = 0
		arg_437_1.state_ = "playing"
		arg_437_1.curTalkId_ = 117041107
		arg_437_1.duration_ = 16.433

		local var_437_0 = {
			zh = 14.733,
			ja = 16.433
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
				arg_437_0:Play117041108(arg_437_1)
			end
		end

		function arg_437_1.onSingleLineUpdate_(arg_440_0)
			local var_440_0 = 0
			local var_440_1 = 1.55

			if var_440_0 < arg_437_1.time_ and arg_437_1.time_ <= var_440_0 + arg_440_0 then
				arg_437_1.talkMaxDuration = 0
				arg_437_1.dialogCg_.alpha = 1

				arg_437_1.dialog_:SetActive(true)
				SetActive(arg_437_1.leftNameGo_, true)

				local var_440_2 = arg_437_1:FormatText(StoryNameCfg[367].name)

				arg_437_1.leftNameTxt_.text = var_440_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_437_1.leftNameTxt_.transform)

				arg_437_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_437_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_437_1:RecordName(arg_437_1.leftNameTxt_.text)
				SetActive(arg_437_1.iconTrs_.gameObject, true)
				arg_437_1.iconController_:SetSelectedState("hero")

				arg_437_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_437_1.callingController_:SetSelectedState("normal")

				local var_440_3 = arg_437_1:GetWordFromCfg(117041107)
				local var_440_4 = arg_437_1:FormatText(var_440_3.content)

				arg_437_1.text_.text = var_440_4

				LuaForUtil.ClearLinePrefixSymbol(arg_437_1.text_)

				local var_440_5 = 62
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041107", "story_v_out_117041.awb") ~= 0 then
					local var_440_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041107", "story_v_out_117041.awb") / 1000

					if var_440_8 + var_440_0 > arg_437_1.duration_ then
						arg_437_1.duration_ = var_440_8 + var_440_0
					end

					if var_440_3.prefab_name ~= "" and arg_437_1.actors_[var_440_3.prefab_name] ~= nil then
						local var_440_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_437_1.actors_[var_440_3.prefab_name].transform, "story_v_out_117041", "117041107", "story_v_out_117041.awb")

						arg_437_1:RecordAudio("117041107", var_440_9)
						arg_437_1:RecordAudio("117041107", var_440_9)
					else
						arg_437_1:AudioAction("play", "voice", "story_v_out_117041", "117041107", "story_v_out_117041.awb")
					end

					arg_437_1:RecordHistoryTalkVoice("story_v_out_117041", "117041107", "story_v_out_117041.awb")
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
	Play117041108 = function(arg_441_0, arg_441_1)
		arg_441_1.time_ = 0
		arg_441_1.frameCnt_ = 0
		arg_441_1.state_ = "playing"
		arg_441_1.curTalkId_ = 117041108
		arg_441_1.duration_ = 5

		SetActive(arg_441_1.tipsGo_, false)

		function arg_441_1.onSingleLineFinish_()
			arg_441_1.onSingleLineUpdate_ = nil
			arg_441_1.onSingleLineFinish_ = nil
			arg_441_1.state_ = "waiting"
		end

		function arg_441_1.playNext_(arg_443_0)
			if arg_443_0 == 1 then
				arg_441_0:Play117041109(arg_441_1)
			end
		end

		function arg_441_1.onSingleLineUpdate_(arg_444_0)
			local var_444_0 = 0
			local var_444_1 = 0.45

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

				local var_444_2 = arg_441_1:GetWordFromCfg(117041108)
				local var_444_3 = arg_441_1:FormatText(var_444_2.content)

				arg_441_1.text_.text = var_444_3

				LuaForUtil.ClearLinePrefixSymbol(arg_441_1.text_)

				local var_444_4 = 18
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
	Play117041109 = function(arg_445_0, arg_445_1)
		arg_445_1.time_ = 0
		arg_445_1.frameCnt_ = 0
		arg_445_1.state_ = "playing"
		arg_445_1.curTalkId_ = 117041109
		arg_445_1.duration_ = 4.5

		local var_445_0 = {
			zh = 4.5,
			ja = 2.8
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
				arg_445_0:Play117041110(arg_445_1)
			end
		end

		function arg_445_1.onSingleLineUpdate_(arg_448_0)
			local var_448_0 = 0
			local var_448_1 = 0.525

			if var_448_0 < arg_445_1.time_ and arg_445_1.time_ <= var_448_0 + arg_448_0 then
				arg_445_1.talkMaxDuration = 0
				arg_445_1.dialogCg_.alpha = 1

				arg_445_1.dialog_:SetActive(true)
				SetActive(arg_445_1.leftNameGo_, true)

				local var_448_2 = arg_445_1:FormatText(StoryNameCfg[61].name)

				arg_445_1.leftNameTxt_.text = var_448_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_445_1.leftNameTxt_.transform)

				arg_445_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_445_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_445_1:RecordName(arg_445_1.leftNameTxt_.text)
				SetActive(arg_445_1.iconTrs_.gameObject, false)
				arg_445_1.callingController_:SetSelectedState("normal")

				local var_448_3 = arg_445_1:GetWordFromCfg(117041109)
				local var_448_4 = arg_445_1:FormatText(var_448_3.content)

				arg_445_1.text_.text = var_448_4

				LuaForUtil.ClearLinePrefixSymbol(arg_445_1.text_)

				local var_448_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041109", "story_v_out_117041.awb") ~= 0 then
					local var_448_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041109", "story_v_out_117041.awb") / 1000

					if var_448_8 + var_448_0 > arg_445_1.duration_ then
						arg_445_1.duration_ = var_448_8 + var_448_0
					end

					if var_448_3.prefab_name ~= "" and arg_445_1.actors_[var_448_3.prefab_name] ~= nil then
						local var_448_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_445_1.actors_[var_448_3.prefab_name].transform, "story_v_out_117041", "117041109", "story_v_out_117041.awb")

						arg_445_1:RecordAudio("117041109", var_448_9)
						arg_445_1:RecordAudio("117041109", var_448_9)
					else
						arg_445_1:AudioAction("play", "voice", "story_v_out_117041", "117041109", "story_v_out_117041.awb")
					end

					arg_445_1:RecordHistoryTalkVoice("story_v_out_117041", "117041109", "story_v_out_117041.awb")
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
	Play117041110 = function(arg_449_0, arg_449_1)
		arg_449_1.time_ = 0
		arg_449_1.frameCnt_ = 0
		arg_449_1.state_ = "playing"
		arg_449_1.curTalkId_ = 117041110
		arg_449_1.duration_ = 14.233

		local var_449_0 = {
			zh = 14.233,
			ja = 11.7
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
				arg_449_0:Play117041111(arg_449_1)
			end
		end

		function arg_449_1.onSingleLineUpdate_(arg_452_0)
			local var_452_0 = 0
			local var_452_1 = 1.5

			if var_452_0 < arg_449_1.time_ and arg_449_1.time_ <= var_452_0 + arg_452_0 then
				arg_449_1.talkMaxDuration = 0
				arg_449_1.dialogCg_.alpha = 1

				arg_449_1.dialog_:SetActive(true)
				SetActive(arg_449_1.leftNameGo_, true)

				local var_452_2 = arg_449_1:FormatText(StoryNameCfg[367].name)

				arg_449_1.leftNameTxt_.text = var_452_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_449_1.leftNameTxt_.transform)

				arg_449_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_449_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_449_1:RecordName(arg_449_1.leftNameTxt_.text)
				SetActive(arg_449_1.iconTrs_.gameObject, true)
				arg_449_1.iconController_:SetSelectedState("hero")

				arg_449_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_1")

				arg_449_1.callingController_:SetSelectedState("normal")

				local var_452_3 = arg_449_1:GetWordFromCfg(117041110)
				local var_452_4 = arg_449_1:FormatText(var_452_3.content)

				arg_449_1.text_.text = var_452_4

				LuaForUtil.ClearLinePrefixSymbol(arg_449_1.text_)

				local var_452_5 = 60
				local var_452_6 = utf8.len(var_452_4)
				local var_452_7 = var_452_5 <= 0 and var_452_1 or var_452_1 * (var_452_6 / var_452_5)

				if var_452_7 > 0 and var_452_1 < var_452_7 then
					arg_449_1.talkMaxDuration = var_452_7

					if var_452_7 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_7 + var_452_0
					end
				end

				arg_449_1.text_.text = var_452_4
				arg_449_1.typewritter.percent = 0

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041110", "story_v_out_117041.awb") ~= 0 then
					local var_452_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041110", "story_v_out_117041.awb") / 1000

					if var_452_8 + var_452_0 > arg_449_1.duration_ then
						arg_449_1.duration_ = var_452_8 + var_452_0
					end

					if var_452_3.prefab_name ~= "" and arg_449_1.actors_[var_452_3.prefab_name] ~= nil then
						local var_452_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_449_1.actors_[var_452_3.prefab_name].transform, "story_v_out_117041", "117041110", "story_v_out_117041.awb")

						arg_449_1:RecordAudio("117041110", var_452_9)
						arg_449_1:RecordAudio("117041110", var_452_9)
					else
						arg_449_1:AudioAction("play", "voice", "story_v_out_117041", "117041110", "story_v_out_117041.awb")
					end

					arg_449_1:RecordHistoryTalkVoice("story_v_out_117041", "117041110", "story_v_out_117041.awb")
				end

				arg_449_1:RecordContent(arg_449_1.text_.text)
			end

			local var_452_10 = math.max(var_452_1, arg_449_1.talkMaxDuration)

			if var_452_0 <= arg_449_1.time_ and arg_449_1.time_ < var_452_0 + var_452_10 then
				arg_449_1.typewritter.percent = (arg_449_1.time_ - var_452_0) / var_452_10

				arg_449_1.typewritter:SetDirty()
			end

			if arg_449_1.time_ >= var_452_0 + var_452_10 and arg_449_1.time_ < var_452_0 + var_452_10 + arg_452_0 then
				arg_449_1.typewritter.percent = 1

				arg_449_1.typewritter:SetDirty()
				arg_449_1:ShowNextGo(true)
			end
		end
	end,
	Play117041111 = function(arg_453_0, arg_453_1)
		arg_453_1.time_ = 0
		arg_453_1.frameCnt_ = 0
		arg_453_1.state_ = "playing"
		arg_453_1.curTalkId_ = 117041111
		arg_453_1.duration_ = 5

		SetActive(arg_453_1.tipsGo_, false)

		function arg_453_1.onSingleLineFinish_()
			arg_453_1.onSingleLineUpdate_ = nil
			arg_453_1.onSingleLineFinish_ = nil
			arg_453_1.state_ = "waiting"
		end

		function arg_453_1.playNext_(arg_455_0)
			if arg_455_0 == 1 then
				arg_453_0:Play117041112(arg_453_1)
			end
		end

		function arg_453_1.onSingleLineUpdate_(arg_456_0)
			local var_456_0 = 0
			local var_456_1 = 1.275

			if var_456_0 < arg_453_1.time_ and arg_453_1.time_ <= var_456_0 + arg_456_0 then
				arg_453_1.talkMaxDuration = 0
				arg_453_1.dialogCg_.alpha = 1

				arg_453_1.dialog_:SetActive(true)
				SetActive(arg_453_1.leftNameGo_, false)

				arg_453_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_453_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_453_1:RecordName(arg_453_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_453_1.iconTrs_.gameObject, false)
				arg_453_1.callingController_:SetSelectedState("normal")

				local var_456_2 = arg_453_1:GetWordFromCfg(117041111)
				local var_456_3 = arg_453_1:FormatText(var_456_2.content)

				arg_453_1.text_.text = var_456_3

				LuaForUtil.ClearLinePrefixSymbol(arg_453_1.text_)

				local var_456_4 = 51
				local var_456_5 = utf8.len(var_456_3)
				local var_456_6 = var_456_4 <= 0 and var_456_1 or var_456_1 * (var_456_5 / var_456_4)

				if var_456_6 > 0 and var_456_1 < var_456_6 then
					arg_453_1.talkMaxDuration = var_456_6

					if var_456_6 + var_456_0 > arg_453_1.duration_ then
						arg_453_1.duration_ = var_456_6 + var_456_0
					end
				end

				arg_453_1.text_.text = var_456_3
				arg_453_1.typewritter.percent = 0

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(false)
				arg_453_1:RecordContent(arg_453_1.text_.text)
			end

			local var_456_7 = math.max(var_456_1, arg_453_1.talkMaxDuration)

			if var_456_0 <= arg_453_1.time_ and arg_453_1.time_ < var_456_0 + var_456_7 then
				arg_453_1.typewritter.percent = (arg_453_1.time_ - var_456_0) / var_456_7

				arg_453_1.typewritter:SetDirty()
			end

			if arg_453_1.time_ >= var_456_0 + var_456_7 and arg_453_1.time_ < var_456_0 + var_456_7 + arg_456_0 then
				arg_453_1.typewritter.percent = 1

				arg_453_1.typewritter:SetDirty()
				arg_453_1:ShowNextGo(true)
			end
		end
	end,
	Play117041112 = function(arg_457_0, arg_457_1)
		arg_457_1.time_ = 0
		arg_457_1.frameCnt_ = 0
		arg_457_1.state_ = "playing"
		arg_457_1.curTalkId_ = 117041112
		arg_457_1.duration_ = 8.633

		local var_457_0 = {
			zh = 7,
			ja = 8.633
		}
		local var_457_1 = manager.audio:GetLocalizationFlag()

		if var_457_0[var_457_1] ~= nil then
			arg_457_1.duration_ = var_457_0[var_457_1]
		end

		SetActive(arg_457_1.tipsGo_, false)

		function arg_457_1.onSingleLineFinish_()
			arg_457_1.onSingleLineUpdate_ = nil
			arg_457_1.onSingleLineFinish_ = nil
			arg_457_1.state_ = "waiting"
		end

		function arg_457_1.playNext_(arg_459_0)
			if arg_459_0 == 1 then
				arg_457_0:Play117041113(arg_457_1)
			end
		end

		function arg_457_1.onSingleLineUpdate_(arg_460_0)
			local var_460_0 = 0
			local var_460_1 = 0.775

			if var_460_0 < arg_457_1.time_ and arg_457_1.time_ <= var_460_0 + arg_460_0 then
				arg_457_1.talkMaxDuration = 0
				arg_457_1.dialogCg_.alpha = 1

				arg_457_1.dialog_:SetActive(true)
				SetActive(arg_457_1.leftNameGo_, true)

				local var_460_2 = arg_457_1:FormatText(StoryNameCfg[367].name)

				arg_457_1.leftNameTxt_.text = var_460_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_457_1.leftNameTxt_.transform)

				arg_457_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_457_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_457_1:RecordName(arg_457_1.leftNameTxt_.text)
				SetActive(arg_457_1.iconTrs_.gameObject, true)
				arg_457_1.iconController_:SetSelectedState("hero")

				arg_457_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_457_1.callingController_:SetSelectedState("normal")

				local var_460_3 = arg_457_1:GetWordFromCfg(117041112)
				local var_460_4 = arg_457_1:FormatText(var_460_3.content)

				arg_457_1.text_.text = var_460_4

				LuaForUtil.ClearLinePrefixSymbol(arg_457_1.text_)

				local var_460_5 = 31
				local var_460_6 = utf8.len(var_460_4)
				local var_460_7 = var_460_5 <= 0 and var_460_1 or var_460_1 * (var_460_6 / var_460_5)

				if var_460_7 > 0 and var_460_1 < var_460_7 then
					arg_457_1.talkMaxDuration = var_460_7

					if var_460_7 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_7 + var_460_0
					end
				end

				arg_457_1.text_.text = var_460_4
				arg_457_1.typewritter.percent = 0

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041112", "story_v_out_117041.awb") ~= 0 then
					local var_460_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041112", "story_v_out_117041.awb") / 1000

					if var_460_8 + var_460_0 > arg_457_1.duration_ then
						arg_457_1.duration_ = var_460_8 + var_460_0
					end

					if var_460_3.prefab_name ~= "" and arg_457_1.actors_[var_460_3.prefab_name] ~= nil then
						local var_460_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_457_1.actors_[var_460_3.prefab_name].transform, "story_v_out_117041", "117041112", "story_v_out_117041.awb")

						arg_457_1:RecordAudio("117041112", var_460_9)
						arg_457_1:RecordAudio("117041112", var_460_9)
					else
						arg_457_1:AudioAction("play", "voice", "story_v_out_117041", "117041112", "story_v_out_117041.awb")
					end

					arg_457_1:RecordHistoryTalkVoice("story_v_out_117041", "117041112", "story_v_out_117041.awb")
				end

				arg_457_1:RecordContent(arg_457_1.text_.text)
			end

			local var_460_10 = math.max(var_460_1, arg_457_1.talkMaxDuration)

			if var_460_0 <= arg_457_1.time_ and arg_457_1.time_ < var_460_0 + var_460_10 then
				arg_457_1.typewritter.percent = (arg_457_1.time_ - var_460_0) / var_460_10

				arg_457_1.typewritter:SetDirty()
			end

			if arg_457_1.time_ >= var_460_0 + var_460_10 and arg_457_1.time_ < var_460_0 + var_460_10 + arg_460_0 then
				arg_457_1.typewritter.percent = 1

				arg_457_1.typewritter:SetDirty()
				arg_457_1:ShowNextGo(true)
			end
		end
	end,
	Play117041113 = function(arg_461_0, arg_461_1)
		arg_461_1.time_ = 0
		arg_461_1.frameCnt_ = 0
		arg_461_1.state_ = "playing"
		arg_461_1.curTalkId_ = 117041113
		arg_461_1.duration_ = 5

		SetActive(arg_461_1.tipsGo_, false)

		function arg_461_1.onSingleLineFinish_()
			arg_461_1.onSingleLineUpdate_ = nil
			arg_461_1.onSingleLineFinish_ = nil
			arg_461_1.state_ = "waiting"
		end

		function arg_461_1.playNext_(arg_463_0)
			if arg_463_0 == 1 then
				arg_461_0:Play117041114(arg_461_1)
			end
		end

		function arg_461_1.onSingleLineUpdate_(arg_464_0)
			local var_464_0 = 0
			local var_464_1 = 0.9

			if var_464_0 < arg_461_1.time_ and arg_461_1.time_ <= var_464_0 + arg_464_0 then
				arg_461_1.talkMaxDuration = 0
				arg_461_1.dialogCg_.alpha = 1

				arg_461_1.dialog_:SetActive(true)
				SetActive(arg_461_1.leftNameGo_, false)

				arg_461_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_461_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_461_1:RecordName(arg_461_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_461_1.iconTrs_.gameObject, false)
				arg_461_1.callingController_:SetSelectedState("normal")

				local var_464_2 = arg_461_1:GetWordFromCfg(117041113)
				local var_464_3 = arg_461_1:FormatText(var_464_2.content)

				arg_461_1.text_.text = var_464_3

				LuaForUtil.ClearLinePrefixSymbol(arg_461_1.text_)

				local var_464_4 = 36
				local var_464_5 = utf8.len(var_464_3)
				local var_464_6 = var_464_4 <= 0 and var_464_1 or var_464_1 * (var_464_5 / var_464_4)

				if var_464_6 > 0 and var_464_1 < var_464_6 then
					arg_461_1.talkMaxDuration = var_464_6

					if var_464_6 + var_464_0 > arg_461_1.duration_ then
						arg_461_1.duration_ = var_464_6 + var_464_0
					end
				end

				arg_461_1.text_.text = var_464_3
				arg_461_1.typewritter.percent = 0

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(false)
				arg_461_1:RecordContent(arg_461_1.text_.text)
			end

			local var_464_7 = math.max(var_464_1, arg_461_1.talkMaxDuration)

			if var_464_0 <= arg_461_1.time_ and arg_461_1.time_ < var_464_0 + var_464_7 then
				arg_461_1.typewritter.percent = (arg_461_1.time_ - var_464_0) / var_464_7

				arg_461_1.typewritter:SetDirty()
			end

			if arg_461_1.time_ >= var_464_0 + var_464_7 and arg_461_1.time_ < var_464_0 + var_464_7 + arg_464_0 then
				arg_461_1.typewritter.percent = 1

				arg_461_1.typewritter:SetDirty()
				arg_461_1:ShowNextGo(true)
			end
		end
	end,
	Play117041114 = function(arg_465_0, arg_465_1)
		arg_465_1.time_ = 0
		arg_465_1.frameCnt_ = 0
		arg_465_1.state_ = "playing"
		arg_465_1.curTalkId_ = 117041114
		arg_465_1.duration_ = 0.999999999999

		SetActive(arg_465_1.tipsGo_, false)

		function arg_465_1.onSingleLineFinish_()
			arg_465_1.onSingleLineUpdate_ = nil
			arg_465_1.onSingleLineFinish_ = nil
			arg_465_1.state_ = "waiting"
		end

		function arg_465_1.playNext_(arg_467_0)
			if arg_467_0 == 1 then
				arg_465_0:Play117041115(arg_465_1)
			end
		end

		function arg_465_1.onSingleLineUpdate_(arg_468_0)
			local var_468_0 = 0
			local var_468_1 = 0.05

			if var_468_0 < arg_465_1.time_ and arg_465_1.time_ <= var_468_0 + arg_468_0 then
				arg_465_1.talkMaxDuration = 0
				arg_465_1.dialogCg_.alpha = 1

				arg_465_1.dialog_:SetActive(true)
				SetActive(arg_465_1.leftNameGo_, true)

				local var_468_2 = arg_465_1:FormatText(StoryNameCfg[61].name)

				arg_465_1.leftNameTxt_.text = var_468_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_465_1.leftNameTxt_.transform)

				arg_465_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_465_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_465_1:RecordName(arg_465_1.leftNameTxt_.text)
				SetActive(arg_465_1.iconTrs_.gameObject, false)
				arg_465_1.callingController_:SetSelectedState("normal")

				local var_468_3 = arg_465_1:GetWordFromCfg(117041114)
				local var_468_4 = arg_465_1:FormatText(var_468_3.content)

				arg_465_1.text_.text = var_468_4

				LuaForUtil.ClearLinePrefixSymbol(arg_465_1.text_)

				local var_468_5 = 2
				local var_468_6 = utf8.len(var_468_4)
				local var_468_7 = var_468_5 <= 0 and var_468_1 or var_468_1 * (var_468_6 / var_468_5)

				if var_468_7 > 0 and var_468_1 < var_468_7 then
					arg_465_1.talkMaxDuration = var_468_7

					if var_468_7 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_7 + var_468_0
					end
				end

				arg_465_1.text_.text = var_468_4
				arg_465_1.typewritter.percent = 0

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041114", "story_v_out_117041.awb") ~= 0 then
					local var_468_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041114", "story_v_out_117041.awb") / 1000

					if var_468_8 + var_468_0 > arg_465_1.duration_ then
						arg_465_1.duration_ = var_468_8 + var_468_0
					end

					if var_468_3.prefab_name ~= "" and arg_465_1.actors_[var_468_3.prefab_name] ~= nil then
						local var_468_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_465_1.actors_[var_468_3.prefab_name].transform, "story_v_out_117041", "117041114", "story_v_out_117041.awb")

						arg_465_1:RecordAudio("117041114", var_468_9)
						arg_465_1:RecordAudio("117041114", var_468_9)
					else
						arg_465_1:AudioAction("play", "voice", "story_v_out_117041", "117041114", "story_v_out_117041.awb")
					end

					arg_465_1:RecordHistoryTalkVoice("story_v_out_117041", "117041114", "story_v_out_117041.awb")
				end

				arg_465_1:RecordContent(arg_465_1.text_.text)
			end

			local var_468_10 = math.max(var_468_1, arg_465_1.talkMaxDuration)

			if var_468_0 <= arg_465_1.time_ and arg_465_1.time_ < var_468_0 + var_468_10 then
				arg_465_1.typewritter.percent = (arg_465_1.time_ - var_468_0) / var_468_10

				arg_465_1.typewritter:SetDirty()
			end

			if arg_465_1.time_ >= var_468_0 + var_468_10 and arg_465_1.time_ < var_468_0 + var_468_10 + arg_468_0 then
				arg_465_1.typewritter.percent = 1

				arg_465_1.typewritter:SetDirty()
				arg_465_1:ShowNextGo(true)
			end
		end
	end,
	Play117041115 = function(arg_469_0, arg_469_1)
		arg_469_1.time_ = 0
		arg_469_1.frameCnt_ = 0
		arg_469_1.state_ = "playing"
		arg_469_1.curTalkId_ = 117041115
		arg_469_1.duration_ = 18.766

		local var_469_0 = {
			zh = 12.6,
			ja = 18.766
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
				arg_469_0:Play117041116(arg_469_1)
			end
		end

		function arg_469_1.onSingleLineUpdate_(arg_472_0)
			local var_472_0 = 0
			local var_472_1 = 1.025

			if var_472_0 < arg_469_1.time_ and arg_469_1.time_ <= var_472_0 + arg_472_0 then
				arg_469_1.talkMaxDuration = 0
				arg_469_1.dialogCg_.alpha = 1

				arg_469_1.dialog_:SetActive(true)
				SetActive(arg_469_1.leftNameGo_, true)

				local var_472_2 = arg_469_1:FormatText(StoryNameCfg[367].name)

				arg_469_1.leftNameTxt_.text = var_472_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_469_1.leftNameTxt_.transform)

				arg_469_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_469_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_469_1:RecordName(arg_469_1.leftNameTxt_.text)
				SetActive(arg_469_1.iconTrs_.gameObject, true)
				arg_469_1.iconController_:SetSelectedState("hero")

				arg_469_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_3")

				arg_469_1.callingController_:SetSelectedState("normal")

				local var_472_3 = arg_469_1:GetWordFromCfg(117041115)
				local var_472_4 = arg_469_1:FormatText(var_472_3.content)

				arg_469_1.text_.text = var_472_4

				LuaForUtil.ClearLinePrefixSymbol(arg_469_1.text_)

				local var_472_5 = 41
				local var_472_6 = utf8.len(var_472_4)
				local var_472_7 = var_472_5 <= 0 and var_472_1 or var_472_1 * (var_472_6 / var_472_5)

				if var_472_7 > 0 and var_472_1 < var_472_7 then
					arg_469_1.talkMaxDuration = var_472_7

					if var_472_7 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_7 + var_472_0
					end
				end

				arg_469_1.text_.text = var_472_4
				arg_469_1.typewritter.percent = 0

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041115", "story_v_out_117041.awb") ~= 0 then
					local var_472_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041115", "story_v_out_117041.awb") / 1000

					if var_472_8 + var_472_0 > arg_469_1.duration_ then
						arg_469_1.duration_ = var_472_8 + var_472_0
					end

					if var_472_3.prefab_name ~= "" and arg_469_1.actors_[var_472_3.prefab_name] ~= nil then
						local var_472_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_469_1.actors_[var_472_3.prefab_name].transform, "story_v_out_117041", "117041115", "story_v_out_117041.awb")

						arg_469_1:RecordAudio("117041115", var_472_9)
						arg_469_1:RecordAudio("117041115", var_472_9)
					else
						arg_469_1:AudioAction("play", "voice", "story_v_out_117041", "117041115", "story_v_out_117041.awb")
					end

					arg_469_1:RecordHistoryTalkVoice("story_v_out_117041", "117041115", "story_v_out_117041.awb")
				end

				arg_469_1:RecordContent(arg_469_1.text_.text)
			end

			local var_472_10 = math.max(var_472_1, arg_469_1.talkMaxDuration)

			if var_472_0 <= arg_469_1.time_ and arg_469_1.time_ < var_472_0 + var_472_10 then
				arg_469_1.typewritter.percent = (arg_469_1.time_ - var_472_0) / var_472_10

				arg_469_1.typewritter:SetDirty()
			end

			if arg_469_1.time_ >= var_472_0 + var_472_10 and arg_469_1.time_ < var_472_0 + var_472_10 + arg_472_0 then
				arg_469_1.typewritter.percent = 1

				arg_469_1.typewritter:SetDirty()
				arg_469_1:ShowNextGo(true)
			end
		end
	end,
	Play117041116 = function(arg_473_0, arg_473_1)
		arg_473_1.time_ = 0
		arg_473_1.frameCnt_ = 0
		arg_473_1.state_ = "playing"
		arg_473_1.curTalkId_ = 117041116
		arg_473_1.duration_ = 9.766

		local var_473_0 = {
			zh = 9.766,
			ja = 7.166
		}
		local var_473_1 = manager.audio:GetLocalizationFlag()

		if var_473_0[var_473_1] ~= nil then
			arg_473_1.duration_ = var_473_0[var_473_1]
		end

		SetActive(arg_473_1.tipsGo_, false)

		function arg_473_1.onSingleLineFinish_()
			arg_473_1.onSingleLineUpdate_ = nil
			arg_473_1.onSingleLineFinish_ = nil
			arg_473_1.state_ = "waiting"
		end

		function arg_473_1.playNext_(arg_475_0)
			if arg_475_0 == 1 then
				arg_473_0:Play117041117(arg_473_1)
			end
		end

		function arg_473_1.onSingleLineUpdate_(arg_476_0)
			local var_476_0 = 0
			local var_476_1 = 1

			if var_476_0 < arg_473_1.time_ and arg_473_1.time_ <= var_476_0 + arg_476_0 then
				arg_473_1.talkMaxDuration = 0
				arg_473_1.dialogCg_.alpha = 1

				arg_473_1.dialog_:SetActive(true)
				SetActive(arg_473_1.leftNameGo_, true)

				local var_476_2 = arg_473_1:FormatText(StoryNameCfg[367].name)

				arg_473_1.leftNameTxt_.text = var_476_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_473_1.leftNameTxt_.transform)

				arg_473_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_473_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_473_1:RecordName(arg_473_1.leftNameTxt_.text)
				SetActive(arg_473_1.iconTrs_.gameObject, true)
				arg_473_1.iconController_:SetSelectedState("hero")

				arg_473_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_473_1.callingController_:SetSelectedState("normal")

				local var_476_3 = arg_473_1:GetWordFromCfg(117041116)
				local var_476_4 = arg_473_1:FormatText(var_476_3.content)

				arg_473_1.text_.text = var_476_4

				LuaForUtil.ClearLinePrefixSymbol(arg_473_1.text_)

				local var_476_5 = 40
				local var_476_6 = utf8.len(var_476_4)
				local var_476_7 = var_476_5 <= 0 and var_476_1 or var_476_1 * (var_476_6 / var_476_5)

				if var_476_7 > 0 and var_476_1 < var_476_7 then
					arg_473_1.talkMaxDuration = var_476_7

					if var_476_7 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_7 + var_476_0
					end
				end

				arg_473_1.text_.text = var_476_4
				arg_473_1.typewritter.percent = 0

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041116", "story_v_out_117041.awb") ~= 0 then
					local var_476_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041116", "story_v_out_117041.awb") / 1000

					if var_476_8 + var_476_0 > arg_473_1.duration_ then
						arg_473_1.duration_ = var_476_8 + var_476_0
					end

					if var_476_3.prefab_name ~= "" and arg_473_1.actors_[var_476_3.prefab_name] ~= nil then
						local var_476_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_473_1.actors_[var_476_3.prefab_name].transform, "story_v_out_117041", "117041116", "story_v_out_117041.awb")

						arg_473_1:RecordAudio("117041116", var_476_9)
						arg_473_1:RecordAudio("117041116", var_476_9)
					else
						arg_473_1:AudioAction("play", "voice", "story_v_out_117041", "117041116", "story_v_out_117041.awb")
					end

					arg_473_1:RecordHistoryTalkVoice("story_v_out_117041", "117041116", "story_v_out_117041.awb")
				end

				arg_473_1:RecordContent(arg_473_1.text_.text)
			end

			local var_476_10 = math.max(var_476_1, arg_473_1.talkMaxDuration)

			if var_476_0 <= arg_473_1.time_ and arg_473_1.time_ < var_476_0 + var_476_10 then
				arg_473_1.typewritter.percent = (arg_473_1.time_ - var_476_0) / var_476_10

				arg_473_1.typewritter:SetDirty()
			end

			if arg_473_1.time_ >= var_476_0 + var_476_10 and arg_473_1.time_ < var_476_0 + var_476_10 + arg_476_0 then
				arg_473_1.typewritter.percent = 1

				arg_473_1.typewritter:SetDirty()
				arg_473_1:ShowNextGo(true)
			end
		end
	end,
	Play117041117 = function(arg_477_0, arg_477_1)
		arg_477_1.time_ = 0
		arg_477_1.frameCnt_ = 0
		arg_477_1.state_ = "playing"
		arg_477_1.curTalkId_ = 117041117
		arg_477_1.duration_ = 5.6

		local var_477_0 = {
			zh = 5.066,
			ja = 5.6
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
				arg_477_0:Play117041118(arg_477_1)
			end
		end

		function arg_477_1.onSingleLineUpdate_(arg_480_0)
			local var_480_0 = 0
			local var_480_1 = 0.475

			if var_480_0 < arg_477_1.time_ and arg_477_1.time_ <= var_480_0 + arg_480_0 then
				arg_477_1.talkMaxDuration = 0
				arg_477_1.dialogCg_.alpha = 1

				arg_477_1.dialog_:SetActive(true)
				SetActive(arg_477_1.leftNameGo_, true)

				local var_480_2 = arg_477_1:FormatText(StoryNameCfg[61].name)

				arg_477_1.leftNameTxt_.text = var_480_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_477_1.leftNameTxt_.transform)

				arg_477_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_477_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_477_1:RecordName(arg_477_1.leftNameTxt_.text)
				SetActive(arg_477_1.iconTrs_.gameObject, false)
				arg_477_1.callingController_:SetSelectedState("normal")

				local var_480_3 = arg_477_1:GetWordFromCfg(117041117)
				local var_480_4 = arg_477_1:FormatText(var_480_3.content)

				arg_477_1.text_.text = var_480_4

				LuaForUtil.ClearLinePrefixSymbol(arg_477_1.text_)

				local var_480_5 = 19
				local var_480_6 = utf8.len(var_480_4)
				local var_480_7 = var_480_5 <= 0 and var_480_1 or var_480_1 * (var_480_6 / var_480_5)

				if var_480_7 > 0 and var_480_1 < var_480_7 then
					arg_477_1.talkMaxDuration = var_480_7

					if var_480_7 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_7 + var_480_0
					end
				end

				arg_477_1.text_.text = var_480_4
				arg_477_1.typewritter.percent = 0

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041117", "story_v_out_117041.awb") ~= 0 then
					local var_480_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041117", "story_v_out_117041.awb") / 1000

					if var_480_8 + var_480_0 > arg_477_1.duration_ then
						arg_477_1.duration_ = var_480_8 + var_480_0
					end

					if var_480_3.prefab_name ~= "" and arg_477_1.actors_[var_480_3.prefab_name] ~= nil then
						local var_480_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_477_1.actors_[var_480_3.prefab_name].transform, "story_v_out_117041", "117041117", "story_v_out_117041.awb")

						arg_477_1:RecordAudio("117041117", var_480_9)
						arg_477_1:RecordAudio("117041117", var_480_9)
					else
						arg_477_1:AudioAction("play", "voice", "story_v_out_117041", "117041117", "story_v_out_117041.awb")
					end

					arg_477_1:RecordHistoryTalkVoice("story_v_out_117041", "117041117", "story_v_out_117041.awb")
				end

				arg_477_1:RecordContent(arg_477_1.text_.text)
			end

			local var_480_10 = math.max(var_480_1, arg_477_1.talkMaxDuration)

			if var_480_0 <= arg_477_1.time_ and arg_477_1.time_ < var_480_0 + var_480_10 then
				arg_477_1.typewritter.percent = (arg_477_1.time_ - var_480_0) / var_480_10

				arg_477_1.typewritter:SetDirty()
			end

			if arg_477_1.time_ >= var_480_0 + var_480_10 and arg_477_1.time_ < var_480_0 + var_480_10 + arg_480_0 then
				arg_477_1.typewritter.percent = 1

				arg_477_1.typewritter:SetDirty()
				arg_477_1:ShowNextGo(true)
			end
		end
	end,
	Play117041118 = function(arg_481_0, arg_481_1)
		arg_481_1.time_ = 0
		arg_481_1.frameCnt_ = 0
		arg_481_1.state_ = "playing"
		arg_481_1.curTalkId_ = 117041118
		arg_481_1.duration_ = 2.133

		local var_481_0 = {
			zh = 1.166,
			ja = 2.133
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
				arg_481_0:Play117041119(arg_481_1)
			end
		end

		function arg_481_1.onSingleLineUpdate_(arg_484_0)
			local var_484_0 = 0
			local var_484_1 = 0.075

			if var_484_0 < arg_481_1.time_ and arg_481_1.time_ <= var_484_0 + arg_484_0 then
				arg_481_1.talkMaxDuration = 0
				arg_481_1.dialogCg_.alpha = 1

				arg_481_1.dialog_:SetActive(true)
				SetActive(arg_481_1.leftNameGo_, true)

				local var_484_2 = arg_481_1:FormatText(StoryNameCfg[367].name)

				arg_481_1.leftNameTxt_.text = var_484_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_481_1.leftNameTxt_.transform)

				arg_481_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_481_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_481_1:RecordName(arg_481_1.leftNameTxt_.text)
				SetActive(arg_481_1.iconTrs_.gameObject, true)
				arg_481_1.iconController_:SetSelectedState("hero")

				arg_481_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_481_1.callingController_:SetSelectedState("normal")

				local var_484_3 = arg_481_1:GetWordFromCfg(117041118)
				local var_484_4 = arg_481_1:FormatText(var_484_3.content)

				arg_481_1.text_.text = var_484_4

				LuaForUtil.ClearLinePrefixSymbol(arg_481_1.text_)

				local var_484_5 = 3
				local var_484_6 = utf8.len(var_484_4)
				local var_484_7 = var_484_5 <= 0 and var_484_1 or var_484_1 * (var_484_6 / var_484_5)

				if var_484_7 > 0 and var_484_1 < var_484_7 then
					arg_481_1.talkMaxDuration = var_484_7

					if var_484_7 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_7 + var_484_0
					end
				end

				arg_481_1.text_.text = var_484_4
				arg_481_1.typewritter.percent = 0

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041118", "story_v_out_117041.awb") ~= 0 then
					local var_484_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041118", "story_v_out_117041.awb") / 1000

					if var_484_8 + var_484_0 > arg_481_1.duration_ then
						arg_481_1.duration_ = var_484_8 + var_484_0
					end

					if var_484_3.prefab_name ~= "" and arg_481_1.actors_[var_484_3.prefab_name] ~= nil then
						local var_484_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_481_1.actors_[var_484_3.prefab_name].transform, "story_v_out_117041", "117041118", "story_v_out_117041.awb")

						arg_481_1:RecordAudio("117041118", var_484_9)
						arg_481_1:RecordAudio("117041118", var_484_9)
					else
						arg_481_1:AudioAction("play", "voice", "story_v_out_117041", "117041118", "story_v_out_117041.awb")
					end

					arg_481_1:RecordHistoryTalkVoice("story_v_out_117041", "117041118", "story_v_out_117041.awb")
				end

				arg_481_1:RecordContent(arg_481_1.text_.text)
			end

			local var_484_10 = math.max(var_484_1, arg_481_1.talkMaxDuration)

			if var_484_0 <= arg_481_1.time_ and arg_481_1.time_ < var_484_0 + var_484_10 then
				arg_481_1.typewritter.percent = (arg_481_1.time_ - var_484_0) / var_484_10

				arg_481_1.typewritter:SetDirty()
			end

			if arg_481_1.time_ >= var_484_0 + var_484_10 and arg_481_1.time_ < var_484_0 + var_484_10 + arg_484_0 then
				arg_481_1.typewritter.percent = 1

				arg_481_1.typewritter:SetDirty()
				arg_481_1:ShowNextGo(true)
			end
		end
	end,
	Play117041119 = function(arg_485_0, arg_485_1)
		arg_485_1.time_ = 0
		arg_485_1.frameCnt_ = 0
		arg_485_1.state_ = "playing"
		arg_485_1.curTalkId_ = 117041119
		arg_485_1.duration_ = 1

		local var_485_0 = {
			zh = 0.999999999999,
			ja = 1
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
				arg_485_0:Play117041120(arg_485_1)
			end
		end

		function arg_485_1.onSingleLineUpdate_(arg_488_0)
			local var_488_0 = 0
			local var_488_1 = 0.125

			if var_488_0 < arg_485_1.time_ and arg_485_1.time_ <= var_488_0 + arg_488_0 then
				arg_485_1.talkMaxDuration = 0
				arg_485_1.dialogCg_.alpha = 1

				arg_485_1.dialog_:SetActive(true)
				SetActive(arg_485_1.leftNameGo_, true)

				local var_488_2 = arg_485_1:FormatText(StoryNameCfg[61].name)

				arg_485_1.leftNameTxt_.text = var_488_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_485_1.leftNameTxt_.transform)

				arg_485_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_485_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_485_1:RecordName(arg_485_1.leftNameTxt_.text)
				SetActive(arg_485_1.iconTrs_.gameObject, false)
				arg_485_1.callingController_:SetSelectedState("normal")

				local var_488_3 = arg_485_1:GetWordFromCfg(117041119)
				local var_488_4 = arg_485_1:FormatText(var_488_3.content)

				arg_485_1.text_.text = var_488_4

				LuaForUtil.ClearLinePrefixSymbol(arg_485_1.text_)

				local var_488_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041119", "story_v_out_117041.awb") ~= 0 then
					local var_488_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041119", "story_v_out_117041.awb") / 1000

					if var_488_8 + var_488_0 > arg_485_1.duration_ then
						arg_485_1.duration_ = var_488_8 + var_488_0
					end

					if var_488_3.prefab_name ~= "" and arg_485_1.actors_[var_488_3.prefab_name] ~= nil then
						local var_488_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_485_1.actors_[var_488_3.prefab_name].transform, "story_v_out_117041", "117041119", "story_v_out_117041.awb")

						arg_485_1:RecordAudio("117041119", var_488_9)
						arg_485_1:RecordAudio("117041119", var_488_9)
					else
						arg_485_1:AudioAction("play", "voice", "story_v_out_117041", "117041119", "story_v_out_117041.awb")
					end

					arg_485_1:RecordHistoryTalkVoice("story_v_out_117041", "117041119", "story_v_out_117041.awb")
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
	Play117041120 = function(arg_489_0, arg_489_1)
		arg_489_1.time_ = 0
		arg_489_1.frameCnt_ = 0
		arg_489_1.state_ = "playing"
		arg_489_1.curTalkId_ = 117041120
		arg_489_1.duration_ = 6.133

		local var_489_0 = {
			zh = 3,
			ja = 6.133
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
				arg_489_0:Play117041121(arg_489_1)
			end
		end

		function arg_489_1.onSingleLineUpdate_(arg_492_0)
			local var_492_0 = 0
			local var_492_1 = 0.275

			if var_492_0 < arg_489_1.time_ and arg_489_1.time_ <= var_492_0 + arg_492_0 then
				arg_489_1.talkMaxDuration = 0
				arg_489_1.dialogCg_.alpha = 1

				arg_489_1.dialog_:SetActive(true)
				SetActive(arg_489_1.leftNameGo_, true)

				local var_492_2 = arg_489_1:FormatText(StoryNameCfg[367].name)

				arg_489_1.leftNameTxt_.text = var_492_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_489_1.leftNameTxt_.transform)

				arg_489_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_489_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_489_1:RecordName(arg_489_1.leftNameTxt_.text)
				SetActive(arg_489_1.iconTrs_.gameObject, true)
				arg_489_1.iconController_:SetSelectedState("hero")

				arg_489_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10034_split_2")

				arg_489_1.callingController_:SetSelectedState("normal")

				local var_492_3 = arg_489_1:GetWordFromCfg(117041120)
				local var_492_4 = arg_489_1:FormatText(var_492_3.content)

				arg_489_1.text_.text = var_492_4

				LuaForUtil.ClearLinePrefixSymbol(arg_489_1.text_)

				local var_492_5 = 11
				local var_492_6 = utf8.len(var_492_4)
				local var_492_7 = var_492_5 <= 0 and var_492_1 or var_492_1 * (var_492_6 / var_492_5)

				if var_492_7 > 0 and var_492_1 < var_492_7 then
					arg_489_1.talkMaxDuration = var_492_7

					if var_492_7 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_7 + var_492_0
					end
				end

				arg_489_1.text_.text = var_492_4
				arg_489_1.typewritter.percent = 0

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041120", "story_v_out_117041.awb") ~= 0 then
					local var_492_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041120", "story_v_out_117041.awb") / 1000

					if var_492_8 + var_492_0 > arg_489_1.duration_ then
						arg_489_1.duration_ = var_492_8 + var_492_0
					end

					if var_492_3.prefab_name ~= "" and arg_489_1.actors_[var_492_3.prefab_name] ~= nil then
						local var_492_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_489_1.actors_[var_492_3.prefab_name].transform, "story_v_out_117041", "117041120", "story_v_out_117041.awb")

						arg_489_1:RecordAudio("117041120", var_492_9)
						arg_489_1:RecordAudio("117041120", var_492_9)
					else
						arg_489_1:AudioAction("play", "voice", "story_v_out_117041", "117041120", "story_v_out_117041.awb")
					end

					arg_489_1:RecordHistoryTalkVoice("story_v_out_117041", "117041120", "story_v_out_117041.awb")
				end

				arg_489_1:RecordContent(arg_489_1.text_.text)
			end

			local var_492_10 = math.max(var_492_1, arg_489_1.talkMaxDuration)

			if var_492_0 <= arg_489_1.time_ and arg_489_1.time_ < var_492_0 + var_492_10 then
				arg_489_1.typewritter.percent = (arg_489_1.time_ - var_492_0) / var_492_10

				arg_489_1.typewritter:SetDirty()
			end

			if arg_489_1.time_ >= var_492_0 + var_492_10 and arg_489_1.time_ < var_492_0 + var_492_10 + arg_492_0 then
				arg_489_1.typewritter.percent = 1

				arg_489_1.typewritter:SetDirty()
				arg_489_1:ShowNextGo(true)
			end
		end
	end,
	Play117041121 = function(arg_493_0, arg_493_1)
		arg_493_1.time_ = 0
		arg_493_1.frameCnt_ = 0
		arg_493_1.state_ = "playing"
		arg_493_1.curTalkId_ = 117041121
		arg_493_1.duration_ = 1.666

		local var_493_0 = {
			zh = 1.166,
			ja = 1.666
		}
		local var_493_1 = manager.audio:GetLocalizationFlag()

		if var_493_0[var_493_1] ~= nil then
			arg_493_1.duration_ = var_493_0[var_493_1]
		end

		SetActive(arg_493_1.tipsGo_, false)

		function arg_493_1.onSingleLineFinish_()
			arg_493_1.onSingleLineUpdate_ = nil
			arg_493_1.onSingleLineFinish_ = nil
			arg_493_1.state_ = "waiting"
		end

		function arg_493_1.playNext_(arg_495_0)
			if arg_495_0 == 1 then
				arg_493_0:Play117041122(arg_493_1)
			end
		end

		function arg_493_1.onSingleLineUpdate_(arg_496_0)
			local var_496_0 = 0
			local var_496_1 = 0.1

			if var_496_0 < arg_493_1.time_ and arg_493_1.time_ <= var_496_0 + arg_496_0 then
				arg_493_1.talkMaxDuration = 0
				arg_493_1.dialogCg_.alpha = 1

				arg_493_1.dialog_:SetActive(true)
				SetActive(arg_493_1.leftNameGo_, true)

				local var_496_2 = arg_493_1:FormatText(StoryNameCfg[61].name)

				arg_493_1.leftNameTxt_.text = var_496_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_493_1.leftNameTxt_.transform)

				arg_493_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_493_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_493_1:RecordName(arg_493_1.leftNameTxt_.text)
				SetActive(arg_493_1.iconTrs_.gameObject, false)
				arg_493_1.callingController_:SetSelectedState("normal")

				local var_496_3 = arg_493_1:GetWordFromCfg(117041121)
				local var_496_4 = arg_493_1:FormatText(var_496_3.content)

				arg_493_1.text_.text = var_496_4

				LuaForUtil.ClearLinePrefixSymbol(arg_493_1.text_)

				local var_496_5 = 4
				local var_496_6 = utf8.len(var_496_4)
				local var_496_7 = var_496_5 <= 0 and var_496_1 or var_496_1 * (var_496_6 / var_496_5)

				if var_496_7 > 0 and var_496_1 < var_496_7 then
					arg_493_1.talkMaxDuration = var_496_7

					if var_496_7 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_7 + var_496_0
					end
				end

				arg_493_1.text_.text = var_496_4
				arg_493_1.typewritter.percent = 0

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041121", "story_v_out_117041.awb") ~= 0 then
					local var_496_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041121", "story_v_out_117041.awb") / 1000

					if var_496_8 + var_496_0 > arg_493_1.duration_ then
						arg_493_1.duration_ = var_496_8 + var_496_0
					end

					if var_496_3.prefab_name ~= "" and arg_493_1.actors_[var_496_3.prefab_name] ~= nil then
						local var_496_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_493_1.actors_[var_496_3.prefab_name].transform, "story_v_out_117041", "117041121", "story_v_out_117041.awb")

						arg_493_1:RecordAudio("117041121", var_496_9)
						arg_493_1:RecordAudio("117041121", var_496_9)
					else
						arg_493_1:AudioAction("play", "voice", "story_v_out_117041", "117041121", "story_v_out_117041.awb")
					end

					arg_493_1:RecordHistoryTalkVoice("story_v_out_117041", "117041121", "story_v_out_117041.awb")
				end

				arg_493_1:RecordContent(arg_493_1.text_.text)
			end

			local var_496_10 = math.max(var_496_1, arg_493_1.talkMaxDuration)

			if var_496_0 <= arg_493_1.time_ and arg_493_1.time_ < var_496_0 + var_496_10 then
				arg_493_1.typewritter.percent = (arg_493_1.time_ - var_496_0) / var_496_10

				arg_493_1.typewritter:SetDirty()
			end

			if arg_493_1.time_ >= var_496_0 + var_496_10 and arg_493_1.time_ < var_496_0 + var_496_10 + arg_496_0 then
				arg_493_1.typewritter.percent = 1

				arg_493_1.typewritter:SetDirty()
				arg_493_1:ShowNextGo(true)
			end
		end
	end,
	Play117041122 = function(arg_497_0, arg_497_1)
		arg_497_1.time_ = 0
		arg_497_1.frameCnt_ = 0
		arg_497_1.state_ = "playing"
		arg_497_1.curTalkId_ = 117041122
		arg_497_1.duration_ = 5

		SetActive(arg_497_1.tipsGo_, false)

		function arg_497_1.onSingleLineFinish_()
			arg_497_1.onSingleLineUpdate_ = nil
			arg_497_1.onSingleLineFinish_ = nil
			arg_497_1.state_ = "waiting"
		end

		function arg_497_1.playNext_(arg_499_0)
			if arg_499_0 == 1 then
				arg_497_0:Play117041123(arg_497_1)
			end
		end

		function arg_497_1.onSingleLineUpdate_(arg_500_0)
			local var_500_0 = 0
			local var_500_1 = 0.55

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

				local var_500_2 = arg_497_1:GetWordFromCfg(117041122)
				local var_500_3 = arg_497_1:FormatText(var_500_2.content)

				arg_497_1.text_.text = var_500_3

				LuaForUtil.ClearLinePrefixSymbol(arg_497_1.text_)

				local var_500_4 = 22
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
	Play117041123 = function(arg_501_0, arg_501_1)
		arg_501_1.time_ = 0
		arg_501_1.frameCnt_ = 0
		arg_501_1.state_ = "playing"
		arg_501_1.curTalkId_ = 117041123
		arg_501_1.duration_ = 9

		SetActive(arg_501_1.tipsGo_, false)

		function arg_501_1.onSingleLineFinish_()
			arg_501_1.onSingleLineUpdate_ = nil
			arg_501_1.onSingleLineFinish_ = nil
			arg_501_1.state_ = "waiting"
		end

		function arg_501_1.playNext_(arg_503_0)
			if arg_503_0 == 1 then
				arg_501_0:Play117041124(arg_501_1)
			end
		end

		function arg_501_1.onSingleLineUpdate_(arg_504_0)
			local var_504_0 = 2

			if var_504_0 < arg_501_1.time_ and arg_501_1.time_ <= var_504_0 + arg_504_0 then
				local var_504_1 = manager.ui.mainCamera.transform.localPosition
				local var_504_2 = Vector3.New(0, 0, 10) + Vector3.New(var_504_1.x, var_504_1.y, 0)
				local var_504_3 = arg_501_1.bgs_.ST24a

				var_504_3.transform.localPosition = var_504_2
				var_504_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_504_4 = var_504_3:GetComponent("SpriteRenderer")

				if var_504_4 and var_504_4.sprite then
					local var_504_5 = (var_504_3.transform.localPosition - var_504_1).z
					local var_504_6 = manager.ui.mainCameraCom_
					local var_504_7 = 2 * var_504_5 * Mathf.Tan(var_504_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_504_8 = var_504_7 * var_504_6.aspect
					local var_504_9 = var_504_4.sprite.bounds.size.x
					local var_504_10 = var_504_4.sprite.bounds.size.y
					local var_504_11 = var_504_8 / var_504_9
					local var_504_12 = var_504_7 / var_504_10
					local var_504_13 = var_504_12 < var_504_11 and var_504_11 or var_504_12

					var_504_3.transform.localScale = Vector3.New(var_504_13, var_504_13, 0)
				end

				for iter_504_0, iter_504_1 in pairs(arg_501_1.bgs_) do
					if iter_504_0 ~= "ST24a" then
						iter_504_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_504_14 = 0

			if var_504_14 < arg_501_1.time_ and arg_501_1.time_ <= var_504_14 + arg_504_0 then
				arg_501_1.mask_.enabled = true
				arg_501_1.mask_.raycastTarget = false

				arg_501_1:SetGaussion(false)
			end

			local var_504_15 = 2

			if var_504_14 <= arg_501_1.time_ and arg_501_1.time_ < var_504_14 + var_504_15 then
				local var_504_16 = (arg_501_1.time_ - var_504_14) / var_504_15
				local var_504_17 = Color.New(0, 0, 0)

				var_504_17.a = Mathf.Lerp(0, 1, var_504_16)
				arg_501_1.mask_.color = var_504_17
			end

			if arg_501_1.time_ >= var_504_14 + var_504_15 and arg_501_1.time_ < var_504_14 + var_504_15 + arg_504_0 then
				local var_504_18 = Color.New(0, 0, 0)

				var_504_18.a = 1
				arg_501_1.mask_.color = var_504_18
			end

			local var_504_19 = 2

			if var_504_19 < arg_501_1.time_ and arg_501_1.time_ <= var_504_19 + arg_504_0 then
				arg_501_1.mask_.enabled = true
				arg_501_1.mask_.raycastTarget = false

				arg_501_1:SetGaussion(false)
			end

			local var_504_20 = 2

			if var_504_19 <= arg_501_1.time_ and arg_501_1.time_ < var_504_19 + var_504_20 then
				local var_504_21 = (arg_501_1.time_ - var_504_19) / var_504_20
				local var_504_22 = Color.New(0, 0, 0)

				var_504_22.a = Mathf.Lerp(1, 0, var_504_21)
				arg_501_1.mask_.color = var_504_22
			end

			if arg_501_1.time_ >= var_504_19 + var_504_20 and arg_501_1.time_ < var_504_19 + var_504_20 + arg_504_0 then
				local var_504_23 = Color.New(0, 0, 0)
				local var_504_24 = 0

				arg_501_1.mask_.enabled = false
				var_504_23.a = var_504_24
				arg_501_1.mask_.color = var_504_23
			end

			local var_504_25 = 4
			local var_504_26 = 1

			if var_504_25 < arg_501_1.time_ and arg_501_1.time_ <= var_504_25 + arg_504_0 then
				local var_504_27 = "play"
				local var_504_28 = "effect"

				arg_501_1:AudioAction(var_504_27, var_504_28, "se_story_17", "se_story_17_ringing", "")
			end

			if arg_501_1.frameCnt_ <= 1 then
				arg_501_1.dialog_:SetActive(false)
			end

			local var_504_29 = 4
			local var_504_30 = 1.425

			if var_504_29 < arg_501_1.time_ and arg_501_1.time_ <= var_504_29 + arg_504_0 then
				arg_501_1.talkMaxDuration = 0

				arg_501_1.dialog_:SetActive(true)

				local var_504_31 = LeanTween.value(arg_501_1.dialog_, 0, 1, 0.3)

				var_504_31:setOnUpdate(LuaHelper.FloatAction(function(arg_505_0)
					arg_501_1.dialogCg_.alpha = arg_505_0
				end))
				var_504_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_501_1.dialog_)
					var_504_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_501_1.duration_ = arg_501_1.duration_ + 0.3

				SetActive(arg_501_1.leftNameGo_, false)

				arg_501_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_501_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_501_1:RecordName(arg_501_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_501_1.iconTrs_.gameObject, false)
				arg_501_1.callingController_:SetSelectedState("normal")

				local var_504_32 = arg_501_1:GetWordFromCfg(117041123)
				local var_504_33 = arg_501_1:FormatText(var_504_32.content)

				arg_501_1.text_.text = var_504_33

				LuaForUtil.ClearLinePrefixSymbol(arg_501_1.text_)

				local var_504_34 = 57
				local var_504_35 = utf8.len(var_504_33)
				local var_504_36 = var_504_34 <= 0 and var_504_30 or var_504_30 * (var_504_35 / var_504_34)

				if var_504_36 > 0 and var_504_30 < var_504_36 then
					arg_501_1.talkMaxDuration = var_504_36
					var_504_29 = var_504_29 + 0.3

					if var_504_36 + var_504_29 > arg_501_1.duration_ then
						arg_501_1.duration_ = var_504_36 + var_504_29
					end
				end

				arg_501_1.text_.text = var_504_33
				arg_501_1.typewritter.percent = 0

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(false)
				arg_501_1:RecordContent(arg_501_1.text_.text)
			end

			local var_504_37 = var_504_29 + 0.3
			local var_504_38 = math.max(var_504_30, arg_501_1.talkMaxDuration)

			if var_504_37 <= arg_501_1.time_ and arg_501_1.time_ < var_504_37 + var_504_38 then
				arg_501_1.typewritter.percent = (arg_501_1.time_ - var_504_37) / var_504_38

				arg_501_1.typewritter:SetDirty()
			end

			if arg_501_1.time_ >= var_504_37 + var_504_38 and arg_501_1.time_ < var_504_37 + var_504_38 + arg_504_0 then
				arg_501_1.typewritter.percent = 1

				arg_501_1.typewritter:SetDirty()
				arg_501_1:ShowNextGo(true)
			end
		end
	end,
	Play117041124 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 117041124
		arg_507_1.duration_ = 5.2

		local var_507_0 = {
			zh = 5.2,
			ja = 2
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
				arg_507_0:Play117041125(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = arg_507_1.actors_["1132"].transform
			local var_510_1 = 0

			if var_510_1 < arg_507_1.time_ and arg_507_1.time_ <= var_510_1 + arg_510_0 then
				arg_507_1.var_.moveOldPos1132 = var_510_0.localPosition
				var_510_0.localScale = Vector3.New(1, 1, 1)

				arg_507_1:CheckSpriteTmpPos("1132", 2)

				local var_510_2 = var_510_0.childCount

				for iter_510_0 = 0, var_510_2 - 1 do
					local var_510_3 = var_510_0:GetChild(iter_510_0)

					if var_510_3.name == "split_6" or not string.find(var_510_3.name, "split") then
						var_510_3.gameObject:SetActive(true)
					else
						var_510_3.gameObject:SetActive(false)
					end
				end
			end

			local var_510_4 = 0.001

			if var_510_1 <= arg_507_1.time_ and arg_507_1.time_ < var_510_1 + var_510_4 then
				local var_510_5 = (arg_507_1.time_ - var_510_1) / var_510_4
				local var_510_6 = Vector3.New(-390, -413, -185)

				var_510_0.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos1132, var_510_6, var_510_5)
			end

			if arg_507_1.time_ >= var_510_1 + var_510_4 and arg_507_1.time_ < var_510_1 + var_510_4 + arg_510_0 then
				var_510_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_510_7 = arg_507_1.actors_["10034"].transform
			local var_510_8 = 0

			if var_510_8 < arg_507_1.time_ and arg_507_1.time_ <= var_510_8 + arg_510_0 then
				arg_507_1.var_.moveOldPos10034 = var_510_7.localPosition
				var_510_7.localScale = Vector3.New(1, 1, 1)

				arg_507_1:CheckSpriteTmpPos("10034", 4)

				local var_510_9 = var_510_7.childCount

				for iter_510_1 = 0, var_510_9 - 1 do
					local var_510_10 = var_510_7:GetChild(iter_510_1)

					if var_510_10.name == "split_2" or not string.find(var_510_10.name, "split") then
						var_510_10.gameObject:SetActive(true)
					else
						var_510_10.gameObject:SetActive(false)
					end
				end
			end

			local var_510_11 = 0.001

			if var_510_8 <= arg_507_1.time_ and arg_507_1.time_ < var_510_8 + var_510_11 then
				local var_510_12 = (arg_507_1.time_ - var_510_8) / var_510_11
				local var_510_13 = Vector3.New(390, -415, -290)

				var_510_7.localPosition = Vector3.Lerp(arg_507_1.var_.moveOldPos10034, var_510_13, var_510_12)
			end

			if arg_507_1.time_ >= var_510_8 + var_510_11 and arg_507_1.time_ < var_510_8 + var_510_11 + arg_510_0 then
				var_510_7.localPosition = Vector3.New(390, -415, -290)
			end

			local var_510_14 = arg_507_1.actors_["1132"]
			local var_510_15 = 0

			if var_510_15 < arg_507_1.time_ and arg_507_1.time_ <= var_510_15 + arg_510_0 and arg_507_1.var_.actorSpriteComps1132 == nil then
				arg_507_1.var_.actorSpriteComps1132 = var_510_14:GetComponentsInChildren(typeof(Image), true)
			end

			local var_510_16 = 0.2

			if var_510_15 <= arg_507_1.time_ and arg_507_1.time_ < var_510_15 + var_510_16 then
				local var_510_17 = (arg_507_1.time_ - var_510_15) / var_510_16

				if arg_507_1.var_.actorSpriteComps1132 then
					for iter_510_2, iter_510_3 in pairs(arg_507_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_510_3 then
							local var_510_18 = Mathf.Lerp(iter_510_3.color.r, 1, var_510_17)

							iter_510_3.color = Color.New(var_510_18, var_510_18, var_510_18)
						end
					end
				end
			end

			if arg_507_1.time_ >= var_510_15 + var_510_16 and arg_507_1.time_ < var_510_15 + var_510_16 + arg_510_0 and arg_507_1.var_.actorSpriteComps1132 then
				local var_510_19 = 1

				for iter_510_4, iter_510_5 in pairs(arg_507_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_510_5 then
						iter_510_5.color = Color.New(var_510_19, var_510_19, var_510_19)
					end
				end

				arg_507_1.var_.actorSpriteComps1132 = nil
			end

			local var_510_20 = arg_507_1.actors_["10034"]
			local var_510_21 = 0

			if var_510_21 < arg_507_1.time_ and arg_507_1.time_ <= var_510_21 + arg_510_0 and arg_507_1.var_.actorSpriteComps10034 == nil then
				arg_507_1.var_.actorSpriteComps10034 = var_510_20:GetComponentsInChildren(typeof(Image), true)
			end

			local var_510_22 = 0.034

			if var_510_21 <= arg_507_1.time_ and arg_507_1.time_ < var_510_21 + var_510_22 then
				local var_510_23 = (arg_507_1.time_ - var_510_21) / var_510_22

				if arg_507_1.var_.actorSpriteComps10034 then
					for iter_510_6, iter_510_7 in pairs(arg_507_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_510_7 then
							local var_510_24 = Mathf.Lerp(iter_510_7.color.r, 0.5, var_510_23)

							iter_510_7.color = Color.New(var_510_24, var_510_24, var_510_24)
						end
					end
				end
			end

			if arg_507_1.time_ >= var_510_21 + var_510_22 and arg_507_1.time_ < var_510_21 + var_510_22 + arg_510_0 and arg_507_1.var_.actorSpriteComps10034 then
				local var_510_25 = 0.5

				for iter_510_8, iter_510_9 in pairs(arg_507_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_510_9 then
						iter_510_9.color = Color.New(var_510_25, var_510_25, var_510_25)
					end
				end

				arg_507_1.var_.actorSpriteComps10034 = nil
			end

			local var_510_26 = 0
			local var_510_27 = 0.225

			if var_510_26 < arg_507_1.time_ and arg_507_1.time_ <= var_510_26 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_28 = arg_507_1:FormatText(StoryNameCfg[61].name)

				arg_507_1.leftNameTxt_.text = var_510_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_29 = arg_507_1:GetWordFromCfg(117041124)
				local var_510_30 = arg_507_1:FormatText(var_510_29.content)

				arg_507_1.text_.text = var_510_30

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_31 = 9
				local var_510_32 = utf8.len(var_510_30)
				local var_510_33 = var_510_31 <= 0 and var_510_27 or var_510_27 * (var_510_32 / var_510_31)

				if var_510_33 > 0 and var_510_27 < var_510_33 then
					arg_507_1.talkMaxDuration = var_510_33

					if var_510_33 + var_510_26 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_33 + var_510_26
					end
				end

				arg_507_1.text_.text = var_510_30
				arg_507_1.typewritter.percent = 0

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041124", "story_v_out_117041.awb") ~= 0 then
					local var_510_34 = manager.audio:GetVoiceLength("story_v_out_117041", "117041124", "story_v_out_117041.awb") / 1000

					if var_510_34 + var_510_26 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_34 + var_510_26
					end

					if var_510_29.prefab_name ~= "" and arg_507_1.actors_[var_510_29.prefab_name] ~= nil then
						local var_510_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_29.prefab_name].transform, "story_v_out_117041", "117041124", "story_v_out_117041.awb")

						arg_507_1:RecordAudio("117041124", var_510_35)
						arg_507_1:RecordAudio("117041124", var_510_35)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_117041", "117041124", "story_v_out_117041.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_117041", "117041124", "story_v_out_117041.awb")
				end

				arg_507_1:RecordContent(arg_507_1.text_.text)
			end

			local var_510_36 = math.max(var_510_27, arg_507_1.talkMaxDuration)

			if var_510_26 <= arg_507_1.time_ and arg_507_1.time_ < var_510_26 + var_510_36 then
				arg_507_1.typewritter.percent = (arg_507_1.time_ - var_510_26) / var_510_36

				arg_507_1.typewritter:SetDirty()
			end

			if arg_507_1.time_ >= var_510_26 + var_510_36 and arg_507_1.time_ < var_510_26 + var_510_36 + arg_510_0 then
				arg_507_1.typewritter.percent = 1

				arg_507_1.typewritter:SetDirty()
				arg_507_1:ShowNextGo(true)
			end
		end
	end,
	Play117041125 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 117041125
		arg_511_1.duration_ = 3.333

		local var_511_0 = {
			zh = 2.133,
			ja = 3.333
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
				arg_511_0:Play117041126(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = arg_511_1.actors_["1132"]
			local var_514_1 = 0

			if var_514_1 < arg_511_1.time_ and arg_511_1.time_ <= var_514_1 + arg_514_0 and arg_511_1.var_.actorSpriteComps1132 == nil then
				arg_511_1.var_.actorSpriteComps1132 = var_514_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_514_2 = 0.2

			if var_514_1 <= arg_511_1.time_ and arg_511_1.time_ < var_514_1 + var_514_2 then
				local var_514_3 = (arg_511_1.time_ - var_514_1) / var_514_2

				if arg_511_1.var_.actorSpriteComps1132 then
					for iter_514_0, iter_514_1 in pairs(arg_511_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_514_1 then
							local var_514_4 = Mathf.Lerp(iter_514_1.color.r, 0.5, var_514_3)

							iter_514_1.color = Color.New(var_514_4, var_514_4, var_514_4)
						end
					end
				end
			end

			if arg_511_1.time_ >= var_514_1 + var_514_2 and arg_511_1.time_ < var_514_1 + var_514_2 + arg_514_0 and arg_511_1.var_.actorSpriteComps1132 then
				local var_514_5 = 0.5

				for iter_514_2, iter_514_3 in pairs(arg_511_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_514_3 then
						iter_514_3.color = Color.New(var_514_5, var_514_5, var_514_5)
					end
				end

				arg_511_1.var_.actorSpriteComps1132 = nil
			end

			local var_514_6 = arg_511_1.actors_["10034"]
			local var_514_7 = 0

			if var_514_7 < arg_511_1.time_ and arg_511_1.time_ <= var_514_7 + arg_514_0 and arg_511_1.var_.actorSpriteComps10034 == nil then
				arg_511_1.var_.actorSpriteComps10034 = var_514_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_514_8 = 0.2

			if var_514_7 <= arg_511_1.time_ and arg_511_1.time_ < var_514_7 + var_514_8 then
				local var_514_9 = (arg_511_1.time_ - var_514_7) / var_514_8

				if arg_511_1.var_.actorSpriteComps10034 then
					for iter_514_4, iter_514_5 in pairs(arg_511_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_514_5 then
							local var_514_10 = Mathf.Lerp(iter_514_5.color.r, 1, var_514_9)

							iter_514_5.color = Color.New(var_514_10, var_514_10, var_514_10)
						end
					end
				end
			end

			if arg_511_1.time_ >= var_514_7 + var_514_8 and arg_511_1.time_ < var_514_7 + var_514_8 + arg_514_0 and arg_511_1.var_.actorSpriteComps10034 then
				local var_514_11 = 1

				for iter_514_6, iter_514_7 in pairs(arg_511_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_514_7 then
						iter_514_7.color = Color.New(var_514_11, var_514_11, var_514_11)
					end
				end

				arg_511_1.var_.actorSpriteComps10034 = nil
			end

			local var_514_12 = 0
			local var_514_13 = 0.2

			if var_514_12 < arg_511_1.time_ and arg_511_1.time_ <= var_514_12 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_14 = arg_511_1:FormatText(StoryNameCfg[367].name)

				arg_511_1.leftNameTxt_.text = var_514_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_15 = arg_511_1:GetWordFromCfg(117041125)
				local var_514_16 = arg_511_1:FormatText(var_514_15.content)

				arg_511_1.text_.text = var_514_16

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_17 = 8
				local var_514_18 = utf8.len(var_514_16)
				local var_514_19 = var_514_17 <= 0 and var_514_13 or var_514_13 * (var_514_18 / var_514_17)

				if var_514_19 > 0 and var_514_13 < var_514_19 then
					arg_511_1.talkMaxDuration = var_514_19

					if var_514_19 + var_514_12 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_19 + var_514_12
					end
				end

				arg_511_1.text_.text = var_514_16
				arg_511_1.typewritter.percent = 0

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041125", "story_v_out_117041.awb") ~= 0 then
					local var_514_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041125", "story_v_out_117041.awb") / 1000

					if var_514_20 + var_514_12 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_20 + var_514_12
					end

					if var_514_15.prefab_name ~= "" and arg_511_1.actors_[var_514_15.prefab_name] ~= nil then
						local var_514_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_15.prefab_name].transform, "story_v_out_117041", "117041125", "story_v_out_117041.awb")

						arg_511_1:RecordAudio("117041125", var_514_21)
						arg_511_1:RecordAudio("117041125", var_514_21)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_117041", "117041125", "story_v_out_117041.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_117041", "117041125", "story_v_out_117041.awb")
				end

				arg_511_1:RecordContent(arg_511_1.text_.text)
			end

			local var_514_22 = math.max(var_514_13, arg_511_1.talkMaxDuration)

			if var_514_12 <= arg_511_1.time_ and arg_511_1.time_ < var_514_12 + var_514_22 then
				arg_511_1.typewritter.percent = (arg_511_1.time_ - var_514_12) / var_514_22

				arg_511_1.typewritter:SetDirty()
			end

			if arg_511_1.time_ >= var_514_12 + var_514_22 and arg_511_1.time_ < var_514_12 + var_514_22 + arg_514_0 then
				arg_511_1.typewritter.percent = 1

				arg_511_1.typewritter:SetDirty()
				arg_511_1:ShowNextGo(true)
			end
		end
	end,
	Play117041126 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 117041126
		arg_515_1.duration_ = 10.4

		local var_515_0 = {
			zh = 10.4,
			ja = 9
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
				arg_515_0:Play117041127(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1132"]
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 and arg_515_1.var_.actorSpriteComps1132 == nil then
				arg_515_1.var_.actorSpriteComps1132 = var_518_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_2 = 0.2

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2

				if arg_515_1.var_.actorSpriteComps1132 then
					for iter_518_0, iter_518_1 in pairs(arg_515_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_518_1 then
							local var_518_4 = Mathf.Lerp(iter_518_1.color.r, 1, var_518_3)

							iter_518_1.color = Color.New(var_518_4, var_518_4, var_518_4)
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 and arg_515_1.var_.actorSpriteComps1132 then
				local var_518_5 = 1

				for iter_518_2, iter_518_3 in pairs(arg_515_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_518_3 then
						iter_518_3.color = Color.New(var_518_5, var_518_5, var_518_5)
					end
				end

				arg_515_1.var_.actorSpriteComps1132 = nil
			end

			local var_518_6 = arg_515_1.actors_["10034"]
			local var_518_7 = 0

			if var_518_7 < arg_515_1.time_ and arg_515_1.time_ <= var_518_7 + arg_518_0 and arg_515_1.var_.actorSpriteComps10034 == nil then
				arg_515_1.var_.actorSpriteComps10034 = var_518_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_518_8 = 0.2

			if var_518_7 <= arg_515_1.time_ and arg_515_1.time_ < var_518_7 + var_518_8 then
				local var_518_9 = (arg_515_1.time_ - var_518_7) / var_518_8

				if arg_515_1.var_.actorSpriteComps10034 then
					for iter_518_4, iter_518_5 in pairs(arg_515_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_518_5 then
							local var_518_10 = Mathf.Lerp(iter_518_5.color.r, 0.5, var_518_9)

							iter_518_5.color = Color.New(var_518_10, var_518_10, var_518_10)
						end
					end
				end
			end

			if arg_515_1.time_ >= var_518_7 + var_518_8 and arg_515_1.time_ < var_518_7 + var_518_8 + arg_518_0 and arg_515_1.var_.actorSpriteComps10034 then
				local var_518_11 = 0.5

				for iter_518_6, iter_518_7 in pairs(arg_515_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_518_7 then
						iter_518_7.color = Color.New(var_518_11, var_518_11, var_518_11)
					end
				end

				arg_515_1.var_.actorSpriteComps10034 = nil
			end

			local var_518_12 = 0
			local var_518_13 = 1.025

			if var_518_12 < arg_515_1.time_ and arg_515_1.time_ <= var_518_12 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_14 = arg_515_1:FormatText(StoryNameCfg[61].name)

				arg_515_1.leftNameTxt_.text = var_518_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_15 = arg_515_1:GetWordFromCfg(117041126)
				local var_518_16 = arg_515_1:FormatText(var_518_15.content)

				arg_515_1.text_.text = var_518_16

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_17 = 41
				local var_518_18 = utf8.len(var_518_16)
				local var_518_19 = var_518_17 <= 0 and var_518_13 or var_518_13 * (var_518_18 / var_518_17)

				if var_518_19 > 0 and var_518_13 < var_518_19 then
					arg_515_1.talkMaxDuration = var_518_19

					if var_518_19 + var_518_12 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_19 + var_518_12
					end
				end

				arg_515_1.text_.text = var_518_16
				arg_515_1.typewritter.percent = 0

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041126", "story_v_out_117041.awb") ~= 0 then
					local var_518_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041126", "story_v_out_117041.awb") / 1000

					if var_518_20 + var_518_12 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_20 + var_518_12
					end

					if var_518_15.prefab_name ~= "" and arg_515_1.actors_[var_518_15.prefab_name] ~= nil then
						local var_518_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_15.prefab_name].transform, "story_v_out_117041", "117041126", "story_v_out_117041.awb")

						arg_515_1:RecordAudio("117041126", var_518_21)
						arg_515_1:RecordAudio("117041126", var_518_21)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_117041", "117041126", "story_v_out_117041.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_117041", "117041126", "story_v_out_117041.awb")
				end

				arg_515_1:RecordContent(arg_515_1.text_.text)
			end

			local var_518_22 = math.max(var_518_13, arg_515_1.talkMaxDuration)

			if var_518_12 <= arg_515_1.time_ and arg_515_1.time_ < var_518_12 + var_518_22 then
				arg_515_1.typewritter.percent = (arg_515_1.time_ - var_518_12) / var_518_22

				arg_515_1.typewritter:SetDirty()
			end

			if arg_515_1.time_ >= var_518_12 + var_518_22 and arg_515_1.time_ < var_518_12 + var_518_22 + arg_518_0 then
				arg_515_1.typewritter.percent = 1

				arg_515_1.typewritter:SetDirty()
				arg_515_1:ShowNextGo(true)
			end
		end
	end,
	Play117041127 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 117041127
		arg_519_1.duration_ = 10.866

		local var_519_0 = {
			zh = 10.8,
			ja = 10.866
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
				arg_519_0:Play117041128(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["10034"].transform
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 then
				arg_519_1.var_.moveOldPos10034 = var_522_0.localPosition
				var_522_0.localScale = Vector3.New(1, 1, 1)

				arg_519_1:CheckSpriteTmpPos("10034", 4)

				local var_522_2 = var_522_0.childCount

				for iter_522_0 = 0, var_522_2 - 1 do
					local var_522_3 = var_522_0:GetChild(iter_522_0)

					if var_522_3.name == "split_5" or not string.find(var_522_3.name, "split") then
						var_522_3.gameObject:SetActive(true)
					else
						var_522_3.gameObject:SetActive(false)
					end
				end
			end

			local var_522_4 = 0.001

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_4 then
				local var_522_5 = (arg_519_1.time_ - var_522_1) / var_522_4
				local var_522_6 = Vector3.New(390, -415, -290)

				var_522_0.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos10034, var_522_6, var_522_5)
			end

			if arg_519_1.time_ >= var_522_1 + var_522_4 and arg_519_1.time_ < var_522_1 + var_522_4 + arg_522_0 then
				var_522_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_522_7 = arg_519_1.actors_["1132"]
			local var_522_8 = 0

			if var_522_8 < arg_519_1.time_ and arg_519_1.time_ <= var_522_8 + arg_522_0 and arg_519_1.var_.actorSpriteComps1132 == nil then
				arg_519_1.var_.actorSpriteComps1132 = var_522_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_9 = 0.2

			if var_522_8 <= arg_519_1.time_ and arg_519_1.time_ < var_522_8 + var_522_9 then
				local var_522_10 = (arg_519_1.time_ - var_522_8) / var_522_9

				if arg_519_1.var_.actorSpriteComps1132 then
					for iter_522_1, iter_522_2 in pairs(arg_519_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_522_2 then
							local var_522_11 = Mathf.Lerp(iter_522_2.color.r, 0.5, var_522_10)

							iter_522_2.color = Color.New(var_522_11, var_522_11, var_522_11)
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_8 + var_522_9 and arg_519_1.time_ < var_522_8 + var_522_9 + arg_522_0 and arg_519_1.var_.actorSpriteComps1132 then
				local var_522_12 = 0.5

				for iter_522_3, iter_522_4 in pairs(arg_519_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_522_4 then
						iter_522_4.color = Color.New(var_522_12, var_522_12, var_522_12)
					end
				end

				arg_519_1.var_.actorSpriteComps1132 = nil
			end

			local var_522_13 = arg_519_1.actors_["10034"]
			local var_522_14 = 0

			if var_522_14 < arg_519_1.time_ and arg_519_1.time_ <= var_522_14 + arg_522_0 and arg_519_1.var_.actorSpriteComps10034 == nil then
				arg_519_1.var_.actorSpriteComps10034 = var_522_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_522_15 = 0.2

			if var_522_14 <= arg_519_1.time_ and arg_519_1.time_ < var_522_14 + var_522_15 then
				local var_522_16 = (arg_519_1.time_ - var_522_14) / var_522_15

				if arg_519_1.var_.actorSpriteComps10034 then
					for iter_522_5, iter_522_6 in pairs(arg_519_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_522_6 then
							local var_522_17 = Mathf.Lerp(iter_522_6.color.r, 1, var_522_16)

							iter_522_6.color = Color.New(var_522_17, var_522_17, var_522_17)
						end
					end
				end
			end

			if arg_519_1.time_ >= var_522_14 + var_522_15 and arg_519_1.time_ < var_522_14 + var_522_15 + arg_522_0 and arg_519_1.var_.actorSpriteComps10034 then
				local var_522_18 = 1

				for iter_522_7, iter_522_8 in pairs(arg_519_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_522_8 then
						iter_522_8.color = Color.New(var_522_18, var_522_18, var_522_18)
					end
				end

				arg_519_1.var_.actorSpriteComps10034 = nil
			end

			local var_522_19 = 0
			local var_522_20 = 1.025

			if var_522_19 < arg_519_1.time_ and arg_519_1.time_ <= var_522_19 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_21 = arg_519_1:FormatText(StoryNameCfg[367].name)

				arg_519_1.leftNameTxt_.text = var_522_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_22 = arg_519_1:GetWordFromCfg(117041127)
				local var_522_23 = arg_519_1:FormatText(var_522_22.content)

				arg_519_1.text_.text = var_522_23

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_24 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041127", "story_v_out_117041.awb") ~= 0 then
					local var_522_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041127", "story_v_out_117041.awb") / 1000

					if var_522_27 + var_522_19 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_27 + var_522_19
					end

					if var_522_22.prefab_name ~= "" and arg_519_1.actors_[var_522_22.prefab_name] ~= nil then
						local var_522_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_22.prefab_name].transform, "story_v_out_117041", "117041127", "story_v_out_117041.awb")

						arg_519_1:RecordAudio("117041127", var_522_28)
						arg_519_1:RecordAudio("117041127", var_522_28)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_117041", "117041127", "story_v_out_117041.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_117041", "117041127", "story_v_out_117041.awb")
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
	Play117041128 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 117041128
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play117041129(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["10034"].transform
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.var_.moveOldPos10034 = var_526_0.localPosition
				var_526_0.localScale = Vector3.New(1, 1, 1)

				arg_523_1:CheckSpriteTmpPos("10034", 4)

				local var_526_2 = var_526_0.childCount

				for iter_526_0 = 0, var_526_2 - 1 do
					local var_526_3 = var_526_0:GetChild(iter_526_0)

					if var_526_3.name == "split_2" or not string.find(var_526_3.name, "split") then
						var_526_3.gameObject:SetActive(true)
					else
						var_526_3.gameObject:SetActive(false)
					end
				end
			end

			local var_526_4 = 0.001

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_4 then
				local var_526_5 = (arg_523_1.time_ - var_526_1) / var_526_4
				local var_526_6 = Vector3.New(390, -415, -290)

				var_526_0.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos10034, var_526_6, var_526_5)
			end

			if arg_523_1.time_ >= var_526_1 + var_526_4 and arg_523_1.time_ < var_526_1 + var_526_4 + arg_526_0 then
				var_526_0.localPosition = Vector3.New(390, -415, -290)
			end

			local var_526_7 = arg_523_1.actors_["10034"]
			local var_526_8 = 0

			if var_526_8 < arg_523_1.time_ and arg_523_1.time_ <= var_526_8 + arg_526_0 and arg_523_1.var_.actorSpriteComps10034 == nil then
				arg_523_1.var_.actorSpriteComps10034 = var_526_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_526_9 = 0.2

			if var_526_8 <= arg_523_1.time_ and arg_523_1.time_ < var_526_8 + var_526_9 then
				local var_526_10 = (arg_523_1.time_ - var_526_8) / var_526_9

				if arg_523_1.var_.actorSpriteComps10034 then
					for iter_526_1, iter_526_2 in pairs(arg_523_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_526_2 then
							local var_526_11 = Mathf.Lerp(iter_526_2.color.r, 0.5, var_526_10)

							iter_526_2.color = Color.New(var_526_11, var_526_11, var_526_11)
						end
					end
				end
			end

			if arg_523_1.time_ >= var_526_8 + var_526_9 and arg_523_1.time_ < var_526_8 + var_526_9 + arg_526_0 and arg_523_1.var_.actorSpriteComps10034 then
				local var_526_12 = 0.5

				for iter_526_3, iter_526_4 in pairs(arg_523_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_526_4 then
						iter_526_4.color = Color.New(var_526_12, var_526_12, var_526_12)
					end
				end

				arg_523_1.var_.actorSpriteComps10034 = nil
			end

			local var_526_13 = 0
			local var_526_14 = 0.925

			if var_526_13 < arg_523_1.time_ and arg_523_1.time_ <= var_526_13 + arg_526_0 then
				arg_523_1.talkMaxDuration = 0
				arg_523_1.dialogCg_.alpha = 1

				arg_523_1.dialog_:SetActive(true)
				SetActive(arg_523_1.leftNameGo_, false)

				arg_523_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_523_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_523_1:RecordName(arg_523_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_523_1.iconTrs_.gameObject, false)
				arg_523_1.callingController_:SetSelectedState("normal")

				local var_526_15 = arg_523_1:GetWordFromCfg(117041128)
				local var_526_16 = arg_523_1:FormatText(var_526_15.content)

				arg_523_1.text_.text = var_526_16

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_17 = 37
				local var_526_18 = utf8.len(var_526_16)
				local var_526_19 = var_526_17 <= 0 and var_526_14 or var_526_14 * (var_526_18 / var_526_17)

				if var_526_19 > 0 and var_526_14 < var_526_19 then
					arg_523_1.talkMaxDuration = var_526_19

					if var_526_19 + var_526_13 > arg_523_1.duration_ then
						arg_523_1.duration_ = var_526_19 + var_526_13
					end
				end

				arg_523_1.text_.text = var_526_16
				arg_523_1.typewritter.percent = 0

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(false)
				arg_523_1:RecordContent(arg_523_1.text_.text)
			end

			local var_526_20 = math.max(var_526_14, arg_523_1.talkMaxDuration)

			if var_526_13 <= arg_523_1.time_ and arg_523_1.time_ < var_526_13 + var_526_20 then
				arg_523_1.typewritter.percent = (arg_523_1.time_ - var_526_13) / var_526_20

				arg_523_1.typewritter:SetDirty()
			end

			if arg_523_1.time_ >= var_526_13 + var_526_20 and arg_523_1.time_ < var_526_13 + var_526_20 + arg_526_0 then
				arg_523_1.typewritter.percent = 1

				arg_523_1.typewritter:SetDirty()
				arg_523_1:ShowNextGo(true)
			end
		end
	end,
	Play117041129 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 117041129
		arg_527_1.duration_ = 4.5

		local var_527_0 = {
			zh = 3.3,
			ja = 4.5
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
				arg_527_0:Play117041130(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = arg_527_1.actors_["1132"].transform
			local var_530_1 = 0

			if var_530_1 < arg_527_1.time_ and arg_527_1.time_ <= var_530_1 + arg_530_0 then
				arg_527_1.var_.moveOldPos1132 = var_530_0.localPosition
				var_530_0.localScale = Vector3.New(1, 1, 1)

				arg_527_1:CheckSpriteTmpPos("1132", 2)

				local var_530_2 = var_530_0.childCount

				for iter_530_0 = 0, var_530_2 - 1 do
					local var_530_3 = var_530_0:GetChild(iter_530_0)

					if var_530_3.name == "split_1" or not string.find(var_530_3.name, "split") then
						var_530_3.gameObject:SetActive(true)
					else
						var_530_3.gameObject:SetActive(false)
					end
				end
			end

			local var_530_4 = 0.001

			if var_530_1 <= arg_527_1.time_ and arg_527_1.time_ < var_530_1 + var_530_4 then
				local var_530_5 = (arg_527_1.time_ - var_530_1) / var_530_4
				local var_530_6 = Vector3.New(-390, -413, -185)

				var_530_0.localPosition = Vector3.Lerp(arg_527_1.var_.moveOldPos1132, var_530_6, var_530_5)
			end

			if arg_527_1.time_ >= var_530_1 + var_530_4 and arg_527_1.time_ < var_530_1 + var_530_4 + arg_530_0 then
				var_530_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_530_7 = arg_527_1.actors_["1132"]
			local var_530_8 = 0

			if var_530_8 < arg_527_1.time_ and arg_527_1.time_ <= var_530_8 + arg_530_0 and arg_527_1.var_.actorSpriteComps1132 == nil then
				arg_527_1.var_.actorSpriteComps1132 = var_530_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_530_9 = 0.2

			if var_530_8 <= arg_527_1.time_ and arg_527_1.time_ < var_530_8 + var_530_9 then
				local var_530_10 = (arg_527_1.time_ - var_530_8) / var_530_9

				if arg_527_1.var_.actorSpriteComps1132 then
					for iter_530_1, iter_530_2 in pairs(arg_527_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_530_2 then
							local var_530_11 = Mathf.Lerp(iter_530_2.color.r, 1, var_530_10)

							iter_530_2.color = Color.New(var_530_11, var_530_11, var_530_11)
						end
					end
				end
			end

			if arg_527_1.time_ >= var_530_8 + var_530_9 and arg_527_1.time_ < var_530_8 + var_530_9 + arg_530_0 and arg_527_1.var_.actorSpriteComps1132 then
				local var_530_12 = 1

				for iter_530_3, iter_530_4 in pairs(arg_527_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_530_4 then
						iter_530_4.color = Color.New(var_530_12, var_530_12, var_530_12)
					end
				end

				arg_527_1.var_.actorSpriteComps1132 = nil
			end

			local var_530_13 = arg_527_1.actors_["1132"]
			local var_530_14 = 0

			if var_530_14 < arg_527_1.time_ and arg_527_1.time_ <= var_530_14 + arg_530_0 and arg_527_1.var_.actorSpriteComps1132 == nil then
				arg_527_1.var_.actorSpriteComps1132 = var_530_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_530_15 = 0.2

			if var_530_14 <= arg_527_1.time_ and arg_527_1.time_ < var_530_14 + var_530_15 then
				local var_530_16 = (arg_527_1.time_ - var_530_14) / var_530_15

				if arg_527_1.var_.actorSpriteComps1132 then
					for iter_530_5, iter_530_6 in pairs(arg_527_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_530_6 then
							local var_530_17 = Mathf.Lerp(iter_530_6.color.r, 1, var_530_16)

							iter_530_6.color = Color.New(var_530_17, var_530_17, var_530_17)
						end
					end
				end
			end

			if arg_527_1.time_ >= var_530_14 + var_530_15 and arg_527_1.time_ < var_530_14 + var_530_15 + arg_530_0 and arg_527_1.var_.actorSpriteComps1132 then
				local var_530_18 = 1

				for iter_530_7, iter_530_8 in pairs(arg_527_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_530_8 then
						iter_530_8.color = Color.New(var_530_18, var_530_18, var_530_18)
					end
				end

				arg_527_1.var_.actorSpriteComps1132 = nil
			end

			local var_530_19 = 0
			local var_530_20 = 0.325

			if var_530_19 < arg_527_1.time_ and arg_527_1.time_ <= var_530_19 + arg_530_0 then
				arg_527_1.talkMaxDuration = 0
				arg_527_1.dialogCg_.alpha = 1

				arg_527_1.dialog_:SetActive(true)
				SetActive(arg_527_1.leftNameGo_, true)

				local var_530_21 = arg_527_1:FormatText(StoryNameCfg[61].name)

				arg_527_1.leftNameTxt_.text = var_530_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_527_1.leftNameTxt_.transform)

				arg_527_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_527_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_527_1:RecordName(arg_527_1.leftNameTxt_.text)
				SetActive(arg_527_1.iconTrs_.gameObject, false)
				arg_527_1.callingController_:SetSelectedState("normal")

				local var_530_22 = arg_527_1:GetWordFromCfg(117041129)
				local var_530_23 = arg_527_1:FormatText(var_530_22.content)

				arg_527_1.text_.text = var_530_23

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_24 = 13
				local var_530_25 = utf8.len(var_530_23)
				local var_530_26 = var_530_24 <= 0 and var_530_20 or var_530_20 * (var_530_25 / var_530_24)

				if var_530_26 > 0 and var_530_20 < var_530_26 then
					arg_527_1.talkMaxDuration = var_530_26

					if var_530_26 + var_530_19 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_26 + var_530_19
					end
				end

				arg_527_1.text_.text = var_530_23
				arg_527_1.typewritter.percent = 0

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041129", "story_v_out_117041.awb") ~= 0 then
					local var_530_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041129", "story_v_out_117041.awb") / 1000

					if var_530_27 + var_530_19 > arg_527_1.duration_ then
						arg_527_1.duration_ = var_530_27 + var_530_19
					end

					if var_530_22.prefab_name ~= "" and arg_527_1.actors_[var_530_22.prefab_name] ~= nil then
						local var_530_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_527_1.actors_[var_530_22.prefab_name].transform, "story_v_out_117041", "117041129", "story_v_out_117041.awb")

						arg_527_1:RecordAudio("117041129", var_530_28)
						arg_527_1:RecordAudio("117041129", var_530_28)
					else
						arg_527_1:AudioAction("play", "voice", "story_v_out_117041", "117041129", "story_v_out_117041.awb")
					end

					arg_527_1:RecordHistoryTalkVoice("story_v_out_117041", "117041129", "story_v_out_117041.awb")
				end

				arg_527_1:RecordContent(arg_527_1.text_.text)
			end

			local var_530_29 = math.max(var_530_20, arg_527_1.talkMaxDuration)

			if var_530_19 <= arg_527_1.time_ and arg_527_1.time_ < var_530_19 + var_530_29 then
				arg_527_1.typewritter.percent = (arg_527_1.time_ - var_530_19) / var_530_29

				arg_527_1.typewritter:SetDirty()
			end

			if arg_527_1.time_ >= var_530_19 + var_530_29 and arg_527_1.time_ < var_530_19 + var_530_29 + arg_530_0 then
				arg_527_1.typewritter.percent = 1

				arg_527_1.typewritter:SetDirty()
				arg_527_1:ShowNextGo(true)
			end
		end
	end,
	Play117041130 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 117041130
		arg_531_1.duration_ = 5.066

		local var_531_0 = {
			zh = 4.066,
			ja = 5.066
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
				arg_531_0:Play117041131(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = arg_531_1.actors_["1132"].transform
			local var_534_1 = 0

			if var_534_1 < arg_531_1.time_ and arg_531_1.time_ <= var_534_1 + arg_534_0 then
				arg_531_1.var_.moveOldPos1132 = var_534_0.localPosition
				var_534_0.localScale = Vector3.New(1, 1, 1)

				arg_531_1:CheckSpriteTmpPos("1132", 2)

				local var_534_2 = var_534_0.childCount

				for iter_534_0 = 0, var_534_2 - 1 do
					local var_534_3 = var_534_0:GetChild(iter_534_0)

					if var_534_3.name == "split_6" or not string.find(var_534_3.name, "split") then
						var_534_3.gameObject:SetActive(true)
					else
						var_534_3.gameObject:SetActive(false)
					end
				end
			end

			local var_534_4 = 0.001

			if var_534_1 <= arg_531_1.time_ and arg_531_1.time_ < var_534_1 + var_534_4 then
				local var_534_5 = (arg_531_1.time_ - var_534_1) / var_534_4
				local var_534_6 = Vector3.New(-390, -413, -185)

				var_534_0.localPosition = Vector3.Lerp(arg_531_1.var_.moveOldPos1132, var_534_6, var_534_5)
			end

			if arg_531_1.time_ >= var_534_1 + var_534_4 and arg_531_1.time_ < var_534_1 + var_534_4 + arg_534_0 then
				var_534_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_534_7 = 0
			local var_534_8 = 0.375

			if var_534_7 < arg_531_1.time_ and arg_531_1.time_ <= var_534_7 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, true)

				local var_534_9 = arg_531_1:FormatText(StoryNameCfg[61].name)

				arg_531_1.leftNameTxt_.text = var_534_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_531_1.leftNameTxt_.transform)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1.leftNameTxt_.text)
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_10 = arg_531_1:GetWordFromCfg(117041130)
				local var_534_11 = arg_531_1:FormatText(var_534_10.content)

				arg_531_1.text_.text = var_534_11

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_12 = 15
				local var_534_13 = utf8.len(var_534_11)
				local var_534_14 = var_534_12 <= 0 and var_534_8 or var_534_8 * (var_534_13 / var_534_12)

				if var_534_14 > 0 and var_534_8 < var_534_14 then
					arg_531_1.talkMaxDuration = var_534_14

					if var_534_14 + var_534_7 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_14 + var_534_7
					end
				end

				arg_531_1.text_.text = var_534_11
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041130", "story_v_out_117041.awb") ~= 0 then
					local var_534_15 = manager.audio:GetVoiceLength("story_v_out_117041", "117041130", "story_v_out_117041.awb") / 1000

					if var_534_15 + var_534_7 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_15 + var_534_7
					end

					if var_534_10.prefab_name ~= "" and arg_531_1.actors_[var_534_10.prefab_name] ~= nil then
						local var_534_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_531_1.actors_[var_534_10.prefab_name].transform, "story_v_out_117041", "117041130", "story_v_out_117041.awb")

						arg_531_1:RecordAudio("117041130", var_534_16)
						arg_531_1:RecordAudio("117041130", var_534_16)
					else
						arg_531_1:AudioAction("play", "voice", "story_v_out_117041", "117041130", "story_v_out_117041.awb")
					end

					arg_531_1:RecordHistoryTalkVoice("story_v_out_117041", "117041130", "story_v_out_117041.awb")
				end

				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_17 = math.max(var_534_8, arg_531_1.talkMaxDuration)

			if var_534_7 <= arg_531_1.time_ and arg_531_1.time_ < var_534_7 + var_534_17 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_7) / var_534_17

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_7 + var_534_17 and arg_531_1.time_ < var_534_7 + var_534_17 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play117041131 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 117041131
		arg_535_1.duration_ = 6.633

		local var_535_0 = {
			zh = 6.633,
			ja = 5.3
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
				arg_535_0:Play117041132(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["1132"]
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 and arg_535_1.var_.actorSpriteComps1132 == nil then
				arg_535_1.var_.actorSpriteComps1132 = var_538_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_538_2 = 0.2

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2

				if arg_535_1.var_.actorSpriteComps1132 then
					for iter_538_0, iter_538_1 in pairs(arg_535_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_538_1 then
							local var_538_4 = Mathf.Lerp(iter_538_1.color.r, 0.5, var_538_3)

							iter_538_1.color = Color.New(var_538_4, var_538_4, var_538_4)
						end
					end
				end
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 and arg_535_1.var_.actorSpriteComps1132 then
				local var_538_5 = 0.5

				for iter_538_2, iter_538_3 in pairs(arg_535_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_538_3 then
						iter_538_3.color = Color.New(var_538_5, var_538_5, var_538_5)
					end
				end

				arg_535_1.var_.actorSpriteComps1132 = nil
			end

			local var_538_6 = arg_535_1.actors_["10034"]
			local var_538_7 = 0

			if var_538_7 < arg_535_1.time_ and arg_535_1.time_ <= var_538_7 + arg_538_0 and arg_535_1.var_.actorSpriteComps10034 == nil then
				arg_535_1.var_.actorSpriteComps10034 = var_538_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_538_8 = 0.2

			if var_538_7 <= arg_535_1.time_ and arg_535_1.time_ < var_538_7 + var_538_8 then
				local var_538_9 = (arg_535_1.time_ - var_538_7) / var_538_8

				if arg_535_1.var_.actorSpriteComps10034 then
					for iter_538_4, iter_538_5 in pairs(arg_535_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_538_5 then
							local var_538_10 = Mathf.Lerp(iter_538_5.color.r, 1, var_538_9)

							iter_538_5.color = Color.New(var_538_10, var_538_10, var_538_10)
						end
					end
				end
			end

			if arg_535_1.time_ >= var_538_7 + var_538_8 and arg_535_1.time_ < var_538_7 + var_538_8 + arg_538_0 and arg_535_1.var_.actorSpriteComps10034 then
				local var_538_11 = 1

				for iter_538_6, iter_538_7 in pairs(arg_535_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_538_7 then
						iter_538_7.color = Color.New(var_538_11, var_538_11, var_538_11)
					end
				end

				arg_535_1.var_.actorSpriteComps10034 = nil
			end

			local var_538_12 = arg_535_1.actors_["10034"].transform
			local var_538_13 = 0

			if var_538_13 < arg_535_1.time_ and arg_535_1.time_ <= var_538_13 + arg_538_0 then
				arg_535_1.var_.moveOldPos10034 = var_538_12.localPosition
				var_538_12.localScale = Vector3.New(1, 1, 1)

				arg_535_1:CheckSpriteTmpPos("10034", 4)

				local var_538_14 = var_538_12.childCount

				for iter_538_8 = 0, var_538_14 - 1 do
					local var_538_15 = var_538_12:GetChild(iter_538_8)

					if var_538_15.name == "split_2" or not string.find(var_538_15.name, "split") then
						var_538_15.gameObject:SetActive(true)
					else
						var_538_15.gameObject:SetActive(false)
					end
				end
			end

			local var_538_16 = 0.001

			if var_538_13 <= arg_535_1.time_ and arg_535_1.time_ < var_538_13 + var_538_16 then
				local var_538_17 = (arg_535_1.time_ - var_538_13) / var_538_16
				local var_538_18 = Vector3.New(390, -415, -290)

				var_538_12.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos10034, var_538_18, var_538_17)
			end

			if arg_535_1.time_ >= var_538_13 + var_538_16 and arg_535_1.time_ < var_538_13 + var_538_16 + arg_538_0 then
				var_538_12.localPosition = Vector3.New(390, -415, -290)
			end

			local var_538_19 = 0
			local var_538_20 = 0.65

			if var_538_19 < arg_535_1.time_ and arg_535_1.time_ <= var_538_19 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_21 = arg_535_1:FormatText(StoryNameCfg[367].name)

				arg_535_1.leftNameTxt_.text = var_538_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_22 = arg_535_1:GetWordFromCfg(117041131)
				local var_538_23 = arg_535_1:FormatText(var_538_22.content)

				arg_535_1.text_.text = var_538_23

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_24 = 26
				local var_538_25 = utf8.len(var_538_23)
				local var_538_26 = var_538_24 <= 0 and var_538_20 or var_538_20 * (var_538_25 / var_538_24)

				if var_538_26 > 0 and var_538_20 < var_538_26 then
					arg_535_1.talkMaxDuration = var_538_26

					if var_538_26 + var_538_19 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_26 + var_538_19
					end
				end

				arg_535_1.text_.text = var_538_23
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041131", "story_v_out_117041.awb") ~= 0 then
					local var_538_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041131", "story_v_out_117041.awb") / 1000

					if var_538_27 + var_538_19 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_27 + var_538_19
					end

					if var_538_22.prefab_name ~= "" and arg_535_1.actors_[var_538_22.prefab_name] ~= nil then
						local var_538_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_22.prefab_name].transform, "story_v_out_117041", "117041131", "story_v_out_117041.awb")

						arg_535_1:RecordAudio("117041131", var_538_28)
						arg_535_1:RecordAudio("117041131", var_538_28)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_117041", "117041131", "story_v_out_117041.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_117041", "117041131", "story_v_out_117041.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_29 = math.max(var_538_20, arg_535_1.talkMaxDuration)

			if var_538_19 <= arg_535_1.time_ and arg_535_1.time_ < var_538_19 + var_538_29 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_19) / var_538_29

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_19 + var_538_29 and arg_535_1.time_ < var_538_19 + var_538_29 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play117041132 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 117041132
		arg_539_1.duration_ = 13.2

		local var_539_0 = {
			zh = 10.6,
			ja = 13.2
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
				arg_539_0:Play117041133(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = 0
			local var_542_1 = 1.15

			if var_542_0 < arg_539_1.time_ and arg_539_1.time_ <= var_542_0 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_2 = arg_539_1:FormatText(StoryNameCfg[367].name)

				arg_539_1.leftNameTxt_.text = var_542_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_3 = arg_539_1:GetWordFromCfg(117041132)
				local var_542_4 = arg_539_1:FormatText(var_542_3.content)

				arg_539_1.text_.text = var_542_4

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041132", "story_v_out_117041.awb") ~= 0 then
					local var_542_8 = manager.audio:GetVoiceLength("story_v_out_117041", "117041132", "story_v_out_117041.awb") / 1000

					if var_542_8 + var_542_0 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_8 + var_542_0
					end

					if var_542_3.prefab_name ~= "" and arg_539_1.actors_[var_542_3.prefab_name] ~= nil then
						local var_542_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_3.prefab_name].transform, "story_v_out_117041", "117041132", "story_v_out_117041.awb")

						arg_539_1:RecordAudio("117041132", var_542_9)
						arg_539_1:RecordAudio("117041132", var_542_9)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_117041", "117041132", "story_v_out_117041.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_117041", "117041132", "story_v_out_117041.awb")
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
	Play117041133 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 117041133
		arg_543_1.duration_ = 5.833

		local var_543_0 = {
			zh = 5.833,
			ja = 4.933
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
				arg_543_0:Play117041134(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = arg_543_1.actors_["1132"].transform
			local var_546_1 = 0

			if var_546_1 < arg_543_1.time_ and arg_543_1.time_ <= var_546_1 + arg_546_0 then
				arg_543_1.var_.moveOldPos1132 = var_546_0.localPosition
				var_546_0.localScale = Vector3.New(1, 1, 1)

				arg_543_1:CheckSpriteTmpPos("1132", 2)

				local var_546_2 = var_546_0.childCount

				for iter_546_0 = 0, var_546_2 - 1 do
					local var_546_3 = var_546_0:GetChild(iter_546_0)

					if var_546_3.name == "split_2" or not string.find(var_546_3.name, "split") then
						var_546_3.gameObject:SetActive(true)
					else
						var_546_3.gameObject:SetActive(false)
					end
				end
			end

			local var_546_4 = 0.001

			if var_546_1 <= arg_543_1.time_ and arg_543_1.time_ < var_546_1 + var_546_4 then
				local var_546_5 = (arg_543_1.time_ - var_546_1) / var_546_4
				local var_546_6 = Vector3.New(-390, -413, -185)

				var_546_0.localPosition = Vector3.Lerp(arg_543_1.var_.moveOldPos1132, var_546_6, var_546_5)
			end

			if arg_543_1.time_ >= var_546_1 + var_546_4 and arg_543_1.time_ < var_546_1 + var_546_4 + arg_546_0 then
				var_546_0.localPosition = Vector3.New(-390, -413, -185)
			end

			local var_546_7 = arg_543_1.actors_["1132"]
			local var_546_8 = 0

			if var_546_8 < arg_543_1.time_ and arg_543_1.time_ <= var_546_8 + arg_546_0 and arg_543_1.var_.actorSpriteComps1132 == nil then
				arg_543_1.var_.actorSpriteComps1132 = var_546_7:GetComponentsInChildren(typeof(Image), true)
			end

			local var_546_9 = 0.2

			if var_546_8 <= arg_543_1.time_ and arg_543_1.time_ < var_546_8 + var_546_9 then
				local var_546_10 = (arg_543_1.time_ - var_546_8) / var_546_9

				if arg_543_1.var_.actorSpriteComps1132 then
					for iter_546_1, iter_546_2 in pairs(arg_543_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_546_2 then
							local var_546_11 = Mathf.Lerp(iter_546_2.color.r, 1, var_546_10)

							iter_546_2.color = Color.New(var_546_11, var_546_11, var_546_11)
						end
					end
				end
			end

			if arg_543_1.time_ >= var_546_8 + var_546_9 and arg_543_1.time_ < var_546_8 + var_546_9 + arg_546_0 and arg_543_1.var_.actorSpriteComps1132 then
				local var_546_12 = 1

				for iter_546_3, iter_546_4 in pairs(arg_543_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_546_4 then
						iter_546_4.color = Color.New(var_546_12, var_546_12, var_546_12)
					end
				end

				arg_543_1.var_.actorSpriteComps1132 = nil
			end

			local var_546_13 = arg_543_1.actors_["10034"]
			local var_546_14 = 0

			if var_546_14 < arg_543_1.time_ and arg_543_1.time_ <= var_546_14 + arg_546_0 and arg_543_1.var_.actorSpriteComps10034 == nil then
				arg_543_1.var_.actorSpriteComps10034 = var_546_13:GetComponentsInChildren(typeof(Image), true)
			end

			local var_546_15 = 0.2

			if var_546_14 <= arg_543_1.time_ and arg_543_1.time_ < var_546_14 + var_546_15 then
				local var_546_16 = (arg_543_1.time_ - var_546_14) / var_546_15

				if arg_543_1.var_.actorSpriteComps10034 then
					for iter_546_5, iter_546_6 in pairs(arg_543_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_546_6 then
							local var_546_17 = Mathf.Lerp(iter_546_6.color.r, 0.5, var_546_16)

							iter_546_6.color = Color.New(var_546_17, var_546_17, var_546_17)
						end
					end
				end
			end

			if arg_543_1.time_ >= var_546_14 + var_546_15 and arg_543_1.time_ < var_546_14 + var_546_15 + arg_546_0 and arg_543_1.var_.actorSpriteComps10034 then
				local var_546_18 = 0.5

				for iter_546_7, iter_546_8 in pairs(arg_543_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_546_8 then
						iter_546_8.color = Color.New(var_546_18, var_546_18, var_546_18)
					end
				end

				arg_543_1.var_.actorSpriteComps10034 = nil
			end

			local var_546_19 = 0
			local var_546_20 = 0.525

			if var_546_19 < arg_543_1.time_ and arg_543_1.time_ <= var_546_19 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_21 = arg_543_1:FormatText(StoryNameCfg[61].name)

				arg_543_1.leftNameTxt_.text = var_546_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_22 = arg_543_1:GetWordFromCfg(117041133)
				local var_546_23 = arg_543_1:FormatText(var_546_22.content)

				arg_543_1.text_.text = var_546_23

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_24 = 21
				local var_546_25 = utf8.len(var_546_23)
				local var_546_26 = var_546_24 <= 0 and var_546_20 or var_546_20 * (var_546_25 / var_546_24)

				if var_546_26 > 0 and var_546_20 < var_546_26 then
					arg_543_1.talkMaxDuration = var_546_26

					if var_546_26 + var_546_19 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_26 + var_546_19
					end
				end

				arg_543_1.text_.text = var_546_23
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041133", "story_v_out_117041.awb") ~= 0 then
					local var_546_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041133", "story_v_out_117041.awb") / 1000

					if var_546_27 + var_546_19 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_27 + var_546_19
					end

					if var_546_22.prefab_name ~= "" and arg_543_1.actors_[var_546_22.prefab_name] ~= nil then
						local var_546_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_22.prefab_name].transform, "story_v_out_117041", "117041133", "story_v_out_117041.awb")

						arg_543_1:RecordAudio("117041133", var_546_28)
						arg_543_1:RecordAudio("117041133", var_546_28)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_117041", "117041133", "story_v_out_117041.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_117041", "117041133", "story_v_out_117041.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_29 = math.max(var_546_20, arg_543_1.talkMaxDuration)

			if var_546_19 <= arg_543_1.time_ and arg_543_1.time_ < var_546_19 + var_546_29 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_19) / var_546_29

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_19 + var_546_29 and arg_543_1.time_ < var_546_19 + var_546_29 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play117041134 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 117041134
		arg_547_1.duration_ = 3.333

		local var_547_0 = {
			zh = 3.333,
			ja = 2.6
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
				arg_547_0:Play117041135(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["1132"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and arg_547_1.var_.actorSpriteComps1132 == nil then
				arg_547_1.var_.actorSpriteComps1132 = var_550_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_550_2 = 0.2

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.actorSpriteComps1132 then
					for iter_550_0, iter_550_1 in pairs(arg_547_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_550_1 then
							local var_550_4 = Mathf.Lerp(iter_550_1.color.r, 0.5, var_550_3)

							iter_550_1.color = Color.New(var_550_4, var_550_4, var_550_4)
						end
					end
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and arg_547_1.var_.actorSpriteComps1132 then
				local var_550_5 = 0.5

				for iter_550_2, iter_550_3 in pairs(arg_547_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_550_3 then
						iter_550_3.color = Color.New(var_550_5, var_550_5, var_550_5)
					end
				end

				arg_547_1.var_.actorSpriteComps1132 = nil
			end

			local var_550_6 = arg_547_1.actors_["10034"]
			local var_550_7 = 0

			if var_550_7 < arg_547_1.time_ and arg_547_1.time_ <= var_550_7 + arg_550_0 and arg_547_1.var_.actorSpriteComps10034 == nil then
				arg_547_1.var_.actorSpriteComps10034 = var_550_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_550_8 = 0.2

			if var_550_7 <= arg_547_1.time_ and arg_547_1.time_ < var_550_7 + var_550_8 then
				local var_550_9 = (arg_547_1.time_ - var_550_7) / var_550_8

				if arg_547_1.var_.actorSpriteComps10034 then
					for iter_550_4, iter_550_5 in pairs(arg_547_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_550_5 then
							local var_550_10 = Mathf.Lerp(iter_550_5.color.r, 1, var_550_9)

							iter_550_5.color = Color.New(var_550_10, var_550_10, var_550_10)
						end
					end
				end
			end

			if arg_547_1.time_ >= var_550_7 + var_550_8 and arg_547_1.time_ < var_550_7 + var_550_8 + arg_550_0 and arg_547_1.var_.actorSpriteComps10034 then
				local var_550_11 = 1

				for iter_550_6, iter_550_7 in pairs(arg_547_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_550_7 then
						iter_550_7.color = Color.New(var_550_11, var_550_11, var_550_11)
					end
				end

				arg_547_1.var_.actorSpriteComps10034 = nil
			end

			local var_550_12 = 0
			local var_550_13 = 0.225

			if var_550_12 < arg_547_1.time_ and arg_547_1.time_ <= var_550_12 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_14 = arg_547_1:FormatText(StoryNameCfg[367].name)

				arg_547_1.leftNameTxt_.text = var_550_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_15 = arg_547_1:GetWordFromCfg(117041134)
				local var_550_16 = arg_547_1:FormatText(var_550_15.content)

				arg_547_1.text_.text = var_550_16

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_17 = 9
				local var_550_18 = utf8.len(var_550_16)
				local var_550_19 = var_550_17 <= 0 and var_550_13 or var_550_13 * (var_550_18 / var_550_17)

				if var_550_19 > 0 and var_550_13 < var_550_19 then
					arg_547_1.talkMaxDuration = var_550_19

					if var_550_19 + var_550_12 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_19 + var_550_12
					end
				end

				arg_547_1.text_.text = var_550_16
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041134", "story_v_out_117041.awb") ~= 0 then
					local var_550_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041134", "story_v_out_117041.awb") / 1000

					if var_550_20 + var_550_12 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_20 + var_550_12
					end

					if var_550_15.prefab_name ~= "" and arg_547_1.actors_[var_550_15.prefab_name] ~= nil then
						local var_550_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_15.prefab_name].transform, "story_v_out_117041", "117041134", "story_v_out_117041.awb")

						arg_547_1:RecordAudio("117041134", var_550_21)
						arg_547_1:RecordAudio("117041134", var_550_21)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_117041", "117041134", "story_v_out_117041.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_117041", "117041134", "story_v_out_117041.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_22 = math.max(var_550_13, arg_547_1.talkMaxDuration)

			if var_550_12 <= arg_547_1.time_ and arg_547_1.time_ < var_550_12 + var_550_22 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_12) / var_550_22

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_12 + var_550_22 and arg_547_1.time_ < var_550_12 + var_550_22 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play117041135 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 117041135
		arg_551_1.duration_ = 1.633

		local var_551_0 = {
			zh = 1.133,
			ja = 1.633
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
				arg_551_0:Play117041136(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["1132"]
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 and arg_551_1.var_.actorSpriteComps1132 == nil then
				arg_551_1.var_.actorSpriteComps1132 = var_554_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_554_2 = 0.2

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2

				if arg_551_1.var_.actorSpriteComps1132 then
					for iter_554_0, iter_554_1 in pairs(arg_551_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_554_1 then
							local var_554_4 = Mathf.Lerp(iter_554_1.color.r, 1, var_554_3)

							iter_554_1.color = Color.New(var_554_4, var_554_4, var_554_4)
						end
					end
				end
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 and arg_551_1.var_.actorSpriteComps1132 then
				local var_554_5 = 1

				for iter_554_2, iter_554_3 in pairs(arg_551_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_554_3 then
						iter_554_3.color = Color.New(var_554_5, var_554_5, var_554_5)
					end
				end

				arg_551_1.var_.actorSpriteComps1132 = nil
			end

			local var_554_6 = arg_551_1.actors_["10034"]
			local var_554_7 = 0

			if var_554_7 < arg_551_1.time_ and arg_551_1.time_ <= var_554_7 + arg_554_0 and arg_551_1.var_.actorSpriteComps10034 == nil then
				arg_551_1.var_.actorSpriteComps10034 = var_554_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_554_8 = 0.2

			if var_554_7 <= arg_551_1.time_ and arg_551_1.time_ < var_554_7 + var_554_8 then
				local var_554_9 = (arg_551_1.time_ - var_554_7) / var_554_8

				if arg_551_1.var_.actorSpriteComps10034 then
					for iter_554_4, iter_554_5 in pairs(arg_551_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_554_5 then
							local var_554_10 = Mathf.Lerp(iter_554_5.color.r, 0.5, var_554_9)

							iter_554_5.color = Color.New(var_554_10, var_554_10, var_554_10)
						end
					end
				end
			end

			if arg_551_1.time_ >= var_554_7 + var_554_8 and arg_551_1.time_ < var_554_7 + var_554_8 + arg_554_0 and arg_551_1.var_.actorSpriteComps10034 then
				local var_554_11 = 0.5

				for iter_554_6, iter_554_7 in pairs(arg_551_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_554_7 then
						iter_554_7.color = Color.New(var_554_11, var_554_11, var_554_11)
					end
				end

				arg_551_1.var_.actorSpriteComps10034 = nil
			end

			local var_554_12 = 0
			local var_554_13 = 0.125

			if var_554_12 < arg_551_1.time_ and arg_551_1.time_ <= var_554_12 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, true)

				local var_554_14 = arg_551_1:FormatText(StoryNameCfg[61].name)

				arg_551_1.leftNameTxt_.text = var_554_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_551_1.leftNameTxt_.transform)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1.leftNameTxt_.text)
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_15 = arg_551_1:GetWordFromCfg(117041135)
				local var_554_16 = arg_551_1:FormatText(var_554_15.content)

				arg_551_1.text_.text = var_554_16

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_17 = 5
				local var_554_18 = utf8.len(var_554_16)
				local var_554_19 = var_554_17 <= 0 and var_554_13 or var_554_13 * (var_554_18 / var_554_17)

				if var_554_19 > 0 and var_554_13 < var_554_19 then
					arg_551_1.talkMaxDuration = var_554_19

					if var_554_19 + var_554_12 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_19 + var_554_12
					end
				end

				arg_551_1.text_.text = var_554_16
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041135", "story_v_out_117041.awb") ~= 0 then
					local var_554_20 = manager.audio:GetVoiceLength("story_v_out_117041", "117041135", "story_v_out_117041.awb") / 1000

					if var_554_20 + var_554_12 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_20 + var_554_12
					end

					if var_554_15.prefab_name ~= "" and arg_551_1.actors_[var_554_15.prefab_name] ~= nil then
						local var_554_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_551_1.actors_[var_554_15.prefab_name].transform, "story_v_out_117041", "117041135", "story_v_out_117041.awb")

						arg_551_1:RecordAudio("117041135", var_554_21)
						arg_551_1:RecordAudio("117041135", var_554_21)
					else
						arg_551_1:AudioAction("play", "voice", "story_v_out_117041", "117041135", "story_v_out_117041.awb")
					end

					arg_551_1:RecordHistoryTalkVoice("story_v_out_117041", "117041135", "story_v_out_117041.awb")
				end

				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_22 = math.max(var_554_13, arg_551_1.talkMaxDuration)

			if var_554_12 <= arg_551_1.time_ and arg_551_1.time_ < var_554_12 + var_554_22 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_12) / var_554_22

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_12 + var_554_22 and arg_551_1.time_ < var_554_12 + var_554_22 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play117041136 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 117041136
		arg_555_1.duration_ = 5.166

		local var_555_0 = {
			zh = 5,
			ja = 5.166
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
				arg_555_0:Play117041137(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1132"]
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 and arg_555_1.var_.actorSpriteComps1132 == nil then
				arg_555_1.var_.actorSpriteComps1132 = var_558_0:GetComponentsInChildren(typeof(Image), true)
			end

			local var_558_2 = 0.2

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2

				if arg_555_1.var_.actorSpriteComps1132 then
					for iter_558_0, iter_558_1 in pairs(arg_555_1.var_.actorSpriteComps1132:ToTable()) do
						if iter_558_1 then
							local var_558_4 = Mathf.Lerp(iter_558_1.color.r, 0.5, var_558_3)

							iter_558_1.color = Color.New(var_558_4, var_558_4, var_558_4)
						end
					end
				end
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 and arg_555_1.var_.actorSpriteComps1132 then
				local var_558_5 = 0.5

				for iter_558_2, iter_558_3 in pairs(arg_555_1.var_.actorSpriteComps1132:ToTable()) do
					if iter_558_3 then
						iter_558_3.color = Color.New(var_558_5, var_558_5, var_558_5)
					end
				end

				arg_555_1.var_.actorSpriteComps1132 = nil
			end

			local var_558_6 = arg_555_1.actors_["10034"]
			local var_558_7 = 0

			if var_558_7 < arg_555_1.time_ and arg_555_1.time_ <= var_558_7 + arg_558_0 and arg_555_1.var_.actorSpriteComps10034 == nil then
				arg_555_1.var_.actorSpriteComps10034 = var_558_6:GetComponentsInChildren(typeof(Image), true)
			end

			local var_558_8 = 0.2

			if var_558_7 <= arg_555_1.time_ and arg_555_1.time_ < var_558_7 + var_558_8 then
				local var_558_9 = (arg_555_1.time_ - var_558_7) / var_558_8

				if arg_555_1.var_.actorSpriteComps10034 then
					for iter_558_4, iter_558_5 in pairs(arg_555_1.var_.actorSpriteComps10034:ToTable()) do
						if iter_558_5 then
							local var_558_10 = Mathf.Lerp(iter_558_5.color.r, 1, var_558_9)

							iter_558_5.color = Color.New(var_558_10, var_558_10, var_558_10)
						end
					end
				end
			end

			if arg_555_1.time_ >= var_558_7 + var_558_8 and arg_555_1.time_ < var_558_7 + var_558_8 + arg_558_0 and arg_555_1.var_.actorSpriteComps10034 then
				local var_558_11 = 1

				for iter_558_6, iter_558_7 in pairs(arg_555_1.var_.actorSpriteComps10034:ToTable()) do
					if iter_558_7 then
						iter_558_7.color = Color.New(var_558_11, var_558_11, var_558_11)
					end
				end

				arg_555_1.var_.actorSpriteComps10034 = nil
			end

			local var_558_12 = arg_555_1.actors_["10034"].transform
			local var_558_13 = 0

			if var_558_13 < arg_555_1.time_ and arg_555_1.time_ <= var_558_13 + arg_558_0 then
				arg_555_1.var_.moveOldPos10034 = var_558_12.localPosition
				var_558_12.localScale = Vector3.New(1, 1, 1)

				arg_555_1:CheckSpriteTmpPos("10034", 4)

				local var_558_14 = var_558_12.childCount

				for iter_558_8 = 0, var_558_14 - 1 do
					local var_558_15 = var_558_12:GetChild(iter_558_8)

					if var_558_15.name == "split_5" or not string.find(var_558_15.name, "split") then
						var_558_15.gameObject:SetActive(true)
					else
						var_558_15.gameObject:SetActive(false)
					end
				end
			end

			local var_558_16 = 0.001

			if var_558_13 <= arg_555_1.time_ and arg_555_1.time_ < var_558_13 + var_558_16 then
				local var_558_17 = (arg_555_1.time_ - var_558_13) / var_558_16
				local var_558_18 = Vector3.New(390, -415, -290)

				var_558_12.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos10034, var_558_18, var_558_17)
			end

			if arg_555_1.time_ >= var_558_13 + var_558_16 and arg_555_1.time_ < var_558_13 + var_558_16 + arg_558_0 then
				var_558_12.localPosition = Vector3.New(390, -415, -290)
			end

			local var_558_19 = 0
			local var_558_20 = 0.35

			if var_558_19 < arg_555_1.time_ and arg_555_1.time_ <= var_558_19 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_21 = arg_555_1:FormatText(StoryNameCfg[367].name)

				arg_555_1.leftNameTxt_.text = var_558_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_22 = arg_555_1:GetWordFromCfg(117041136)
				local var_558_23 = arg_555_1:FormatText(var_558_22.content)

				arg_555_1.text_.text = var_558_23

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_24 = 14
				local var_558_25 = utf8.len(var_558_23)
				local var_558_26 = var_558_24 <= 0 and var_558_20 or var_558_20 * (var_558_25 / var_558_24)

				if var_558_26 > 0 and var_558_20 < var_558_26 then
					arg_555_1.talkMaxDuration = var_558_26

					if var_558_26 + var_558_19 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_26 + var_558_19
					end
				end

				arg_555_1.text_.text = var_558_23
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_117041", "117041136", "story_v_out_117041.awb") ~= 0 then
					local var_558_27 = manager.audio:GetVoiceLength("story_v_out_117041", "117041136", "story_v_out_117041.awb") / 1000

					if var_558_27 + var_558_19 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_27 + var_558_19
					end

					if var_558_22.prefab_name ~= "" and arg_555_1.actors_[var_558_22.prefab_name] ~= nil then
						local var_558_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_22.prefab_name].transform, "story_v_out_117041", "117041136", "story_v_out_117041.awb")

						arg_555_1:RecordAudio("117041136", var_558_28)
						arg_555_1:RecordAudio("117041136", var_558_28)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_117041", "117041136", "story_v_out_117041.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_117041", "117041136", "story_v_out_117041.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_29 = math.max(var_558_20, arg_555_1.talkMaxDuration)

			if var_558_19 <= arg_555_1.time_ and arg_555_1.time_ < var_558_19 + var_558_29 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_19) / var_558_29

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_19 + var_558_29 and arg_555_1.time_ < var_558_19 + var_558_29 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play117041137 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 117041137
		arg_559_1.duration_ = 5

		SetActive(arg_559_1.tipsGo_, false)

		function arg_559_1.onSingleLineFinish_()
			arg_559_1.onSingleLineUpdate_ = nil
			arg_559_1.onSingleLineFinish_ = nil
			arg_559_1.state_ = "waiting"
		end

		function arg_559_1.playNext_(arg_561_0)
			if arg_561_0 == 1 then
				arg_559_0:Play117041138(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["10034"]
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 then
				local var_562_2 = var_562_0:GetComponentInChildren(typeof(CanvasGroup))

				if var_562_2 then
					arg_559_1.var_.alphaOldValue10034 = var_562_2.alpha
					arg_559_1.var_.characterEffect10034 = var_562_2
				end

				arg_559_1.var_.alphaOldValue10034 = 1
			end

			local var_562_3 = 0.333333333333333

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_3 then
				local var_562_4 = (arg_559_1.time_ - var_562_1) / var_562_3
				local var_562_5 = Mathf.Lerp(arg_559_1.var_.alphaOldValue10034, 0, var_562_4)

				if arg_559_1.var_.characterEffect10034 then
					arg_559_1.var_.characterEffect10034.alpha = var_562_5
				end
			end

			if arg_559_1.time_ >= var_562_1 + var_562_3 and arg_559_1.time_ < var_562_1 + var_562_3 + arg_562_0 and arg_559_1.var_.characterEffect10034 then
				arg_559_1.var_.characterEffect10034.alpha = 0
			end

			local var_562_6 = arg_559_1.actors_["1132"]
			local var_562_7 = 0

			if var_562_7 < arg_559_1.time_ and arg_559_1.time_ <= var_562_7 + arg_562_0 then
				local var_562_8 = var_562_6:GetComponentInChildren(typeof(CanvasGroup))

				if var_562_8 then
					arg_559_1.var_.alphaOldValue1132 = var_562_8.alpha
					arg_559_1.var_.characterEffect1132 = var_562_8
				end

				arg_559_1.var_.alphaOldValue1132 = 1
			end

			local var_562_9 = 0.333333333333333

			if var_562_7 <= arg_559_1.time_ and arg_559_1.time_ < var_562_7 + var_562_9 then
				local var_562_10 = (arg_559_1.time_ - var_562_7) / var_562_9
				local var_562_11 = Mathf.Lerp(arg_559_1.var_.alphaOldValue1132, 0, var_562_10)

				if arg_559_1.var_.characterEffect1132 then
					arg_559_1.var_.characterEffect1132.alpha = var_562_11
				end
			end

			if arg_559_1.time_ >= var_562_7 + var_562_9 and arg_559_1.time_ < var_562_7 + var_562_9 + arg_562_0 and arg_559_1.var_.characterEffect1132 then
				arg_559_1.var_.characterEffect1132.alpha = 0
			end

			local var_562_12 = 0
			local var_562_13 = 0.675

			if var_562_12 < arg_559_1.time_ and arg_559_1.time_ <= var_562_12 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, false)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_14 = arg_559_1:GetWordFromCfg(117041137)
				local var_562_15 = arg_559_1:FormatText(var_562_14.content)

				arg_559_1.text_.text = var_562_15

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_16 = 27
				local var_562_17 = utf8.len(var_562_15)
				local var_562_18 = var_562_16 <= 0 and var_562_13 or var_562_13 * (var_562_17 / var_562_16)

				if var_562_18 > 0 and var_562_13 < var_562_18 then
					arg_559_1.talkMaxDuration = var_562_18

					if var_562_18 + var_562_12 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_18 + var_562_12
					end
				end

				arg_559_1.text_.text = var_562_15
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)
				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_19 = math.max(var_562_13, arg_559_1.talkMaxDuration)

			if var_562_12 <= arg_559_1.time_ and arg_559_1.time_ < var_562_12 + var_562_19 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_12) / var_562_19

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_12 + var_562_19 and arg_559_1.time_ < var_562_12 + var_562_19 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play117041138 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 117041138
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
			local var_566_1 = 1

			if var_566_0 < arg_563_1.time_ and arg_563_1.time_ <= var_566_0 + arg_566_0 then
				local var_566_2 = "play"
				local var_566_3 = "effect"

				arg_563_1:AudioAction(var_566_2, var_566_3, "se_story_17", "se_story_17_door_close02", "")
			end

			local var_566_4 = 0
			local var_566_5 = 0.425

			if var_566_4 < arg_563_1.time_ and arg_563_1.time_ <= var_566_4 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, false)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_6 = arg_563_1:GetWordFromCfg(117041138)
				local var_566_7 = arg_563_1:FormatText(var_566_6.content)

				arg_563_1.text_.text = var_566_7

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_8 = 17
				local var_566_9 = utf8.len(var_566_7)
				local var_566_10 = var_566_8 <= 0 and var_566_5 or var_566_5 * (var_566_9 / var_566_8)

				if var_566_10 > 0 and var_566_5 < var_566_10 then
					arg_563_1.talkMaxDuration = var_566_10

					if var_566_10 + var_566_4 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_10 + var_566_4
					end
				end

				arg_563_1.text_.text = var_566_7
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)
				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_11 = math.max(var_566_5, arg_563_1.talkMaxDuration)

			if var_566_4 <= arg_563_1.time_ and arg_563_1.time_ < var_566_4 + var_566_11 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_4) / var_566_11

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_4 + var_566_11 and arg_563_1.time_ < var_566_4 + var_566_11 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0101",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST12",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST03",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST24a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/TI0103"
	},
	voices = {
		"story_v_out_117041.awb"
	}
}
