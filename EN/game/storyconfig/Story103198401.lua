return {
	Play319841001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319841001
		arg_1_1.duration_ = 6.35

		local var_1_0 = {
			zh = 4.983,
			ja = 6.35
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
				arg_1_0:Play319841002(arg_1_1)
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
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_17 = 0.3

			if arg_1_1.time_ >= var_4_16 + var_4_17 and arg_1_1.time_ < var_4_16 + var_4_17 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_18 = 0

			if var_4_18 < arg_1_1.time_ and arg_1_1.time_ <= var_4_18 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = true

				arg_1_1:SetGaussion(false)
			end

			local var_4_19 = 2

			if var_4_18 <= arg_1_1.time_ and arg_1_1.time_ < var_4_18 + var_4_19 then
				local var_4_20 = (arg_1_1.time_ - var_4_18) / var_4_19
				local var_4_21 = Color.New(0, 0, 0)

				var_4_21.a = Mathf.Lerp(1, 0, var_4_20)
				arg_1_1.mask_.color = var_4_21
			end

			if arg_1_1.time_ >= var_4_18 + var_4_19 and arg_1_1.time_ < var_4_18 + var_4_19 + arg_4_0 then
				local var_4_22 = Color.New(0, 0, 0)
				local var_4_23 = 0

				arg_1_1.mask_.enabled = false
				var_4_22.a = var_4_23
				arg_1_1.mask_.color = var_4_22
			end

			local var_4_24 = 0
			local var_4_25 = 0.2

			if var_4_24 < arg_1_1.time_ and arg_1_1.time_ <= var_4_24 + arg_4_0 then
				local var_4_26 = "play"
				local var_4_27 = "music"

				arg_1_1:AudioAction(var_4_26, var_4_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_28 = 1.65
			local var_4_29 = 0.35

			if var_4_28 < arg_1_1.time_ and arg_1_1.time_ <= var_4_28 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_30 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_30:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_30:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_30:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_31 = arg_1_1:FormatText(StoryNameCfg[640].name)

				arg_1_1.leftNameTxt_.text = var_4_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_32 = arg_1_1:GetWordFromCfg(319841001)
				local var_4_33 = arg_1_1:FormatText(var_4_32.content)

				arg_1_1.text_.text = var_4_33

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_34 = 14
				local var_4_35 = utf8.len(var_4_33)
				local var_4_36 = var_4_34 <= 0 and var_4_29 or var_4_29 * (var_4_35 / var_4_34)

				if var_4_36 > 0 and var_4_29 < var_4_36 then
					arg_1_1.talkMaxDuration = var_4_36
					var_4_28 = var_4_28 + 0.3

					if var_4_36 + var_4_28 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_36 + var_4_28
					end
				end

				arg_1_1.text_.text = var_4_33
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841001", "story_v_out_319841.awb") ~= 0 then
					local var_4_37 = manager.audio:GetVoiceLength("story_v_out_319841", "319841001", "story_v_out_319841.awb") / 1000

					if var_4_37 + var_4_28 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_37 + var_4_28
					end

					if var_4_32.prefab_name ~= "" and arg_1_1.actors_[var_4_32.prefab_name] ~= nil then
						local var_4_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_32.prefab_name].transform, "story_v_out_319841", "319841001", "story_v_out_319841.awb")

						arg_1_1:RecordAudio("319841001", var_4_38)
						arg_1_1:RecordAudio("319841001", var_4_38)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_319841", "319841001", "story_v_out_319841.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_319841", "319841001", "story_v_out_319841.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_39 = var_4_28 + 0.3
			local var_4_40 = math.max(var_4_29, arg_1_1.talkMaxDuration)

			if var_4_39 <= arg_1_1.time_ and arg_1_1.time_ < var_4_39 + var_4_40 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_39) / var_4_40

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_39 + var_4_40 and arg_1_1.time_ < var_4_39 + var_4_40 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319841002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319841002
		arg_7_1.duration_ = 4.4

		local var_7_0 = {
			zh = 4,
			ja = 4.4
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
				arg_7_0:Play319841003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.275

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[6].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(319841002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 11
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841002", "story_v_out_319841.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841002", "story_v_out_319841.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_319841", "319841002", "story_v_out_319841.awb")

						arg_7_1:RecordAudio("319841002", var_10_9)
						arg_7_1:RecordAudio("319841002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_319841", "319841002", "story_v_out_319841.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_319841", "319841002", "story_v_out_319841.awb")
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
	Play319841003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319841003
		arg_11_1.duration_ = 4.7

		local var_11_0 = {
			zh = 3.333,
			ja = 4.7
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
				arg_11_0:Play319841004(arg_11_1)
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

				local var_14_2 = arg_11_1:FormatText(StoryNameCfg[640].name)

				arg_11_1.leftNameTxt_.text = var_14_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_3 = arg_11_1:GetWordFromCfg(319841003)
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841003", "story_v_out_319841.awb") ~= 0 then
					local var_14_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841003", "story_v_out_319841.awb") / 1000

					if var_14_8 + var_14_0 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_8 + var_14_0
					end

					if var_14_3.prefab_name ~= "" and arg_11_1.actors_[var_14_3.prefab_name] ~= nil then
						local var_14_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_3.prefab_name].transform, "story_v_out_319841", "319841003", "story_v_out_319841.awb")

						arg_11_1:RecordAudio("319841003", var_14_9)
						arg_11_1:RecordAudio("319841003", var_14_9)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319841", "319841003", "story_v_out_319841.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319841", "319841003", "story_v_out_319841.awb")
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
	Play319841004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319841004
		arg_15_1.duration_ = 5.2

		local var_15_0 = {
			zh = 2.666,
			ja = 5.2
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
				arg_15_0:Play319841005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.3

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[6].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(319841004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841004", "story_v_out_319841.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841004", "story_v_out_319841.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_319841", "319841004", "story_v_out_319841.awb")

						arg_15_1:RecordAudio("319841004", var_18_9)
						arg_15_1:RecordAudio("319841004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319841", "319841004", "story_v_out_319841.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319841", "319841004", "story_v_out_319841.awb")
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
	Play319841005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319841005
		arg_19_1.duration_ = 2.46633333333333

		local var_19_0 = {
			zh = 2.46633333333333,
			ja = 2.19933333333333
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
				arg_19_0:Play319841006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			if arg_19_1.frameCnt_ <= 1 then
				arg_19_1.dialog_:SetActive(false)
			end

			local var_22_0 = 0.733333333333333
			local var_22_1 = 0.15

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_2 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_2:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_2:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_2:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_3 = arg_19_1:FormatText(StoryNameCfg[640].name)

				arg_19_1.leftNameTxt_.text = var_22_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_4 = arg_19_1:GetWordFromCfg(319841005)
				local var_22_5 = arg_19_1:FormatText(var_22_4.content)

				arg_19_1.text_.text = var_22_5

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_6 = 6
				local var_22_7 = utf8.len(var_22_5)
				local var_22_8 = var_22_6 <= 0 and var_22_1 or var_22_1 * (var_22_7 / var_22_6)

				if var_22_8 > 0 and var_22_1 < var_22_8 then
					arg_19_1.talkMaxDuration = var_22_8
					var_22_0 = var_22_0 + 0.3

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end
				end

				arg_19_1.text_.text = var_22_5
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841005", "story_v_out_319841.awb") ~= 0 then
					local var_22_9 = manager.audio:GetVoiceLength("story_v_out_319841", "319841005", "story_v_out_319841.awb") / 1000

					if var_22_9 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_9 + var_22_0
					end

					if var_22_4.prefab_name ~= "" and arg_19_1.actors_[var_22_4.prefab_name] ~= nil then
						local var_22_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_4.prefab_name].transform, "story_v_out_319841", "319841005", "story_v_out_319841.awb")

						arg_19_1:RecordAudio("319841005", var_22_10)
						arg_19_1:RecordAudio("319841005", var_22_10)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319841", "319841005", "story_v_out_319841.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319841", "319841005", "story_v_out_319841.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_11 = var_22_0 + 0.3
			local var_22_12 = math.max(var_22_1, arg_19_1.talkMaxDuration)

			if var_22_11 <= arg_19_1.time_ and arg_19_1.time_ < var_22_11 + var_22_12 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_11) / var_22_12

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_11 + var_22_12 and arg_19_1.time_ < var_22_11 + var_22_12 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319841006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 319841006
		arg_25_1.duration_ = 1.266

		local var_25_0 = {
			zh = 1.266,
			ja = 1.1
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
				arg_25_0:Play319841007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = 0
			local var_28_1 = 0.05

			if var_28_0 < arg_25_1.time_ and arg_25_1.time_ <= var_28_0 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0
				arg_25_1.dialogCg_.alpha = 1

				arg_25_1.dialog_:SetActive(true)
				SetActive(arg_25_1.leftNameGo_, true)

				local var_28_2 = arg_25_1:FormatText(StoryNameCfg[6].name)

				arg_25_1.leftNameTxt_.text = var_28_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_25_1.leftNameTxt_.transform)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1.leftNameTxt_.text)
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_3 = arg_25_1:GetWordFromCfg(319841006)
				local var_28_4 = arg_25_1:FormatText(var_28_3.content)

				arg_25_1.text_.text = var_28_4

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841006", "story_v_out_319841.awb") ~= 0 then
					local var_28_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841006", "story_v_out_319841.awb") / 1000

					if var_28_8 + var_28_0 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_8 + var_28_0
					end

					if var_28_3.prefab_name ~= "" and arg_25_1.actors_[var_28_3.prefab_name] ~= nil then
						local var_28_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_25_1.actors_[var_28_3.prefab_name].transform, "story_v_out_319841", "319841006", "story_v_out_319841.awb")

						arg_25_1:RecordAudio("319841006", var_28_9)
						arg_25_1:RecordAudio("319841006", var_28_9)
					else
						arg_25_1:AudioAction("play", "voice", "story_v_out_319841", "319841006", "story_v_out_319841.awb")
					end

					arg_25_1:RecordHistoryTalkVoice("story_v_out_319841", "319841006", "story_v_out_319841.awb")
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
	Play319841007 = function(arg_29_0, arg_29_1)
		arg_29_1.time_ = 0
		arg_29_1.frameCnt_ = 0
		arg_29_1.state_ = "playing"
		arg_29_1.curTalkId_ = 319841007
		arg_29_1.duration_ = 7

		SetActive(arg_29_1.tipsGo_, false)

		function arg_29_1.onSingleLineFinish_()
			arg_29_1.onSingleLineUpdate_ = nil
			arg_29_1.onSingleLineFinish_ = nil
			arg_29_1.state_ = "waiting"
		end

		function arg_29_1.playNext_(arg_31_0)
			if arg_31_0 == 1 then
				arg_29_0:Play319841008(arg_29_1)
			end
		end

		function arg_29_1.onSingleLineUpdate_(arg_32_0)
			local var_32_0 = "D02a"

			if arg_29_1.bgs_[var_32_0] == nil then
				local var_32_1 = Object.Instantiate(arg_29_1.paintGo_)

				var_32_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_32_0)
				var_32_1.name = var_32_0
				var_32_1.transform.parent = arg_29_1.stage_.transform
				var_32_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_29_1.bgs_[var_32_0] = var_32_1
			end

			local var_32_2 = 0

			if var_32_2 < arg_29_1.time_ and arg_29_1.time_ <= var_32_2 + arg_32_0 then
				local var_32_3 = manager.ui.mainCamera.transform.localPosition
				local var_32_4 = Vector3.New(0, 0, 10) + Vector3.New(var_32_3.x, var_32_3.y, 0)
				local var_32_5 = arg_29_1.bgs_.D02a

				var_32_5.transform.localPosition = var_32_4
				var_32_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_32_6 = var_32_5:GetComponent("SpriteRenderer")

				if var_32_6 and var_32_6.sprite then
					local var_32_7 = (var_32_5.transform.localPosition - var_32_3).z
					local var_32_8 = manager.ui.mainCameraCom_
					local var_32_9 = 2 * var_32_7 * Mathf.Tan(var_32_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_32_10 = var_32_9 * var_32_8.aspect
					local var_32_11 = var_32_6.sprite.bounds.size.x
					local var_32_12 = var_32_6.sprite.bounds.size.y
					local var_32_13 = var_32_10 / var_32_11
					local var_32_14 = var_32_9 / var_32_12
					local var_32_15 = var_32_14 < var_32_13 and var_32_13 or var_32_14

					var_32_5.transform.localScale = Vector3.New(var_32_15, var_32_15, 0)
				end

				for iter_32_0, iter_32_1 in pairs(arg_29_1.bgs_) do
					if iter_32_0 ~= "D02a" then
						iter_32_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_32_16 = 0

			if var_32_16 < arg_29_1.time_ and arg_29_1.time_ <= var_32_16 + arg_32_0 then
				arg_29_1.allBtn_.enabled = false
			end

			local var_32_17 = 0.3

			if arg_29_1.time_ >= var_32_16 + var_32_17 and arg_29_1.time_ < var_32_16 + var_32_17 + arg_32_0 then
				arg_29_1.allBtn_.enabled = true
			end

			local var_32_18 = 0

			if var_32_18 < arg_29_1.time_ and arg_29_1.time_ <= var_32_18 + arg_32_0 then
				arg_29_1.mask_.enabled = true
				arg_29_1.mask_.raycastTarget = true

				arg_29_1:SetGaussion(false)
			end

			local var_32_19 = 2

			if var_32_18 <= arg_29_1.time_ and arg_29_1.time_ < var_32_18 + var_32_19 then
				local var_32_20 = (arg_29_1.time_ - var_32_18) / var_32_19
				local var_32_21 = Color.New(0, 0, 0)

				var_32_21.a = Mathf.Lerp(1, 0, var_32_20)
				arg_29_1.mask_.color = var_32_21
			end

			if arg_29_1.time_ >= var_32_18 + var_32_19 and arg_29_1.time_ < var_32_18 + var_32_19 + arg_32_0 then
				local var_32_22 = Color.New(0, 0, 0)
				local var_32_23 = 0

				arg_29_1.mask_.enabled = false
				var_32_22.a = var_32_23
				arg_29_1.mask_.color = var_32_22
			end

			local var_32_24 = 0
			local var_32_25 = 0.2

			if var_32_24 < arg_29_1.time_ and arg_29_1.time_ <= var_32_24 + arg_32_0 then
				local var_32_26 = "play"
				local var_32_27 = "music"

				arg_29_1:AudioAction(var_32_26, var_32_27, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_32_28 = 0.233333333333333
			local var_32_29 = 1

			if var_32_28 < arg_29_1.time_ and arg_29_1.time_ <= var_32_28 + arg_32_0 then
				local var_32_30 = "play"
				local var_32_31 = "music"

				arg_29_1:AudioAction(var_32_30, var_32_31, "bgm_activity_3_0_story_sad", "bgm_activity_3_0_story_sad", "bgm_activity_3_0_story_sad.awb")
			end

			if arg_29_1.frameCnt_ <= 1 then
				arg_29_1.dialog_:SetActive(false)
			end

			local var_32_32 = 2
			local var_32_33 = 0.825

			if var_32_32 < arg_29_1.time_ and arg_29_1.time_ <= var_32_32 + arg_32_0 then
				arg_29_1.talkMaxDuration = 0

				arg_29_1.dialog_:SetActive(true)

				local var_32_34 = LeanTween.value(arg_29_1.dialog_, 0, 1, 0.3)

				var_32_34:setOnUpdate(LuaHelper.FloatAction(function(arg_33_0)
					arg_29_1.dialogCg_.alpha = arg_33_0
				end))
				var_32_34:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_29_1.dialog_)
					var_32_34:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_29_1.duration_ = arg_29_1.duration_ + 0.3

				SetActive(arg_29_1.leftNameGo_, false)

				arg_29_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_29_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_29_1:RecordName(arg_29_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_29_1.iconTrs_.gameObject, false)
				arg_29_1.callingController_:SetSelectedState("normal")

				local var_32_35 = arg_29_1:GetWordFromCfg(319841007)
				local var_32_36 = arg_29_1:FormatText(var_32_35.content)

				arg_29_1.text_.text = var_32_36

				LuaForUtil.ClearLinePrefixSymbol(arg_29_1.text_)

				local var_32_37 = 33
				local var_32_38 = utf8.len(var_32_36)
				local var_32_39 = var_32_37 <= 0 and var_32_33 or var_32_33 * (var_32_38 / var_32_37)

				if var_32_39 > 0 and var_32_33 < var_32_39 then
					arg_29_1.talkMaxDuration = var_32_39
					var_32_32 = var_32_32 + 0.3

					if var_32_39 + var_32_32 > arg_29_1.duration_ then
						arg_29_1.duration_ = var_32_39 + var_32_32
					end
				end

				arg_29_1.text_.text = var_32_36
				arg_29_1.typewritter.percent = 0

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(false)
				arg_29_1:RecordContent(arg_29_1.text_.text)
			end

			local var_32_40 = var_32_32 + 0.3
			local var_32_41 = math.max(var_32_33, arg_29_1.talkMaxDuration)

			if var_32_40 <= arg_29_1.time_ and arg_29_1.time_ < var_32_40 + var_32_41 then
				arg_29_1.typewritter.percent = (arg_29_1.time_ - var_32_40) / var_32_41

				arg_29_1.typewritter:SetDirty()
			end

			if arg_29_1.time_ >= var_32_40 + var_32_41 and arg_29_1.time_ < var_32_40 + var_32_41 + arg_32_0 then
				arg_29_1.typewritter.percent = 1

				arg_29_1.typewritter:SetDirty()
				arg_29_1:ShowNextGo(true)
			end
		end
	end,
	Play319841008 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319841008
		arg_35_1.duration_ = 5

		SetActive(arg_35_1.tipsGo_, false)

		function arg_35_1.onSingleLineFinish_()
			arg_35_1.onSingleLineUpdate_ = nil
			arg_35_1.onSingleLineFinish_ = nil
			arg_35_1.state_ = "waiting"
		end

		function arg_35_1.playNext_(arg_37_0)
			if arg_37_0 == 1 then
				arg_35_0:Play319841009(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 1.075

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

				local var_38_2 = arg_35_1:GetWordFromCfg(319841008)
				local var_38_3 = arg_35_1:FormatText(var_38_2.content)

				arg_35_1.text_.text = var_38_3

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_4 = 43
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
	Play319841009 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319841009
		arg_39_1.duration_ = 3.833

		local var_39_0 = {
			zh = 3.466,
			ja = 3.833
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
				arg_39_0:Play319841010(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.325

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[640].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(319841009)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841009", "story_v_out_319841.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841009", "story_v_out_319841.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_319841", "319841009", "story_v_out_319841.awb")

						arg_39_1:RecordAudio("319841009", var_42_9)
						arg_39_1:RecordAudio("319841009", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319841", "319841009", "story_v_out_319841.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319841", "319841009", "story_v_out_319841.awb")
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
	Play319841010 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319841010
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play319841011(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.45

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

				local var_46_2 = arg_43_1:GetWordFromCfg(319841010)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 58
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
	Play319841011 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319841011
		arg_47_1.duration_ = 4.333

		local var_47_0 = {
			zh = 2.066,
			ja = 4.333
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
				arg_47_0:Play319841012(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = "1084ui_story"

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

			local var_50_4 = arg_47_1.actors_["1084ui_story"].transform
			local var_50_5 = 0

			if var_50_5 < arg_47_1.time_ and arg_47_1.time_ <= var_50_5 + arg_50_0 then
				arg_47_1.var_.moveOldPos1084ui_story = var_50_4.localPosition

				local var_50_6 = "1084ui_story"

				arg_47_1:ShowWeapon(arg_47_1.var_[var_50_6 .. "Animator"].transform, false)
			end

			local var_50_7 = 0.001

			if var_50_5 <= arg_47_1.time_ and arg_47_1.time_ < var_50_5 + var_50_7 then
				local var_50_8 = (arg_47_1.time_ - var_50_5) / var_50_7
				local var_50_9 = Vector3.New(0, -0.97, -6)

				var_50_4.localPosition = Vector3.Lerp(arg_47_1.var_.moveOldPos1084ui_story, var_50_9, var_50_8)

				local var_50_10 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_10.x, var_50_10.y, var_50_10.z)

				local var_50_11 = var_50_4.localEulerAngles

				var_50_11.z = 0
				var_50_11.x = 0
				var_50_4.localEulerAngles = var_50_11
			end

			if arg_47_1.time_ >= var_50_5 + var_50_7 and arg_47_1.time_ < var_50_5 + var_50_7 + arg_50_0 then
				var_50_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_50_12 = manager.ui.mainCamera.transform.position - var_50_4.position

				var_50_4.forward = Vector3.New(var_50_12.x, var_50_12.y, var_50_12.z)

				local var_50_13 = var_50_4.localEulerAngles

				var_50_13.z = 0
				var_50_13.x = 0
				var_50_4.localEulerAngles = var_50_13
			end

			local var_50_14 = arg_47_1.actors_["1084ui_story"]
			local var_50_15 = 0

			if var_50_15 < arg_47_1.time_ and arg_47_1.time_ <= var_50_15 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story == nil then
				arg_47_1.var_.characterEffect1084ui_story = var_50_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_16 = 0.200000002980232

			if var_50_15 <= arg_47_1.time_ and arg_47_1.time_ < var_50_15 + var_50_16 then
				local var_50_17 = (arg_47_1.time_ - var_50_15) / var_50_16

				if arg_47_1.var_.characterEffect1084ui_story then
					arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_47_1.time_ >= var_50_15 + var_50_16 and arg_47_1.time_ < var_50_15 + var_50_16 + arg_50_0 and arg_47_1.var_.characterEffect1084ui_story then
				arg_47_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_50_18 = 0

			if var_50_18 < arg_47_1.time_ and arg_47_1.time_ <= var_50_18 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_50_19 = 0

			if var_50_19 < arg_47_1.time_ and arg_47_1.time_ <= var_50_19 + arg_50_0 then
				arg_47_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_50_20 = 0
			local var_50_21 = 0.225

			if var_50_20 < arg_47_1.time_ and arg_47_1.time_ <= var_50_20 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_22 = arg_47_1:FormatText(StoryNameCfg[6].name)

				arg_47_1.leftNameTxt_.text = var_50_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_23 = arg_47_1:GetWordFromCfg(319841011)
				local var_50_24 = arg_47_1:FormatText(var_50_23.content)

				arg_47_1.text_.text = var_50_24

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_25 = 9
				local var_50_26 = utf8.len(var_50_24)
				local var_50_27 = var_50_25 <= 0 and var_50_21 or var_50_21 * (var_50_26 / var_50_25)

				if var_50_27 > 0 and var_50_21 < var_50_27 then
					arg_47_1.talkMaxDuration = var_50_27

					if var_50_27 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_27 + var_50_20
					end
				end

				arg_47_1.text_.text = var_50_24
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841011", "story_v_out_319841.awb") ~= 0 then
					local var_50_28 = manager.audio:GetVoiceLength("story_v_out_319841", "319841011", "story_v_out_319841.awb") / 1000

					if var_50_28 + var_50_20 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_28 + var_50_20
					end

					if var_50_23.prefab_name ~= "" and arg_47_1.actors_[var_50_23.prefab_name] ~= nil then
						local var_50_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_23.prefab_name].transform, "story_v_out_319841", "319841011", "story_v_out_319841.awb")

						arg_47_1:RecordAudio("319841011", var_50_29)
						arg_47_1:RecordAudio("319841011", var_50_29)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319841", "319841011", "story_v_out_319841.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319841", "319841011", "story_v_out_319841.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_30 = math.max(var_50_21, arg_47_1.talkMaxDuration)

			if var_50_20 <= arg_47_1.time_ and arg_47_1.time_ < var_50_20 + var_50_30 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_20) / var_50_30

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_20 + var_50_30 and arg_47_1.time_ < var_50_20 + var_50_30 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319841012 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319841012
		arg_51_1.duration_ = 5.3

		local var_51_0 = {
			zh = 5.3,
			ja = 4.333
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
				arg_51_0:Play319841013(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_54_1 = 0
			local var_54_2 = 0.475

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_3 = arg_51_1:FormatText(StoryNameCfg[6].name)

				arg_51_1.leftNameTxt_.text = var_54_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_4 = arg_51_1:GetWordFromCfg(319841012)
				local var_54_5 = arg_51_1:FormatText(var_54_4.content)

				arg_51_1.text_.text = var_54_5

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_6 = 19
				local var_54_7 = utf8.len(var_54_5)
				local var_54_8 = var_54_6 <= 0 and var_54_2 or var_54_2 * (var_54_7 / var_54_6)

				if var_54_8 > 0 and var_54_2 < var_54_8 then
					arg_51_1.talkMaxDuration = var_54_8

					if var_54_8 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_1
					end
				end

				arg_51_1.text_.text = var_54_5
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841012", "story_v_out_319841.awb") ~= 0 then
					local var_54_9 = manager.audio:GetVoiceLength("story_v_out_319841", "319841012", "story_v_out_319841.awb") / 1000

					if var_54_9 + var_54_1 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_9 + var_54_1
					end

					if var_54_4.prefab_name ~= "" and arg_51_1.actors_[var_54_4.prefab_name] ~= nil then
						local var_54_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_4.prefab_name].transform, "story_v_out_319841", "319841012", "story_v_out_319841.awb")

						arg_51_1:RecordAudio("319841012", var_54_10)
						arg_51_1:RecordAudio("319841012", var_54_10)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319841", "319841012", "story_v_out_319841.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319841", "319841012", "story_v_out_319841.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_11 = math.max(var_54_2, arg_51_1.talkMaxDuration)

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_11 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_1) / var_54_11

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_1 + var_54_11 and arg_51_1.time_ < var_54_1 + var_54_11 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319841013 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319841013
		arg_55_1.duration_ = 5

		SetActive(arg_55_1.tipsGo_, false)

		function arg_55_1.onSingleLineFinish_()
			arg_55_1.onSingleLineUpdate_ = nil
			arg_55_1.onSingleLineFinish_ = nil
			arg_55_1.state_ = "waiting"
		end

		function arg_55_1.playNext_(arg_57_0)
			if arg_57_0 == 1 then
				arg_55_0:Play319841014(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1084ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.200000002980232

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2

				if arg_55_1.var_.characterEffect1084ui_story then
					local var_58_4 = Mathf.Lerp(0, 0.5, var_58_3)

					arg_55_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_55_1.var_.characterEffect1084ui_story.fillRatio = var_58_4
				end
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story then
				local var_58_5 = 0.5

				arg_55_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_55_1.var_.characterEffect1084ui_story.fillRatio = var_58_5
			end

			local var_58_6 = 0
			local var_58_7 = 1.05

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

				local var_58_8 = arg_55_1:GetWordFromCfg(319841013)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 42
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
	Play319841014 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319841014
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play319841015(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 1.3

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

				local var_62_2 = arg_59_1:GetWordFromCfg(319841014)
				local var_62_3 = arg_59_1:FormatText(var_62_2.content)

				arg_59_1.text_.text = var_62_3

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_4 = 52
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
	Play319841015 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 319841015
		arg_63_1.duration_ = 3.46666666666667

		local var_63_0 = {
			zh = 3.46666666666667,
			ja = 3.06666666666667
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
				arg_63_0:Play319841016(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1084ui_story"].transform
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 then
				arg_63_1.var_.moveOldPos1084ui_story = var_66_0.localPosition
			end

			local var_66_2 = 0.001

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2
				local var_66_4 = Vector3.New(0, -0.97, -6)

				var_66_0.localPosition = Vector3.Lerp(arg_63_1.var_.moveOldPos1084ui_story, var_66_4, var_66_3)

				local var_66_5 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_5.x, var_66_5.y, var_66_5.z)

				local var_66_6 = var_66_0.localEulerAngles

				var_66_6.z = 0
				var_66_6.x = 0
				var_66_0.localEulerAngles = var_66_6
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 then
				var_66_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_66_7 = manager.ui.mainCamera.transform.position - var_66_0.position

				var_66_0.forward = Vector3.New(var_66_7.x, var_66_7.y, var_66_7.z)

				local var_66_8 = var_66_0.localEulerAngles

				var_66_8.z = 0
				var_66_8.x = 0
				var_66_0.localEulerAngles = var_66_8
			end

			local var_66_9 = arg_63_1.actors_["1084ui_story"]
			local var_66_10 = 0

			if var_66_10 < arg_63_1.time_ and arg_63_1.time_ <= var_66_10 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story == nil then
				arg_63_1.var_.characterEffect1084ui_story = var_66_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_11 = 0.200000002980232

			if var_66_10 <= arg_63_1.time_ and arg_63_1.time_ < var_66_10 + var_66_11 then
				local var_66_12 = (arg_63_1.time_ - var_66_10) / var_66_11

				if arg_63_1.var_.characterEffect1084ui_story then
					arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_63_1.time_ >= var_66_10 + var_66_11 and arg_63_1.time_ < var_66_10 + var_66_11 + arg_66_0 and arg_63_1.var_.characterEffect1084ui_story then
				arg_63_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_13 = 0.466666666666667
			local var_66_14 = 0.175

			if var_66_13 < arg_63_1.time_ and arg_63_1.time_ <= var_66_13 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_15 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_15:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_15:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_15:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_16 = arg_63_1:FormatText(StoryNameCfg[6].name)

				arg_63_1.leftNameTxt_.text = var_66_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_17 = arg_63_1:GetWordFromCfg(319841015)
				local var_66_18 = arg_63_1:FormatText(var_66_17.content)

				arg_63_1.text_.text = var_66_18

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_19 = 7
				local var_66_20 = utf8.len(var_66_18)
				local var_66_21 = var_66_19 <= 0 and var_66_14 or var_66_14 * (var_66_20 / var_66_19)

				if var_66_21 > 0 and var_66_14 < var_66_21 then
					arg_63_1.talkMaxDuration = var_66_21
					var_66_13 = var_66_13 + 0.3

					if var_66_21 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_21 + var_66_13
					end
				end

				arg_63_1.text_.text = var_66_18
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841015", "story_v_out_319841.awb") ~= 0 then
					local var_66_22 = manager.audio:GetVoiceLength("story_v_out_319841", "319841015", "story_v_out_319841.awb") / 1000

					if var_66_22 + var_66_13 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_22 + var_66_13
					end

					if var_66_17.prefab_name ~= "" and arg_63_1.actors_[var_66_17.prefab_name] ~= nil then
						local var_66_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_17.prefab_name].transform, "story_v_out_319841", "319841015", "story_v_out_319841.awb")

						arg_63_1:RecordAudio("319841015", var_66_23)
						arg_63_1:RecordAudio("319841015", var_66_23)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_319841", "319841015", "story_v_out_319841.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_319841", "319841015", "story_v_out_319841.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_24 = var_66_13 + 0.3
			local var_66_25 = math.max(var_66_14, arg_63_1.talkMaxDuration)

			if var_66_24 <= arg_63_1.time_ and arg_63_1.time_ < var_66_24 + var_66_25 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_24) / var_66_25

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_24 + var_66_25 and arg_63_1.time_ < var_66_24 + var_66_25 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play319841016 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319841016
		arg_69_1.duration_ = 5

		SetActive(arg_69_1.tipsGo_, false)

		function arg_69_1.onSingleLineFinish_()
			arg_69_1.onSingleLineUpdate_ = nil
			arg_69_1.onSingleLineFinish_ = nil
			arg_69_1.state_ = "waiting"
		end

		function arg_69_1.playNext_(arg_71_0)
			if arg_71_0 == 1 then
				arg_69_0:Play319841017(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1084ui_story"]
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story == nil then
				arg_69_1.var_.characterEffect1084ui_story = var_72_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_2 = 0.200000002980232

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2

				if arg_69_1.var_.characterEffect1084ui_story then
					local var_72_4 = Mathf.Lerp(0, 0.5, var_72_3)

					arg_69_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_69_1.var_.characterEffect1084ui_story.fillRatio = var_72_4
				end
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 and arg_69_1.var_.characterEffect1084ui_story then
				local var_72_5 = 0.5

				arg_69_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_69_1.var_.characterEffect1084ui_story.fillRatio = var_72_5
			end

			local var_72_6 = arg_69_1.actors_["1084ui_story"].transform
			local var_72_7 = 0

			if var_72_7 < arg_69_1.time_ and arg_69_1.time_ <= var_72_7 + arg_72_0 then
				arg_69_1.var_.moveOldPos1084ui_story = var_72_6.localPosition
			end

			local var_72_8 = 0.001

			if var_72_7 <= arg_69_1.time_ and arg_69_1.time_ < var_72_7 + var_72_8 then
				local var_72_9 = (arg_69_1.time_ - var_72_7) / var_72_8
				local var_72_10 = Vector3.New(0, 100, 0)

				var_72_6.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1084ui_story, var_72_10, var_72_9)

				local var_72_11 = manager.ui.mainCamera.transform.position - var_72_6.position

				var_72_6.forward = Vector3.New(var_72_11.x, var_72_11.y, var_72_11.z)

				local var_72_12 = var_72_6.localEulerAngles

				var_72_12.z = 0
				var_72_12.x = 0
				var_72_6.localEulerAngles = var_72_12
			end

			if arg_69_1.time_ >= var_72_7 + var_72_8 and arg_69_1.time_ < var_72_7 + var_72_8 + arg_72_0 then
				var_72_6.localPosition = Vector3.New(0, 100, 0)

				local var_72_13 = manager.ui.mainCamera.transform.position - var_72_6.position

				var_72_6.forward = Vector3.New(var_72_13.x, var_72_13.y, var_72_13.z)

				local var_72_14 = var_72_6.localEulerAngles

				var_72_14.z = 0
				var_72_14.x = 0
				var_72_6.localEulerAngles = var_72_14
			end

			local var_72_15 = 0
			local var_72_16 = 1

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, false)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_17 = arg_69_1:GetWordFromCfg(319841016)
				local var_72_18 = arg_69_1:FormatText(var_72_17.content)

				arg_69_1.text_.text = var_72_18

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_19 = 40
				local var_72_20 = utf8.len(var_72_18)
				local var_72_21 = var_72_19 <= 0 and var_72_16 or var_72_16 * (var_72_20 / var_72_19)

				if var_72_21 > 0 and var_72_16 < var_72_21 then
					arg_69_1.talkMaxDuration = var_72_21

					if var_72_21 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_21 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_18
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)
				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_22 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_22 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_22

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_22 and arg_69_1.time_ < var_72_15 + var_72_22 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319841017 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319841017
		arg_73_1.duration_ = 7.93333333333333

		SetActive(arg_73_1.tipsGo_, false)

		function arg_73_1.onSingleLineFinish_()
			arg_73_1.onSingleLineUpdate_ = nil
			arg_73_1.onSingleLineFinish_ = nil
			arg_73_1.state_ = "waiting"
		end

		function arg_73_1.playNext_(arg_75_0)
			if arg_75_0 == 1 then
				arg_73_0:Play319841018(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "ST74"

			if arg_73_1.bgs_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(arg_73_1.paintGo_)

				var_76_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_76_0)
				var_76_1.name = var_76_0
				var_76_1.transform.parent = arg_73_1.stage_.transform
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.bgs_[var_76_0] = var_76_1
			end

			local var_76_2 = 1.225

			if var_76_2 < arg_73_1.time_ and arg_73_1.time_ <= var_76_2 + arg_76_0 then
				local var_76_3 = manager.ui.mainCamera.transform.localPosition
				local var_76_4 = Vector3.New(0, 0, 10) + Vector3.New(var_76_3.x, var_76_3.y, 0)
				local var_76_5 = arg_73_1.bgs_.ST74

				var_76_5.transform.localPosition = var_76_4
				var_76_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_76_6 = var_76_5:GetComponent("SpriteRenderer")

				if var_76_6 and var_76_6.sprite then
					local var_76_7 = (var_76_5.transform.localPosition - var_76_3).z
					local var_76_8 = manager.ui.mainCameraCom_
					local var_76_9 = 2 * var_76_7 * Mathf.Tan(var_76_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_76_10 = var_76_9 * var_76_8.aspect
					local var_76_11 = var_76_6.sprite.bounds.size.x
					local var_76_12 = var_76_6.sprite.bounds.size.y
					local var_76_13 = var_76_10 / var_76_11
					local var_76_14 = var_76_9 / var_76_12
					local var_76_15 = var_76_14 < var_76_13 and var_76_13 or var_76_14

					var_76_5.transform.localScale = Vector3.New(var_76_15, var_76_15, 0)
				end

				for iter_76_0, iter_76_1 in pairs(arg_73_1.bgs_) do
					if iter_76_0 ~= "ST74" then
						iter_76_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_76_16 = 0

			if var_76_16 < arg_73_1.time_ and arg_73_1.time_ <= var_76_16 + arg_76_0 then
				arg_73_1.allBtn_.enabled = false
			end

			local var_76_17 = 0.3

			if arg_73_1.time_ >= var_76_16 + var_76_17 and arg_73_1.time_ < var_76_16 + var_76_17 + arg_76_0 then
				arg_73_1.allBtn_.enabled = true
			end

			local var_76_18 = 0

			if var_76_18 < arg_73_1.time_ and arg_73_1.time_ <= var_76_18 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = true

				arg_73_1:SetGaussion(false)
			end

			local var_76_19 = 1.225

			if var_76_18 <= arg_73_1.time_ and arg_73_1.time_ < var_76_18 + var_76_19 then
				local var_76_20 = (arg_73_1.time_ - var_76_18) / var_76_19
				local var_76_21 = Color.New(0, 0, 0)

				var_76_21.a = Mathf.Lerp(0, 1, var_76_20)
				arg_73_1.mask_.color = var_76_21
			end

			if arg_73_1.time_ >= var_76_18 + var_76_19 and arg_73_1.time_ < var_76_18 + var_76_19 + arg_76_0 then
				local var_76_22 = Color.New(0, 0, 0)

				var_76_22.a = 1
				arg_73_1.mask_.color = var_76_22
			end

			local var_76_23 = 1.225

			if var_76_23 < arg_73_1.time_ and arg_73_1.time_ <= var_76_23 + arg_76_0 then
				arg_73_1.mask_.enabled = true
				arg_73_1.mask_.raycastTarget = true

				arg_73_1:SetGaussion(false)
			end

			local var_76_24 = 2

			if var_76_23 <= arg_73_1.time_ and arg_73_1.time_ < var_76_23 + var_76_24 then
				local var_76_25 = (arg_73_1.time_ - var_76_23) / var_76_24
				local var_76_26 = Color.New(0, 0, 0)

				var_76_26.a = Mathf.Lerp(1, 0, var_76_25)
				arg_73_1.mask_.color = var_76_26
			end

			if arg_73_1.time_ >= var_76_23 + var_76_24 and arg_73_1.time_ < var_76_23 + var_76_24 + arg_76_0 then
				local var_76_27 = Color.New(0, 0, 0)
				local var_76_28 = 0

				arg_73_1.mask_.enabled = false
				var_76_27.a = var_76_28
				arg_73_1.mask_.color = var_76_27
			end

			if arg_73_1.frameCnt_ <= 1 then
				arg_73_1.dialog_:SetActive(false)
			end

			local var_76_29 = 2.93333333333333
			local var_76_30 = 1.225

			if var_76_29 < arg_73_1.time_ and arg_73_1.time_ <= var_76_29 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0

				arg_73_1.dialog_:SetActive(true)

				local var_76_31 = LeanTween.value(arg_73_1.dialog_, 0, 1, 0.3)

				var_76_31:setOnUpdate(LuaHelper.FloatAction(function(arg_77_0)
					arg_73_1.dialogCg_.alpha = arg_77_0
				end))
				var_76_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_73_1.dialog_)
					var_76_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_73_1.duration_ = arg_73_1.duration_ + 0.3

				SetActive(arg_73_1.leftNameGo_, false)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_32 = arg_73_1:GetWordFromCfg(319841017)
				local var_76_33 = arg_73_1:FormatText(var_76_32.content)

				arg_73_1.text_.text = var_76_33

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_34 = 49
				local var_76_35 = utf8.len(var_76_33)
				local var_76_36 = var_76_34 <= 0 and var_76_30 or var_76_30 * (var_76_35 / var_76_34)

				if var_76_36 > 0 and var_76_30 < var_76_36 then
					arg_73_1.talkMaxDuration = var_76_36
					var_76_29 = var_76_29 + 0.3

					if var_76_36 + var_76_29 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_36 + var_76_29
					end
				end

				arg_73_1.text_.text = var_76_33
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)
				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_37 = var_76_29 + 0.3
			local var_76_38 = math.max(var_76_30, arg_73_1.talkMaxDuration)

			if var_76_37 <= arg_73_1.time_ and arg_73_1.time_ < var_76_37 + var_76_38 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_37) / var_76_38

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_37 + var_76_38 and arg_73_1.time_ < var_76_37 + var_76_38 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319841018 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 319841018
		arg_79_1.duration_ = 2.566

		local var_79_0 = {
			zh = 2.433,
			ja = 2.566
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
				arg_79_0:Play319841019(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_1 = 0

			if var_82_1 < arg_79_1.time_ and arg_79_1.time_ <= var_82_1 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_0.localPosition
			end

			local var_82_2 = 0.001

			if var_82_1 <= arg_79_1.time_ and arg_79_1.time_ < var_82_1 + var_82_2 then
				local var_82_3 = (arg_79_1.time_ - var_82_1) / var_82_2
				local var_82_4 = Vector3.New(0, -0.97, -6)

				var_82_0.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_4, var_82_3)

				local var_82_5 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_5.x, var_82_5.y, var_82_5.z)

				local var_82_6 = var_82_0.localEulerAngles

				var_82_6.z = 0
				var_82_6.x = 0
				var_82_0.localEulerAngles = var_82_6
			end

			if arg_79_1.time_ >= var_82_1 + var_82_2 and arg_79_1.time_ < var_82_1 + var_82_2 + arg_82_0 then
				var_82_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_82_7 = manager.ui.mainCamera.transform.position - var_82_0.position

				var_82_0.forward = Vector3.New(var_82_7.x, var_82_7.y, var_82_7.z)

				local var_82_8 = var_82_0.localEulerAngles

				var_82_8.z = 0
				var_82_8.x = 0
				var_82_0.localEulerAngles = var_82_8
			end

			local var_82_9 = arg_79_1.actors_["1084ui_story"]
			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_11 = 0.200000002980232

			if var_82_10 <= arg_79_1.time_ and arg_79_1.time_ < var_82_10 + var_82_11 then
				local var_82_12 = (arg_79_1.time_ - var_82_10) / var_82_11

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_10 + var_82_11 and arg_79_1.time_ < var_82_10 + var_82_11 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_82_15 = 0
			local var_82_16 = 0.225

			if var_82_15 < arg_79_1.time_ and arg_79_1.time_ <= var_82_15 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_17 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_18 = arg_79_1:GetWordFromCfg(319841018)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 9
				local var_82_21 = utf8.len(var_82_19)
				local var_82_22 = var_82_20 <= 0 and var_82_16 or var_82_16 * (var_82_21 / var_82_20)

				if var_82_22 > 0 and var_82_16 < var_82_22 then
					arg_79_1.talkMaxDuration = var_82_22

					if var_82_22 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_22 + var_82_15
					end
				end

				arg_79_1.text_.text = var_82_19
				arg_79_1.typewritter.percent = 0

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841018", "story_v_out_319841.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_319841", "319841018", "story_v_out_319841.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_319841", "319841018", "story_v_out_319841.awb")

						arg_79_1:RecordAudio("319841018", var_82_24)
						arg_79_1:RecordAudio("319841018", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_319841", "319841018", "story_v_out_319841.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_319841", "319841018", "story_v_out_319841.awb")
				end

				arg_79_1:RecordContent(arg_79_1.text_.text)
			end

			local var_82_25 = math.max(var_82_16, arg_79_1.talkMaxDuration)

			if var_82_15 <= arg_79_1.time_ and arg_79_1.time_ < var_82_15 + var_82_25 then
				arg_79_1.typewritter.percent = (arg_79_1.time_ - var_82_15) / var_82_25

				arg_79_1.typewritter:SetDirty()
			end

			if arg_79_1.time_ >= var_82_15 + var_82_25 and arg_79_1.time_ < var_82_15 + var_82_25 + arg_82_0 then
				arg_79_1.typewritter.percent = 1

				arg_79_1.typewritter:SetDirty()
				arg_79_1:ShowNextGo(true)
			end
		end
	end,
	Play319841019 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 319841019
		arg_83_1.duration_ = 5

		SetActive(arg_83_1.tipsGo_, false)

		function arg_83_1.onSingleLineFinish_()
			arg_83_1.onSingleLineUpdate_ = nil
			arg_83_1.onSingleLineFinish_ = nil
			arg_83_1.state_ = "waiting"
		end

		function arg_83_1.playNext_(arg_85_0)
			if arg_85_0 == 1 then
				arg_83_0:Play319841020(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.200000002980232

			if var_86_1 <= arg_83_1.time_ and arg_83_1.time_ < var_86_1 + var_86_2 then
				local var_86_3 = (arg_83_1.time_ - var_86_1) / var_86_2

				if arg_83_1.var_.characterEffect1084ui_story then
					local var_86_4 = Mathf.Lerp(0, 0.5, var_86_3)

					arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_4
				end
			end

			if arg_83_1.time_ >= var_86_1 + var_86_2 and arg_83_1.time_ < var_86_1 + var_86_2 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story then
				local var_86_5 = 0.5

				arg_83_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_83_1.var_.characterEffect1084ui_story.fillRatio = var_86_5
			end

			local var_86_6 = 0
			local var_86_7 = 0.575

			if var_86_6 < arg_83_1.time_ and arg_83_1.time_ <= var_86_6 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, false)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_8 = arg_83_1:GetWordFromCfg(319841019)
				local var_86_9 = arg_83_1:FormatText(var_86_8.content)

				arg_83_1.text_.text = var_86_9

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_10 = 23
				local var_86_11 = utf8.len(var_86_9)
				local var_86_12 = var_86_10 <= 0 and var_86_7 or var_86_7 * (var_86_11 / var_86_10)

				if var_86_12 > 0 and var_86_7 < var_86_12 then
					arg_83_1.talkMaxDuration = var_86_12

					if var_86_12 + var_86_6 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_12 + var_86_6
					end
				end

				arg_83_1.text_.text = var_86_9
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)
				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_13 = math.max(var_86_7, arg_83_1.talkMaxDuration)

			if var_86_6 <= arg_83_1.time_ and arg_83_1.time_ < var_86_6 + var_86_13 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_6) / var_86_13

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_6 + var_86_13 and arg_83_1.time_ < var_86_6 + var_86_13 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play319841020 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 319841020
		arg_87_1.duration_ = 5.3

		local var_87_0 = {
			zh = 3.233,
			ja = 5.3
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
				arg_87_0:Play319841021(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = "10058ui_story"

			if arg_87_1.actors_[var_90_0] == nil then
				local var_90_1 = Object.Instantiate(Asset.Load("Char/" .. var_90_0), arg_87_1.stage_.transform)

				var_90_1.name = var_90_0
				var_90_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_87_1.actors_[var_90_0] = var_90_1

				local var_90_2 = var_90_1:GetComponentInChildren(typeof(CharacterEffect))

				var_90_2.enabled = true

				local var_90_3 = GameObjectTools.GetOrAddComponent(var_90_1, typeof(DynamicBoneHelper))

				if var_90_3 then
					var_90_3:EnableDynamicBone(false)
				end

				arg_87_1:ShowWeapon(var_90_2.transform, false)

				arg_87_1.var_[var_90_0 .. "Animator"] = var_90_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_87_1.var_[var_90_0 .. "Animator"].applyRootMotion = true
				arg_87_1.var_[var_90_0 .. "LipSync"] = var_90_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_90_4 = arg_87_1.actors_["10058ui_story"].transform
			local var_90_5 = 0

			if var_90_5 < arg_87_1.time_ and arg_87_1.time_ <= var_90_5 + arg_90_0 then
				arg_87_1.var_.moveOldPos10058ui_story = var_90_4.localPosition
			end

			local var_90_6 = 0.001

			if var_90_5 <= arg_87_1.time_ and arg_87_1.time_ < var_90_5 + var_90_6 then
				local var_90_7 = (arg_87_1.time_ - var_90_5) / var_90_6
				local var_90_8 = Vector3.New(0.7, -0.98, -6.1)

				var_90_4.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos10058ui_story, var_90_8, var_90_7)

				local var_90_9 = manager.ui.mainCamera.transform.position - var_90_4.position

				var_90_4.forward = Vector3.New(var_90_9.x, var_90_9.y, var_90_9.z)

				local var_90_10 = var_90_4.localEulerAngles

				var_90_10.z = 0
				var_90_10.x = 0
				var_90_4.localEulerAngles = var_90_10
			end

			if arg_87_1.time_ >= var_90_5 + var_90_6 and arg_87_1.time_ < var_90_5 + var_90_6 + arg_90_0 then
				var_90_4.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_90_11 = manager.ui.mainCamera.transform.position - var_90_4.position

				var_90_4.forward = Vector3.New(var_90_11.x, var_90_11.y, var_90_11.z)

				local var_90_12 = var_90_4.localEulerAngles

				var_90_12.z = 0
				var_90_12.x = 0
				var_90_4.localEulerAngles = var_90_12
			end

			local var_90_13 = arg_87_1.actors_["10058ui_story"]
			local var_90_14 = 0

			if var_90_14 < arg_87_1.time_ and arg_87_1.time_ <= var_90_14 + arg_90_0 and arg_87_1.var_.characterEffect10058ui_story == nil then
				arg_87_1.var_.characterEffect10058ui_story = var_90_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_90_15 = 0.200000002980232

			if var_90_14 <= arg_87_1.time_ and arg_87_1.time_ < var_90_14 + var_90_15 then
				local var_90_16 = (arg_87_1.time_ - var_90_14) / var_90_15

				if arg_87_1.var_.characterEffect10058ui_story then
					arg_87_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_87_1.time_ >= var_90_14 + var_90_15 and arg_87_1.time_ < var_90_14 + var_90_15 + arg_90_0 and arg_87_1.var_.characterEffect10058ui_story then
				arg_87_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_90_17 = 0

			if var_90_17 < arg_87_1.time_ and arg_87_1.time_ <= var_90_17 + arg_90_0 then
				arg_87_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_90_18 = 0

			if var_90_18 < arg_87_1.time_ and arg_87_1.time_ <= var_90_18 + arg_90_0 then
				arg_87_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_90_19 = arg_87_1.actors_["1084ui_story"].transform
			local var_90_20 = 0

			if var_90_20 < arg_87_1.time_ and arg_87_1.time_ <= var_90_20 + arg_90_0 then
				arg_87_1.var_.moveOldPos1084ui_story = var_90_19.localPosition
			end

			local var_90_21 = 0.001

			if var_90_20 <= arg_87_1.time_ and arg_87_1.time_ < var_90_20 + var_90_21 then
				local var_90_22 = (arg_87_1.time_ - var_90_20) / var_90_21
				local var_90_23 = Vector3.New(-0.7, -0.97, -6)

				var_90_19.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1084ui_story, var_90_23, var_90_22)

				local var_90_24 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_24.x, var_90_24.y, var_90_24.z)

				local var_90_25 = var_90_19.localEulerAngles

				var_90_25.z = 0
				var_90_25.x = 0
				var_90_19.localEulerAngles = var_90_25
			end

			if arg_87_1.time_ >= var_90_20 + var_90_21 and arg_87_1.time_ < var_90_20 + var_90_21 + arg_90_0 then
				var_90_19.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_90_26 = manager.ui.mainCamera.transform.position - var_90_19.position

				var_90_19.forward = Vector3.New(var_90_26.x, var_90_26.y, var_90_26.z)

				local var_90_27 = var_90_19.localEulerAngles

				var_90_27.z = 0
				var_90_27.x = 0
				var_90_19.localEulerAngles = var_90_27
			end

			local var_90_28 = 0
			local var_90_29 = 0.425

			if var_90_28 < arg_87_1.time_ and arg_87_1.time_ <= var_90_28 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, true)

				local var_90_30 = arg_87_1:FormatText(StoryNameCfg[471].name)

				arg_87_1.leftNameTxt_.text = var_90_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_87_1.leftNameTxt_.transform)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1.leftNameTxt_.text)
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_31 = arg_87_1:GetWordFromCfg(319841020)
				local var_90_32 = arg_87_1:FormatText(var_90_31.content)

				arg_87_1.text_.text = var_90_32

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_33 = 17
				local var_90_34 = utf8.len(var_90_32)
				local var_90_35 = var_90_33 <= 0 and var_90_29 or var_90_29 * (var_90_34 / var_90_33)

				if var_90_35 > 0 and var_90_29 < var_90_35 then
					arg_87_1.talkMaxDuration = var_90_35

					if var_90_35 + var_90_28 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_35 + var_90_28
					end
				end

				arg_87_1.text_.text = var_90_32
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841020", "story_v_out_319841.awb") ~= 0 then
					local var_90_36 = manager.audio:GetVoiceLength("story_v_out_319841", "319841020", "story_v_out_319841.awb") / 1000

					if var_90_36 + var_90_28 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_36 + var_90_28
					end

					if var_90_31.prefab_name ~= "" and arg_87_1.actors_[var_90_31.prefab_name] ~= nil then
						local var_90_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_87_1.actors_[var_90_31.prefab_name].transform, "story_v_out_319841", "319841020", "story_v_out_319841.awb")

						arg_87_1:RecordAudio("319841020", var_90_37)
						arg_87_1:RecordAudio("319841020", var_90_37)
					else
						arg_87_1:AudioAction("play", "voice", "story_v_out_319841", "319841020", "story_v_out_319841.awb")
					end

					arg_87_1:RecordHistoryTalkVoice("story_v_out_319841", "319841020", "story_v_out_319841.awb")
				end

				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_38 = math.max(var_90_29, arg_87_1.talkMaxDuration)

			if var_90_28 <= arg_87_1.time_ and arg_87_1.time_ < var_90_28 + var_90_38 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_28) / var_90_38

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_28 + var_90_38 and arg_87_1.time_ < var_90_28 + var_90_38 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play319841021 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 319841021
		arg_91_1.duration_ = 4.2

		local var_91_0 = {
			zh = 4.2,
			ja = 3.133
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
				arg_91_0:Play319841022(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 0.425

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[471].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(319841021)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841021", "story_v_out_319841.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841021", "story_v_out_319841.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_319841", "319841021", "story_v_out_319841.awb")

						arg_91_1:RecordAudio("319841021", var_94_9)
						arg_91_1:RecordAudio("319841021", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_319841", "319841021", "story_v_out_319841.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_319841", "319841021", "story_v_out_319841.awb")
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
	Play319841022 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 319841022
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play319841023(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["10058ui_story"]
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 and arg_95_1.var_.characterEffect10058ui_story == nil then
				arg_95_1.var_.characterEffect10058ui_story = var_98_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_2 = 0.200000002980232

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2

				if arg_95_1.var_.characterEffect10058ui_story then
					local var_98_4 = Mathf.Lerp(0, 0.5, var_98_3)

					arg_95_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_95_1.var_.characterEffect10058ui_story.fillRatio = var_98_4
				end
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 and arg_95_1.var_.characterEffect10058ui_story then
				local var_98_5 = 0.5

				arg_95_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_95_1.var_.characterEffect10058ui_story.fillRatio = var_98_5
			end

			local var_98_6 = 0
			local var_98_7 = 0.6

			if var_98_6 < arg_95_1.time_ and arg_95_1.time_ <= var_98_6 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_8 = arg_95_1:GetWordFromCfg(319841022)
				local var_98_9 = arg_95_1:FormatText(var_98_8.content)

				arg_95_1.text_.text = var_98_9

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_10 = 24
				local var_98_11 = utf8.len(var_98_9)
				local var_98_12 = var_98_10 <= 0 and var_98_7 or var_98_7 * (var_98_11 / var_98_10)

				if var_98_12 > 0 and var_98_7 < var_98_12 then
					arg_95_1.talkMaxDuration = var_98_12

					if var_98_12 + var_98_6 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_12 + var_98_6
					end
				end

				arg_95_1.text_.text = var_98_9
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_13 = math.max(var_98_7, arg_95_1.talkMaxDuration)

			if var_98_6 <= arg_95_1.time_ and arg_95_1.time_ < var_98_6 + var_98_13 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_6) / var_98_13

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_6 + var_98_13 and arg_95_1.time_ < var_98_6 + var_98_13 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play319841023 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 319841023
		arg_99_1.duration_ = 10.066

		local var_99_0 = {
			zh = 7.866,
			ja = 10.066
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
				arg_99_0:Play319841024(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["10058ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect10058ui_story == nil then
				arg_99_1.var_.characterEffect10058ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.200000002980232

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect10058ui_story then
					arg_99_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect10058ui_story then
				arg_99_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_102_4 = 0
			local var_102_5 = 0.85

			if var_102_4 < arg_99_1.time_ and arg_99_1.time_ <= var_102_4 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_6 = arg_99_1:FormatText(StoryNameCfg[471].name)

				arg_99_1.leftNameTxt_.text = var_102_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_7 = arg_99_1:GetWordFromCfg(319841023)
				local var_102_8 = arg_99_1:FormatText(var_102_7.content)

				arg_99_1.text_.text = var_102_8

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_9 = 34
				local var_102_10 = utf8.len(var_102_8)
				local var_102_11 = var_102_9 <= 0 and var_102_5 or var_102_5 * (var_102_10 / var_102_9)

				if var_102_11 > 0 and var_102_5 < var_102_11 then
					arg_99_1.talkMaxDuration = var_102_11

					if var_102_11 + var_102_4 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_11 + var_102_4
					end
				end

				arg_99_1.text_.text = var_102_8
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841023", "story_v_out_319841.awb") ~= 0 then
					local var_102_12 = manager.audio:GetVoiceLength("story_v_out_319841", "319841023", "story_v_out_319841.awb") / 1000

					if var_102_12 + var_102_4 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_12 + var_102_4
					end

					if var_102_7.prefab_name ~= "" and arg_99_1.actors_[var_102_7.prefab_name] ~= nil then
						local var_102_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_7.prefab_name].transform, "story_v_out_319841", "319841023", "story_v_out_319841.awb")

						arg_99_1:RecordAudio("319841023", var_102_13)
						arg_99_1:RecordAudio("319841023", var_102_13)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_319841", "319841023", "story_v_out_319841.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_319841", "319841023", "story_v_out_319841.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_14 = math.max(var_102_5, arg_99_1.talkMaxDuration)

			if var_102_4 <= arg_99_1.time_ and arg_99_1.time_ < var_102_4 + var_102_14 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_4) / var_102_14

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_4 + var_102_14 and arg_99_1.time_ < var_102_4 + var_102_14 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play319841024 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 319841024
		arg_103_1.duration_ = 7.7

		local var_103_0 = {
			zh = 3.733,
			ja = 7.7
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
				arg_103_0:Play319841025(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["10058ui_story"].transform
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 then
				arg_103_1.var_.moveOldPos10058ui_story = var_106_0.localPosition
			end

			local var_106_2 = 0.001

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2
				local var_106_4 = Vector3.New(0.7, -0.98, -6.1)

				var_106_0.localPosition = Vector3.Lerp(arg_103_1.var_.moveOldPos10058ui_story, var_106_4, var_106_3)

				local var_106_5 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_5.x, var_106_5.y, var_106_5.z)

				local var_106_6 = var_106_0.localEulerAngles

				var_106_6.z = 0
				var_106_6.x = 0
				var_106_0.localEulerAngles = var_106_6
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 then
				var_106_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_106_7 = manager.ui.mainCamera.transform.position - var_106_0.position

				var_106_0.forward = Vector3.New(var_106_7.x, var_106_7.y, var_106_7.z)

				local var_106_8 = var_106_0.localEulerAngles

				var_106_8.z = 0
				var_106_8.x = 0
				var_106_0.localEulerAngles = var_106_8
			end

			local var_106_9 = arg_103_1.actors_["10058ui_story"]
			local var_106_10 = 0

			if var_106_10 < arg_103_1.time_ and arg_103_1.time_ <= var_106_10 + arg_106_0 and arg_103_1.var_.characterEffect10058ui_story == nil then
				arg_103_1.var_.characterEffect10058ui_story = var_106_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_11 = 0.200000002980232

			if var_106_10 <= arg_103_1.time_ and arg_103_1.time_ < var_106_10 + var_106_11 then
				local var_106_12 = (arg_103_1.time_ - var_106_10) / var_106_11

				if arg_103_1.var_.characterEffect10058ui_story then
					arg_103_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_10 + var_106_11 and arg_103_1.time_ < var_106_10 + var_106_11 + arg_106_0 and arg_103_1.var_.characterEffect10058ui_story then
				arg_103_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_106_13 = 0

			if var_106_13 < arg_103_1.time_ and arg_103_1.time_ <= var_106_13 + arg_106_0 then
				arg_103_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_106_14 = 0

			if var_106_14 < arg_103_1.time_ and arg_103_1.time_ <= var_106_14 + arg_106_0 then
				arg_103_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_106_15 = 0
			local var_106_16 = 0.45

			if var_106_15 < arg_103_1.time_ and arg_103_1.time_ <= var_106_15 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_17 = arg_103_1:FormatText(StoryNameCfg[471].name)

				arg_103_1.leftNameTxt_.text = var_106_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_18 = arg_103_1:GetWordFromCfg(319841024)
				local var_106_19 = arg_103_1:FormatText(var_106_18.content)

				arg_103_1.text_.text = var_106_19

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_20 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841024", "story_v_out_319841.awb") ~= 0 then
					local var_106_23 = manager.audio:GetVoiceLength("story_v_out_319841", "319841024", "story_v_out_319841.awb") / 1000

					if var_106_23 + var_106_15 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_23 + var_106_15
					end

					if var_106_18.prefab_name ~= "" and arg_103_1.actors_[var_106_18.prefab_name] ~= nil then
						local var_106_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_18.prefab_name].transform, "story_v_out_319841", "319841024", "story_v_out_319841.awb")

						arg_103_1:RecordAudio("319841024", var_106_24)
						arg_103_1:RecordAudio("319841024", var_106_24)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_319841", "319841024", "story_v_out_319841.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_319841", "319841024", "story_v_out_319841.awb")
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
	Play319841025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 319841025
		arg_107_1.duration_ = 9.89933333333333

		local var_107_0 = {
			zh = 7.63333333333333,
			ja = 9.89933333333333
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
				arg_107_0:Play319841026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = "ST72"

			if arg_107_1.bgs_[var_110_0] == nil then
				local var_110_1 = Object.Instantiate(arg_107_1.paintGo_)

				var_110_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_110_0)
				var_110_1.name = var_110_0
				var_110_1.transform.parent = arg_107_1.stage_.transform
				var_110_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.bgs_[var_110_0] = var_110_1
			end

			local var_110_2 = 1.33333333333333

			if var_110_2 < arg_107_1.time_ and arg_107_1.time_ <= var_110_2 + arg_110_0 then
				local var_110_3 = manager.ui.mainCamera.transform.localPosition
				local var_110_4 = Vector3.New(0, 0, 10) + Vector3.New(var_110_3.x, var_110_3.y, 0)
				local var_110_5 = arg_107_1.bgs_.ST72

				var_110_5.transform.localPosition = var_110_4
				var_110_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_110_6 = var_110_5:GetComponent("SpriteRenderer")

				if var_110_6 and var_110_6.sprite then
					local var_110_7 = (var_110_5.transform.localPosition - var_110_3).z
					local var_110_8 = manager.ui.mainCameraCom_
					local var_110_9 = 2 * var_110_7 * Mathf.Tan(var_110_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_110_10 = var_110_9 * var_110_8.aspect
					local var_110_11 = var_110_6.sprite.bounds.size.x
					local var_110_12 = var_110_6.sprite.bounds.size.y
					local var_110_13 = var_110_10 / var_110_11
					local var_110_14 = var_110_9 / var_110_12
					local var_110_15 = var_110_14 < var_110_13 and var_110_13 or var_110_14

					var_110_5.transform.localScale = Vector3.New(var_110_15, var_110_15, 0)
				end

				for iter_110_0, iter_110_1 in pairs(arg_107_1.bgs_) do
					if iter_110_0 ~= "ST72" then
						iter_110_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_110_16 = 0

			if var_110_16 < arg_107_1.time_ and arg_107_1.time_ <= var_110_16 + arg_110_0 then
				arg_107_1.allBtn_.enabled = false
			end

			local var_110_17 = 0.3

			if arg_107_1.time_ >= var_110_16 + var_110_17 and arg_107_1.time_ < var_110_16 + var_110_17 + arg_110_0 then
				arg_107_1.allBtn_.enabled = true
			end

			local var_110_18 = 0

			if var_110_18 < arg_107_1.time_ and arg_107_1.time_ <= var_110_18 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_19 = 1.33333333333333

			if var_110_18 <= arg_107_1.time_ and arg_107_1.time_ < var_110_18 + var_110_19 then
				local var_110_20 = (arg_107_1.time_ - var_110_18) / var_110_19
				local var_110_21 = Color.New(0, 0, 0)

				var_110_21.a = Mathf.Lerp(0, 1, var_110_20)
				arg_107_1.mask_.color = var_110_21
			end

			if arg_107_1.time_ >= var_110_18 + var_110_19 and arg_107_1.time_ < var_110_18 + var_110_19 + arg_110_0 then
				local var_110_22 = Color.New(0, 0, 0)

				var_110_22.a = 1
				arg_107_1.mask_.color = var_110_22
			end

			local var_110_23 = 1.33333333333333

			if var_110_23 < arg_107_1.time_ and arg_107_1.time_ <= var_110_23 + arg_110_0 then
				arg_107_1.mask_.enabled = true
				arg_107_1.mask_.raycastTarget = true

				arg_107_1:SetGaussion(false)
			end

			local var_110_24 = 2

			if var_110_23 <= arg_107_1.time_ and arg_107_1.time_ < var_110_23 + var_110_24 then
				local var_110_25 = (arg_107_1.time_ - var_110_23) / var_110_24
				local var_110_26 = Color.New(0, 0, 0)

				var_110_26.a = Mathf.Lerp(1, 0, var_110_25)
				arg_107_1.mask_.color = var_110_26
			end

			if arg_107_1.time_ >= var_110_23 + var_110_24 and arg_107_1.time_ < var_110_23 + var_110_24 + arg_110_0 then
				local var_110_27 = Color.New(0, 0, 0)
				local var_110_28 = 0

				arg_107_1.mask_.enabled = false
				var_110_27.a = var_110_28
				arg_107_1.mask_.color = var_110_27
			end

			local var_110_29 = "10069ui_story"

			if arg_107_1.actors_[var_110_29] == nil then
				local var_110_30 = Object.Instantiate(Asset.Load("Char/" .. var_110_29), arg_107_1.stage_.transform)

				var_110_30.name = var_110_29
				var_110_30.transform.localPosition = Vector3.New(0, 100, 0)
				arg_107_1.actors_[var_110_29] = var_110_30

				local var_110_31 = var_110_30:GetComponentInChildren(typeof(CharacterEffect))

				var_110_31.enabled = true

				local var_110_32 = GameObjectTools.GetOrAddComponent(var_110_30, typeof(DynamicBoneHelper))

				if var_110_32 then
					var_110_32:EnableDynamicBone(false)
				end

				arg_107_1:ShowWeapon(var_110_31.transform, false)

				arg_107_1.var_[var_110_29 .. "Animator"] = var_110_31.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_107_1.var_[var_110_29 .. "Animator"].applyRootMotion = true
				arg_107_1.var_[var_110_29 .. "LipSync"] = var_110_31.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_110_33 = arg_107_1.actors_["10069ui_story"].transform
			local var_110_34 = 3.2

			if var_110_34 < arg_107_1.time_ and arg_107_1.time_ <= var_110_34 + arg_110_0 then
				arg_107_1.var_.moveOldPos10069ui_story = var_110_33.localPosition
			end

			local var_110_35 = 0.001

			if var_110_34 <= arg_107_1.time_ and arg_107_1.time_ < var_110_34 + var_110_35 then
				local var_110_36 = (arg_107_1.time_ - var_110_34) / var_110_35
				local var_110_37 = Vector3.New(0, -1.08, -6.33)

				var_110_33.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10069ui_story, var_110_37, var_110_36)

				local var_110_38 = manager.ui.mainCamera.transform.position - var_110_33.position

				var_110_33.forward = Vector3.New(var_110_38.x, var_110_38.y, var_110_38.z)

				local var_110_39 = var_110_33.localEulerAngles

				var_110_39.z = 0
				var_110_39.x = 0
				var_110_33.localEulerAngles = var_110_39
			end

			if arg_107_1.time_ >= var_110_34 + var_110_35 and arg_107_1.time_ < var_110_34 + var_110_35 + arg_110_0 then
				var_110_33.localPosition = Vector3.New(0, -1.08, -6.33)

				local var_110_40 = manager.ui.mainCamera.transform.position - var_110_33.position

				var_110_33.forward = Vector3.New(var_110_40.x, var_110_40.y, var_110_40.z)

				local var_110_41 = var_110_33.localEulerAngles

				var_110_41.z = 0
				var_110_41.x = 0
				var_110_33.localEulerAngles = var_110_41
			end

			local var_110_42 = arg_107_1.actors_["10069ui_story"]
			local var_110_43 = 3.2

			if var_110_43 < arg_107_1.time_ and arg_107_1.time_ <= var_110_43 + arg_110_0 and arg_107_1.var_.characterEffect10069ui_story == nil then
				arg_107_1.var_.characterEffect10069ui_story = var_110_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_110_44 = 0.200000002980232

			if var_110_43 <= arg_107_1.time_ and arg_107_1.time_ < var_110_43 + var_110_44 then
				local var_110_45 = (arg_107_1.time_ - var_110_43) / var_110_44

				if arg_107_1.var_.characterEffect10069ui_story then
					arg_107_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_107_1.time_ >= var_110_43 + var_110_44 and arg_107_1.time_ < var_110_43 + var_110_44 + arg_110_0 and arg_107_1.var_.characterEffect10069ui_story then
				arg_107_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_110_46 = 3.2

			if var_110_46 < arg_107_1.time_ and arg_107_1.time_ <= var_110_46 + arg_110_0 then
				arg_107_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action1_1")
			end

			local var_110_47 = 3.2

			if var_110_47 < arg_107_1.time_ and arg_107_1.time_ <= var_110_47 + arg_110_0 then
				arg_107_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_110_48 = arg_107_1.actors_["10058ui_story"].transform
			local var_110_49 = 1.33333333333333

			if var_110_49 < arg_107_1.time_ and arg_107_1.time_ <= var_110_49 + arg_110_0 then
				arg_107_1.var_.moveOldPos10058ui_story = var_110_48.localPosition
			end

			local var_110_50 = 0.001

			if var_110_49 <= arg_107_1.time_ and arg_107_1.time_ < var_110_49 + var_110_50 then
				local var_110_51 = (arg_107_1.time_ - var_110_49) / var_110_50
				local var_110_52 = Vector3.New(0, 100, 0)

				var_110_48.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos10058ui_story, var_110_52, var_110_51)

				local var_110_53 = manager.ui.mainCamera.transform.position - var_110_48.position

				var_110_48.forward = Vector3.New(var_110_53.x, var_110_53.y, var_110_53.z)

				local var_110_54 = var_110_48.localEulerAngles

				var_110_54.z = 0
				var_110_54.x = 0
				var_110_48.localEulerAngles = var_110_54
			end

			if arg_107_1.time_ >= var_110_49 + var_110_50 and arg_107_1.time_ < var_110_49 + var_110_50 + arg_110_0 then
				var_110_48.localPosition = Vector3.New(0, 100, 0)

				local var_110_55 = manager.ui.mainCamera.transform.position - var_110_48.position

				var_110_48.forward = Vector3.New(var_110_55.x, var_110_55.y, var_110_55.z)

				local var_110_56 = var_110_48.localEulerAngles

				var_110_56.z = 0
				var_110_56.x = 0
				var_110_48.localEulerAngles = var_110_56
			end

			local var_110_57 = arg_107_1.actors_["1084ui_story"].transform
			local var_110_58 = 1.33333333333333

			if var_110_58 < arg_107_1.time_ and arg_107_1.time_ <= var_110_58 + arg_110_0 then
				arg_107_1.var_.moveOldPos1084ui_story = var_110_57.localPosition
			end

			local var_110_59 = 0.001

			if var_110_58 <= arg_107_1.time_ and arg_107_1.time_ < var_110_58 + var_110_59 then
				local var_110_60 = (arg_107_1.time_ - var_110_58) / var_110_59
				local var_110_61 = Vector3.New(0, 100, 0)

				var_110_57.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1084ui_story, var_110_61, var_110_60)

				local var_110_62 = manager.ui.mainCamera.transform.position - var_110_57.position

				var_110_57.forward = Vector3.New(var_110_62.x, var_110_62.y, var_110_62.z)

				local var_110_63 = var_110_57.localEulerAngles

				var_110_63.z = 0
				var_110_63.x = 0
				var_110_57.localEulerAngles = var_110_63
			end

			if arg_107_1.time_ >= var_110_58 + var_110_59 and arg_107_1.time_ < var_110_58 + var_110_59 + arg_110_0 then
				var_110_57.localPosition = Vector3.New(0, 100, 0)

				local var_110_64 = manager.ui.mainCamera.transform.position - var_110_57.position

				var_110_57.forward = Vector3.New(var_110_64.x, var_110_64.y, var_110_64.z)

				local var_110_65 = var_110_57.localEulerAngles

				var_110_65.z = 0
				var_110_65.x = 0
				var_110_57.localEulerAngles = var_110_65
			end

			local var_110_66 = 0
			local var_110_67 = 0.2

			if var_110_66 < arg_107_1.time_ and arg_107_1.time_ <= var_110_66 + arg_110_0 then
				local var_110_68 = "play"
				local var_110_69 = "music"

				arg_107_1:AudioAction(var_110_68, var_110_69, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_110_70 = 0.233333333333333
			local var_110_71 = 1

			if var_110_70 < arg_107_1.time_ and arg_107_1.time_ <= var_110_70 + arg_110_0 then
				local var_110_72 = "play"
				local var_110_73 = "music"

				arg_107_1:AudioAction(var_110_72, var_110_73, "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano", "bgm_activity_3_0_story_intense_piano.awb")
			end

			if arg_107_1.frameCnt_ <= 1 then
				arg_107_1.dialog_:SetActive(false)
			end

			local var_110_74 = 3.33333333333333
			local var_110_75 = 0.5

			if var_110_74 < arg_107_1.time_ and arg_107_1.time_ <= var_110_74 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0

				arg_107_1.dialog_:SetActive(true)

				local var_110_76 = LeanTween.value(arg_107_1.dialog_, 0, 1, 0.3)

				var_110_76:setOnUpdate(LuaHelper.FloatAction(function(arg_111_0)
					arg_107_1.dialogCg_.alpha = arg_111_0
				end))
				var_110_76:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_107_1.dialog_)
					var_110_76:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_107_1.duration_ = arg_107_1.duration_ + 0.3

				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_77 = arg_107_1:FormatText(StoryNameCfg[693].name)

				arg_107_1.leftNameTxt_.text = var_110_77

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_78 = arg_107_1:GetWordFromCfg(319841025)
				local var_110_79 = arg_107_1:FormatText(var_110_78.content)

				arg_107_1.text_.text = var_110_79

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_80 = 20
				local var_110_81 = utf8.len(var_110_79)
				local var_110_82 = var_110_80 <= 0 and var_110_75 or var_110_75 * (var_110_81 / var_110_80)

				if var_110_82 > 0 and var_110_75 < var_110_82 then
					arg_107_1.talkMaxDuration = var_110_82
					var_110_74 = var_110_74 + 0.3

					if var_110_82 + var_110_74 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_82 + var_110_74
					end
				end

				arg_107_1.text_.text = var_110_79
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841025", "story_v_out_319841.awb") ~= 0 then
					local var_110_83 = manager.audio:GetVoiceLength("story_v_out_319841", "319841025", "story_v_out_319841.awb") / 1000

					if var_110_83 + var_110_74 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_83 + var_110_74
					end

					if var_110_78.prefab_name ~= "" and arg_107_1.actors_[var_110_78.prefab_name] ~= nil then
						local var_110_84 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_78.prefab_name].transform, "story_v_out_319841", "319841025", "story_v_out_319841.awb")

						arg_107_1:RecordAudio("319841025", var_110_84)
						arg_107_1:RecordAudio("319841025", var_110_84)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_319841", "319841025", "story_v_out_319841.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_319841", "319841025", "story_v_out_319841.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_85 = var_110_74 + 0.3
			local var_110_86 = math.max(var_110_75, arg_107_1.talkMaxDuration)

			if var_110_85 <= arg_107_1.time_ and arg_107_1.time_ < var_110_85 + var_110_86 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_85) / var_110_86

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_85 + var_110_86 and arg_107_1.time_ < var_110_85 + var_110_86 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play319841026 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319841026
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319841027(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = arg_113_1.actors_["10069ui_story"]
			local var_116_1 = 0

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 and arg_113_1.var_.characterEffect10069ui_story == nil then
				arg_113_1.var_.characterEffect10069ui_story = var_116_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_116_2 = 0.200000002980232

			if var_116_1 <= arg_113_1.time_ and arg_113_1.time_ < var_116_1 + var_116_2 then
				local var_116_3 = (arg_113_1.time_ - var_116_1) / var_116_2

				if arg_113_1.var_.characterEffect10069ui_story then
					local var_116_4 = Mathf.Lerp(0, 0.5, var_116_3)

					arg_113_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_113_1.var_.characterEffect10069ui_story.fillRatio = var_116_4
				end
			end

			if arg_113_1.time_ >= var_116_1 + var_116_2 and arg_113_1.time_ < var_116_1 + var_116_2 + arg_116_0 and arg_113_1.var_.characterEffect10069ui_story then
				local var_116_5 = 0.5

				arg_113_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_113_1.var_.characterEffect10069ui_story.fillRatio = var_116_5
			end

			local var_116_6 = 0
			local var_116_7 = 0.85

			if var_116_6 < arg_113_1.time_ and arg_113_1.time_ <= var_116_6 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_8 = arg_113_1:GetWordFromCfg(319841026)
				local var_116_9 = arg_113_1:FormatText(var_116_8.content)

				arg_113_1.text_.text = var_116_9

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_10 = 34
				local var_116_11 = utf8.len(var_116_9)
				local var_116_12 = var_116_10 <= 0 and var_116_7 or var_116_7 * (var_116_11 / var_116_10)

				if var_116_12 > 0 and var_116_7 < var_116_12 then
					arg_113_1.talkMaxDuration = var_116_12

					if var_116_12 + var_116_6 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_12 + var_116_6
					end
				end

				arg_113_1.text_.text = var_116_9
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_13 = math.max(var_116_7, arg_113_1.talkMaxDuration)

			if var_116_6 <= arg_113_1.time_ and arg_113_1.time_ < var_116_6 + var_116_13 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_6) / var_116_13

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_6 + var_116_13 and arg_113_1.time_ < var_116_6 + var_116_13 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319841027 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319841027
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play319841028(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["10069ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos10069ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, 100, 0)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10069ui_story, var_120_4, var_120_3)

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

			local var_120_9 = 0
			local var_120_10 = 1.125

			if var_120_9 < arg_117_1.time_ and arg_117_1.time_ <= var_120_9 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_11 = arg_117_1:GetWordFromCfg(319841027)
				local var_120_12 = arg_117_1:FormatText(var_120_11.content)

				arg_117_1.text_.text = var_120_12

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_13 = 45
				local var_120_14 = utf8.len(var_120_12)
				local var_120_15 = var_120_13 <= 0 and var_120_10 or var_120_10 * (var_120_14 / var_120_13)

				if var_120_15 > 0 and var_120_10 < var_120_15 then
					arg_117_1.talkMaxDuration = var_120_15

					if var_120_15 + var_120_9 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_15 + var_120_9
					end
				end

				arg_117_1.text_.text = var_120_12
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_16 = math.max(var_120_10, arg_117_1.talkMaxDuration)

			if var_120_9 <= arg_117_1.time_ and arg_117_1.time_ < var_120_9 + var_120_16 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_9) / var_120_16

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_9 + var_120_16 and arg_117_1.time_ < var_120_9 + var_120_16 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319841028 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319841028
		arg_121_1.duration_ = 3.133

		local var_121_0 = {
			zh = 1.999999999999,
			ja = 3.133
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
				arg_121_0:Play319841029(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["10058ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos10058ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0.7, -0.98, -6.1)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10058ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["10058ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect10058ui_story == nil then
				arg_121_1.var_.characterEffect10058ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect10058ui_story then
					arg_121_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect10058ui_story then
				arg_121_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = arg_121_1.actors_["10069ui_story"].transform
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.var_.moveOldPos10069ui_story = var_124_15.localPosition
			end

			local var_124_17 = 0.001

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Vector3.New(0, 100, 0)

				var_124_15.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos10069ui_story, var_124_19, var_124_18)

				local var_124_20 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_20.x, var_124_20.y, var_124_20.z)

				local var_124_21 = var_124_15.localEulerAngles

				var_124_21.z = 0
				var_124_21.x = 0
				var_124_15.localEulerAngles = var_124_21
			end

			if arg_121_1.time_ >= var_124_16 + var_124_17 and arg_121_1.time_ < var_124_16 + var_124_17 + arg_124_0 then
				var_124_15.localPosition = Vector3.New(0, 100, 0)

				local var_124_22 = manager.ui.mainCamera.transform.position - var_124_15.position

				var_124_15.forward = Vector3.New(var_124_22.x, var_124_22.y, var_124_22.z)

				local var_124_23 = var_124_15.localEulerAngles

				var_124_23.z = 0
				var_124_23.x = 0
				var_124_15.localEulerAngles = var_124_23
			end

			local var_124_24 = arg_121_1.actors_["10069ui_story"]
			local var_124_25 = 0

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 and arg_121_1.var_.characterEffect10069ui_story == nil then
				arg_121_1.var_.characterEffect10069ui_story = var_124_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_26 = 0.200000002980232

			if var_124_25 <= arg_121_1.time_ and arg_121_1.time_ < var_124_25 + var_124_26 then
				local var_124_27 = (arg_121_1.time_ - var_124_25) / var_124_26

				if arg_121_1.var_.characterEffect10069ui_story then
					local var_124_28 = Mathf.Lerp(0, 0.5, var_124_27)

					arg_121_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_121_1.var_.characterEffect10069ui_story.fillRatio = var_124_28
				end
			end

			if arg_121_1.time_ >= var_124_25 + var_124_26 and arg_121_1.time_ < var_124_25 + var_124_26 + arg_124_0 and arg_121_1.var_.characterEffect10069ui_story then
				local var_124_29 = 0.5

				arg_121_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_121_1.var_.characterEffect10069ui_story.fillRatio = var_124_29
			end

			local var_124_30 = 0
			local var_124_31 = 0.25

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_32 = arg_121_1:FormatText(StoryNameCfg[471].name)

				arg_121_1.leftNameTxt_.text = var_124_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_33 = arg_121_1:GetWordFromCfg(319841028)
				local var_124_34 = arg_121_1:FormatText(var_124_33.content)

				arg_121_1.text_.text = var_124_34

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_35 = 10
				local var_124_36 = utf8.len(var_124_34)
				local var_124_37 = var_124_35 <= 0 and var_124_31 or var_124_31 * (var_124_36 / var_124_35)

				if var_124_37 > 0 and var_124_31 < var_124_37 then
					arg_121_1.talkMaxDuration = var_124_37

					if var_124_37 + var_124_30 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_37 + var_124_30
					end
				end

				arg_121_1.text_.text = var_124_34
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841028", "story_v_out_319841.awb") ~= 0 then
					local var_124_38 = manager.audio:GetVoiceLength("story_v_out_319841", "319841028", "story_v_out_319841.awb") / 1000

					if var_124_38 + var_124_30 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_38 + var_124_30
					end

					if var_124_33.prefab_name ~= "" and arg_121_1.actors_[var_124_33.prefab_name] ~= nil then
						local var_124_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_33.prefab_name].transform, "story_v_out_319841", "319841028", "story_v_out_319841.awb")

						arg_121_1:RecordAudio("319841028", var_124_39)
						arg_121_1:RecordAudio("319841028", var_124_39)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_319841", "319841028", "story_v_out_319841.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_319841", "319841028", "story_v_out_319841.awb")
				end

				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_40 = math.max(var_124_31, arg_121_1.talkMaxDuration)

			if var_124_30 <= arg_121_1.time_ and arg_121_1.time_ < var_124_30 + var_124_40 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_30) / var_124_40

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_30 + var_124_40 and arg_121_1.time_ < var_124_30 + var_124_40 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319841029 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319841029
		arg_125_1.duration_ = 10.8

		local var_125_0 = {
			zh = 10.8,
			ja = 7.333
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
				arg_125_0:Play319841030(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10058ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect10058ui_story == nil then
				arg_125_1.var_.characterEffect10058ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect10058ui_story then
					local var_128_4 = Mathf.Lerp(0, 0.5, var_128_3)

					arg_125_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_125_1.var_.characterEffect10058ui_story.fillRatio = var_128_4
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10058ui_story then
				local var_128_5 = 0.5

				arg_125_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_125_1.var_.characterEffect10058ui_story.fillRatio = var_128_5
			end

			local var_128_6 = arg_125_1.actors_["10069ui_story"].transform
			local var_128_7 = 0

			if var_128_7 < arg_125_1.time_ and arg_125_1.time_ <= var_128_7 + arg_128_0 then
				arg_125_1.var_.moveOldPos10069ui_story = var_128_6.localPosition
			end

			local var_128_8 = 0.001

			if var_128_7 <= arg_125_1.time_ and arg_125_1.time_ < var_128_7 + var_128_8 then
				local var_128_9 = (arg_125_1.time_ - var_128_7) / var_128_8
				local var_128_10 = Vector3.New(-0.7, -1.08, -6.33)

				var_128_6.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10069ui_story, var_128_10, var_128_9)

				local var_128_11 = manager.ui.mainCamera.transform.position - var_128_6.position

				var_128_6.forward = Vector3.New(var_128_11.x, var_128_11.y, var_128_11.z)

				local var_128_12 = var_128_6.localEulerAngles

				var_128_12.z = 0
				var_128_12.x = 0
				var_128_6.localEulerAngles = var_128_12
			end

			if arg_125_1.time_ >= var_128_7 + var_128_8 and arg_125_1.time_ < var_128_7 + var_128_8 + arg_128_0 then
				var_128_6.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_128_13 = manager.ui.mainCamera.transform.position - var_128_6.position

				var_128_6.forward = Vector3.New(var_128_13.x, var_128_13.y, var_128_13.z)

				local var_128_14 = var_128_6.localEulerAngles

				var_128_14.z = 0
				var_128_14.x = 0
				var_128_6.localEulerAngles = var_128_14
			end

			local var_128_15 = arg_125_1.actors_["10069ui_story"]
			local var_128_16 = 0

			if var_128_16 < arg_125_1.time_ and arg_125_1.time_ <= var_128_16 + arg_128_0 and arg_125_1.var_.characterEffect10069ui_story == nil then
				arg_125_1.var_.characterEffect10069ui_story = var_128_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_17 = 0.200000002980232

			if var_128_16 <= arg_125_1.time_ and arg_125_1.time_ < var_128_16 + var_128_17 then
				local var_128_18 = (arg_125_1.time_ - var_128_16) / var_128_17

				if arg_125_1.var_.characterEffect10069ui_story then
					arg_125_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_16 + var_128_17 and arg_125_1.time_ < var_128_16 + var_128_17 + arg_128_0 and arg_125_1.var_.characterEffect10069ui_story then
				arg_125_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_128_19 = 0
			local var_128_20 = 1.325

			if var_128_19 < arg_125_1.time_ and arg_125_1.time_ <= var_128_19 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_21 = arg_125_1:FormatText(StoryNameCfg[693].name)

				arg_125_1.leftNameTxt_.text = var_128_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_22 = arg_125_1:GetWordFromCfg(319841029)
				local var_128_23 = arg_125_1:FormatText(var_128_22.content)

				arg_125_1.text_.text = var_128_23

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_24 = 52
				local var_128_25 = utf8.len(var_128_23)
				local var_128_26 = var_128_24 <= 0 and var_128_20 or var_128_20 * (var_128_25 / var_128_24)

				if var_128_26 > 0 and var_128_20 < var_128_26 then
					arg_125_1.talkMaxDuration = var_128_26

					if var_128_26 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_26 + var_128_19
					end
				end

				arg_125_1.text_.text = var_128_23
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841029", "story_v_out_319841.awb") ~= 0 then
					local var_128_27 = manager.audio:GetVoiceLength("story_v_out_319841", "319841029", "story_v_out_319841.awb") / 1000

					if var_128_27 + var_128_19 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_27 + var_128_19
					end

					if var_128_22.prefab_name ~= "" and arg_125_1.actors_[var_128_22.prefab_name] ~= nil then
						local var_128_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_22.prefab_name].transform, "story_v_out_319841", "319841029", "story_v_out_319841.awb")

						arg_125_1:RecordAudio("319841029", var_128_28)
						arg_125_1:RecordAudio("319841029", var_128_28)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319841", "319841029", "story_v_out_319841.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319841", "319841029", "story_v_out_319841.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_29 = math.max(var_128_20, arg_125_1.talkMaxDuration)

			if var_128_19 <= arg_125_1.time_ and arg_125_1.time_ < var_128_19 + var_128_29 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_19) / var_128_29

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_19 + var_128_29 and arg_125_1.time_ < var_128_19 + var_128_29 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319841030 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319841030
		arg_129_1.duration_ = 10.933

		local var_129_0 = {
			zh = 9.5,
			ja = 10.933
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
				arg_129_0:Play319841031(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = 0
			local var_132_1 = 1.15

			if var_132_0 < arg_129_1.time_ and arg_129_1.time_ <= var_132_0 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_2 = arg_129_1:FormatText(StoryNameCfg[693].name)

				arg_129_1.leftNameTxt_.text = var_132_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_3 = arg_129_1:GetWordFromCfg(319841030)
				local var_132_4 = arg_129_1:FormatText(var_132_3.content)

				arg_129_1.text_.text = var_132_4

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_5 = 46
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841030", "story_v_out_319841.awb") ~= 0 then
					local var_132_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841030", "story_v_out_319841.awb") / 1000

					if var_132_8 + var_132_0 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_8 + var_132_0
					end

					if var_132_3.prefab_name ~= "" and arg_129_1.actors_[var_132_3.prefab_name] ~= nil then
						local var_132_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_3.prefab_name].transform, "story_v_out_319841", "319841030", "story_v_out_319841.awb")

						arg_129_1:RecordAudio("319841030", var_132_9)
						arg_129_1:RecordAudio("319841030", var_132_9)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319841", "319841030", "story_v_out_319841.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319841", "319841030", "story_v_out_319841.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_10 = math.max(var_132_1, arg_129_1.talkMaxDuration)

			if var_132_0 <= arg_129_1.time_ and arg_129_1.time_ < var_132_0 + var_132_10 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_0) / var_132_10

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_0 + var_132_10 and arg_129_1.time_ < var_132_0 + var_132_10 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319841031 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319841031
		arg_133_1.duration_ = 12.466

		local var_133_0 = {
			zh = 12.4,
			ja = 12.466
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
				arg_133_0:Play319841032(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["10069ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos10069ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(-0.7, -1.08, -6.33)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos10069ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = 0

			if var_136_9 < arg_133_1.time_ and arg_133_1.time_ <= var_136_9 + arg_136_0 then
				arg_133_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action6_1")
			end

			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_136_11 = 0
			local var_136_12 = 1.4

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_13 = arg_133_1:FormatText(StoryNameCfg[693].name)

				arg_133_1.leftNameTxt_.text = var_136_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_14 = arg_133_1:GetWordFromCfg(319841031)
				local var_136_15 = arg_133_1:FormatText(var_136_14.content)

				arg_133_1.text_.text = var_136_15

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_16 = 56
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

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841031", "story_v_out_319841.awb") ~= 0 then
					local var_136_19 = manager.audio:GetVoiceLength("story_v_out_319841", "319841031", "story_v_out_319841.awb") / 1000

					if var_136_19 + var_136_11 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_11
					end

					if var_136_14.prefab_name ~= "" and arg_133_1.actors_[var_136_14.prefab_name] ~= nil then
						local var_136_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_14.prefab_name].transform, "story_v_out_319841", "319841031", "story_v_out_319841.awb")

						arg_133_1:RecordAudio("319841031", var_136_20)
						arg_133_1:RecordAudio("319841031", var_136_20)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319841", "319841031", "story_v_out_319841.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319841", "319841031", "story_v_out_319841.awb")
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
	Play319841032 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319841032
		arg_137_1.duration_ = 5.666

		local var_137_0 = {
			zh = 1.999999999999,
			ja = 5.666
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
				arg_137_0:Play319841033(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10058ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos10058ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0.7, -0.98, -6.1)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos10058ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["10058ui_story"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect10058ui_story == nil then
				arg_137_1.var_.characterEffect10058ui_story = var_140_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_11 = 0.200000002980232

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.characterEffect10058ui_story then
					arg_137_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.characterEffect10058ui_story then
				arg_137_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_140_13 = 0

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_1")
			end

			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_15 = arg_137_1.actors_["10069ui_story"]
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 and arg_137_1.var_.characterEffect10069ui_story == nil then
				arg_137_1.var_.characterEffect10069ui_story = var_140_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_17 = 0.200000002980232

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17

				if arg_137_1.var_.characterEffect10069ui_story then
					local var_140_19 = Mathf.Lerp(0, 0.5, var_140_18)

					arg_137_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_137_1.var_.characterEffect10069ui_story.fillRatio = var_140_19
				end
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 and arg_137_1.var_.characterEffect10069ui_story then
				local var_140_20 = 0.5

				arg_137_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_137_1.var_.characterEffect10069ui_story.fillRatio = var_140_20
			end

			local var_140_21 = 0
			local var_140_22 = 0.275

			if var_140_21 < arg_137_1.time_ and arg_137_1.time_ <= var_140_21 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_23 = arg_137_1:FormatText(StoryNameCfg[471].name)

				arg_137_1.leftNameTxt_.text = var_140_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_24 = arg_137_1:GetWordFromCfg(319841032)
				local var_140_25 = arg_137_1:FormatText(var_140_24.content)

				arg_137_1.text_.text = var_140_25

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_26 = 11
				local var_140_27 = utf8.len(var_140_25)
				local var_140_28 = var_140_26 <= 0 and var_140_22 or var_140_22 * (var_140_27 / var_140_26)

				if var_140_28 > 0 and var_140_22 < var_140_28 then
					arg_137_1.talkMaxDuration = var_140_28

					if var_140_28 + var_140_21 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_28 + var_140_21
					end
				end

				arg_137_1.text_.text = var_140_25
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841032", "story_v_out_319841.awb") ~= 0 then
					local var_140_29 = manager.audio:GetVoiceLength("story_v_out_319841", "319841032", "story_v_out_319841.awb") / 1000

					if var_140_29 + var_140_21 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_29 + var_140_21
					end

					if var_140_24.prefab_name ~= "" and arg_137_1.actors_[var_140_24.prefab_name] ~= nil then
						local var_140_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_24.prefab_name].transform, "story_v_out_319841", "319841032", "story_v_out_319841.awb")

						arg_137_1:RecordAudio("319841032", var_140_30)
						arg_137_1:RecordAudio("319841032", var_140_30)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319841", "319841032", "story_v_out_319841.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319841", "319841032", "story_v_out_319841.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_31 = math.max(var_140_22, arg_137_1.talkMaxDuration)

			if var_140_21 <= arg_137_1.time_ and arg_137_1.time_ < var_140_21 + var_140_31 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_21) / var_140_31

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_21 + var_140_31 and arg_137_1.time_ < var_140_21 + var_140_31 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319841033 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319841033
		arg_141_1.duration_ = 6.9

		local var_141_0 = {
			zh = 6.9,
			ja = 5.433
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
				arg_141_0:Play319841034(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["1084ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos1084ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0, -0.97, -6)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos1084ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["1084ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story == nil then
				arg_141_1.var_.characterEffect1084ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect1084ui_story then
					arg_141_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect1084ui_story then
				arg_141_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_144_15 = arg_141_1.actors_["10058ui_story"].transform
			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 then
				arg_141_1.var_.moveOldPos10058ui_story = var_144_15.localPosition
			end

			local var_144_17 = 0.001

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_16) / var_144_17
				local var_144_19 = Vector3.New(0, 100, 0)

				var_144_15.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10058ui_story, var_144_19, var_144_18)

				local var_144_20 = manager.ui.mainCamera.transform.position - var_144_15.position

				var_144_15.forward = Vector3.New(var_144_20.x, var_144_20.y, var_144_20.z)

				local var_144_21 = var_144_15.localEulerAngles

				var_144_21.z = 0
				var_144_21.x = 0
				var_144_15.localEulerAngles = var_144_21
			end

			if arg_141_1.time_ >= var_144_16 + var_144_17 and arg_141_1.time_ < var_144_16 + var_144_17 + arg_144_0 then
				var_144_15.localPosition = Vector3.New(0, 100, 0)

				local var_144_22 = manager.ui.mainCamera.transform.position - var_144_15.position

				var_144_15.forward = Vector3.New(var_144_22.x, var_144_22.y, var_144_22.z)

				local var_144_23 = var_144_15.localEulerAngles

				var_144_23.z = 0
				var_144_23.x = 0
				var_144_15.localEulerAngles = var_144_23
			end

			local var_144_24 = arg_141_1.actors_["10058ui_story"]
			local var_144_25 = 0

			if var_144_25 < arg_141_1.time_ and arg_141_1.time_ <= var_144_25 + arg_144_0 and arg_141_1.var_.characterEffect10058ui_story == nil then
				arg_141_1.var_.characterEffect10058ui_story = var_144_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_26 = 0.200000002980232

			if var_144_25 <= arg_141_1.time_ and arg_141_1.time_ < var_144_25 + var_144_26 then
				local var_144_27 = (arg_141_1.time_ - var_144_25) / var_144_26

				if arg_141_1.var_.characterEffect10058ui_story then
					local var_144_28 = Mathf.Lerp(0, 0.5, var_144_27)

					arg_141_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_141_1.var_.characterEffect10058ui_story.fillRatio = var_144_28
				end
			end

			if arg_141_1.time_ >= var_144_25 + var_144_26 and arg_141_1.time_ < var_144_25 + var_144_26 + arg_144_0 and arg_141_1.var_.characterEffect10058ui_story then
				local var_144_29 = 0.5

				arg_141_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_141_1.var_.characterEffect10058ui_story.fillRatio = var_144_29
			end

			local var_144_30 = arg_141_1.actors_["10069ui_story"].transform
			local var_144_31 = 0

			if var_144_31 < arg_141_1.time_ and arg_141_1.time_ <= var_144_31 + arg_144_0 then
				arg_141_1.var_.moveOldPos10069ui_story = var_144_30.localPosition
			end

			local var_144_32 = 0.001

			if var_144_31 <= arg_141_1.time_ and arg_141_1.time_ < var_144_31 + var_144_32 then
				local var_144_33 = (arg_141_1.time_ - var_144_31) / var_144_32
				local var_144_34 = Vector3.New(0, 100, 0)

				var_144_30.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10069ui_story, var_144_34, var_144_33)

				local var_144_35 = manager.ui.mainCamera.transform.position - var_144_30.position

				var_144_30.forward = Vector3.New(var_144_35.x, var_144_35.y, var_144_35.z)

				local var_144_36 = var_144_30.localEulerAngles

				var_144_36.z = 0
				var_144_36.x = 0
				var_144_30.localEulerAngles = var_144_36
			end

			if arg_141_1.time_ >= var_144_31 + var_144_32 and arg_141_1.time_ < var_144_31 + var_144_32 + arg_144_0 then
				var_144_30.localPosition = Vector3.New(0, 100, 0)

				local var_144_37 = manager.ui.mainCamera.transform.position - var_144_30.position

				var_144_30.forward = Vector3.New(var_144_37.x, var_144_37.y, var_144_37.z)

				local var_144_38 = var_144_30.localEulerAngles

				var_144_38.z = 0
				var_144_38.x = 0
				var_144_30.localEulerAngles = var_144_38
			end

			local var_144_39 = arg_141_1.actors_["10069ui_story"]
			local var_144_40 = 0

			if var_144_40 < arg_141_1.time_ and arg_141_1.time_ <= var_144_40 + arg_144_0 and arg_141_1.var_.characterEffect10069ui_story == nil then
				arg_141_1.var_.characterEffect10069ui_story = var_144_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_41 = 0.200000002980232

			if var_144_40 <= arg_141_1.time_ and arg_141_1.time_ < var_144_40 + var_144_41 then
				local var_144_42 = (arg_141_1.time_ - var_144_40) / var_144_41

				if arg_141_1.var_.characterEffect10069ui_story then
					local var_144_43 = Mathf.Lerp(0, 0.5, var_144_42)

					arg_141_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_141_1.var_.characterEffect10069ui_story.fillRatio = var_144_43
				end
			end

			if arg_141_1.time_ >= var_144_40 + var_144_41 and arg_141_1.time_ < var_144_40 + var_144_41 + arg_144_0 and arg_141_1.var_.characterEffect10069ui_story then
				local var_144_44 = 0.5

				arg_141_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_141_1.var_.characterEffect10069ui_story.fillRatio = var_144_44
			end

			local var_144_45 = 0
			local var_144_46 = 0.6

			if var_144_45 < arg_141_1.time_ and arg_141_1.time_ <= var_144_45 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_47 = arg_141_1:FormatText(StoryNameCfg[6].name)

				arg_141_1.leftNameTxt_.text = var_144_47

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_48 = arg_141_1:GetWordFromCfg(319841033)
				local var_144_49 = arg_141_1:FormatText(var_144_48.content)

				arg_141_1.text_.text = var_144_49

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_50 = 24
				local var_144_51 = utf8.len(var_144_49)
				local var_144_52 = var_144_50 <= 0 and var_144_46 or var_144_46 * (var_144_51 / var_144_50)

				if var_144_52 > 0 and var_144_46 < var_144_52 then
					arg_141_1.talkMaxDuration = var_144_52

					if var_144_52 + var_144_45 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_52 + var_144_45
					end
				end

				arg_141_1.text_.text = var_144_49
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841033", "story_v_out_319841.awb") ~= 0 then
					local var_144_53 = manager.audio:GetVoiceLength("story_v_out_319841", "319841033", "story_v_out_319841.awb") / 1000

					if var_144_53 + var_144_45 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_53 + var_144_45
					end

					if var_144_48.prefab_name ~= "" and arg_141_1.actors_[var_144_48.prefab_name] ~= nil then
						local var_144_54 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_48.prefab_name].transform, "story_v_out_319841", "319841033", "story_v_out_319841.awb")

						arg_141_1:RecordAudio("319841033", var_144_54)
						arg_141_1:RecordAudio("319841033", var_144_54)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319841", "319841033", "story_v_out_319841.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319841", "319841033", "story_v_out_319841.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_55 = math.max(var_144_46, arg_141_1.talkMaxDuration)

			if var_144_45 <= arg_141_1.time_ and arg_141_1.time_ < var_144_45 + var_144_55 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_45) / var_144_55

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_45 + var_144_55 and arg_141_1.time_ < var_144_45 + var_144_55 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319841034 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319841034
		arg_145_1.duration_ = 5

		SetActive(arg_145_1.tipsGo_, false)

		function arg_145_1.onSingleLineFinish_()
			arg_145_1.onSingleLineUpdate_ = nil
			arg_145_1.onSingleLineFinish_ = nil
			arg_145_1.state_ = "waiting"
		end

		function arg_145_1.playNext_(arg_147_0)
			if arg_147_0 == 1 then
				arg_145_0:Play319841035(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1084ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect1084ui_story == nil then
				arg_145_1.var_.characterEffect1084ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

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
			local var_148_7 = 0.825

			if var_148_6 < arg_145_1.time_ and arg_145_1.time_ <= var_148_6 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, false)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_8 = arg_145_1:GetWordFromCfg(319841034)
				local var_148_9 = arg_145_1:FormatText(var_148_8.content)

				arg_145_1.text_.text = var_148_9

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_10 = 33
				local var_148_11 = utf8.len(var_148_9)
				local var_148_12 = var_148_10 <= 0 and var_148_7 or var_148_7 * (var_148_11 / var_148_10)

				if var_148_12 > 0 and var_148_7 < var_148_12 then
					arg_145_1.talkMaxDuration = var_148_12

					if var_148_12 + var_148_6 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_12 + var_148_6
					end
				end

				arg_145_1.text_.text = var_148_9
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)
				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_13 = math.max(var_148_7, arg_145_1.talkMaxDuration)

			if var_148_6 <= arg_145_1.time_ and arg_145_1.time_ < var_148_6 + var_148_13 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_6) / var_148_13

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_6 + var_148_13 and arg_145_1.time_ < var_148_6 + var_148_13 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play319841035 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319841035
		arg_149_1.duration_ = 6.633

		local var_149_0 = {
			zh = 5.866,
			ja = 6.633
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
				arg_149_0:Play319841036(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = arg_149_1.actors_["10058ui_story"].transform
			local var_152_1 = 0

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.var_.moveOldPos10058ui_story = var_152_0.localPosition
			end

			local var_152_2 = 0.001

			if var_152_1 <= arg_149_1.time_ and arg_149_1.time_ < var_152_1 + var_152_2 then
				local var_152_3 = (arg_149_1.time_ - var_152_1) / var_152_2
				local var_152_4 = Vector3.New(0.7, -0.98, -6.1)

				var_152_0.localPosition = Vector3.Lerp(arg_149_1.var_.moveOldPos10058ui_story, var_152_4, var_152_3)

				local var_152_5 = manager.ui.mainCamera.transform.position - var_152_0.position

				var_152_0.forward = Vector3.New(var_152_5.x, var_152_5.y, var_152_5.z)

				local var_152_6 = var_152_0.localEulerAngles

				var_152_6.z = 0
				var_152_6.x = 0
				var_152_0.localEulerAngles = var_152_6
			end

			if arg_149_1.time_ >= var_152_1 + var_152_2 and arg_149_1.time_ < var_152_1 + var_152_2 + arg_152_0 then
				var_152_0.localPosition = Vector3.New(0.7, -0.98, -6.1)

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

			local var_152_18 = arg_149_1.actors_["1084ui_story"]
			local var_152_19 = 0

			if var_152_19 < arg_149_1.time_ and arg_149_1.time_ <= var_152_19 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story == nil then
				arg_149_1.var_.characterEffect1084ui_story = var_152_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_20 = 0.200000002980232

			if var_152_19 <= arg_149_1.time_ and arg_149_1.time_ < var_152_19 + var_152_20 then
				local var_152_21 = (arg_149_1.time_ - var_152_19) / var_152_20

				if arg_149_1.var_.characterEffect1084ui_story then
					local var_152_22 = Mathf.Lerp(0, 0.5, var_152_21)

					arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_22
				end
			end

			if arg_149_1.time_ >= var_152_19 + var_152_20 and arg_149_1.time_ < var_152_19 + var_152_20 + arg_152_0 and arg_149_1.var_.characterEffect1084ui_story then
				local var_152_23 = 0.5

				arg_149_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_149_1.var_.characterEffect1084ui_story.fillRatio = var_152_23
			end

			local var_152_24 = arg_149_1.actors_["10058ui_story"]
			local var_152_25 = 0

			if var_152_25 < arg_149_1.time_ and arg_149_1.time_ <= var_152_25 + arg_152_0 and arg_149_1.var_.characterEffect10058ui_story == nil then
				arg_149_1.var_.characterEffect10058ui_story = var_152_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_152_26 = 0.200000002980232

			if var_152_25 <= arg_149_1.time_ and arg_149_1.time_ < var_152_25 + var_152_26 then
				local var_152_27 = (arg_149_1.time_ - var_152_25) / var_152_26

				if arg_149_1.var_.characterEffect10058ui_story then
					arg_149_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_149_1.time_ >= var_152_25 + var_152_26 and arg_149_1.time_ < var_152_25 + var_152_26 + arg_152_0 and arg_149_1.var_.characterEffect10058ui_story then
				arg_149_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_152_28 = 0

			if var_152_28 < arg_149_1.time_ and arg_149_1.time_ <= var_152_28 + arg_152_0 then
				arg_149_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_152_29 = 0

			if var_152_29 < arg_149_1.time_ and arg_149_1.time_ <= var_152_29 + arg_152_0 then
				arg_149_1:PlayTimeline("10058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_152_30 = 0
			local var_152_31 = 0.6

			if var_152_30 < arg_149_1.time_ and arg_149_1.time_ <= var_152_30 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_32 = arg_149_1:FormatText(StoryNameCfg[471].name)

				arg_149_1.leftNameTxt_.text = var_152_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_33 = arg_149_1:GetWordFromCfg(319841035)
				local var_152_34 = arg_149_1:FormatText(var_152_33.content)

				arg_149_1.text_.text = var_152_34

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_35 = 24
				local var_152_36 = utf8.len(var_152_34)
				local var_152_37 = var_152_35 <= 0 and var_152_31 or var_152_31 * (var_152_36 / var_152_35)

				if var_152_37 > 0 and var_152_31 < var_152_37 then
					arg_149_1.talkMaxDuration = var_152_37

					if var_152_37 + var_152_30 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_37 + var_152_30
					end
				end

				arg_149_1.text_.text = var_152_34
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841035", "story_v_out_319841.awb") ~= 0 then
					local var_152_38 = manager.audio:GetVoiceLength("story_v_out_319841", "319841035", "story_v_out_319841.awb") / 1000

					if var_152_38 + var_152_30 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_38 + var_152_30
					end

					if var_152_33.prefab_name ~= "" and arg_149_1.actors_[var_152_33.prefab_name] ~= nil then
						local var_152_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_33.prefab_name].transform, "story_v_out_319841", "319841035", "story_v_out_319841.awb")

						arg_149_1:RecordAudio("319841035", var_152_39)
						arg_149_1:RecordAudio("319841035", var_152_39)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319841", "319841035", "story_v_out_319841.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319841", "319841035", "story_v_out_319841.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_40 = math.max(var_152_31, arg_149_1.talkMaxDuration)

			if var_152_30 <= arg_149_1.time_ and arg_149_1.time_ < var_152_30 + var_152_40 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_30) / var_152_40

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_30 + var_152_40 and arg_149_1.time_ < var_152_30 + var_152_40 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play319841036 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319841036
		arg_153_1.duration_ = 5

		SetActive(arg_153_1.tipsGo_, false)

		function arg_153_1.onSingleLineFinish_()
			arg_153_1.onSingleLineUpdate_ = nil
			arg_153_1.onSingleLineFinish_ = nil
			arg_153_1.state_ = "waiting"
		end

		function arg_153_1.playNext_(arg_155_0)
			if arg_155_0 == 1 then
				arg_153_0:Play319841037(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10058ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect10058ui_story == nil then
				arg_153_1.var_.characterEffect10058ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect10058ui_story then
					local var_156_4 = Mathf.Lerp(0, 0.5, var_156_3)

					arg_153_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_153_1.var_.characterEffect10058ui_story.fillRatio = var_156_4
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect10058ui_story then
				local var_156_5 = 0.5

				arg_153_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_153_1.var_.characterEffect10058ui_story.fillRatio = var_156_5
			end

			local var_156_6 = 0
			local var_156_7 = 1.15

			if var_156_6 < arg_153_1.time_ and arg_153_1.time_ <= var_156_6 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, false)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_8 = arg_153_1:GetWordFromCfg(319841036)
				local var_156_9 = arg_153_1:FormatText(var_156_8.content)

				arg_153_1.text_.text = var_156_9

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_10 = 46
				local var_156_11 = utf8.len(var_156_9)
				local var_156_12 = var_156_10 <= 0 and var_156_7 or var_156_7 * (var_156_11 / var_156_10)

				if var_156_12 > 0 and var_156_7 < var_156_12 then
					arg_153_1.talkMaxDuration = var_156_12

					if var_156_12 + var_156_6 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_12 + var_156_6
					end
				end

				arg_153_1.text_.text = var_156_9
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)
				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_13 = math.max(var_156_7, arg_153_1.talkMaxDuration)

			if var_156_6 <= arg_153_1.time_ and arg_153_1.time_ < var_156_6 + var_156_13 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_6) / var_156_13

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_6 + var_156_13 and arg_153_1.time_ < var_156_6 + var_156_13 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319841037 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319841037
		arg_157_1.duration_ = 1.7

		local var_157_0 = {
			zh = 1.266,
			ja = 1.7
		}
		local var_157_1 = manager.audio:GetLocalizationFlag()

		if var_157_0[var_157_1] ~= nil then
			arg_157_1.duration_ = var_157_0[var_157_1]
		end

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319841038(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10058ui_story"]
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 and arg_157_1.var_.characterEffect10058ui_story == nil then
				arg_157_1.var_.characterEffect10058ui_story = var_160_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_2 = 0.200000002980232

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2

				if arg_157_1.var_.characterEffect10058ui_story then
					arg_157_1.var_.characterEffect10058ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 and arg_157_1.var_.characterEffect10058ui_story then
				arg_157_1.var_.characterEffect10058ui_story.fillFlat = false
			end

			local var_160_4 = 0
			local var_160_5 = 0.125

			if var_160_4 < arg_157_1.time_ and arg_157_1.time_ <= var_160_4 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_6 = arg_157_1:FormatText(StoryNameCfg[471].name)

				arg_157_1.leftNameTxt_.text = var_160_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_7 = arg_157_1:GetWordFromCfg(319841037)
				local var_160_8 = arg_157_1:FormatText(var_160_7.content)

				arg_157_1.text_.text = var_160_8

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_9 = 5
				local var_160_10 = utf8.len(var_160_8)
				local var_160_11 = var_160_9 <= 0 and var_160_5 or var_160_5 * (var_160_10 / var_160_9)

				if var_160_11 > 0 and var_160_5 < var_160_11 then
					arg_157_1.talkMaxDuration = var_160_11

					if var_160_11 + var_160_4 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_11 + var_160_4
					end
				end

				arg_157_1.text_.text = var_160_8
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841037", "story_v_out_319841.awb") ~= 0 then
					local var_160_12 = manager.audio:GetVoiceLength("story_v_out_319841", "319841037", "story_v_out_319841.awb") / 1000

					if var_160_12 + var_160_4 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_12 + var_160_4
					end

					if var_160_7.prefab_name ~= "" and arg_157_1.actors_[var_160_7.prefab_name] ~= nil then
						local var_160_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_7.prefab_name].transform, "story_v_out_319841", "319841037", "story_v_out_319841.awb")

						arg_157_1:RecordAudio("319841037", var_160_13)
						arg_157_1:RecordAudio("319841037", var_160_13)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_319841", "319841037", "story_v_out_319841.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_319841", "319841037", "story_v_out_319841.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_14 = math.max(var_160_5, arg_157_1.talkMaxDuration)

			if var_160_4 <= arg_157_1.time_ and arg_157_1.time_ < var_160_4 + var_160_14 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_4) / var_160_14

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_4 + var_160_14 and arg_157_1.time_ < var_160_4 + var_160_14 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319841038 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319841038
		arg_161_1.duration_ = 7

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319841039(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1084ui_story"].transform
			local var_164_1 = 1

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1084ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, 100, 0)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1084ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, 100, 0)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["10058ui_story"].transform
			local var_164_10 = 1

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 then
				arg_161_1.var_.moveOldPos10058ui_story = var_164_9.localPosition
			end

			local var_164_11 = 0.001

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11
				local var_164_13 = Vector3.New(0, 100, 0)

				var_164_9.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos10058ui_story, var_164_13, var_164_12)

				local var_164_14 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_14.x, var_164_14.y, var_164_14.z)

				local var_164_15 = var_164_9.localEulerAngles

				var_164_15.z = 0
				var_164_15.x = 0
				var_164_9.localEulerAngles = var_164_15
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 then
				var_164_9.localPosition = Vector3.New(0, 100, 0)

				local var_164_16 = manager.ui.mainCamera.transform.position - var_164_9.position

				var_164_9.forward = Vector3.New(var_164_16.x, var_164_16.y, var_164_16.z)

				local var_164_17 = var_164_9.localEulerAngles

				var_164_17.z = 0
				var_164_17.x = 0
				var_164_9.localEulerAngles = var_164_17
			end

			local var_164_18 = 1

			if var_164_18 < arg_161_1.time_ and arg_161_1.time_ <= var_164_18 + arg_164_0 then
				local var_164_19 = manager.ui.mainCamera.transform.localPosition
				local var_164_20 = Vector3.New(0, 0, 10) + Vector3.New(var_164_19.x, var_164_19.y, 0)
				local var_164_21 = arg_161_1.bgs_.ST72

				var_164_21.transform.localPosition = var_164_20
				var_164_21.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_164_22 = var_164_21:GetComponent("SpriteRenderer")

				if var_164_22 and var_164_22.sprite then
					local var_164_23 = (var_164_21.transform.localPosition - var_164_19).z
					local var_164_24 = manager.ui.mainCameraCom_
					local var_164_25 = 2 * var_164_23 * Mathf.Tan(var_164_24.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_164_26 = var_164_25 * var_164_24.aspect
					local var_164_27 = var_164_22.sprite.bounds.size.x
					local var_164_28 = var_164_22.sprite.bounds.size.y
					local var_164_29 = var_164_26 / var_164_27
					local var_164_30 = var_164_25 / var_164_28
					local var_164_31 = var_164_30 < var_164_29 and var_164_29 or var_164_30

					var_164_21.transform.localScale = Vector3.New(var_164_31, var_164_31, 0)
				end

				for iter_164_0, iter_164_1 in pairs(arg_161_1.bgs_) do
					if iter_164_0 ~= "ST72" then
						iter_164_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_164_32 = 0

			if var_164_32 < arg_161_1.time_ and arg_161_1.time_ <= var_164_32 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_33 = 1

			if var_164_32 <= arg_161_1.time_ and arg_161_1.time_ < var_164_32 + var_164_33 then
				local var_164_34 = (arg_161_1.time_ - var_164_32) / var_164_33
				local var_164_35 = Color.New(0, 0, 0)

				var_164_35.a = Mathf.Lerp(0, 1, var_164_34)
				arg_161_1.mask_.color = var_164_35
			end

			if arg_161_1.time_ >= var_164_32 + var_164_33 and arg_161_1.time_ < var_164_32 + var_164_33 + arg_164_0 then
				local var_164_36 = Color.New(0, 0, 0)

				var_164_36.a = 1
				arg_161_1.mask_.color = var_164_36
			end

			local var_164_37 = 1

			if var_164_37 < arg_161_1.time_ and arg_161_1.time_ <= var_164_37 + arg_164_0 then
				arg_161_1.mask_.enabled = true
				arg_161_1.mask_.raycastTarget = true

				arg_161_1:SetGaussion(false)
			end

			local var_164_38 = 1

			if var_164_37 <= arg_161_1.time_ and arg_161_1.time_ < var_164_37 + var_164_38 then
				local var_164_39 = (arg_161_1.time_ - var_164_37) / var_164_38
				local var_164_40 = Color.New(0, 0, 0)

				var_164_40.a = Mathf.Lerp(1, 0, var_164_39)
				arg_161_1.mask_.color = var_164_40
			end

			if arg_161_1.time_ >= var_164_37 + var_164_38 and arg_161_1.time_ < var_164_37 + var_164_38 + arg_164_0 then
				local var_164_41 = Color.New(0, 0, 0)
				local var_164_42 = 0

				arg_161_1.mask_.enabled = false
				var_164_41.a = var_164_42
				arg_161_1.mask_.color = var_164_41
			end

			if arg_161_1.frameCnt_ <= 1 then
				arg_161_1.dialog_:SetActive(false)
			end

			local var_164_43 = 2
			local var_164_44 = 1.325

			if var_164_43 < arg_161_1.time_ and arg_161_1.time_ <= var_164_43 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0

				arg_161_1.dialog_:SetActive(true)

				local var_164_45 = LeanTween.value(arg_161_1.dialog_, 0, 1, 0.3)

				var_164_45:setOnUpdate(LuaHelper.FloatAction(function(arg_165_0)
					arg_161_1.dialogCg_.alpha = arg_165_0
				end))
				var_164_45:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_161_1.dialog_)
					var_164_45:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_161_1.duration_ = arg_161_1.duration_ + 0.3

				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_46 = arg_161_1:GetWordFromCfg(319841038)
				local var_164_47 = arg_161_1:FormatText(var_164_46.content)

				arg_161_1.text_.text = var_164_47

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_48 = 53
				local var_164_49 = utf8.len(var_164_47)
				local var_164_50 = var_164_48 <= 0 and var_164_44 or var_164_44 * (var_164_49 / var_164_48)

				if var_164_50 > 0 and var_164_44 < var_164_50 then
					arg_161_1.talkMaxDuration = var_164_50
					var_164_43 = var_164_43 + 0.3

					if var_164_50 + var_164_43 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_50 + var_164_43
					end
				end

				arg_161_1.text_.text = var_164_47
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_51 = var_164_43 + 0.3
			local var_164_52 = math.max(var_164_44, arg_161_1.talkMaxDuration)

			if var_164_51 <= arg_161_1.time_ and arg_161_1.time_ < var_164_51 + var_164_52 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_51) / var_164_52

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_51 + var_164_52 and arg_161_1.time_ < var_164_51 + var_164_52 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319841039 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 319841039
		arg_167_1.duration_ = 3.366

		local var_167_0 = {
			zh = 3.266,
			ja = 3.366
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
				arg_167_0:Play319841040(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = arg_167_1.actors_["1084ui_story"].transform
			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.var_.moveOldPos1084ui_story = var_170_0.localPosition
			end

			local var_170_2 = 0.001

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_2 then
				local var_170_3 = (arg_167_1.time_ - var_170_1) / var_170_2
				local var_170_4 = Vector3.New(-0.7, -0.97, -6)

				var_170_0.localPosition = Vector3.Lerp(arg_167_1.var_.moveOldPos1084ui_story, var_170_4, var_170_3)

				local var_170_5 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_5.x, var_170_5.y, var_170_5.z)

				local var_170_6 = var_170_0.localEulerAngles

				var_170_6.z = 0
				var_170_6.x = 0
				var_170_0.localEulerAngles = var_170_6
			end

			if arg_167_1.time_ >= var_170_1 + var_170_2 and arg_167_1.time_ < var_170_1 + var_170_2 + arg_170_0 then
				var_170_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_170_7 = manager.ui.mainCamera.transform.position - var_170_0.position

				var_170_0.forward = Vector3.New(var_170_7.x, var_170_7.y, var_170_7.z)

				local var_170_8 = var_170_0.localEulerAngles

				var_170_8.z = 0
				var_170_8.x = 0
				var_170_0.localEulerAngles = var_170_8
			end

			local var_170_9 = arg_167_1.actors_["1084ui_story"]
			local var_170_10 = 0

			if var_170_10 < arg_167_1.time_ and arg_167_1.time_ <= var_170_10 + arg_170_0 and arg_167_1.var_.characterEffect1084ui_story == nil then
				arg_167_1.var_.characterEffect1084ui_story = var_170_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_170_11 = 0.200000002980232

			if var_170_10 <= arg_167_1.time_ and arg_167_1.time_ < var_170_10 + var_170_11 then
				local var_170_12 = (arg_167_1.time_ - var_170_10) / var_170_11

				if arg_167_1.var_.characterEffect1084ui_story then
					arg_167_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_167_1.time_ >= var_170_10 + var_170_11 and arg_167_1.time_ < var_170_10 + var_170_11 + arg_170_0 and arg_167_1.var_.characterEffect1084ui_story then
				arg_167_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_170_13 = 0

			if var_170_13 < arg_167_1.time_ and arg_167_1.time_ <= var_170_13 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_2")
			end

			local var_170_14 = 0

			if var_170_14 < arg_167_1.time_ and arg_167_1.time_ <= var_170_14 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_170_15 = 0
			local var_170_16 = 0.325

			if var_170_15 < arg_167_1.time_ and arg_167_1.time_ <= var_170_15 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_17 = arg_167_1:FormatText(StoryNameCfg[6].name)

				arg_167_1.leftNameTxt_.text = var_170_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_18 = arg_167_1:GetWordFromCfg(319841039)
				local var_170_19 = arg_167_1:FormatText(var_170_18.content)

				arg_167_1.text_.text = var_170_19

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_20 = 13
				local var_170_21 = utf8.len(var_170_19)
				local var_170_22 = var_170_20 <= 0 and var_170_16 or var_170_16 * (var_170_21 / var_170_20)

				if var_170_22 > 0 and var_170_16 < var_170_22 then
					arg_167_1.talkMaxDuration = var_170_22

					if var_170_22 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_22 + var_170_15
					end
				end

				arg_167_1.text_.text = var_170_19
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841039", "story_v_out_319841.awb") ~= 0 then
					local var_170_23 = manager.audio:GetVoiceLength("story_v_out_319841", "319841039", "story_v_out_319841.awb") / 1000

					if var_170_23 + var_170_15 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_23 + var_170_15
					end

					if var_170_18.prefab_name ~= "" and arg_167_1.actors_[var_170_18.prefab_name] ~= nil then
						local var_170_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_18.prefab_name].transform, "story_v_out_319841", "319841039", "story_v_out_319841.awb")

						arg_167_1:RecordAudio("319841039", var_170_24)
						arg_167_1:RecordAudio("319841039", var_170_24)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_319841", "319841039", "story_v_out_319841.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_319841", "319841039", "story_v_out_319841.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_25 = math.max(var_170_16, arg_167_1.talkMaxDuration)

			if var_170_15 <= arg_167_1.time_ and arg_167_1.time_ < var_170_15 + var_170_25 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_15) / var_170_25

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_15 + var_170_25 and arg_167_1.time_ < var_170_15 + var_170_25 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play319841040 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319841040
		arg_171_1.duration_ = 7.5

		local var_171_0 = {
			zh = 5.6,
			ja = 7.5
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
				arg_171_0:Play319841041(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = "10050ui_story"

			if arg_171_1.actors_[var_174_0] == nil then
				local var_174_1 = Object.Instantiate(Asset.Load("Char/" .. var_174_0), arg_171_1.stage_.transform)

				var_174_1.name = var_174_0
				var_174_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_171_1.actors_[var_174_0] = var_174_1

				local var_174_2 = var_174_1:GetComponentInChildren(typeof(CharacterEffect))

				var_174_2.enabled = true

				local var_174_3 = GameObjectTools.GetOrAddComponent(var_174_1, typeof(DynamicBoneHelper))

				if var_174_3 then
					var_174_3:EnableDynamicBone(false)
				end

				arg_171_1:ShowWeapon(var_174_2.transform, false)

				arg_171_1.var_[var_174_0 .. "Animator"] = var_174_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_171_1.var_[var_174_0 .. "Animator"].applyRootMotion = true
				arg_171_1.var_[var_174_0 .. "LipSync"] = var_174_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_174_4 = arg_171_1.actors_["10050ui_story"].transform
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 then
				arg_171_1.var_.moveOldPos10050ui_story = var_174_4.localPosition
			end

			local var_174_6 = 0.001

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6
				local var_174_8 = Vector3.New(0.7, -0.715, -6.15)

				var_174_4.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10050ui_story, var_174_8, var_174_7)

				local var_174_9 = manager.ui.mainCamera.transform.position - var_174_4.position

				var_174_4.forward = Vector3.New(var_174_9.x, var_174_9.y, var_174_9.z)

				local var_174_10 = var_174_4.localEulerAngles

				var_174_10.z = 0
				var_174_10.x = 0
				var_174_4.localEulerAngles = var_174_10
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 then
				var_174_4.localPosition = Vector3.New(0.7, -0.715, -6.15)

				local var_174_11 = manager.ui.mainCamera.transform.position - var_174_4.position

				var_174_4.forward = Vector3.New(var_174_11.x, var_174_11.y, var_174_11.z)

				local var_174_12 = var_174_4.localEulerAngles

				var_174_12.z = 0
				var_174_12.x = 0
				var_174_4.localEulerAngles = var_174_12
			end

			local var_174_13 = arg_171_1.actors_["10050ui_story"]
			local var_174_14 = 0

			if var_174_14 < arg_171_1.time_ and arg_171_1.time_ <= var_174_14 + arg_174_0 and arg_171_1.var_.characterEffect10050ui_story == nil then
				arg_171_1.var_.characterEffect10050ui_story = var_174_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_15 = 0.200000002980232

			if var_174_14 <= arg_171_1.time_ and arg_171_1.time_ < var_174_14 + var_174_15 then
				local var_174_16 = (arg_171_1.time_ - var_174_14) / var_174_15

				if arg_171_1.var_.characterEffect10050ui_story then
					arg_171_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_14 + var_174_15 and arg_171_1.time_ < var_174_14 + var_174_15 + arg_174_0 and arg_171_1.var_.characterEffect10050ui_story then
				arg_171_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_174_17 = 0

			if var_174_17 < arg_171_1.time_ and arg_171_1.time_ <= var_174_17 + arg_174_0 then
				arg_171_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action2_1")
			end

			local var_174_18 = 0

			if var_174_18 < arg_171_1.time_ and arg_171_1.time_ <= var_174_18 + arg_174_0 then
				arg_171_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_174_19 = arg_171_1.actors_["10058ui_story"].transform
			local var_174_20 = 0

			if var_174_20 < arg_171_1.time_ and arg_171_1.time_ <= var_174_20 + arg_174_0 then
				arg_171_1.var_.moveOldPos10058ui_story = var_174_19.localPosition
			end

			local var_174_21 = 0.001

			if var_174_20 <= arg_171_1.time_ and arg_171_1.time_ < var_174_20 + var_174_21 then
				local var_174_22 = (arg_171_1.time_ - var_174_20) / var_174_21
				local var_174_23 = Vector3.New(0, 100, 0)

				var_174_19.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos10058ui_story, var_174_23, var_174_22)

				local var_174_24 = manager.ui.mainCamera.transform.position - var_174_19.position

				var_174_19.forward = Vector3.New(var_174_24.x, var_174_24.y, var_174_24.z)

				local var_174_25 = var_174_19.localEulerAngles

				var_174_25.z = 0
				var_174_25.x = 0
				var_174_19.localEulerAngles = var_174_25
			end

			if arg_171_1.time_ >= var_174_20 + var_174_21 and arg_171_1.time_ < var_174_20 + var_174_21 + arg_174_0 then
				var_174_19.localPosition = Vector3.New(0, 100, 0)

				local var_174_26 = manager.ui.mainCamera.transform.position - var_174_19.position

				var_174_19.forward = Vector3.New(var_174_26.x, var_174_26.y, var_174_26.z)

				local var_174_27 = var_174_19.localEulerAngles

				var_174_27.z = 0
				var_174_27.x = 0
				var_174_19.localEulerAngles = var_174_27
			end

			local var_174_28 = arg_171_1.actors_["10058ui_story"]
			local var_174_29 = 0

			if var_174_29 < arg_171_1.time_ and arg_171_1.time_ <= var_174_29 + arg_174_0 and arg_171_1.var_.characterEffect10058ui_story == nil then
				arg_171_1.var_.characterEffect10058ui_story = var_174_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_30 = 0.200000002980232

			if var_174_29 <= arg_171_1.time_ and arg_171_1.time_ < var_174_29 + var_174_30 then
				local var_174_31 = (arg_171_1.time_ - var_174_29) / var_174_30

				if arg_171_1.var_.characterEffect10058ui_story then
					local var_174_32 = Mathf.Lerp(0, 0.5, var_174_31)

					arg_171_1.var_.characterEffect10058ui_story.fillFlat = true
					arg_171_1.var_.characterEffect10058ui_story.fillRatio = var_174_32
				end
			end

			if arg_171_1.time_ >= var_174_29 + var_174_30 and arg_171_1.time_ < var_174_29 + var_174_30 + arg_174_0 and arg_171_1.var_.characterEffect10058ui_story then
				local var_174_33 = 0.5

				arg_171_1.var_.characterEffect10058ui_story.fillFlat = true
				arg_171_1.var_.characterEffect10058ui_story.fillRatio = var_174_33
			end

			local var_174_34 = arg_171_1.actors_["1084ui_story"].transform
			local var_174_35 = 0

			if var_174_35 < arg_171_1.time_ and arg_171_1.time_ <= var_174_35 + arg_174_0 then
				arg_171_1.var_.moveOldPos1084ui_story = var_174_34.localPosition
			end

			local var_174_36 = 0.001

			if var_174_35 <= arg_171_1.time_ and arg_171_1.time_ < var_174_35 + var_174_36 then
				local var_174_37 = (arg_171_1.time_ - var_174_35) / var_174_36
				local var_174_38 = Vector3.New(-0.7, -0.97, -6)

				var_174_34.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1084ui_story, var_174_38, var_174_37)

				local var_174_39 = manager.ui.mainCamera.transform.position - var_174_34.position

				var_174_34.forward = Vector3.New(var_174_39.x, var_174_39.y, var_174_39.z)

				local var_174_40 = var_174_34.localEulerAngles

				var_174_40.z = 0
				var_174_40.x = 0
				var_174_34.localEulerAngles = var_174_40
			end

			if arg_171_1.time_ >= var_174_35 + var_174_36 and arg_171_1.time_ < var_174_35 + var_174_36 + arg_174_0 then
				var_174_34.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_174_41 = manager.ui.mainCamera.transform.position - var_174_34.position

				var_174_34.forward = Vector3.New(var_174_41.x, var_174_41.y, var_174_41.z)

				local var_174_42 = var_174_34.localEulerAngles

				var_174_42.z = 0
				var_174_42.x = 0
				var_174_34.localEulerAngles = var_174_42
			end

			local var_174_43 = arg_171_1.actors_["1084ui_story"]
			local var_174_44 = 0

			if var_174_44 < arg_171_1.time_ and arg_171_1.time_ <= var_174_44 + arg_174_0 and arg_171_1.var_.characterEffect1084ui_story == nil then
				arg_171_1.var_.characterEffect1084ui_story = var_174_43:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_45 = 0.200000002980232

			if var_174_44 <= arg_171_1.time_ and arg_171_1.time_ < var_174_44 + var_174_45 then
				local var_174_46 = (arg_171_1.time_ - var_174_44) / var_174_45

				if arg_171_1.var_.characterEffect1084ui_story then
					local var_174_47 = Mathf.Lerp(0, 0.5, var_174_46)

					arg_171_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1084ui_story.fillRatio = var_174_47
				end
			end

			if arg_171_1.time_ >= var_174_44 + var_174_45 and arg_171_1.time_ < var_174_44 + var_174_45 + arg_174_0 and arg_171_1.var_.characterEffect1084ui_story then
				local var_174_48 = 0.5

				arg_171_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1084ui_story.fillRatio = var_174_48
			end

			local var_174_49 = 0
			local var_174_50 = 0.45

			if var_174_49 < arg_171_1.time_ and arg_171_1.time_ <= var_174_49 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_51 = arg_171_1:FormatText(StoryNameCfg[692].name)

				arg_171_1.leftNameTxt_.text = var_174_51

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_52 = arg_171_1:GetWordFromCfg(319841040)
				local var_174_53 = arg_171_1:FormatText(var_174_52.content)

				arg_171_1.text_.text = var_174_53

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_54 = 18
				local var_174_55 = utf8.len(var_174_53)
				local var_174_56 = var_174_54 <= 0 and var_174_50 or var_174_50 * (var_174_55 / var_174_54)

				if var_174_56 > 0 and var_174_50 < var_174_56 then
					arg_171_1.talkMaxDuration = var_174_56

					if var_174_56 + var_174_49 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_56 + var_174_49
					end
				end

				arg_171_1.text_.text = var_174_53
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841040", "story_v_out_319841.awb") ~= 0 then
					local var_174_57 = manager.audio:GetVoiceLength("story_v_out_319841", "319841040", "story_v_out_319841.awb") / 1000

					if var_174_57 + var_174_49 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_57 + var_174_49
					end

					if var_174_52.prefab_name ~= "" and arg_171_1.actors_[var_174_52.prefab_name] ~= nil then
						local var_174_58 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_52.prefab_name].transform, "story_v_out_319841", "319841040", "story_v_out_319841.awb")

						arg_171_1:RecordAudio("319841040", var_174_58)
						arg_171_1:RecordAudio("319841040", var_174_58)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319841", "319841040", "story_v_out_319841.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319841", "319841040", "story_v_out_319841.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_59 = math.max(var_174_50, arg_171_1.talkMaxDuration)

			if var_174_49 <= arg_171_1.time_ and arg_171_1.time_ < var_174_49 + var_174_59 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_49) / var_174_59

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_49 + var_174_59 and arg_171_1.time_ < var_174_49 + var_174_59 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play319841041 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319841041
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play319841042(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10050ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect10050ui_story == nil then
				arg_175_1.var_.characterEffect10050ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect10050ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10050ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect10050ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10050ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0
			local var_178_7 = 1.1

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_8 = arg_175_1:GetWordFromCfg(319841041)
				local var_178_9 = arg_175_1:FormatText(var_178_8.content)

				arg_175_1.text_.text = var_178_9

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_10 = 44
				local var_178_11 = utf8.len(var_178_9)
				local var_178_12 = var_178_10 <= 0 and var_178_7 or var_178_7 * (var_178_11 / var_178_10)

				if var_178_12 > 0 and var_178_7 < var_178_12 then
					arg_175_1.talkMaxDuration = var_178_12

					if var_178_12 + var_178_6 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_12 + var_178_6
					end
				end

				arg_175_1.text_.text = var_178_9
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_13 = math.max(var_178_7, arg_175_1.talkMaxDuration)

			if var_178_6 <= arg_175_1.time_ and arg_175_1.time_ < var_178_6 + var_178_13 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_6) / var_178_13

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_6 + var_178_13 and arg_175_1.time_ < var_178_6 + var_178_13 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play319841042 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319841042
		arg_179_1.duration_ = 6.2

		local var_179_0 = {
			zh = 6.2,
			ja = 6.1
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
				arg_179_0:Play319841043(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["10050ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect10050ui_story == nil then
				arg_179_1.var_.characterEffect10050ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect10050ui_story then
					arg_179_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect10050ui_story then
				arg_179_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_182_4 = 0

			if var_182_4 < arg_179_1.time_ and arg_179_1.time_ <= var_182_4 + arg_182_0 then
				arg_179_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 then
				arg_179_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050actionlink/10050action4211")
			end

			local var_182_6 = 0
			local var_182_7 = 0.75

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[692].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(319841042)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 30
				local var_182_12 = utf8.len(var_182_10)
				local var_182_13 = var_182_11 <= 0 and var_182_7 or var_182_7 * (var_182_12 / var_182_11)

				if var_182_13 > 0 and var_182_7 < var_182_13 then
					arg_179_1.talkMaxDuration = var_182_13

					if var_182_13 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_13 + var_182_6
					end
				end

				arg_179_1.text_.text = var_182_10
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841042", "story_v_out_319841.awb") ~= 0 then
					local var_182_14 = manager.audio:GetVoiceLength("story_v_out_319841", "319841042", "story_v_out_319841.awb") / 1000

					if var_182_14 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_14 + var_182_6
					end

					if var_182_9.prefab_name ~= "" and arg_179_1.actors_[var_182_9.prefab_name] ~= nil then
						local var_182_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_9.prefab_name].transform, "story_v_out_319841", "319841042", "story_v_out_319841.awb")

						arg_179_1:RecordAudio("319841042", var_182_15)
						arg_179_1:RecordAudio("319841042", var_182_15)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319841", "319841042", "story_v_out_319841.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319841", "319841042", "story_v_out_319841.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_16 = math.max(var_182_7, arg_179_1.talkMaxDuration)

			if var_182_6 <= arg_179_1.time_ and arg_179_1.time_ < var_182_6 + var_182_16 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_6) / var_182_16

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_6 + var_182_16 and arg_179_1.time_ < var_182_6 + var_182_16 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319841043 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319841043
		arg_183_1.duration_ = 3.033

		local var_183_0 = {
			zh = 1.066,
			ja = 3.033
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
				arg_183_0:Play319841044(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0
			local var_186_1 = 0.1

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_2 = arg_183_1:FormatText(StoryNameCfg[692].name)

				arg_183_1.leftNameTxt_.text = var_186_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_3 = arg_183_1:GetWordFromCfg(319841043)
				local var_186_4 = arg_183_1:FormatText(var_186_3.content)

				arg_183_1.text_.text = var_186_4

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_5 = 4
				local var_186_6 = utf8.len(var_186_4)
				local var_186_7 = var_186_5 <= 0 and var_186_1 or var_186_1 * (var_186_6 / var_186_5)

				if var_186_7 > 0 and var_186_1 < var_186_7 then
					arg_183_1.talkMaxDuration = var_186_7

					if var_186_7 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_7 + var_186_0
					end
				end

				arg_183_1.text_.text = var_186_4
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841043", "story_v_out_319841.awb") ~= 0 then
					local var_186_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841043", "story_v_out_319841.awb") / 1000

					if var_186_8 + var_186_0 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_8 + var_186_0
					end

					if var_186_3.prefab_name ~= "" and arg_183_1.actors_[var_186_3.prefab_name] ~= nil then
						local var_186_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_3.prefab_name].transform, "story_v_out_319841", "319841043", "story_v_out_319841.awb")

						arg_183_1:RecordAudio("319841043", var_186_9)
						arg_183_1:RecordAudio("319841043", var_186_9)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_319841", "319841043", "story_v_out_319841.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_319841", "319841043", "story_v_out_319841.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_10 = math.max(var_186_1, arg_183_1.talkMaxDuration)

			if var_186_0 <= arg_183_1.time_ and arg_183_1.time_ < var_186_0 + var_186_10 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_0) / var_186_10

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_0 + var_186_10 and arg_183_1.time_ < var_186_0 + var_186_10 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319841044 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319841044
		arg_187_1.duration_ = 6.8

		local var_187_0 = {
			zh = 4.5,
			ja = 6.8
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
				arg_187_0:Play319841045(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1084ui_story"].transform
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 then
				arg_187_1.var_.moveOldPos1084ui_story = var_190_0.localPosition
			end

			local var_190_2 = 0.001

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2
				local var_190_4 = Vector3.New(-0.7, -0.97, -6)

				var_190_0.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos1084ui_story, var_190_4, var_190_3)

				local var_190_5 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_5.x, var_190_5.y, var_190_5.z)

				local var_190_6 = var_190_0.localEulerAngles

				var_190_6.z = 0
				var_190_6.x = 0
				var_190_0.localEulerAngles = var_190_6
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 then
				var_190_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_190_7 = manager.ui.mainCamera.transform.position - var_190_0.position

				var_190_0.forward = Vector3.New(var_190_7.x, var_190_7.y, var_190_7.z)

				local var_190_8 = var_190_0.localEulerAngles

				var_190_8.z = 0
				var_190_8.x = 0
				var_190_0.localEulerAngles = var_190_8
			end

			local var_190_9 = arg_187_1.actors_["1084ui_story"]
			local var_190_10 = 0

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 and arg_187_1.var_.characterEffect1084ui_story == nil then
				arg_187_1.var_.characterEffect1084ui_story = var_190_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_11 = 0.200000002980232

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_11 then
				local var_190_12 = (arg_187_1.time_ - var_190_10) / var_190_11

				if arg_187_1.var_.characterEffect1084ui_story then
					arg_187_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_10 + var_190_11 and arg_187_1.time_ < var_190_10 + var_190_11 + arg_190_0 and arg_187_1.var_.characterEffect1084ui_story then
				arg_187_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_190_13 = 0

			if var_190_13 < arg_187_1.time_ and arg_187_1.time_ <= var_190_13 + arg_190_0 then
				arg_187_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_190_14 = 0

			if var_190_14 < arg_187_1.time_ and arg_187_1.time_ <= var_190_14 + arg_190_0 then
				arg_187_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_190_15 = arg_187_1.actors_["10050ui_story"].transform
			local var_190_16 = 0

			if var_190_16 < arg_187_1.time_ and arg_187_1.time_ <= var_190_16 + arg_190_0 then
				arg_187_1.var_.moveOldPos10050ui_story = var_190_15.localPosition
			end

			local var_190_17 = 0.001

			if var_190_16 <= arg_187_1.time_ and arg_187_1.time_ < var_190_16 + var_190_17 then
				local var_190_18 = (arg_187_1.time_ - var_190_16) / var_190_17
				local var_190_19 = Vector3.New(0.7, -0.715, -6.15)

				var_190_15.localPosition = Vector3.Lerp(arg_187_1.var_.moveOldPos10050ui_story, var_190_19, var_190_18)

				local var_190_20 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_20.x, var_190_20.y, var_190_20.z)

				local var_190_21 = var_190_15.localEulerAngles

				var_190_21.z = 0
				var_190_21.x = 0
				var_190_15.localEulerAngles = var_190_21
			end

			if arg_187_1.time_ >= var_190_16 + var_190_17 and arg_187_1.time_ < var_190_16 + var_190_17 + arg_190_0 then
				var_190_15.localPosition = Vector3.New(0.7, -0.715, -6.15)

				local var_190_22 = manager.ui.mainCamera.transform.position - var_190_15.position

				var_190_15.forward = Vector3.New(var_190_22.x, var_190_22.y, var_190_22.z)

				local var_190_23 = var_190_15.localEulerAngles

				var_190_23.z = 0
				var_190_23.x = 0
				var_190_15.localEulerAngles = var_190_23
			end

			local var_190_24 = arg_187_1.actors_["10050ui_story"]
			local var_190_25 = 0

			if var_190_25 < arg_187_1.time_ and arg_187_1.time_ <= var_190_25 + arg_190_0 and arg_187_1.var_.characterEffect10050ui_story == nil then
				arg_187_1.var_.characterEffect10050ui_story = var_190_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_26 = 0.200000002980232

			if var_190_25 <= arg_187_1.time_ and arg_187_1.time_ < var_190_25 + var_190_26 then
				local var_190_27 = (arg_187_1.time_ - var_190_25) / var_190_26

				if arg_187_1.var_.characterEffect10050ui_story then
					local var_190_28 = Mathf.Lerp(0, 0.5, var_190_27)

					arg_187_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_187_1.var_.characterEffect10050ui_story.fillRatio = var_190_28
				end
			end

			if arg_187_1.time_ >= var_190_25 + var_190_26 and arg_187_1.time_ < var_190_25 + var_190_26 + arg_190_0 and arg_187_1.var_.characterEffect10050ui_story then
				local var_190_29 = 0.5

				arg_187_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_187_1.var_.characterEffect10050ui_story.fillRatio = var_190_29
			end

			local var_190_30 = 0
			local var_190_31 = 0.55

			if var_190_30 < arg_187_1.time_ and arg_187_1.time_ <= var_190_30 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_32 = arg_187_1:FormatText(StoryNameCfg[6].name)

				arg_187_1.leftNameTxt_.text = var_190_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_33 = arg_187_1:GetWordFromCfg(319841044)
				local var_190_34 = arg_187_1:FormatText(var_190_33.content)

				arg_187_1.text_.text = var_190_34

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_35 = 22
				local var_190_36 = utf8.len(var_190_34)
				local var_190_37 = var_190_35 <= 0 and var_190_31 or var_190_31 * (var_190_36 / var_190_35)

				if var_190_37 > 0 and var_190_31 < var_190_37 then
					arg_187_1.talkMaxDuration = var_190_37

					if var_190_37 + var_190_30 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_37 + var_190_30
					end
				end

				arg_187_1.text_.text = var_190_34
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841044", "story_v_out_319841.awb") ~= 0 then
					local var_190_38 = manager.audio:GetVoiceLength("story_v_out_319841", "319841044", "story_v_out_319841.awb") / 1000

					if var_190_38 + var_190_30 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_38 + var_190_30
					end

					if var_190_33.prefab_name ~= "" and arg_187_1.actors_[var_190_33.prefab_name] ~= nil then
						local var_190_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_33.prefab_name].transform, "story_v_out_319841", "319841044", "story_v_out_319841.awb")

						arg_187_1:RecordAudio("319841044", var_190_39)
						arg_187_1:RecordAudio("319841044", var_190_39)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_319841", "319841044", "story_v_out_319841.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_319841", "319841044", "story_v_out_319841.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_40 = math.max(var_190_31, arg_187_1.talkMaxDuration)

			if var_190_30 <= arg_187_1.time_ and arg_187_1.time_ < var_190_30 + var_190_40 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_30) / var_190_40

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_30 + var_190_40 and arg_187_1.time_ < var_190_30 + var_190_40 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play319841045 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319841045
		arg_191_1.duration_ = 8.633

		local var_191_0 = {
			zh = 6.066,
			ja = 8.633
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
				arg_191_0:Play319841046(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_194_2 = 0
			local var_194_3 = 0.775

			if var_194_2 < arg_191_1.time_ and arg_191_1.time_ <= var_194_2 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_4 = arg_191_1:FormatText(StoryNameCfg[6].name)

				arg_191_1.leftNameTxt_.text = var_194_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_5 = arg_191_1:GetWordFromCfg(319841045)
				local var_194_6 = arg_191_1:FormatText(var_194_5.content)

				arg_191_1.text_.text = var_194_6

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_7 = 31
				local var_194_8 = utf8.len(var_194_6)
				local var_194_9 = var_194_7 <= 0 and var_194_3 or var_194_3 * (var_194_8 / var_194_7)

				if var_194_9 > 0 and var_194_3 < var_194_9 then
					arg_191_1.talkMaxDuration = var_194_9

					if var_194_9 + var_194_2 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_9 + var_194_2
					end
				end

				arg_191_1.text_.text = var_194_6
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841045", "story_v_out_319841.awb") ~= 0 then
					local var_194_10 = manager.audio:GetVoiceLength("story_v_out_319841", "319841045", "story_v_out_319841.awb") / 1000

					if var_194_10 + var_194_2 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_10 + var_194_2
					end

					if var_194_5.prefab_name ~= "" and arg_191_1.actors_[var_194_5.prefab_name] ~= nil then
						local var_194_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_5.prefab_name].transform, "story_v_out_319841", "319841045", "story_v_out_319841.awb")

						arg_191_1:RecordAudio("319841045", var_194_11)
						arg_191_1:RecordAudio("319841045", var_194_11)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319841", "319841045", "story_v_out_319841.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319841", "319841045", "story_v_out_319841.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_12 = math.max(var_194_3, arg_191_1.talkMaxDuration)

			if var_194_2 <= arg_191_1.time_ and arg_191_1.time_ < var_194_2 + var_194_12 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_2) / var_194_12

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_2 + var_194_12 and arg_191_1.time_ < var_194_2 + var_194_12 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play319841046 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319841046
		arg_195_1.duration_ = 15.4

		local var_195_0 = {
			zh = 15.4,
			ja = 12.466
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
				arg_195_0:Play319841047(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["10050ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect10050ui_story == nil then
				arg_195_1.var_.characterEffect10050ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect10050ui_story then
					arg_195_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect10050ui_story then
				arg_195_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_198_4 = arg_195_1.actors_["1084ui_story"]
			local var_198_5 = 0

			if var_198_5 < arg_195_1.time_ and arg_195_1.time_ <= var_198_5 + arg_198_0 and arg_195_1.var_.characterEffect1084ui_story == nil then
				arg_195_1.var_.characterEffect1084ui_story = var_198_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_6 = 0.200000002980232

			if var_198_5 <= arg_195_1.time_ and arg_195_1.time_ < var_198_5 + var_198_6 then
				local var_198_7 = (arg_195_1.time_ - var_198_5) / var_198_6

				if arg_195_1.var_.characterEffect1084ui_story then
					local var_198_8 = Mathf.Lerp(0, 0.5, var_198_7)

					arg_195_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1084ui_story.fillRatio = var_198_8
				end
			end

			if arg_195_1.time_ >= var_198_5 + var_198_6 and arg_195_1.time_ < var_198_5 + var_198_6 + arg_198_0 and arg_195_1.var_.characterEffect1084ui_story then
				local var_198_9 = 0.5

				arg_195_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1084ui_story.fillRatio = var_198_9
			end

			local var_198_10 = 0
			local var_198_11 = 1.35

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_12 = arg_195_1:FormatText(StoryNameCfg[692].name)

				arg_195_1.leftNameTxt_.text = var_198_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_13 = arg_195_1:GetWordFromCfg(319841046)
				local var_198_14 = arg_195_1:FormatText(var_198_13.content)

				arg_195_1.text_.text = var_198_14

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_15 = 54
				local var_198_16 = utf8.len(var_198_14)
				local var_198_17 = var_198_15 <= 0 and var_198_11 or var_198_11 * (var_198_16 / var_198_15)

				if var_198_17 > 0 and var_198_11 < var_198_17 then
					arg_195_1.talkMaxDuration = var_198_17

					if var_198_17 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_17 + var_198_10
					end
				end

				arg_195_1.text_.text = var_198_14
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841046", "story_v_out_319841.awb") ~= 0 then
					local var_198_18 = manager.audio:GetVoiceLength("story_v_out_319841", "319841046", "story_v_out_319841.awb") / 1000

					if var_198_18 + var_198_10 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_18 + var_198_10
					end

					if var_198_13.prefab_name ~= "" and arg_195_1.actors_[var_198_13.prefab_name] ~= nil then
						local var_198_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_13.prefab_name].transform, "story_v_out_319841", "319841046", "story_v_out_319841.awb")

						arg_195_1:RecordAudio("319841046", var_198_19)
						arg_195_1:RecordAudio("319841046", var_198_19)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_319841", "319841046", "story_v_out_319841.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_319841", "319841046", "story_v_out_319841.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_20 = math.max(var_198_11, arg_195_1.talkMaxDuration)

			if var_198_10 <= arg_195_1.time_ and arg_195_1.time_ < var_198_10 + var_198_20 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_10) / var_198_20

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_10 + var_198_20 and arg_195_1.time_ < var_198_10 + var_198_20 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319841047 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319841047
		arg_199_1.duration_ = 9.633

		local var_199_0 = {
			zh = 9.4,
			ja = 9.633
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
				arg_199_0:Play319841048(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/story10050/story10050action/10050action11_2")
			end

			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 then
				arg_199_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_202_2 = 0
			local var_202_3 = 0.975

			if var_202_2 < arg_199_1.time_ and arg_199_1.time_ <= var_202_2 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_4 = arg_199_1:FormatText(StoryNameCfg[692].name)

				arg_199_1.leftNameTxt_.text = var_202_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_5 = arg_199_1:GetWordFromCfg(319841047)
				local var_202_6 = arg_199_1:FormatText(var_202_5.content)

				arg_199_1.text_.text = var_202_6

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_7 = 39
				local var_202_8 = utf8.len(var_202_6)
				local var_202_9 = var_202_7 <= 0 and var_202_3 or var_202_3 * (var_202_8 / var_202_7)

				if var_202_9 > 0 and var_202_3 < var_202_9 then
					arg_199_1.talkMaxDuration = var_202_9

					if var_202_9 + var_202_2 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_9 + var_202_2
					end
				end

				arg_199_1.text_.text = var_202_6
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841047", "story_v_out_319841.awb") ~= 0 then
					local var_202_10 = manager.audio:GetVoiceLength("story_v_out_319841", "319841047", "story_v_out_319841.awb") / 1000

					if var_202_10 + var_202_2 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_10 + var_202_2
					end

					if var_202_5.prefab_name ~= "" and arg_199_1.actors_[var_202_5.prefab_name] ~= nil then
						local var_202_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_5.prefab_name].transform, "story_v_out_319841", "319841047", "story_v_out_319841.awb")

						arg_199_1:RecordAudio("319841047", var_202_11)
						arg_199_1:RecordAudio("319841047", var_202_11)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_319841", "319841047", "story_v_out_319841.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_319841", "319841047", "story_v_out_319841.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_12 = math.max(var_202_3, arg_199_1.talkMaxDuration)

			if var_202_2 <= arg_199_1.time_ and arg_199_1.time_ < var_202_2 + var_202_12 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_2) / var_202_12

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_2 + var_202_12 and arg_199_1.time_ < var_202_2 + var_202_12 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play319841048 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319841048
		arg_203_1.duration_ = 19.266

		local var_203_0 = {
			zh = 12.933,
			ja = 19.266
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
				arg_203_0:Play319841049(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_206_1 = 0
			local var_206_2 = 1.275

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_3 = arg_203_1:FormatText(StoryNameCfg[692].name)

				arg_203_1.leftNameTxt_.text = var_206_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_4 = arg_203_1:GetWordFromCfg(319841048)
				local var_206_5 = arg_203_1:FormatText(var_206_4.content)

				arg_203_1.text_.text = var_206_5

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_6 = 51
				local var_206_7 = utf8.len(var_206_5)
				local var_206_8 = var_206_6 <= 0 and var_206_2 or var_206_2 * (var_206_7 / var_206_6)

				if var_206_8 > 0 and var_206_2 < var_206_8 then
					arg_203_1.talkMaxDuration = var_206_8

					if var_206_8 + var_206_1 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_1
					end
				end

				arg_203_1.text_.text = var_206_5
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841048", "story_v_out_319841.awb") ~= 0 then
					local var_206_9 = manager.audio:GetVoiceLength("story_v_out_319841", "319841048", "story_v_out_319841.awb") / 1000

					if var_206_9 + var_206_1 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_9 + var_206_1
					end

					if var_206_4.prefab_name ~= "" and arg_203_1.actors_[var_206_4.prefab_name] ~= nil then
						local var_206_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_4.prefab_name].transform, "story_v_out_319841", "319841048", "story_v_out_319841.awb")

						arg_203_1:RecordAudio("319841048", var_206_10)
						arg_203_1:RecordAudio("319841048", var_206_10)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319841", "319841048", "story_v_out_319841.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319841", "319841048", "story_v_out_319841.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_11 = math.max(var_206_2, arg_203_1.talkMaxDuration)

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_11 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_1) / var_206_11

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_1 + var_206_11 and arg_203_1.time_ < var_206_1 + var_206_11 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play319841049 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319841049
		arg_207_1.duration_ = 1.999999999999

		SetActive(arg_207_1.tipsGo_, false)

		function arg_207_1.onSingleLineFinish_()
			arg_207_1.onSingleLineUpdate_ = nil
			arg_207_1.onSingleLineFinish_ = nil
			arg_207_1.state_ = "waiting"
		end

		function arg_207_1.playNext_(arg_209_0)
			if arg_209_0 == 1 then
				arg_207_0:Play319841050(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1084ui_story"].transform
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 then
				arg_207_1.var_.moveOldPos1084ui_story = var_210_0.localPosition
			end

			local var_210_2 = 0.001

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2
				local var_210_4 = Vector3.New(-0.7, -0.97, -6)

				var_210_0.localPosition = Vector3.Lerp(arg_207_1.var_.moveOldPos1084ui_story, var_210_4, var_210_3)

				local var_210_5 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_5.x, var_210_5.y, var_210_5.z)

				local var_210_6 = var_210_0.localEulerAngles

				var_210_6.z = 0
				var_210_6.x = 0
				var_210_0.localEulerAngles = var_210_6
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 then
				var_210_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_210_7 = manager.ui.mainCamera.transform.position - var_210_0.position

				var_210_0.forward = Vector3.New(var_210_7.x, var_210_7.y, var_210_7.z)

				local var_210_8 = var_210_0.localEulerAngles

				var_210_8.z = 0
				var_210_8.x = 0
				var_210_0.localEulerAngles = var_210_8
			end

			local var_210_9 = arg_207_1.actors_["1084ui_story"]
			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story == nil then
				arg_207_1.var_.characterEffect1084ui_story = var_210_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_11 = 0.200000002980232

			if var_210_10 <= arg_207_1.time_ and arg_207_1.time_ < var_210_10 + var_210_11 then
				local var_210_12 = (arg_207_1.time_ - var_210_10) / var_210_11

				if arg_207_1.var_.characterEffect1084ui_story then
					arg_207_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_10 + var_210_11 and arg_207_1.time_ < var_210_10 + var_210_11 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story then
				arg_207_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_210_13 = 0

			if var_210_13 < arg_207_1.time_ and arg_207_1.time_ <= var_210_13 + arg_210_0 then
				arg_207_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_2")
			end

			local var_210_14 = 0

			if var_210_14 < arg_207_1.time_ and arg_207_1.time_ <= var_210_14 + arg_210_0 then
				arg_207_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_210_15 = arg_207_1.actors_["10050ui_story"]
			local var_210_16 = 0

			if var_210_16 < arg_207_1.time_ and arg_207_1.time_ <= var_210_16 + arg_210_0 and arg_207_1.var_.characterEffect10050ui_story == nil then
				arg_207_1.var_.characterEffect10050ui_story = var_210_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_17 = 0.200000002980232

			if var_210_16 <= arg_207_1.time_ and arg_207_1.time_ < var_210_16 + var_210_17 then
				local var_210_18 = (arg_207_1.time_ - var_210_16) / var_210_17

				if arg_207_1.var_.characterEffect10050ui_story then
					local var_210_19 = Mathf.Lerp(0, 0.5, var_210_18)

					arg_207_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_207_1.var_.characterEffect10050ui_story.fillRatio = var_210_19
				end
			end

			if arg_207_1.time_ >= var_210_16 + var_210_17 and arg_207_1.time_ < var_210_16 + var_210_17 + arg_210_0 and arg_207_1.var_.characterEffect10050ui_story then
				local var_210_20 = 0.5

				arg_207_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_207_1.var_.characterEffect10050ui_story.fillRatio = var_210_20
			end

			local var_210_21 = 0
			local var_210_22 = 0.075

			if var_210_21 < arg_207_1.time_ and arg_207_1.time_ <= var_210_21 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_23 = arg_207_1:FormatText(StoryNameCfg[6].name)

				arg_207_1.leftNameTxt_.text = var_210_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_24 = arg_207_1:GetWordFromCfg(319841049)
				local var_210_25 = arg_207_1:FormatText(var_210_24.content)

				arg_207_1.text_.text = var_210_25

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_26 = 3
				local var_210_27 = utf8.len(var_210_25)
				local var_210_28 = var_210_26 <= 0 and var_210_22 or var_210_22 * (var_210_27 / var_210_26)

				if var_210_28 > 0 and var_210_22 < var_210_28 then
					arg_207_1.talkMaxDuration = var_210_28

					if var_210_28 + var_210_21 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_28 + var_210_21
					end
				end

				arg_207_1.text_.text = var_210_25
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841049", "story_v_out_319841.awb") ~= 0 then
					local var_210_29 = manager.audio:GetVoiceLength("story_v_out_319841", "319841049", "story_v_out_319841.awb") / 1000

					if var_210_29 + var_210_21 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_29 + var_210_21
					end

					if var_210_24.prefab_name ~= "" and arg_207_1.actors_[var_210_24.prefab_name] ~= nil then
						local var_210_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_24.prefab_name].transform, "story_v_out_319841", "319841049", "story_v_out_319841.awb")

						arg_207_1:RecordAudio("319841049", var_210_30)
						arg_207_1:RecordAudio("319841049", var_210_30)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319841", "319841049", "story_v_out_319841.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319841", "319841049", "story_v_out_319841.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_31 = math.max(var_210_22, arg_207_1.talkMaxDuration)

			if var_210_21 <= arg_207_1.time_ and arg_207_1.time_ < var_210_21 + var_210_31 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_21) / var_210_31

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_21 + var_210_31 and arg_207_1.time_ < var_210_21 + var_210_31 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play319841050 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319841050
		arg_211_1.duration_ = 5.74554639732651

		local var_211_0 = {
			zh = 4.41254639732651,
			ja = 5.74554639732651
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
				arg_211_0:Play319841051(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10069ui_story"].transform
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 then
				arg_211_1.var_.moveOldPos10069ui_story = var_214_0.localPosition
			end

			local var_214_2 = 0.001

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2
				local var_214_4 = Vector3.New(0, -1.08, -6.33)

				var_214_0.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10069ui_story, var_214_4, var_214_3)

				local var_214_5 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_5.x, var_214_5.y, var_214_5.z)

				local var_214_6 = var_214_0.localEulerAngles

				var_214_6.z = 0
				var_214_6.x = 0
				var_214_0.localEulerAngles = var_214_6
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 then
				var_214_0.localPosition = Vector3.New(0, -1.08, -6.33)

				local var_214_7 = manager.ui.mainCamera.transform.position - var_214_0.position

				var_214_0.forward = Vector3.New(var_214_7.x, var_214_7.y, var_214_7.z)

				local var_214_8 = var_214_0.localEulerAngles

				var_214_8.z = 0
				var_214_8.x = 0
				var_214_0.localEulerAngles = var_214_8
			end

			local var_214_9 = arg_211_1.actors_["10069ui_story"]
			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 and arg_211_1.var_.characterEffect10069ui_story == nil then
				arg_211_1.var_.characterEffect10069ui_story = var_214_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_11 = 0.200000002980232

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_11 then
				local var_214_12 = (arg_211_1.time_ - var_214_10) / var_214_11

				if arg_211_1.var_.characterEffect10069ui_story then
					arg_211_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_10 + var_214_11 and arg_211_1.time_ < var_214_10 + var_214_11 + arg_214_0 and arg_211_1.var_.characterEffect10069ui_story then
				arg_211_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_214_13 = 0

			if var_214_13 < arg_211_1.time_ and arg_211_1.time_ <= var_214_13 + arg_214_0 then
				arg_211_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action6_2")
			end

			local var_214_14 = 0

			if var_214_14 < arg_211_1.time_ and arg_211_1.time_ <= var_214_14 + arg_214_0 then
				arg_211_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_214_15 = arg_211_1.actors_["1084ui_story"].transform
			local var_214_16 = 0

			if var_214_16 < arg_211_1.time_ and arg_211_1.time_ <= var_214_16 + arg_214_0 then
				arg_211_1.var_.moveOldPos1084ui_story = var_214_15.localPosition
			end

			local var_214_17 = 0.001

			if var_214_16 <= arg_211_1.time_ and arg_211_1.time_ < var_214_16 + var_214_17 then
				local var_214_18 = (arg_211_1.time_ - var_214_16) / var_214_17
				local var_214_19 = Vector3.New(0, 100, 0)

				var_214_15.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos1084ui_story, var_214_19, var_214_18)

				local var_214_20 = manager.ui.mainCamera.transform.position - var_214_15.position

				var_214_15.forward = Vector3.New(var_214_20.x, var_214_20.y, var_214_20.z)

				local var_214_21 = var_214_15.localEulerAngles

				var_214_21.z = 0
				var_214_21.x = 0
				var_214_15.localEulerAngles = var_214_21
			end

			if arg_211_1.time_ >= var_214_16 + var_214_17 and arg_211_1.time_ < var_214_16 + var_214_17 + arg_214_0 then
				var_214_15.localPosition = Vector3.New(0, 100, 0)

				local var_214_22 = manager.ui.mainCamera.transform.position - var_214_15.position

				var_214_15.forward = Vector3.New(var_214_22.x, var_214_22.y, var_214_22.z)

				local var_214_23 = var_214_15.localEulerAngles

				var_214_23.z = 0
				var_214_23.x = 0
				var_214_15.localEulerAngles = var_214_23
			end

			local var_214_24 = arg_211_1.actors_["1084ui_story"]
			local var_214_25 = 0

			if var_214_25 < arg_211_1.time_ and arg_211_1.time_ <= var_214_25 + arg_214_0 and arg_211_1.var_.characterEffect1084ui_story == nil then
				arg_211_1.var_.characterEffect1084ui_story = var_214_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_26 = 0.200000002980232

			if var_214_25 <= arg_211_1.time_ and arg_211_1.time_ < var_214_25 + var_214_26 then
				local var_214_27 = (arg_211_1.time_ - var_214_25) / var_214_26

				if arg_211_1.var_.characterEffect1084ui_story then
					local var_214_28 = Mathf.Lerp(0, 0.5, var_214_27)

					arg_211_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1084ui_story.fillRatio = var_214_28
				end
			end

			if arg_211_1.time_ >= var_214_25 + var_214_26 and arg_211_1.time_ < var_214_25 + var_214_26 + arg_214_0 and arg_211_1.var_.characterEffect1084ui_story then
				local var_214_29 = 0.5

				arg_211_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1084ui_story.fillRatio = var_214_29
			end

			local var_214_30 = arg_211_1.actors_["10050ui_story"].transform
			local var_214_31 = 0

			if var_214_31 < arg_211_1.time_ and arg_211_1.time_ <= var_214_31 + arg_214_0 then
				arg_211_1.var_.moveOldPos10050ui_story = var_214_30.localPosition
			end

			local var_214_32 = 0.001

			if var_214_31 <= arg_211_1.time_ and arg_211_1.time_ < var_214_31 + var_214_32 then
				local var_214_33 = (arg_211_1.time_ - var_214_31) / var_214_32
				local var_214_34 = Vector3.New(0, 100, 0)

				var_214_30.localPosition = Vector3.Lerp(arg_211_1.var_.moveOldPos10050ui_story, var_214_34, var_214_33)

				local var_214_35 = manager.ui.mainCamera.transform.position - var_214_30.position

				var_214_30.forward = Vector3.New(var_214_35.x, var_214_35.y, var_214_35.z)

				local var_214_36 = var_214_30.localEulerAngles

				var_214_36.z = 0
				var_214_36.x = 0
				var_214_30.localEulerAngles = var_214_36
			end

			if arg_211_1.time_ >= var_214_31 + var_214_32 and arg_211_1.time_ < var_214_31 + var_214_32 + arg_214_0 then
				var_214_30.localPosition = Vector3.New(0, 100, 0)

				local var_214_37 = manager.ui.mainCamera.transform.position - var_214_30.position

				var_214_30.forward = Vector3.New(var_214_37.x, var_214_37.y, var_214_37.z)

				local var_214_38 = var_214_30.localEulerAngles

				var_214_38.z = 0
				var_214_38.x = 0
				var_214_30.localEulerAngles = var_214_38
			end

			local var_214_39 = arg_211_1.actors_["10050ui_story"]
			local var_214_40 = 0

			if var_214_40 < arg_211_1.time_ and arg_211_1.time_ <= var_214_40 + arg_214_0 and arg_211_1.var_.characterEffect10050ui_story == nil then
				arg_211_1.var_.characterEffect10050ui_story = var_214_39:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_41 = 0.200000002980232

			if var_214_40 <= arg_211_1.time_ and arg_211_1.time_ < var_214_40 + var_214_41 then
				local var_214_42 = (arg_211_1.time_ - var_214_40) / var_214_41

				if arg_211_1.var_.characterEffect10050ui_story then
					local var_214_43 = Mathf.Lerp(0, 0.5, var_214_42)

					arg_211_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_211_1.var_.characterEffect10050ui_story.fillRatio = var_214_43
				end
			end

			if arg_211_1.time_ >= var_214_40 + var_214_41 and arg_211_1.time_ < var_214_40 + var_214_41 + arg_214_0 and arg_211_1.var_.characterEffect10050ui_story then
				local var_214_44 = 0.5

				arg_211_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_211_1.var_.characterEffect10050ui_story.fillRatio = var_214_44
			end

			if arg_211_1.frameCnt_ <= 1 then
				arg_211_1.dialog_:SetActive(false)
			end

			local var_214_45 = 0.312546397326514
			local var_214_46 = 0.5

			if var_214_45 < arg_211_1.time_ and arg_211_1.time_ <= var_214_45 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0

				arg_211_1.dialog_:SetActive(true)

				local var_214_47 = LeanTween.value(arg_211_1.dialog_, 0, 1, 0.3)

				var_214_47:setOnUpdate(LuaHelper.FloatAction(function(arg_215_0)
					arg_211_1.dialogCg_.alpha = arg_215_0
				end))
				var_214_47:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_211_1.dialog_)
					var_214_47:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_211_1.duration_ = arg_211_1.duration_ + 0.3

				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_48 = arg_211_1:FormatText(StoryNameCfg[693].name)

				arg_211_1.leftNameTxt_.text = var_214_48

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_49 = arg_211_1:GetWordFromCfg(319841050)
				local var_214_50 = arg_211_1:FormatText(var_214_49.content)

				arg_211_1.text_.text = var_214_50

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_51 = 20
				local var_214_52 = utf8.len(var_214_50)
				local var_214_53 = var_214_51 <= 0 and var_214_46 or var_214_46 * (var_214_52 / var_214_51)

				if var_214_53 > 0 and var_214_46 < var_214_53 then
					arg_211_1.talkMaxDuration = var_214_53
					var_214_45 = var_214_45 + 0.3

					if var_214_53 + var_214_45 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_53 + var_214_45
					end
				end

				arg_211_1.text_.text = var_214_50
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841050", "story_v_out_319841.awb") ~= 0 then
					local var_214_54 = manager.audio:GetVoiceLength("story_v_out_319841", "319841050", "story_v_out_319841.awb") / 1000

					if var_214_54 + var_214_45 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_54 + var_214_45
					end

					if var_214_49.prefab_name ~= "" and arg_211_1.actors_[var_214_49.prefab_name] ~= nil then
						local var_214_55 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_49.prefab_name].transform, "story_v_out_319841", "319841050", "story_v_out_319841.awb")

						arg_211_1:RecordAudio("319841050", var_214_55)
						arg_211_1:RecordAudio("319841050", var_214_55)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_319841", "319841050", "story_v_out_319841.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_319841", "319841050", "story_v_out_319841.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_56 = var_214_45 + 0.3
			local var_214_57 = math.max(var_214_46, arg_211_1.talkMaxDuration)

			if var_214_56 <= arg_211_1.time_ and arg_211_1.time_ < var_214_56 + var_214_57 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_56) / var_214_57

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_56 + var_214_57 and arg_211_1.time_ < var_214_56 + var_214_57 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319841051 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 319841051
		arg_217_1.duration_ = 7.866

		local var_217_0 = {
			zh = 4.633,
			ja = 7.866
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
				arg_217_0:Play319841052(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10050ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos10050ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(0.7, -0.715, -6.15)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10050ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(0.7, -0.715, -6.15)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = arg_217_1.actors_["10050ui_story"]
			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect10050ui_story == nil then
				arg_217_1.var_.characterEffect10050ui_story = var_220_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_11 = 0.200000002980232

			if var_220_10 <= arg_217_1.time_ and arg_217_1.time_ < var_220_10 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_10) / var_220_11

				if arg_217_1.var_.characterEffect10050ui_story then
					arg_217_1.var_.characterEffect10050ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_10 + var_220_11 and arg_217_1.time_ < var_220_10 + var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect10050ui_story then
				arg_217_1.var_.characterEffect10050ui_story.fillFlat = false
			end

			local var_220_13 = 0

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_220_14 = arg_217_1.actors_["10069ui_story"].transform
			local var_220_15 = 0

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.var_.moveOldPos10069ui_story = var_220_14.localPosition
			end

			local var_220_16 = 0.001

			if var_220_15 <= arg_217_1.time_ and arg_217_1.time_ < var_220_15 + var_220_16 then
				local var_220_17 = (arg_217_1.time_ - var_220_15) / var_220_16
				local var_220_18 = Vector3.New(-0.7, -1.08, -6.33)

				var_220_14.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10069ui_story, var_220_18, var_220_17)

				local var_220_19 = manager.ui.mainCamera.transform.position - var_220_14.position

				var_220_14.forward = Vector3.New(var_220_19.x, var_220_19.y, var_220_19.z)

				local var_220_20 = var_220_14.localEulerAngles

				var_220_20.z = 0
				var_220_20.x = 0
				var_220_14.localEulerAngles = var_220_20
			end

			if arg_217_1.time_ >= var_220_15 + var_220_16 and arg_217_1.time_ < var_220_15 + var_220_16 + arg_220_0 then
				var_220_14.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_220_21 = manager.ui.mainCamera.transform.position - var_220_14.position

				var_220_14.forward = Vector3.New(var_220_21.x, var_220_21.y, var_220_21.z)

				local var_220_22 = var_220_14.localEulerAngles

				var_220_22.z = 0
				var_220_22.x = 0
				var_220_14.localEulerAngles = var_220_22
			end

			local var_220_23 = arg_217_1.actors_["10069ui_story"]
			local var_220_24 = 0

			if var_220_24 < arg_217_1.time_ and arg_217_1.time_ <= var_220_24 + arg_220_0 and arg_217_1.var_.characterEffect10069ui_story == nil then
				arg_217_1.var_.characterEffect10069ui_story = var_220_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_25 = 0.200000002980232

			if var_220_24 <= arg_217_1.time_ and arg_217_1.time_ < var_220_24 + var_220_25 then
				local var_220_26 = (arg_217_1.time_ - var_220_24) / var_220_25

				if arg_217_1.var_.characterEffect10069ui_story then
					local var_220_27 = Mathf.Lerp(0, 0.5, var_220_26)

					arg_217_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_217_1.var_.characterEffect10069ui_story.fillRatio = var_220_27
				end
			end

			if arg_217_1.time_ >= var_220_24 + var_220_25 and arg_217_1.time_ < var_220_24 + var_220_25 + arg_220_0 and arg_217_1.var_.characterEffect10069ui_story then
				local var_220_28 = 0.5

				arg_217_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_217_1.var_.characterEffect10069ui_story.fillRatio = var_220_28
			end

			local var_220_29 = 0
			local var_220_30 = 0.575

			if var_220_29 < arg_217_1.time_ and arg_217_1.time_ <= var_220_29 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_31 = arg_217_1:FormatText(StoryNameCfg[692].name)

				arg_217_1.leftNameTxt_.text = var_220_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_32 = arg_217_1:GetWordFromCfg(319841051)
				local var_220_33 = arg_217_1:FormatText(var_220_32.content)

				arg_217_1.text_.text = var_220_33

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_34 = 23
				local var_220_35 = utf8.len(var_220_33)
				local var_220_36 = var_220_34 <= 0 and var_220_30 or var_220_30 * (var_220_35 / var_220_34)

				if var_220_36 > 0 and var_220_30 < var_220_36 then
					arg_217_1.talkMaxDuration = var_220_36

					if var_220_36 + var_220_29 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_36 + var_220_29
					end
				end

				arg_217_1.text_.text = var_220_33
				arg_217_1.typewritter.percent = 0

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841051", "story_v_out_319841.awb") ~= 0 then
					local var_220_37 = manager.audio:GetVoiceLength("story_v_out_319841", "319841051", "story_v_out_319841.awb") / 1000

					if var_220_37 + var_220_29 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_37 + var_220_29
					end

					if var_220_32.prefab_name ~= "" and arg_217_1.actors_[var_220_32.prefab_name] ~= nil then
						local var_220_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_32.prefab_name].transform, "story_v_out_319841", "319841051", "story_v_out_319841.awb")

						arg_217_1:RecordAudio("319841051", var_220_38)
						arg_217_1:RecordAudio("319841051", var_220_38)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_319841", "319841051", "story_v_out_319841.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_319841", "319841051", "story_v_out_319841.awb")
				end

				arg_217_1:RecordContent(arg_217_1.text_.text)
			end

			local var_220_39 = math.max(var_220_30, arg_217_1.talkMaxDuration)

			if var_220_29 <= arg_217_1.time_ and arg_217_1.time_ < var_220_29 + var_220_39 then
				arg_217_1.typewritter.percent = (arg_217_1.time_ - var_220_29) / var_220_39

				arg_217_1.typewritter:SetDirty()
			end

			if arg_217_1.time_ >= var_220_29 + var_220_39 and arg_217_1.time_ < var_220_29 + var_220_39 + arg_220_0 then
				arg_217_1.typewritter.percent = 1

				arg_217_1.typewritter:SetDirty()
				arg_217_1:ShowNextGo(true)
			end
		end
	end,
	Play319841052 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 319841052
		arg_221_1.duration_ = 8.533

		local var_221_0 = {
			zh = 6.5,
			ja = 8.533
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
				arg_221_0:Play319841053(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = 0

			if var_224_0 < arg_221_1.time_ and arg_221_1.time_ <= var_224_0 + arg_224_0 then
				arg_221_1:PlayTimeline("10050ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_224_1 = 0
			local var_224_2 = 0.8

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_3 = arg_221_1:FormatText(StoryNameCfg[692].name)

				arg_221_1.leftNameTxt_.text = var_224_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_4 = arg_221_1:GetWordFromCfg(319841052)
				local var_224_5 = arg_221_1:FormatText(var_224_4.content)

				arg_221_1.text_.text = var_224_5

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_6 = 32
				local var_224_7 = utf8.len(var_224_5)
				local var_224_8 = var_224_6 <= 0 and var_224_2 or var_224_2 * (var_224_7 / var_224_6)

				if var_224_8 > 0 and var_224_2 < var_224_8 then
					arg_221_1.talkMaxDuration = var_224_8

					if var_224_8 + var_224_1 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_8 + var_224_1
					end
				end

				arg_221_1.text_.text = var_224_5
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841052", "story_v_out_319841.awb") ~= 0 then
					local var_224_9 = manager.audio:GetVoiceLength("story_v_out_319841", "319841052", "story_v_out_319841.awb") / 1000

					if var_224_9 + var_224_1 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_9 + var_224_1
					end

					if var_224_4.prefab_name ~= "" and arg_221_1.actors_[var_224_4.prefab_name] ~= nil then
						local var_224_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_4.prefab_name].transform, "story_v_out_319841", "319841052", "story_v_out_319841.awb")

						arg_221_1:RecordAudio("319841052", var_224_10)
						arg_221_1:RecordAudio("319841052", var_224_10)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_319841", "319841052", "story_v_out_319841.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_319841", "319841052", "story_v_out_319841.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_11 = math.max(var_224_2, arg_221_1.talkMaxDuration)

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_11 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_1) / var_224_11

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_1 + var_224_11 and arg_221_1.time_ < var_224_1 + var_224_11 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play319841053 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 319841053
		arg_225_1.duration_ = 14.1

		local var_225_0 = {
			zh = 7.5,
			ja = 14.1
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
				arg_225_0:Play319841054(arg_225_1)
			end
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["10069ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos10069ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(-0.7, -1.08, -6.33)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos10069ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["10069ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect10069ui_story == nil then
				arg_225_1.var_.characterEffect10069ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect10069ui_story then
					arg_225_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect10069ui_story then
				arg_225_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_228_13 = 0

			if var_228_13 < arg_225_1.time_ and arg_225_1.time_ <= var_228_13 + arg_228_0 then
				arg_225_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/story10056/story10056action/10056action1_1")
			end

			local var_228_14 = 0

			if var_228_14 < arg_225_1.time_ and arg_225_1.time_ <= var_228_14 + arg_228_0 then
				arg_225_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2201cva")
			end

			local var_228_15 = arg_225_1.actors_["10050ui_story"]
			local var_228_16 = 0

			if var_228_16 < arg_225_1.time_ and arg_225_1.time_ <= var_228_16 + arg_228_0 and arg_225_1.var_.characterEffect10050ui_story == nil then
				arg_225_1.var_.characterEffect10050ui_story = var_228_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_17 = 0.2

			if var_228_16 <= arg_225_1.time_ and arg_225_1.time_ < var_228_16 + var_228_17 then
				local var_228_18 = (arg_225_1.time_ - var_228_16) / var_228_17

				if arg_225_1.var_.characterEffect10050ui_story then
					local var_228_19 = Mathf.Lerp(0, 0.5, var_228_18)

					arg_225_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_225_1.var_.characterEffect10050ui_story.fillRatio = var_228_19
				end
			end

			if arg_225_1.time_ >= var_228_16 + var_228_17 and arg_225_1.time_ < var_228_16 + var_228_17 + arg_228_0 and arg_225_1.var_.characterEffect10050ui_story then
				local var_228_20 = 0.5

				arg_225_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_225_1.var_.characterEffect10050ui_story.fillRatio = var_228_20
			end

			local var_228_21 = 0
			local var_228_22 = 0.775

			if var_228_21 < arg_225_1.time_ and arg_225_1.time_ <= var_228_21 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, true)

				local var_228_23 = arg_225_1:FormatText(StoryNameCfg[693].name)

				arg_225_1.leftNameTxt_.text = var_228_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_225_1.leftNameTxt_.transform)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1.leftNameTxt_.text)
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_24 = arg_225_1:GetWordFromCfg(319841053)
				local var_228_25 = arg_225_1:FormatText(var_228_24.content)

				arg_225_1.text_.text = var_228_25

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_26 = 31
				local var_228_27 = utf8.len(var_228_25)
				local var_228_28 = var_228_26 <= 0 and var_228_22 or var_228_22 * (var_228_27 / var_228_26)

				if var_228_28 > 0 and var_228_22 < var_228_28 then
					arg_225_1.talkMaxDuration = var_228_28

					if var_228_28 + var_228_21 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_28 + var_228_21
					end
				end

				arg_225_1.text_.text = var_228_25
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841053", "story_v_out_319841.awb") ~= 0 then
					local var_228_29 = manager.audio:GetVoiceLength("story_v_out_319841", "319841053", "story_v_out_319841.awb") / 1000

					if var_228_29 + var_228_21 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_29 + var_228_21
					end

					if var_228_24.prefab_name ~= "" and arg_225_1.actors_[var_228_24.prefab_name] ~= nil then
						local var_228_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_225_1.actors_[var_228_24.prefab_name].transform, "story_v_out_319841", "319841053", "story_v_out_319841.awb")

						arg_225_1:RecordAudio("319841053", var_228_30)
						arg_225_1:RecordAudio("319841053", var_228_30)
					else
						arg_225_1:AudioAction("play", "voice", "story_v_out_319841", "319841053", "story_v_out_319841.awb")
					end

					arg_225_1:RecordHistoryTalkVoice("story_v_out_319841", "319841053", "story_v_out_319841.awb")
				end

				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_31 = math.max(var_228_22, arg_225_1.talkMaxDuration)

			if var_228_21 <= arg_225_1.time_ and arg_225_1.time_ < var_228_21 + var_228_31 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_21) / var_228_31

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_21 + var_228_31 and arg_225_1.time_ < var_228_21 + var_228_31 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	Play319841054 = function(arg_229_0, arg_229_1)
		arg_229_1.time_ = 0
		arg_229_1.frameCnt_ = 0
		arg_229_1.state_ = "playing"
		arg_229_1.curTalkId_ = 319841054
		arg_229_1.duration_ = 5

		SetActive(arg_229_1.tipsGo_, false)

		function arg_229_1.onSingleLineFinish_()
			arg_229_1.onSingleLineUpdate_ = nil
			arg_229_1.onSingleLineFinish_ = nil
			arg_229_1.state_ = "waiting"
		end

		function arg_229_1.playNext_(arg_231_0)
			if arg_231_0 == 1 then
				arg_229_0:Play319841055(arg_229_1)
			end
		end

		function arg_229_1.onSingleLineUpdate_(arg_232_0)
			local var_232_0 = arg_229_1.actors_["10050ui_story"].transform
			local var_232_1 = 0

			if var_232_1 < arg_229_1.time_ and arg_229_1.time_ <= var_232_1 + arg_232_0 then
				arg_229_1.var_.moveOldPos10050ui_story = var_232_0.localPosition
			end

			local var_232_2 = 0.001

			if var_232_1 <= arg_229_1.time_ and arg_229_1.time_ < var_232_1 + var_232_2 then
				local var_232_3 = (arg_229_1.time_ - var_232_1) / var_232_2
				local var_232_4 = Vector3.New(0, 100, 0)

				var_232_0.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10050ui_story, var_232_4, var_232_3)

				local var_232_5 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_5.x, var_232_5.y, var_232_5.z)

				local var_232_6 = var_232_0.localEulerAngles

				var_232_6.z = 0
				var_232_6.x = 0
				var_232_0.localEulerAngles = var_232_6
			end

			if arg_229_1.time_ >= var_232_1 + var_232_2 and arg_229_1.time_ < var_232_1 + var_232_2 + arg_232_0 then
				var_232_0.localPosition = Vector3.New(0, 100, 0)

				local var_232_7 = manager.ui.mainCamera.transform.position - var_232_0.position

				var_232_0.forward = Vector3.New(var_232_7.x, var_232_7.y, var_232_7.z)

				local var_232_8 = var_232_0.localEulerAngles

				var_232_8.z = 0
				var_232_8.x = 0
				var_232_0.localEulerAngles = var_232_8
			end

			local var_232_9 = arg_229_1.actors_["10050ui_story"]
			local var_232_10 = 0

			if var_232_10 < arg_229_1.time_ and arg_229_1.time_ <= var_232_10 + arg_232_0 and arg_229_1.var_.characterEffect10050ui_story == nil then
				arg_229_1.var_.characterEffect10050ui_story = var_232_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_11 = 0.200000002980232

			if var_232_10 <= arg_229_1.time_ and arg_229_1.time_ < var_232_10 + var_232_11 then
				local var_232_12 = (arg_229_1.time_ - var_232_10) / var_232_11

				if arg_229_1.var_.characterEffect10050ui_story then
					local var_232_13 = Mathf.Lerp(0, 0.5, var_232_12)

					arg_229_1.var_.characterEffect10050ui_story.fillFlat = true
					arg_229_1.var_.characterEffect10050ui_story.fillRatio = var_232_13
				end
			end

			if arg_229_1.time_ >= var_232_10 + var_232_11 and arg_229_1.time_ < var_232_10 + var_232_11 + arg_232_0 and arg_229_1.var_.characterEffect10050ui_story then
				local var_232_14 = 0.5

				arg_229_1.var_.characterEffect10050ui_story.fillFlat = true
				arg_229_1.var_.characterEffect10050ui_story.fillRatio = var_232_14
			end

			local var_232_15 = arg_229_1.actors_["10069ui_story"].transform
			local var_232_16 = 0

			if var_232_16 < arg_229_1.time_ and arg_229_1.time_ <= var_232_16 + arg_232_0 then
				arg_229_1.var_.moveOldPos10069ui_story = var_232_15.localPosition
			end

			local var_232_17 = 0.001

			if var_232_16 <= arg_229_1.time_ and arg_229_1.time_ < var_232_16 + var_232_17 then
				local var_232_18 = (arg_229_1.time_ - var_232_16) / var_232_17
				local var_232_19 = Vector3.New(0, 100, 0)

				var_232_15.localPosition = Vector3.Lerp(arg_229_1.var_.moveOldPos10069ui_story, var_232_19, var_232_18)

				local var_232_20 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_20.x, var_232_20.y, var_232_20.z)

				local var_232_21 = var_232_15.localEulerAngles

				var_232_21.z = 0
				var_232_21.x = 0
				var_232_15.localEulerAngles = var_232_21
			end

			if arg_229_1.time_ >= var_232_16 + var_232_17 and arg_229_1.time_ < var_232_16 + var_232_17 + arg_232_0 then
				var_232_15.localPosition = Vector3.New(0, 100, 0)

				local var_232_22 = manager.ui.mainCamera.transform.position - var_232_15.position

				var_232_15.forward = Vector3.New(var_232_22.x, var_232_22.y, var_232_22.z)

				local var_232_23 = var_232_15.localEulerAngles

				var_232_23.z = 0
				var_232_23.x = 0
				var_232_15.localEulerAngles = var_232_23
			end

			local var_232_24 = arg_229_1.actors_["10069ui_story"]
			local var_232_25 = 0

			if var_232_25 < arg_229_1.time_ and arg_229_1.time_ <= var_232_25 + arg_232_0 and arg_229_1.var_.characterEffect10069ui_story == nil then
				arg_229_1.var_.characterEffect10069ui_story = var_232_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_232_26 = 0.200000002980232

			if var_232_25 <= arg_229_1.time_ and arg_229_1.time_ < var_232_25 + var_232_26 then
				local var_232_27 = (arg_229_1.time_ - var_232_25) / var_232_26

				if arg_229_1.var_.characterEffect10069ui_story then
					local var_232_28 = Mathf.Lerp(0, 0.5, var_232_27)

					arg_229_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_229_1.var_.characterEffect10069ui_story.fillRatio = var_232_28
				end
			end

			if arg_229_1.time_ >= var_232_25 + var_232_26 and arg_229_1.time_ < var_232_25 + var_232_26 + arg_232_0 and arg_229_1.var_.characterEffect10069ui_story then
				local var_232_29 = 0.5

				arg_229_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_229_1.var_.characterEffect10069ui_story.fillRatio = var_232_29
			end

			local var_232_30 = 0
			local var_232_31 = 1.075

			if var_232_30 < arg_229_1.time_ and arg_229_1.time_ <= var_232_30 + arg_232_0 then
				arg_229_1.talkMaxDuration = 0
				arg_229_1.dialogCg_.alpha = 1

				arg_229_1.dialog_:SetActive(true)
				SetActive(arg_229_1.leftNameGo_, false)

				arg_229_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_229_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_229_1:RecordName(arg_229_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_229_1.iconTrs_.gameObject, false)
				arg_229_1.callingController_:SetSelectedState("normal")

				local var_232_32 = arg_229_1:GetWordFromCfg(319841054)
				local var_232_33 = arg_229_1:FormatText(var_232_32.content)

				arg_229_1.text_.text = var_232_33

				LuaForUtil.ClearLinePrefixSymbol(arg_229_1.text_)

				local var_232_34 = 43
				local var_232_35 = utf8.len(var_232_33)
				local var_232_36 = var_232_34 <= 0 and var_232_31 or var_232_31 * (var_232_35 / var_232_34)

				if var_232_36 > 0 and var_232_31 < var_232_36 then
					arg_229_1.talkMaxDuration = var_232_36

					if var_232_36 + var_232_30 > arg_229_1.duration_ then
						arg_229_1.duration_ = var_232_36 + var_232_30
					end
				end

				arg_229_1.text_.text = var_232_33
				arg_229_1.typewritter.percent = 0

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(false)
				arg_229_1:RecordContent(arg_229_1.text_.text)
			end

			local var_232_37 = math.max(var_232_31, arg_229_1.talkMaxDuration)

			if var_232_30 <= arg_229_1.time_ and arg_229_1.time_ < var_232_30 + var_232_37 then
				arg_229_1.typewritter.percent = (arg_229_1.time_ - var_232_30) / var_232_37

				arg_229_1.typewritter:SetDirty()
			end

			if arg_229_1.time_ >= var_232_30 + var_232_37 and arg_229_1.time_ < var_232_30 + var_232_37 + arg_232_0 then
				arg_229_1.typewritter.percent = 1

				arg_229_1.typewritter:SetDirty()
				arg_229_1:ShowNextGo(true)
			end
		end
	end,
	Play319841055 = function(arg_233_0, arg_233_1)
		arg_233_1.time_ = 0
		arg_233_1.frameCnt_ = 0
		arg_233_1.state_ = "playing"
		arg_233_1.curTalkId_ = 319841055
		arg_233_1.duration_ = 5.766

		local var_233_0 = {
			zh = 5.766,
			ja = 4
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
				arg_233_0:Play319841056(arg_233_1)
			end
		end

		function arg_233_1.onSingleLineUpdate_(arg_236_0)
			local var_236_0 = arg_233_1.actors_["1084ui_story"].transform
			local var_236_1 = 0

			if var_236_1 < arg_233_1.time_ and arg_233_1.time_ <= var_236_1 + arg_236_0 then
				arg_233_1.var_.moveOldPos1084ui_story = var_236_0.localPosition
			end

			local var_236_2 = 0.001

			if var_236_1 <= arg_233_1.time_ and arg_233_1.time_ < var_236_1 + var_236_2 then
				local var_236_3 = (arg_233_1.time_ - var_236_1) / var_236_2
				local var_236_4 = Vector3.New(0, -0.97, -6)

				var_236_0.localPosition = Vector3.Lerp(arg_233_1.var_.moveOldPos1084ui_story, var_236_4, var_236_3)

				local var_236_5 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_5.x, var_236_5.y, var_236_5.z)

				local var_236_6 = var_236_0.localEulerAngles

				var_236_6.z = 0
				var_236_6.x = 0
				var_236_0.localEulerAngles = var_236_6
			end

			if arg_233_1.time_ >= var_236_1 + var_236_2 and arg_233_1.time_ < var_236_1 + var_236_2 + arg_236_0 then
				var_236_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_236_7 = manager.ui.mainCamera.transform.position - var_236_0.position

				var_236_0.forward = Vector3.New(var_236_7.x, var_236_7.y, var_236_7.z)

				local var_236_8 = var_236_0.localEulerAngles

				var_236_8.z = 0
				var_236_8.x = 0
				var_236_0.localEulerAngles = var_236_8
			end

			local var_236_9 = arg_233_1.actors_["1084ui_story"]
			local var_236_10 = 0

			if var_236_10 < arg_233_1.time_ and arg_233_1.time_ <= var_236_10 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story == nil then
				arg_233_1.var_.characterEffect1084ui_story = var_236_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_236_11 = 0.200000002980232

			if var_236_10 <= arg_233_1.time_ and arg_233_1.time_ < var_236_10 + var_236_11 then
				local var_236_12 = (arg_233_1.time_ - var_236_10) / var_236_11

				if arg_233_1.var_.characterEffect1084ui_story then
					arg_233_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_233_1.time_ >= var_236_10 + var_236_11 and arg_233_1.time_ < var_236_10 + var_236_11 + arg_236_0 and arg_233_1.var_.characterEffect1084ui_story then
				arg_233_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_236_13 = 0

			if var_236_13 < arg_233_1.time_ and arg_233_1.time_ <= var_236_13 + arg_236_0 then
				arg_233_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_236_14 = 0

			if var_236_14 < arg_233_1.time_ and arg_233_1.time_ <= var_236_14 + arg_236_0 then
				arg_233_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2202cva")
			end

			local var_236_15 = 0
			local var_236_16 = 0.725

			if var_236_15 < arg_233_1.time_ and arg_233_1.time_ <= var_236_15 + arg_236_0 then
				arg_233_1.talkMaxDuration = 0
				arg_233_1.dialogCg_.alpha = 1

				arg_233_1.dialog_:SetActive(true)
				SetActive(arg_233_1.leftNameGo_, true)

				local var_236_17 = arg_233_1:FormatText(StoryNameCfg[6].name)

				arg_233_1.leftNameTxt_.text = var_236_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_233_1.leftNameTxt_.transform)

				arg_233_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_233_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_233_1:RecordName(arg_233_1.leftNameTxt_.text)
				SetActive(arg_233_1.iconTrs_.gameObject, false)
				arg_233_1.callingController_:SetSelectedState("normal")

				local var_236_18 = arg_233_1:GetWordFromCfg(319841055)
				local var_236_19 = arg_233_1:FormatText(var_236_18.content)

				arg_233_1.text_.text = var_236_19

				LuaForUtil.ClearLinePrefixSymbol(arg_233_1.text_)

				local var_236_20 = 29
				local var_236_21 = utf8.len(var_236_19)
				local var_236_22 = var_236_20 <= 0 and var_236_16 or var_236_16 * (var_236_21 / var_236_20)

				if var_236_22 > 0 and var_236_16 < var_236_22 then
					arg_233_1.talkMaxDuration = var_236_22

					if var_236_22 + var_236_15 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_22 + var_236_15
					end
				end

				arg_233_1.text_.text = var_236_19
				arg_233_1.typewritter.percent = 0

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841055", "story_v_out_319841.awb") ~= 0 then
					local var_236_23 = manager.audio:GetVoiceLength("story_v_out_319841", "319841055", "story_v_out_319841.awb") / 1000

					if var_236_23 + var_236_15 > arg_233_1.duration_ then
						arg_233_1.duration_ = var_236_23 + var_236_15
					end

					if var_236_18.prefab_name ~= "" and arg_233_1.actors_[var_236_18.prefab_name] ~= nil then
						local var_236_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_233_1.actors_[var_236_18.prefab_name].transform, "story_v_out_319841", "319841055", "story_v_out_319841.awb")

						arg_233_1:RecordAudio("319841055", var_236_24)
						arg_233_1:RecordAudio("319841055", var_236_24)
					else
						arg_233_1:AudioAction("play", "voice", "story_v_out_319841", "319841055", "story_v_out_319841.awb")
					end

					arg_233_1:RecordHistoryTalkVoice("story_v_out_319841", "319841055", "story_v_out_319841.awb")
				end

				arg_233_1:RecordContent(arg_233_1.text_.text)
			end

			local var_236_25 = math.max(var_236_16, arg_233_1.talkMaxDuration)

			if var_236_15 <= arg_233_1.time_ and arg_233_1.time_ < var_236_15 + var_236_25 then
				arg_233_1.typewritter.percent = (arg_233_1.time_ - var_236_15) / var_236_25

				arg_233_1.typewritter:SetDirty()
			end

			if arg_233_1.time_ >= var_236_15 + var_236_25 and arg_233_1.time_ < var_236_15 + var_236_25 + arg_236_0 then
				arg_233_1.typewritter.percent = 1

				arg_233_1.typewritter:SetDirty()
				arg_233_1:ShowNextGo(true)
			end
		end
	end,
	Play319841056 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 319841056
		arg_237_1.duration_ = 4.766

		local var_237_0 = {
			zh = 4.766,
			ja = 2.866
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
				arg_237_0:Play319841057(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = arg_237_1.actors_["10069ui_story"].transform
			local var_240_1 = 0

			if var_240_1 < arg_237_1.time_ and arg_237_1.time_ <= var_240_1 + arg_240_0 then
				arg_237_1.var_.moveOldPos10069ui_story = var_240_0.localPosition
			end

			local var_240_2 = 0.001

			if var_240_1 <= arg_237_1.time_ and arg_237_1.time_ < var_240_1 + var_240_2 then
				local var_240_3 = (arg_237_1.time_ - var_240_1) / var_240_2
				local var_240_4 = Vector3.New(-0.7, -1.08, -6.33)

				var_240_0.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos10069ui_story, var_240_4, var_240_3)

				local var_240_5 = manager.ui.mainCamera.transform.position - var_240_0.position

				var_240_0.forward = Vector3.New(var_240_5.x, var_240_5.y, var_240_5.z)

				local var_240_6 = var_240_0.localEulerAngles

				var_240_6.z = 0
				var_240_6.x = 0
				var_240_0.localEulerAngles = var_240_6
			end

			if arg_237_1.time_ >= var_240_1 + var_240_2 and arg_237_1.time_ < var_240_1 + var_240_2 + arg_240_0 then
				var_240_0.localPosition = Vector3.New(-0.7, -1.08, -6.33)

				local var_240_7 = manager.ui.mainCamera.transform.position - var_240_0.position

				var_240_0.forward = Vector3.New(var_240_7.x, var_240_7.y, var_240_7.z)

				local var_240_8 = var_240_0.localEulerAngles

				var_240_8.z = 0
				var_240_8.x = 0
				var_240_0.localEulerAngles = var_240_8
			end

			local var_240_9 = arg_237_1.actors_["10069ui_story"]
			local var_240_10 = 0

			if var_240_10 < arg_237_1.time_ and arg_237_1.time_ <= var_240_10 + arg_240_0 and arg_237_1.var_.characterEffect10069ui_story == nil then
				arg_237_1.var_.characterEffect10069ui_story = var_240_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_11 = 0.200000002980232

			if var_240_10 <= arg_237_1.time_ and arg_237_1.time_ < var_240_10 + var_240_11 then
				local var_240_12 = (arg_237_1.time_ - var_240_10) / var_240_11

				if arg_237_1.var_.characterEffect10069ui_story then
					arg_237_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_237_1.time_ >= var_240_10 + var_240_11 and arg_237_1.time_ < var_240_10 + var_240_11 + arg_240_0 and arg_237_1.var_.characterEffect10069ui_story then
				arg_237_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_240_13 = arg_237_1.actors_["1084ui_story"].transform
			local var_240_14 = 0

			if var_240_14 < arg_237_1.time_ and arg_237_1.time_ <= var_240_14 + arg_240_0 then
				arg_237_1.var_.moveOldPos1084ui_story = var_240_13.localPosition
			end

			local var_240_15 = 0.001

			if var_240_14 <= arg_237_1.time_ and arg_237_1.time_ < var_240_14 + var_240_15 then
				local var_240_16 = (arg_237_1.time_ - var_240_14) / var_240_15
				local var_240_17 = Vector3.New(0.7, -0.97, -6)

				var_240_13.localPosition = Vector3.Lerp(arg_237_1.var_.moveOldPos1084ui_story, var_240_17, var_240_16)

				local var_240_18 = manager.ui.mainCamera.transform.position - var_240_13.position

				var_240_13.forward = Vector3.New(var_240_18.x, var_240_18.y, var_240_18.z)

				local var_240_19 = var_240_13.localEulerAngles

				var_240_19.z = 0
				var_240_19.x = 0
				var_240_13.localEulerAngles = var_240_19
			end

			if arg_237_1.time_ >= var_240_14 + var_240_15 and arg_237_1.time_ < var_240_14 + var_240_15 + arg_240_0 then
				var_240_13.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_240_20 = manager.ui.mainCamera.transform.position - var_240_13.position

				var_240_13.forward = Vector3.New(var_240_20.x, var_240_20.y, var_240_20.z)

				local var_240_21 = var_240_13.localEulerAngles

				var_240_21.z = 0
				var_240_21.x = 0
				var_240_13.localEulerAngles = var_240_21
			end

			local var_240_22 = arg_237_1.actors_["1084ui_story"]
			local var_240_23 = 0

			if var_240_23 < arg_237_1.time_ and arg_237_1.time_ <= var_240_23 + arg_240_0 and arg_237_1.var_.characterEffect1084ui_story == nil then
				arg_237_1.var_.characterEffect1084ui_story = var_240_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_240_24 = 0.200000002980232

			if var_240_23 <= arg_237_1.time_ and arg_237_1.time_ < var_240_23 + var_240_24 then
				local var_240_25 = (arg_237_1.time_ - var_240_23) / var_240_24

				if arg_237_1.var_.characterEffect1084ui_story then
					local var_240_26 = Mathf.Lerp(0, 0.5, var_240_25)

					arg_237_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_237_1.var_.characterEffect1084ui_story.fillRatio = var_240_26
				end
			end

			if arg_237_1.time_ >= var_240_23 + var_240_24 and arg_237_1.time_ < var_240_23 + var_240_24 + arg_240_0 and arg_237_1.var_.characterEffect1084ui_story then
				local var_240_27 = 0.5

				arg_237_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_237_1.var_.characterEffect1084ui_story.fillRatio = var_240_27
			end

			local var_240_28 = 0
			local var_240_29 = 0.675

			if var_240_28 < arg_237_1.time_ and arg_237_1.time_ <= var_240_28 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_30 = arg_237_1:FormatText(StoryNameCfg[693].name)

				arg_237_1.leftNameTxt_.text = var_240_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_31 = arg_237_1:GetWordFromCfg(319841056)
				local var_240_32 = arg_237_1:FormatText(var_240_31.content)

				arg_237_1.text_.text = var_240_32

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_33 = 27
				local var_240_34 = utf8.len(var_240_32)
				local var_240_35 = var_240_33 <= 0 and var_240_29 or var_240_29 * (var_240_34 / var_240_33)

				if var_240_35 > 0 and var_240_29 < var_240_35 then
					arg_237_1.talkMaxDuration = var_240_35

					if var_240_35 + var_240_28 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_35 + var_240_28
					end
				end

				arg_237_1.text_.text = var_240_32
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841056", "story_v_out_319841.awb") ~= 0 then
					local var_240_36 = manager.audio:GetVoiceLength("story_v_out_319841", "319841056", "story_v_out_319841.awb") / 1000

					if var_240_36 + var_240_28 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_36 + var_240_28
					end

					if var_240_31.prefab_name ~= "" and arg_237_1.actors_[var_240_31.prefab_name] ~= nil then
						local var_240_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_237_1.actors_[var_240_31.prefab_name].transform, "story_v_out_319841", "319841056", "story_v_out_319841.awb")

						arg_237_1:RecordAudio("319841056", var_240_37)
						arg_237_1:RecordAudio("319841056", var_240_37)
					else
						arg_237_1:AudioAction("play", "voice", "story_v_out_319841", "319841056", "story_v_out_319841.awb")
					end

					arg_237_1:RecordHistoryTalkVoice("story_v_out_319841", "319841056", "story_v_out_319841.awb")
				end

				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_38 = math.max(var_240_29, arg_237_1.talkMaxDuration)

			if var_240_28 <= arg_237_1.time_ and arg_237_1.time_ < var_240_28 + var_240_38 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_28) / var_240_38

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_28 + var_240_38 and arg_237_1.time_ < var_240_28 + var_240_38 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play319841057 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 319841057
		arg_241_1.duration_ = 5

		SetActive(arg_241_1.tipsGo_, false)

		function arg_241_1.onSingleLineFinish_()
			arg_241_1.onSingleLineUpdate_ = nil
			arg_241_1.onSingleLineFinish_ = nil
			arg_241_1.state_ = "waiting"
		end

		function arg_241_1.playNext_(arg_243_0)
			if arg_243_0 == 1 then
				arg_241_0:Play319841058(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["10069ui_story"]
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 and arg_241_1.var_.characterEffect10069ui_story == nil then
				arg_241_1.var_.characterEffect10069ui_story = var_244_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_2 = 0.200000002980232

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2

				if arg_241_1.var_.characterEffect10069ui_story then
					local var_244_4 = Mathf.Lerp(0, 0.5, var_244_3)

					arg_241_1.var_.characterEffect10069ui_story.fillFlat = true
					arg_241_1.var_.characterEffect10069ui_story.fillRatio = var_244_4
				end
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 and arg_241_1.var_.characterEffect10069ui_story then
				local var_244_5 = 0.5

				arg_241_1.var_.characterEffect10069ui_story.fillFlat = true
				arg_241_1.var_.characterEffect10069ui_story.fillRatio = var_244_5
			end

			local var_244_6 = 0
			local var_244_7 = 0.625

			if var_244_6 < arg_241_1.time_ and arg_241_1.time_ <= var_244_6 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, false)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_8 = arg_241_1:GetWordFromCfg(319841057)
				local var_244_9 = arg_241_1:FormatText(var_244_8.content)

				arg_241_1.text_.text = var_244_9

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_10 = 25
				local var_244_11 = utf8.len(var_244_9)
				local var_244_12 = var_244_10 <= 0 and var_244_7 or var_244_7 * (var_244_11 / var_244_10)

				if var_244_12 > 0 and var_244_7 < var_244_12 then
					arg_241_1.talkMaxDuration = var_244_12

					if var_244_12 + var_244_6 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_12 + var_244_6
					end
				end

				arg_241_1.text_.text = var_244_9
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)
				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_13 = math.max(var_244_7, arg_241_1.talkMaxDuration)

			if var_244_6 <= arg_241_1.time_ and arg_241_1.time_ < var_244_6 + var_244_13 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_6) / var_244_13

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_6 + var_244_13 and arg_241_1.time_ < var_244_6 + var_244_13 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play319841058 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 319841058
		arg_245_1.duration_ = 5.4

		local var_245_0 = {
			zh = 4.3,
			ja = 5.4
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
				arg_245_0:Play319841059(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = arg_245_1.actors_["10069ui_story"]
			local var_248_1 = 0

			if var_248_1 < arg_245_1.time_ and arg_245_1.time_ <= var_248_1 + arg_248_0 and arg_245_1.var_.characterEffect10069ui_story == nil then
				arg_245_1.var_.characterEffect10069ui_story = var_248_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_2 = 0.200000002980232

			if var_248_1 <= arg_245_1.time_ and arg_245_1.time_ < var_248_1 + var_248_2 then
				local var_248_3 = (arg_245_1.time_ - var_248_1) / var_248_2

				if arg_245_1.var_.characterEffect10069ui_story then
					arg_245_1.var_.characterEffect10069ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_1 + var_248_2 and arg_245_1.time_ < var_248_1 + var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect10069ui_story then
				arg_245_1.var_.characterEffect10069ui_story.fillFlat = false
			end

			local var_248_4 = 0

			if var_248_4 < arg_245_1.time_ and arg_245_1.time_ <= var_248_4 + arg_248_0 then
				arg_245_1:PlayTimeline("10069ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_248_5 = 0
			local var_248_6 = 0.55

			if var_248_5 < arg_245_1.time_ and arg_245_1.time_ <= var_248_5 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_7 = arg_245_1:FormatText(StoryNameCfg[693].name)

				arg_245_1.leftNameTxt_.text = var_248_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_8 = arg_245_1:GetWordFromCfg(319841058)
				local var_248_9 = arg_245_1:FormatText(var_248_8.content)

				arg_245_1.text_.text = var_248_9

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_10 = 22
				local var_248_11 = utf8.len(var_248_9)
				local var_248_12 = var_248_10 <= 0 and var_248_6 or var_248_6 * (var_248_11 / var_248_10)

				if var_248_12 > 0 and var_248_6 < var_248_12 then
					arg_245_1.talkMaxDuration = var_248_12

					if var_248_12 + var_248_5 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_12 + var_248_5
					end
				end

				arg_245_1.text_.text = var_248_9
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841058", "story_v_out_319841.awb") ~= 0 then
					local var_248_13 = manager.audio:GetVoiceLength("story_v_out_319841", "319841058", "story_v_out_319841.awb") / 1000

					if var_248_13 + var_248_5 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_13 + var_248_5
					end

					if var_248_8.prefab_name ~= "" and arg_245_1.actors_[var_248_8.prefab_name] ~= nil then
						local var_248_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_8.prefab_name].transform, "story_v_out_319841", "319841058", "story_v_out_319841.awb")

						arg_245_1:RecordAudio("319841058", var_248_14)
						arg_245_1:RecordAudio("319841058", var_248_14)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_319841", "319841058", "story_v_out_319841.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_319841", "319841058", "story_v_out_319841.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_15 = math.max(var_248_6, arg_245_1.talkMaxDuration)

			if var_248_5 <= arg_245_1.time_ and arg_245_1.time_ < var_248_5 + var_248_15 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_5) / var_248_15

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_5 + var_248_15 and arg_245_1.time_ < var_248_5 + var_248_15 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play319841059 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 319841059
		arg_249_1.duration_ = 14.7

		local var_249_0 = {
			zh = 12.4,
			ja = 14.7
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
				arg_249_0:Play319841060(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = 0
			local var_252_1 = 1.45

			if var_252_0 < arg_249_1.time_ and arg_249_1.time_ <= var_252_0 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_2 = arg_249_1:FormatText(StoryNameCfg[693].name)

				arg_249_1.leftNameTxt_.text = var_252_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_3 = arg_249_1:GetWordFromCfg(319841059)
				local var_252_4 = arg_249_1:FormatText(var_252_3.content)

				arg_249_1.text_.text = var_252_4

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_5 = 58
				local var_252_6 = utf8.len(var_252_4)
				local var_252_7 = var_252_5 <= 0 and var_252_1 or var_252_1 * (var_252_6 / var_252_5)

				if var_252_7 > 0 and var_252_1 < var_252_7 then
					arg_249_1.talkMaxDuration = var_252_7

					if var_252_7 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_7 + var_252_0
					end
				end

				arg_249_1.text_.text = var_252_4
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841059", "story_v_out_319841.awb") ~= 0 then
					local var_252_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841059", "story_v_out_319841.awb") / 1000

					if var_252_8 + var_252_0 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_8 + var_252_0
					end

					if var_252_3.prefab_name ~= "" and arg_249_1.actors_[var_252_3.prefab_name] ~= nil then
						local var_252_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_249_1.actors_[var_252_3.prefab_name].transform, "story_v_out_319841", "319841059", "story_v_out_319841.awb")

						arg_249_1:RecordAudio("319841059", var_252_9)
						arg_249_1:RecordAudio("319841059", var_252_9)
					else
						arg_249_1:AudioAction("play", "voice", "story_v_out_319841", "319841059", "story_v_out_319841.awb")
					end

					arg_249_1:RecordHistoryTalkVoice("story_v_out_319841", "319841059", "story_v_out_319841.awb")
				end

				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_10 = math.max(var_252_1, arg_249_1.talkMaxDuration)

			if var_252_0 <= arg_249_1.time_ and arg_249_1.time_ < var_252_0 + var_252_10 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_0) / var_252_10

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_0 + var_252_10 and arg_249_1.time_ < var_252_0 + var_252_10 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play319841060 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 319841060
		arg_253_1.duration_ = 9.033

		local var_253_0 = {
			zh = 5.833,
			ja = 9.033
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
			arg_253_1.auto_ = false
		end

		function arg_253_1.playNext_(arg_255_0)
			arg_253_1.onStoryFinished_()
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 0
			local var_256_1 = 0.65

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_2 = arg_253_1:FormatText(StoryNameCfg[693].name)

				arg_253_1.leftNameTxt_.text = var_256_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_3 = arg_253_1:GetWordFromCfg(319841060)
				local var_256_4 = arg_253_1:FormatText(var_256_3.content)

				arg_253_1.text_.text = var_256_4

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_5 = 26
				local var_256_6 = utf8.len(var_256_4)
				local var_256_7 = var_256_5 <= 0 and var_256_1 or var_256_1 * (var_256_6 / var_256_5)

				if var_256_7 > 0 and var_256_1 < var_256_7 then
					arg_253_1.talkMaxDuration = var_256_7

					if var_256_7 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_7 + var_256_0
					end
				end

				arg_253_1.text_.text = var_256_4
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319841", "319841060", "story_v_out_319841.awb") ~= 0 then
					local var_256_8 = manager.audio:GetVoiceLength("story_v_out_319841", "319841060", "story_v_out_319841.awb") / 1000

					if var_256_8 + var_256_0 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_8 + var_256_0
					end

					if var_256_3.prefab_name ~= "" and arg_253_1.actors_[var_256_3.prefab_name] ~= nil then
						local var_256_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_3.prefab_name].transform, "story_v_out_319841", "319841060", "story_v_out_319841.awb")

						arg_253_1:RecordAudio("319841060", var_256_9)
						arg_253_1:RecordAudio("319841060", var_256_9)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_319841", "319841060", "story_v_out_319841.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_319841", "319841060", "story_v_out_319841.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_10 = math.max(var_256_1, arg_253_1.talkMaxDuration)

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_10 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_0) / var_256_10

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_0 + var_256_10 and arg_253_1.time_ < var_256_0 + var_256_10 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/STblack",
		"Assets/UIResources/UI_AB/TextureConfig/Background/D02a",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST74",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST72"
	},
	voices = {
		"story_v_out_319841.awb"
	}
}
