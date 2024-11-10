return {
	Play120421001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 120421001
		arg_1_1.duration_ = 6.566

		local var_1_0 = {
			zh = 5.033999999999,
			ja = 6.566
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
				arg_1_0:Play120421002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "XH0204"

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
				local var_4_5 = arg_1_1.bgs_.XH0204

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
					if iter_4_0 ~= "XH0204" then
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
			local var_4_23 = 0.3

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = arg_1_1.bgs_.XH0204.transform
			local var_4_27 = 0

			if var_4_27 < arg_1_1.time_ and arg_1_1.time_ <= var_4_27 + arg_4_0 then
				arg_1_1.var_.moveOldPosXH0204 = var_4_26.localPosition
			end

			local var_4_28 = 0.001

			if var_4_27 <= arg_1_1.time_ and arg_1_1.time_ < var_4_27 + var_4_28 then
				local var_4_29 = (arg_1_1.time_ - var_4_27) / var_4_28
				local var_4_30 = Vector3.New(0, 2, 1)

				var_4_26.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosXH0204, var_4_30, var_4_29)
			end

			if arg_1_1.time_ >= var_4_27 + var_4_28 and arg_1_1.time_ < var_4_27 + var_4_28 + arg_4_0 then
				var_4_26.localPosition = Vector3.New(0, 2, 1)
			end

			local var_4_31 = arg_1_1.bgs_.XH0204.transform
			local var_4_32 = 0.034

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.var_.moveOldPosXH0204 = var_4_31.localPosition
			end

			local var_4_33 = 5

			if var_4_32 <= arg_1_1.time_ and arg_1_1.time_ < var_4_32 + var_4_33 then
				local var_4_34 = (arg_1_1.time_ - var_4_32) / var_4_33
				local var_4_35 = Vector3.New(0, 2.5, 1)

				var_4_31.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosXH0204, var_4_35, var_4_34)
			end

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				var_4_31.localPosition = Vector3.New(0, 2.5, 1)
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_36 = 2
			local var_4_37 = 0.1

			if var_4_36 < arg_1_1.time_ and arg_1_1.time_ <= var_4_36 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_38 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_38:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_38:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_38:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, true)

				local var_4_39 = arg_1_1:FormatText(StoryNameCfg[399].name)

				arg_1_1.leftNameTxt_.text = var_4_39

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_40 = arg_1_1:GetWordFromCfg(120421001)
				local var_4_41 = arg_1_1:FormatText(var_4_40.content)

				arg_1_1.text_.text = var_4_41

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_42 = 4
				local var_4_43 = utf8.len(var_4_41)
				local var_4_44 = var_4_42 <= 0 and var_4_37 or var_4_37 * (var_4_43 / var_4_42)

				if var_4_44 > 0 and var_4_37 < var_4_44 then
					arg_1_1.talkMaxDuration = var_4_44
					var_4_36 = var_4_36 + 0.3

					if var_4_44 + var_4_36 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_44 + var_4_36
					end
				end

				arg_1_1.text_.text = var_4_41
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421001", "story_v_out_120421.awb") ~= 0 then
					local var_4_45 = manager.audio:GetVoiceLength("story_v_out_120421", "120421001", "story_v_out_120421.awb") / 1000

					if var_4_45 + var_4_36 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_36
					end

					if var_4_40.prefab_name ~= "" and arg_1_1.actors_[var_4_40.prefab_name] ~= nil then
						local var_4_46 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_40.prefab_name].transform, "story_v_out_120421", "120421001", "story_v_out_120421.awb")

						arg_1_1:RecordAudio("120421001", var_4_46)
						arg_1_1:RecordAudio("120421001", var_4_46)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_120421", "120421001", "story_v_out_120421.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_120421", "120421001", "story_v_out_120421.awb")
				end

				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_47 = var_4_36 + 0.3
			local var_4_48 = math.max(var_4_37, arg_1_1.talkMaxDuration)

			if var_4_47 <= arg_1_1.time_ and arg_1_1.time_ < var_4_47 + var_4_48 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_47) / var_4_48

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_47 + var_4_48 and arg_1_1.time_ < var_4_47 + var_4_48 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play120421002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 120421002
		arg_7_1.duration_ = 4.466

		local var_7_0 = {
			zh = 2.6,
			ja = 4.466
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
				arg_7_0:Play120421003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.25

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[399].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(120421002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421002", "story_v_out_120421.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421002", "story_v_out_120421.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_120421", "120421002", "story_v_out_120421.awb")

						arg_7_1:RecordAudio("120421002", var_10_9)
						arg_7_1:RecordAudio("120421002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_120421", "120421002", "story_v_out_120421.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_120421", "120421002", "story_v_out_120421.awb")
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
	Play120421003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 120421003
		arg_11_1.duration_ = 8.866666666666

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play120421004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = arg_11_1.bgs_.XH0204.transform
			local var_14_1 = 0

			if var_14_1 < arg_11_1.time_ and arg_11_1.time_ <= var_14_1 + arg_14_0 then
				arg_11_1.var_.moveOldPosXH0204 = var_14_0.localPosition
			end

			local var_14_2 = 8

			if var_14_1 <= arg_11_1.time_ and arg_11_1.time_ < var_14_1 + var_14_2 then
				local var_14_3 = (arg_11_1.time_ - var_14_1) / var_14_2
				local var_14_4 = Vector3.New(0, 2.5, 2.5)

				var_14_0.localPosition = Vector3.Lerp(arg_11_1.var_.moveOldPosXH0204, var_14_4, var_14_3)
			end

			if arg_11_1.time_ >= var_14_1 + var_14_2 and arg_11_1.time_ < var_14_1 + var_14_2 + arg_14_0 then
				var_14_0.localPosition = Vector3.New(0, 2.5, 2.5)
			end

			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				arg_11_1.allBtn_.enabled = false
			end

			local var_14_6 = 8

			if arg_11_1.time_ >= var_14_5 + var_14_6 and arg_11_1.time_ < var_14_5 + var_14_6 + arg_14_0 then
				arg_11_1.allBtn_.enabled = true
			end

			local var_14_7 = 0
			local var_14_8 = 0.3

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_9 = arg_11_1:FormatText(StoryNameCfg[399].name)

				arg_11_1.leftNameTxt_.text = var_14_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_10 = arg_11_1:GetWordFromCfg(120421003)
				local var_14_11 = arg_11_1:FormatText(var_14_10.content)

				arg_11_1.text_.text = var_14_11

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_12 = 12
				local var_14_13 = utf8.len(var_14_11)
				local var_14_14 = var_14_12 <= 0 and var_14_8 or var_14_8 * (var_14_13 / var_14_12)

				if var_14_14 > 0 and var_14_8 < var_14_14 then
					arg_11_1.talkMaxDuration = var_14_14

					if var_14_14 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_14 + var_14_7
					end
				end

				arg_11_1.text_.text = var_14_11
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421003", "story_v_out_120421.awb") ~= 0 then
					local var_14_15 = manager.audio:GetVoiceLength("story_v_out_120421", "120421003", "story_v_out_120421.awb") / 1000

					if var_14_15 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_15 + var_14_7
					end

					if var_14_10.prefab_name ~= "" and arg_11_1.actors_[var_14_10.prefab_name] ~= nil then
						local var_14_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_10.prefab_name].transform, "story_v_out_120421", "120421003", "story_v_out_120421.awb")

						arg_11_1:RecordAudio("120421003", var_14_16)
						arg_11_1:RecordAudio("120421003", var_14_16)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_120421", "120421003", "story_v_out_120421.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_120421", "120421003", "story_v_out_120421.awb")
				end

				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_17 = math.max(var_14_8, arg_11_1.talkMaxDuration)

			if var_14_7 <= arg_11_1.time_ and arg_11_1.time_ < var_14_7 + var_14_17 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_7) / var_14_17

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_7 + var_14_17 and arg_11_1.time_ < var_14_7 + var_14_17 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play120421004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 120421004
		arg_15_1.duration_ = 7.8

		local var_15_0 = {
			zh = 4.6,
			ja = 7.8
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
				arg_15_0:Play120421005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.325

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[399].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(120421004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 13
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421004", "story_v_out_120421.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421004", "story_v_out_120421.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_120421", "120421004", "story_v_out_120421.awb")

						arg_15_1:RecordAudio("120421004", var_18_9)
						arg_15_1:RecordAudio("120421004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_120421", "120421004", "story_v_out_120421.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_120421", "120421004", "story_v_out_120421.awb")
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
	Play120421005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 120421005
		arg_19_1.duration_ = 2.633

		local var_19_0 = {
			zh = 2.633,
			ja = 2.1
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
				arg_19_0:Play120421006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.15

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[399].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(120421005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 6
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421005", "story_v_out_120421.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421005", "story_v_out_120421.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_120421", "120421005", "story_v_out_120421.awb")

						arg_19_1:RecordAudio("120421005", var_22_9)
						arg_19_1:RecordAudio("120421005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_120421", "120421005", "story_v_out_120421.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_120421", "120421005", "story_v_out_120421.awb")
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
	Play120421006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 120421006
		arg_23_1.duration_ = 4.766

		local var_23_0 = {
			zh = 3.4,
			ja = 4.766
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
				arg_23_0:Play120421007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.125

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[399].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, false)
				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(120421006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421006", "story_v_out_120421.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421006", "story_v_out_120421.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_120421", "120421006", "story_v_out_120421.awb")

						arg_23_1:RecordAudio("120421006", var_26_9)
						arg_23_1:RecordAudio("120421006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_120421", "120421006", "story_v_out_120421.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_120421", "120421006", "story_v_out_120421.awb")
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
	Play120421007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 120421007
		arg_27_1.duration_ = 3.833

		local var_27_0 = {
			zh = 2.966,
			ja = 3.833
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
				arg_27_0:Play120421008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.2

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[399].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(120421007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 8
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421007", "story_v_out_120421.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421007", "story_v_out_120421.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_120421", "120421007", "story_v_out_120421.awb")

						arg_27_1:RecordAudio("120421007", var_30_9)
						arg_27_1:RecordAudio("120421007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_120421", "120421007", "story_v_out_120421.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_120421", "120421007", "story_v_out_120421.awb")
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
	Play120421008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 120421008
		arg_31_1.duration_ = 9.366

		local var_31_0 = {
			zh = 7.866,
			ja = 9.366
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
				arg_31_0:Play120421009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.5

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[399].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(120421008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421008", "story_v_out_120421.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421008", "story_v_out_120421.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_120421", "120421008", "story_v_out_120421.awb")

						arg_31_1:RecordAudio("120421008", var_34_9)
						arg_31_1:RecordAudio("120421008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_120421", "120421008", "story_v_out_120421.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_120421", "120421008", "story_v_out_120421.awb")
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
	Play120421009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 120421009
		arg_35_1.duration_ = 9.766

		local var_35_0 = {
			zh = 9.766,
			ja = 7.5
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
				arg_35_0:Play120421010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.5

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[399].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(120421009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421009", "story_v_out_120421.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421009", "story_v_out_120421.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_120421", "120421009", "story_v_out_120421.awb")

						arg_35_1:RecordAudio("120421009", var_38_9)
						arg_35_1:RecordAudio("120421009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_120421", "120421009", "story_v_out_120421.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_120421", "120421009", "story_v_out_120421.awb")
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
	Play120421010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 120421010
		arg_39_1.duration_ = 7.433

		local var_39_0 = {
			zh = 4.2,
			ja = 7.433
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
				arg_39_0:Play120421011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 0.3

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[399].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, false)
				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(120421010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421010", "story_v_out_120421.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421010", "story_v_out_120421.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_120421", "120421010", "story_v_out_120421.awb")

						arg_39_1:RecordAudio("120421010", var_42_9)
						arg_39_1:RecordAudio("120421010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_120421", "120421010", "story_v_out_120421.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_120421", "120421010", "story_v_out_120421.awb")
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
	Play120421011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 120421011
		arg_43_1.duration_ = 2.666

		local var_43_0 = {
			zh = 1.5,
			ja = 2.666
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
				arg_43_0:Play120421012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 0.05

			if var_46_0 < arg_43_1.time_ and arg_43_1.time_ <= var_46_0 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_2 = arg_43_1:FormatText(StoryNameCfg[399].name)

				arg_43_1.leftNameTxt_.text = var_46_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_3 = arg_43_1:GetWordFromCfg(120421011)
				local var_46_4 = arg_43_1:FormatText(var_46_3.content)

				arg_43_1.text_.text = var_46_4

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421011", "story_v_out_120421.awb") ~= 0 then
					local var_46_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421011", "story_v_out_120421.awb") / 1000

					if var_46_8 + var_46_0 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_8 + var_46_0
					end

					if var_46_3.prefab_name ~= "" and arg_43_1.actors_[var_46_3.prefab_name] ~= nil then
						local var_46_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_3.prefab_name].transform, "story_v_out_120421", "120421011", "story_v_out_120421.awb")

						arg_43_1:RecordAudio("120421011", var_46_9)
						arg_43_1:RecordAudio("120421011", var_46_9)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_120421", "120421011", "story_v_out_120421.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_120421", "120421011", "story_v_out_120421.awb")
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
	Play120421012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 120421012
		arg_47_1.duration_ = 4.366

		local var_47_0 = {
			zh = 4.366,
			ja = 4.233
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
				arg_47_0:Play120421013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.225

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[399].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, false)
				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(120421012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421012", "story_v_out_120421.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421012", "story_v_out_120421.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_120421", "120421012", "story_v_out_120421.awb")

						arg_47_1:RecordAudio("120421012", var_50_9)
						arg_47_1:RecordAudio("120421012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_120421", "120421012", "story_v_out_120421.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_120421", "120421012", "story_v_out_120421.awb")
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
	Play120421013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 120421013
		arg_51_1.duration_ = 2.8

		local var_51_0 = {
			zh = 1.366,
			ja = 2.8
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
				arg_51_0:Play120421014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.125

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[399].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(120421013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421013", "story_v_out_120421.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421013", "story_v_out_120421.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_120421", "120421013", "story_v_out_120421.awb")

						arg_51_1:RecordAudio("120421013", var_54_9)
						arg_51_1:RecordAudio("120421013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_120421", "120421013", "story_v_out_120421.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_120421", "120421013", "story_v_out_120421.awb")
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
	Play120421014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 120421014
		arg_55_1.duration_ = 9.433

		local var_55_0 = {
			zh = 6.866,
			ja = 9.433
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
				arg_55_0:Play120421015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.bgs_.XH0204.transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPosXH0204 = var_58_0.localPosition
			end

			local var_58_2 = 5

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, 2.5, 3.5)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPosXH0204, var_58_4, var_58_3)
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, 2.5, 3.5)
			end

			local var_58_5 = 0
			local var_58_6 = 0.45

			if var_58_5 < arg_55_1.time_ and arg_55_1.time_ <= var_58_5 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_7 = arg_55_1:FormatText(StoryNameCfg[399].name)

				arg_55_1.leftNameTxt_.text = var_58_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_8 = arg_55_1:GetWordFromCfg(120421014)
				local var_58_9 = arg_55_1:FormatText(var_58_8.content)

				arg_55_1.text_.text = var_58_9

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_10 = 18
				local var_58_11 = utf8.len(var_58_9)
				local var_58_12 = var_58_10 <= 0 and var_58_6 or var_58_6 * (var_58_11 / var_58_10)

				if var_58_12 > 0 and var_58_6 < var_58_12 then
					arg_55_1.talkMaxDuration = var_58_12

					if var_58_12 + var_58_5 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_12 + var_58_5
					end
				end

				arg_55_1.text_.text = var_58_9
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421014", "story_v_out_120421.awb") ~= 0 then
					local var_58_13 = manager.audio:GetVoiceLength("story_v_out_120421", "120421014", "story_v_out_120421.awb") / 1000

					if var_58_13 + var_58_5 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_5
					end

					if var_58_8.prefab_name ~= "" and arg_55_1.actors_[var_58_8.prefab_name] ~= nil then
						local var_58_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_8.prefab_name].transform, "story_v_out_120421", "120421014", "story_v_out_120421.awb")

						arg_55_1:RecordAudio("120421014", var_58_14)
						arg_55_1:RecordAudio("120421014", var_58_14)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_120421", "120421014", "story_v_out_120421.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_120421", "120421014", "story_v_out_120421.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_15 = math.max(var_58_6, arg_55_1.talkMaxDuration)

			if var_58_5 <= arg_55_1.time_ and arg_55_1.time_ < var_58_5 + var_58_15 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_5) / var_58_15

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_5 + var_58_15 and arg_55_1.time_ < var_58_5 + var_58_15 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play120421015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 120421015
		arg_59_1.duration_ = 4.533

		local var_59_0 = {
			zh = 4.533,
			ja = 3.033
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
				arg_59_0:Play120421016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 0
			local var_62_1 = 0.3

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_2 = arg_59_1:FormatText(StoryNameCfg[399].name)

				arg_59_1.leftNameTxt_.text = var_62_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_3 = arg_59_1:GetWordFromCfg(120421015)
				local var_62_4 = arg_59_1:FormatText(var_62_3.content)

				arg_59_1.text_.text = var_62_4

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_5 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421015", "story_v_out_120421.awb") ~= 0 then
					local var_62_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421015", "story_v_out_120421.awb") / 1000

					if var_62_8 + var_62_0 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_8 + var_62_0
					end

					if var_62_3.prefab_name ~= "" and arg_59_1.actors_[var_62_3.prefab_name] ~= nil then
						local var_62_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_3.prefab_name].transform, "story_v_out_120421", "120421015", "story_v_out_120421.awb")

						arg_59_1:RecordAudio("120421015", var_62_9)
						arg_59_1:RecordAudio("120421015", var_62_9)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_120421", "120421015", "story_v_out_120421.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_120421", "120421015", "story_v_out_120421.awb")
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
	Play120421016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 120421016
		arg_63_1.duration_ = 8.033

		local var_63_0 = {
			zh = 8.033,
			ja = 7.7
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
				arg_63_0:Play120421017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 2

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				local var_66_1 = manager.ui.mainCamera.transform.localPosition
				local var_66_2 = Vector3.New(0, 0, 10) + Vector3.New(var_66_1.x, var_66_1.y, 0)
				local var_66_3 = arg_63_1.bgs_.XH0204

				var_66_3.transform.localPosition = var_66_2
				var_66_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_66_4 = var_66_3:GetComponent("SpriteRenderer")

				if var_66_4 and var_66_4.sprite then
					local var_66_5 = (var_66_3.transform.localPosition - var_66_1).z
					local var_66_6 = manager.ui.mainCameraCom_
					local var_66_7 = 2 * var_66_5 * Mathf.Tan(var_66_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_66_8 = var_66_7 * var_66_6.aspect
					local var_66_9 = var_66_4.sprite.bounds.size.x
					local var_66_10 = var_66_4.sprite.bounds.size.y
					local var_66_11 = var_66_8 / var_66_9
					local var_66_12 = var_66_7 / var_66_10
					local var_66_13 = var_66_12 < var_66_11 and var_66_11 or var_66_12

					var_66_3.transform.localScale = Vector3.New(var_66_13, var_66_13, 0)
				end

				for iter_66_0, iter_66_1 in pairs(arg_63_1.bgs_) do
					if iter_66_0 ~= "XH0204" then
						iter_66_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_66_14 = 0

			if var_66_14 < arg_63_1.time_ and arg_63_1.time_ <= var_66_14 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_15 = 2

			if var_66_14 <= arg_63_1.time_ and arg_63_1.time_ < var_66_14 + var_66_15 then
				local var_66_16 = (arg_63_1.time_ - var_66_14) / var_66_15
				local var_66_17 = Color.New(0, 0, 0)

				var_66_17.a = Mathf.Lerp(0, 1, var_66_16)
				arg_63_1.mask_.color = var_66_17
			end

			if arg_63_1.time_ >= var_66_14 + var_66_15 and arg_63_1.time_ < var_66_14 + var_66_15 + arg_66_0 then
				local var_66_18 = Color.New(0, 0, 0)

				var_66_18.a = 1
				arg_63_1.mask_.color = var_66_18
			end

			local var_66_19 = 2

			if var_66_19 < arg_63_1.time_ and arg_63_1.time_ <= var_66_19 + arg_66_0 then
				arg_63_1.mask_.enabled = true
				arg_63_1.mask_.raycastTarget = true

				arg_63_1:SetGaussion(false)
			end

			local var_66_20 = 2

			if var_66_19 <= arg_63_1.time_ and arg_63_1.time_ < var_66_19 + var_66_20 then
				local var_66_21 = (arg_63_1.time_ - var_66_19) / var_66_20
				local var_66_22 = Color.New(0, 0, 0)

				var_66_22.a = Mathf.Lerp(1, 0, var_66_21)
				arg_63_1.mask_.color = var_66_22
			end

			if arg_63_1.time_ >= var_66_19 + var_66_20 and arg_63_1.time_ < var_66_19 + var_66_20 + arg_66_0 then
				local var_66_23 = Color.New(0, 0, 0)
				local var_66_24 = 0

				arg_63_1.mask_.enabled = false
				var_66_23.a = var_66_24
				arg_63_1.mask_.color = var_66_23
			end

			if arg_63_1.frameCnt_ <= 1 then
				arg_63_1.dialog_:SetActive(false)
			end

			local var_66_25 = 4
			local var_66_26 = 0.25

			if var_66_25 < arg_63_1.time_ and arg_63_1.time_ <= var_66_25 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0

				arg_63_1.dialog_:SetActive(true)

				local var_66_27 = LeanTween.value(arg_63_1.dialog_, 0, 1, 0.3)

				var_66_27:setOnUpdate(LuaHelper.FloatAction(function(arg_67_0)
					arg_63_1.dialogCg_.alpha = arg_67_0
				end))
				var_66_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_63_1.dialog_)
					var_66_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_63_1.duration_ = arg_63_1.duration_ + 0.3

				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_28 = arg_63_1:FormatText(StoryNameCfg[399].name)

				arg_63_1.leftNameTxt_.text = var_66_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, false)
				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_29 = arg_63_1:GetWordFromCfg(120421016)
				local var_66_30 = arg_63_1:FormatText(var_66_29.content)

				arg_63_1.text_.text = var_66_30

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_31 = 10
				local var_66_32 = utf8.len(var_66_30)
				local var_66_33 = var_66_31 <= 0 and var_66_26 or var_66_26 * (var_66_32 / var_66_31)

				if var_66_33 > 0 and var_66_26 < var_66_33 then
					arg_63_1.talkMaxDuration = var_66_33
					var_66_25 = var_66_25 + 0.3

					if var_66_33 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_33 + var_66_25
					end
				end

				arg_63_1.text_.text = var_66_30
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421016", "story_v_out_120421.awb") ~= 0 then
					local var_66_34 = manager.audio:GetVoiceLength("story_v_out_120421", "120421016", "story_v_out_120421.awb") / 1000

					if var_66_34 + var_66_25 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_34 + var_66_25
					end

					if var_66_29.prefab_name ~= "" and arg_63_1.actors_[var_66_29.prefab_name] ~= nil then
						local var_66_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_29.prefab_name].transform, "story_v_out_120421", "120421016", "story_v_out_120421.awb")

						arg_63_1:RecordAudio("120421016", var_66_35)
						arg_63_1:RecordAudio("120421016", var_66_35)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_120421", "120421016", "story_v_out_120421.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_120421", "120421016", "story_v_out_120421.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_36 = var_66_25 + 0.3
			local var_66_37 = math.max(var_66_26, arg_63_1.talkMaxDuration)

			if var_66_36 <= arg_63_1.time_ and arg_63_1.time_ < var_66_36 + var_66_37 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_36) / var_66_37

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_36 + var_66_37 and arg_63_1.time_ < var_66_36 + var_66_37 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play120421017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 120421017
		arg_69_1.duration_ = 6.566

		local var_69_0 = {
			zh = 6.566,
			ja = 5.133
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
				arg_69_0:Play120421018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = "ST37"

			if arg_69_1.bgs_[var_72_0] == nil then
				local var_72_1 = Object.Instantiate(arg_69_1.paintGo_)

				var_72_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_72_0)
				var_72_1.name = var_72_0
				var_72_1.transform.parent = arg_69_1.stage_.transform
				var_72_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_69_1.bgs_[var_72_0] = var_72_1
			end

			local var_72_2 = 2

			if var_72_2 < arg_69_1.time_ and arg_69_1.time_ <= var_72_2 + arg_72_0 then
				local var_72_3 = manager.ui.mainCamera.transform.localPosition
				local var_72_4 = Vector3.New(0, 0, 10) + Vector3.New(var_72_3.x, var_72_3.y, 0)
				local var_72_5 = arg_69_1.bgs_.ST37

				var_72_5.transform.localPosition = var_72_4
				var_72_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_72_6 = var_72_5:GetComponent("SpriteRenderer")

				if var_72_6 and var_72_6.sprite then
					local var_72_7 = (var_72_5.transform.localPosition - var_72_3).z
					local var_72_8 = manager.ui.mainCameraCom_
					local var_72_9 = 2 * var_72_7 * Mathf.Tan(var_72_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_72_10 = var_72_9 * var_72_8.aspect
					local var_72_11 = var_72_6.sprite.bounds.size.x
					local var_72_12 = var_72_6.sprite.bounds.size.y
					local var_72_13 = var_72_10 / var_72_11
					local var_72_14 = var_72_9 / var_72_12
					local var_72_15 = var_72_14 < var_72_13 and var_72_13 or var_72_14

					var_72_5.transform.localScale = Vector3.New(var_72_15, var_72_15, 0)
				end

				for iter_72_0, iter_72_1 in pairs(arg_69_1.bgs_) do
					if iter_72_0 ~= "ST37" then
						iter_72_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_72_16 = 0

			if var_72_16 < arg_69_1.time_ and arg_69_1.time_ <= var_72_16 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_17 = 2

			if var_72_16 <= arg_69_1.time_ and arg_69_1.time_ < var_72_16 + var_72_17 then
				local var_72_18 = (arg_69_1.time_ - var_72_16) / var_72_17
				local var_72_19 = Color.New(0, 0, 0)

				var_72_19.a = Mathf.Lerp(0, 1, var_72_18)
				arg_69_1.mask_.color = var_72_19
			end

			if arg_69_1.time_ >= var_72_16 + var_72_17 and arg_69_1.time_ < var_72_16 + var_72_17 + arg_72_0 then
				local var_72_20 = Color.New(0, 0, 0)

				var_72_20.a = 1
				arg_69_1.mask_.color = var_72_20
			end

			local var_72_21 = 2

			if var_72_21 < arg_69_1.time_ and arg_69_1.time_ <= var_72_21 + arg_72_0 then
				arg_69_1.mask_.enabled = true
				arg_69_1.mask_.raycastTarget = true

				arg_69_1:SetGaussion(false)
			end

			local var_72_22 = 2

			if var_72_21 <= arg_69_1.time_ and arg_69_1.time_ < var_72_21 + var_72_22 then
				local var_72_23 = (arg_69_1.time_ - var_72_21) / var_72_22
				local var_72_24 = Color.New(0, 0, 0)

				var_72_24.a = Mathf.Lerp(1, 0, var_72_23)
				arg_69_1.mask_.color = var_72_24
			end

			if arg_69_1.time_ >= var_72_21 + var_72_22 and arg_69_1.time_ < var_72_21 + var_72_22 + arg_72_0 then
				local var_72_25 = Color.New(0, 0, 0)
				local var_72_26 = 0

				arg_69_1.mask_.enabled = false
				var_72_25.a = var_72_26
				arg_69_1.mask_.color = var_72_25
			end

			local var_72_27 = 0.133333333333333
			local var_72_28 = 1

			if var_72_27 < arg_69_1.time_ and arg_69_1.time_ <= var_72_27 + arg_72_0 then
				local var_72_29 = "play"
				local var_72_30 = "music"

				arg_69_1:AudioAction(var_72_29, var_72_30, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			if arg_69_1.frameCnt_ <= 1 then
				arg_69_1.dialog_:SetActive(false)
			end

			local var_72_31 = 4
			local var_72_32 = 0.075

			if var_72_31 < arg_69_1.time_ and arg_69_1.time_ <= var_72_31 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0

				arg_69_1.dialog_:SetActive(true)

				local var_72_33 = LeanTween.value(arg_69_1.dialog_, 0, 1, 0.3)

				var_72_33:setOnUpdate(LuaHelper.FloatAction(function(arg_73_0)
					arg_69_1.dialogCg_.alpha = arg_73_0
				end))
				var_72_33:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_69_1.dialog_)
					var_72_33:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_69_1.duration_ = arg_69_1.duration_ + 0.3

				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_34 = arg_69_1:FormatText(StoryNameCfg[6].name)

				arg_69_1.leftNameTxt_.text = var_72_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, true)
				arg_69_1.iconController_:SetSelectedState("hero")

				arg_69_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1084")

				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_35 = arg_69_1:GetWordFromCfg(120421017)
				local var_72_36 = arg_69_1:FormatText(var_72_35.content)

				arg_69_1.text_.text = var_72_36

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_37 = 3
				local var_72_38 = utf8.len(var_72_36)
				local var_72_39 = var_72_37 <= 0 and var_72_32 or var_72_32 * (var_72_38 / var_72_37)

				if var_72_39 > 0 and var_72_32 < var_72_39 then
					arg_69_1.talkMaxDuration = var_72_39
					var_72_31 = var_72_31 + 0.3

					if var_72_39 + var_72_31 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_39 + var_72_31
					end
				end

				arg_69_1.text_.text = var_72_36
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421017", "story_v_out_120421.awb") ~= 0 then
					local var_72_40 = manager.audio:GetVoiceLength("story_v_out_120421", "120421017", "story_v_out_120421.awb") / 1000

					if var_72_40 + var_72_31 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_40 + var_72_31
					end

					if var_72_35.prefab_name ~= "" and arg_69_1.actors_[var_72_35.prefab_name] ~= nil then
						local var_72_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_35.prefab_name].transform, "story_v_out_120421", "120421017", "story_v_out_120421.awb")

						arg_69_1:RecordAudio("120421017", var_72_41)
						arg_69_1:RecordAudio("120421017", var_72_41)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_120421", "120421017", "story_v_out_120421.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_120421", "120421017", "story_v_out_120421.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_42 = var_72_31 + 0.3
			local var_72_43 = math.max(var_72_32, arg_69_1.talkMaxDuration)

			if var_72_42 <= arg_69_1.time_ and arg_69_1.time_ < var_72_42 + var_72_43 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_42) / var_72_43

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_42 + var_72_43 and arg_69_1.time_ < var_72_42 + var_72_43 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play120421018 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 120421018
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play120421019(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = 0
			local var_78_1 = 1.55

			if var_78_0 < arg_75_1.time_ and arg_75_1.time_ <= var_78_0 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_2 = arg_75_1:GetWordFromCfg(120421018)
				local var_78_3 = arg_75_1:FormatText(var_78_2.content)

				arg_75_1.text_.text = var_78_3

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_4 = 62
				local var_78_5 = utf8.len(var_78_3)
				local var_78_6 = var_78_4 <= 0 and var_78_1 or var_78_1 * (var_78_5 / var_78_4)

				if var_78_6 > 0 and var_78_1 < var_78_6 then
					arg_75_1.talkMaxDuration = var_78_6

					if var_78_6 + var_78_0 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_6 + var_78_0
					end
				end

				arg_75_1.text_.text = var_78_3
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_7 = math.max(var_78_1, arg_75_1.talkMaxDuration)

			if var_78_0 <= arg_75_1.time_ and arg_75_1.time_ < var_78_0 + var_78_7 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_0) / var_78_7

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_0 + var_78_7 and arg_75_1.time_ < var_78_0 + var_78_7 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play120421019 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 120421019
		arg_79_1.duration_ = 8.433

		local var_79_0 = {
			zh = 3.5,
			ja = 8.433
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
				arg_79_0:Play120421020(arg_79_1)
			end
		end

		function arg_79_1.onSingleLineUpdate_(arg_82_0)
			local var_82_0 = "1084ui_story"

			if arg_79_1.actors_[var_82_0] == nil then
				local var_82_1 = Object.Instantiate(Asset.Load("Char/" .. var_82_0), arg_79_1.stage_.transform)

				var_82_1.name = var_82_0
				var_82_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_79_1.actors_[var_82_0] = var_82_1

				local var_82_2 = var_82_1:GetComponentInChildren(typeof(CharacterEffect))

				var_82_2.enabled = true

				local var_82_3 = GameObjectTools.GetOrAddComponent(var_82_1, typeof(DynamicBoneHelper))

				if var_82_3 then
					var_82_3:EnableDynamicBone(false)
				end

				arg_79_1:ShowWeapon(var_82_2.transform, false)

				arg_79_1.var_[var_82_0 .. "Animator"] = var_82_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_79_1.var_[var_82_0 .. "Animator"].applyRootMotion = true
				arg_79_1.var_[var_82_0 .. "LipSync"] = var_82_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_82_4 = arg_79_1.actors_["1084ui_story"].transform
			local var_82_5 = 0

			if var_82_5 < arg_79_1.time_ and arg_79_1.time_ <= var_82_5 + arg_82_0 then
				arg_79_1.var_.moveOldPos1084ui_story = var_82_4.localPosition
			end

			local var_82_6 = 0.001

			if var_82_5 <= arg_79_1.time_ and arg_79_1.time_ < var_82_5 + var_82_6 then
				local var_82_7 = (arg_79_1.time_ - var_82_5) / var_82_6
				local var_82_8 = Vector3.New(0, -0.97, -6)

				var_82_4.localPosition = Vector3.Lerp(arg_79_1.var_.moveOldPos1084ui_story, var_82_8, var_82_7)

				local var_82_9 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_9.x, var_82_9.y, var_82_9.z)

				local var_82_10 = var_82_4.localEulerAngles

				var_82_10.z = 0
				var_82_10.x = 0
				var_82_4.localEulerAngles = var_82_10
			end

			if arg_79_1.time_ >= var_82_5 + var_82_6 and arg_79_1.time_ < var_82_5 + var_82_6 + arg_82_0 then
				var_82_4.localPosition = Vector3.New(0, -0.97, -6)

				local var_82_11 = manager.ui.mainCamera.transform.position - var_82_4.position

				var_82_4.forward = Vector3.New(var_82_11.x, var_82_11.y, var_82_11.z)

				local var_82_12 = var_82_4.localEulerAngles

				var_82_12.z = 0
				var_82_12.x = 0
				var_82_4.localEulerAngles = var_82_12
			end

			local var_82_13 = 0

			if var_82_13 < arg_79_1.time_ and arg_79_1.time_ <= var_82_13 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_1")
			end

			local var_82_14 = 0

			if var_82_14 < arg_79_1.time_ and arg_79_1.time_ <= var_82_14 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1304cva")
			end

			local var_82_15 = arg_79_1.actors_["1084ui_story"]
			local var_82_16 = 0

			if var_82_16 < arg_79_1.time_ and arg_79_1.time_ <= var_82_16 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_17 = 0.2

			if var_82_16 <= arg_79_1.time_ and arg_79_1.time_ < var_82_16 + var_82_17 then
				local var_82_18 = (arg_79_1.time_ - var_82_16) / var_82_17

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_16 + var_82_17 and arg_79_1.time_ < var_82_16 + var_82_17 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_19 = 0
			local var_82_20 = 0.225

			if var_82_19 < arg_79_1.time_ and arg_79_1.time_ <= var_82_19 + arg_82_0 then
				arg_79_1.talkMaxDuration = 0
				arg_79_1.dialogCg_.alpha = 1

				arg_79_1.dialog_:SetActive(true)
				SetActive(arg_79_1.leftNameGo_, true)

				local var_82_21 = arg_79_1:FormatText(StoryNameCfg[6].name)

				arg_79_1.leftNameTxt_.text = var_82_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_79_1.leftNameTxt_.transform)

				arg_79_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_79_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_79_1:RecordName(arg_79_1.leftNameTxt_.text)
				SetActive(arg_79_1.iconTrs_.gameObject, false)
				arg_79_1.callingController_:SetSelectedState("normal")

				local var_82_22 = arg_79_1:GetWordFromCfg(120421019)
				local var_82_23 = arg_79_1:FormatText(var_82_22.content)

				arg_79_1.text_.text = var_82_23

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_24 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421019", "story_v_out_120421.awb") ~= 0 then
					local var_82_27 = manager.audio:GetVoiceLength("story_v_out_120421", "120421019", "story_v_out_120421.awb") / 1000

					if var_82_27 + var_82_19 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_27 + var_82_19
					end

					if var_82_22.prefab_name ~= "" and arg_79_1.actors_[var_82_22.prefab_name] ~= nil then
						local var_82_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_22.prefab_name].transform, "story_v_out_120421", "120421019", "story_v_out_120421.awb")

						arg_79_1:RecordAudio("120421019", var_82_28)
						arg_79_1:RecordAudio("120421019", var_82_28)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_120421", "120421019", "story_v_out_120421.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_120421", "120421019", "story_v_out_120421.awb")
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
	Play120421020 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 120421020
		arg_83_1.duration_ = 5.3

		local var_83_0 = {
			zh = 5.3,
			ja = 3.9
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
				arg_83_0:Play120421021(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = 0
			local var_86_1 = 0.2

			if var_86_0 < arg_83_1.time_ and arg_83_1.time_ <= var_86_0 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_2 = arg_83_1:FormatText(StoryNameCfg[6].name)

				arg_83_1.leftNameTxt_.text = var_86_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, false)
				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_3 = arg_83_1:GetWordFromCfg(120421020)
				local var_86_4 = arg_83_1:FormatText(var_86_3.content)

				arg_83_1.text_.text = var_86_4

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_5 = 8
				local var_86_6 = utf8.len(var_86_4)
				local var_86_7 = var_86_5 <= 0 and var_86_1 or var_86_1 * (var_86_6 / var_86_5)

				if var_86_7 > 0 and var_86_1 < var_86_7 then
					arg_83_1.talkMaxDuration = var_86_7

					if var_86_7 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_7 + var_86_0
					end
				end

				arg_83_1.text_.text = var_86_4
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421020", "story_v_out_120421.awb") ~= 0 then
					local var_86_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421020", "story_v_out_120421.awb") / 1000

					if var_86_8 + var_86_0 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_8 + var_86_0
					end

					if var_86_3.prefab_name ~= "" and arg_83_1.actors_[var_86_3.prefab_name] ~= nil then
						local var_86_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_3.prefab_name].transform, "story_v_out_120421", "120421020", "story_v_out_120421.awb")

						arg_83_1:RecordAudio("120421020", var_86_9)
						arg_83_1:RecordAudio("120421020", var_86_9)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_120421", "120421020", "story_v_out_120421.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_120421", "120421020", "story_v_out_120421.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_10 = math.max(var_86_1, arg_83_1.talkMaxDuration)

			if var_86_0 <= arg_83_1.time_ and arg_83_1.time_ < var_86_0 + var_86_10 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_0) / var_86_10

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_0 + var_86_10 and arg_83_1.time_ < var_86_0 + var_86_10 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play120421021 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 120421021
		arg_87_1.duration_ = 5

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play120421022(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			local var_90_0 = arg_87_1.actors_["1084ui_story"].transform
			local var_90_1 = 0

			if var_90_1 < arg_87_1.time_ and arg_87_1.time_ <= var_90_1 + arg_90_0 then
				arg_87_1.var_.moveOldPos1084ui_story = var_90_0.localPosition
			end

			local var_90_2 = 0.001

			if var_90_1 <= arg_87_1.time_ and arg_87_1.time_ < var_90_1 + var_90_2 then
				local var_90_3 = (arg_87_1.time_ - var_90_1) / var_90_2
				local var_90_4 = Vector3.New(0, 100, 0)

				var_90_0.localPosition = Vector3.Lerp(arg_87_1.var_.moveOldPos1084ui_story, var_90_4, var_90_3)

				local var_90_5 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_5.x, var_90_5.y, var_90_5.z)

				local var_90_6 = var_90_0.localEulerAngles

				var_90_6.z = 0
				var_90_6.x = 0
				var_90_0.localEulerAngles = var_90_6
			end

			if arg_87_1.time_ >= var_90_1 + var_90_2 and arg_87_1.time_ < var_90_1 + var_90_2 + arg_90_0 then
				var_90_0.localPosition = Vector3.New(0, 100, 0)

				local var_90_7 = manager.ui.mainCamera.transform.position - var_90_0.position

				var_90_0.forward = Vector3.New(var_90_7.x, var_90_7.y, var_90_7.z)

				local var_90_8 = var_90_0.localEulerAngles

				var_90_8.z = 0
				var_90_8.x = 0
				var_90_0.localEulerAngles = var_90_8
			end

			local var_90_9 = 0
			local var_90_10 = 1

			if var_90_9 < arg_87_1.time_ and arg_87_1.time_ <= var_90_9 + arg_90_0 then
				local var_90_11 = "play"
				local var_90_12 = "effect"

				arg_87_1:AudioAction(var_90_11, var_90_12, "se_story_16", "se_story_16_door06", "")
			end

			local var_90_13 = 0
			local var_90_14 = 1.075

			if var_90_13 < arg_87_1.time_ and arg_87_1.time_ <= var_90_13 + arg_90_0 then
				arg_87_1.talkMaxDuration = 0
				arg_87_1.dialogCg_.alpha = 1

				arg_87_1.dialog_:SetActive(true)
				SetActive(arg_87_1.leftNameGo_, false)

				arg_87_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_87_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_87_1:RecordName(arg_87_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_87_1.iconTrs_.gameObject, false)
				arg_87_1.callingController_:SetSelectedState("normal")

				local var_90_15 = arg_87_1:GetWordFromCfg(120421021)
				local var_90_16 = arg_87_1:FormatText(var_90_15.content)

				arg_87_1.text_.text = var_90_16

				LuaForUtil.ClearLinePrefixSymbol(arg_87_1.text_)

				local var_90_17 = 43
				local var_90_18 = utf8.len(var_90_16)
				local var_90_19 = var_90_17 <= 0 and var_90_14 or var_90_14 * (var_90_18 / var_90_17)

				if var_90_19 > 0 and var_90_14 < var_90_19 then
					arg_87_1.talkMaxDuration = var_90_19

					if var_90_19 + var_90_13 > arg_87_1.duration_ then
						arg_87_1.duration_ = var_90_19 + var_90_13
					end
				end

				arg_87_1.text_.text = var_90_16
				arg_87_1.typewritter.percent = 0

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(false)
				arg_87_1:RecordContent(arg_87_1.text_.text)
			end

			local var_90_20 = math.max(var_90_14, arg_87_1.talkMaxDuration)

			if var_90_13 <= arg_87_1.time_ and arg_87_1.time_ < var_90_13 + var_90_20 then
				arg_87_1.typewritter.percent = (arg_87_1.time_ - var_90_13) / var_90_20

				arg_87_1.typewritter:SetDirty()
			end

			if arg_87_1.time_ >= var_90_13 + var_90_20 and arg_87_1.time_ < var_90_13 + var_90_20 + arg_90_0 then
				arg_87_1.typewritter.percent = 1

				arg_87_1.typewritter:SetDirty()
				arg_87_1:ShowNextGo(true)
			end
		end
	end,
	Play120421022 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 120421022
		arg_91_1.duration_ = 5.733

		local var_91_0 = {
			zh = 3.766,
			ja = 5.733
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
				arg_91_0:Play120421023(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = arg_91_1.actors_["1084ui_story"].transform
			local var_94_1 = 0

			if var_94_1 < arg_91_1.time_ and arg_91_1.time_ <= var_94_1 + arg_94_0 then
				arg_91_1.var_.moveOldPos1084ui_story = var_94_0.localPosition
			end

			local var_94_2 = 0.001

			if var_94_1 <= arg_91_1.time_ and arg_91_1.time_ < var_94_1 + var_94_2 then
				local var_94_3 = (arg_91_1.time_ - var_94_1) / var_94_2
				local var_94_4 = Vector3.New(0, -0.97, -6)

				var_94_0.localPosition = Vector3.Lerp(arg_91_1.var_.moveOldPos1084ui_story, var_94_4, var_94_3)

				local var_94_5 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_5.x, var_94_5.y, var_94_5.z)

				local var_94_6 = var_94_0.localEulerAngles

				var_94_6.z = 0
				var_94_6.x = 0
				var_94_0.localEulerAngles = var_94_6
			end

			if arg_91_1.time_ >= var_94_1 + var_94_2 and arg_91_1.time_ < var_94_1 + var_94_2 + arg_94_0 then
				var_94_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_94_7 = manager.ui.mainCamera.transform.position - var_94_0.position

				var_94_0.forward = Vector3.New(var_94_7.x, var_94_7.y, var_94_7.z)

				local var_94_8 = var_94_0.localEulerAngles

				var_94_8.z = 0
				var_94_8.x = 0
				var_94_0.localEulerAngles = var_94_8
			end

			local var_94_9 = 0

			if var_94_9 < arg_91_1.time_ and arg_91_1.time_ <= var_94_9 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_94_10 = arg_91_1.actors_["1084ui_story"]
			local var_94_11 = 0

			if var_94_11 < arg_91_1.time_ and arg_91_1.time_ <= var_94_11 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story == nil then
				arg_91_1.var_.characterEffect1084ui_story = var_94_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_94_12 = 0.2

			if var_94_11 <= arg_91_1.time_ and arg_91_1.time_ < var_94_11 + var_94_12 then
				local var_94_13 = (arg_91_1.time_ - var_94_11) / var_94_12

				if arg_91_1.var_.characterEffect1084ui_story then
					arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_91_1.time_ >= var_94_11 + var_94_12 and arg_91_1.time_ < var_94_11 + var_94_12 + arg_94_0 and arg_91_1.var_.characterEffect1084ui_story then
				arg_91_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_94_14 = 0

			if var_94_14 < arg_91_1.time_ and arg_91_1.time_ <= var_94_14 + arg_94_0 then
				arg_91_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_94_15 = 0
			local var_94_16 = 0.35

			if var_94_15 < arg_91_1.time_ and arg_91_1.time_ <= var_94_15 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_17 = arg_91_1:FormatText(StoryNameCfg[6].name)

				arg_91_1.leftNameTxt_.text = var_94_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, false)
				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_18 = arg_91_1:GetWordFromCfg(120421022)
				local var_94_19 = arg_91_1:FormatText(var_94_18.content)

				arg_91_1.text_.text = var_94_19

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_20 = 14
				local var_94_21 = utf8.len(var_94_19)
				local var_94_22 = var_94_20 <= 0 and var_94_16 or var_94_16 * (var_94_21 / var_94_20)

				if var_94_22 > 0 and var_94_16 < var_94_22 then
					arg_91_1.talkMaxDuration = var_94_22

					if var_94_22 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_22 + var_94_15
					end
				end

				arg_91_1.text_.text = var_94_19
				arg_91_1.typewritter.percent = 0

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421022", "story_v_out_120421.awb") ~= 0 then
					local var_94_23 = manager.audio:GetVoiceLength("story_v_out_120421", "120421022", "story_v_out_120421.awb") / 1000

					if var_94_23 + var_94_15 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_23 + var_94_15
					end

					if var_94_18.prefab_name ~= "" and arg_91_1.actors_[var_94_18.prefab_name] ~= nil then
						local var_94_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_18.prefab_name].transform, "story_v_out_120421", "120421022", "story_v_out_120421.awb")

						arg_91_1:RecordAudio("120421022", var_94_24)
						arg_91_1:RecordAudio("120421022", var_94_24)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_120421", "120421022", "story_v_out_120421.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_120421", "120421022", "story_v_out_120421.awb")
				end

				arg_91_1:RecordContent(arg_91_1.text_.text)
			end

			local var_94_25 = math.max(var_94_16, arg_91_1.talkMaxDuration)

			if var_94_15 <= arg_91_1.time_ and arg_91_1.time_ < var_94_15 + var_94_25 then
				arg_91_1.typewritter.percent = (arg_91_1.time_ - var_94_15) / var_94_25

				arg_91_1.typewritter:SetDirty()
			end

			if arg_91_1.time_ >= var_94_15 + var_94_25 and arg_91_1.time_ < var_94_15 + var_94_25 + arg_94_0 then
				arg_91_1.typewritter.percent = 1

				arg_91_1.typewritter:SetDirty()
				arg_91_1:ShowNextGo(true)
			end
		end
	end,
	Play120421023 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 120421023
		arg_95_1.duration_ = 5

		SetActive(arg_95_1.tipsGo_, false)

		function arg_95_1.onSingleLineFinish_()
			arg_95_1.onSingleLineUpdate_ = nil
			arg_95_1.onSingleLineFinish_ = nil
			arg_95_1.state_ = "waiting"
		end

		function arg_95_1.playNext_(arg_97_0)
			if arg_97_0 == 1 then
				arg_95_0:Play120421024(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = arg_95_1.actors_["1084ui_story"].transform
			local var_98_1 = 0

			if var_98_1 < arg_95_1.time_ and arg_95_1.time_ <= var_98_1 + arg_98_0 then
				arg_95_1.var_.moveOldPos1084ui_story = var_98_0.localPosition
			end

			local var_98_2 = 0.001

			if var_98_1 <= arg_95_1.time_ and arg_95_1.time_ < var_98_1 + var_98_2 then
				local var_98_3 = (arg_95_1.time_ - var_98_1) / var_98_2
				local var_98_4 = Vector3.New(0, 100, 0)

				var_98_0.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1084ui_story, var_98_4, var_98_3)

				local var_98_5 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_5.x, var_98_5.y, var_98_5.z)

				local var_98_6 = var_98_0.localEulerAngles

				var_98_6.z = 0
				var_98_6.x = 0
				var_98_0.localEulerAngles = var_98_6
			end

			if arg_95_1.time_ >= var_98_1 + var_98_2 and arg_95_1.time_ < var_98_1 + var_98_2 + arg_98_0 then
				var_98_0.localPosition = Vector3.New(0, 100, 0)

				local var_98_7 = manager.ui.mainCamera.transform.position - var_98_0.position

				var_98_0.forward = Vector3.New(var_98_7.x, var_98_7.y, var_98_7.z)

				local var_98_8 = var_98_0.localEulerAngles

				var_98_8.z = 0
				var_98_8.x = 0
				var_98_0.localEulerAngles = var_98_8
			end

			local var_98_9 = 0
			local var_98_10 = 1.525

			if var_98_9 < arg_95_1.time_ and arg_95_1.time_ <= var_98_9 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, false)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_11 = arg_95_1:GetWordFromCfg(120421023)
				local var_98_12 = arg_95_1:FormatText(var_98_11.content)

				arg_95_1.text_.text = var_98_12

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_13 = 61
				local var_98_14 = utf8.len(var_98_12)
				local var_98_15 = var_98_13 <= 0 and var_98_10 or var_98_10 * (var_98_14 / var_98_13)

				if var_98_15 > 0 and var_98_10 < var_98_15 then
					arg_95_1.talkMaxDuration = var_98_15

					if var_98_15 + var_98_9 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_15 + var_98_9
					end
				end

				arg_95_1.text_.text = var_98_12
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)
				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_16 = math.max(var_98_10, arg_95_1.talkMaxDuration)

			if var_98_9 <= arg_95_1.time_ and arg_95_1.time_ < var_98_9 + var_98_16 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_9) / var_98_16

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_9 + var_98_16 and arg_95_1.time_ < var_98_9 + var_98_16 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play120421024 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 120421024
		arg_99_1.duration_ = 5

		SetActive(arg_99_1.tipsGo_, false)

		function arg_99_1.onSingleLineFinish_()
			arg_99_1.onSingleLineUpdate_ = nil
			arg_99_1.onSingleLineFinish_ = nil
			arg_99_1.state_ = "waiting"
		end

		function arg_99_1.playNext_(arg_101_0)
			if arg_101_0 == 1 then
				arg_99_0:Play120421025(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = 0
			local var_102_1 = 0.325

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

				local var_102_2 = arg_99_1:GetWordFromCfg(120421024)
				local var_102_3 = arg_99_1:FormatText(var_102_2.content)

				arg_99_1.text_.text = var_102_3

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_4 = 13
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
	Play120421025 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 120421025
		arg_103_1.duration_ = 2

		local var_103_0 = {
			zh = 1.3,
			ja = 2
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
				arg_103_0:Play120421026(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = 0
			local var_106_1 = 0.125

			if var_106_0 < arg_103_1.time_ and arg_103_1.time_ <= var_106_0 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_2 = arg_103_1:FormatText(StoryNameCfg[381].name)

				arg_103_1.leftNameTxt_.text = var_106_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, true)
				arg_103_1.iconController_:SetSelectedState("hero")

				arg_103_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1075")

				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_3 = arg_103_1:GetWordFromCfg(120421025)
				local var_106_4 = arg_103_1:FormatText(var_106_3.content)

				arg_103_1.text_.text = var_106_4

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_5 = 5
				local var_106_6 = utf8.len(var_106_4)
				local var_106_7 = var_106_5 <= 0 and var_106_1 or var_106_1 * (var_106_6 / var_106_5)

				if var_106_7 > 0 and var_106_1 < var_106_7 then
					arg_103_1.talkMaxDuration = var_106_7

					if var_106_7 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_7 + var_106_0
					end
				end

				arg_103_1.text_.text = var_106_4
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421025", "story_v_out_120421.awb") ~= 0 then
					local var_106_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421025", "story_v_out_120421.awb") / 1000

					if var_106_8 + var_106_0 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_8 + var_106_0
					end

					if var_106_3.prefab_name ~= "" and arg_103_1.actors_[var_106_3.prefab_name] ~= nil then
						local var_106_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_3.prefab_name].transform, "story_v_out_120421", "120421025", "story_v_out_120421.awb")

						arg_103_1:RecordAudio("120421025", var_106_9)
						arg_103_1:RecordAudio("120421025", var_106_9)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_120421", "120421025", "story_v_out_120421.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_120421", "120421025", "story_v_out_120421.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_10 = math.max(var_106_1, arg_103_1.talkMaxDuration)

			if var_106_0 <= arg_103_1.time_ and arg_103_1.time_ < var_106_0 + var_106_10 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_0) / var_106_10

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_0 + var_106_10 and arg_103_1.time_ < var_106_0 + var_106_10 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play120421026 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 120421026
		arg_107_1.duration_ = 5

		SetActive(arg_107_1.tipsGo_, false)

		function arg_107_1.onSingleLineFinish_()
			arg_107_1.onSingleLineUpdate_ = nil
			arg_107_1.onSingleLineFinish_ = nil
			arg_107_1.state_ = "waiting"
		end

		function arg_107_1.playNext_(arg_109_0)
			if arg_109_0 == 1 then
				arg_107_0:Play120421027(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = 0
			local var_110_1 = 1

			if var_110_0 < arg_107_1.time_ and arg_107_1.time_ <= var_110_0 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, false)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_107_1.iconTrs_.gameObject, false)
				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_2 = arg_107_1:GetWordFromCfg(120421026)
				local var_110_3 = arg_107_1:FormatText(var_110_2.content)

				arg_107_1.text_.text = var_110_3

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_4 = 40
				local var_110_5 = utf8.len(var_110_3)
				local var_110_6 = var_110_4 <= 0 and var_110_1 or var_110_1 * (var_110_5 / var_110_4)

				if var_110_6 > 0 and var_110_1 < var_110_6 then
					arg_107_1.talkMaxDuration = var_110_6

					if var_110_6 + var_110_0 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_6 + var_110_0
					end
				end

				arg_107_1.text_.text = var_110_3
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)
				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_7 = math.max(var_110_1, arg_107_1.talkMaxDuration)

			if var_110_0 <= arg_107_1.time_ and arg_107_1.time_ < var_110_0 + var_110_7 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_0) / var_110_7

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_0 + var_110_7 and arg_107_1.time_ < var_110_0 + var_110_7 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play120421027 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 120421027
		arg_111_1.duration_ = 3.033

		local var_111_0 = {
			zh = 2.866,
			ja = 3.033
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
				arg_111_0:Play120421028(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = arg_111_1.actors_["1084ui_story"].transform
			local var_114_1 = 0

			if var_114_1 < arg_111_1.time_ and arg_111_1.time_ <= var_114_1 + arg_114_0 then
				arg_111_1.var_.moveOldPos1084ui_story = var_114_0.localPosition
			end

			local var_114_2 = 0.001

			if var_114_1 <= arg_111_1.time_ and arg_111_1.time_ < var_114_1 + var_114_2 then
				local var_114_3 = (arg_111_1.time_ - var_114_1) / var_114_2
				local var_114_4 = Vector3.New(-0.7, -0.97, -6)

				var_114_0.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1084ui_story, var_114_4, var_114_3)

				local var_114_5 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_5.x, var_114_5.y, var_114_5.z)

				local var_114_6 = var_114_0.localEulerAngles

				var_114_6.z = 0
				var_114_6.x = 0
				var_114_0.localEulerAngles = var_114_6
			end

			if arg_111_1.time_ >= var_114_1 + var_114_2 and arg_111_1.time_ < var_114_1 + var_114_2 + arg_114_0 then
				var_114_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_114_7 = manager.ui.mainCamera.transform.position - var_114_0.position

				var_114_0.forward = Vector3.New(var_114_7.x, var_114_7.y, var_114_7.z)

				local var_114_8 = var_114_0.localEulerAngles

				var_114_8.z = 0
				var_114_8.x = 0
				var_114_0.localEulerAngles = var_114_8
			end

			local var_114_9 = "1075ui_story"

			if arg_111_1.actors_[var_114_9] == nil then
				local var_114_10 = Object.Instantiate(Asset.Load("Char/" .. var_114_9), arg_111_1.stage_.transform)

				var_114_10.name = var_114_9
				var_114_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_111_1.actors_[var_114_9] = var_114_10

				local var_114_11 = var_114_10:GetComponentInChildren(typeof(CharacterEffect))

				var_114_11.enabled = true

				local var_114_12 = GameObjectTools.GetOrAddComponent(var_114_10, typeof(DynamicBoneHelper))

				if var_114_12 then
					var_114_12:EnableDynamicBone(false)
				end

				arg_111_1:ShowWeapon(var_114_11.transform, false)

				arg_111_1.var_[var_114_9 .. "Animator"] = var_114_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_111_1.var_[var_114_9 .. "Animator"].applyRootMotion = true
				arg_111_1.var_[var_114_9 .. "LipSync"] = var_114_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_114_13 = arg_111_1.actors_["1075ui_story"].transform
			local var_114_14 = 0

			if var_114_14 < arg_111_1.time_ and arg_111_1.time_ <= var_114_14 + arg_114_0 then
				arg_111_1.var_.moveOldPos1075ui_story = var_114_13.localPosition
			end

			local var_114_15 = 0.001

			if var_114_14 <= arg_111_1.time_ and arg_111_1.time_ < var_114_14 + var_114_15 then
				local var_114_16 = (arg_111_1.time_ - var_114_14) / var_114_15
				local var_114_17 = Vector3.New(0.7, -1.055, -6.16)

				var_114_13.localPosition = Vector3.Lerp(arg_111_1.var_.moveOldPos1075ui_story, var_114_17, var_114_16)

				local var_114_18 = manager.ui.mainCamera.transform.position - var_114_13.position

				var_114_13.forward = Vector3.New(var_114_18.x, var_114_18.y, var_114_18.z)

				local var_114_19 = var_114_13.localEulerAngles

				var_114_19.z = 0
				var_114_19.x = 0
				var_114_13.localEulerAngles = var_114_19
			end

			if arg_111_1.time_ >= var_114_14 + var_114_15 and arg_111_1.time_ < var_114_14 + var_114_15 + arg_114_0 then
				var_114_13.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_114_20 = manager.ui.mainCamera.transform.position - var_114_13.position

				var_114_13.forward = Vector3.New(var_114_20.x, var_114_20.y, var_114_20.z)

				local var_114_21 = var_114_13.localEulerAngles

				var_114_21.z = 0
				var_114_21.x = 0
				var_114_13.localEulerAngles = var_114_21
			end

			local var_114_22 = 0

			if var_114_22 < arg_111_1.time_ and arg_111_1.time_ <= var_114_22 + arg_114_0 then
				arg_111_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_114_23 = 0

			if var_114_23 < arg_111_1.time_ and arg_111_1.time_ <= var_114_23 + arg_114_0 then
				arg_111_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_114_24 = arg_111_1.actors_["1075ui_story"]
			local var_114_25 = 0

			if var_114_25 < arg_111_1.time_ and arg_111_1.time_ <= var_114_25 + arg_114_0 and arg_111_1.var_.characterEffect1075ui_story == nil then
				arg_111_1.var_.characterEffect1075ui_story = var_114_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_26 = 0.2

			if var_114_25 <= arg_111_1.time_ and arg_111_1.time_ < var_114_25 + var_114_26 then
				local var_114_27 = (arg_111_1.time_ - var_114_25) / var_114_26

				if arg_111_1.var_.characterEffect1075ui_story then
					arg_111_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_111_1.time_ >= var_114_25 + var_114_26 and arg_111_1.time_ < var_114_25 + var_114_26 + arg_114_0 and arg_111_1.var_.characterEffect1075ui_story then
				arg_111_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_114_28 = arg_111_1.actors_["1084ui_story"]
			local var_114_29 = 0

			if var_114_29 < arg_111_1.time_ and arg_111_1.time_ <= var_114_29 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story == nil then
				arg_111_1.var_.characterEffect1084ui_story = var_114_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_114_30 = 0.2

			if var_114_29 <= arg_111_1.time_ and arg_111_1.time_ < var_114_29 + var_114_30 then
				local var_114_31 = (arg_111_1.time_ - var_114_29) / var_114_30

				if arg_111_1.var_.characterEffect1084ui_story then
					local var_114_32 = Mathf.Lerp(0, 0.5, var_114_31)

					arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_32
				end
			end

			if arg_111_1.time_ >= var_114_29 + var_114_30 and arg_111_1.time_ < var_114_29 + var_114_30 + arg_114_0 and arg_111_1.var_.characterEffect1084ui_story then
				local var_114_33 = 0.5

				arg_111_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_111_1.var_.characterEffect1084ui_story.fillRatio = var_114_33
			end

			local var_114_34 = 0
			local var_114_35 = 0.4

			if var_114_34 < arg_111_1.time_ and arg_111_1.time_ <= var_114_34 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_36 = arg_111_1:FormatText(StoryNameCfg[381].name)

				arg_111_1.leftNameTxt_.text = var_114_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_37 = arg_111_1:GetWordFromCfg(120421027)
				local var_114_38 = arg_111_1:FormatText(var_114_37.content)

				arg_111_1.text_.text = var_114_38

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_39 = 16
				local var_114_40 = utf8.len(var_114_38)
				local var_114_41 = var_114_39 <= 0 and var_114_35 or var_114_35 * (var_114_40 / var_114_39)

				if var_114_41 > 0 and var_114_35 < var_114_41 then
					arg_111_1.talkMaxDuration = var_114_41

					if var_114_41 + var_114_34 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_41 + var_114_34
					end
				end

				arg_111_1.text_.text = var_114_38
				arg_111_1.typewritter.percent = 0

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421027", "story_v_out_120421.awb") ~= 0 then
					local var_114_42 = manager.audio:GetVoiceLength("story_v_out_120421", "120421027", "story_v_out_120421.awb") / 1000

					if var_114_42 + var_114_34 > arg_111_1.duration_ then
						arg_111_1.duration_ = var_114_42 + var_114_34
					end

					if var_114_37.prefab_name ~= "" and arg_111_1.actors_[var_114_37.prefab_name] ~= nil then
						local var_114_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_111_1.actors_[var_114_37.prefab_name].transform, "story_v_out_120421", "120421027", "story_v_out_120421.awb")

						arg_111_1:RecordAudio("120421027", var_114_43)
						arg_111_1:RecordAudio("120421027", var_114_43)
					else
						arg_111_1:AudioAction("play", "voice", "story_v_out_120421", "120421027", "story_v_out_120421.awb")
					end

					arg_111_1:RecordHistoryTalkVoice("story_v_out_120421", "120421027", "story_v_out_120421.awb")
				end

				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_44 = math.max(var_114_35, arg_111_1.talkMaxDuration)

			if var_114_34 <= arg_111_1.time_ and arg_111_1.time_ < var_114_34 + var_114_44 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_34) / var_114_44

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_34 + var_114_44 and arg_111_1.time_ < var_114_34 + var_114_44 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play120421028 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 120421028
		arg_115_1.duration_ = 11.933

		local var_115_0 = {
			zh = 7.4,
			ja = 11.933
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
				arg_115_0:Play120421029(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = 0

			if var_118_0 < arg_115_1.time_ and arg_115_1.time_ <= var_118_0 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_118_1 = arg_115_1.actors_["1075ui_story"]
			local var_118_2 = 0

			if var_118_2 < arg_115_1.time_ and arg_115_1.time_ <= var_118_2 + arg_118_0 and arg_115_1.var_.characterEffect1075ui_story == nil then
				arg_115_1.var_.characterEffect1075ui_story = var_118_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_3 = 0.2

			if var_118_2 <= arg_115_1.time_ and arg_115_1.time_ < var_118_2 + var_118_3 then
				local var_118_4 = (arg_115_1.time_ - var_118_2) / var_118_3

				if arg_115_1.var_.characterEffect1075ui_story then
					local var_118_5 = Mathf.Lerp(0, 0.5, var_118_4)

					arg_115_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_115_1.var_.characterEffect1075ui_story.fillRatio = var_118_5
				end
			end

			if arg_115_1.time_ >= var_118_2 + var_118_3 and arg_115_1.time_ < var_118_2 + var_118_3 + arg_118_0 and arg_115_1.var_.characterEffect1075ui_story then
				local var_118_6 = 0.5

				arg_115_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_115_1.var_.characterEffect1075ui_story.fillRatio = var_118_6
			end

			local var_118_7 = arg_115_1.actors_["1084ui_story"]
			local var_118_8 = 0

			if var_118_8 < arg_115_1.time_ and arg_115_1.time_ <= var_118_8 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story == nil then
				arg_115_1.var_.characterEffect1084ui_story = var_118_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_9 = 0.2

			if var_118_8 <= arg_115_1.time_ and arg_115_1.time_ < var_118_8 + var_118_9 then
				local var_118_10 = (arg_115_1.time_ - var_118_8) / var_118_9

				if arg_115_1.var_.characterEffect1084ui_story then
					arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_8 + var_118_9 and arg_115_1.time_ < var_118_8 + var_118_9 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story then
				arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_118_11 = 0
			local var_118_12 = 0.9

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_13 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_14 = arg_115_1:GetWordFromCfg(120421028)
				local var_118_15 = arg_115_1:FormatText(var_118_14.content)

				arg_115_1.text_.text = var_118_15

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_16 = 36
				local var_118_17 = utf8.len(var_118_15)
				local var_118_18 = var_118_16 <= 0 and var_118_12 or var_118_12 * (var_118_17 / var_118_16)

				if var_118_18 > 0 and var_118_12 < var_118_18 then
					arg_115_1.talkMaxDuration = var_118_18

					if var_118_18 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_18 + var_118_11
					end
				end

				arg_115_1.text_.text = var_118_15
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421028", "story_v_out_120421.awb") ~= 0 then
					local var_118_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421028", "story_v_out_120421.awb") / 1000

					if var_118_19 + var_118_11 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_19 + var_118_11
					end

					if var_118_14.prefab_name ~= "" and arg_115_1.actors_[var_118_14.prefab_name] ~= nil then
						local var_118_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_14.prefab_name].transform, "story_v_out_120421", "120421028", "story_v_out_120421.awb")

						arg_115_1:RecordAudio("120421028", var_118_20)
						arg_115_1:RecordAudio("120421028", var_118_20)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_120421", "120421028", "story_v_out_120421.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_120421", "120421028", "story_v_out_120421.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_21 = math.max(var_118_12, arg_115_1.talkMaxDuration)

			if var_118_11 <= arg_115_1.time_ and arg_115_1.time_ < var_118_11 + var_118_21 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_11) / var_118_21

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_11 + var_118_21 and arg_115_1.time_ < var_118_11 + var_118_21 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play120421029 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 120421029
		arg_119_1.duration_ = 9.266

		local var_119_0 = {
			zh = 4.3,
			ja = 9.266
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
				arg_119_0:Play120421030(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1075ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1075ui_story == nil then
				arg_119_1.var_.characterEffect1075ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1075ui_story then
					arg_119_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1075ui_story then
				arg_119_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_122_4 = arg_119_1.actors_["1084ui_story"]
			local var_122_5 = 0

			if var_122_5 < arg_119_1.time_ and arg_119_1.time_ <= var_122_5 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story == nil then
				arg_119_1.var_.characterEffect1084ui_story = var_122_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_6 = 0.2

			if var_122_5 <= arg_119_1.time_ and arg_119_1.time_ < var_122_5 + var_122_6 then
				local var_122_7 = (arg_119_1.time_ - var_122_5) / var_122_6

				if arg_119_1.var_.characterEffect1084ui_story then
					local var_122_8 = Mathf.Lerp(0, 0.5, var_122_7)

					arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_8
				end
			end

			if arg_119_1.time_ >= var_122_5 + var_122_6 and arg_119_1.time_ < var_122_5 + var_122_6 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story then
				local var_122_9 = 0.5

				arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_9
			end

			local var_122_10 = 0
			local var_122_11 = 0.45

			if var_122_10 < arg_119_1.time_ and arg_119_1.time_ <= var_122_10 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_12 = arg_119_1:FormatText(StoryNameCfg[381].name)

				arg_119_1.leftNameTxt_.text = var_122_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, false)
				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_13 = arg_119_1:GetWordFromCfg(120421029)
				local var_122_14 = arg_119_1:FormatText(var_122_13.content)

				arg_119_1.text_.text = var_122_14

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_15 = 18
				local var_122_16 = utf8.len(var_122_14)
				local var_122_17 = var_122_15 <= 0 and var_122_11 or var_122_11 * (var_122_16 / var_122_15)

				if var_122_17 > 0 and var_122_11 < var_122_17 then
					arg_119_1.talkMaxDuration = var_122_17

					if var_122_17 + var_122_10 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_17 + var_122_10
					end
				end

				arg_119_1.text_.text = var_122_14
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421029", "story_v_out_120421.awb") ~= 0 then
					local var_122_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421029", "story_v_out_120421.awb") / 1000

					if var_122_18 + var_122_10 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_18 + var_122_10
					end

					if var_122_13.prefab_name ~= "" and arg_119_1.actors_[var_122_13.prefab_name] ~= nil then
						local var_122_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_13.prefab_name].transform, "story_v_out_120421", "120421029", "story_v_out_120421.awb")

						arg_119_1:RecordAudio("120421029", var_122_19)
						arg_119_1:RecordAudio("120421029", var_122_19)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_120421", "120421029", "story_v_out_120421.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_120421", "120421029", "story_v_out_120421.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_20 = math.max(var_122_11, arg_119_1.talkMaxDuration)

			if var_122_10 <= arg_119_1.time_ and arg_119_1.time_ < var_122_10 + var_122_20 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_10) / var_122_20

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_10 + var_122_20 and arg_119_1.time_ < var_122_10 + var_122_20 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play120421030 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 120421030
		arg_123_1.duration_ = 7.266

		local var_123_0 = {
			zh = 4.2,
			ja = 7.266
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
				arg_123_0:Play120421031(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = arg_123_1.actors_["1075ui_story"]
			local var_126_1 = 0

			if var_126_1 < arg_123_1.time_ and arg_123_1.time_ <= var_126_1 + arg_126_0 and arg_123_1.var_.characterEffect1075ui_story == nil then
				arg_123_1.var_.characterEffect1075ui_story = var_126_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_2 = 0.2

			if var_126_1 <= arg_123_1.time_ and arg_123_1.time_ < var_126_1 + var_126_2 then
				local var_126_3 = (arg_123_1.time_ - var_126_1) / var_126_2

				if arg_123_1.var_.characterEffect1075ui_story then
					local var_126_4 = Mathf.Lerp(0, 0.5, var_126_3)

					arg_123_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_123_1.var_.characterEffect1075ui_story.fillRatio = var_126_4
				end
			end

			if arg_123_1.time_ >= var_126_1 + var_126_2 and arg_123_1.time_ < var_126_1 + var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1075ui_story then
				local var_126_5 = 0.5

				arg_123_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_123_1.var_.characterEffect1075ui_story.fillRatio = var_126_5
			end

			local var_126_6 = arg_123_1.actors_["1084ui_story"]
			local var_126_7 = 0

			if var_126_7 < arg_123_1.time_ and arg_123_1.time_ <= var_126_7 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story == nil then
				arg_123_1.var_.characterEffect1084ui_story = var_126_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_8 = 0.2

			if var_126_7 <= arg_123_1.time_ and arg_123_1.time_ < var_126_7 + var_126_8 then
				local var_126_9 = (arg_123_1.time_ - var_126_7) / var_126_8

				if arg_123_1.var_.characterEffect1084ui_story then
					arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_7 + var_126_8 and arg_123_1.time_ < var_126_7 + var_126_8 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story then
				arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_126_10 = 0

			if var_126_10 < arg_123_1.time_ and arg_123_1.time_ <= var_126_10 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_126_11 = 0

			if var_126_11 < arg_123_1.time_ and arg_123_1.time_ <= var_126_11 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_126_12 = 0
			local var_126_13 = 0.45

			if var_126_12 < arg_123_1.time_ and arg_123_1.time_ <= var_126_12 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_14 = arg_123_1:FormatText(StoryNameCfg[6].name)

				arg_123_1.leftNameTxt_.text = var_126_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_15 = arg_123_1:GetWordFromCfg(120421030)
				local var_126_16 = arg_123_1:FormatText(var_126_15.content)

				arg_123_1.text_.text = var_126_16

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_17 = 18
				local var_126_18 = utf8.len(var_126_16)
				local var_126_19 = var_126_17 <= 0 and var_126_13 or var_126_13 * (var_126_18 / var_126_17)

				if var_126_19 > 0 and var_126_13 < var_126_19 then
					arg_123_1.talkMaxDuration = var_126_19

					if var_126_19 + var_126_12 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_19 + var_126_12
					end
				end

				arg_123_1.text_.text = var_126_16
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421030", "story_v_out_120421.awb") ~= 0 then
					local var_126_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421030", "story_v_out_120421.awb") / 1000

					if var_126_20 + var_126_12 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_20 + var_126_12
					end

					if var_126_15.prefab_name ~= "" and arg_123_1.actors_[var_126_15.prefab_name] ~= nil then
						local var_126_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_15.prefab_name].transform, "story_v_out_120421", "120421030", "story_v_out_120421.awb")

						arg_123_1:RecordAudio("120421030", var_126_21)
						arg_123_1:RecordAudio("120421030", var_126_21)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_120421", "120421030", "story_v_out_120421.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_120421", "120421030", "story_v_out_120421.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_22 = math.max(var_126_13, arg_123_1.talkMaxDuration)

			if var_126_12 <= arg_123_1.time_ and arg_123_1.time_ < var_126_12 + var_126_22 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_12) / var_126_22

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_12 + var_126_22 and arg_123_1.time_ < var_126_12 + var_126_22 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play120421031 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 120421031
		arg_127_1.duration_ = 6.8

		local var_127_0 = {
			zh = 5.933,
			ja = 6.8
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
				arg_127_0:Play120421032(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = 0

			if var_130_0 < arg_127_1.time_ and arg_127_1.time_ <= var_130_0 + arg_130_0 then
				arg_127_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_130_2 = 0
			local var_130_3 = 0.6

			if var_130_2 < arg_127_1.time_ and arg_127_1.time_ <= var_130_2 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_4 = arg_127_1:FormatText(StoryNameCfg[6].name)

				arg_127_1.leftNameTxt_.text = var_130_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, false)
				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_5 = arg_127_1:GetWordFromCfg(120421031)
				local var_130_6 = arg_127_1:FormatText(var_130_5.content)

				arg_127_1.text_.text = var_130_6

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_7 = 24
				local var_130_8 = utf8.len(var_130_6)
				local var_130_9 = var_130_7 <= 0 and var_130_3 or var_130_3 * (var_130_8 / var_130_7)

				if var_130_9 > 0 and var_130_3 < var_130_9 then
					arg_127_1.talkMaxDuration = var_130_9

					if var_130_9 + var_130_2 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_9 + var_130_2
					end
				end

				arg_127_1.text_.text = var_130_6
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421031", "story_v_out_120421.awb") ~= 0 then
					local var_130_10 = manager.audio:GetVoiceLength("story_v_out_120421", "120421031", "story_v_out_120421.awb") / 1000

					if var_130_10 + var_130_2 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_10 + var_130_2
					end

					if var_130_5.prefab_name ~= "" and arg_127_1.actors_[var_130_5.prefab_name] ~= nil then
						local var_130_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_5.prefab_name].transform, "story_v_out_120421", "120421031", "story_v_out_120421.awb")

						arg_127_1:RecordAudio("120421031", var_130_11)
						arg_127_1:RecordAudio("120421031", var_130_11)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_120421", "120421031", "story_v_out_120421.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_120421", "120421031", "story_v_out_120421.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_12 = math.max(var_130_3, arg_127_1.talkMaxDuration)

			if var_130_2 <= arg_127_1.time_ and arg_127_1.time_ < var_130_2 + var_130_12 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_2) / var_130_12

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_2 + var_130_12 and arg_127_1.time_ < var_130_2 + var_130_12 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play120421032 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 120421032
		arg_131_1.duration_ = 8.766

		local var_131_0 = {
			zh = 5.333,
			ja = 8.766
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
				arg_131_0:Play120421033(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0

			if var_134_0 < arg_131_1.time_ and arg_131_1.time_ <= var_134_0 + arg_134_0 then
				arg_131_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_134_1 = 0
			local var_134_2 = 0.7

			if var_134_1 < arg_131_1.time_ and arg_131_1.time_ <= var_134_1 + arg_134_0 then
				arg_131_1.talkMaxDuration = 0
				arg_131_1.dialogCg_.alpha = 1

				arg_131_1.dialog_:SetActive(true)
				SetActive(arg_131_1.leftNameGo_, true)

				local var_134_3 = arg_131_1:FormatText(StoryNameCfg[6].name)

				arg_131_1.leftNameTxt_.text = var_134_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_131_1.leftNameTxt_.transform)

				arg_131_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_131_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_131_1:RecordName(arg_131_1.leftNameTxt_.text)
				SetActive(arg_131_1.iconTrs_.gameObject, false)
				arg_131_1.callingController_:SetSelectedState("normal")

				local var_134_4 = arg_131_1:GetWordFromCfg(120421032)
				local var_134_5 = arg_131_1:FormatText(var_134_4.content)

				arg_131_1.text_.text = var_134_5

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_6 = 28
				local var_134_7 = utf8.len(var_134_5)
				local var_134_8 = var_134_6 <= 0 and var_134_2 or var_134_2 * (var_134_7 / var_134_6)

				if var_134_8 > 0 and var_134_2 < var_134_8 then
					arg_131_1.talkMaxDuration = var_134_8

					if var_134_8 + var_134_1 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_8 + var_134_1
					end
				end

				arg_131_1.text_.text = var_134_5
				arg_131_1.typewritter.percent = 0

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421032", "story_v_out_120421.awb") ~= 0 then
					local var_134_9 = manager.audio:GetVoiceLength("story_v_out_120421", "120421032", "story_v_out_120421.awb") / 1000

					if var_134_9 + var_134_1 > arg_131_1.duration_ then
						arg_131_1.duration_ = var_134_9 + var_134_1
					end

					if var_134_4.prefab_name ~= "" and arg_131_1.actors_[var_134_4.prefab_name] ~= nil then
						local var_134_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_131_1.actors_[var_134_4.prefab_name].transform, "story_v_out_120421", "120421032", "story_v_out_120421.awb")

						arg_131_1:RecordAudio("120421032", var_134_10)
						arg_131_1:RecordAudio("120421032", var_134_10)
					else
						arg_131_1:AudioAction("play", "voice", "story_v_out_120421", "120421032", "story_v_out_120421.awb")
					end

					arg_131_1:RecordHistoryTalkVoice("story_v_out_120421", "120421032", "story_v_out_120421.awb")
				end

				arg_131_1:RecordContent(arg_131_1.text_.text)
			end

			local var_134_11 = math.max(var_134_2, arg_131_1.talkMaxDuration)

			if var_134_1 <= arg_131_1.time_ and arg_131_1.time_ < var_134_1 + var_134_11 then
				arg_131_1.typewritter.percent = (arg_131_1.time_ - var_134_1) / var_134_11

				arg_131_1.typewritter:SetDirty()
			end

			if arg_131_1.time_ >= var_134_1 + var_134_11 and arg_131_1.time_ < var_134_1 + var_134_11 + arg_134_0 then
				arg_131_1.typewritter.percent = 1

				arg_131_1.typewritter:SetDirty()
				arg_131_1:ShowNextGo(true)
			end
		end
	end,
	Play120421033 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 120421033
		arg_135_1.duration_ = 9.7

		local var_135_0 = {
			zh = 6.633,
			ja = 9.7
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
				arg_135_0:Play120421034(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = arg_135_1.actors_["1084ui_story"]
			local var_138_1 = 0

			if var_138_1 < arg_135_1.time_ and arg_135_1.time_ <= var_138_1 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story == nil then
				arg_135_1.var_.characterEffect1084ui_story = var_138_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_2 = 0.2

			if var_138_1 <= arg_135_1.time_ and arg_135_1.time_ < var_138_1 + var_138_2 then
				local var_138_3 = (arg_135_1.time_ - var_138_1) / var_138_2

				if arg_135_1.var_.characterEffect1084ui_story then
					local var_138_4 = Mathf.Lerp(0, 0.5, var_138_3)

					arg_135_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_135_1.var_.characterEffect1084ui_story.fillRatio = var_138_4
				end
			end

			if arg_135_1.time_ >= var_138_1 + var_138_2 and arg_135_1.time_ < var_138_1 + var_138_2 + arg_138_0 and arg_135_1.var_.characterEffect1084ui_story then
				local var_138_5 = 0.5

				arg_135_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_135_1.var_.characterEffect1084ui_story.fillRatio = var_138_5
			end

			local var_138_6 = 0

			if var_138_6 < arg_135_1.time_ and arg_135_1.time_ <= var_138_6 + arg_138_0 then
				arg_135_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_138_7 = arg_135_1.actors_["1075ui_story"]
			local var_138_8 = 0

			if var_138_8 < arg_135_1.time_ and arg_135_1.time_ <= var_138_8 + arg_138_0 and arg_135_1.var_.characterEffect1075ui_story == nil then
				arg_135_1.var_.characterEffect1075ui_story = var_138_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_9 = 0.2

			if var_138_8 <= arg_135_1.time_ and arg_135_1.time_ < var_138_8 + var_138_9 then
				local var_138_10 = (arg_135_1.time_ - var_138_8) / var_138_9

				if arg_135_1.var_.characterEffect1075ui_story then
					arg_135_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_8 + var_138_9 and arg_135_1.time_ < var_138_8 + var_138_9 + arg_138_0 and arg_135_1.var_.characterEffect1075ui_story then
				arg_135_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_138_11 = 0

			if var_138_11 < arg_135_1.time_ and arg_135_1.time_ <= var_138_11 + arg_138_0 then
				arg_135_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_138_12 = 0
			local var_138_13 = 0.7

			if var_138_12 < arg_135_1.time_ and arg_135_1.time_ <= var_138_12 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_14 = arg_135_1:FormatText(StoryNameCfg[381].name)

				arg_135_1.leftNameTxt_.text = var_138_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_15 = arg_135_1:GetWordFromCfg(120421033)
				local var_138_16 = arg_135_1:FormatText(var_138_15.content)

				arg_135_1.text_.text = var_138_16

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_17 = 28
				local var_138_18 = utf8.len(var_138_16)
				local var_138_19 = var_138_17 <= 0 and var_138_13 or var_138_13 * (var_138_18 / var_138_17)

				if var_138_19 > 0 and var_138_13 < var_138_19 then
					arg_135_1.talkMaxDuration = var_138_19

					if var_138_19 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_19 + var_138_12
					end
				end

				arg_135_1.text_.text = var_138_16
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421033", "story_v_out_120421.awb") ~= 0 then
					local var_138_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421033", "story_v_out_120421.awb") / 1000

					if var_138_20 + var_138_12 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_20 + var_138_12
					end

					if var_138_15.prefab_name ~= "" and arg_135_1.actors_[var_138_15.prefab_name] ~= nil then
						local var_138_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_15.prefab_name].transform, "story_v_out_120421", "120421033", "story_v_out_120421.awb")

						arg_135_1:RecordAudio("120421033", var_138_21)
						arg_135_1:RecordAudio("120421033", var_138_21)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_120421", "120421033", "story_v_out_120421.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_120421", "120421033", "story_v_out_120421.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_22 = math.max(var_138_13, arg_135_1.talkMaxDuration)

			if var_138_12 <= arg_135_1.time_ and arg_135_1.time_ < var_138_12 + var_138_22 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_12) / var_138_22

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_12 + var_138_22 and arg_135_1.time_ < var_138_12 + var_138_22 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play120421034 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 120421034
		arg_139_1.duration_ = 8.133

		local var_139_0 = {
			zh = 8.133,
			ja = 7.5
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
				arg_139_0:Play120421035(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_142_1 = arg_139_1.actors_["1075ui_story"]
			local var_142_2 = 0

			if var_142_2 < arg_139_1.time_ and arg_139_1.time_ <= var_142_2 + arg_142_0 and arg_139_1.var_.characterEffect1075ui_story == nil then
				arg_139_1.var_.characterEffect1075ui_story = var_142_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_3 = 0.2

			if var_142_2 <= arg_139_1.time_ and arg_139_1.time_ < var_142_2 + var_142_3 then
				local var_142_4 = (arg_139_1.time_ - var_142_2) / var_142_3

				if arg_139_1.var_.characterEffect1075ui_story then
					local var_142_5 = Mathf.Lerp(0, 0.5, var_142_4)

					arg_139_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_139_1.var_.characterEffect1075ui_story.fillRatio = var_142_5
				end
			end

			if arg_139_1.time_ >= var_142_2 + var_142_3 and arg_139_1.time_ < var_142_2 + var_142_3 + arg_142_0 and arg_139_1.var_.characterEffect1075ui_story then
				local var_142_6 = 0.5

				arg_139_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_139_1.var_.characterEffect1075ui_story.fillRatio = var_142_6
			end

			local var_142_7 = arg_139_1.actors_["1084ui_story"]
			local var_142_8 = 0

			if var_142_8 < arg_139_1.time_ and arg_139_1.time_ <= var_142_8 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story == nil then
				arg_139_1.var_.characterEffect1084ui_story = var_142_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_142_9 = 0.2

			if var_142_8 <= arg_139_1.time_ and arg_139_1.time_ < var_142_8 + var_142_9 then
				local var_142_10 = (arg_139_1.time_ - var_142_8) / var_142_9

				if arg_139_1.var_.characterEffect1084ui_story then
					arg_139_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_139_1.time_ >= var_142_8 + var_142_9 and arg_139_1.time_ < var_142_8 + var_142_9 + arg_142_0 and arg_139_1.var_.characterEffect1084ui_story then
				arg_139_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_142_11 = 0
			local var_142_12 = 0.8

			if var_142_11 < arg_139_1.time_ and arg_139_1.time_ <= var_142_11 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_13 = arg_139_1:FormatText(StoryNameCfg[6].name)

				arg_139_1.leftNameTxt_.text = var_142_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_14 = arg_139_1:GetWordFromCfg(120421034)
				local var_142_15 = arg_139_1:FormatText(var_142_14.content)

				arg_139_1.text_.text = var_142_15

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_16 = 32
				local var_142_17 = utf8.len(var_142_15)
				local var_142_18 = var_142_16 <= 0 and var_142_12 or var_142_12 * (var_142_17 / var_142_16)

				if var_142_18 > 0 and var_142_12 < var_142_18 then
					arg_139_1.talkMaxDuration = var_142_18

					if var_142_18 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_18 + var_142_11
					end
				end

				arg_139_1.text_.text = var_142_15
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421034", "story_v_out_120421.awb") ~= 0 then
					local var_142_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421034", "story_v_out_120421.awb") / 1000

					if var_142_19 + var_142_11 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_19 + var_142_11
					end

					if var_142_14.prefab_name ~= "" and arg_139_1.actors_[var_142_14.prefab_name] ~= nil then
						local var_142_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_14.prefab_name].transform, "story_v_out_120421", "120421034", "story_v_out_120421.awb")

						arg_139_1:RecordAudio("120421034", var_142_20)
						arg_139_1:RecordAudio("120421034", var_142_20)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_120421", "120421034", "story_v_out_120421.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_120421", "120421034", "story_v_out_120421.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_21 = math.max(var_142_12, arg_139_1.talkMaxDuration)

			if var_142_11 <= arg_139_1.time_ and arg_139_1.time_ < var_142_11 + var_142_21 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_11) / var_142_21

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_11 + var_142_21 and arg_139_1.time_ < var_142_11 + var_142_21 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play120421035 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 120421035
		arg_143_1.duration_ = 15.8

		local var_143_0 = {
			zh = 9.5,
			ja = 15.8
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
				arg_143_0:Play120421036(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = 0
			local var_146_1 = 0.95

			if var_146_0 < arg_143_1.time_ and arg_143_1.time_ <= var_146_0 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_2 = arg_143_1:FormatText(StoryNameCfg[6].name)

				arg_143_1.leftNameTxt_.text = var_146_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_3 = arg_143_1:GetWordFromCfg(120421035)
				local var_146_4 = arg_143_1:FormatText(var_146_3.content)

				arg_143_1.text_.text = var_146_4

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_5 = 38
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421035", "story_v_out_120421.awb") ~= 0 then
					local var_146_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421035", "story_v_out_120421.awb") / 1000

					if var_146_8 + var_146_0 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_8 + var_146_0
					end

					if var_146_3.prefab_name ~= "" and arg_143_1.actors_[var_146_3.prefab_name] ~= nil then
						local var_146_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_3.prefab_name].transform, "story_v_out_120421", "120421035", "story_v_out_120421.awb")

						arg_143_1:RecordAudio("120421035", var_146_9)
						arg_143_1:RecordAudio("120421035", var_146_9)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_120421", "120421035", "story_v_out_120421.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_120421", "120421035", "story_v_out_120421.awb")
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
	Play120421036 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 120421036
		arg_147_1.duration_ = 10.3

		local var_147_0 = {
			zh = 6.133,
			ja = 10.3
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
				arg_147_0:Play120421037(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_2")
			end

			local var_150_1 = arg_147_1.actors_["1075ui_story"]
			local var_150_2 = 0

			if var_150_2 < arg_147_1.time_ and arg_147_1.time_ <= var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1075ui_story == nil then
				arg_147_1.var_.characterEffect1075ui_story = var_150_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_3 = 0.2

			if var_150_2 <= arg_147_1.time_ and arg_147_1.time_ < var_150_2 + var_150_3 then
				local var_150_4 = (arg_147_1.time_ - var_150_2) / var_150_3

				if arg_147_1.var_.characterEffect1075ui_story then
					arg_147_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_2 + var_150_3 and arg_147_1.time_ < var_150_2 + var_150_3 + arg_150_0 and arg_147_1.var_.characterEffect1075ui_story then
				arg_147_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_150_5 = arg_147_1.actors_["1084ui_story"]
			local var_150_6 = 0

			if var_150_6 < arg_147_1.time_ and arg_147_1.time_ <= var_150_6 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story == nil then
				arg_147_1.var_.characterEffect1084ui_story = var_150_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_7 = 0.2

			if var_150_6 <= arg_147_1.time_ and arg_147_1.time_ < var_150_6 + var_150_7 then
				local var_150_8 = (arg_147_1.time_ - var_150_6) / var_150_7

				if arg_147_1.var_.characterEffect1084ui_story then
					local var_150_9 = Mathf.Lerp(0, 0.5, var_150_8)

					arg_147_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_147_1.var_.characterEffect1084ui_story.fillRatio = var_150_9
				end
			end

			if arg_147_1.time_ >= var_150_6 + var_150_7 and arg_147_1.time_ < var_150_6 + var_150_7 + arg_150_0 and arg_147_1.var_.characterEffect1084ui_story then
				local var_150_10 = 0.5

				arg_147_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_147_1.var_.characterEffect1084ui_story.fillRatio = var_150_10
			end

			local var_150_11 = 0
			local var_150_12 = 0.825

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_13 = arg_147_1:FormatText(StoryNameCfg[381].name)

				arg_147_1.leftNameTxt_.text = var_150_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_14 = arg_147_1:GetWordFromCfg(120421036)
				local var_150_15 = arg_147_1:FormatText(var_150_14.content)

				arg_147_1.text_.text = var_150_15

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_16 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421036", "story_v_out_120421.awb") ~= 0 then
					local var_150_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421036", "story_v_out_120421.awb") / 1000

					if var_150_19 + var_150_11 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_11
					end

					if var_150_14.prefab_name ~= "" and arg_147_1.actors_[var_150_14.prefab_name] ~= nil then
						local var_150_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_14.prefab_name].transform, "story_v_out_120421", "120421036", "story_v_out_120421.awb")

						arg_147_1:RecordAudio("120421036", var_150_20)
						arg_147_1:RecordAudio("120421036", var_150_20)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_120421", "120421036", "story_v_out_120421.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_120421", "120421036", "story_v_out_120421.awb")
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
	Play120421037 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 120421037
		arg_151_1.duration_ = 4.766

		local var_151_0 = {
			zh = 3.233,
			ja = 4.766
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
				arg_151_0:Play120421038(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = 0
			local var_154_1 = 0.325

			if var_154_0 < arg_151_1.time_ and arg_151_1.time_ <= var_154_0 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, true)

				local var_154_2 = arg_151_1:FormatText(StoryNameCfg[381].name)

				arg_151_1.leftNameTxt_.text = var_154_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_151_1.leftNameTxt_.transform)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1.leftNameTxt_.text)
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_3 = arg_151_1:GetWordFromCfg(120421037)
				local var_154_4 = arg_151_1:FormatText(var_154_3.content)

				arg_151_1.text_.text = var_154_4

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_5 = 13
				local var_154_6 = utf8.len(var_154_4)
				local var_154_7 = var_154_5 <= 0 and var_154_1 or var_154_1 * (var_154_6 / var_154_5)

				if var_154_7 > 0 and var_154_1 < var_154_7 then
					arg_151_1.talkMaxDuration = var_154_7

					if var_154_7 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_7 + var_154_0
					end
				end

				arg_151_1.text_.text = var_154_4
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421037", "story_v_out_120421.awb") ~= 0 then
					local var_154_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421037", "story_v_out_120421.awb") / 1000

					if var_154_8 + var_154_0 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_8 + var_154_0
					end

					if var_154_3.prefab_name ~= "" and arg_151_1.actors_[var_154_3.prefab_name] ~= nil then
						local var_154_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_151_1.actors_[var_154_3.prefab_name].transform, "story_v_out_120421", "120421037", "story_v_out_120421.awb")

						arg_151_1:RecordAudio("120421037", var_154_9)
						arg_151_1:RecordAudio("120421037", var_154_9)
					else
						arg_151_1:AudioAction("play", "voice", "story_v_out_120421", "120421037", "story_v_out_120421.awb")
					end

					arg_151_1:RecordHistoryTalkVoice("story_v_out_120421", "120421037", "story_v_out_120421.awb")
				end

				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_10 = math.max(var_154_1, arg_151_1.talkMaxDuration)

			if var_154_0 <= arg_151_1.time_ and arg_151_1.time_ < var_154_0 + var_154_10 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_0) / var_154_10

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_0 + var_154_10 and arg_151_1.time_ < var_154_0 + var_154_10 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play120421038 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 120421038
		arg_155_1.duration_ = 12.7

		local var_155_0 = {
			zh = 7.066,
			ja = 12.7
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
				arg_155_0:Play120421039(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1075ui_story"]
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 and arg_155_1.var_.characterEffect1075ui_story == nil then
				arg_155_1.var_.characterEffect1075ui_story = var_158_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_2 = 0.2

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2

				if arg_155_1.var_.characterEffect1075ui_story then
					local var_158_4 = Mathf.Lerp(0, 0.5, var_158_3)

					arg_155_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_155_1.var_.characterEffect1075ui_story.fillRatio = var_158_4
				end
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 and arg_155_1.var_.characterEffect1075ui_story then
				local var_158_5 = 0.5

				arg_155_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_155_1.var_.characterEffect1075ui_story.fillRatio = var_158_5
			end

			local var_158_6 = arg_155_1.actors_["1084ui_story"]
			local var_158_7 = 0

			if var_158_7 < arg_155_1.time_ and arg_155_1.time_ <= var_158_7 + arg_158_0 and arg_155_1.var_.characterEffect1084ui_story == nil then
				arg_155_1.var_.characterEffect1084ui_story = var_158_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_8 = 0.2

			if var_158_7 <= arg_155_1.time_ and arg_155_1.time_ < var_158_7 + var_158_8 then
				local var_158_9 = (arg_155_1.time_ - var_158_7) / var_158_8

				if arg_155_1.var_.characterEffect1084ui_story then
					arg_155_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_7 + var_158_8 and arg_155_1.time_ < var_158_7 + var_158_8 + arg_158_0 and arg_155_1.var_.characterEffect1084ui_story then
				arg_155_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_158_10 = 0
			local var_158_11 = 0.875

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_12 = arg_155_1:FormatText(StoryNameCfg[6].name)

				arg_155_1.leftNameTxt_.text = var_158_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_13 = arg_155_1:GetWordFromCfg(120421038)
				local var_158_14 = arg_155_1:FormatText(var_158_13.content)

				arg_155_1.text_.text = var_158_14

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_15 = 35
				local var_158_16 = utf8.len(var_158_14)
				local var_158_17 = var_158_15 <= 0 and var_158_11 or var_158_11 * (var_158_16 / var_158_15)

				if var_158_17 > 0 and var_158_11 < var_158_17 then
					arg_155_1.talkMaxDuration = var_158_17

					if var_158_17 + var_158_10 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_17 + var_158_10
					end
				end

				arg_155_1.text_.text = var_158_14
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421038", "story_v_out_120421.awb") ~= 0 then
					local var_158_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421038", "story_v_out_120421.awb") / 1000

					if var_158_18 + var_158_10 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_18 + var_158_10
					end

					if var_158_13.prefab_name ~= "" and arg_155_1.actors_[var_158_13.prefab_name] ~= nil then
						local var_158_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_13.prefab_name].transform, "story_v_out_120421", "120421038", "story_v_out_120421.awb")

						arg_155_1:RecordAudio("120421038", var_158_19)
						arg_155_1:RecordAudio("120421038", var_158_19)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_120421", "120421038", "story_v_out_120421.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_120421", "120421038", "story_v_out_120421.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_20 = math.max(var_158_11, arg_155_1.talkMaxDuration)

			if var_158_10 <= arg_155_1.time_ and arg_155_1.time_ < var_158_10 + var_158_20 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_10) / var_158_20

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_10 + var_158_20 and arg_155_1.time_ < var_158_10 + var_158_20 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play120421039 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 120421039
		arg_159_1.duration_ = 5.466

		local var_159_0 = {
			zh = 5.466,
			ja = 3.433
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
				arg_159_0:Play120421040(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = 0

			if var_162_0 < arg_159_1.time_ and arg_159_1.time_ <= var_162_0 + arg_162_0 then
				arg_159_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_1")
			end

			local var_162_1 = arg_159_1.actors_["1075ui_story"]
			local var_162_2 = 0

			if var_162_2 < arg_159_1.time_ and arg_159_1.time_ <= var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1075ui_story == nil then
				arg_159_1.var_.characterEffect1075ui_story = var_162_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_3 = 0.2

			if var_162_2 <= arg_159_1.time_ and arg_159_1.time_ < var_162_2 + var_162_3 then
				local var_162_4 = (arg_159_1.time_ - var_162_2) / var_162_3

				if arg_159_1.var_.characterEffect1075ui_story then
					arg_159_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_2 + var_162_3 and arg_159_1.time_ < var_162_2 + var_162_3 + arg_162_0 and arg_159_1.var_.characterEffect1075ui_story then
				arg_159_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_162_5 = arg_159_1.actors_["1084ui_story"]
			local var_162_6 = 0

			if var_162_6 < arg_159_1.time_ and arg_159_1.time_ <= var_162_6 + arg_162_0 and arg_159_1.var_.characterEffect1084ui_story == nil then
				arg_159_1.var_.characterEffect1084ui_story = var_162_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_7 = 0.2

			if var_162_6 <= arg_159_1.time_ and arg_159_1.time_ < var_162_6 + var_162_7 then
				local var_162_8 = (arg_159_1.time_ - var_162_6) / var_162_7

				if arg_159_1.var_.characterEffect1084ui_story then
					local var_162_9 = Mathf.Lerp(0, 0.5, var_162_8)

					arg_159_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1084ui_story.fillRatio = var_162_9
				end
			end

			if arg_159_1.time_ >= var_162_6 + var_162_7 and arg_159_1.time_ < var_162_6 + var_162_7 + arg_162_0 and arg_159_1.var_.characterEffect1084ui_story then
				local var_162_10 = 0.5

				arg_159_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1084ui_story.fillRatio = var_162_10
			end

			local var_162_11 = 0

			if var_162_11 < arg_159_1.time_ and arg_159_1.time_ <= var_162_11 + arg_162_0 then
				arg_159_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_162_12 = 0
			local var_162_13 = 0.75

			if var_162_12 < arg_159_1.time_ and arg_159_1.time_ <= var_162_12 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_14 = arg_159_1:FormatText(StoryNameCfg[381].name)

				arg_159_1.leftNameTxt_.text = var_162_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_15 = arg_159_1:GetWordFromCfg(120421039)
				local var_162_16 = arg_159_1:FormatText(var_162_15.content)

				arg_159_1.text_.text = var_162_16

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_17 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421039", "story_v_out_120421.awb") ~= 0 then
					local var_162_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421039", "story_v_out_120421.awb") / 1000

					if var_162_20 + var_162_12 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_20 + var_162_12
					end

					if var_162_15.prefab_name ~= "" and arg_159_1.actors_[var_162_15.prefab_name] ~= nil then
						local var_162_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_15.prefab_name].transform, "story_v_out_120421", "120421039", "story_v_out_120421.awb")

						arg_159_1:RecordAudio("120421039", var_162_21)
						arg_159_1:RecordAudio("120421039", var_162_21)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_120421", "120421039", "story_v_out_120421.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_120421", "120421039", "story_v_out_120421.awb")
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
	Play120421040 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 120421040
		arg_163_1.duration_ = 7

		local var_163_0 = {
			zh = 4.2,
			ja = 7
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
				arg_163_0:Play120421041(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1075ui_story"]
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 and arg_163_1.var_.characterEffect1075ui_story == nil then
				arg_163_1.var_.characterEffect1075ui_story = var_166_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_2 = 0.2

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2

				if arg_163_1.var_.characterEffect1075ui_story then
					local var_166_4 = Mathf.Lerp(0, 0.5, var_166_3)

					arg_163_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_163_1.var_.characterEffect1075ui_story.fillRatio = var_166_4
				end
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 and arg_163_1.var_.characterEffect1075ui_story then
				local var_166_5 = 0.5

				arg_163_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_163_1.var_.characterEffect1075ui_story.fillRatio = var_166_5
			end

			local var_166_6 = arg_163_1.actors_["1084ui_story"]
			local var_166_7 = 0

			if var_166_7 < arg_163_1.time_ and arg_163_1.time_ <= var_166_7 + arg_166_0 and arg_163_1.var_.characterEffect1084ui_story == nil then
				arg_163_1.var_.characterEffect1084ui_story = var_166_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_8 = 0.2

			if var_166_7 <= arg_163_1.time_ and arg_163_1.time_ < var_166_7 + var_166_8 then
				local var_166_9 = (arg_163_1.time_ - var_166_7) / var_166_8

				if arg_163_1.var_.characterEffect1084ui_story then
					arg_163_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_7 + var_166_8 and arg_163_1.time_ < var_166_7 + var_166_8 + arg_166_0 and arg_163_1.var_.characterEffect1084ui_story then
				arg_163_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_166_11 = 0

			if var_166_11 < arg_163_1.time_ and arg_163_1.time_ <= var_166_11 + arg_166_0 then
				arg_163_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_166_12 = 0
			local var_166_13 = 0.55

			if var_166_12 < arg_163_1.time_ and arg_163_1.time_ <= var_166_12 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_14 = arg_163_1:FormatText(StoryNameCfg[6].name)

				arg_163_1.leftNameTxt_.text = var_166_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_15 = arg_163_1:GetWordFromCfg(120421040)
				local var_166_16 = arg_163_1:FormatText(var_166_15.content)

				arg_163_1.text_.text = var_166_16

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_17 = 22
				local var_166_18 = utf8.len(var_166_16)
				local var_166_19 = var_166_17 <= 0 and var_166_13 or var_166_13 * (var_166_18 / var_166_17)

				if var_166_19 > 0 and var_166_13 < var_166_19 then
					arg_163_1.talkMaxDuration = var_166_19

					if var_166_19 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_19 + var_166_12
					end
				end

				arg_163_1.text_.text = var_166_16
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421040", "story_v_out_120421.awb") ~= 0 then
					local var_166_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421040", "story_v_out_120421.awb") / 1000

					if var_166_20 + var_166_12 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_20 + var_166_12
					end

					if var_166_15.prefab_name ~= "" and arg_163_1.actors_[var_166_15.prefab_name] ~= nil then
						local var_166_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_15.prefab_name].transform, "story_v_out_120421", "120421040", "story_v_out_120421.awb")

						arg_163_1:RecordAudio("120421040", var_166_21)
						arg_163_1:RecordAudio("120421040", var_166_21)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_120421", "120421040", "story_v_out_120421.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_120421", "120421040", "story_v_out_120421.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_22 = math.max(var_166_13, arg_163_1.talkMaxDuration)

			if var_166_12 <= arg_163_1.time_ and arg_163_1.time_ < var_166_12 + var_166_22 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_12) / var_166_22

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_12 + var_166_22 and arg_163_1.time_ < var_166_12 + var_166_22 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play120421041 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 120421041
		arg_167_1.duration_ = 7.4

		local var_167_0 = {
			zh = 7,
			ja = 7.4
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
				arg_167_0:Play120421042(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_170_1 = 0

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action478")
			end

			local var_170_2 = 0
			local var_170_3 = 0.95

			if var_170_2 < arg_167_1.time_ and arg_167_1.time_ <= var_170_2 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_4 = arg_167_1:FormatText(StoryNameCfg[6].name)

				arg_167_1.leftNameTxt_.text = var_170_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_5 = arg_167_1:GetWordFromCfg(120421041)
				local var_170_6 = arg_167_1:FormatText(var_170_5.content)

				arg_167_1.text_.text = var_170_6

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_7 = 38
				local var_170_8 = utf8.len(var_170_6)
				local var_170_9 = var_170_7 <= 0 and var_170_3 or var_170_3 * (var_170_8 / var_170_7)

				if var_170_9 > 0 and var_170_3 < var_170_9 then
					arg_167_1.talkMaxDuration = var_170_9

					if var_170_9 + var_170_2 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_9 + var_170_2
					end
				end

				arg_167_1.text_.text = var_170_6
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421041", "story_v_out_120421.awb") ~= 0 then
					local var_170_10 = manager.audio:GetVoiceLength("story_v_out_120421", "120421041", "story_v_out_120421.awb") / 1000

					if var_170_10 + var_170_2 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_10 + var_170_2
					end

					if var_170_5.prefab_name ~= "" and arg_167_1.actors_[var_170_5.prefab_name] ~= nil then
						local var_170_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_5.prefab_name].transform, "story_v_out_120421", "120421041", "story_v_out_120421.awb")

						arg_167_1:RecordAudio("120421041", var_170_11)
						arg_167_1:RecordAudio("120421041", var_170_11)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_120421", "120421041", "story_v_out_120421.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_120421", "120421041", "story_v_out_120421.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_12 = math.max(var_170_3, arg_167_1.talkMaxDuration)

			if var_170_2 <= arg_167_1.time_ and arg_167_1.time_ < var_170_2 + var_170_12 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_2) / var_170_12

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_2 + var_170_12 and arg_167_1.time_ < var_170_2 + var_170_12 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play120421042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 120421042
		arg_171_1.duration_ = 15.2

		local var_171_0 = {
			zh = 6.5,
			ja = 15.2
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
				arg_171_0:Play120421043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1075ui_story"]
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 and arg_171_1.var_.characterEffect1075ui_story == nil then
				arg_171_1.var_.characterEffect1075ui_story = var_174_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_2 = 0.2

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2

				if arg_171_1.var_.characterEffect1075ui_story then
					arg_171_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 and arg_171_1.var_.characterEffect1075ui_story then
				arg_171_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_174_4 = arg_171_1.actors_["1084ui_story"]
			local var_174_5 = 0

			if var_174_5 < arg_171_1.time_ and arg_171_1.time_ <= var_174_5 + arg_174_0 and arg_171_1.var_.characterEffect1084ui_story == nil then
				arg_171_1.var_.characterEffect1084ui_story = var_174_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_174_6 = 0.2

			if var_174_5 <= arg_171_1.time_ and arg_171_1.time_ < var_174_5 + var_174_6 then
				local var_174_7 = (arg_171_1.time_ - var_174_5) / var_174_6

				if arg_171_1.var_.characterEffect1084ui_story then
					local var_174_8 = Mathf.Lerp(0, 0.5, var_174_7)

					arg_171_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_171_1.var_.characterEffect1084ui_story.fillRatio = var_174_8
				end
			end

			if arg_171_1.time_ >= var_174_5 + var_174_6 and arg_171_1.time_ < var_174_5 + var_174_6 + arg_174_0 and arg_171_1.var_.characterEffect1084ui_story then
				local var_174_9 = 0.5

				arg_171_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_171_1.var_.characterEffect1084ui_story.fillRatio = var_174_9
			end

			local var_174_10 = 0

			if var_174_10 < arg_171_1.time_ and arg_171_1.time_ <= var_174_10 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_174_11 = 0

			if var_174_11 < arg_171_1.time_ and arg_171_1.time_ <= var_174_11 + arg_174_0 then
				arg_171_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action5_2")
			end

			local var_174_12 = 0
			local var_174_13 = 0.75

			if var_174_12 < arg_171_1.time_ and arg_171_1.time_ <= var_174_12 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_14 = arg_171_1:FormatText(StoryNameCfg[381].name)

				arg_171_1.leftNameTxt_.text = var_174_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_15 = arg_171_1:GetWordFromCfg(120421042)
				local var_174_16 = arg_171_1:FormatText(var_174_15.content)

				arg_171_1.text_.text = var_174_16

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_17 = 30
				local var_174_18 = utf8.len(var_174_16)
				local var_174_19 = var_174_17 <= 0 and var_174_13 or var_174_13 * (var_174_18 / var_174_17)

				if var_174_19 > 0 and var_174_13 < var_174_19 then
					arg_171_1.talkMaxDuration = var_174_19

					if var_174_19 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_19 + var_174_12
					end
				end

				arg_171_1.text_.text = var_174_16
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421042", "story_v_out_120421.awb") ~= 0 then
					local var_174_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421042", "story_v_out_120421.awb") / 1000

					if var_174_20 + var_174_12 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_20 + var_174_12
					end

					if var_174_15.prefab_name ~= "" and arg_171_1.actors_[var_174_15.prefab_name] ~= nil then
						local var_174_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_15.prefab_name].transform, "story_v_out_120421", "120421042", "story_v_out_120421.awb")

						arg_171_1:RecordAudio("120421042", var_174_21)
						arg_171_1:RecordAudio("120421042", var_174_21)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_120421", "120421042", "story_v_out_120421.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_120421", "120421042", "story_v_out_120421.awb")
				end

				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_22 = math.max(var_174_13, arg_171_1.talkMaxDuration)

			if var_174_12 <= arg_171_1.time_ and arg_171_1.time_ < var_174_12 + var_174_22 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_12) / var_174_22

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_12 + var_174_22 and arg_171_1.time_ < var_174_12 + var_174_22 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play120421043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 120421043
		arg_175_1.duration_ = 8.866

		local var_175_0 = {
			zh = 8.766,
			ja = 8.866
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
				arg_175_0:Play120421044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = 0
			local var_178_1 = 0.8

			if var_178_0 < arg_175_1.time_ and arg_175_1.time_ <= var_178_0 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_2 = arg_175_1:FormatText(StoryNameCfg[381].name)

				arg_175_1.leftNameTxt_.text = var_178_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_3 = arg_175_1:GetWordFromCfg(120421043)
				local var_178_4 = arg_175_1:FormatText(var_178_3.content)

				arg_175_1.text_.text = var_178_4

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_5 = 32
				local var_178_6 = utf8.len(var_178_4)
				local var_178_7 = var_178_5 <= 0 and var_178_1 or var_178_1 * (var_178_6 / var_178_5)

				if var_178_7 > 0 and var_178_1 < var_178_7 then
					arg_175_1.talkMaxDuration = var_178_7

					if var_178_7 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_7 + var_178_0
					end
				end

				arg_175_1.text_.text = var_178_4
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421043", "story_v_out_120421.awb") ~= 0 then
					local var_178_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421043", "story_v_out_120421.awb") / 1000

					if var_178_8 + var_178_0 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_8 + var_178_0
					end

					if var_178_3.prefab_name ~= "" and arg_175_1.actors_[var_178_3.prefab_name] ~= nil then
						local var_178_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_3.prefab_name].transform, "story_v_out_120421", "120421043", "story_v_out_120421.awb")

						arg_175_1:RecordAudio("120421043", var_178_9)
						arg_175_1:RecordAudio("120421043", var_178_9)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_120421", "120421043", "story_v_out_120421.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_120421", "120421043", "story_v_out_120421.awb")
				end

				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_10 = math.max(var_178_1, arg_175_1.talkMaxDuration)

			if var_178_0 <= arg_175_1.time_ and arg_175_1.time_ < var_178_0 + var_178_10 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_0) / var_178_10

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_0 + var_178_10 and arg_175_1.time_ < var_178_0 + var_178_10 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play120421044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 120421044
		arg_179_1.duration_ = 12.6

		local var_179_0 = {
			zh = 11.466,
			ja = 12.6
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
				arg_179_0:Play120421045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1075ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1075ui_story == nil then
				arg_179_1.var_.characterEffect1075ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1075ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1075ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1075ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1075ui_story.fillRatio = var_182_5
			end

			local var_182_6 = arg_179_1.actors_["1084ui_story"]
			local var_182_7 = 0

			if var_182_7 < arg_179_1.time_ and arg_179_1.time_ <= var_182_7 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story == nil then
				arg_179_1.var_.characterEffect1084ui_story = var_182_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_8 = 0.2

			if var_182_7 <= arg_179_1.time_ and arg_179_1.time_ < var_182_7 + var_182_8 then
				local var_182_9 = (arg_179_1.time_ - var_182_7) / var_182_8

				if arg_179_1.var_.characterEffect1084ui_story then
					arg_179_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_7 + var_182_8 and arg_179_1.time_ < var_182_7 + var_182_8 + arg_182_0 and arg_179_1.var_.characterEffect1084ui_story then
				arg_179_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 then
				arg_179_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action486")
			end

			local var_182_11 = 0

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 then
				arg_179_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0203cva")
			end

			local var_182_12 = 0
			local var_182_13 = 0.75

			if var_182_12 < arg_179_1.time_ and arg_179_1.time_ <= var_182_12 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_14 = arg_179_1:FormatText(StoryNameCfg[6].name)

				arg_179_1.leftNameTxt_.text = var_182_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_15 = arg_179_1:GetWordFromCfg(120421044)
				local var_182_16 = arg_179_1:FormatText(var_182_15.content)

				arg_179_1.text_.text = var_182_16

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_17 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421044", "story_v_out_120421.awb") ~= 0 then
					local var_182_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421044", "story_v_out_120421.awb") / 1000

					if var_182_20 + var_182_12 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_20 + var_182_12
					end

					if var_182_15.prefab_name ~= "" and arg_179_1.actors_[var_182_15.prefab_name] ~= nil then
						local var_182_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_15.prefab_name].transform, "story_v_out_120421", "120421044", "story_v_out_120421.awb")

						arg_179_1:RecordAudio("120421044", var_182_21)
						arg_179_1:RecordAudio("120421044", var_182_21)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_120421", "120421044", "story_v_out_120421.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_120421", "120421044", "story_v_out_120421.awb")
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
	Play120421045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 120421045
		arg_183_1.duration_ = 6.933

		local var_183_0 = {
			zh = 6.633,
			ja = 6.933
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
				arg_183_0:Play120421046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["1075ui_story"]
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story == nil then
				arg_183_1.var_.characterEffect1075ui_story = var_186_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_2 = 0.2

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2

				if arg_183_1.var_.characterEffect1075ui_story then
					local var_186_4 = Mathf.Lerp(0, 0.5, var_186_3)

					arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_4
				end
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1075ui_story then
				local var_186_5 = 0.5

				arg_183_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1075ui_story.fillRatio = var_186_5
			end

			local var_186_6 = arg_183_1.actors_["1084ui_story"]
			local var_186_7 = 0

			if var_186_7 < arg_183_1.time_ and arg_183_1.time_ <= var_186_7 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story == nil then
				arg_183_1.var_.characterEffect1084ui_story = var_186_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_8 = 0.2

			if var_186_7 <= arg_183_1.time_ and arg_183_1.time_ < var_186_7 + var_186_8 then
				local var_186_9 = (arg_183_1.time_ - var_186_7) / var_186_8

				if arg_183_1.var_.characterEffect1084ui_story then
					arg_183_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_7 + var_186_8 and arg_183_1.time_ < var_186_7 + var_186_8 + arg_186_0 and arg_183_1.var_.characterEffect1084ui_story then
				arg_183_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 then
				arg_183_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_186_11 = 0

			if var_186_11 < arg_183_1.time_ and arg_183_1.time_ <= var_186_11 + arg_186_0 then
				arg_183_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action6_2")
			end

			local var_186_12 = 0
			local var_186_13 = 0.725

			if var_186_12 < arg_183_1.time_ and arg_183_1.time_ <= var_186_12 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_14 = arg_183_1:FormatText(StoryNameCfg[6].name)

				arg_183_1.leftNameTxt_.text = var_186_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_15 = arg_183_1:GetWordFromCfg(120421045)
				local var_186_16 = arg_183_1:FormatText(var_186_15.content)

				arg_183_1.text_.text = var_186_16

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_17 = 29
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421045", "story_v_out_120421.awb") ~= 0 then
					local var_186_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421045", "story_v_out_120421.awb") / 1000

					if var_186_20 + var_186_12 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_20 + var_186_12
					end

					if var_186_15.prefab_name ~= "" and arg_183_1.actors_[var_186_15.prefab_name] ~= nil then
						local var_186_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_15.prefab_name].transform, "story_v_out_120421", "120421045", "story_v_out_120421.awb")

						arg_183_1:RecordAudio("120421045", var_186_21)
						arg_183_1:RecordAudio("120421045", var_186_21)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_120421", "120421045", "story_v_out_120421.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_120421", "120421045", "story_v_out_120421.awb")
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
	Play120421046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 120421046
		arg_187_1.duration_ = 3.133

		local var_187_0 = {
			zh = 2,
			ja = 3.133
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
				arg_187_0:Play120421047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1075ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story == nil then
				arg_187_1.var_.characterEffect1075ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.2

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1075ui_story then
					arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1075ui_story then
				arg_187_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_190_4 = arg_187_1.actors_["1084ui_story"]
			local var_190_5 = 0

			if var_190_5 < arg_187_1.time_ and arg_187_1.time_ <= var_190_5 + arg_190_0 and arg_187_1.var_.characterEffect1084ui_story == nil then
				arg_187_1.var_.characterEffect1084ui_story = var_190_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_6 = 0.2

			if var_190_5 <= arg_187_1.time_ and arg_187_1.time_ < var_190_5 + var_190_6 then
				local var_190_7 = (arg_187_1.time_ - var_190_5) / var_190_6

				if arg_187_1.var_.characterEffect1084ui_story then
					local var_190_8 = Mathf.Lerp(0, 0.5, var_190_7)

					arg_187_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_187_1.var_.characterEffect1084ui_story.fillRatio = var_190_8
				end
			end

			if arg_187_1.time_ >= var_190_5 + var_190_6 and arg_187_1.time_ < var_190_5 + var_190_6 + arg_190_0 and arg_187_1.var_.characterEffect1084ui_story then
				local var_190_9 = 0.5

				arg_187_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_187_1.var_.characterEffect1084ui_story.fillRatio = var_190_9
			end

			local var_190_10 = 0
			local var_190_11 = 0.25

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_12 = arg_187_1:FormatText(StoryNameCfg[381].name)

				arg_187_1.leftNameTxt_.text = var_190_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_13 = arg_187_1:GetWordFromCfg(120421046)
				local var_190_14 = arg_187_1:FormatText(var_190_13.content)

				arg_187_1.text_.text = var_190_14

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_15 = 10
				local var_190_16 = utf8.len(var_190_14)
				local var_190_17 = var_190_15 <= 0 and var_190_11 or var_190_11 * (var_190_16 / var_190_15)

				if var_190_17 > 0 and var_190_11 < var_190_17 then
					arg_187_1.talkMaxDuration = var_190_17

					if var_190_17 + var_190_10 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_17 + var_190_10
					end
				end

				arg_187_1.text_.text = var_190_14
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421046", "story_v_out_120421.awb") ~= 0 then
					local var_190_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421046", "story_v_out_120421.awb") / 1000

					if var_190_18 + var_190_10 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_18 + var_190_10
					end

					if var_190_13.prefab_name ~= "" and arg_187_1.actors_[var_190_13.prefab_name] ~= nil then
						local var_190_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_13.prefab_name].transform, "story_v_out_120421", "120421046", "story_v_out_120421.awb")

						arg_187_1:RecordAudio("120421046", var_190_19)
						arg_187_1:RecordAudio("120421046", var_190_19)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_120421", "120421046", "story_v_out_120421.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_120421", "120421046", "story_v_out_120421.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_20 = math.max(var_190_11, arg_187_1.talkMaxDuration)

			if var_190_10 <= arg_187_1.time_ and arg_187_1.time_ < var_190_10 + var_190_20 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_10) / var_190_20

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_10 + var_190_20 and arg_187_1.time_ < var_190_10 + var_190_20 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play120421047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 120421047
		arg_191_1.duration_ = 5

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play120421048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1075ui_story"]
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story == nil then
				arg_191_1.var_.characterEffect1075ui_story = var_194_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_2 = 0.2

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2

				if arg_191_1.var_.characterEffect1075ui_story then
					local var_194_4 = Mathf.Lerp(0, 0.5, var_194_3)

					arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_4
				end
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1075ui_story then
				local var_194_5 = 0.5

				arg_191_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_191_1.var_.characterEffect1075ui_story.fillRatio = var_194_5
			end

			local var_194_6 = arg_191_1.actors_["1084ui_story"]
			local var_194_7 = 0

			if var_194_7 < arg_191_1.time_ and arg_191_1.time_ <= var_194_7 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story == nil then
				arg_191_1.var_.characterEffect1084ui_story = var_194_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_8 = 0.2

			if var_194_7 <= arg_191_1.time_ and arg_191_1.time_ < var_194_7 + var_194_8 then
				local var_194_9 = (arg_191_1.time_ - var_194_7) / var_194_8

				if arg_191_1.var_.characterEffect1084ui_story then
					arg_191_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_7 + var_194_8 and arg_191_1.time_ < var_194_7 + var_194_8 + arg_194_0 and arg_191_1.var_.characterEffect1084ui_story then
				arg_191_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1101cva")
			end

			local var_194_11 = 0

			if var_194_11 < arg_191_1.time_ and arg_191_1.time_ <= var_194_11 + arg_194_0 then
				arg_191_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_194_12 = 0
			local var_194_13 = 0.825

			if var_194_12 < arg_191_1.time_ and arg_191_1.time_ <= var_194_12 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, false)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_14 = arg_191_1:GetWordFromCfg(120421047)
				local var_194_15 = arg_191_1:FormatText(var_194_14.content)

				arg_191_1.text_.text = var_194_15

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_16 = 33
				local var_194_17 = utf8.len(var_194_15)
				local var_194_18 = var_194_16 <= 0 and var_194_13 or var_194_13 * (var_194_17 / var_194_16)

				if var_194_18 > 0 and var_194_13 < var_194_18 then
					arg_191_1.talkMaxDuration = var_194_18

					if var_194_18 + var_194_12 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_18 + var_194_12
					end
				end

				arg_191_1.text_.text = var_194_15
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)
				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_19 = math.max(var_194_13, arg_191_1.talkMaxDuration)

			if var_194_12 <= arg_191_1.time_ and arg_191_1.time_ < var_194_12 + var_194_19 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_12) / var_194_19

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_12 + var_194_19 and arg_191_1.time_ < var_194_12 + var_194_19 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play120421048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 120421048
		arg_195_1.duration_ = 6.933

		local var_195_0 = {
			zh = 5.966,
			ja = 6.933
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
				arg_195_0:Play120421049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = 0

			if var_198_0 < arg_195_1.time_ and arg_195_1.time_ <= var_198_0 + arg_198_0 then
				arg_195_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_198_1 = 0
			local var_198_2 = 0.45

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_3 = arg_195_1:FormatText(StoryNameCfg[6].name)

				arg_195_1.leftNameTxt_.text = var_198_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_4 = arg_195_1:GetWordFromCfg(120421048)
				local var_198_5 = arg_195_1:FormatText(var_198_4.content)

				arg_195_1.text_.text = var_198_5

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_6 = 18
				local var_198_7 = utf8.len(var_198_5)
				local var_198_8 = var_198_6 <= 0 and var_198_2 or var_198_2 * (var_198_7 / var_198_6)

				if var_198_8 > 0 and var_198_2 < var_198_8 then
					arg_195_1.talkMaxDuration = var_198_8

					if var_198_8 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_8 + var_198_1
					end
				end

				arg_195_1.text_.text = var_198_5
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421048", "story_v_out_120421.awb") ~= 0 then
					local var_198_9 = manager.audio:GetVoiceLength("story_v_out_120421", "120421048", "story_v_out_120421.awb") / 1000

					if var_198_9 + var_198_1 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_9 + var_198_1
					end

					if var_198_4.prefab_name ~= "" and arg_195_1.actors_[var_198_4.prefab_name] ~= nil then
						local var_198_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_4.prefab_name].transform, "story_v_out_120421", "120421048", "story_v_out_120421.awb")

						arg_195_1:RecordAudio("120421048", var_198_10)
						arg_195_1:RecordAudio("120421048", var_198_10)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_120421", "120421048", "story_v_out_120421.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_120421", "120421048", "story_v_out_120421.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_11 = math.max(var_198_2, arg_195_1.talkMaxDuration)

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_11 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_1) / var_198_11

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_1 + var_198_11 and arg_195_1.time_ < var_198_1 + var_198_11 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play120421049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 120421049
		arg_199_1.duration_ = 14.566

		local var_199_0 = {
			zh = 12.3,
			ja = 14.566
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
				arg_199_0:Play120421050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0
			local var_202_1 = 1.35

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_2 = arg_199_1:FormatText(StoryNameCfg[6].name)

				arg_199_1.leftNameTxt_.text = var_202_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_3 = arg_199_1:GetWordFromCfg(120421049)
				local var_202_4 = arg_199_1:FormatText(var_202_3.content)

				arg_199_1.text_.text = var_202_4

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_5 = 54
				local var_202_6 = utf8.len(var_202_4)
				local var_202_7 = var_202_5 <= 0 and var_202_1 or var_202_1 * (var_202_6 / var_202_5)

				if var_202_7 > 0 and var_202_1 < var_202_7 then
					arg_199_1.talkMaxDuration = var_202_7

					if var_202_7 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_7 + var_202_0
					end
				end

				arg_199_1.text_.text = var_202_4
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421049", "story_v_out_120421.awb") ~= 0 then
					local var_202_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421049", "story_v_out_120421.awb") / 1000

					if var_202_8 + var_202_0 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_8 + var_202_0
					end

					if var_202_3.prefab_name ~= "" and arg_199_1.actors_[var_202_3.prefab_name] ~= nil then
						local var_202_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_3.prefab_name].transform, "story_v_out_120421", "120421049", "story_v_out_120421.awb")

						arg_199_1:RecordAudio("120421049", var_202_9)
						arg_199_1:RecordAudio("120421049", var_202_9)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_120421", "120421049", "story_v_out_120421.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_120421", "120421049", "story_v_out_120421.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_10 = math.max(var_202_1, arg_199_1.talkMaxDuration)

			if var_202_0 <= arg_199_1.time_ and arg_199_1.time_ < var_202_0 + var_202_10 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_0) / var_202_10

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_0 + var_202_10 and arg_199_1.time_ < var_202_0 + var_202_10 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play120421050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 120421050
		arg_203_1.duration_ = 7.8

		local var_203_0 = {
			zh = 6.566,
			ja = 7.8
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
				arg_203_0:Play120421051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = 0
			local var_206_1 = 0.6

			if var_206_0 < arg_203_1.time_ and arg_203_1.time_ <= var_206_0 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_2 = arg_203_1:FormatText(StoryNameCfg[6].name)

				arg_203_1.leftNameTxt_.text = var_206_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_3 = arg_203_1:GetWordFromCfg(120421050)
				local var_206_4 = arg_203_1:FormatText(var_206_3.content)

				arg_203_1.text_.text = var_206_4

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_5 = 24
				local var_206_6 = utf8.len(var_206_4)
				local var_206_7 = var_206_5 <= 0 and var_206_1 or var_206_1 * (var_206_6 / var_206_5)

				if var_206_7 > 0 and var_206_1 < var_206_7 then
					arg_203_1.talkMaxDuration = var_206_7

					if var_206_7 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_7 + var_206_0
					end
				end

				arg_203_1.text_.text = var_206_4
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421050", "story_v_out_120421.awb") ~= 0 then
					local var_206_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421050", "story_v_out_120421.awb") / 1000

					if var_206_8 + var_206_0 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_8 + var_206_0
					end

					if var_206_3.prefab_name ~= "" and arg_203_1.actors_[var_206_3.prefab_name] ~= nil then
						local var_206_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_3.prefab_name].transform, "story_v_out_120421", "120421050", "story_v_out_120421.awb")

						arg_203_1:RecordAudio("120421050", var_206_9)
						arg_203_1:RecordAudio("120421050", var_206_9)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_120421", "120421050", "story_v_out_120421.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_120421", "120421050", "story_v_out_120421.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_10 = math.max(var_206_1, arg_203_1.talkMaxDuration)

			if var_206_0 <= arg_203_1.time_ and arg_203_1.time_ < var_206_0 + var_206_10 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_0) / var_206_10

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_0 + var_206_10 and arg_203_1.time_ < var_206_0 + var_206_10 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play120421051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 120421051
		arg_207_1.duration_ = 4.8

		local var_207_0 = {
			zh = 3.7,
			ja = 4.8
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
				arg_207_0:Play120421052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = arg_207_1.actors_["1075ui_story"]
			local var_210_1 = 0

			if var_210_1 < arg_207_1.time_ and arg_207_1.time_ <= var_210_1 + arg_210_0 and arg_207_1.var_.characterEffect1075ui_story == nil then
				arg_207_1.var_.characterEffect1075ui_story = var_210_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_2 = 0.2

			if var_210_1 <= arg_207_1.time_ and arg_207_1.time_ < var_210_1 + var_210_2 then
				local var_210_3 = (arg_207_1.time_ - var_210_1) / var_210_2

				if arg_207_1.var_.characterEffect1075ui_story then
					arg_207_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_207_1.time_ >= var_210_1 + var_210_2 and arg_207_1.time_ < var_210_1 + var_210_2 + arg_210_0 and arg_207_1.var_.characterEffect1075ui_story then
				arg_207_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_210_4 = arg_207_1.actors_["1084ui_story"]
			local var_210_5 = 0

			if var_210_5 < arg_207_1.time_ and arg_207_1.time_ <= var_210_5 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story == nil then
				arg_207_1.var_.characterEffect1084ui_story = var_210_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_210_6 = 0.2

			if var_210_5 <= arg_207_1.time_ and arg_207_1.time_ < var_210_5 + var_210_6 then
				local var_210_7 = (arg_207_1.time_ - var_210_5) / var_210_6

				if arg_207_1.var_.characterEffect1084ui_story then
					local var_210_8 = Mathf.Lerp(0, 0.5, var_210_7)

					arg_207_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_207_1.var_.characterEffect1084ui_story.fillRatio = var_210_8
				end
			end

			if arg_207_1.time_ >= var_210_5 + var_210_6 and arg_207_1.time_ < var_210_5 + var_210_6 + arg_210_0 and arg_207_1.var_.characterEffect1084ui_story then
				local var_210_9 = 0.5

				arg_207_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_207_1.var_.characterEffect1084ui_story.fillRatio = var_210_9
			end

			local var_210_10 = 0

			if var_210_10 < arg_207_1.time_ and arg_207_1.time_ <= var_210_10 + arg_210_0 then
				arg_207_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_210_11 = 0

			if var_210_11 < arg_207_1.time_ and arg_207_1.time_ <= var_210_11 + arg_210_0 then
				arg_207_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_210_12 = 0
			local var_210_13 = 0.45

			if var_210_12 < arg_207_1.time_ and arg_207_1.time_ <= var_210_12 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_14 = arg_207_1:FormatText(StoryNameCfg[381].name)

				arg_207_1.leftNameTxt_.text = var_210_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_15 = arg_207_1:GetWordFromCfg(120421051)
				local var_210_16 = arg_207_1:FormatText(var_210_15.content)

				arg_207_1.text_.text = var_210_16

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_17 = 18
				local var_210_18 = utf8.len(var_210_16)
				local var_210_19 = var_210_17 <= 0 and var_210_13 or var_210_13 * (var_210_18 / var_210_17)

				if var_210_19 > 0 and var_210_13 < var_210_19 then
					arg_207_1.talkMaxDuration = var_210_19

					if var_210_19 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_19 + var_210_12
					end
				end

				arg_207_1.text_.text = var_210_16
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421051", "story_v_out_120421.awb") ~= 0 then
					local var_210_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421051", "story_v_out_120421.awb") / 1000

					if var_210_20 + var_210_12 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_20 + var_210_12
					end

					if var_210_15.prefab_name ~= "" and arg_207_1.actors_[var_210_15.prefab_name] ~= nil then
						local var_210_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_15.prefab_name].transform, "story_v_out_120421", "120421051", "story_v_out_120421.awb")

						arg_207_1:RecordAudio("120421051", var_210_21)
						arg_207_1:RecordAudio("120421051", var_210_21)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_120421", "120421051", "story_v_out_120421.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_120421", "120421051", "story_v_out_120421.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_22 = math.max(var_210_13, arg_207_1.talkMaxDuration)

			if var_210_12 <= arg_207_1.time_ and arg_207_1.time_ < var_210_12 + var_210_22 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_12) / var_210_22

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_12 + var_210_22 and arg_207_1.time_ < var_210_12 + var_210_22 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play120421052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 120421052
		arg_211_1.duration_ = 5.366

		local var_211_0 = {
			zh = 5.366,
			ja = 4.866
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
				arg_211_0:Play120421053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["1075ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect1075ui_story == nil then
				arg_211_1.var_.characterEffect1075ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.2

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect1075ui_story then
					local var_214_4 = Mathf.Lerp(0, 0.5, var_214_3)

					arg_211_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1075ui_story.fillRatio = var_214_4
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1075ui_story then
				local var_214_5 = 0.5

				arg_211_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1075ui_story.fillRatio = var_214_5
			end

			local var_214_6 = arg_211_1.actors_["1084ui_story"]
			local var_214_7 = 0

			if var_214_7 < arg_211_1.time_ and arg_211_1.time_ <= var_214_7 + arg_214_0 and arg_211_1.var_.characterEffect1084ui_story == nil then
				arg_211_1.var_.characterEffect1084ui_story = var_214_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_8 = 0.2

			if var_214_7 <= arg_211_1.time_ and arg_211_1.time_ < var_214_7 + var_214_8 then
				local var_214_9 = (arg_211_1.time_ - var_214_7) / var_214_8

				if arg_211_1.var_.characterEffect1084ui_story then
					arg_211_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_7 + var_214_8 and arg_211_1.time_ < var_214_7 + var_214_8 + arg_214_0 and arg_211_1.var_.characterEffect1084ui_story then
				arg_211_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_214_10 = 0

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_214_11 = 0
			local var_214_12 = 0.7

			if var_214_11 < arg_211_1.time_ and arg_211_1.time_ <= var_214_11 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_13 = arg_211_1:FormatText(StoryNameCfg[6].name)

				arg_211_1.leftNameTxt_.text = var_214_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_14 = arg_211_1:GetWordFromCfg(120421052)
				local var_214_15 = arg_211_1:FormatText(var_214_14.content)

				arg_211_1.text_.text = var_214_15

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_16 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421052", "story_v_out_120421.awb") ~= 0 then
					local var_214_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421052", "story_v_out_120421.awb") / 1000

					if var_214_19 + var_214_11 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_19 + var_214_11
					end

					if var_214_14.prefab_name ~= "" and arg_211_1.actors_[var_214_14.prefab_name] ~= nil then
						local var_214_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_14.prefab_name].transform, "story_v_out_120421", "120421052", "story_v_out_120421.awb")

						arg_211_1:RecordAudio("120421052", var_214_20)
						arg_211_1:RecordAudio("120421052", var_214_20)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_120421", "120421052", "story_v_out_120421.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_120421", "120421052", "story_v_out_120421.awb")
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
	Play120421053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 120421053
		arg_215_1.duration_ = 13.033

		local var_215_0 = {
			zh = 10.1,
			ja = 13.033
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
				arg_215_0:Play120421054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_218_1 = 0
			local var_218_2 = 1.175

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_3 = arg_215_1:FormatText(StoryNameCfg[6].name)

				arg_215_1.leftNameTxt_.text = var_218_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_4 = arg_215_1:GetWordFromCfg(120421053)
				local var_218_5 = arg_215_1:FormatText(var_218_4.content)

				arg_215_1.text_.text = var_218_5

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_6 = 47
				local var_218_7 = utf8.len(var_218_5)
				local var_218_8 = var_218_6 <= 0 and var_218_2 or var_218_2 * (var_218_7 / var_218_6)

				if var_218_8 > 0 and var_218_2 < var_218_8 then
					arg_215_1.talkMaxDuration = var_218_8

					if var_218_8 + var_218_1 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_8 + var_218_1
					end
				end

				arg_215_1.text_.text = var_218_5
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421053", "story_v_out_120421.awb") ~= 0 then
					local var_218_9 = manager.audio:GetVoiceLength("story_v_out_120421", "120421053", "story_v_out_120421.awb") / 1000

					if var_218_9 + var_218_1 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_9 + var_218_1
					end

					if var_218_4.prefab_name ~= "" and arg_215_1.actors_[var_218_4.prefab_name] ~= nil then
						local var_218_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_4.prefab_name].transform, "story_v_out_120421", "120421053", "story_v_out_120421.awb")

						arg_215_1:RecordAudio("120421053", var_218_10)
						arg_215_1:RecordAudio("120421053", var_218_10)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_120421", "120421053", "story_v_out_120421.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_120421", "120421053", "story_v_out_120421.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_11 = math.max(var_218_2, arg_215_1.talkMaxDuration)

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_11 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_1) / var_218_11

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_1 + var_218_11 and arg_215_1.time_ < var_218_1 + var_218_11 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play120421054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 120421054
		arg_219_1.duration_ = 12.833

		local var_219_0 = {
			zh = 7.8,
			ja = 12.833
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
				arg_219_0:Play120421055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = 0
			local var_222_1 = 1.025

			if var_222_0 < arg_219_1.time_ and arg_219_1.time_ <= var_222_0 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_2 = arg_219_1:FormatText(StoryNameCfg[6].name)

				arg_219_1.leftNameTxt_.text = var_222_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_3 = arg_219_1:GetWordFromCfg(120421054)
				local var_222_4 = arg_219_1:FormatText(var_222_3.content)

				arg_219_1.text_.text = var_222_4

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_5 = 41
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421054", "story_v_out_120421.awb") ~= 0 then
					local var_222_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421054", "story_v_out_120421.awb") / 1000

					if var_222_8 + var_222_0 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_8 + var_222_0
					end

					if var_222_3.prefab_name ~= "" and arg_219_1.actors_[var_222_3.prefab_name] ~= nil then
						local var_222_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_3.prefab_name].transform, "story_v_out_120421", "120421054", "story_v_out_120421.awb")

						arg_219_1:RecordAudio("120421054", var_222_9)
						arg_219_1:RecordAudio("120421054", var_222_9)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_120421", "120421054", "story_v_out_120421.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_120421", "120421054", "story_v_out_120421.awb")
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
	Play120421055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 120421055
		arg_223_1.duration_ = 4.9

		local var_223_0 = {
			zh = 2.6,
			ja = 4.9
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
				arg_223_0:Play120421056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["1075ui_story"]
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 and arg_223_1.var_.characterEffect1075ui_story == nil then
				arg_223_1.var_.characterEffect1075ui_story = var_226_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_2 = 0.2

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2

				if arg_223_1.var_.characterEffect1075ui_story then
					arg_223_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1075ui_story then
				arg_223_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_226_4 = arg_223_1.actors_["1084ui_story"]
			local var_226_5 = 0

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 and arg_223_1.var_.characterEffect1084ui_story == nil then
				arg_223_1.var_.characterEffect1084ui_story = var_226_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_6 = 0.2

			if var_226_5 <= arg_223_1.time_ and arg_223_1.time_ < var_226_5 + var_226_6 then
				local var_226_7 = (arg_223_1.time_ - var_226_5) / var_226_6

				if arg_223_1.var_.characterEffect1084ui_story then
					local var_226_8 = Mathf.Lerp(0, 0.5, var_226_7)

					arg_223_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1084ui_story.fillRatio = var_226_8
				end
			end

			if arg_223_1.time_ >= var_226_5 + var_226_6 and arg_223_1.time_ < var_226_5 + var_226_6 + arg_226_0 and arg_223_1.var_.characterEffect1084ui_story then
				local var_226_9 = 0.5

				arg_223_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1084ui_story.fillRatio = var_226_9
			end

			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 then
				arg_223_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_226_11 = 0
			local var_226_12 = 0.325

			if var_226_11 < arg_223_1.time_ and arg_223_1.time_ <= var_226_11 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_13 = arg_223_1:FormatText(StoryNameCfg[381].name)

				arg_223_1.leftNameTxt_.text = var_226_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_14 = arg_223_1:GetWordFromCfg(120421055)
				local var_226_15 = arg_223_1:FormatText(var_226_14.content)

				arg_223_1.text_.text = var_226_15

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_16 = 13
				local var_226_17 = utf8.len(var_226_15)
				local var_226_18 = var_226_16 <= 0 and var_226_12 or var_226_12 * (var_226_17 / var_226_16)

				if var_226_18 > 0 and var_226_12 < var_226_18 then
					arg_223_1.talkMaxDuration = var_226_18

					if var_226_18 + var_226_11 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_18 + var_226_11
					end
				end

				arg_223_1.text_.text = var_226_15
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421055", "story_v_out_120421.awb") ~= 0 then
					local var_226_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421055", "story_v_out_120421.awb") / 1000

					if var_226_19 + var_226_11 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_19 + var_226_11
					end

					if var_226_14.prefab_name ~= "" and arg_223_1.actors_[var_226_14.prefab_name] ~= nil then
						local var_226_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_14.prefab_name].transform, "story_v_out_120421", "120421055", "story_v_out_120421.awb")

						arg_223_1:RecordAudio("120421055", var_226_20)
						arg_223_1:RecordAudio("120421055", var_226_20)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_120421", "120421055", "story_v_out_120421.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_120421", "120421055", "story_v_out_120421.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_21 = math.max(var_226_12, arg_223_1.talkMaxDuration)

			if var_226_11 <= arg_223_1.time_ and arg_223_1.time_ < var_226_11 + var_226_21 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_11) / var_226_21

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_11 + var_226_21 and arg_223_1.time_ < var_226_11 + var_226_21 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play120421056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 120421056
		arg_227_1.duration_ = 8.7

		local var_227_0 = {
			zh = 5.7,
			ja = 8.7
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
				arg_227_0:Play120421057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["1075ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect1075ui_story == nil then
				arg_227_1.var_.characterEffect1075ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.2

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect1075ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_227_1.var_.characterEffect1075ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1075ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_227_1.var_.characterEffect1075ui_story.fillRatio = var_230_5
			end

			local var_230_6 = arg_227_1.actors_["1084ui_story"]
			local var_230_7 = 0

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 and arg_227_1.var_.characterEffect1084ui_story == nil then
				arg_227_1.var_.characterEffect1084ui_story = var_230_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_8 = 0.2

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_8 then
				local var_230_9 = (arg_227_1.time_ - var_230_7) / var_230_8

				if arg_227_1.var_.characterEffect1084ui_story then
					arg_227_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_7 + var_230_8 and arg_227_1.time_ < var_230_7 + var_230_8 + arg_230_0 and arg_227_1.var_.characterEffect1084ui_story then
				arg_227_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_230_11 = 0

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084actionlink/1084action41312")
			end

			local var_230_12 = 0
			local var_230_13 = 0.75

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[6].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(120421056)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 30
				local var_230_18 = utf8.len(var_230_16)
				local var_230_19 = var_230_17 <= 0 and var_230_13 or var_230_13 * (var_230_18 / var_230_17)

				if var_230_19 > 0 and var_230_13 < var_230_19 then
					arg_227_1.talkMaxDuration = var_230_19

					if var_230_19 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_19 + var_230_12
					end
				end

				arg_227_1.text_.text = var_230_16
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421056", "story_v_out_120421.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421056", "story_v_out_120421.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_out_120421", "120421056", "story_v_out_120421.awb")

						arg_227_1:RecordAudio("120421056", var_230_21)
						arg_227_1:RecordAudio("120421056", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_120421", "120421056", "story_v_out_120421.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_120421", "120421056", "story_v_out_120421.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_22 = math.max(var_230_13, arg_227_1.talkMaxDuration)

			if var_230_12 <= arg_227_1.time_ and arg_227_1.time_ < var_230_12 + var_230_22 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_12) / var_230_22

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_12 + var_230_22 and arg_227_1.time_ < var_230_12 + var_230_22 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play120421057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 120421057
		arg_231_1.duration_ = 9

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play120421058(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = "ST29"

			if arg_231_1.bgs_[var_234_0] == nil then
				local var_234_1 = Object.Instantiate(arg_231_1.paintGo_)

				var_234_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_234_0)
				var_234_1.name = var_234_0
				var_234_1.transform.parent = arg_231_1.stage_.transform
				var_234_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_231_1.bgs_[var_234_0] = var_234_1
			end

			local var_234_2 = 2

			if var_234_2 < arg_231_1.time_ and arg_231_1.time_ <= var_234_2 + arg_234_0 then
				local var_234_3 = manager.ui.mainCamera.transform.localPosition
				local var_234_4 = Vector3.New(0, 0, 10) + Vector3.New(var_234_3.x, var_234_3.y, 0)
				local var_234_5 = arg_231_1.bgs_.ST29

				var_234_5.transform.localPosition = var_234_4
				var_234_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_234_6 = var_234_5:GetComponent("SpriteRenderer")

				if var_234_6 and var_234_6.sprite then
					local var_234_7 = (var_234_5.transform.localPosition - var_234_3).z
					local var_234_8 = manager.ui.mainCameraCom_
					local var_234_9 = 2 * var_234_7 * Mathf.Tan(var_234_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_234_10 = var_234_9 * var_234_8.aspect
					local var_234_11 = var_234_6.sprite.bounds.size.x
					local var_234_12 = var_234_6.sprite.bounds.size.y
					local var_234_13 = var_234_10 / var_234_11
					local var_234_14 = var_234_9 / var_234_12
					local var_234_15 = var_234_14 < var_234_13 and var_234_13 or var_234_14

					var_234_5.transform.localScale = Vector3.New(var_234_15, var_234_15, 0)
				end

				for iter_234_0, iter_234_1 in pairs(arg_231_1.bgs_) do
					if iter_234_0 ~= "ST29" then
						iter_234_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_234_16 = 0

			if var_234_16 < arg_231_1.time_ and arg_231_1.time_ <= var_234_16 + arg_234_0 then
				arg_231_1.mask_.enabled = true
				arg_231_1.mask_.raycastTarget = true

				arg_231_1:SetGaussion(false)
			end

			local var_234_17 = 2

			if var_234_16 <= arg_231_1.time_ and arg_231_1.time_ < var_234_16 + var_234_17 then
				local var_234_18 = (arg_231_1.time_ - var_234_16) / var_234_17
				local var_234_19 = Color.New(0, 0, 0)

				var_234_19.a = Mathf.Lerp(0, 1, var_234_18)
				arg_231_1.mask_.color = var_234_19
			end

			if arg_231_1.time_ >= var_234_16 + var_234_17 and arg_231_1.time_ < var_234_16 + var_234_17 + arg_234_0 then
				local var_234_20 = Color.New(0, 0, 0)

				var_234_20.a = 1
				arg_231_1.mask_.color = var_234_20
			end

			local var_234_21 = 2

			if var_234_21 < arg_231_1.time_ and arg_231_1.time_ <= var_234_21 + arg_234_0 then
				arg_231_1.mask_.enabled = true
				arg_231_1.mask_.raycastTarget = true

				arg_231_1:SetGaussion(false)
			end

			local var_234_22 = 2

			if var_234_21 <= arg_231_1.time_ and arg_231_1.time_ < var_234_21 + var_234_22 then
				local var_234_23 = (arg_231_1.time_ - var_234_21) / var_234_22
				local var_234_24 = Color.New(0, 0, 0)

				var_234_24.a = Mathf.Lerp(1, 0, var_234_23)
				arg_231_1.mask_.color = var_234_24
			end

			if arg_231_1.time_ >= var_234_21 + var_234_22 and arg_231_1.time_ < var_234_21 + var_234_22 + arg_234_0 then
				local var_234_25 = Color.New(0, 0, 0)
				local var_234_26 = 0

				arg_231_1.mask_.enabled = false
				var_234_25.a = var_234_26
				arg_231_1.mask_.color = var_234_25
			end

			local var_234_27 = arg_231_1.actors_["1084ui_story"].transform
			local var_234_28 = 1.966

			if var_234_28 < arg_231_1.time_ and arg_231_1.time_ <= var_234_28 + arg_234_0 then
				arg_231_1.var_.moveOldPos1084ui_story = var_234_27.localPosition
			end

			local var_234_29 = 0.001

			if var_234_28 <= arg_231_1.time_ and arg_231_1.time_ < var_234_28 + var_234_29 then
				local var_234_30 = (arg_231_1.time_ - var_234_28) / var_234_29
				local var_234_31 = Vector3.New(0, 100, 0)

				var_234_27.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1084ui_story, var_234_31, var_234_30)

				local var_234_32 = manager.ui.mainCamera.transform.position - var_234_27.position

				var_234_27.forward = Vector3.New(var_234_32.x, var_234_32.y, var_234_32.z)

				local var_234_33 = var_234_27.localEulerAngles

				var_234_33.z = 0
				var_234_33.x = 0
				var_234_27.localEulerAngles = var_234_33
			end

			if arg_231_1.time_ >= var_234_28 + var_234_29 and arg_231_1.time_ < var_234_28 + var_234_29 + arg_234_0 then
				var_234_27.localPosition = Vector3.New(0, 100, 0)

				local var_234_34 = manager.ui.mainCamera.transform.position - var_234_27.position

				var_234_27.forward = Vector3.New(var_234_34.x, var_234_34.y, var_234_34.z)

				local var_234_35 = var_234_27.localEulerAngles

				var_234_35.z = 0
				var_234_35.x = 0
				var_234_27.localEulerAngles = var_234_35
			end

			local var_234_36 = arg_231_1.actors_["1075ui_story"].transform
			local var_234_37 = 1.966

			if var_234_37 < arg_231_1.time_ and arg_231_1.time_ <= var_234_37 + arg_234_0 then
				arg_231_1.var_.moveOldPos1075ui_story = var_234_36.localPosition
			end

			local var_234_38 = 0.001

			if var_234_37 <= arg_231_1.time_ and arg_231_1.time_ < var_234_37 + var_234_38 then
				local var_234_39 = (arg_231_1.time_ - var_234_37) / var_234_38
				local var_234_40 = Vector3.New(0, 100, 0)

				var_234_36.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1075ui_story, var_234_40, var_234_39)

				local var_234_41 = manager.ui.mainCamera.transform.position - var_234_36.position

				var_234_36.forward = Vector3.New(var_234_41.x, var_234_41.y, var_234_41.z)

				local var_234_42 = var_234_36.localEulerAngles

				var_234_42.z = 0
				var_234_42.x = 0
				var_234_36.localEulerAngles = var_234_42
			end

			if arg_231_1.time_ >= var_234_37 + var_234_38 and arg_231_1.time_ < var_234_37 + var_234_38 + arg_234_0 then
				var_234_36.localPosition = Vector3.New(0, 100, 0)

				local var_234_43 = manager.ui.mainCamera.transform.position - var_234_36.position

				var_234_36.forward = Vector3.New(var_234_43.x, var_234_43.y, var_234_43.z)

				local var_234_44 = var_234_36.localEulerAngles

				var_234_44.z = 0
				var_234_44.x = 0
				var_234_36.localEulerAngles = var_234_44
			end

			local var_234_45 = 0.8
			local var_234_46 = 1

			if var_234_45 < arg_231_1.time_ and arg_231_1.time_ <= var_234_45 + arg_234_0 then
				local var_234_47 = "play"
				local var_234_48 = "music"

				arg_231_1:AudioAction(var_234_47, var_234_48, "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu", "bgm_activity_2_0_story_tianlu.awb")
			end

			local var_234_49 = 0
			local var_234_50 = 0.2

			if var_234_49 < arg_231_1.time_ and arg_231_1.time_ <= var_234_49 + arg_234_0 then
				local var_234_51 = "play"
				local var_234_52 = "music"

				arg_231_1:AudioAction(var_234_51, var_234_52, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_231_1.frameCnt_ <= 1 then
				arg_231_1.dialog_:SetActive(false)
			end

			local var_234_53 = 4
			local var_234_54 = 0.675

			if var_234_53 < arg_231_1.time_ and arg_231_1.time_ <= var_234_53 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0

				arg_231_1.dialog_:SetActive(true)

				local var_234_55 = LeanTween.value(arg_231_1.dialog_, 0, 1, 0.3)

				var_234_55:setOnUpdate(LuaHelper.FloatAction(function(arg_235_0)
					arg_231_1.dialogCg_.alpha = arg_235_0
				end))
				var_234_55:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_231_1.dialog_)
					var_234_55:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_231_1.duration_ = arg_231_1.duration_ + 0.3

				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_56 = arg_231_1:GetWordFromCfg(120421057)
				local var_234_57 = arg_231_1:FormatText(var_234_56.content)

				arg_231_1.text_.text = var_234_57

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_58 = 27
				local var_234_59 = utf8.len(var_234_57)
				local var_234_60 = var_234_58 <= 0 and var_234_54 or var_234_54 * (var_234_59 / var_234_58)

				if var_234_60 > 0 and var_234_54 < var_234_60 then
					arg_231_1.talkMaxDuration = var_234_60
					var_234_53 = var_234_53 + 0.3

					if var_234_60 + var_234_53 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_60 + var_234_53
					end
				end

				arg_231_1.text_.text = var_234_57
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_61 = var_234_53 + 0.3
			local var_234_62 = math.max(var_234_54, arg_231_1.talkMaxDuration)

			if var_234_61 <= arg_231_1.time_ and arg_231_1.time_ < var_234_61 + var_234_62 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_61) / var_234_62

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_61 + var_234_62 and arg_231_1.time_ < var_234_61 + var_234_62 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play120421058 = function(arg_237_0, arg_237_1)
		arg_237_1.time_ = 0
		arg_237_1.frameCnt_ = 0
		arg_237_1.state_ = "playing"
		arg_237_1.curTalkId_ = 120421058
		arg_237_1.duration_ = 5

		SetActive(arg_237_1.tipsGo_, false)

		function arg_237_1.onSingleLineFinish_()
			arg_237_1.onSingleLineUpdate_ = nil
			arg_237_1.onSingleLineFinish_ = nil
			arg_237_1.state_ = "waiting"
		end

		function arg_237_1.playNext_(arg_239_0)
			if arg_239_0 == 1 then
				arg_237_0:Play120421059(arg_237_1)
			end
		end

		function arg_237_1.onSingleLineUpdate_(arg_240_0)
			local var_240_0 = 0
			local var_240_1 = 0.575

			if var_240_0 < arg_237_1.time_ and arg_237_1.time_ <= var_240_0 + arg_240_0 then
				arg_237_1.talkMaxDuration = 0
				arg_237_1.dialogCg_.alpha = 1

				arg_237_1.dialog_:SetActive(true)
				SetActive(arg_237_1.leftNameGo_, true)

				local var_240_2 = arg_237_1:FormatText(StoryNameCfg[7].name)

				arg_237_1.leftNameTxt_.text = var_240_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_237_1.leftNameTxt_.transform)

				arg_237_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_237_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_237_1:RecordName(arg_237_1.leftNameTxt_.text)
				SetActive(arg_237_1.iconTrs_.gameObject, false)
				arg_237_1.callingController_:SetSelectedState("normal")

				local var_240_3 = arg_237_1:GetWordFromCfg(120421058)
				local var_240_4 = arg_237_1:FormatText(var_240_3.content)

				arg_237_1.text_.text = var_240_4

				LuaForUtil.ClearLinePrefixSymbol(arg_237_1.text_)

				local var_240_5 = 23
				local var_240_6 = utf8.len(var_240_4)
				local var_240_7 = var_240_5 <= 0 and var_240_1 or var_240_1 * (var_240_6 / var_240_5)

				if var_240_7 > 0 and var_240_1 < var_240_7 then
					arg_237_1.talkMaxDuration = var_240_7

					if var_240_7 + var_240_0 > arg_237_1.duration_ then
						arg_237_1.duration_ = var_240_7 + var_240_0
					end
				end

				arg_237_1.text_.text = var_240_4
				arg_237_1.typewritter.percent = 0

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(false)
				arg_237_1:RecordContent(arg_237_1.text_.text)
			end

			local var_240_8 = math.max(var_240_1, arg_237_1.talkMaxDuration)

			if var_240_0 <= arg_237_1.time_ and arg_237_1.time_ < var_240_0 + var_240_8 then
				arg_237_1.typewritter.percent = (arg_237_1.time_ - var_240_0) / var_240_8

				arg_237_1.typewritter:SetDirty()
			end

			if arg_237_1.time_ >= var_240_0 + var_240_8 and arg_237_1.time_ < var_240_0 + var_240_8 + arg_240_0 then
				arg_237_1.typewritter.percent = 1

				arg_237_1.typewritter:SetDirty()
				arg_237_1:ShowNextGo(true)
			end
		end
	end,
	Play120421059 = function(arg_241_0, arg_241_1)
		arg_241_1.time_ = 0
		arg_241_1.frameCnt_ = 0
		arg_241_1.state_ = "playing"
		arg_241_1.curTalkId_ = 120421059
		arg_241_1.duration_ = 7.266

		local var_241_0 = {
			zh = 4.766,
			ja = 7.266
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
				arg_241_0:Play120421060(arg_241_1)
			end
		end

		function arg_241_1.onSingleLineUpdate_(arg_244_0)
			local var_244_0 = arg_241_1.actors_["1075ui_story"].transform
			local var_244_1 = 0

			if var_244_1 < arg_241_1.time_ and arg_241_1.time_ <= var_244_1 + arg_244_0 then
				arg_241_1.var_.moveOldPos1075ui_story = var_244_0.localPosition
			end

			local var_244_2 = 0.001

			if var_244_1 <= arg_241_1.time_ and arg_241_1.time_ < var_244_1 + var_244_2 then
				local var_244_3 = (arg_241_1.time_ - var_244_1) / var_244_2
				local var_244_4 = Vector3.New(-0.7, -1.055, -6.16)

				var_244_0.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1075ui_story, var_244_4, var_244_3)

				local var_244_5 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_5.x, var_244_5.y, var_244_5.z)

				local var_244_6 = var_244_0.localEulerAngles

				var_244_6.z = 0
				var_244_6.x = 0
				var_244_0.localEulerAngles = var_244_6
			end

			if arg_241_1.time_ >= var_244_1 + var_244_2 and arg_241_1.time_ < var_244_1 + var_244_2 + arg_244_0 then
				var_244_0.localPosition = Vector3.New(-0.7, -1.055, -6.16)

				local var_244_7 = manager.ui.mainCamera.transform.position - var_244_0.position

				var_244_0.forward = Vector3.New(var_244_7.x, var_244_7.y, var_244_7.z)

				local var_244_8 = var_244_0.localEulerAngles

				var_244_8.z = 0
				var_244_8.x = 0
				var_244_0.localEulerAngles = var_244_8
			end

			local var_244_9 = arg_241_1.actors_["1084ui_story"].transform
			local var_244_10 = 0

			if var_244_10 < arg_241_1.time_ and arg_241_1.time_ <= var_244_10 + arg_244_0 then
				arg_241_1.var_.moveOldPos1084ui_story = var_244_9.localPosition
			end

			local var_244_11 = 0.001

			if var_244_10 <= arg_241_1.time_ and arg_241_1.time_ < var_244_10 + var_244_11 then
				local var_244_12 = (arg_241_1.time_ - var_244_10) / var_244_11
				local var_244_13 = Vector3.New(0.7, -0.97, -6)

				var_244_9.localPosition = Vector3.Lerp(arg_241_1.var_.moveOldPos1084ui_story, var_244_13, var_244_12)

				local var_244_14 = manager.ui.mainCamera.transform.position - var_244_9.position

				var_244_9.forward = Vector3.New(var_244_14.x, var_244_14.y, var_244_14.z)

				local var_244_15 = var_244_9.localEulerAngles

				var_244_15.z = 0
				var_244_15.x = 0
				var_244_9.localEulerAngles = var_244_15
			end

			if arg_241_1.time_ >= var_244_10 + var_244_11 and arg_241_1.time_ < var_244_10 + var_244_11 + arg_244_0 then
				var_244_9.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_244_16 = manager.ui.mainCamera.transform.position - var_244_9.position

				var_244_9.forward = Vector3.New(var_244_16.x, var_244_16.y, var_244_16.z)

				local var_244_17 = var_244_9.localEulerAngles

				var_244_17.z = 0
				var_244_17.x = 0
				var_244_9.localEulerAngles = var_244_17
			end

			local var_244_18 = 0

			if var_244_18 < arg_241_1.time_ and arg_241_1.time_ <= var_244_18 + arg_244_0 then
				arg_241_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_244_19 = 0

			if var_244_19 < arg_241_1.time_ and arg_241_1.time_ <= var_244_19 + arg_244_0 then
				arg_241_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_244_20 = arg_241_1.actors_["1084ui_story"]
			local var_244_21 = 0

			if var_244_21 < arg_241_1.time_ and arg_241_1.time_ <= var_244_21 + arg_244_0 and arg_241_1.var_.characterEffect1084ui_story == nil then
				arg_241_1.var_.characterEffect1084ui_story = var_244_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_22 = 0.2

			if var_244_21 <= arg_241_1.time_ and arg_241_1.time_ < var_244_21 + var_244_22 then
				local var_244_23 = (arg_241_1.time_ - var_244_21) / var_244_22

				if arg_241_1.var_.characterEffect1084ui_story then
					local var_244_24 = Mathf.Lerp(0, 0.5, var_244_23)

					arg_241_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_241_1.var_.characterEffect1084ui_story.fillRatio = var_244_24
				end
			end

			if arg_241_1.time_ >= var_244_21 + var_244_22 and arg_241_1.time_ < var_244_21 + var_244_22 + arg_244_0 and arg_241_1.var_.characterEffect1084ui_story then
				local var_244_25 = 0.5

				arg_241_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_241_1.var_.characterEffect1084ui_story.fillRatio = var_244_25
			end

			local var_244_26 = arg_241_1.actors_["1075ui_story"]
			local var_244_27 = 0

			if var_244_27 < arg_241_1.time_ and arg_241_1.time_ <= var_244_27 + arg_244_0 and arg_241_1.var_.characterEffect1075ui_story == nil then
				arg_241_1.var_.characterEffect1075ui_story = var_244_26:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_244_28 = 0.2

			if var_244_27 <= arg_241_1.time_ and arg_241_1.time_ < var_244_27 + var_244_28 then
				local var_244_29 = (arg_241_1.time_ - var_244_27) / var_244_28

				if arg_241_1.var_.characterEffect1075ui_story then
					arg_241_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_241_1.time_ >= var_244_27 + var_244_28 and arg_241_1.time_ < var_244_27 + var_244_28 + arg_244_0 and arg_241_1.var_.characterEffect1075ui_story then
				arg_241_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_244_30 = 0
			local var_244_31 = 0.65

			if var_244_30 < arg_241_1.time_ and arg_241_1.time_ <= var_244_30 + arg_244_0 then
				arg_241_1.talkMaxDuration = 0
				arg_241_1.dialogCg_.alpha = 1

				arg_241_1.dialog_:SetActive(true)
				SetActive(arg_241_1.leftNameGo_, true)

				local var_244_32 = arg_241_1:FormatText(StoryNameCfg[381].name)

				arg_241_1.leftNameTxt_.text = var_244_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_241_1.leftNameTxt_.transform)

				arg_241_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_241_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_241_1:RecordName(arg_241_1.leftNameTxt_.text)
				SetActive(arg_241_1.iconTrs_.gameObject, false)
				arg_241_1.callingController_:SetSelectedState("normal")

				local var_244_33 = arg_241_1:GetWordFromCfg(120421059)
				local var_244_34 = arg_241_1:FormatText(var_244_33.content)

				arg_241_1.text_.text = var_244_34

				LuaForUtil.ClearLinePrefixSymbol(arg_241_1.text_)

				local var_244_35 = 26
				local var_244_36 = utf8.len(var_244_34)
				local var_244_37 = var_244_35 <= 0 and var_244_31 or var_244_31 * (var_244_36 / var_244_35)

				if var_244_37 > 0 and var_244_31 < var_244_37 then
					arg_241_1.talkMaxDuration = var_244_37

					if var_244_37 + var_244_30 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_37 + var_244_30
					end
				end

				arg_241_1.text_.text = var_244_34
				arg_241_1.typewritter.percent = 0

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421059", "story_v_out_120421.awb") ~= 0 then
					local var_244_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421059", "story_v_out_120421.awb") / 1000

					if var_244_38 + var_244_30 > arg_241_1.duration_ then
						arg_241_1.duration_ = var_244_38 + var_244_30
					end

					if var_244_33.prefab_name ~= "" and arg_241_1.actors_[var_244_33.prefab_name] ~= nil then
						local var_244_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_241_1.actors_[var_244_33.prefab_name].transform, "story_v_out_120421", "120421059", "story_v_out_120421.awb")

						arg_241_1:RecordAudio("120421059", var_244_39)
						arg_241_1:RecordAudio("120421059", var_244_39)
					else
						arg_241_1:AudioAction("play", "voice", "story_v_out_120421", "120421059", "story_v_out_120421.awb")
					end

					arg_241_1:RecordHistoryTalkVoice("story_v_out_120421", "120421059", "story_v_out_120421.awb")
				end

				arg_241_1:RecordContent(arg_241_1.text_.text)
			end

			local var_244_40 = math.max(var_244_31, arg_241_1.talkMaxDuration)

			if var_244_30 <= arg_241_1.time_ and arg_241_1.time_ < var_244_30 + var_244_40 then
				arg_241_1.typewritter.percent = (arg_241_1.time_ - var_244_30) / var_244_40

				arg_241_1.typewritter:SetDirty()
			end

			if arg_241_1.time_ >= var_244_30 + var_244_40 and arg_241_1.time_ < var_244_30 + var_244_40 + arg_244_0 then
				arg_241_1.typewritter.percent = 1

				arg_241_1.typewritter:SetDirty()
				arg_241_1:ShowNextGo(true)
			end
		end
	end,
	Play120421060 = function(arg_245_0, arg_245_1)
		arg_245_1.time_ = 0
		arg_245_1.frameCnt_ = 0
		arg_245_1.state_ = "playing"
		arg_245_1.curTalkId_ = 120421060
		arg_245_1.duration_ = 9.966

		local var_245_0 = {
			zh = 5.7,
			ja = 9.966
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
				arg_245_0:Play120421061(arg_245_1)
			end
		end

		function arg_245_1.onSingleLineUpdate_(arg_248_0)
			local var_248_0 = 0

			if var_248_0 < arg_245_1.time_ and arg_245_1.time_ <= var_248_0 + arg_248_0 then
				arg_245_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_248_1 = arg_245_1.actors_["1084ui_story"]
			local var_248_2 = 0

			if var_248_2 < arg_245_1.time_ and arg_245_1.time_ <= var_248_2 + arg_248_0 and arg_245_1.var_.characterEffect1084ui_story == nil then
				arg_245_1.var_.characterEffect1084ui_story = var_248_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_3 = 0.2

			if var_248_2 <= arg_245_1.time_ and arg_245_1.time_ < var_248_2 + var_248_3 then
				local var_248_4 = (arg_245_1.time_ - var_248_2) / var_248_3

				if arg_245_1.var_.characterEffect1084ui_story then
					arg_245_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_245_1.time_ >= var_248_2 + var_248_3 and arg_245_1.time_ < var_248_2 + var_248_3 + arg_248_0 and arg_245_1.var_.characterEffect1084ui_story then
				arg_245_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_248_5 = arg_245_1.actors_["1075ui_story"]
			local var_248_6 = 0

			if var_248_6 < arg_245_1.time_ and arg_245_1.time_ <= var_248_6 + arg_248_0 and arg_245_1.var_.characterEffect1075ui_story == nil then
				arg_245_1.var_.characterEffect1075ui_story = var_248_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_248_7 = 0.2

			if var_248_6 <= arg_245_1.time_ and arg_245_1.time_ < var_248_6 + var_248_7 then
				local var_248_8 = (arg_245_1.time_ - var_248_6) / var_248_7

				if arg_245_1.var_.characterEffect1075ui_story then
					local var_248_9 = Mathf.Lerp(0, 0.5, var_248_8)

					arg_245_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_245_1.var_.characterEffect1075ui_story.fillRatio = var_248_9
				end
			end

			if arg_245_1.time_ >= var_248_6 + var_248_7 and arg_245_1.time_ < var_248_6 + var_248_7 + arg_248_0 and arg_245_1.var_.characterEffect1075ui_story then
				local var_248_10 = 0.5

				arg_245_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_245_1.var_.characterEffect1075ui_story.fillRatio = var_248_10
			end

			local var_248_11 = 0

			if var_248_11 < arg_245_1.time_ and arg_245_1.time_ <= var_248_11 + arg_248_0 then
				arg_245_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_248_12 = 0
			local var_248_13 = 0.8

			if var_248_12 < arg_245_1.time_ and arg_245_1.time_ <= var_248_12 + arg_248_0 then
				arg_245_1.talkMaxDuration = 0
				arg_245_1.dialogCg_.alpha = 1

				arg_245_1.dialog_:SetActive(true)
				SetActive(arg_245_1.leftNameGo_, true)

				local var_248_14 = arg_245_1:FormatText(StoryNameCfg[6].name)

				arg_245_1.leftNameTxt_.text = var_248_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_245_1.leftNameTxt_.transform)

				arg_245_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_245_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_245_1:RecordName(arg_245_1.leftNameTxt_.text)
				SetActive(arg_245_1.iconTrs_.gameObject, false)
				arg_245_1.callingController_:SetSelectedState("normal")

				local var_248_15 = arg_245_1:GetWordFromCfg(120421060)
				local var_248_16 = arg_245_1:FormatText(var_248_15.content)

				arg_245_1.text_.text = var_248_16

				LuaForUtil.ClearLinePrefixSymbol(arg_245_1.text_)

				local var_248_17 = 32
				local var_248_18 = utf8.len(var_248_16)
				local var_248_19 = var_248_17 <= 0 and var_248_13 or var_248_13 * (var_248_18 / var_248_17)

				if var_248_19 > 0 and var_248_13 < var_248_19 then
					arg_245_1.talkMaxDuration = var_248_19

					if var_248_19 + var_248_12 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_19 + var_248_12
					end
				end

				arg_245_1.text_.text = var_248_16
				arg_245_1.typewritter.percent = 0

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421060", "story_v_out_120421.awb") ~= 0 then
					local var_248_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421060", "story_v_out_120421.awb") / 1000

					if var_248_20 + var_248_12 > arg_245_1.duration_ then
						arg_245_1.duration_ = var_248_20 + var_248_12
					end

					if var_248_15.prefab_name ~= "" and arg_245_1.actors_[var_248_15.prefab_name] ~= nil then
						local var_248_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_245_1.actors_[var_248_15.prefab_name].transform, "story_v_out_120421", "120421060", "story_v_out_120421.awb")

						arg_245_1:RecordAudio("120421060", var_248_21)
						arg_245_1:RecordAudio("120421060", var_248_21)
					else
						arg_245_1:AudioAction("play", "voice", "story_v_out_120421", "120421060", "story_v_out_120421.awb")
					end

					arg_245_1:RecordHistoryTalkVoice("story_v_out_120421", "120421060", "story_v_out_120421.awb")
				end

				arg_245_1:RecordContent(arg_245_1.text_.text)
			end

			local var_248_22 = math.max(var_248_13, arg_245_1.talkMaxDuration)

			if var_248_12 <= arg_245_1.time_ and arg_245_1.time_ < var_248_12 + var_248_22 then
				arg_245_1.typewritter.percent = (arg_245_1.time_ - var_248_12) / var_248_22

				arg_245_1.typewritter:SetDirty()
			end

			if arg_245_1.time_ >= var_248_12 + var_248_22 and arg_245_1.time_ < var_248_12 + var_248_22 + arg_248_0 then
				arg_245_1.typewritter.percent = 1

				arg_245_1.typewritter:SetDirty()
				arg_245_1:ShowNextGo(true)
			end
		end
	end,
	Play120421061 = function(arg_249_0, arg_249_1)
		arg_249_1.time_ = 0
		arg_249_1.frameCnt_ = 0
		arg_249_1.state_ = "playing"
		arg_249_1.curTalkId_ = 120421061
		arg_249_1.duration_ = 5

		SetActive(arg_249_1.tipsGo_, false)

		function arg_249_1.onSingleLineFinish_()
			arg_249_1.onSingleLineUpdate_ = nil
			arg_249_1.onSingleLineFinish_ = nil
			arg_249_1.state_ = "waiting"
		end

		function arg_249_1.playNext_(arg_251_0)
			if arg_251_0 == 1 then
				arg_249_0:Play120421062(arg_249_1)
			end
		end

		function arg_249_1.onSingleLineUpdate_(arg_252_0)
			local var_252_0 = arg_249_1.actors_["1084ui_story"]
			local var_252_1 = 0

			if var_252_1 < arg_249_1.time_ and arg_249_1.time_ <= var_252_1 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story == nil then
				arg_249_1.var_.characterEffect1084ui_story = var_252_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_252_2 = 0.2

			if var_252_1 <= arg_249_1.time_ and arg_249_1.time_ < var_252_1 + var_252_2 then
				local var_252_3 = (arg_249_1.time_ - var_252_1) / var_252_2

				if arg_249_1.var_.characterEffect1084ui_story then
					local var_252_4 = Mathf.Lerp(0, 0.5, var_252_3)

					arg_249_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_249_1.var_.characterEffect1084ui_story.fillRatio = var_252_4
				end
			end

			if arg_249_1.time_ >= var_252_1 + var_252_2 and arg_249_1.time_ < var_252_1 + var_252_2 + arg_252_0 and arg_249_1.var_.characterEffect1084ui_story then
				local var_252_5 = 0.5

				arg_249_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_249_1.var_.characterEffect1084ui_story.fillRatio = var_252_5
			end

			local var_252_6 = 0
			local var_252_7 = 0.5

			if var_252_6 < arg_249_1.time_ and arg_249_1.time_ <= var_252_6 + arg_252_0 then
				arg_249_1.talkMaxDuration = 0
				arg_249_1.dialogCg_.alpha = 1

				arg_249_1.dialog_:SetActive(true)
				SetActive(arg_249_1.leftNameGo_, true)

				local var_252_8 = arg_249_1:FormatText(StoryNameCfg[7].name)

				arg_249_1.leftNameTxt_.text = var_252_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_249_1.leftNameTxt_.transform)

				arg_249_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_249_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_249_1:RecordName(arg_249_1.leftNameTxt_.text)
				SetActive(arg_249_1.iconTrs_.gameObject, false)
				arg_249_1.callingController_:SetSelectedState("normal")

				local var_252_9 = arg_249_1:GetWordFromCfg(120421061)
				local var_252_10 = arg_249_1:FormatText(var_252_9.content)

				arg_249_1.text_.text = var_252_10

				LuaForUtil.ClearLinePrefixSymbol(arg_249_1.text_)

				local var_252_11 = 20
				local var_252_12 = utf8.len(var_252_10)
				local var_252_13 = var_252_11 <= 0 and var_252_7 or var_252_7 * (var_252_12 / var_252_11)

				if var_252_13 > 0 and var_252_7 < var_252_13 then
					arg_249_1.talkMaxDuration = var_252_13

					if var_252_13 + var_252_6 > arg_249_1.duration_ then
						arg_249_1.duration_ = var_252_13 + var_252_6
					end
				end

				arg_249_1.text_.text = var_252_10
				arg_249_1.typewritter.percent = 0

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(false)
				arg_249_1:RecordContent(arg_249_1.text_.text)
			end

			local var_252_14 = math.max(var_252_7, arg_249_1.talkMaxDuration)

			if var_252_6 <= arg_249_1.time_ and arg_249_1.time_ < var_252_6 + var_252_14 then
				arg_249_1.typewritter.percent = (arg_249_1.time_ - var_252_6) / var_252_14

				arg_249_1.typewritter:SetDirty()
			end

			if arg_249_1.time_ >= var_252_6 + var_252_14 and arg_249_1.time_ < var_252_6 + var_252_14 + arg_252_0 then
				arg_249_1.typewritter.percent = 1

				arg_249_1.typewritter:SetDirty()
				arg_249_1:ShowNextGo(true)
			end
		end
	end,
	Play120421062 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 120421062
		arg_253_1.duration_ = 15.9

		local var_253_0 = {
			zh = 12.066,
			ja = 15.9
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
				arg_253_0:Play120421063(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = arg_253_1.actors_["1075ui_story"]
			local var_256_1 = 0

			if var_256_1 < arg_253_1.time_ and arg_253_1.time_ <= var_256_1 + arg_256_0 and arg_253_1.var_.characterEffect1075ui_story == nil then
				arg_253_1.var_.characterEffect1075ui_story = var_256_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_256_2 = 0.2

			if var_256_1 <= arg_253_1.time_ and arg_253_1.time_ < var_256_1 + var_256_2 then
				local var_256_3 = (arg_253_1.time_ - var_256_1) / var_256_2

				if arg_253_1.var_.characterEffect1075ui_story then
					arg_253_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_253_1.time_ >= var_256_1 + var_256_2 and arg_253_1.time_ < var_256_1 + var_256_2 + arg_256_0 and arg_253_1.var_.characterEffect1075ui_story then
				arg_253_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_256_4 = 0
			local var_256_5 = 1.175

			if var_256_4 < arg_253_1.time_ and arg_253_1.time_ <= var_256_4 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0
				arg_253_1.dialogCg_.alpha = 1

				arg_253_1.dialog_:SetActive(true)
				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_6 = arg_253_1:FormatText(StoryNameCfg[381].name)

				arg_253_1.leftNameTxt_.text = var_256_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_7 = arg_253_1:GetWordFromCfg(120421062)
				local var_256_8 = arg_253_1:FormatText(var_256_7.content)

				arg_253_1.text_.text = var_256_8

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_9 = 47
				local var_256_10 = utf8.len(var_256_8)
				local var_256_11 = var_256_9 <= 0 and var_256_5 or var_256_5 * (var_256_10 / var_256_9)

				if var_256_11 > 0 and var_256_5 < var_256_11 then
					arg_253_1.talkMaxDuration = var_256_11

					if var_256_11 + var_256_4 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_11 + var_256_4
					end
				end

				arg_253_1.text_.text = var_256_8
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421062", "story_v_out_120421.awb") ~= 0 then
					local var_256_12 = manager.audio:GetVoiceLength("story_v_out_120421", "120421062", "story_v_out_120421.awb") / 1000

					if var_256_12 + var_256_4 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_12 + var_256_4
					end

					if var_256_7.prefab_name ~= "" and arg_253_1.actors_[var_256_7.prefab_name] ~= nil then
						local var_256_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_7.prefab_name].transform, "story_v_out_120421", "120421062", "story_v_out_120421.awb")

						arg_253_1:RecordAudio("120421062", var_256_13)
						arg_253_1:RecordAudio("120421062", var_256_13)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_120421", "120421062", "story_v_out_120421.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_120421", "120421062", "story_v_out_120421.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_14 = math.max(var_256_5, arg_253_1.talkMaxDuration)

			if var_256_4 <= arg_253_1.time_ and arg_253_1.time_ < var_256_4 + var_256_14 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_4) / var_256_14

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_4 + var_256_14 and arg_253_1.time_ < var_256_4 + var_256_14 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play120421063 = function(arg_257_0, arg_257_1)
		arg_257_1.time_ = 0
		arg_257_1.frameCnt_ = 0
		arg_257_1.state_ = "playing"
		arg_257_1.curTalkId_ = 120421063
		arg_257_1.duration_ = 10.966

		local var_257_0 = {
			zh = 7.1,
			ja = 10.966
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
				arg_257_0:Play120421064(arg_257_1)
			end
		end

		function arg_257_1.onSingleLineUpdate_(arg_260_0)
			local var_260_0 = 0
			local var_260_1 = 0.85

			if var_260_0 < arg_257_1.time_ and arg_257_1.time_ <= var_260_0 + arg_260_0 then
				arg_257_1.talkMaxDuration = 0
				arg_257_1.dialogCg_.alpha = 1

				arg_257_1.dialog_:SetActive(true)
				SetActive(arg_257_1.leftNameGo_, true)

				local var_260_2 = arg_257_1:FormatText(StoryNameCfg[381].name)

				arg_257_1.leftNameTxt_.text = var_260_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_257_1.leftNameTxt_.transform)

				arg_257_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_257_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_257_1:RecordName(arg_257_1.leftNameTxt_.text)
				SetActive(arg_257_1.iconTrs_.gameObject, false)
				arg_257_1.callingController_:SetSelectedState("normal")

				local var_260_3 = arg_257_1:GetWordFromCfg(120421063)
				local var_260_4 = arg_257_1:FormatText(var_260_3.content)

				arg_257_1.text_.text = var_260_4

				LuaForUtil.ClearLinePrefixSymbol(arg_257_1.text_)

				local var_260_5 = 34
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421063", "story_v_out_120421.awb") ~= 0 then
					local var_260_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421063", "story_v_out_120421.awb") / 1000

					if var_260_8 + var_260_0 > arg_257_1.duration_ then
						arg_257_1.duration_ = var_260_8 + var_260_0
					end

					if var_260_3.prefab_name ~= "" and arg_257_1.actors_[var_260_3.prefab_name] ~= nil then
						local var_260_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_257_1.actors_[var_260_3.prefab_name].transform, "story_v_out_120421", "120421063", "story_v_out_120421.awb")

						arg_257_1:RecordAudio("120421063", var_260_9)
						arg_257_1:RecordAudio("120421063", var_260_9)
					else
						arg_257_1:AudioAction("play", "voice", "story_v_out_120421", "120421063", "story_v_out_120421.awb")
					end

					arg_257_1:RecordHistoryTalkVoice("story_v_out_120421", "120421063", "story_v_out_120421.awb")
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
	Play120421064 = function(arg_261_0, arg_261_1)
		arg_261_1.time_ = 0
		arg_261_1.frameCnt_ = 0
		arg_261_1.state_ = "playing"
		arg_261_1.curTalkId_ = 120421064
		arg_261_1.duration_ = 8.833

		local var_261_0 = {
			zh = 5.6,
			ja = 8.833
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
				arg_261_0:Play120421065(arg_261_1)
			end
		end

		function arg_261_1.onSingleLineUpdate_(arg_264_0)
			local var_264_0 = arg_261_1.actors_["1084ui_story"]
			local var_264_1 = 0

			if var_264_1 < arg_261_1.time_ and arg_261_1.time_ <= var_264_1 + arg_264_0 and arg_261_1.var_.characterEffect1084ui_story == nil then
				arg_261_1.var_.characterEffect1084ui_story = var_264_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_2 = 0.2

			if var_264_1 <= arg_261_1.time_ and arg_261_1.time_ < var_264_1 + var_264_2 then
				local var_264_3 = (arg_261_1.time_ - var_264_1) / var_264_2

				if arg_261_1.var_.characterEffect1084ui_story then
					arg_261_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_261_1.time_ >= var_264_1 + var_264_2 and arg_261_1.time_ < var_264_1 + var_264_2 + arg_264_0 and arg_261_1.var_.characterEffect1084ui_story then
				arg_261_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_264_4 = arg_261_1.actors_["1075ui_story"]
			local var_264_5 = 0

			if var_264_5 < arg_261_1.time_ and arg_261_1.time_ <= var_264_5 + arg_264_0 and arg_261_1.var_.characterEffect1075ui_story == nil then
				arg_261_1.var_.characterEffect1075ui_story = var_264_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_264_6 = 0.2

			if var_264_5 <= arg_261_1.time_ and arg_261_1.time_ < var_264_5 + var_264_6 then
				local var_264_7 = (arg_261_1.time_ - var_264_5) / var_264_6

				if arg_261_1.var_.characterEffect1075ui_story then
					local var_264_8 = Mathf.Lerp(0, 0.5, var_264_7)

					arg_261_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_261_1.var_.characterEffect1075ui_story.fillRatio = var_264_8
				end
			end

			if arg_261_1.time_ >= var_264_5 + var_264_6 and arg_261_1.time_ < var_264_5 + var_264_6 + arg_264_0 and arg_261_1.var_.characterEffect1075ui_story then
				local var_264_9 = 0.5

				arg_261_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_261_1.var_.characterEffect1075ui_story.fillRatio = var_264_9
			end

			local var_264_10 = 0

			if var_264_10 < arg_261_1.time_ and arg_261_1.time_ <= var_264_10 + arg_264_0 then
				arg_261_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_264_11 = 0

			if var_264_11 < arg_261_1.time_ and arg_261_1.time_ <= var_264_11 + arg_264_0 then
				arg_261_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_264_12 = 0
			local var_264_13 = 0.625

			if var_264_12 < arg_261_1.time_ and arg_261_1.time_ <= var_264_12 + arg_264_0 then
				arg_261_1.talkMaxDuration = 0
				arg_261_1.dialogCg_.alpha = 1

				arg_261_1.dialog_:SetActive(true)
				SetActive(arg_261_1.leftNameGo_, true)

				local var_264_14 = arg_261_1:FormatText(StoryNameCfg[6].name)

				arg_261_1.leftNameTxt_.text = var_264_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_261_1.leftNameTxt_.transform)

				arg_261_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_261_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_261_1:RecordName(arg_261_1.leftNameTxt_.text)
				SetActive(arg_261_1.iconTrs_.gameObject, false)
				arg_261_1.callingController_:SetSelectedState("normal")

				local var_264_15 = arg_261_1:GetWordFromCfg(120421064)
				local var_264_16 = arg_261_1:FormatText(var_264_15.content)

				arg_261_1.text_.text = var_264_16

				LuaForUtil.ClearLinePrefixSymbol(arg_261_1.text_)

				local var_264_17 = 25
				local var_264_18 = utf8.len(var_264_16)
				local var_264_19 = var_264_17 <= 0 and var_264_13 or var_264_13 * (var_264_18 / var_264_17)

				if var_264_19 > 0 and var_264_13 < var_264_19 then
					arg_261_1.talkMaxDuration = var_264_19

					if var_264_19 + var_264_12 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_19 + var_264_12
					end
				end

				arg_261_1.text_.text = var_264_16
				arg_261_1.typewritter.percent = 0

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421064", "story_v_out_120421.awb") ~= 0 then
					local var_264_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421064", "story_v_out_120421.awb") / 1000

					if var_264_20 + var_264_12 > arg_261_1.duration_ then
						arg_261_1.duration_ = var_264_20 + var_264_12
					end

					if var_264_15.prefab_name ~= "" and arg_261_1.actors_[var_264_15.prefab_name] ~= nil then
						local var_264_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_261_1.actors_[var_264_15.prefab_name].transform, "story_v_out_120421", "120421064", "story_v_out_120421.awb")

						arg_261_1:RecordAudio("120421064", var_264_21)
						arg_261_1:RecordAudio("120421064", var_264_21)
					else
						arg_261_1:AudioAction("play", "voice", "story_v_out_120421", "120421064", "story_v_out_120421.awb")
					end

					arg_261_1:RecordHistoryTalkVoice("story_v_out_120421", "120421064", "story_v_out_120421.awb")
				end

				arg_261_1:RecordContent(arg_261_1.text_.text)
			end

			local var_264_22 = math.max(var_264_13, arg_261_1.talkMaxDuration)

			if var_264_12 <= arg_261_1.time_ and arg_261_1.time_ < var_264_12 + var_264_22 then
				arg_261_1.typewritter.percent = (arg_261_1.time_ - var_264_12) / var_264_22

				arg_261_1.typewritter:SetDirty()
			end

			if arg_261_1.time_ >= var_264_12 + var_264_22 and arg_261_1.time_ < var_264_12 + var_264_22 + arg_264_0 then
				arg_261_1.typewritter.percent = 1

				arg_261_1.typewritter:SetDirty()
				arg_261_1:ShowNextGo(true)
			end
		end
	end,
	Play120421065 = function(arg_265_0, arg_265_1)
		arg_265_1.time_ = 0
		arg_265_1.frameCnt_ = 0
		arg_265_1.state_ = "playing"
		arg_265_1.curTalkId_ = 120421065
		arg_265_1.duration_ = 5

		SetActive(arg_265_1.tipsGo_, false)

		function arg_265_1.onSingleLineFinish_()
			arg_265_1.onSingleLineUpdate_ = nil
			arg_265_1.onSingleLineFinish_ = nil
			arg_265_1.state_ = "waiting"
		end

		function arg_265_1.playNext_(arg_267_0)
			if arg_267_0 == 1 then
				arg_265_0:Play120421066(arg_265_1)
			end
		end

		function arg_265_1.onSingleLineUpdate_(arg_268_0)
			local var_268_0 = arg_265_1.actors_["1084ui_story"]
			local var_268_1 = 0

			if var_268_1 < arg_265_1.time_ and arg_265_1.time_ <= var_268_1 + arg_268_0 and arg_265_1.var_.characterEffect1084ui_story == nil then
				arg_265_1.var_.characterEffect1084ui_story = var_268_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_2 = 0.2

			if var_268_1 <= arg_265_1.time_ and arg_265_1.time_ < var_268_1 + var_268_2 then
				local var_268_3 = (arg_265_1.time_ - var_268_1) / var_268_2

				if arg_265_1.var_.characterEffect1084ui_story then
					local var_268_4 = Mathf.Lerp(0, 0.5, var_268_3)

					arg_265_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_265_1.var_.characterEffect1084ui_story.fillRatio = var_268_4
				end
			end

			if arg_265_1.time_ >= var_268_1 + var_268_2 and arg_265_1.time_ < var_268_1 + var_268_2 + arg_268_0 and arg_265_1.var_.characterEffect1084ui_story then
				local var_268_5 = 0.5

				arg_265_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_265_1.var_.characterEffect1084ui_story.fillRatio = var_268_5
			end

			local var_268_6 = arg_265_1.actors_["1075ui_story"]
			local var_268_7 = 0

			if var_268_7 < arg_265_1.time_ and arg_265_1.time_ <= var_268_7 + arg_268_0 and arg_265_1.var_.characterEffect1075ui_story == nil then
				arg_265_1.var_.characterEffect1075ui_story = var_268_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_268_8 = 0.2

			if var_268_7 <= arg_265_1.time_ and arg_265_1.time_ < var_268_7 + var_268_8 then
				local var_268_9 = (arg_265_1.time_ - var_268_7) / var_268_8

				if arg_265_1.var_.characterEffect1075ui_story then
					local var_268_10 = Mathf.Lerp(0, 0.5, var_268_9)

					arg_265_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_265_1.var_.characterEffect1075ui_story.fillRatio = var_268_10
				end
			end

			if arg_265_1.time_ >= var_268_7 + var_268_8 and arg_265_1.time_ < var_268_7 + var_268_8 + arg_268_0 and arg_265_1.var_.characterEffect1075ui_story then
				local var_268_11 = 0.5

				arg_265_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_265_1.var_.characterEffect1075ui_story.fillRatio = var_268_11
			end

			local var_268_12 = 0
			local var_268_13 = 0.225

			if var_268_12 < arg_265_1.time_ and arg_265_1.time_ <= var_268_12 + arg_268_0 then
				arg_265_1.talkMaxDuration = 0
				arg_265_1.dialogCg_.alpha = 1

				arg_265_1.dialog_:SetActive(true)
				SetActive(arg_265_1.leftNameGo_, true)

				local var_268_14 = arg_265_1:FormatText(StoryNameCfg[7].name)

				arg_265_1.leftNameTxt_.text = var_268_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_265_1.leftNameTxt_.transform)

				arg_265_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_265_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_265_1:RecordName(arg_265_1.leftNameTxt_.text)
				SetActive(arg_265_1.iconTrs_.gameObject, false)
				arg_265_1.callingController_:SetSelectedState("normal")

				local var_268_15 = arg_265_1:GetWordFromCfg(120421065)
				local var_268_16 = arg_265_1:FormatText(var_268_15.content)

				arg_265_1.text_.text = var_268_16

				LuaForUtil.ClearLinePrefixSymbol(arg_265_1.text_)

				local var_268_17 = 9
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
				arg_265_1:RecordContent(arg_265_1.text_.text)
			end

			local var_268_20 = math.max(var_268_13, arg_265_1.talkMaxDuration)

			if var_268_12 <= arg_265_1.time_ and arg_265_1.time_ < var_268_12 + var_268_20 then
				arg_265_1.typewritter.percent = (arg_265_1.time_ - var_268_12) / var_268_20

				arg_265_1.typewritter:SetDirty()
			end

			if arg_265_1.time_ >= var_268_12 + var_268_20 and arg_265_1.time_ < var_268_12 + var_268_20 + arg_268_0 then
				arg_265_1.typewritter.percent = 1

				arg_265_1.typewritter:SetDirty()
				arg_265_1:ShowNextGo(true)
			end
		end
	end,
	Play120421066 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 120421066
		arg_269_1.duration_ = 7.433

		local var_269_0 = {
			zh = 6.966,
			ja = 7.433
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
				arg_269_0:Play120421067(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = arg_269_1.actors_["1084ui_story"]
			local var_272_1 = 0

			if var_272_1 < arg_269_1.time_ and arg_269_1.time_ <= var_272_1 + arg_272_0 and arg_269_1.var_.characterEffect1084ui_story == nil then
				arg_269_1.var_.characterEffect1084ui_story = var_272_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_2 = 0.2

			if var_272_1 <= arg_269_1.time_ and arg_269_1.time_ < var_272_1 + var_272_2 then
				local var_272_3 = (arg_269_1.time_ - var_272_1) / var_272_2

				if arg_269_1.var_.characterEffect1084ui_story then
					local var_272_4 = Mathf.Lerp(0, 0.5, var_272_3)

					arg_269_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_269_1.var_.characterEffect1084ui_story.fillRatio = var_272_4
				end
			end

			if arg_269_1.time_ >= var_272_1 + var_272_2 and arg_269_1.time_ < var_272_1 + var_272_2 + arg_272_0 and arg_269_1.var_.characterEffect1084ui_story then
				local var_272_5 = 0.5

				arg_269_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_269_1.var_.characterEffect1084ui_story.fillRatio = var_272_5
			end

			local var_272_6 = arg_269_1.actors_["1075ui_story"]
			local var_272_7 = 0

			if var_272_7 < arg_269_1.time_ and arg_269_1.time_ <= var_272_7 + arg_272_0 and arg_269_1.var_.characterEffect1075ui_story == nil then
				arg_269_1.var_.characterEffect1075ui_story = var_272_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_272_8 = 0.2

			if var_272_7 <= arg_269_1.time_ and arg_269_1.time_ < var_272_7 + var_272_8 then
				local var_272_9 = (arg_269_1.time_ - var_272_7) / var_272_8

				if arg_269_1.var_.characterEffect1075ui_story then
					arg_269_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_269_1.time_ >= var_272_7 + var_272_8 and arg_269_1.time_ < var_272_7 + var_272_8 + arg_272_0 and arg_269_1.var_.characterEffect1075ui_story then
				arg_269_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_272_10 = 0

			if var_272_10 < arg_269_1.time_ and arg_269_1.time_ <= var_272_10 + arg_272_0 then
				arg_269_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_272_11 = 0

			if var_272_11 < arg_269_1.time_ and arg_269_1.time_ <= var_272_11 + arg_272_0 then
				arg_269_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_272_12 = 0
			local var_272_13 = 0.75

			if var_272_12 < arg_269_1.time_ and arg_269_1.time_ <= var_272_12 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_14 = arg_269_1:FormatText(StoryNameCfg[381].name)

				arg_269_1.leftNameTxt_.text = var_272_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_15 = arg_269_1:GetWordFromCfg(120421066)
				local var_272_16 = arg_269_1:FormatText(var_272_15.content)

				arg_269_1.text_.text = var_272_16

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_17 = 30
				local var_272_18 = utf8.len(var_272_16)
				local var_272_19 = var_272_17 <= 0 and var_272_13 or var_272_13 * (var_272_18 / var_272_17)

				if var_272_19 > 0 and var_272_13 < var_272_19 then
					arg_269_1.talkMaxDuration = var_272_19

					if var_272_19 + var_272_12 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_19 + var_272_12
					end
				end

				arg_269_1.text_.text = var_272_16
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421066", "story_v_out_120421.awb") ~= 0 then
					local var_272_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421066", "story_v_out_120421.awb") / 1000

					if var_272_20 + var_272_12 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_20 + var_272_12
					end

					if var_272_15.prefab_name ~= "" and arg_269_1.actors_[var_272_15.prefab_name] ~= nil then
						local var_272_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_15.prefab_name].transform, "story_v_out_120421", "120421066", "story_v_out_120421.awb")

						arg_269_1:RecordAudio("120421066", var_272_21)
						arg_269_1:RecordAudio("120421066", var_272_21)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_120421", "120421066", "story_v_out_120421.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_120421", "120421066", "story_v_out_120421.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_22 = math.max(var_272_13, arg_269_1.talkMaxDuration)

			if var_272_12 <= arg_269_1.time_ and arg_269_1.time_ < var_272_12 + var_272_22 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_12) / var_272_22

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_12 + var_272_22 and arg_269_1.time_ < var_272_12 + var_272_22 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play120421067 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 120421067
		arg_273_1.duration_ = 11.8

		local var_273_0 = {
			zh = 9.9,
			ja = 11.8
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
				arg_273_0:Play120421068(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 1.225

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[381].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(120421067)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 49
				local var_276_6 = utf8.len(var_276_4)
				local var_276_7 = var_276_5 <= 0 and var_276_1 or var_276_1 * (var_276_6 / var_276_5)

				if var_276_7 > 0 and var_276_1 < var_276_7 then
					arg_273_1.talkMaxDuration = var_276_7

					if var_276_7 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_7 + var_276_0
					end
				end

				arg_273_1.text_.text = var_276_4
				arg_273_1.typewritter.percent = 0

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421067", "story_v_out_120421.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421067", "story_v_out_120421.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_120421", "120421067", "story_v_out_120421.awb")

						arg_273_1:RecordAudio("120421067", var_276_9)
						arg_273_1:RecordAudio("120421067", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_120421", "120421067", "story_v_out_120421.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_120421", "120421067", "story_v_out_120421.awb")
				end

				arg_273_1:RecordContent(arg_273_1.text_.text)
			end

			local var_276_10 = math.max(var_276_1, arg_273_1.talkMaxDuration)

			if var_276_0 <= arg_273_1.time_ and arg_273_1.time_ < var_276_0 + var_276_10 then
				arg_273_1.typewritter.percent = (arg_273_1.time_ - var_276_0) / var_276_10

				arg_273_1.typewritter:SetDirty()
			end

			if arg_273_1.time_ >= var_276_0 + var_276_10 and arg_273_1.time_ < var_276_0 + var_276_10 + arg_276_0 then
				arg_273_1.typewritter.percent = 1

				arg_273_1.typewritter:SetDirty()
				arg_273_1:ShowNextGo(true)
			end
		end
	end,
	Play120421068 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 120421068
		arg_277_1.duration_ = 5

		SetActive(arg_277_1.tipsGo_, false)

		function arg_277_1.onSingleLineFinish_()
			arg_277_1.onSingleLineUpdate_ = nil
			arg_277_1.onSingleLineFinish_ = nil
			arg_277_1.state_ = "waiting"
		end

		function arg_277_1.playNext_(arg_279_0)
			if arg_279_0 == 1 then
				arg_277_0:Play120421069(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = arg_277_1.actors_["1075ui_story"]
			local var_280_1 = 0

			if var_280_1 < arg_277_1.time_ and arg_277_1.time_ <= var_280_1 + arg_280_0 and arg_277_1.var_.characterEffect1075ui_story == nil then
				arg_277_1.var_.characterEffect1075ui_story = var_280_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_280_2 = 0.2

			if var_280_1 <= arg_277_1.time_ and arg_277_1.time_ < var_280_1 + var_280_2 then
				local var_280_3 = (arg_277_1.time_ - var_280_1) / var_280_2

				if arg_277_1.var_.characterEffect1075ui_story then
					local var_280_4 = Mathf.Lerp(0, 0.5, var_280_3)

					arg_277_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_277_1.var_.characterEffect1075ui_story.fillRatio = var_280_4
				end
			end

			if arg_277_1.time_ >= var_280_1 + var_280_2 and arg_277_1.time_ < var_280_1 + var_280_2 + arg_280_0 and arg_277_1.var_.characterEffect1075ui_story then
				local var_280_5 = 0.5

				arg_277_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_277_1.var_.characterEffect1075ui_story.fillRatio = var_280_5
			end

			local var_280_6 = 0
			local var_280_7 = 0.475

			if var_280_6 < arg_277_1.time_ and arg_277_1.time_ <= var_280_6 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_8 = arg_277_1:FormatText(StoryNameCfg[7].name)

				arg_277_1.leftNameTxt_.text = var_280_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_9 = arg_277_1:GetWordFromCfg(120421068)
				local var_280_10 = arg_277_1:FormatText(var_280_9.content)

				arg_277_1.text_.text = var_280_10

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_11 = 19
				local var_280_12 = utf8.len(var_280_10)
				local var_280_13 = var_280_11 <= 0 and var_280_7 or var_280_7 * (var_280_12 / var_280_11)

				if var_280_13 > 0 and var_280_7 < var_280_13 then
					arg_277_1.talkMaxDuration = var_280_13

					if var_280_13 + var_280_6 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_13 + var_280_6
					end
				end

				arg_277_1.text_.text = var_280_10
				arg_277_1.typewritter.percent = 0

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(false)
				arg_277_1:RecordContent(arg_277_1.text_.text)
			end

			local var_280_14 = math.max(var_280_7, arg_277_1.talkMaxDuration)

			if var_280_6 <= arg_277_1.time_ and arg_277_1.time_ < var_280_6 + var_280_14 then
				arg_277_1.typewritter.percent = (arg_277_1.time_ - var_280_6) / var_280_14

				arg_277_1.typewritter:SetDirty()
			end

			if arg_277_1.time_ >= var_280_6 + var_280_14 and arg_277_1.time_ < var_280_6 + var_280_14 + arg_280_0 then
				arg_277_1.typewritter.percent = 1

				arg_277_1.typewritter:SetDirty()
				arg_277_1:ShowNextGo(true)
			end
		end
	end,
	Play120421069 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 120421069
		arg_281_1.duration_ = 4.3

		local var_281_0 = {
			zh = 2.466,
			ja = 4.3
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
				arg_281_0:Play120421070(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = arg_281_1.actors_["1075ui_story"]
			local var_284_1 = 0

			if var_284_1 < arg_281_1.time_ and arg_281_1.time_ <= var_284_1 + arg_284_0 and arg_281_1.var_.characterEffect1075ui_story == nil then
				arg_281_1.var_.characterEffect1075ui_story = var_284_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_284_2 = 0.2

			if var_284_1 <= arg_281_1.time_ and arg_281_1.time_ < var_284_1 + var_284_2 then
				local var_284_3 = (arg_281_1.time_ - var_284_1) / var_284_2

				if arg_281_1.var_.characterEffect1075ui_story then
					arg_281_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_281_1.time_ >= var_284_1 + var_284_2 and arg_281_1.time_ < var_284_1 + var_284_2 + arg_284_0 and arg_281_1.var_.characterEffect1075ui_story then
				arg_281_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_284_4 = 0
			local var_284_5 = 0.25

			if var_284_4 < arg_281_1.time_ and arg_281_1.time_ <= var_284_4 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_6 = arg_281_1:FormatText(StoryNameCfg[381].name)

				arg_281_1.leftNameTxt_.text = var_284_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_7 = arg_281_1:GetWordFromCfg(120421069)
				local var_284_8 = arg_281_1:FormatText(var_284_7.content)

				arg_281_1.text_.text = var_284_8

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_9 = 10
				local var_284_10 = utf8.len(var_284_8)
				local var_284_11 = var_284_9 <= 0 and var_284_5 or var_284_5 * (var_284_10 / var_284_9)

				if var_284_11 > 0 and var_284_5 < var_284_11 then
					arg_281_1.talkMaxDuration = var_284_11

					if var_284_11 + var_284_4 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_11 + var_284_4
					end
				end

				arg_281_1.text_.text = var_284_8
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421069", "story_v_out_120421.awb") ~= 0 then
					local var_284_12 = manager.audio:GetVoiceLength("story_v_out_120421", "120421069", "story_v_out_120421.awb") / 1000

					if var_284_12 + var_284_4 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_12 + var_284_4
					end

					if var_284_7.prefab_name ~= "" and arg_281_1.actors_[var_284_7.prefab_name] ~= nil then
						local var_284_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_7.prefab_name].transform, "story_v_out_120421", "120421069", "story_v_out_120421.awb")

						arg_281_1:RecordAudio("120421069", var_284_13)
						arg_281_1:RecordAudio("120421069", var_284_13)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_120421", "120421069", "story_v_out_120421.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_120421", "120421069", "story_v_out_120421.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_14 = math.max(var_284_5, arg_281_1.talkMaxDuration)

			if var_284_4 <= arg_281_1.time_ and arg_281_1.time_ < var_284_4 + var_284_14 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_4) / var_284_14

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_4 + var_284_14 and arg_281_1.time_ < var_284_4 + var_284_14 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play120421070 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 120421070
		arg_285_1.duration_ = 9

		SetActive(arg_285_1.tipsGo_, false)

		function arg_285_1.onSingleLineFinish_()
			arg_285_1.onSingleLineUpdate_ = nil
			arg_285_1.onSingleLineFinish_ = nil
			arg_285_1.state_ = "waiting"
		end

		function arg_285_1.playNext_(arg_287_0)
			if arg_287_0 == 1 then
				arg_285_0:Play120421071(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = "ST31"

			if arg_285_1.bgs_[var_288_0] == nil then
				local var_288_1 = Object.Instantiate(arg_285_1.paintGo_)

				var_288_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_288_0)
				var_288_1.name = var_288_0
				var_288_1.transform.parent = arg_285_1.stage_.transform
				var_288_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_285_1.bgs_[var_288_0] = var_288_1
			end

			local var_288_2 = 2

			if var_288_2 < arg_285_1.time_ and arg_285_1.time_ <= var_288_2 + arg_288_0 then
				local var_288_3 = manager.ui.mainCamera.transform.localPosition
				local var_288_4 = Vector3.New(0, 0, 10) + Vector3.New(var_288_3.x, var_288_3.y, 0)
				local var_288_5 = arg_285_1.bgs_.ST31

				var_288_5.transform.localPosition = var_288_4
				var_288_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_288_6 = var_288_5:GetComponent("SpriteRenderer")

				if var_288_6 and var_288_6.sprite then
					local var_288_7 = (var_288_5.transform.localPosition - var_288_3).z
					local var_288_8 = manager.ui.mainCameraCom_
					local var_288_9 = 2 * var_288_7 * Mathf.Tan(var_288_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_288_10 = var_288_9 * var_288_8.aspect
					local var_288_11 = var_288_6.sprite.bounds.size.x
					local var_288_12 = var_288_6.sprite.bounds.size.y
					local var_288_13 = var_288_10 / var_288_11
					local var_288_14 = var_288_9 / var_288_12
					local var_288_15 = var_288_14 < var_288_13 and var_288_13 or var_288_14

					var_288_5.transform.localScale = Vector3.New(var_288_15, var_288_15, 0)
				end

				for iter_288_0, iter_288_1 in pairs(arg_285_1.bgs_) do
					if iter_288_0 ~= "ST31" then
						iter_288_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_288_16 = 0

			if var_288_16 < arg_285_1.time_ and arg_285_1.time_ <= var_288_16 + arg_288_0 then
				arg_285_1.mask_.enabled = true
				arg_285_1.mask_.raycastTarget = true

				arg_285_1:SetGaussion(false)
			end

			local var_288_17 = 2

			if var_288_16 <= arg_285_1.time_ and arg_285_1.time_ < var_288_16 + var_288_17 then
				local var_288_18 = (arg_285_1.time_ - var_288_16) / var_288_17
				local var_288_19 = Color.New(0, 0, 0)

				var_288_19.a = Mathf.Lerp(0, 1, var_288_18)
				arg_285_1.mask_.color = var_288_19
			end

			if arg_285_1.time_ >= var_288_16 + var_288_17 and arg_285_1.time_ < var_288_16 + var_288_17 + arg_288_0 then
				local var_288_20 = Color.New(0, 0, 0)

				var_288_20.a = 1
				arg_285_1.mask_.color = var_288_20
			end

			local var_288_21 = 2

			if var_288_21 < arg_285_1.time_ and arg_285_1.time_ <= var_288_21 + arg_288_0 then
				arg_285_1.mask_.enabled = true
				arg_285_1.mask_.raycastTarget = true

				arg_285_1:SetGaussion(false)
			end

			local var_288_22 = 2

			if var_288_21 <= arg_285_1.time_ and arg_285_1.time_ < var_288_21 + var_288_22 then
				local var_288_23 = (arg_285_1.time_ - var_288_21) / var_288_22
				local var_288_24 = Color.New(0, 0, 0)

				var_288_24.a = Mathf.Lerp(1, 0, var_288_23)
				arg_285_1.mask_.color = var_288_24
			end

			if arg_285_1.time_ >= var_288_21 + var_288_22 and arg_285_1.time_ < var_288_21 + var_288_22 + arg_288_0 then
				local var_288_25 = Color.New(0, 0, 0)
				local var_288_26 = 0

				arg_285_1.mask_.enabled = false
				var_288_25.a = var_288_26
				arg_285_1.mask_.color = var_288_25
			end

			local var_288_27 = 2
			local var_288_28 = 1

			if var_288_27 < arg_285_1.time_ and arg_285_1.time_ <= var_288_27 + arg_288_0 then
				local var_288_29 = "play"
				local var_288_30 = "effect"

				arg_285_1:AudioAction(var_288_29, var_288_30, "se_story_1", "se_story_1_count", "")
			end

			local var_288_31 = arg_285_1.actors_["1075ui_story"].transform
			local var_288_32 = 1.966

			if var_288_32 < arg_285_1.time_ and arg_285_1.time_ <= var_288_32 + arg_288_0 then
				arg_285_1.var_.moveOldPos1075ui_story = var_288_31.localPosition
			end

			local var_288_33 = 0.001

			if var_288_32 <= arg_285_1.time_ and arg_285_1.time_ < var_288_32 + var_288_33 then
				local var_288_34 = (arg_285_1.time_ - var_288_32) / var_288_33
				local var_288_35 = Vector3.New(0, 100, 0)

				var_288_31.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1075ui_story, var_288_35, var_288_34)

				local var_288_36 = manager.ui.mainCamera.transform.position - var_288_31.position

				var_288_31.forward = Vector3.New(var_288_36.x, var_288_36.y, var_288_36.z)

				local var_288_37 = var_288_31.localEulerAngles

				var_288_37.z = 0
				var_288_37.x = 0
				var_288_31.localEulerAngles = var_288_37
			end

			if arg_285_1.time_ >= var_288_32 + var_288_33 and arg_285_1.time_ < var_288_32 + var_288_33 + arg_288_0 then
				var_288_31.localPosition = Vector3.New(0, 100, 0)

				local var_288_38 = manager.ui.mainCamera.transform.position - var_288_31.position

				var_288_31.forward = Vector3.New(var_288_38.x, var_288_38.y, var_288_38.z)

				local var_288_39 = var_288_31.localEulerAngles

				var_288_39.z = 0
				var_288_39.x = 0
				var_288_31.localEulerAngles = var_288_39
			end

			local var_288_40 = arg_285_1.actors_["1084ui_story"].transform
			local var_288_41 = 1.966

			if var_288_41 < arg_285_1.time_ and arg_285_1.time_ <= var_288_41 + arg_288_0 then
				arg_285_1.var_.moveOldPos1084ui_story = var_288_40.localPosition
			end

			local var_288_42 = 0.001

			if var_288_41 <= arg_285_1.time_ and arg_285_1.time_ < var_288_41 + var_288_42 then
				local var_288_43 = (arg_285_1.time_ - var_288_41) / var_288_42
				local var_288_44 = Vector3.New(0, 100, 0)

				var_288_40.localPosition = Vector3.Lerp(arg_285_1.var_.moveOldPos1084ui_story, var_288_44, var_288_43)

				local var_288_45 = manager.ui.mainCamera.transform.position - var_288_40.position

				var_288_40.forward = Vector3.New(var_288_45.x, var_288_45.y, var_288_45.z)

				local var_288_46 = var_288_40.localEulerAngles

				var_288_46.z = 0
				var_288_46.x = 0
				var_288_40.localEulerAngles = var_288_46
			end

			if arg_285_1.time_ >= var_288_41 + var_288_42 and arg_285_1.time_ < var_288_41 + var_288_42 + arg_288_0 then
				var_288_40.localPosition = Vector3.New(0, 100, 0)

				local var_288_47 = manager.ui.mainCamera.transform.position - var_288_40.position

				var_288_40.forward = Vector3.New(var_288_47.x, var_288_47.y, var_288_47.z)

				local var_288_48 = var_288_40.localEulerAngles

				var_288_48.z = 0
				var_288_48.x = 0
				var_288_40.localEulerAngles = var_288_48
			end

			if arg_285_1.frameCnt_ <= 1 then
				arg_285_1.dialog_:SetActive(false)
			end

			local var_288_49 = 4
			local var_288_50 = 0.05

			if var_288_49 < arg_285_1.time_ and arg_285_1.time_ <= var_288_49 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0

				arg_285_1.dialog_:SetActive(true)

				local var_288_51 = LeanTween.value(arg_285_1.dialog_, 0, 1, 0.3)

				var_288_51:setOnUpdate(LuaHelper.FloatAction(function(arg_289_0)
					arg_285_1.dialogCg_.alpha = arg_289_0
				end))
				var_288_51:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_285_1.dialog_)
					var_288_51:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_285_1.duration_ = arg_285_1.duration_ + 0.3

				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_52 = arg_285_1:FormatText(StoryNameCfg[36].name)

				arg_285_1.leftNameTxt_.text = var_288_52

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, true)
				arg_285_1.iconController_:SetSelectedState("hero")

				arg_285_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1074")

				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_53 = arg_285_1:GetWordFromCfg(120421070)
				local var_288_54 = arg_285_1:FormatText(var_288_53.content)

				arg_285_1.text_.text = var_288_54

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_55 = 2
				local var_288_56 = utf8.len(var_288_54)
				local var_288_57 = var_288_55 <= 0 and var_288_50 or var_288_50 * (var_288_56 / var_288_55)

				if var_288_57 > 0 and var_288_50 < var_288_57 then
					arg_285_1.talkMaxDuration = var_288_57
					var_288_49 = var_288_49 + 0.3

					if var_288_57 + var_288_49 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_57 + var_288_49
					end
				end

				arg_285_1.text_.text = var_288_54
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)
				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_58 = var_288_49 + 0.3
			local var_288_59 = math.max(var_288_50, arg_285_1.talkMaxDuration)

			if var_288_58 <= arg_285_1.time_ and arg_285_1.time_ < var_288_58 + var_288_59 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_58) / var_288_59

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_58 + var_288_59 and arg_285_1.time_ < var_288_58 + var_288_59 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play120421071 = function(arg_291_0, arg_291_1)
		arg_291_1.time_ = 0
		arg_291_1.frameCnt_ = 0
		arg_291_1.state_ = "playing"
		arg_291_1.curTalkId_ = 120421071
		arg_291_1.duration_ = 5

		SetActive(arg_291_1.tipsGo_, false)

		function arg_291_1.onSingleLineFinish_()
			arg_291_1.onSingleLineUpdate_ = nil
			arg_291_1.onSingleLineFinish_ = nil
			arg_291_1.state_ = "waiting"
		end

		function arg_291_1.playNext_(arg_293_0)
			if arg_293_0 == 1 then
				arg_291_0:Play120421072(arg_291_1)
			end
		end

		function arg_291_1.onSingleLineUpdate_(arg_294_0)
			local var_294_0 = 0
			local var_294_1 = 0.125

			if var_294_0 < arg_291_1.time_ and arg_291_1.time_ <= var_294_0 + arg_294_0 then
				arg_291_1.talkMaxDuration = 0
				arg_291_1.dialogCg_.alpha = 1

				arg_291_1.dialog_:SetActive(true)
				SetActive(arg_291_1.leftNameGo_, false)

				arg_291_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_291_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_291_1:RecordName(arg_291_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_291_1.iconTrs_.gameObject, false)
				arg_291_1.callingController_:SetSelectedState("normal")

				local var_294_2 = arg_291_1:GetWordFromCfg(120421071)
				local var_294_3 = arg_291_1:FormatText(var_294_2.content)

				arg_291_1.text_.text = var_294_3

				LuaForUtil.ClearLinePrefixSymbol(arg_291_1.text_)

				local var_294_4 = 5
				local var_294_5 = utf8.len(var_294_3)
				local var_294_6 = var_294_4 <= 0 and var_294_1 or var_294_1 * (var_294_5 / var_294_4)

				if var_294_6 > 0 and var_294_1 < var_294_6 then
					arg_291_1.talkMaxDuration = var_294_6

					if var_294_6 + var_294_0 > arg_291_1.duration_ then
						arg_291_1.duration_ = var_294_6 + var_294_0
					end
				end

				arg_291_1.text_.text = var_294_3
				arg_291_1.typewritter.percent = 0

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(false)
				arg_291_1:RecordContent(arg_291_1.text_.text)
			end

			local var_294_7 = math.max(var_294_1, arg_291_1.talkMaxDuration)

			if var_294_0 <= arg_291_1.time_ and arg_291_1.time_ < var_294_0 + var_294_7 then
				arg_291_1.typewritter.percent = (arg_291_1.time_ - var_294_0) / var_294_7

				arg_291_1.typewritter:SetDirty()
			end

			if arg_291_1.time_ >= var_294_0 + var_294_7 and arg_291_1.time_ < var_294_0 + var_294_7 + arg_294_0 then
				arg_291_1.typewritter.percent = 1

				arg_291_1.typewritter:SetDirty()
				arg_291_1:ShowNextGo(true)
			end
		end
	end,
	Play120421072 = function(arg_295_0, arg_295_1)
		arg_295_1.time_ = 0
		arg_295_1.frameCnt_ = 0
		arg_295_1.state_ = "playing"
		arg_295_1.curTalkId_ = 120421072
		arg_295_1.duration_ = 8.066

		local var_295_0 = {
			zh = 8.066,
			ja = 7.166
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
				arg_295_0:Play120421073(arg_295_1)
			end
		end

		function arg_295_1.onSingleLineUpdate_(arg_298_0)
			local var_298_0 = "1074ui_story"

			if arg_295_1.actors_[var_298_0] == nil then
				local var_298_1 = Object.Instantiate(Asset.Load("Char/" .. var_298_0), arg_295_1.stage_.transform)

				var_298_1.name = var_298_0
				var_298_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_295_1.actors_[var_298_0] = var_298_1

				local var_298_2 = var_298_1:GetComponentInChildren(typeof(CharacterEffect))

				var_298_2.enabled = true

				local var_298_3 = GameObjectTools.GetOrAddComponent(var_298_1, typeof(DynamicBoneHelper))

				if var_298_3 then
					var_298_3:EnableDynamicBone(false)
				end

				arg_295_1:ShowWeapon(var_298_2.transform, false)

				arg_295_1.var_[var_298_0 .. "Animator"] = var_298_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_295_1.var_[var_298_0 .. "Animator"].applyRootMotion = true
				arg_295_1.var_[var_298_0 .. "LipSync"] = var_298_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_298_4 = arg_295_1.actors_["1074ui_story"].transform
			local var_298_5 = 0

			if var_298_5 < arg_295_1.time_ and arg_295_1.time_ <= var_298_5 + arg_298_0 then
				arg_295_1.var_.moveOldPos1074ui_story = var_298_4.localPosition
			end

			local var_298_6 = 0.001

			if var_298_5 <= arg_295_1.time_ and arg_295_1.time_ < var_298_5 + var_298_6 then
				local var_298_7 = (arg_295_1.time_ - var_298_5) / var_298_6
				local var_298_8 = Vector3.New(0, -1.055, -6.12)

				var_298_4.localPosition = Vector3.Lerp(arg_295_1.var_.moveOldPos1074ui_story, var_298_8, var_298_7)

				local var_298_9 = manager.ui.mainCamera.transform.position - var_298_4.position

				var_298_4.forward = Vector3.New(var_298_9.x, var_298_9.y, var_298_9.z)

				local var_298_10 = var_298_4.localEulerAngles

				var_298_10.z = 0
				var_298_10.x = 0
				var_298_4.localEulerAngles = var_298_10
			end

			if arg_295_1.time_ >= var_298_5 + var_298_6 and arg_295_1.time_ < var_298_5 + var_298_6 + arg_298_0 then
				var_298_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_298_11 = manager.ui.mainCamera.transform.position - var_298_4.position

				var_298_4.forward = Vector3.New(var_298_11.x, var_298_11.y, var_298_11.z)

				local var_298_12 = var_298_4.localEulerAngles

				var_298_12.z = 0
				var_298_12.x = 0
				var_298_4.localEulerAngles = var_298_12
			end

			local var_298_13 = 0

			if var_298_13 < arg_295_1.time_ and arg_295_1.time_ <= var_298_13 + arg_298_0 then
				arg_295_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_298_14 = 0

			if var_298_14 < arg_295_1.time_ and arg_295_1.time_ <= var_298_14 + arg_298_0 then
				arg_295_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_298_15 = arg_295_1.actors_["1074ui_story"]
			local var_298_16 = 0

			if var_298_16 < arg_295_1.time_ and arg_295_1.time_ <= var_298_16 + arg_298_0 and arg_295_1.var_.characterEffect1074ui_story == nil then
				arg_295_1.var_.characterEffect1074ui_story = var_298_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_298_17 = 0.2

			if var_298_16 <= arg_295_1.time_ and arg_295_1.time_ < var_298_16 + var_298_17 then
				local var_298_18 = (arg_295_1.time_ - var_298_16) / var_298_17

				if arg_295_1.var_.characterEffect1074ui_story then
					arg_295_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_295_1.time_ >= var_298_16 + var_298_17 and arg_295_1.time_ < var_298_16 + var_298_17 + arg_298_0 and arg_295_1.var_.characterEffect1074ui_story then
				arg_295_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_298_19 = 0
			local var_298_20 = 0.6

			if var_298_19 < arg_295_1.time_ and arg_295_1.time_ <= var_298_19 + arg_298_0 then
				arg_295_1.talkMaxDuration = 0
				arg_295_1.dialogCg_.alpha = 1

				arg_295_1.dialog_:SetActive(true)
				SetActive(arg_295_1.leftNameGo_, true)

				local var_298_21 = arg_295_1:FormatText(StoryNameCfg[36].name)

				arg_295_1.leftNameTxt_.text = var_298_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_295_1.leftNameTxt_.transform)

				arg_295_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_295_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_295_1:RecordName(arg_295_1.leftNameTxt_.text)
				SetActive(arg_295_1.iconTrs_.gameObject, false)
				arg_295_1.callingController_:SetSelectedState("normal")

				local var_298_22 = arg_295_1:GetWordFromCfg(120421072)
				local var_298_23 = arg_295_1:FormatText(var_298_22.content)

				arg_295_1.text_.text = var_298_23

				LuaForUtil.ClearLinePrefixSymbol(arg_295_1.text_)

				local var_298_24 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421072", "story_v_out_120421.awb") ~= 0 then
					local var_298_27 = manager.audio:GetVoiceLength("story_v_out_120421", "120421072", "story_v_out_120421.awb") / 1000

					if var_298_27 + var_298_19 > arg_295_1.duration_ then
						arg_295_1.duration_ = var_298_27 + var_298_19
					end

					if var_298_22.prefab_name ~= "" and arg_295_1.actors_[var_298_22.prefab_name] ~= nil then
						local var_298_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_295_1.actors_[var_298_22.prefab_name].transform, "story_v_out_120421", "120421072", "story_v_out_120421.awb")

						arg_295_1:RecordAudio("120421072", var_298_28)
						arg_295_1:RecordAudio("120421072", var_298_28)
					else
						arg_295_1:AudioAction("play", "voice", "story_v_out_120421", "120421072", "story_v_out_120421.awb")
					end

					arg_295_1:RecordHistoryTalkVoice("story_v_out_120421", "120421072", "story_v_out_120421.awb")
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
	Play120421073 = function(arg_299_0, arg_299_1)
		arg_299_1.time_ = 0
		arg_299_1.frameCnt_ = 0
		arg_299_1.state_ = "playing"
		arg_299_1.curTalkId_ = 120421073
		arg_299_1.duration_ = 5

		SetActive(arg_299_1.tipsGo_, false)

		function arg_299_1.onSingleLineFinish_()
			arg_299_1.onSingleLineUpdate_ = nil
			arg_299_1.onSingleLineFinish_ = nil
			arg_299_1.state_ = "waiting"
		end

		function arg_299_1.playNext_(arg_301_0)
			if arg_301_0 == 1 then
				arg_299_0:Play120421074(arg_299_1)
			end
		end

		function arg_299_1.onSingleLineUpdate_(arg_302_0)
			local var_302_0 = arg_299_1.actors_["1074ui_story"]
			local var_302_1 = 0

			if var_302_1 < arg_299_1.time_ and arg_299_1.time_ <= var_302_1 + arg_302_0 and arg_299_1.var_.characterEffect1074ui_story == nil then
				arg_299_1.var_.characterEffect1074ui_story = var_302_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_302_2 = 0.2

			if var_302_1 <= arg_299_1.time_ and arg_299_1.time_ < var_302_1 + var_302_2 then
				local var_302_3 = (arg_299_1.time_ - var_302_1) / var_302_2

				if arg_299_1.var_.characterEffect1074ui_story then
					local var_302_4 = Mathf.Lerp(0, 0.5, var_302_3)

					arg_299_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_299_1.var_.characterEffect1074ui_story.fillRatio = var_302_4
				end
			end

			if arg_299_1.time_ >= var_302_1 + var_302_2 and arg_299_1.time_ < var_302_1 + var_302_2 + arg_302_0 and arg_299_1.var_.characterEffect1074ui_story then
				local var_302_5 = 0.5

				arg_299_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_299_1.var_.characterEffect1074ui_story.fillRatio = var_302_5
			end

			local var_302_6 = 0

			if var_302_6 < arg_299_1.time_ and arg_299_1.time_ <= var_302_6 + arg_302_0 then
				arg_299_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_1")
			end

			local var_302_7 = 0
			local var_302_8 = 1.025

			if var_302_7 < arg_299_1.time_ and arg_299_1.time_ <= var_302_7 + arg_302_0 then
				arg_299_1.talkMaxDuration = 0
				arg_299_1.dialogCg_.alpha = 1

				arg_299_1.dialog_:SetActive(true)
				SetActive(arg_299_1.leftNameGo_, false)

				arg_299_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_299_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_299_1:RecordName(arg_299_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_299_1.iconTrs_.gameObject, false)
				arg_299_1.callingController_:SetSelectedState("normal")

				local var_302_9 = arg_299_1:GetWordFromCfg(120421073)
				local var_302_10 = arg_299_1:FormatText(var_302_9.content)

				arg_299_1.text_.text = var_302_10

				LuaForUtil.ClearLinePrefixSymbol(arg_299_1.text_)

				local var_302_11 = 38
				local var_302_12 = utf8.len(var_302_10)
				local var_302_13 = var_302_11 <= 0 and var_302_8 or var_302_8 * (var_302_12 / var_302_11)

				if var_302_13 > 0 and var_302_8 < var_302_13 then
					arg_299_1.talkMaxDuration = var_302_13

					if var_302_13 + var_302_7 > arg_299_1.duration_ then
						arg_299_1.duration_ = var_302_13 + var_302_7
					end
				end

				arg_299_1.text_.text = var_302_10
				arg_299_1.typewritter.percent = 0

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(false)
				arg_299_1:RecordContent(arg_299_1.text_.text)
			end

			local var_302_14 = math.max(var_302_8, arg_299_1.talkMaxDuration)

			if var_302_7 <= arg_299_1.time_ and arg_299_1.time_ < var_302_7 + var_302_14 then
				arg_299_1.typewritter.percent = (arg_299_1.time_ - var_302_7) / var_302_14

				arg_299_1.typewritter:SetDirty()
			end

			if arg_299_1.time_ >= var_302_7 + var_302_14 and arg_299_1.time_ < var_302_7 + var_302_14 + arg_302_0 then
				arg_299_1.typewritter.percent = 1

				arg_299_1.typewritter:SetDirty()
				arg_299_1:ShowNextGo(true)
			end
		end
	end,
	Play120421074 = function(arg_303_0, arg_303_1)
		arg_303_1.time_ = 0
		arg_303_1.frameCnt_ = 0
		arg_303_1.state_ = "playing"
		arg_303_1.curTalkId_ = 120421074
		arg_303_1.duration_ = 8

		local var_303_0 = {
			zh = 4.5,
			ja = 8
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
				arg_303_0:Play120421075(arg_303_1)
			end
		end

		function arg_303_1.onSingleLineUpdate_(arg_306_0)
			local var_306_0 = "1072ui_story"

			if arg_303_1.actors_[var_306_0] == nil then
				local var_306_1 = Object.Instantiate(Asset.Load("Char/" .. var_306_0), arg_303_1.stage_.transform)

				var_306_1.name = var_306_0
				var_306_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_303_1.actors_[var_306_0] = var_306_1

				local var_306_2 = var_306_1:GetComponentInChildren(typeof(CharacterEffect))

				var_306_2.enabled = true

				local var_306_3 = GameObjectTools.GetOrAddComponent(var_306_1, typeof(DynamicBoneHelper))

				if var_306_3 then
					var_306_3:EnableDynamicBone(false)
				end

				arg_303_1:ShowWeapon(var_306_2.transform, false)

				arg_303_1.var_[var_306_0 .. "Animator"] = var_306_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_303_1.var_[var_306_0 .. "Animator"].applyRootMotion = true
				arg_303_1.var_[var_306_0 .. "LipSync"] = var_306_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_306_4 = arg_303_1.actors_["1072ui_story"].transform
			local var_306_5 = 0

			if var_306_5 < arg_303_1.time_ and arg_303_1.time_ <= var_306_5 + arg_306_0 then
				arg_303_1.var_.moveOldPos1072ui_story = var_306_4.localPosition
			end

			local var_306_6 = 0.001

			if var_306_5 <= arg_303_1.time_ and arg_303_1.time_ < var_306_5 + var_306_6 then
				local var_306_7 = (arg_303_1.time_ - var_306_5) / var_306_6
				local var_306_8 = Vector3.New(0, -0.71, -6)

				var_306_4.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1072ui_story, var_306_8, var_306_7)

				local var_306_9 = manager.ui.mainCamera.transform.position - var_306_4.position

				var_306_4.forward = Vector3.New(var_306_9.x, var_306_9.y, var_306_9.z)

				local var_306_10 = var_306_4.localEulerAngles

				var_306_10.z = 0
				var_306_10.x = 0
				var_306_4.localEulerAngles = var_306_10
			end

			if arg_303_1.time_ >= var_306_5 + var_306_6 and arg_303_1.time_ < var_306_5 + var_306_6 + arg_306_0 then
				var_306_4.localPosition = Vector3.New(0, -0.71, -6)

				local var_306_11 = manager.ui.mainCamera.transform.position - var_306_4.position

				var_306_4.forward = Vector3.New(var_306_11.x, var_306_11.y, var_306_11.z)

				local var_306_12 = var_306_4.localEulerAngles

				var_306_12.z = 0
				var_306_12.x = 0
				var_306_4.localEulerAngles = var_306_12
			end

			local var_306_13 = 0

			if var_306_13 < arg_303_1.time_ and arg_303_1.time_ <= var_306_13 + arg_306_0 then
				arg_303_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action6_1")
			end

			local var_306_14 = 0

			if var_306_14 < arg_303_1.time_ and arg_303_1.time_ <= var_306_14 + arg_306_0 then
				arg_303_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_306_15 = arg_303_1.actors_["1072ui_story"]
			local var_306_16 = 0

			if var_306_16 < arg_303_1.time_ and arg_303_1.time_ <= var_306_16 + arg_306_0 and arg_303_1.var_.characterEffect1072ui_story == nil then
				arg_303_1.var_.characterEffect1072ui_story = var_306_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_306_17 = 0.2

			if var_306_16 <= arg_303_1.time_ and arg_303_1.time_ < var_306_16 + var_306_17 then
				local var_306_18 = (arg_303_1.time_ - var_306_16) / var_306_17

				if arg_303_1.var_.characterEffect1072ui_story then
					arg_303_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_303_1.time_ >= var_306_16 + var_306_17 and arg_303_1.time_ < var_306_16 + var_306_17 + arg_306_0 and arg_303_1.var_.characterEffect1072ui_story then
				arg_303_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_306_19 = arg_303_1.actors_["1074ui_story"].transform
			local var_306_20 = 0

			if var_306_20 < arg_303_1.time_ and arg_303_1.time_ <= var_306_20 + arg_306_0 then
				arg_303_1.var_.moveOldPos1074ui_story = var_306_19.localPosition
			end

			local var_306_21 = 0.001

			if var_306_20 <= arg_303_1.time_ and arg_303_1.time_ < var_306_20 + var_306_21 then
				local var_306_22 = (arg_303_1.time_ - var_306_20) / var_306_21
				local var_306_23 = Vector3.New(0, 100, 0)

				var_306_19.localPosition = Vector3.Lerp(arg_303_1.var_.moveOldPos1074ui_story, var_306_23, var_306_22)

				local var_306_24 = manager.ui.mainCamera.transform.position - var_306_19.position

				var_306_19.forward = Vector3.New(var_306_24.x, var_306_24.y, var_306_24.z)

				local var_306_25 = var_306_19.localEulerAngles

				var_306_25.z = 0
				var_306_25.x = 0
				var_306_19.localEulerAngles = var_306_25
			end

			if arg_303_1.time_ >= var_306_20 + var_306_21 and arg_303_1.time_ < var_306_20 + var_306_21 + arg_306_0 then
				var_306_19.localPosition = Vector3.New(0, 100, 0)

				local var_306_26 = manager.ui.mainCamera.transform.position - var_306_19.position

				var_306_19.forward = Vector3.New(var_306_26.x, var_306_26.y, var_306_26.z)

				local var_306_27 = var_306_19.localEulerAngles

				var_306_27.z = 0
				var_306_27.x = 0
				var_306_19.localEulerAngles = var_306_27
			end

			local var_306_28 = arg_303_1.actors_["1072ui_story"]
			local var_306_29 = 0

			if var_306_29 < arg_303_1.time_ and arg_303_1.time_ <= var_306_29 + arg_306_0 then
				if arg_303_1.var_.characterEffect1072ui_story == nil then
					arg_303_1.var_.characterEffect1072ui_story = var_306_28:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_306_30 = arg_303_1.var_.characterEffect1072ui_story

				var_306_30.imageEffect:turnOff()

				var_306_30.interferenceEffect.enabled = true
				var_306_30.interferenceEffect.noise = 0.001
				var_306_30.interferenceEffect.simTimeScale = 1
				var_306_30.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_306_31 = 0
			local var_306_32 = 0.575

			if var_306_31 < arg_303_1.time_ and arg_303_1.time_ <= var_306_31 + arg_306_0 then
				arg_303_1.talkMaxDuration = 0
				arg_303_1.dialogCg_.alpha = 1

				arg_303_1.dialog_:SetActive(true)
				SetActive(arg_303_1.leftNameGo_, true)

				local var_306_33 = arg_303_1:FormatText(StoryNameCfg[379].name)

				arg_303_1.leftNameTxt_.text = var_306_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_303_1.leftNameTxt_.transform)

				arg_303_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_303_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_303_1:RecordName(arg_303_1.leftNameTxt_.text)
				SetActive(arg_303_1.iconTrs_.gameObject, false)
				arg_303_1.callingController_:SetSelectedState("normal")

				local var_306_34 = arg_303_1:GetWordFromCfg(120421074)
				local var_306_35 = arg_303_1:FormatText(var_306_34.content)

				arg_303_1.text_.text = var_306_35

				LuaForUtil.ClearLinePrefixSymbol(arg_303_1.text_)

				local var_306_36 = 23
				local var_306_37 = utf8.len(var_306_35)
				local var_306_38 = var_306_36 <= 0 and var_306_32 or var_306_32 * (var_306_37 / var_306_36)

				if var_306_38 > 0 and var_306_32 < var_306_38 then
					arg_303_1.talkMaxDuration = var_306_38

					if var_306_38 + var_306_31 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_38 + var_306_31
					end
				end

				arg_303_1.text_.text = var_306_35
				arg_303_1.typewritter.percent = 0

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421074", "story_v_out_120421.awb") ~= 0 then
					local var_306_39 = manager.audio:GetVoiceLength("story_v_out_120421", "120421074", "story_v_out_120421.awb") / 1000

					if var_306_39 + var_306_31 > arg_303_1.duration_ then
						arg_303_1.duration_ = var_306_39 + var_306_31
					end

					if var_306_34.prefab_name ~= "" and arg_303_1.actors_[var_306_34.prefab_name] ~= nil then
						local var_306_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_303_1.actors_[var_306_34.prefab_name].transform, "story_v_out_120421", "120421074", "story_v_out_120421.awb")

						arg_303_1:RecordAudio("120421074", var_306_40)
						arg_303_1:RecordAudio("120421074", var_306_40)
					else
						arg_303_1:AudioAction("play", "voice", "story_v_out_120421", "120421074", "story_v_out_120421.awb")
					end

					arg_303_1:RecordHistoryTalkVoice("story_v_out_120421", "120421074", "story_v_out_120421.awb")
				end

				arg_303_1:RecordContent(arg_303_1.text_.text)
			end

			local var_306_41 = math.max(var_306_32, arg_303_1.talkMaxDuration)

			if var_306_31 <= arg_303_1.time_ and arg_303_1.time_ < var_306_31 + var_306_41 then
				arg_303_1.typewritter.percent = (arg_303_1.time_ - var_306_31) / var_306_41

				arg_303_1.typewritter:SetDirty()
			end

			if arg_303_1.time_ >= var_306_31 + var_306_41 and arg_303_1.time_ < var_306_31 + var_306_41 + arg_306_0 then
				arg_303_1.typewritter.percent = 1

				arg_303_1.typewritter:SetDirty()
				arg_303_1:ShowNextGo(true)
			end
		end
	end,
	Play120421075 = function(arg_307_0, arg_307_1)
		arg_307_1.time_ = 0
		arg_307_1.frameCnt_ = 0
		arg_307_1.state_ = "playing"
		arg_307_1.curTalkId_ = 120421075
		arg_307_1.duration_ = 10.833

		local var_307_0 = {
			zh = 5.633,
			ja = 10.833
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
				arg_307_0:Play120421076(arg_307_1)
			end
		end

		function arg_307_1.onSingleLineUpdate_(arg_310_0)
			local var_310_0 = arg_307_1.actors_["1072ui_story"].transform
			local var_310_1 = 0

			if var_310_1 < arg_307_1.time_ and arg_307_1.time_ <= var_310_1 + arg_310_0 then
				arg_307_1.var_.moveOldPos1072ui_story = var_310_0.localPosition
			end

			local var_310_2 = 0.001

			if var_310_1 <= arg_307_1.time_ and arg_307_1.time_ < var_310_1 + var_310_2 then
				local var_310_3 = (arg_307_1.time_ - var_310_1) / var_310_2
				local var_310_4 = Vector3.New(0, -0.71, -6)

				var_310_0.localPosition = Vector3.Lerp(arg_307_1.var_.moveOldPos1072ui_story, var_310_4, var_310_3)

				local var_310_5 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_5.x, var_310_5.y, var_310_5.z)

				local var_310_6 = var_310_0.localEulerAngles

				var_310_6.z = 0
				var_310_6.x = 0
				var_310_0.localEulerAngles = var_310_6
			end

			if arg_307_1.time_ >= var_310_1 + var_310_2 and arg_307_1.time_ < var_310_1 + var_310_2 + arg_310_0 then
				var_310_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_310_7 = manager.ui.mainCamera.transform.position - var_310_0.position

				var_310_0.forward = Vector3.New(var_310_7.x, var_310_7.y, var_310_7.z)

				local var_310_8 = var_310_0.localEulerAngles

				var_310_8.z = 0
				var_310_8.x = 0
				var_310_0.localEulerAngles = var_310_8
			end

			local var_310_9 = 0

			if var_310_9 < arg_307_1.time_ and arg_307_1.time_ <= var_310_9 + arg_310_0 then
				arg_307_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_310_10 = arg_307_1.actors_["1072ui_story"]
			local var_310_11 = 0

			if var_310_11 < arg_307_1.time_ and arg_307_1.time_ <= var_310_11 + arg_310_0 and arg_307_1.var_.characterEffect1072ui_story == nil then
				arg_307_1.var_.characterEffect1072ui_story = var_310_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_310_12 = 0.2

			if var_310_11 <= arg_307_1.time_ and arg_307_1.time_ < var_310_11 + var_310_12 then
				local var_310_13 = (arg_307_1.time_ - var_310_11) / var_310_12

				if arg_307_1.var_.characterEffect1072ui_story then
					local var_310_14 = Mathf.Lerp(0, 0.5, var_310_13)

					arg_307_1.var_.characterEffect1072ui_story.fillFlat = true
					arg_307_1.var_.characterEffect1072ui_story.fillRatio = var_310_14
				end
			end

			if arg_307_1.time_ >= var_310_11 + var_310_12 and arg_307_1.time_ < var_310_11 + var_310_12 + arg_310_0 and arg_307_1.var_.characterEffect1072ui_story then
				local var_310_15 = 0.5

				arg_307_1.var_.characterEffect1072ui_story.fillFlat = true
				arg_307_1.var_.characterEffect1072ui_story.fillRatio = var_310_15
			end

			local var_310_16 = 0
			local var_310_17 = 0.725

			if var_310_16 < arg_307_1.time_ and arg_307_1.time_ <= var_310_16 + arg_310_0 then
				arg_307_1.talkMaxDuration = 0
				arg_307_1.dialogCg_.alpha = 1

				arg_307_1.dialog_:SetActive(true)
				SetActive(arg_307_1.leftNameGo_, true)

				local var_310_18 = arg_307_1:FormatText(StoryNameCfg[379].name)

				arg_307_1.leftNameTxt_.text = var_310_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_307_1.leftNameTxt_.transform)

				arg_307_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_307_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_307_1:RecordName(arg_307_1.leftNameTxt_.text)
				SetActive(arg_307_1.iconTrs_.gameObject, false)
				arg_307_1.callingController_:SetSelectedState("normal")

				local var_310_19 = arg_307_1:GetWordFromCfg(120421075)
				local var_310_20 = arg_307_1:FormatText(var_310_19.content)

				arg_307_1.text_.text = var_310_20

				LuaForUtil.ClearLinePrefixSymbol(arg_307_1.text_)

				local var_310_21 = 29
				local var_310_22 = utf8.len(var_310_20)
				local var_310_23 = var_310_21 <= 0 and var_310_17 or var_310_17 * (var_310_22 / var_310_21)

				if var_310_23 > 0 and var_310_17 < var_310_23 then
					arg_307_1.talkMaxDuration = var_310_23

					if var_310_23 + var_310_16 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_23 + var_310_16
					end
				end

				arg_307_1.text_.text = var_310_20
				arg_307_1.typewritter.percent = 0

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421075", "story_v_out_120421.awb") ~= 0 then
					local var_310_24 = manager.audio:GetVoiceLength("story_v_out_120421", "120421075", "story_v_out_120421.awb") / 1000

					if var_310_24 + var_310_16 > arg_307_1.duration_ then
						arg_307_1.duration_ = var_310_24 + var_310_16
					end

					if var_310_19.prefab_name ~= "" and arg_307_1.actors_[var_310_19.prefab_name] ~= nil then
						local var_310_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_307_1.actors_[var_310_19.prefab_name].transform, "story_v_out_120421", "120421075", "story_v_out_120421.awb")

						arg_307_1:RecordAudio("120421075", var_310_25)
						arg_307_1:RecordAudio("120421075", var_310_25)
					else
						arg_307_1:AudioAction("play", "voice", "story_v_out_120421", "120421075", "story_v_out_120421.awb")
					end

					arg_307_1:RecordHistoryTalkVoice("story_v_out_120421", "120421075", "story_v_out_120421.awb")
				end

				arg_307_1:RecordContent(arg_307_1.text_.text)
			end

			local var_310_26 = math.max(var_310_17, arg_307_1.talkMaxDuration)

			if var_310_16 <= arg_307_1.time_ and arg_307_1.time_ < var_310_16 + var_310_26 then
				arg_307_1.typewritter.percent = (arg_307_1.time_ - var_310_16) / var_310_26

				arg_307_1.typewritter:SetDirty()
			end

			if arg_307_1.time_ >= var_310_16 + var_310_26 and arg_307_1.time_ < var_310_16 + var_310_26 + arg_310_0 then
				arg_307_1.typewritter.percent = 1

				arg_307_1.typewritter:SetDirty()
				arg_307_1:ShowNextGo(true)
			end
		end
	end,
	Play120421076 = function(arg_311_0, arg_311_1)
		arg_311_1.time_ = 0
		arg_311_1.frameCnt_ = 0
		arg_311_1.state_ = "playing"
		arg_311_1.curTalkId_ = 120421076
		arg_311_1.duration_ = 6.7

		local var_311_0 = {
			zh = 2.8,
			ja = 6.7
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
				arg_311_0:Play120421077(arg_311_1)
			end
		end

		function arg_311_1.onSingleLineUpdate_(arg_314_0)
			local var_314_0 = arg_311_1.actors_["1074ui_story"]
			local var_314_1 = 0

			if var_314_1 < arg_311_1.time_ and arg_311_1.time_ <= var_314_1 + arg_314_0 and arg_311_1.var_.characterEffect1074ui_story == nil then
				arg_311_1.var_.characterEffect1074ui_story = var_314_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_314_2 = 0.2

			if var_314_1 <= arg_311_1.time_ and arg_311_1.time_ < var_314_1 + var_314_2 then
				local var_314_3 = (arg_311_1.time_ - var_314_1) / var_314_2

				if arg_311_1.var_.characterEffect1074ui_story then
					arg_311_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_311_1.time_ >= var_314_1 + var_314_2 and arg_311_1.time_ < var_314_1 + var_314_2 + arg_314_0 and arg_311_1.var_.characterEffect1074ui_story then
				arg_311_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_314_4 = arg_311_1.actors_["1072ui_story"].transform
			local var_314_5 = 0

			if var_314_5 < arg_311_1.time_ and arg_311_1.time_ <= var_314_5 + arg_314_0 then
				arg_311_1.var_.moveOldPos1072ui_story = var_314_4.localPosition
			end

			local var_314_6 = 0.001

			if var_314_5 <= arg_311_1.time_ and arg_311_1.time_ < var_314_5 + var_314_6 then
				local var_314_7 = (arg_311_1.time_ - var_314_5) / var_314_6
				local var_314_8 = Vector3.New(0, 100, 0)

				var_314_4.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1072ui_story, var_314_8, var_314_7)

				local var_314_9 = manager.ui.mainCamera.transform.position - var_314_4.position

				var_314_4.forward = Vector3.New(var_314_9.x, var_314_9.y, var_314_9.z)

				local var_314_10 = var_314_4.localEulerAngles

				var_314_10.z = 0
				var_314_10.x = 0
				var_314_4.localEulerAngles = var_314_10
			end

			if arg_311_1.time_ >= var_314_5 + var_314_6 and arg_311_1.time_ < var_314_5 + var_314_6 + arg_314_0 then
				var_314_4.localPosition = Vector3.New(0, 100, 0)

				local var_314_11 = manager.ui.mainCamera.transform.position - var_314_4.position

				var_314_4.forward = Vector3.New(var_314_11.x, var_314_11.y, var_314_11.z)

				local var_314_12 = var_314_4.localEulerAngles

				var_314_12.z = 0
				var_314_12.x = 0
				var_314_4.localEulerAngles = var_314_12
			end

			local var_314_13 = arg_311_1.actors_["1074ui_story"].transform
			local var_314_14 = 0

			if var_314_14 < arg_311_1.time_ and arg_311_1.time_ <= var_314_14 + arg_314_0 then
				arg_311_1.var_.moveOldPos1074ui_story = var_314_13.localPosition
			end

			local var_314_15 = 0.001

			if var_314_14 <= arg_311_1.time_ and arg_311_1.time_ < var_314_14 + var_314_15 then
				local var_314_16 = (arg_311_1.time_ - var_314_14) / var_314_15
				local var_314_17 = Vector3.New(0, -1.055, -6.12)

				var_314_13.localPosition = Vector3.Lerp(arg_311_1.var_.moveOldPos1074ui_story, var_314_17, var_314_16)

				local var_314_18 = manager.ui.mainCamera.transform.position - var_314_13.position

				var_314_13.forward = Vector3.New(var_314_18.x, var_314_18.y, var_314_18.z)

				local var_314_19 = var_314_13.localEulerAngles

				var_314_19.z = 0
				var_314_19.x = 0
				var_314_13.localEulerAngles = var_314_19
			end

			if arg_311_1.time_ >= var_314_14 + var_314_15 and arg_311_1.time_ < var_314_14 + var_314_15 + arg_314_0 then
				var_314_13.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_314_20 = manager.ui.mainCamera.transform.position - var_314_13.position

				var_314_13.forward = Vector3.New(var_314_20.x, var_314_20.y, var_314_20.z)

				local var_314_21 = var_314_13.localEulerAngles

				var_314_21.z = 0
				var_314_21.x = 0
				var_314_13.localEulerAngles = var_314_21
			end

			local var_314_22 = 0
			local var_314_23 = 0.275

			if var_314_22 < arg_311_1.time_ and arg_311_1.time_ <= var_314_22 + arg_314_0 then
				arg_311_1.talkMaxDuration = 0
				arg_311_1.dialogCg_.alpha = 1

				arg_311_1.dialog_:SetActive(true)
				SetActive(arg_311_1.leftNameGo_, true)

				local var_314_24 = arg_311_1:FormatText(StoryNameCfg[410].name)

				arg_311_1.leftNameTxt_.text = var_314_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_311_1.leftNameTxt_.transform)

				arg_311_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_311_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_311_1:RecordName(arg_311_1.leftNameTxt_.text)
				SetActive(arg_311_1.iconTrs_.gameObject, false)
				arg_311_1.callingController_:SetSelectedState("normal")

				local var_314_25 = arg_311_1:GetWordFromCfg(120421076)
				local var_314_26 = arg_311_1:FormatText(var_314_25.content)

				arg_311_1.text_.text = var_314_26

				LuaForUtil.ClearLinePrefixSymbol(arg_311_1.text_)

				local var_314_27 = 11
				local var_314_28 = utf8.len(var_314_26)
				local var_314_29 = var_314_27 <= 0 and var_314_23 or var_314_23 * (var_314_28 / var_314_27)

				if var_314_29 > 0 and var_314_23 < var_314_29 then
					arg_311_1.talkMaxDuration = var_314_29

					if var_314_29 + var_314_22 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_29 + var_314_22
					end
				end

				arg_311_1.text_.text = var_314_26
				arg_311_1.typewritter.percent = 0

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421076", "story_v_out_120421.awb") ~= 0 then
					local var_314_30 = manager.audio:GetVoiceLength("story_v_out_120421", "120421076", "story_v_out_120421.awb") / 1000

					if var_314_30 + var_314_22 > arg_311_1.duration_ then
						arg_311_1.duration_ = var_314_30 + var_314_22
					end

					if var_314_25.prefab_name ~= "" and arg_311_1.actors_[var_314_25.prefab_name] ~= nil then
						local var_314_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_311_1.actors_[var_314_25.prefab_name].transform, "story_v_out_120421", "120421076", "story_v_out_120421.awb")

						arg_311_1:RecordAudio("120421076", var_314_31)
						arg_311_1:RecordAudio("120421076", var_314_31)
					else
						arg_311_1:AudioAction("play", "voice", "story_v_out_120421", "120421076", "story_v_out_120421.awb")
					end

					arg_311_1:RecordHistoryTalkVoice("story_v_out_120421", "120421076", "story_v_out_120421.awb")
				end

				arg_311_1:RecordContent(arg_311_1.text_.text)
			end

			local var_314_32 = math.max(var_314_23, arg_311_1.talkMaxDuration)

			if var_314_22 <= arg_311_1.time_ and arg_311_1.time_ < var_314_22 + var_314_32 then
				arg_311_1.typewritter.percent = (arg_311_1.time_ - var_314_22) / var_314_32

				arg_311_1.typewritter:SetDirty()
			end

			if arg_311_1.time_ >= var_314_22 + var_314_32 and arg_311_1.time_ < var_314_22 + var_314_32 + arg_314_0 then
				arg_311_1.typewritter.percent = 1

				arg_311_1.typewritter:SetDirty()
				arg_311_1:ShowNextGo(true)
			end
		end
	end,
	Play120421077 = function(arg_315_0, arg_315_1)
		arg_315_1.time_ = 0
		arg_315_1.frameCnt_ = 0
		arg_315_1.state_ = "playing"
		arg_315_1.curTalkId_ = 120421077
		arg_315_1.duration_ = 10.733

		local var_315_0 = {
			zh = 4.433,
			ja = 10.733
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
				arg_315_0:Play120421078(arg_315_1)
			end
		end

		function arg_315_1.onSingleLineUpdate_(arg_318_0)
			local var_318_0 = arg_315_1.actors_["1074ui_story"]
			local var_318_1 = 0

			if var_318_1 < arg_315_1.time_ and arg_315_1.time_ <= var_318_1 + arg_318_0 and arg_315_1.var_.characterEffect1074ui_story == nil then
				arg_315_1.var_.characterEffect1074ui_story = var_318_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_2 = 0.2

			if var_318_1 <= arg_315_1.time_ and arg_315_1.time_ < var_318_1 + var_318_2 then
				local var_318_3 = (arg_315_1.time_ - var_318_1) / var_318_2

				if arg_315_1.var_.characterEffect1074ui_story then
					local var_318_4 = Mathf.Lerp(0, 0.5, var_318_3)

					arg_315_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_315_1.var_.characterEffect1074ui_story.fillRatio = var_318_4
				end
			end

			if arg_315_1.time_ >= var_318_1 + var_318_2 and arg_315_1.time_ < var_318_1 + var_318_2 + arg_318_0 and arg_315_1.var_.characterEffect1074ui_story then
				local var_318_5 = 0.5

				arg_315_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_315_1.var_.characterEffect1074ui_story.fillRatio = var_318_5
			end

			local var_318_6 = arg_315_1.actors_["1072ui_story"].transform
			local var_318_7 = 0

			if var_318_7 < arg_315_1.time_ and arg_315_1.time_ <= var_318_7 + arg_318_0 then
				arg_315_1.var_.moveOldPos1072ui_story = var_318_6.localPosition
			end

			local var_318_8 = 0.001

			if var_318_7 <= arg_315_1.time_ and arg_315_1.time_ < var_318_7 + var_318_8 then
				local var_318_9 = (arg_315_1.time_ - var_318_7) / var_318_8
				local var_318_10 = Vector3.New(0, -0.71, -6)

				var_318_6.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1072ui_story, var_318_10, var_318_9)

				local var_318_11 = manager.ui.mainCamera.transform.position - var_318_6.position

				var_318_6.forward = Vector3.New(var_318_11.x, var_318_11.y, var_318_11.z)

				local var_318_12 = var_318_6.localEulerAngles

				var_318_12.z = 0
				var_318_12.x = 0
				var_318_6.localEulerAngles = var_318_12
			end

			if arg_315_1.time_ >= var_318_7 + var_318_8 and arg_315_1.time_ < var_318_7 + var_318_8 + arg_318_0 then
				var_318_6.localPosition = Vector3.New(0, -0.71, -6)

				local var_318_13 = manager.ui.mainCamera.transform.position - var_318_6.position

				var_318_6.forward = Vector3.New(var_318_13.x, var_318_13.y, var_318_13.z)

				local var_318_14 = var_318_6.localEulerAngles

				var_318_14.z = 0
				var_318_14.x = 0
				var_318_6.localEulerAngles = var_318_14
			end

			local var_318_15 = 0

			if var_318_15 < arg_315_1.time_ and arg_315_1.time_ <= var_318_15 + arg_318_0 then
				arg_315_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action8_1")
			end

			local var_318_16 = 0

			if var_318_16 < arg_315_1.time_ and arg_315_1.time_ <= var_318_16 + arg_318_0 then
				arg_315_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_318_17 = arg_315_1.actors_["1072ui_story"]
			local var_318_18 = 0

			if var_318_18 < arg_315_1.time_ and arg_315_1.time_ <= var_318_18 + arg_318_0 and arg_315_1.var_.characterEffect1072ui_story == nil then
				arg_315_1.var_.characterEffect1072ui_story = var_318_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_318_19 = 0.2

			if var_318_18 <= arg_315_1.time_ and arg_315_1.time_ < var_318_18 + var_318_19 then
				local var_318_20 = (arg_315_1.time_ - var_318_18) / var_318_19

				if arg_315_1.var_.characterEffect1072ui_story then
					arg_315_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_315_1.time_ >= var_318_18 + var_318_19 and arg_315_1.time_ < var_318_18 + var_318_19 + arg_318_0 and arg_315_1.var_.characterEffect1072ui_story then
				arg_315_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_318_21 = arg_315_1.actors_["1074ui_story"].transform
			local var_318_22 = 0

			if var_318_22 < arg_315_1.time_ and arg_315_1.time_ <= var_318_22 + arg_318_0 then
				arg_315_1.var_.moveOldPos1074ui_story = var_318_21.localPosition
			end

			local var_318_23 = 0.001

			if var_318_22 <= arg_315_1.time_ and arg_315_1.time_ < var_318_22 + var_318_23 then
				local var_318_24 = (arg_315_1.time_ - var_318_22) / var_318_23
				local var_318_25 = Vector3.New(0, 100, 0)

				var_318_21.localPosition = Vector3.Lerp(arg_315_1.var_.moveOldPos1074ui_story, var_318_25, var_318_24)

				local var_318_26 = manager.ui.mainCamera.transform.position - var_318_21.position

				var_318_21.forward = Vector3.New(var_318_26.x, var_318_26.y, var_318_26.z)

				local var_318_27 = var_318_21.localEulerAngles

				var_318_27.z = 0
				var_318_27.x = 0
				var_318_21.localEulerAngles = var_318_27
			end

			if arg_315_1.time_ >= var_318_22 + var_318_23 and arg_315_1.time_ < var_318_22 + var_318_23 + arg_318_0 then
				var_318_21.localPosition = Vector3.New(0, 100, 0)

				local var_318_28 = manager.ui.mainCamera.transform.position - var_318_21.position

				var_318_21.forward = Vector3.New(var_318_28.x, var_318_28.y, var_318_28.z)

				local var_318_29 = var_318_21.localEulerAngles

				var_318_29.z = 0
				var_318_29.x = 0
				var_318_21.localEulerAngles = var_318_29
			end

			local var_318_30 = 0
			local var_318_31 = 0.5

			if var_318_30 < arg_315_1.time_ and arg_315_1.time_ <= var_318_30 + arg_318_0 then
				arg_315_1.talkMaxDuration = 0
				arg_315_1.dialogCg_.alpha = 1

				arg_315_1.dialog_:SetActive(true)
				SetActive(arg_315_1.leftNameGo_, true)

				local var_318_32 = arg_315_1:FormatText(StoryNameCfg[379].name)

				arg_315_1.leftNameTxt_.text = var_318_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_315_1.leftNameTxt_.transform)

				arg_315_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_315_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_315_1:RecordName(arg_315_1.leftNameTxt_.text)
				SetActive(arg_315_1.iconTrs_.gameObject, false)
				arg_315_1.callingController_:SetSelectedState("normal")

				local var_318_33 = arg_315_1:GetWordFromCfg(120421077)
				local var_318_34 = arg_315_1:FormatText(var_318_33.content)

				arg_315_1.text_.text = var_318_34

				LuaForUtil.ClearLinePrefixSymbol(arg_315_1.text_)

				local var_318_35 = 20
				local var_318_36 = utf8.len(var_318_34)
				local var_318_37 = var_318_35 <= 0 and var_318_31 or var_318_31 * (var_318_36 / var_318_35)

				if var_318_37 > 0 and var_318_31 < var_318_37 then
					arg_315_1.talkMaxDuration = var_318_37

					if var_318_37 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_37 + var_318_30
					end
				end

				arg_315_1.text_.text = var_318_34
				arg_315_1.typewritter.percent = 0

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421077", "story_v_out_120421.awb") ~= 0 then
					local var_318_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421077", "story_v_out_120421.awb") / 1000

					if var_318_38 + var_318_30 > arg_315_1.duration_ then
						arg_315_1.duration_ = var_318_38 + var_318_30
					end

					if var_318_33.prefab_name ~= "" and arg_315_1.actors_[var_318_33.prefab_name] ~= nil then
						local var_318_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_315_1.actors_[var_318_33.prefab_name].transform, "story_v_out_120421", "120421077", "story_v_out_120421.awb")

						arg_315_1:RecordAudio("120421077", var_318_39)
						arg_315_1:RecordAudio("120421077", var_318_39)
					else
						arg_315_1:AudioAction("play", "voice", "story_v_out_120421", "120421077", "story_v_out_120421.awb")
					end

					arg_315_1:RecordHistoryTalkVoice("story_v_out_120421", "120421077", "story_v_out_120421.awb")
				end

				arg_315_1:RecordContent(arg_315_1.text_.text)
			end

			local var_318_40 = math.max(var_318_31, arg_315_1.talkMaxDuration)

			if var_318_30 <= arg_315_1.time_ and arg_315_1.time_ < var_318_30 + var_318_40 then
				arg_315_1.typewritter.percent = (arg_315_1.time_ - var_318_30) / var_318_40

				arg_315_1.typewritter:SetDirty()
			end

			if arg_315_1.time_ >= var_318_30 + var_318_40 and arg_315_1.time_ < var_318_30 + var_318_40 + arg_318_0 then
				arg_315_1.typewritter.percent = 1

				arg_315_1.typewritter:SetDirty()
				arg_315_1:ShowNextGo(true)
			end
		end
	end,
	Play120421078 = function(arg_319_0, arg_319_1)
		arg_319_1.time_ = 0
		arg_319_1.frameCnt_ = 0
		arg_319_1.state_ = "playing"
		arg_319_1.curTalkId_ = 120421078
		arg_319_1.duration_ = 10.666

		local var_319_0 = {
			zh = 10.666,
			ja = 10.4
		}
		local var_319_1 = manager.audio:GetLocalizationFlag()

		if var_319_0[var_319_1] ~= nil then
			arg_319_1.duration_ = var_319_0[var_319_1]
		end

		SetActive(arg_319_1.tipsGo_, false)

		function arg_319_1.onSingleLineFinish_()
			arg_319_1.onSingleLineUpdate_ = nil
			arg_319_1.onSingleLineFinish_ = nil
			arg_319_1.state_ = "waiting"
		end

		function arg_319_1.playNext_(arg_321_0)
			if arg_321_0 == 1 then
				arg_319_0:Play120421079(arg_319_1)
			end
		end

		function arg_319_1.onSingleLineUpdate_(arg_322_0)
			local var_322_0 = arg_319_1.actors_["1074ui_story"]
			local var_322_1 = 0

			if var_322_1 < arg_319_1.time_ and arg_319_1.time_ <= var_322_1 + arg_322_0 and arg_319_1.var_.characterEffect1074ui_story == nil then
				arg_319_1.var_.characterEffect1074ui_story = var_322_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_322_2 = 0.2

			if var_322_1 <= arg_319_1.time_ and arg_319_1.time_ < var_322_1 + var_322_2 then
				local var_322_3 = (arg_319_1.time_ - var_322_1) / var_322_2

				if arg_319_1.var_.characterEffect1074ui_story then
					arg_319_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_319_1.time_ >= var_322_1 + var_322_2 and arg_319_1.time_ < var_322_1 + var_322_2 + arg_322_0 and arg_319_1.var_.characterEffect1074ui_story then
				arg_319_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_322_4 = arg_319_1.actors_["1074ui_story"].transform
			local var_322_5 = 0

			if var_322_5 < arg_319_1.time_ and arg_319_1.time_ <= var_322_5 + arg_322_0 then
				arg_319_1.var_.moveOldPos1074ui_story = var_322_4.localPosition
			end

			local var_322_6 = 0.001

			if var_322_5 <= arg_319_1.time_ and arg_319_1.time_ < var_322_5 + var_322_6 then
				local var_322_7 = (arg_319_1.time_ - var_322_5) / var_322_6
				local var_322_8 = Vector3.New(0, -1.055, -6.12)

				var_322_4.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1074ui_story, var_322_8, var_322_7)

				local var_322_9 = manager.ui.mainCamera.transform.position - var_322_4.position

				var_322_4.forward = Vector3.New(var_322_9.x, var_322_9.y, var_322_9.z)

				local var_322_10 = var_322_4.localEulerAngles

				var_322_10.z = 0
				var_322_10.x = 0
				var_322_4.localEulerAngles = var_322_10
			end

			if arg_319_1.time_ >= var_322_5 + var_322_6 and arg_319_1.time_ < var_322_5 + var_322_6 + arg_322_0 then
				var_322_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_322_11 = manager.ui.mainCamera.transform.position - var_322_4.position

				var_322_4.forward = Vector3.New(var_322_11.x, var_322_11.y, var_322_11.z)

				local var_322_12 = var_322_4.localEulerAngles

				var_322_12.z = 0
				var_322_12.x = 0
				var_322_4.localEulerAngles = var_322_12
			end

			local var_322_13 = arg_319_1.actors_["1072ui_story"].transform
			local var_322_14 = 0

			if var_322_14 < arg_319_1.time_ and arg_319_1.time_ <= var_322_14 + arg_322_0 then
				arg_319_1.var_.moveOldPos1072ui_story = var_322_13.localPosition
			end

			local var_322_15 = 0.001

			if var_322_14 <= arg_319_1.time_ and arg_319_1.time_ < var_322_14 + var_322_15 then
				local var_322_16 = (arg_319_1.time_ - var_322_14) / var_322_15
				local var_322_17 = Vector3.New(0, 100, 0)

				var_322_13.localPosition = Vector3.Lerp(arg_319_1.var_.moveOldPos1072ui_story, var_322_17, var_322_16)

				local var_322_18 = manager.ui.mainCamera.transform.position - var_322_13.position

				var_322_13.forward = Vector3.New(var_322_18.x, var_322_18.y, var_322_18.z)

				local var_322_19 = var_322_13.localEulerAngles

				var_322_19.z = 0
				var_322_19.x = 0
				var_322_13.localEulerAngles = var_322_19
			end

			if arg_319_1.time_ >= var_322_14 + var_322_15 and arg_319_1.time_ < var_322_14 + var_322_15 + arg_322_0 then
				var_322_13.localPosition = Vector3.New(0, 100, 0)

				local var_322_20 = manager.ui.mainCamera.transform.position - var_322_13.position

				var_322_13.forward = Vector3.New(var_322_20.x, var_322_20.y, var_322_20.z)

				local var_322_21 = var_322_13.localEulerAngles

				var_322_21.z = 0
				var_322_21.x = 0
				var_322_13.localEulerAngles = var_322_21
			end

			local var_322_22 = 0
			local var_322_23 = 0.875

			if var_322_22 < arg_319_1.time_ and arg_319_1.time_ <= var_322_22 + arg_322_0 then
				arg_319_1.talkMaxDuration = 0
				arg_319_1.dialogCg_.alpha = 1

				arg_319_1.dialog_:SetActive(true)
				SetActive(arg_319_1.leftNameGo_, true)

				local var_322_24 = arg_319_1:FormatText(StoryNameCfg[410].name)

				arg_319_1.leftNameTxt_.text = var_322_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_319_1.leftNameTxt_.transform)

				arg_319_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_319_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_319_1:RecordName(arg_319_1.leftNameTxt_.text)
				SetActive(arg_319_1.iconTrs_.gameObject, false)
				arg_319_1.callingController_:SetSelectedState("normal")

				local var_322_25 = arg_319_1:GetWordFromCfg(120421078)
				local var_322_26 = arg_319_1:FormatText(var_322_25.content)

				arg_319_1.text_.text = var_322_26

				LuaForUtil.ClearLinePrefixSymbol(arg_319_1.text_)

				local var_322_27 = 35
				local var_322_28 = utf8.len(var_322_26)
				local var_322_29 = var_322_27 <= 0 and var_322_23 or var_322_23 * (var_322_28 / var_322_27)

				if var_322_29 > 0 and var_322_23 < var_322_29 then
					arg_319_1.talkMaxDuration = var_322_29

					if var_322_29 + var_322_22 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_29 + var_322_22
					end
				end

				arg_319_1.text_.text = var_322_26
				arg_319_1.typewritter.percent = 0

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421078", "story_v_out_120421.awb") ~= 0 then
					local var_322_30 = manager.audio:GetVoiceLength("story_v_out_120421", "120421078", "story_v_out_120421.awb") / 1000

					if var_322_30 + var_322_22 > arg_319_1.duration_ then
						arg_319_1.duration_ = var_322_30 + var_322_22
					end

					if var_322_25.prefab_name ~= "" and arg_319_1.actors_[var_322_25.prefab_name] ~= nil then
						local var_322_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_319_1.actors_[var_322_25.prefab_name].transform, "story_v_out_120421", "120421078", "story_v_out_120421.awb")

						arg_319_1:RecordAudio("120421078", var_322_31)
						arg_319_1:RecordAudio("120421078", var_322_31)
					else
						arg_319_1:AudioAction("play", "voice", "story_v_out_120421", "120421078", "story_v_out_120421.awb")
					end

					arg_319_1:RecordHistoryTalkVoice("story_v_out_120421", "120421078", "story_v_out_120421.awb")
				end

				arg_319_1:RecordContent(arg_319_1.text_.text)
			end

			local var_322_32 = math.max(var_322_23, arg_319_1.talkMaxDuration)

			if var_322_22 <= arg_319_1.time_ and arg_319_1.time_ < var_322_22 + var_322_32 then
				arg_319_1.typewritter.percent = (arg_319_1.time_ - var_322_22) / var_322_32

				arg_319_1.typewritter:SetDirty()
			end

			if arg_319_1.time_ >= var_322_22 + var_322_32 and arg_319_1.time_ < var_322_22 + var_322_32 + arg_322_0 then
				arg_319_1.typewritter.percent = 1

				arg_319_1.typewritter:SetDirty()
				arg_319_1:ShowNextGo(true)
			end
		end
	end,
	Play120421079 = function(arg_323_0, arg_323_1)
		arg_323_1.time_ = 0
		arg_323_1.frameCnt_ = 0
		arg_323_1.state_ = "playing"
		arg_323_1.curTalkId_ = 120421079
		arg_323_1.duration_ = 11.966

		local var_323_0 = {
			zh = 8.4,
			ja = 11.966
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
				arg_323_0:Play120421080(arg_323_1)
			end
		end

		function arg_323_1.onSingleLineUpdate_(arg_326_0)
			local var_326_0 = arg_323_1.actors_["1074ui_story"]
			local var_326_1 = 0

			if var_326_1 < arg_323_1.time_ and arg_323_1.time_ <= var_326_1 + arg_326_0 and arg_323_1.var_.characterEffect1074ui_story == nil then
				arg_323_1.var_.characterEffect1074ui_story = var_326_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_2 = 0.2

			if var_326_1 <= arg_323_1.time_ and arg_323_1.time_ < var_326_1 + var_326_2 then
				local var_326_3 = (arg_323_1.time_ - var_326_1) / var_326_2

				if arg_323_1.var_.characterEffect1074ui_story then
					local var_326_4 = Mathf.Lerp(0, 0.5, var_326_3)

					arg_323_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_323_1.var_.characterEffect1074ui_story.fillRatio = var_326_4
				end
			end

			if arg_323_1.time_ >= var_326_1 + var_326_2 and arg_323_1.time_ < var_326_1 + var_326_2 + arg_326_0 and arg_323_1.var_.characterEffect1074ui_story then
				local var_326_5 = 0.5

				arg_323_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_323_1.var_.characterEffect1074ui_story.fillRatio = var_326_5
			end

			local var_326_6 = arg_323_1.actors_["1072ui_story"].transform
			local var_326_7 = 0

			if var_326_7 < arg_323_1.time_ and arg_323_1.time_ <= var_326_7 + arg_326_0 then
				arg_323_1.var_.moveOldPos1072ui_story = var_326_6.localPosition
			end

			local var_326_8 = 0.001

			if var_326_7 <= arg_323_1.time_ and arg_323_1.time_ < var_326_7 + var_326_8 then
				local var_326_9 = (arg_323_1.time_ - var_326_7) / var_326_8
				local var_326_10 = Vector3.New(0, -0.71, -6)

				var_326_6.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1072ui_story, var_326_10, var_326_9)

				local var_326_11 = manager.ui.mainCamera.transform.position - var_326_6.position

				var_326_6.forward = Vector3.New(var_326_11.x, var_326_11.y, var_326_11.z)

				local var_326_12 = var_326_6.localEulerAngles

				var_326_12.z = 0
				var_326_12.x = 0
				var_326_6.localEulerAngles = var_326_12
			end

			if arg_323_1.time_ >= var_326_7 + var_326_8 and arg_323_1.time_ < var_326_7 + var_326_8 + arg_326_0 then
				var_326_6.localPosition = Vector3.New(0, -0.71, -6)

				local var_326_13 = manager.ui.mainCamera.transform.position - var_326_6.position

				var_326_6.forward = Vector3.New(var_326_13.x, var_326_13.y, var_326_13.z)

				local var_326_14 = var_326_6.localEulerAngles

				var_326_14.z = 0
				var_326_14.x = 0
				var_326_6.localEulerAngles = var_326_14
			end

			local var_326_15 = 0

			if var_326_15 < arg_323_1.time_ and arg_323_1.time_ <= var_326_15 + arg_326_0 then
				arg_323_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_326_16 = 0

			if var_326_16 < arg_323_1.time_ and arg_323_1.time_ <= var_326_16 + arg_326_0 then
				arg_323_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_326_17 = arg_323_1.actors_["1072ui_story"]
			local var_326_18 = 0

			if var_326_18 < arg_323_1.time_ and arg_323_1.time_ <= var_326_18 + arg_326_0 and arg_323_1.var_.characterEffect1072ui_story == nil then
				arg_323_1.var_.characterEffect1072ui_story = var_326_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_326_19 = 0.2

			if var_326_18 <= arg_323_1.time_ and arg_323_1.time_ < var_326_18 + var_326_19 then
				local var_326_20 = (arg_323_1.time_ - var_326_18) / var_326_19

				if arg_323_1.var_.characterEffect1072ui_story then
					arg_323_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_323_1.time_ >= var_326_18 + var_326_19 and arg_323_1.time_ < var_326_18 + var_326_19 + arg_326_0 and arg_323_1.var_.characterEffect1072ui_story then
				arg_323_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_326_21 = arg_323_1.actors_["1074ui_story"].transform
			local var_326_22 = 0

			if var_326_22 < arg_323_1.time_ and arg_323_1.time_ <= var_326_22 + arg_326_0 then
				arg_323_1.var_.moveOldPos1074ui_story = var_326_21.localPosition
			end

			local var_326_23 = 0.001

			if var_326_22 <= arg_323_1.time_ and arg_323_1.time_ < var_326_22 + var_326_23 then
				local var_326_24 = (arg_323_1.time_ - var_326_22) / var_326_23
				local var_326_25 = Vector3.New(0, 100, 0)

				var_326_21.localPosition = Vector3.Lerp(arg_323_1.var_.moveOldPos1074ui_story, var_326_25, var_326_24)

				local var_326_26 = manager.ui.mainCamera.transform.position - var_326_21.position

				var_326_21.forward = Vector3.New(var_326_26.x, var_326_26.y, var_326_26.z)

				local var_326_27 = var_326_21.localEulerAngles

				var_326_27.z = 0
				var_326_27.x = 0
				var_326_21.localEulerAngles = var_326_27
			end

			if arg_323_1.time_ >= var_326_22 + var_326_23 and arg_323_1.time_ < var_326_22 + var_326_23 + arg_326_0 then
				var_326_21.localPosition = Vector3.New(0, 100, 0)

				local var_326_28 = manager.ui.mainCamera.transform.position - var_326_21.position

				var_326_21.forward = Vector3.New(var_326_28.x, var_326_28.y, var_326_28.z)

				local var_326_29 = var_326_21.localEulerAngles

				var_326_29.z = 0
				var_326_29.x = 0
				var_326_21.localEulerAngles = var_326_29
			end

			local var_326_30 = 0
			local var_326_31 = 0.975

			if var_326_30 < arg_323_1.time_ and arg_323_1.time_ <= var_326_30 + arg_326_0 then
				arg_323_1.talkMaxDuration = 0
				arg_323_1.dialogCg_.alpha = 1

				arg_323_1.dialog_:SetActive(true)
				SetActive(arg_323_1.leftNameGo_, true)

				local var_326_32 = arg_323_1:FormatText(StoryNameCfg[379].name)

				arg_323_1.leftNameTxt_.text = var_326_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_323_1.leftNameTxt_.transform)

				arg_323_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_323_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_323_1:RecordName(arg_323_1.leftNameTxt_.text)
				SetActive(arg_323_1.iconTrs_.gameObject, false)
				arg_323_1.callingController_:SetSelectedState("normal")

				local var_326_33 = arg_323_1:GetWordFromCfg(120421079)
				local var_326_34 = arg_323_1:FormatText(var_326_33.content)

				arg_323_1.text_.text = var_326_34

				LuaForUtil.ClearLinePrefixSymbol(arg_323_1.text_)

				local var_326_35 = 39
				local var_326_36 = utf8.len(var_326_34)
				local var_326_37 = var_326_35 <= 0 and var_326_31 or var_326_31 * (var_326_36 / var_326_35)

				if var_326_37 > 0 and var_326_31 < var_326_37 then
					arg_323_1.talkMaxDuration = var_326_37

					if var_326_37 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_37 + var_326_30
					end
				end

				arg_323_1.text_.text = var_326_34
				arg_323_1.typewritter.percent = 0

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421079", "story_v_out_120421.awb") ~= 0 then
					local var_326_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421079", "story_v_out_120421.awb") / 1000

					if var_326_38 + var_326_30 > arg_323_1.duration_ then
						arg_323_1.duration_ = var_326_38 + var_326_30
					end

					if var_326_33.prefab_name ~= "" and arg_323_1.actors_[var_326_33.prefab_name] ~= nil then
						local var_326_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_323_1.actors_[var_326_33.prefab_name].transform, "story_v_out_120421", "120421079", "story_v_out_120421.awb")

						arg_323_1:RecordAudio("120421079", var_326_39)
						arg_323_1:RecordAudio("120421079", var_326_39)
					else
						arg_323_1:AudioAction("play", "voice", "story_v_out_120421", "120421079", "story_v_out_120421.awb")
					end

					arg_323_1:RecordHistoryTalkVoice("story_v_out_120421", "120421079", "story_v_out_120421.awb")
				end

				arg_323_1:RecordContent(arg_323_1.text_.text)
			end

			local var_326_40 = math.max(var_326_31, arg_323_1.talkMaxDuration)

			if var_326_30 <= arg_323_1.time_ and arg_323_1.time_ < var_326_30 + var_326_40 then
				arg_323_1.typewritter.percent = (arg_323_1.time_ - var_326_30) / var_326_40

				arg_323_1.typewritter:SetDirty()
			end

			if arg_323_1.time_ >= var_326_30 + var_326_40 and arg_323_1.time_ < var_326_30 + var_326_40 + arg_326_0 then
				arg_323_1.typewritter.percent = 1

				arg_323_1.typewritter:SetDirty()
				arg_323_1:ShowNextGo(true)
			end
		end
	end,
	Play120421080 = function(arg_327_0, arg_327_1)
		arg_327_1.time_ = 0
		arg_327_1.frameCnt_ = 0
		arg_327_1.state_ = "playing"
		arg_327_1.curTalkId_ = 120421080
		arg_327_1.duration_ = 5.133

		local var_327_0 = {
			zh = 3.066,
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
				arg_327_0:Play120421081(arg_327_1)
			end
		end

		function arg_327_1.onSingleLineUpdate_(arg_330_0)
			local var_330_0 = arg_327_1.actors_["1074ui_story"]
			local var_330_1 = 0

			if var_330_1 < arg_327_1.time_ and arg_327_1.time_ <= var_330_1 + arg_330_0 and arg_327_1.var_.characterEffect1074ui_story == nil then
				arg_327_1.var_.characterEffect1074ui_story = var_330_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_330_2 = 0.2

			if var_330_1 <= arg_327_1.time_ and arg_327_1.time_ < var_330_1 + var_330_2 then
				local var_330_3 = (arg_327_1.time_ - var_330_1) / var_330_2

				if arg_327_1.var_.characterEffect1074ui_story then
					arg_327_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_327_1.time_ >= var_330_1 + var_330_2 and arg_327_1.time_ < var_330_1 + var_330_2 + arg_330_0 and arg_327_1.var_.characterEffect1074ui_story then
				arg_327_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_330_4 = arg_327_1.actors_["1074ui_story"].transform
			local var_330_5 = 0

			if var_330_5 < arg_327_1.time_ and arg_327_1.time_ <= var_330_5 + arg_330_0 then
				arg_327_1.var_.moveOldPos1074ui_story = var_330_4.localPosition
			end

			local var_330_6 = 0.001

			if var_330_5 <= arg_327_1.time_ and arg_327_1.time_ < var_330_5 + var_330_6 then
				local var_330_7 = (arg_327_1.time_ - var_330_5) / var_330_6
				local var_330_8 = Vector3.New(0, -1.055, -6.12)

				var_330_4.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1074ui_story, var_330_8, var_330_7)

				local var_330_9 = manager.ui.mainCamera.transform.position - var_330_4.position

				var_330_4.forward = Vector3.New(var_330_9.x, var_330_9.y, var_330_9.z)

				local var_330_10 = var_330_4.localEulerAngles

				var_330_10.z = 0
				var_330_10.x = 0
				var_330_4.localEulerAngles = var_330_10
			end

			if arg_327_1.time_ >= var_330_5 + var_330_6 and arg_327_1.time_ < var_330_5 + var_330_6 + arg_330_0 then
				var_330_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_330_11 = manager.ui.mainCamera.transform.position - var_330_4.position

				var_330_4.forward = Vector3.New(var_330_11.x, var_330_11.y, var_330_11.z)

				local var_330_12 = var_330_4.localEulerAngles

				var_330_12.z = 0
				var_330_12.x = 0
				var_330_4.localEulerAngles = var_330_12
			end

			local var_330_13 = arg_327_1.actors_["1072ui_story"].transform
			local var_330_14 = 0

			if var_330_14 < arg_327_1.time_ and arg_327_1.time_ <= var_330_14 + arg_330_0 then
				arg_327_1.var_.moveOldPos1072ui_story = var_330_13.localPosition
			end

			local var_330_15 = 0.001

			if var_330_14 <= arg_327_1.time_ and arg_327_1.time_ < var_330_14 + var_330_15 then
				local var_330_16 = (arg_327_1.time_ - var_330_14) / var_330_15
				local var_330_17 = Vector3.New(0, 100, 0)

				var_330_13.localPosition = Vector3.Lerp(arg_327_1.var_.moveOldPos1072ui_story, var_330_17, var_330_16)

				local var_330_18 = manager.ui.mainCamera.transform.position - var_330_13.position

				var_330_13.forward = Vector3.New(var_330_18.x, var_330_18.y, var_330_18.z)

				local var_330_19 = var_330_13.localEulerAngles

				var_330_19.z = 0
				var_330_19.x = 0
				var_330_13.localEulerAngles = var_330_19
			end

			if arg_327_1.time_ >= var_330_14 + var_330_15 and arg_327_1.time_ < var_330_14 + var_330_15 + arg_330_0 then
				var_330_13.localPosition = Vector3.New(0, 100, 0)

				local var_330_20 = manager.ui.mainCamera.transform.position - var_330_13.position

				var_330_13.forward = Vector3.New(var_330_20.x, var_330_20.y, var_330_20.z)

				local var_330_21 = var_330_13.localEulerAngles

				var_330_21.z = 0
				var_330_21.x = 0
				var_330_13.localEulerAngles = var_330_21
			end

			local var_330_22 = 0
			local var_330_23 = 0.25

			if var_330_22 < arg_327_1.time_ and arg_327_1.time_ <= var_330_22 + arg_330_0 then
				arg_327_1.talkMaxDuration = 0
				arg_327_1.dialogCg_.alpha = 1

				arg_327_1.dialog_:SetActive(true)
				SetActive(arg_327_1.leftNameGo_, true)

				local var_330_24 = arg_327_1:FormatText(StoryNameCfg[410].name)

				arg_327_1.leftNameTxt_.text = var_330_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_327_1.leftNameTxt_.transform)

				arg_327_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_327_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_327_1:RecordName(arg_327_1.leftNameTxt_.text)
				SetActive(arg_327_1.iconTrs_.gameObject, false)
				arg_327_1.callingController_:SetSelectedState("normal")

				local var_330_25 = arg_327_1:GetWordFromCfg(120421080)
				local var_330_26 = arg_327_1:FormatText(var_330_25.content)

				arg_327_1.text_.text = var_330_26

				LuaForUtil.ClearLinePrefixSymbol(arg_327_1.text_)

				local var_330_27 = 10
				local var_330_28 = utf8.len(var_330_26)
				local var_330_29 = var_330_27 <= 0 and var_330_23 or var_330_23 * (var_330_28 / var_330_27)

				if var_330_29 > 0 and var_330_23 < var_330_29 then
					arg_327_1.talkMaxDuration = var_330_29

					if var_330_29 + var_330_22 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_29 + var_330_22
					end
				end

				arg_327_1.text_.text = var_330_26
				arg_327_1.typewritter.percent = 0

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421080", "story_v_out_120421.awb") ~= 0 then
					local var_330_30 = manager.audio:GetVoiceLength("story_v_out_120421", "120421080", "story_v_out_120421.awb") / 1000

					if var_330_30 + var_330_22 > arg_327_1.duration_ then
						arg_327_1.duration_ = var_330_30 + var_330_22
					end

					if var_330_25.prefab_name ~= "" and arg_327_1.actors_[var_330_25.prefab_name] ~= nil then
						local var_330_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_327_1.actors_[var_330_25.prefab_name].transform, "story_v_out_120421", "120421080", "story_v_out_120421.awb")

						arg_327_1:RecordAudio("120421080", var_330_31)
						arg_327_1:RecordAudio("120421080", var_330_31)
					else
						arg_327_1:AudioAction("play", "voice", "story_v_out_120421", "120421080", "story_v_out_120421.awb")
					end

					arg_327_1:RecordHistoryTalkVoice("story_v_out_120421", "120421080", "story_v_out_120421.awb")
				end

				arg_327_1:RecordContent(arg_327_1.text_.text)
			end

			local var_330_32 = math.max(var_330_23, arg_327_1.talkMaxDuration)

			if var_330_22 <= arg_327_1.time_ and arg_327_1.time_ < var_330_22 + var_330_32 then
				arg_327_1.typewritter.percent = (arg_327_1.time_ - var_330_22) / var_330_32

				arg_327_1.typewritter:SetDirty()
			end

			if arg_327_1.time_ >= var_330_22 + var_330_32 and arg_327_1.time_ < var_330_22 + var_330_32 + arg_330_0 then
				arg_327_1.typewritter.percent = 1

				arg_327_1.typewritter:SetDirty()
				arg_327_1:ShowNextGo(true)
			end
		end
	end,
	Play120421081 = function(arg_331_0, arg_331_1)
		arg_331_1.time_ = 0
		arg_331_1.frameCnt_ = 0
		arg_331_1.state_ = "playing"
		arg_331_1.curTalkId_ = 120421081
		arg_331_1.duration_ = 8.366

		local var_331_0 = {
			zh = 6.666,
			ja = 8.366
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
				arg_331_0:Play120421082(arg_331_1)
			end
		end

		function arg_331_1.onSingleLineUpdate_(arg_334_0)
			local var_334_0 = arg_331_1.actors_["1074ui_story"]
			local var_334_1 = 0

			if var_334_1 < arg_331_1.time_ and arg_331_1.time_ <= var_334_1 + arg_334_0 and arg_331_1.var_.characterEffect1074ui_story == nil then
				arg_331_1.var_.characterEffect1074ui_story = var_334_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_2 = 0.2

			if var_334_1 <= arg_331_1.time_ and arg_331_1.time_ < var_334_1 + var_334_2 then
				local var_334_3 = (arg_331_1.time_ - var_334_1) / var_334_2

				if arg_331_1.var_.characterEffect1074ui_story then
					local var_334_4 = Mathf.Lerp(0, 0.5, var_334_3)

					arg_331_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_331_1.var_.characterEffect1074ui_story.fillRatio = var_334_4
				end
			end

			if arg_331_1.time_ >= var_334_1 + var_334_2 and arg_331_1.time_ < var_334_1 + var_334_2 + arg_334_0 and arg_331_1.var_.characterEffect1074ui_story then
				local var_334_5 = 0.5

				arg_331_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_331_1.var_.characterEffect1074ui_story.fillRatio = var_334_5
			end

			local var_334_6 = arg_331_1.actors_["1072ui_story"].transform
			local var_334_7 = 0

			if var_334_7 < arg_331_1.time_ and arg_331_1.time_ <= var_334_7 + arg_334_0 then
				arg_331_1.var_.moveOldPos1072ui_story = var_334_6.localPosition
			end

			local var_334_8 = 0.001

			if var_334_7 <= arg_331_1.time_ and arg_331_1.time_ < var_334_7 + var_334_8 then
				local var_334_9 = (arg_331_1.time_ - var_334_7) / var_334_8
				local var_334_10 = Vector3.New(0, -0.71, -6)

				var_334_6.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1072ui_story, var_334_10, var_334_9)

				local var_334_11 = manager.ui.mainCamera.transform.position - var_334_6.position

				var_334_6.forward = Vector3.New(var_334_11.x, var_334_11.y, var_334_11.z)

				local var_334_12 = var_334_6.localEulerAngles

				var_334_12.z = 0
				var_334_12.x = 0
				var_334_6.localEulerAngles = var_334_12
			end

			if arg_331_1.time_ >= var_334_7 + var_334_8 and arg_331_1.time_ < var_334_7 + var_334_8 + arg_334_0 then
				var_334_6.localPosition = Vector3.New(0, -0.71, -6)

				local var_334_13 = manager.ui.mainCamera.transform.position - var_334_6.position

				var_334_6.forward = Vector3.New(var_334_13.x, var_334_13.y, var_334_13.z)

				local var_334_14 = var_334_6.localEulerAngles

				var_334_14.z = 0
				var_334_14.x = 0
				var_334_6.localEulerAngles = var_334_14
			end

			local var_334_15 = 0

			if var_334_15 < arg_331_1.time_ and arg_331_1.time_ <= var_334_15 + arg_334_0 then
				arg_331_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action7_1")
			end

			local var_334_16 = 0

			if var_334_16 < arg_331_1.time_ and arg_331_1.time_ <= var_334_16 + arg_334_0 then
				arg_331_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_334_17 = arg_331_1.actors_["1072ui_story"]
			local var_334_18 = 0

			if var_334_18 < arg_331_1.time_ and arg_331_1.time_ <= var_334_18 + arg_334_0 and arg_331_1.var_.characterEffect1072ui_story == nil then
				arg_331_1.var_.characterEffect1072ui_story = var_334_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_334_19 = 0.2

			if var_334_18 <= arg_331_1.time_ and arg_331_1.time_ < var_334_18 + var_334_19 then
				local var_334_20 = (arg_331_1.time_ - var_334_18) / var_334_19

				if arg_331_1.var_.characterEffect1072ui_story then
					arg_331_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_331_1.time_ >= var_334_18 + var_334_19 and arg_331_1.time_ < var_334_18 + var_334_19 + arg_334_0 and arg_331_1.var_.characterEffect1072ui_story then
				arg_331_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_334_21 = arg_331_1.actors_["1074ui_story"].transform
			local var_334_22 = 0

			if var_334_22 < arg_331_1.time_ and arg_331_1.time_ <= var_334_22 + arg_334_0 then
				arg_331_1.var_.moveOldPos1074ui_story = var_334_21.localPosition
			end

			local var_334_23 = 0.001

			if var_334_22 <= arg_331_1.time_ and arg_331_1.time_ < var_334_22 + var_334_23 then
				local var_334_24 = (arg_331_1.time_ - var_334_22) / var_334_23
				local var_334_25 = Vector3.New(0, 100, 0)

				var_334_21.localPosition = Vector3.Lerp(arg_331_1.var_.moveOldPos1074ui_story, var_334_25, var_334_24)

				local var_334_26 = manager.ui.mainCamera.transform.position - var_334_21.position

				var_334_21.forward = Vector3.New(var_334_26.x, var_334_26.y, var_334_26.z)

				local var_334_27 = var_334_21.localEulerAngles

				var_334_27.z = 0
				var_334_27.x = 0
				var_334_21.localEulerAngles = var_334_27
			end

			if arg_331_1.time_ >= var_334_22 + var_334_23 and arg_331_1.time_ < var_334_22 + var_334_23 + arg_334_0 then
				var_334_21.localPosition = Vector3.New(0, 100, 0)

				local var_334_28 = manager.ui.mainCamera.transform.position - var_334_21.position

				var_334_21.forward = Vector3.New(var_334_28.x, var_334_28.y, var_334_28.z)

				local var_334_29 = var_334_21.localEulerAngles

				var_334_29.z = 0
				var_334_29.x = 0
				var_334_21.localEulerAngles = var_334_29
			end

			local var_334_30 = 0
			local var_334_31 = 0.725

			if var_334_30 < arg_331_1.time_ and arg_331_1.time_ <= var_334_30 + arg_334_0 then
				arg_331_1.talkMaxDuration = 0
				arg_331_1.dialogCg_.alpha = 1

				arg_331_1.dialog_:SetActive(true)
				SetActive(arg_331_1.leftNameGo_, true)

				local var_334_32 = arg_331_1:FormatText(StoryNameCfg[379].name)

				arg_331_1.leftNameTxt_.text = var_334_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_331_1.leftNameTxt_.transform)

				arg_331_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_331_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_331_1:RecordName(arg_331_1.leftNameTxt_.text)
				SetActive(arg_331_1.iconTrs_.gameObject, false)
				arg_331_1.callingController_:SetSelectedState("normal")

				local var_334_33 = arg_331_1:GetWordFromCfg(120421081)
				local var_334_34 = arg_331_1:FormatText(var_334_33.content)

				arg_331_1.text_.text = var_334_34

				LuaForUtil.ClearLinePrefixSymbol(arg_331_1.text_)

				local var_334_35 = 29
				local var_334_36 = utf8.len(var_334_34)
				local var_334_37 = var_334_35 <= 0 and var_334_31 or var_334_31 * (var_334_36 / var_334_35)

				if var_334_37 > 0 and var_334_31 < var_334_37 then
					arg_331_1.talkMaxDuration = var_334_37

					if var_334_37 + var_334_30 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_37 + var_334_30
					end
				end

				arg_331_1.text_.text = var_334_34
				arg_331_1.typewritter.percent = 0

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421081", "story_v_out_120421.awb") ~= 0 then
					local var_334_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421081", "story_v_out_120421.awb") / 1000

					if var_334_38 + var_334_30 > arg_331_1.duration_ then
						arg_331_1.duration_ = var_334_38 + var_334_30
					end

					if var_334_33.prefab_name ~= "" and arg_331_1.actors_[var_334_33.prefab_name] ~= nil then
						local var_334_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_331_1.actors_[var_334_33.prefab_name].transform, "story_v_out_120421", "120421081", "story_v_out_120421.awb")

						arg_331_1:RecordAudio("120421081", var_334_39)
						arg_331_1:RecordAudio("120421081", var_334_39)
					else
						arg_331_1:AudioAction("play", "voice", "story_v_out_120421", "120421081", "story_v_out_120421.awb")
					end

					arg_331_1:RecordHistoryTalkVoice("story_v_out_120421", "120421081", "story_v_out_120421.awb")
				end

				arg_331_1:RecordContent(arg_331_1.text_.text)
			end

			local var_334_40 = math.max(var_334_31, arg_331_1.talkMaxDuration)

			if var_334_30 <= arg_331_1.time_ and arg_331_1.time_ < var_334_30 + var_334_40 then
				arg_331_1.typewritter.percent = (arg_331_1.time_ - var_334_30) / var_334_40

				arg_331_1.typewritter:SetDirty()
			end

			if arg_331_1.time_ >= var_334_30 + var_334_40 and arg_331_1.time_ < var_334_30 + var_334_40 + arg_334_0 then
				arg_331_1.typewritter.percent = 1

				arg_331_1.typewritter:SetDirty()
				arg_331_1:ShowNextGo(true)
			end
		end
	end,
	Play120421082 = function(arg_335_0, arg_335_1)
		arg_335_1.time_ = 0
		arg_335_1.frameCnt_ = 0
		arg_335_1.state_ = "playing"
		arg_335_1.curTalkId_ = 120421082
		arg_335_1.duration_ = 1.033

		local var_335_0 = {
			zh = 0.999999999999,
			ja = 1.033
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
				arg_335_0:Play120421083(arg_335_1)
			end
		end

		function arg_335_1.onSingleLineUpdate_(arg_338_0)
			local var_338_0 = arg_335_1.actors_["1074ui_story"]
			local var_338_1 = 0

			if var_338_1 < arg_335_1.time_ and arg_335_1.time_ <= var_338_1 + arg_338_0 and arg_335_1.var_.characterEffect1074ui_story == nil then
				arg_335_1.var_.characterEffect1074ui_story = var_338_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_338_2 = 0.2

			if var_338_1 <= arg_335_1.time_ and arg_335_1.time_ < var_338_1 + var_338_2 then
				local var_338_3 = (arg_335_1.time_ - var_338_1) / var_338_2

				if arg_335_1.var_.characterEffect1074ui_story then
					arg_335_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_335_1.time_ >= var_338_1 + var_338_2 and arg_335_1.time_ < var_338_1 + var_338_2 + arg_338_0 and arg_335_1.var_.characterEffect1074ui_story then
				arg_335_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_338_4 = arg_335_1.actors_["1074ui_story"].transform
			local var_338_5 = 0

			if var_338_5 < arg_335_1.time_ and arg_335_1.time_ <= var_338_5 + arg_338_0 then
				arg_335_1.var_.moveOldPos1074ui_story = var_338_4.localPosition
			end

			local var_338_6 = 0.001

			if var_338_5 <= arg_335_1.time_ and arg_335_1.time_ < var_338_5 + var_338_6 then
				local var_338_7 = (arg_335_1.time_ - var_338_5) / var_338_6
				local var_338_8 = Vector3.New(0, -1.055, -6.12)

				var_338_4.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1074ui_story, var_338_8, var_338_7)

				local var_338_9 = manager.ui.mainCamera.transform.position - var_338_4.position

				var_338_4.forward = Vector3.New(var_338_9.x, var_338_9.y, var_338_9.z)

				local var_338_10 = var_338_4.localEulerAngles

				var_338_10.z = 0
				var_338_10.x = 0
				var_338_4.localEulerAngles = var_338_10
			end

			if arg_335_1.time_ >= var_338_5 + var_338_6 and arg_335_1.time_ < var_338_5 + var_338_6 + arg_338_0 then
				var_338_4.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_338_11 = manager.ui.mainCamera.transform.position - var_338_4.position

				var_338_4.forward = Vector3.New(var_338_11.x, var_338_11.y, var_338_11.z)

				local var_338_12 = var_338_4.localEulerAngles

				var_338_12.z = 0
				var_338_12.x = 0
				var_338_4.localEulerAngles = var_338_12
			end

			local var_338_13 = arg_335_1.actors_["1072ui_story"].transform
			local var_338_14 = 0

			if var_338_14 < arg_335_1.time_ and arg_335_1.time_ <= var_338_14 + arg_338_0 then
				arg_335_1.var_.moveOldPos1072ui_story = var_338_13.localPosition
			end

			local var_338_15 = 0.001

			if var_338_14 <= arg_335_1.time_ and arg_335_1.time_ < var_338_14 + var_338_15 then
				local var_338_16 = (arg_335_1.time_ - var_338_14) / var_338_15
				local var_338_17 = Vector3.New(0, 100, 0)

				var_338_13.localPosition = Vector3.Lerp(arg_335_1.var_.moveOldPos1072ui_story, var_338_17, var_338_16)

				local var_338_18 = manager.ui.mainCamera.transform.position - var_338_13.position

				var_338_13.forward = Vector3.New(var_338_18.x, var_338_18.y, var_338_18.z)

				local var_338_19 = var_338_13.localEulerAngles

				var_338_19.z = 0
				var_338_19.x = 0
				var_338_13.localEulerAngles = var_338_19
			end

			if arg_335_1.time_ >= var_338_14 + var_338_15 and arg_335_1.time_ < var_338_14 + var_338_15 + arg_338_0 then
				var_338_13.localPosition = Vector3.New(0, 100, 0)

				local var_338_20 = manager.ui.mainCamera.transform.position - var_338_13.position

				var_338_13.forward = Vector3.New(var_338_20.x, var_338_20.y, var_338_20.z)

				local var_338_21 = var_338_13.localEulerAngles

				var_338_21.z = 0
				var_338_21.x = 0
				var_338_13.localEulerAngles = var_338_21
			end

			local var_338_22 = 0
			local var_338_23 = 0.05

			if var_338_22 < arg_335_1.time_ and arg_335_1.time_ <= var_338_22 + arg_338_0 then
				arg_335_1.talkMaxDuration = 0
				arg_335_1.dialogCg_.alpha = 1

				arg_335_1.dialog_:SetActive(true)
				SetActive(arg_335_1.leftNameGo_, true)

				local var_338_24 = arg_335_1:FormatText(StoryNameCfg[410].name)

				arg_335_1.leftNameTxt_.text = var_338_24

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_335_1.leftNameTxt_.transform)

				arg_335_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_335_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_335_1:RecordName(arg_335_1.leftNameTxt_.text)
				SetActive(arg_335_1.iconTrs_.gameObject, false)
				arg_335_1.callingController_:SetSelectedState("normal")

				local var_338_25 = arg_335_1:GetWordFromCfg(120421082)
				local var_338_26 = arg_335_1:FormatText(var_338_25.content)

				arg_335_1.text_.text = var_338_26

				LuaForUtil.ClearLinePrefixSymbol(arg_335_1.text_)

				local var_338_27 = 2
				local var_338_28 = utf8.len(var_338_26)
				local var_338_29 = var_338_27 <= 0 and var_338_23 or var_338_23 * (var_338_28 / var_338_27)

				if var_338_29 > 0 and var_338_23 < var_338_29 then
					arg_335_1.talkMaxDuration = var_338_29

					if var_338_29 + var_338_22 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_29 + var_338_22
					end
				end

				arg_335_1.text_.text = var_338_26
				arg_335_1.typewritter.percent = 0

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421082", "story_v_out_120421.awb") ~= 0 then
					local var_338_30 = manager.audio:GetVoiceLength("story_v_out_120421", "120421082", "story_v_out_120421.awb") / 1000

					if var_338_30 + var_338_22 > arg_335_1.duration_ then
						arg_335_1.duration_ = var_338_30 + var_338_22
					end

					if var_338_25.prefab_name ~= "" and arg_335_1.actors_[var_338_25.prefab_name] ~= nil then
						local var_338_31 = LuaForUtil.PlayVoiceWithCriLipsync(arg_335_1.actors_[var_338_25.prefab_name].transform, "story_v_out_120421", "120421082", "story_v_out_120421.awb")

						arg_335_1:RecordAudio("120421082", var_338_31)
						arg_335_1:RecordAudio("120421082", var_338_31)
					else
						arg_335_1:AudioAction("play", "voice", "story_v_out_120421", "120421082", "story_v_out_120421.awb")
					end

					arg_335_1:RecordHistoryTalkVoice("story_v_out_120421", "120421082", "story_v_out_120421.awb")
				end

				arg_335_1:RecordContent(arg_335_1.text_.text)
			end

			local var_338_32 = math.max(var_338_23, arg_335_1.talkMaxDuration)

			if var_338_22 <= arg_335_1.time_ and arg_335_1.time_ < var_338_22 + var_338_32 then
				arg_335_1.typewritter.percent = (arg_335_1.time_ - var_338_22) / var_338_32

				arg_335_1.typewritter:SetDirty()
			end

			if arg_335_1.time_ >= var_338_22 + var_338_32 and arg_335_1.time_ < var_338_22 + var_338_32 + arg_338_0 then
				arg_335_1.typewritter.percent = 1

				arg_335_1.typewritter:SetDirty()
				arg_335_1:ShowNextGo(true)
			end
		end
	end,
	Play120421083 = function(arg_339_0, arg_339_1)
		arg_339_1.time_ = 0
		arg_339_1.frameCnt_ = 0
		arg_339_1.state_ = "playing"
		arg_339_1.curTalkId_ = 120421083
		arg_339_1.duration_ = 5.833

		local var_339_0 = {
			zh = 3.266,
			ja = 5.833
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
				arg_339_0:Play120421084(arg_339_1)
			end
		end

		function arg_339_1.onSingleLineUpdate_(arg_342_0)
			local var_342_0 = 0
			local var_342_1 = 0.35

			if var_342_0 < arg_339_1.time_ and arg_339_1.time_ <= var_342_0 + arg_342_0 then
				arg_339_1.talkMaxDuration = 0
				arg_339_1.dialogCg_.alpha = 1

				arg_339_1.dialog_:SetActive(true)
				SetActive(arg_339_1.leftNameGo_, true)

				local var_342_2 = arg_339_1:FormatText(StoryNameCfg[410].name)

				arg_339_1.leftNameTxt_.text = var_342_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_339_1.leftNameTxt_.transform)

				arg_339_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_339_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_339_1:RecordName(arg_339_1.leftNameTxt_.text)
				SetActive(arg_339_1.iconTrs_.gameObject, false)
				arg_339_1.callingController_:SetSelectedState("normal")

				local var_342_3 = arg_339_1:GetWordFromCfg(120421083)
				local var_342_4 = arg_339_1:FormatText(var_342_3.content)

				arg_339_1.text_.text = var_342_4

				LuaForUtil.ClearLinePrefixSymbol(arg_339_1.text_)

				local var_342_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421083", "story_v_out_120421.awb") ~= 0 then
					local var_342_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421083", "story_v_out_120421.awb") / 1000

					if var_342_8 + var_342_0 > arg_339_1.duration_ then
						arg_339_1.duration_ = var_342_8 + var_342_0
					end

					if var_342_3.prefab_name ~= "" and arg_339_1.actors_[var_342_3.prefab_name] ~= nil then
						local var_342_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_339_1.actors_[var_342_3.prefab_name].transform, "story_v_out_120421", "120421083", "story_v_out_120421.awb")

						arg_339_1:RecordAudio("120421083", var_342_9)
						arg_339_1:RecordAudio("120421083", var_342_9)
					else
						arg_339_1:AudioAction("play", "voice", "story_v_out_120421", "120421083", "story_v_out_120421.awb")
					end

					arg_339_1:RecordHistoryTalkVoice("story_v_out_120421", "120421083", "story_v_out_120421.awb")
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
	Play120421084 = function(arg_343_0, arg_343_1)
		arg_343_1.time_ = 0
		arg_343_1.frameCnt_ = 0
		arg_343_1.state_ = "playing"
		arg_343_1.curTalkId_ = 120421084
		arg_343_1.duration_ = 5

		SetActive(arg_343_1.tipsGo_, false)

		function arg_343_1.onSingleLineFinish_()
			arg_343_1.onSingleLineUpdate_ = nil
			arg_343_1.onSingleLineFinish_ = nil
			arg_343_1.state_ = "waiting"
		end

		function arg_343_1.playNext_(arg_345_0)
			if arg_345_0 == 1 then
				arg_343_0:Play120421085(arg_343_1)
			end
		end

		function arg_343_1.onSingleLineUpdate_(arg_346_0)
			local var_346_0 = arg_343_1.actors_["1074ui_story"].transform
			local var_346_1 = 0

			if var_346_1 < arg_343_1.time_ and arg_343_1.time_ <= var_346_1 + arg_346_0 then
				arg_343_1.var_.moveOldPos1074ui_story = var_346_0.localPosition
			end

			local var_346_2 = 0.001

			if var_346_1 <= arg_343_1.time_ and arg_343_1.time_ < var_346_1 + var_346_2 then
				local var_346_3 = (arg_343_1.time_ - var_346_1) / var_346_2
				local var_346_4 = Vector3.New(0, 100, 0)

				var_346_0.localPosition = Vector3.Lerp(arg_343_1.var_.moveOldPos1074ui_story, var_346_4, var_346_3)

				local var_346_5 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_5.x, var_346_5.y, var_346_5.z)

				local var_346_6 = var_346_0.localEulerAngles

				var_346_6.z = 0
				var_346_6.x = 0
				var_346_0.localEulerAngles = var_346_6
			end

			if arg_343_1.time_ >= var_346_1 + var_346_2 and arg_343_1.time_ < var_346_1 + var_346_2 + arg_346_0 then
				var_346_0.localPosition = Vector3.New(0, 100, 0)

				local var_346_7 = manager.ui.mainCamera.transform.position - var_346_0.position

				var_346_0.forward = Vector3.New(var_346_7.x, var_346_7.y, var_346_7.z)

				local var_346_8 = var_346_0.localEulerAngles

				var_346_8.z = 0
				var_346_8.x = 0
				var_346_0.localEulerAngles = var_346_8
			end

			local var_346_9 = 0
			local var_346_10 = 1.25

			if var_346_9 < arg_343_1.time_ and arg_343_1.time_ <= var_346_9 + arg_346_0 then
				arg_343_1.talkMaxDuration = 0
				arg_343_1.dialogCg_.alpha = 1

				arg_343_1.dialog_:SetActive(true)
				SetActive(arg_343_1.leftNameGo_, false)

				arg_343_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_343_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_343_1:RecordName(arg_343_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_343_1.iconTrs_.gameObject, false)
				arg_343_1.callingController_:SetSelectedState("normal")

				local var_346_11 = arg_343_1:GetWordFromCfg(120421084)
				local var_346_12 = arg_343_1:FormatText(var_346_11.content)

				arg_343_1.text_.text = var_346_12

				LuaForUtil.ClearLinePrefixSymbol(arg_343_1.text_)

				local var_346_13 = 50
				local var_346_14 = utf8.len(var_346_12)
				local var_346_15 = var_346_13 <= 0 and var_346_10 or var_346_10 * (var_346_14 / var_346_13)

				if var_346_15 > 0 and var_346_10 < var_346_15 then
					arg_343_1.talkMaxDuration = var_346_15

					if var_346_15 + var_346_9 > arg_343_1.duration_ then
						arg_343_1.duration_ = var_346_15 + var_346_9
					end
				end

				arg_343_1.text_.text = var_346_12
				arg_343_1.typewritter.percent = 0

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(false)
				arg_343_1:RecordContent(arg_343_1.text_.text)
			end

			local var_346_16 = math.max(var_346_10, arg_343_1.talkMaxDuration)

			if var_346_9 <= arg_343_1.time_ and arg_343_1.time_ < var_346_9 + var_346_16 then
				arg_343_1.typewritter.percent = (arg_343_1.time_ - var_346_9) / var_346_16

				arg_343_1.typewritter:SetDirty()
			end

			if arg_343_1.time_ >= var_346_9 + var_346_16 and arg_343_1.time_ < var_346_9 + var_346_16 + arg_346_0 then
				arg_343_1.typewritter.percent = 1

				arg_343_1.typewritter:SetDirty()
				arg_343_1:ShowNextGo(true)
			end
		end
	end,
	Play120421085 = function(arg_347_0, arg_347_1)
		arg_347_1.time_ = 0
		arg_347_1.frameCnt_ = 0
		arg_347_1.state_ = "playing"
		arg_347_1.curTalkId_ = 120421085
		arg_347_1.duration_ = 4.4

		local var_347_0 = {
			zh = 4.4,
			ja = 4.033
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
				arg_347_0:Play120421086(arg_347_1)
			end
		end

		function arg_347_1.onSingleLineUpdate_(arg_350_0)
			local var_350_0 = arg_347_1.actors_["1074ui_story"]
			local var_350_1 = 0

			if var_350_1 < arg_347_1.time_ and arg_347_1.time_ <= var_350_1 + arg_350_0 and arg_347_1.var_.characterEffect1074ui_story == nil then
				arg_347_1.var_.characterEffect1074ui_story = var_350_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_350_2 = 0.2

			if var_350_1 <= arg_347_1.time_ and arg_347_1.time_ < var_350_1 + var_350_2 then
				local var_350_3 = (arg_347_1.time_ - var_350_1) / var_350_2

				if arg_347_1.var_.characterEffect1074ui_story then
					arg_347_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_347_1.time_ >= var_350_1 + var_350_2 and arg_347_1.time_ < var_350_1 + var_350_2 + arg_350_0 and arg_347_1.var_.characterEffect1074ui_story then
				arg_347_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_350_4 = 0

			if var_350_4 < arg_347_1.time_ and arg_347_1.time_ <= var_350_4 + arg_350_0 then
				arg_347_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_350_5 = arg_347_1.actors_["1074ui_story"].transform
			local var_350_6 = 0

			if var_350_6 < arg_347_1.time_ and arg_347_1.time_ <= var_350_6 + arg_350_0 then
				arg_347_1.var_.moveOldPos1074ui_story = var_350_5.localPosition
			end

			local var_350_7 = 0.001

			if var_350_6 <= arg_347_1.time_ and arg_347_1.time_ < var_350_6 + var_350_7 then
				local var_350_8 = (arg_347_1.time_ - var_350_6) / var_350_7
				local var_350_9 = Vector3.New(0, -1.055, -6.12)

				var_350_5.localPosition = Vector3.Lerp(arg_347_1.var_.moveOldPos1074ui_story, var_350_9, var_350_8)

				local var_350_10 = manager.ui.mainCamera.transform.position - var_350_5.position

				var_350_5.forward = Vector3.New(var_350_10.x, var_350_10.y, var_350_10.z)

				local var_350_11 = var_350_5.localEulerAngles

				var_350_11.z = 0
				var_350_11.x = 0
				var_350_5.localEulerAngles = var_350_11
			end

			if arg_347_1.time_ >= var_350_6 + var_350_7 and arg_347_1.time_ < var_350_6 + var_350_7 + arg_350_0 then
				var_350_5.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_350_12 = manager.ui.mainCamera.transform.position - var_350_5.position

				var_350_5.forward = Vector3.New(var_350_12.x, var_350_12.y, var_350_12.z)

				local var_350_13 = var_350_5.localEulerAngles

				var_350_13.z = 0
				var_350_13.x = 0
				var_350_5.localEulerAngles = var_350_13
			end

			local var_350_14 = 0
			local var_350_15 = 0.475

			if var_350_14 < arg_347_1.time_ and arg_347_1.time_ <= var_350_14 + arg_350_0 then
				arg_347_1.talkMaxDuration = 0
				arg_347_1.dialogCg_.alpha = 1

				arg_347_1.dialog_:SetActive(true)
				SetActive(arg_347_1.leftNameGo_, true)

				local var_350_16 = arg_347_1:FormatText(StoryNameCfg[410].name)

				arg_347_1.leftNameTxt_.text = var_350_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_347_1.leftNameTxt_.transform)

				arg_347_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_347_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_347_1:RecordName(arg_347_1.leftNameTxt_.text)
				SetActive(arg_347_1.iconTrs_.gameObject, false)
				arg_347_1.callingController_:SetSelectedState("normal")

				local var_350_17 = arg_347_1:GetWordFromCfg(120421085)
				local var_350_18 = arg_347_1:FormatText(var_350_17.content)

				arg_347_1.text_.text = var_350_18

				LuaForUtil.ClearLinePrefixSymbol(arg_347_1.text_)

				local var_350_19 = 19
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421085", "story_v_out_120421.awb") ~= 0 then
					local var_350_22 = manager.audio:GetVoiceLength("story_v_out_120421", "120421085", "story_v_out_120421.awb") / 1000

					if var_350_22 + var_350_14 > arg_347_1.duration_ then
						arg_347_1.duration_ = var_350_22 + var_350_14
					end

					if var_350_17.prefab_name ~= "" and arg_347_1.actors_[var_350_17.prefab_name] ~= nil then
						local var_350_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_347_1.actors_[var_350_17.prefab_name].transform, "story_v_out_120421", "120421085", "story_v_out_120421.awb")

						arg_347_1:RecordAudio("120421085", var_350_23)
						arg_347_1:RecordAudio("120421085", var_350_23)
					else
						arg_347_1:AudioAction("play", "voice", "story_v_out_120421", "120421085", "story_v_out_120421.awb")
					end

					arg_347_1:RecordHistoryTalkVoice("story_v_out_120421", "120421085", "story_v_out_120421.awb")
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
	Play120421086 = function(arg_351_0, arg_351_1)
		arg_351_1.time_ = 0
		arg_351_1.frameCnt_ = 0
		arg_351_1.state_ = "playing"
		arg_351_1.curTalkId_ = 120421086
		arg_351_1.duration_ = 13.833

		local var_351_0 = {
			zh = 7,
			ja = 13.833
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
				arg_351_0:Play120421087(arg_351_1)
			end
		end

		function arg_351_1.onSingleLineUpdate_(arg_354_0)
			local var_354_0 = arg_351_1.actors_["1074ui_story"]
			local var_354_1 = 0

			if var_354_1 < arg_351_1.time_ and arg_351_1.time_ <= var_354_1 + arg_354_0 and arg_351_1.var_.characterEffect1074ui_story == nil then
				arg_351_1.var_.characterEffect1074ui_story = var_354_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_2 = 0.2

			if var_354_1 <= arg_351_1.time_ and arg_351_1.time_ < var_354_1 + var_354_2 then
				local var_354_3 = (arg_351_1.time_ - var_354_1) / var_354_2

				if arg_351_1.var_.characterEffect1074ui_story then
					local var_354_4 = Mathf.Lerp(0, 0.5, var_354_3)

					arg_351_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_351_1.var_.characterEffect1074ui_story.fillRatio = var_354_4
				end
			end

			if arg_351_1.time_ >= var_354_1 + var_354_2 and arg_351_1.time_ < var_354_1 + var_354_2 + arg_354_0 and arg_351_1.var_.characterEffect1074ui_story then
				local var_354_5 = 0.5

				arg_351_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_351_1.var_.characterEffect1074ui_story.fillRatio = var_354_5
			end

			local var_354_6 = arg_351_1.actors_["1072ui_story"].transform
			local var_354_7 = 0

			if var_354_7 < arg_351_1.time_ and arg_351_1.time_ <= var_354_7 + arg_354_0 then
				arg_351_1.var_.moveOldPos1072ui_story = var_354_6.localPosition
			end

			local var_354_8 = 0.001

			if var_354_7 <= arg_351_1.time_ and arg_351_1.time_ < var_354_7 + var_354_8 then
				local var_354_9 = (arg_351_1.time_ - var_354_7) / var_354_8
				local var_354_10 = Vector3.New(0, -0.71, -6)

				var_354_6.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1072ui_story, var_354_10, var_354_9)

				local var_354_11 = manager.ui.mainCamera.transform.position - var_354_6.position

				var_354_6.forward = Vector3.New(var_354_11.x, var_354_11.y, var_354_11.z)

				local var_354_12 = var_354_6.localEulerAngles

				var_354_12.z = 0
				var_354_12.x = 0
				var_354_6.localEulerAngles = var_354_12
			end

			if arg_351_1.time_ >= var_354_7 + var_354_8 and arg_351_1.time_ < var_354_7 + var_354_8 + arg_354_0 then
				var_354_6.localPosition = Vector3.New(0, -0.71, -6)

				local var_354_13 = manager.ui.mainCamera.transform.position - var_354_6.position

				var_354_6.forward = Vector3.New(var_354_13.x, var_354_13.y, var_354_13.z)

				local var_354_14 = var_354_6.localEulerAngles

				var_354_14.z = 0
				var_354_14.x = 0
				var_354_6.localEulerAngles = var_354_14
			end

			local var_354_15 = 0

			if var_354_15 < arg_351_1.time_ and arg_351_1.time_ <= var_354_15 + arg_354_0 then
				arg_351_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/story1072/story1072action/1072action1_1")
			end

			local var_354_16 = 0

			if var_354_16 < arg_351_1.time_ and arg_351_1.time_ <= var_354_16 + arg_354_0 then
				arg_351_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_354_17 = arg_351_1.actors_["1072ui_story"]
			local var_354_18 = 0

			if var_354_18 < arg_351_1.time_ and arg_351_1.time_ <= var_354_18 + arg_354_0 and arg_351_1.var_.characterEffect1072ui_story == nil then
				arg_351_1.var_.characterEffect1072ui_story = var_354_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_354_19 = 0.2

			if var_354_18 <= arg_351_1.time_ and arg_351_1.time_ < var_354_18 + var_354_19 then
				local var_354_20 = (arg_351_1.time_ - var_354_18) / var_354_19

				if arg_351_1.var_.characterEffect1072ui_story then
					arg_351_1.var_.characterEffect1072ui_story.fillFlat = false
				end
			end

			if arg_351_1.time_ >= var_354_18 + var_354_19 and arg_351_1.time_ < var_354_18 + var_354_19 + arg_354_0 and arg_351_1.var_.characterEffect1072ui_story then
				arg_351_1.var_.characterEffect1072ui_story.fillFlat = false
			end

			local var_354_21 = arg_351_1.actors_["1074ui_story"].transform
			local var_354_22 = 0

			if var_354_22 < arg_351_1.time_ and arg_351_1.time_ <= var_354_22 + arg_354_0 then
				arg_351_1.var_.moveOldPos1074ui_story = var_354_21.localPosition
			end

			local var_354_23 = 0.001

			if var_354_22 <= arg_351_1.time_ and arg_351_1.time_ < var_354_22 + var_354_23 then
				local var_354_24 = (arg_351_1.time_ - var_354_22) / var_354_23
				local var_354_25 = Vector3.New(0, 100, 0)

				var_354_21.localPosition = Vector3.Lerp(arg_351_1.var_.moveOldPos1074ui_story, var_354_25, var_354_24)

				local var_354_26 = manager.ui.mainCamera.transform.position - var_354_21.position

				var_354_21.forward = Vector3.New(var_354_26.x, var_354_26.y, var_354_26.z)

				local var_354_27 = var_354_21.localEulerAngles

				var_354_27.z = 0
				var_354_27.x = 0
				var_354_21.localEulerAngles = var_354_27
			end

			if arg_351_1.time_ >= var_354_22 + var_354_23 and arg_351_1.time_ < var_354_22 + var_354_23 + arg_354_0 then
				var_354_21.localPosition = Vector3.New(0, 100, 0)

				local var_354_28 = manager.ui.mainCamera.transform.position - var_354_21.position

				var_354_21.forward = Vector3.New(var_354_28.x, var_354_28.y, var_354_28.z)

				local var_354_29 = var_354_21.localEulerAngles

				var_354_29.z = 0
				var_354_29.x = 0
				var_354_21.localEulerAngles = var_354_29
			end

			local var_354_30 = 0
			local var_354_31 = 0.825

			if var_354_30 < arg_351_1.time_ and arg_351_1.time_ <= var_354_30 + arg_354_0 then
				arg_351_1.talkMaxDuration = 0
				arg_351_1.dialogCg_.alpha = 1

				arg_351_1.dialog_:SetActive(true)
				SetActive(arg_351_1.leftNameGo_, true)

				local var_354_32 = arg_351_1:FormatText(StoryNameCfg[379].name)

				arg_351_1.leftNameTxt_.text = var_354_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_351_1.leftNameTxt_.transform)

				arg_351_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_351_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_351_1:RecordName(arg_351_1.leftNameTxt_.text)
				SetActive(arg_351_1.iconTrs_.gameObject, false)
				arg_351_1.callingController_:SetSelectedState("normal")

				local var_354_33 = arg_351_1:GetWordFromCfg(120421086)
				local var_354_34 = arg_351_1:FormatText(var_354_33.content)

				arg_351_1.text_.text = var_354_34

				LuaForUtil.ClearLinePrefixSymbol(arg_351_1.text_)

				local var_354_35 = 33
				local var_354_36 = utf8.len(var_354_34)
				local var_354_37 = var_354_35 <= 0 and var_354_31 or var_354_31 * (var_354_36 / var_354_35)

				if var_354_37 > 0 and var_354_31 < var_354_37 then
					arg_351_1.talkMaxDuration = var_354_37

					if var_354_37 + var_354_30 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_37 + var_354_30
					end
				end

				arg_351_1.text_.text = var_354_34
				arg_351_1.typewritter.percent = 0

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421086", "story_v_out_120421.awb") ~= 0 then
					local var_354_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421086", "story_v_out_120421.awb") / 1000

					if var_354_38 + var_354_30 > arg_351_1.duration_ then
						arg_351_1.duration_ = var_354_38 + var_354_30
					end

					if var_354_33.prefab_name ~= "" and arg_351_1.actors_[var_354_33.prefab_name] ~= nil then
						local var_354_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_351_1.actors_[var_354_33.prefab_name].transform, "story_v_out_120421", "120421086", "story_v_out_120421.awb")

						arg_351_1:RecordAudio("120421086", var_354_39)
						arg_351_1:RecordAudio("120421086", var_354_39)
					else
						arg_351_1:AudioAction("play", "voice", "story_v_out_120421", "120421086", "story_v_out_120421.awb")
					end

					arg_351_1:RecordHistoryTalkVoice("story_v_out_120421", "120421086", "story_v_out_120421.awb")
				end

				arg_351_1:RecordContent(arg_351_1.text_.text)
			end

			local var_354_40 = math.max(var_354_31, arg_351_1.talkMaxDuration)

			if var_354_30 <= arg_351_1.time_ and arg_351_1.time_ < var_354_30 + var_354_40 then
				arg_351_1.typewritter.percent = (arg_351_1.time_ - var_354_30) / var_354_40

				arg_351_1.typewritter:SetDirty()
			end

			if arg_351_1.time_ >= var_354_30 + var_354_40 and arg_351_1.time_ < var_354_30 + var_354_40 + arg_354_0 then
				arg_351_1.typewritter.percent = 1

				arg_351_1.typewritter:SetDirty()
				arg_351_1:ShowNextGo(true)
			end
		end
	end,
	Play120421087 = function(arg_355_0, arg_355_1)
		arg_355_1.time_ = 0
		arg_355_1.frameCnt_ = 0
		arg_355_1.state_ = "playing"
		arg_355_1.curTalkId_ = 120421087
		arg_355_1.duration_ = 13

		local var_355_0 = {
			zh = 9.866,
			ja = 13
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
				arg_355_0:Play120421088(arg_355_1)
			end
		end

		function arg_355_1.onSingleLineUpdate_(arg_358_0)
			local var_358_0 = arg_355_1.actors_["1072ui_story"].transform
			local var_358_1 = 0

			if var_358_1 < arg_355_1.time_ and arg_355_1.time_ <= var_358_1 + arg_358_0 then
				arg_355_1.var_.moveOldPos1072ui_story = var_358_0.localPosition
			end

			local var_358_2 = 0.001

			if var_358_1 <= arg_355_1.time_ and arg_355_1.time_ < var_358_1 + var_358_2 then
				local var_358_3 = (arg_355_1.time_ - var_358_1) / var_358_2
				local var_358_4 = Vector3.New(0, -0.71, -6)

				var_358_0.localPosition = Vector3.Lerp(arg_355_1.var_.moveOldPos1072ui_story, var_358_4, var_358_3)

				local var_358_5 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_5.x, var_358_5.y, var_358_5.z)

				local var_358_6 = var_358_0.localEulerAngles

				var_358_6.z = 0
				var_358_6.x = 0
				var_358_0.localEulerAngles = var_358_6
			end

			if arg_355_1.time_ >= var_358_1 + var_358_2 and arg_355_1.time_ < var_358_1 + var_358_2 + arg_358_0 then
				var_358_0.localPosition = Vector3.New(0, -0.71, -6)

				local var_358_7 = manager.ui.mainCamera.transform.position - var_358_0.position

				var_358_0.forward = Vector3.New(var_358_7.x, var_358_7.y, var_358_7.z)

				local var_358_8 = var_358_0.localEulerAngles

				var_358_8.z = 0
				var_358_8.x = 0
				var_358_0.localEulerAngles = var_358_8
			end

			local var_358_9 = 0

			if var_358_9 < arg_355_1.time_ and arg_355_1.time_ <= var_358_9 + arg_358_0 then
				arg_355_1:PlayTimeline("1072ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0202cva")
			end

			local var_358_10 = 0
			local var_358_11 = 1.175

			if var_358_10 < arg_355_1.time_ and arg_355_1.time_ <= var_358_10 + arg_358_0 then
				arg_355_1.talkMaxDuration = 0
				arg_355_1.dialogCg_.alpha = 1

				arg_355_1.dialog_:SetActive(true)
				SetActive(arg_355_1.leftNameGo_, true)

				local var_358_12 = arg_355_1:FormatText(StoryNameCfg[379].name)

				arg_355_1.leftNameTxt_.text = var_358_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_355_1.leftNameTxt_.transform)

				arg_355_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_355_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_355_1:RecordName(arg_355_1.leftNameTxt_.text)
				SetActive(arg_355_1.iconTrs_.gameObject, false)
				arg_355_1.callingController_:SetSelectedState("normal")

				local var_358_13 = arg_355_1:GetWordFromCfg(120421087)
				local var_358_14 = arg_355_1:FormatText(var_358_13.content)

				arg_355_1.text_.text = var_358_14

				LuaForUtil.ClearLinePrefixSymbol(arg_355_1.text_)

				local var_358_15 = 47
				local var_358_16 = utf8.len(var_358_14)
				local var_358_17 = var_358_15 <= 0 and var_358_11 or var_358_11 * (var_358_16 / var_358_15)

				if var_358_17 > 0 and var_358_11 < var_358_17 then
					arg_355_1.talkMaxDuration = var_358_17

					if var_358_17 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_17 + var_358_10
					end
				end

				arg_355_1.text_.text = var_358_14
				arg_355_1.typewritter.percent = 0

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421087", "story_v_out_120421.awb") ~= 0 then
					local var_358_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421087", "story_v_out_120421.awb") / 1000

					if var_358_18 + var_358_10 > arg_355_1.duration_ then
						arg_355_1.duration_ = var_358_18 + var_358_10
					end

					if var_358_13.prefab_name ~= "" and arg_355_1.actors_[var_358_13.prefab_name] ~= nil then
						local var_358_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_355_1.actors_[var_358_13.prefab_name].transform, "story_v_out_120421", "120421087", "story_v_out_120421.awb")

						arg_355_1:RecordAudio("120421087", var_358_19)
						arg_355_1:RecordAudio("120421087", var_358_19)
					else
						arg_355_1:AudioAction("play", "voice", "story_v_out_120421", "120421087", "story_v_out_120421.awb")
					end

					arg_355_1:RecordHistoryTalkVoice("story_v_out_120421", "120421087", "story_v_out_120421.awb")
				end

				arg_355_1:RecordContent(arg_355_1.text_.text)
			end

			local var_358_20 = math.max(var_358_11, arg_355_1.talkMaxDuration)

			if var_358_10 <= arg_355_1.time_ and arg_355_1.time_ < var_358_10 + var_358_20 then
				arg_355_1.typewritter.percent = (arg_355_1.time_ - var_358_10) / var_358_20

				arg_355_1.typewritter:SetDirty()
			end

			if arg_355_1.time_ >= var_358_10 + var_358_20 and arg_355_1.time_ < var_358_10 + var_358_20 + arg_358_0 then
				arg_355_1.typewritter.percent = 1

				arg_355_1.typewritter:SetDirty()
				arg_355_1:ShowNextGo(true)
			end
		end
	end,
	Play120421088 = function(arg_359_0, arg_359_1)
		arg_359_1.time_ = 0
		arg_359_1.frameCnt_ = 0
		arg_359_1.state_ = "playing"
		arg_359_1.curTalkId_ = 120421088
		arg_359_1.duration_ = 1.999999999999

		SetActive(arg_359_1.tipsGo_, false)

		function arg_359_1.onSingleLineFinish_()
			arg_359_1.onSingleLineUpdate_ = nil
			arg_359_1.onSingleLineFinish_ = nil
			arg_359_1.state_ = "waiting"
		end

		function arg_359_1.playNext_(arg_361_0)
			if arg_361_0 == 1 then
				arg_359_0:Play120421089(arg_359_1)
			end
		end

		function arg_359_1.onSingleLineUpdate_(arg_362_0)
			local var_362_0 = arg_359_1.actors_["1074ui_story"]
			local var_362_1 = 0

			if var_362_1 < arg_359_1.time_ and arg_359_1.time_ <= var_362_1 + arg_362_0 and arg_359_1.var_.characterEffect1074ui_story == nil then
				arg_359_1.var_.characterEffect1074ui_story = var_362_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_362_2 = 0.2

			if var_362_1 <= arg_359_1.time_ and arg_359_1.time_ < var_362_1 + var_362_2 then
				local var_362_3 = (arg_359_1.time_ - var_362_1) / var_362_2

				if arg_359_1.var_.characterEffect1074ui_story then
					arg_359_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_359_1.time_ >= var_362_1 + var_362_2 and arg_359_1.time_ < var_362_1 + var_362_2 + arg_362_0 and arg_359_1.var_.characterEffect1074ui_story then
				arg_359_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_362_4 = 0

			if var_362_4 < arg_359_1.time_ and arg_359_1.time_ <= var_362_4 + arg_362_0 then
				arg_359_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action5_2")
			end

			local var_362_5 = arg_359_1.actors_["1074ui_story"].transform
			local var_362_6 = 0

			if var_362_6 < arg_359_1.time_ and arg_359_1.time_ <= var_362_6 + arg_362_0 then
				arg_359_1.var_.moveOldPos1074ui_story = var_362_5.localPosition
			end

			local var_362_7 = 0.001

			if var_362_6 <= arg_359_1.time_ and arg_359_1.time_ < var_362_6 + var_362_7 then
				local var_362_8 = (arg_359_1.time_ - var_362_6) / var_362_7
				local var_362_9 = Vector3.New(0, -1.055, -6.12)

				var_362_5.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1074ui_story, var_362_9, var_362_8)

				local var_362_10 = manager.ui.mainCamera.transform.position - var_362_5.position

				var_362_5.forward = Vector3.New(var_362_10.x, var_362_10.y, var_362_10.z)

				local var_362_11 = var_362_5.localEulerAngles

				var_362_11.z = 0
				var_362_11.x = 0
				var_362_5.localEulerAngles = var_362_11
			end

			if arg_359_1.time_ >= var_362_6 + var_362_7 and arg_359_1.time_ < var_362_6 + var_362_7 + arg_362_0 then
				var_362_5.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_362_12 = manager.ui.mainCamera.transform.position - var_362_5.position

				var_362_5.forward = Vector3.New(var_362_12.x, var_362_12.y, var_362_12.z)

				local var_362_13 = var_362_5.localEulerAngles

				var_362_13.z = 0
				var_362_13.x = 0
				var_362_5.localEulerAngles = var_362_13
			end

			local var_362_14 = arg_359_1.actors_["1072ui_story"].transform
			local var_362_15 = 0

			if var_362_15 < arg_359_1.time_ and arg_359_1.time_ <= var_362_15 + arg_362_0 then
				arg_359_1.var_.moveOldPos1072ui_story = var_362_14.localPosition
			end

			local var_362_16 = 0.001

			if var_362_15 <= arg_359_1.time_ and arg_359_1.time_ < var_362_15 + var_362_16 then
				local var_362_17 = (arg_359_1.time_ - var_362_15) / var_362_16
				local var_362_18 = Vector3.New(0, 100, 0)

				var_362_14.localPosition = Vector3.Lerp(arg_359_1.var_.moveOldPos1072ui_story, var_362_18, var_362_17)

				local var_362_19 = manager.ui.mainCamera.transform.position - var_362_14.position

				var_362_14.forward = Vector3.New(var_362_19.x, var_362_19.y, var_362_19.z)

				local var_362_20 = var_362_14.localEulerAngles

				var_362_20.z = 0
				var_362_20.x = 0
				var_362_14.localEulerAngles = var_362_20
			end

			if arg_359_1.time_ >= var_362_15 + var_362_16 and arg_359_1.time_ < var_362_15 + var_362_16 + arg_362_0 then
				var_362_14.localPosition = Vector3.New(0, 100, 0)

				local var_362_21 = manager.ui.mainCamera.transform.position - var_362_14.position

				var_362_14.forward = Vector3.New(var_362_21.x, var_362_21.y, var_362_21.z)

				local var_362_22 = var_362_14.localEulerAngles

				var_362_22.z = 0
				var_362_22.x = 0
				var_362_14.localEulerAngles = var_362_22
			end

			local var_362_23 = arg_359_1.actors_["1072ui_story"]
			local var_362_24 = 0

			if var_362_24 < arg_359_1.time_ and arg_359_1.time_ <= var_362_24 + arg_362_0 then
				if arg_359_1.var_.characterEffect1072ui_story == nil then
					arg_359_1.var_.characterEffect1072ui_story = var_362_23:GetComponentInChildren(typeof(CharacterEffect))
				end

				local var_362_25 = arg_359_1.var_.characterEffect1072ui_story

				var_362_25.imageEffect:turnOff()

				var_362_25.interferenceEffect.enabled = false
				var_362_25.interferenceEffect.noise = 0.001
				var_362_25.interferenceEffect.simTimeScale = 1
				var_362_25.interferenceEffect.geometryOutlineColor = Color.New(0.3725, 0.88, 1, 1)
			end

			local var_362_26 = 0
			local var_362_27 = 0.15

			if var_362_26 < arg_359_1.time_ and arg_359_1.time_ <= var_362_26 + arg_362_0 then
				arg_359_1.talkMaxDuration = 0
				arg_359_1.dialogCg_.alpha = 1

				arg_359_1.dialog_:SetActive(true)
				SetActive(arg_359_1.leftNameGo_, true)

				local var_362_28 = arg_359_1:FormatText(StoryNameCfg[410].name)

				arg_359_1.leftNameTxt_.text = var_362_28

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_359_1.leftNameTxt_.transform)

				arg_359_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_359_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_359_1:RecordName(arg_359_1.leftNameTxt_.text)
				SetActive(arg_359_1.iconTrs_.gameObject, false)
				arg_359_1.callingController_:SetSelectedState("normal")

				local var_362_29 = arg_359_1:GetWordFromCfg(120421088)
				local var_362_30 = arg_359_1:FormatText(var_362_29.content)

				arg_359_1.text_.text = var_362_30

				LuaForUtil.ClearLinePrefixSymbol(arg_359_1.text_)

				local var_362_31 = 6
				local var_362_32 = utf8.len(var_362_30)
				local var_362_33 = var_362_31 <= 0 and var_362_27 or var_362_27 * (var_362_32 / var_362_31)

				if var_362_33 > 0 and var_362_27 < var_362_33 then
					arg_359_1.talkMaxDuration = var_362_33

					if var_362_33 + var_362_26 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_33 + var_362_26
					end
				end

				arg_359_1.text_.text = var_362_30
				arg_359_1.typewritter.percent = 0

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421088", "story_v_out_120421.awb") ~= 0 then
					local var_362_34 = manager.audio:GetVoiceLength("story_v_out_120421", "120421088", "story_v_out_120421.awb") / 1000

					if var_362_34 + var_362_26 > arg_359_1.duration_ then
						arg_359_1.duration_ = var_362_34 + var_362_26
					end

					if var_362_29.prefab_name ~= "" and arg_359_1.actors_[var_362_29.prefab_name] ~= nil then
						local var_362_35 = LuaForUtil.PlayVoiceWithCriLipsync(arg_359_1.actors_[var_362_29.prefab_name].transform, "story_v_out_120421", "120421088", "story_v_out_120421.awb")

						arg_359_1:RecordAudio("120421088", var_362_35)
						arg_359_1:RecordAudio("120421088", var_362_35)
					else
						arg_359_1:AudioAction("play", "voice", "story_v_out_120421", "120421088", "story_v_out_120421.awb")
					end

					arg_359_1:RecordHistoryTalkVoice("story_v_out_120421", "120421088", "story_v_out_120421.awb")
				end

				arg_359_1:RecordContent(arg_359_1.text_.text)
			end

			local var_362_36 = math.max(var_362_27, arg_359_1.talkMaxDuration)

			if var_362_26 <= arg_359_1.time_ and arg_359_1.time_ < var_362_26 + var_362_36 then
				arg_359_1.typewritter.percent = (arg_359_1.time_ - var_362_26) / var_362_36

				arg_359_1.typewritter:SetDirty()
			end

			if arg_359_1.time_ >= var_362_26 + var_362_36 and arg_359_1.time_ < var_362_26 + var_362_36 + arg_362_0 then
				arg_359_1.typewritter.percent = 1

				arg_359_1.typewritter:SetDirty()
				arg_359_1:ShowNextGo(true)
			end
		end
	end,
	Play120421089 = function(arg_363_0, arg_363_1)
		arg_363_1.time_ = 0
		arg_363_1.frameCnt_ = 0
		arg_363_1.state_ = "playing"
		arg_363_1.curTalkId_ = 120421089
		arg_363_1.duration_ = 5

		SetActive(arg_363_1.tipsGo_, false)

		function arg_363_1.onSingleLineFinish_()
			arg_363_1.onSingleLineUpdate_ = nil
			arg_363_1.onSingleLineFinish_ = nil
			arg_363_1.state_ = "waiting"
		end

		function arg_363_1.playNext_(arg_365_0)
			if arg_365_0 == 1 then
				arg_363_0:Play120421090(arg_363_1)
			end
		end

		function arg_363_1.onSingleLineUpdate_(arg_366_0)
			local var_366_0 = arg_363_1.actors_["1074ui_story"].transform
			local var_366_1 = 0

			if var_366_1 < arg_363_1.time_ and arg_363_1.time_ <= var_366_1 + arg_366_0 then
				arg_363_1.var_.moveOldPos1074ui_story = var_366_0.localPosition
			end

			local var_366_2 = 0.001

			if var_366_1 <= arg_363_1.time_ and arg_363_1.time_ < var_366_1 + var_366_2 then
				local var_366_3 = (arg_363_1.time_ - var_366_1) / var_366_2
				local var_366_4 = Vector3.New(0, 100, 0)

				var_366_0.localPosition = Vector3.Lerp(arg_363_1.var_.moveOldPos1074ui_story, var_366_4, var_366_3)

				local var_366_5 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_5.x, var_366_5.y, var_366_5.z)

				local var_366_6 = var_366_0.localEulerAngles

				var_366_6.z = 0
				var_366_6.x = 0
				var_366_0.localEulerAngles = var_366_6
			end

			if arg_363_1.time_ >= var_366_1 + var_366_2 and arg_363_1.time_ < var_366_1 + var_366_2 + arg_366_0 then
				var_366_0.localPosition = Vector3.New(0, 100, 0)

				local var_366_7 = manager.ui.mainCamera.transform.position - var_366_0.position

				var_366_0.forward = Vector3.New(var_366_7.x, var_366_7.y, var_366_7.z)

				local var_366_8 = var_366_0.localEulerAngles

				var_366_8.z = 0
				var_366_8.x = 0
				var_366_0.localEulerAngles = var_366_8
			end

			local var_366_9 = 0
			local var_366_10 = 0.75

			if var_366_9 < arg_363_1.time_ and arg_363_1.time_ <= var_366_9 + arg_366_0 then
				arg_363_1.talkMaxDuration = 0
				arg_363_1.dialogCg_.alpha = 1

				arg_363_1.dialog_:SetActive(true)
				SetActive(arg_363_1.leftNameGo_, false)

				arg_363_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_363_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_363_1:RecordName(arg_363_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_363_1.iconTrs_.gameObject, false)
				arg_363_1.callingController_:SetSelectedState("normal")

				local var_366_11 = arg_363_1:GetWordFromCfg(120421089)
				local var_366_12 = arg_363_1:FormatText(var_366_11.content)

				arg_363_1.text_.text = var_366_12

				LuaForUtil.ClearLinePrefixSymbol(arg_363_1.text_)

				local var_366_13 = 30
				local var_366_14 = utf8.len(var_366_12)
				local var_366_15 = var_366_13 <= 0 and var_366_10 or var_366_10 * (var_366_14 / var_366_13)

				if var_366_15 > 0 and var_366_10 < var_366_15 then
					arg_363_1.talkMaxDuration = var_366_15

					if var_366_15 + var_366_9 > arg_363_1.duration_ then
						arg_363_1.duration_ = var_366_15 + var_366_9
					end
				end

				arg_363_1.text_.text = var_366_12
				arg_363_1.typewritter.percent = 0

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(false)
				arg_363_1:RecordContent(arg_363_1.text_.text)
			end

			local var_366_16 = math.max(var_366_10, arg_363_1.talkMaxDuration)

			if var_366_9 <= arg_363_1.time_ and arg_363_1.time_ < var_366_9 + var_366_16 then
				arg_363_1.typewritter.percent = (arg_363_1.time_ - var_366_9) / var_366_16

				arg_363_1.typewritter:SetDirty()
			end

			if arg_363_1.time_ >= var_366_9 + var_366_16 and arg_363_1.time_ < var_366_9 + var_366_16 + arg_366_0 then
				arg_363_1.typewritter.percent = 1

				arg_363_1.typewritter:SetDirty()
				arg_363_1:ShowNextGo(true)
			end
		end
	end,
	Play120421090 = function(arg_367_0, arg_367_1)
		arg_367_1.time_ = 0
		arg_367_1.frameCnt_ = 0
		arg_367_1.state_ = "playing"
		arg_367_1.curTalkId_ = 120421090
		arg_367_1.duration_ = 9

		SetActive(arg_367_1.tipsGo_, false)

		function arg_367_1.onSingleLineFinish_()
			arg_367_1.onSingleLineUpdate_ = nil
			arg_367_1.onSingleLineFinish_ = nil
			arg_367_1.state_ = "waiting"
		end

		function arg_367_1.playNext_(arg_369_0)
			if arg_369_0 == 1 then
				arg_367_0:Play120421091(arg_367_1)
			end
		end

		function arg_367_1.onSingleLineUpdate_(arg_370_0)
			local var_370_0 = 2

			if var_370_0 < arg_367_1.time_ and arg_367_1.time_ <= var_370_0 + arg_370_0 then
				local var_370_1 = manager.ui.mainCamera.transform.localPosition
				local var_370_2 = Vector3.New(0, 0, 10) + Vector3.New(var_370_1.x, var_370_1.y, 0)
				local var_370_3 = arg_367_1.bgs_.ST29

				var_370_3.transform.localPosition = var_370_2
				var_370_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_370_4 = var_370_3:GetComponent("SpriteRenderer")

				if var_370_4 and var_370_4.sprite then
					local var_370_5 = (var_370_3.transform.localPosition - var_370_1).z
					local var_370_6 = manager.ui.mainCameraCom_
					local var_370_7 = 2 * var_370_5 * Mathf.Tan(var_370_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_370_8 = var_370_7 * var_370_6.aspect
					local var_370_9 = var_370_4.sprite.bounds.size.x
					local var_370_10 = var_370_4.sprite.bounds.size.y
					local var_370_11 = var_370_8 / var_370_9
					local var_370_12 = var_370_7 / var_370_10
					local var_370_13 = var_370_12 < var_370_11 and var_370_11 or var_370_12

					var_370_3.transform.localScale = Vector3.New(var_370_13, var_370_13, 0)
				end

				for iter_370_0, iter_370_1 in pairs(arg_367_1.bgs_) do
					if iter_370_0 ~= "ST29" then
						iter_370_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_370_14 = 0

			if var_370_14 < arg_367_1.time_ and arg_367_1.time_ <= var_370_14 + arg_370_0 then
				arg_367_1.mask_.enabled = true
				arg_367_1.mask_.raycastTarget = true

				arg_367_1:SetGaussion(false)
			end

			local var_370_15 = 2

			if var_370_14 <= arg_367_1.time_ and arg_367_1.time_ < var_370_14 + var_370_15 then
				local var_370_16 = (arg_367_1.time_ - var_370_14) / var_370_15
				local var_370_17 = Color.New(0, 0, 0)

				var_370_17.a = Mathf.Lerp(0, 1, var_370_16)
				arg_367_1.mask_.color = var_370_17
			end

			if arg_367_1.time_ >= var_370_14 + var_370_15 and arg_367_1.time_ < var_370_14 + var_370_15 + arg_370_0 then
				local var_370_18 = Color.New(0, 0, 0)

				var_370_18.a = 1
				arg_367_1.mask_.color = var_370_18
			end

			local var_370_19 = 2

			if var_370_19 < arg_367_1.time_ and arg_367_1.time_ <= var_370_19 + arg_370_0 then
				arg_367_1.mask_.enabled = true
				arg_367_1.mask_.raycastTarget = true

				arg_367_1:SetGaussion(false)
			end

			local var_370_20 = 2

			if var_370_19 <= arg_367_1.time_ and arg_367_1.time_ < var_370_19 + var_370_20 then
				local var_370_21 = (arg_367_1.time_ - var_370_19) / var_370_20
				local var_370_22 = Color.New(0, 0, 0)

				var_370_22.a = Mathf.Lerp(1, 0, var_370_21)
				arg_367_1.mask_.color = var_370_22
			end

			if arg_367_1.time_ >= var_370_19 + var_370_20 and arg_367_1.time_ < var_370_19 + var_370_20 + arg_370_0 then
				local var_370_23 = Color.New(0, 0, 0)
				local var_370_24 = 0

				arg_367_1.mask_.enabled = false
				var_370_23.a = var_370_24
				arg_367_1.mask_.color = var_370_23
			end

			local var_370_25 = 0
			local var_370_26 = 0.533333333333333

			if var_370_25 < arg_367_1.time_ and arg_367_1.time_ <= var_370_25 + arg_370_0 then
				local var_370_27 = "play"
				local var_370_28 = "music"

				arg_367_1:AudioAction(var_370_27, var_370_28, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_367_1.frameCnt_ <= 1 then
				arg_367_1.dialog_:SetActive(false)
			end

			local var_370_29 = 4
			local var_370_30 = 1.15

			if var_370_29 < arg_367_1.time_ and arg_367_1.time_ <= var_370_29 + arg_370_0 then
				arg_367_1.talkMaxDuration = 0

				arg_367_1.dialog_:SetActive(true)

				local var_370_31 = LeanTween.value(arg_367_1.dialog_, 0, 1, 0.3)

				var_370_31:setOnUpdate(LuaHelper.FloatAction(function(arg_371_0)
					arg_367_1.dialogCg_.alpha = arg_371_0
				end))
				var_370_31:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_367_1.dialog_)
					var_370_31:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_367_1.duration_ = arg_367_1.duration_ + 0.3

				SetActive(arg_367_1.leftNameGo_, false)

				arg_367_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_367_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_367_1:RecordName(arg_367_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_367_1.iconTrs_.gameObject, false)
				arg_367_1.callingController_:SetSelectedState("normal")

				local var_370_32 = arg_367_1:GetWordFromCfg(120421090)
				local var_370_33 = arg_367_1:FormatText(var_370_32.content)

				arg_367_1.text_.text = var_370_33

				LuaForUtil.ClearLinePrefixSymbol(arg_367_1.text_)

				local var_370_34 = 46
				local var_370_35 = utf8.len(var_370_33)
				local var_370_36 = var_370_34 <= 0 and var_370_30 or var_370_30 * (var_370_35 / var_370_34)

				if var_370_36 > 0 and var_370_30 < var_370_36 then
					arg_367_1.talkMaxDuration = var_370_36
					var_370_29 = var_370_29 + 0.3

					if var_370_36 + var_370_29 > arg_367_1.duration_ then
						arg_367_1.duration_ = var_370_36 + var_370_29
					end
				end

				arg_367_1.text_.text = var_370_33
				arg_367_1.typewritter.percent = 0

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(false)
				arg_367_1:RecordContent(arg_367_1.text_.text)
			end

			local var_370_37 = var_370_29 + 0.3
			local var_370_38 = math.max(var_370_30, arg_367_1.talkMaxDuration)

			if var_370_37 <= arg_367_1.time_ and arg_367_1.time_ < var_370_37 + var_370_38 then
				arg_367_1.typewritter.percent = (arg_367_1.time_ - var_370_37) / var_370_38

				arg_367_1.typewritter:SetDirty()
			end

			if arg_367_1.time_ >= var_370_37 + var_370_38 and arg_367_1.time_ < var_370_37 + var_370_38 + arg_370_0 then
				arg_367_1.typewritter.percent = 1

				arg_367_1.typewritter:SetDirty()
				arg_367_1:ShowNextGo(true)
			end
		end
	end,
	Play120421091 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 120421091
		arg_373_1.duration_ = 3.633

		local var_373_0 = {
			zh = 2.366,
			ja = 3.633
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
				arg_373_0:Play120421092(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = arg_373_1.actors_["1074ui_story"].transform
			local var_376_1 = 0

			if var_376_1 < arg_373_1.time_ and arg_373_1.time_ <= var_376_1 + arg_376_0 then
				arg_373_1.var_.moveOldPos1074ui_story = var_376_0.localPosition
			end

			local var_376_2 = 0.001

			if var_376_1 <= arg_373_1.time_ and arg_373_1.time_ < var_376_1 + var_376_2 then
				local var_376_3 = (arg_373_1.time_ - var_376_1) / var_376_2
				local var_376_4 = Vector3.New(0, -1.055, -6.12)

				var_376_0.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1074ui_story, var_376_4, var_376_3)

				local var_376_5 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_5.x, var_376_5.y, var_376_5.z)

				local var_376_6 = var_376_0.localEulerAngles

				var_376_6.z = 0
				var_376_6.x = 0
				var_376_0.localEulerAngles = var_376_6
			end

			if arg_373_1.time_ >= var_376_1 + var_376_2 and arg_373_1.time_ < var_376_1 + var_376_2 + arg_376_0 then
				var_376_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_376_7 = manager.ui.mainCamera.transform.position - var_376_0.position

				var_376_0.forward = Vector3.New(var_376_7.x, var_376_7.y, var_376_7.z)

				local var_376_8 = var_376_0.localEulerAngles

				var_376_8.z = 0
				var_376_8.x = 0
				var_376_0.localEulerAngles = var_376_8
			end

			local var_376_9 = arg_373_1.actors_["1074ui_story"]
			local var_376_10 = 0

			if var_376_10 < arg_373_1.time_ and arg_373_1.time_ <= var_376_10 + arg_376_0 and arg_373_1.var_.characterEffect1074ui_story == nil then
				arg_373_1.var_.characterEffect1074ui_story = var_376_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_11 = 0.2

			if var_376_10 <= arg_373_1.time_ and arg_373_1.time_ < var_376_10 + var_376_11 then
				local var_376_12 = (arg_373_1.time_ - var_376_10) / var_376_11

				if arg_373_1.var_.characterEffect1074ui_story then
					arg_373_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_10 + var_376_11 and arg_373_1.time_ < var_376_10 + var_376_11 + arg_376_0 and arg_373_1.var_.characterEffect1074ui_story then
				arg_373_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_376_13 = 0

			if var_376_13 < arg_373_1.time_ and arg_373_1.time_ <= var_376_13 + arg_376_0 then
				arg_373_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_376_14 = 0

			if var_376_14 < arg_373_1.time_ and arg_373_1.time_ <= var_376_14 + arg_376_0 then
				arg_373_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_376_15 = 0
			local var_376_16 = 0.175

			if var_376_15 < arg_373_1.time_ and arg_373_1.time_ <= var_376_15 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0
				arg_373_1.dialogCg_.alpha = 1

				arg_373_1.dialog_:SetActive(true)
				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_17 = arg_373_1:FormatText(StoryNameCfg[410].name)

				arg_373_1.leftNameTxt_.text = var_376_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_18 = arg_373_1:GetWordFromCfg(120421091)
				local var_376_19 = arg_373_1:FormatText(var_376_18.content)

				arg_373_1.text_.text = var_376_19

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_20 = 7
				local var_376_21 = utf8.len(var_376_19)
				local var_376_22 = var_376_20 <= 0 and var_376_16 or var_376_16 * (var_376_21 / var_376_20)

				if var_376_22 > 0 and var_376_16 < var_376_22 then
					arg_373_1.talkMaxDuration = var_376_22

					if var_376_22 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_22 + var_376_15
					end
				end

				arg_373_1.text_.text = var_376_19
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421091", "story_v_out_120421.awb") ~= 0 then
					local var_376_23 = manager.audio:GetVoiceLength("story_v_out_120421", "120421091", "story_v_out_120421.awb") / 1000

					if var_376_23 + var_376_15 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_23 + var_376_15
					end

					if var_376_18.prefab_name ~= "" and arg_373_1.actors_[var_376_18.prefab_name] ~= nil then
						local var_376_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_18.prefab_name].transform, "story_v_out_120421", "120421091", "story_v_out_120421.awb")

						arg_373_1:RecordAudio("120421091", var_376_24)
						arg_373_1:RecordAudio("120421091", var_376_24)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_120421", "120421091", "story_v_out_120421.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_120421", "120421091", "story_v_out_120421.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_25 = math.max(var_376_16, arg_373_1.talkMaxDuration)

			if var_376_15 <= arg_373_1.time_ and arg_373_1.time_ < var_376_15 + var_376_25 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_15) / var_376_25

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_15 + var_376_25 and arg_373_1.time_ < var_376_15 + var_376_25 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play120421092 = function(arg_377_0, arg_377_1)
		arg_377_1.time_ = 0
		arg_377_1.frameCnt_ = 0
		arg_377_1.state_ = "playing"
		arg_377_1.curTalkId_ = 120421092
		arg_377_1.duration_ = 5

		SetActive(arg_377_1.tipsGo_, false)

		function arg_377_1.onSingleLineFinish_()
			arg_377_1.onSingleLineUpdate_ = nil
			arg_377_1.onSingleLineFinish_ = nil
			arg_377_1.state_ = "waiting"
		end

		function arg_377_1.playNext_(arg_379_0)
			if arg_379_0 == 1 then
				arg_377_0:Play120421093(arg_377_1)
			end
		end

		function arg_377_1.onSingleLineUpdate_(arg_380_0)
			local var_380_0 = arg_377_1.actors_["1074ui_story"].transform
			local var_380_1 = 0

			if var_380_1 < arg_377_1.time_ and arg_377_1.time_ <= var_380_1 + arg_380_0 then
				arg_377_1.var_.moveOldPos1074ui_story = var_380_0.localPosition
			end

			local var_380_2 = 0.001

			if var_380_1 <= arg_377_1.time_ and arg_377_1.time_ < var_380_1 + var_380_2 then
				local var_380_3 = (arg_377_1.time_ - var_380_1) / var_380_2
				local var_380_4 = Vector3.New(0, 100, 0)

				var_380_0.localPosition = Vector3.Lerp(arg_377_1.var_.moveOldPos1074ui_story, var_380_4, var_380_3)

				local var_380_5 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_5.x, var_380_5.y, var_380_5.z)

				local var_380_6 = var_380_0.localEulerAngles

				var_380_6.z = 0
				var_380_6.x = 0
				var_380_0.localEulerAngles = var_380_6
			end

			if arg_377_1.time_ >= var_380_1 + var_380_2 and arg_377_1.time_ < var_380_1 + var_380_2 + arg_380_0 then
				var_380_0.localPosition = Vector3.New(0, 100, 0)

				local var_380_7 = manager.ui.mainCamera.transform.position - var_380_0.position

				var_380_0.forward = Vector3.New(var_380_7.x, var_380_7.y, var_380_7.z)

				local var_380_8 = var_380_0.localEulerAngles

				var_380_8.z = 0
				var_380_8.x = 0
				var_380_0.localEulerAngles = var_380_8
			end

			local var_380_9 = 0
			local var_380_10 = 1.2

			if var_380_9 < arg_377_1.time_ and arg_377_1.time_ <= var_380_9 + arg_380_0 then
				arg_377_1.talkMaxDuration = 0
				arg_377_1.dialogCg_.alpha = 1

				arg_377_1.dialog_:SetActive(true)
				SetActive(arg_377_1.leftNameGo_, false)

				arg_377_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_377_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_377_1:RecordName(arg_377_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_377_1.iconTrs_.gameObject, false)
				arg_377_1.callingController_:SetSelectedState("normal")

				local var_380_11 = arg_377_1:GetWordFromCfg(120421092)
				local var_380_12 = arg_377_1:FormatText(var_380_11.content)

				arg_377_1.text_.text = var_380_12

				LuaForUtil.ClearLinePrefixSymbol(arg_377_1.text_)

				local var_380_13 = 48
				local var_380_14 = utf8.len(var_380_12)
				local var_380_15 = var_380_13 <= 0 and var_380_10 or var_380_10 * (var_380_14 / var_380_13)

				if var_380_15 > 0 and var_380_10 < var_380_15 then
					arg_377_1.talkMaxDuration = var_380_15

					if var_380_15 + var_380_9 > arg_377_1.duration_ then
						arg_377_1.duration_ = var_380_15 + var_380_9
					end
				end

				arg_377_1.text_.text = var_380_12
				arg_377_1.typewritter.percent = 0

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(false)
				arg_377_1:RecordContent(arg_377_1.text_.text)
			end

			local var_380_16 = math.max(var_380_10, arg_377_1.talkMaxDuration)

			if var_380_9 <= arg_377_1.time_ and arg_377_1.time_ < var_380_9 + var_380_16 then
				arg_377_1.typewritter.percent = (arg_377_1.time_ - var_380_9) / var_380_16

				arg_377_1.typewritter:SetDirty()
			end

			if arg_377_1.time_ >= var_380_9 + var_380_16 and arg_377_1.time_ < var_380_9 + var_380_16 + arg_380_0 then
				arg_377_1.typewritter.percent = 1

				arg_377_1.typewritter:SetDirty()
				arg_377_1:ShowNextGo(true)
			end
		end
	end,
	Play120421093 = function(arg_381_0, arg_381_1)
		arg_381_1.time_ = 0
		arg_381_1.frameCnt_ = 0
		arg_381_1.state_ = "playing"
		arg_381_1.curTalkId_ = 120421093
		arg_381_1.duration_ = 2

		local var_381_0 = {
			zh = 2,
			ja = 0.999999999999
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
				arg_381_0:Play120421094(arg_381_1)
			end
		end

		function arg_381_1.onSingleLineUpdate_(arg_384_0)
			local var_384_0 = 0
			local var_384_1 = 0.075

			if var_384_0 < arg_381_1.time_ and arg_381_1.time_ <= var_384_0 + arg_384_0 then
				arg_381_1.talkMaxDuration = 0
				arg_381_1.dialogCg_.alpha = 1

				arg_381_1.dialog_:SetActive(true)
				SetActive(arg_381_1.leftNameGo_, true)

				local var_384_2 = arg_381_1:FormatText(StoryNameCfg[410].name)

				arg_381_1.leftNameTxt_.text = var_384_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_381_1.leftNameTxt_.transform)

				arg_381_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_381_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_381_1:RecordName(arg_381_1.leftNameTxt_.text)
				SetActive(arg_381_1.iconTrs_.gameObject, true)
				arg_381_1.iconController_:SetSelectedState("hero")

				arg_381_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1074")

				arg_381_1.callingController_:SetSelectedState("normal")

				local var_384_3 = arg_381_1:GetWordFromCfg(120421093)
				local var_384_4 = arg_381_1:FormatText(var_384_3.content)

				arg_381_1.text_.text = var_384_4

				LuaForUtil.ClearLinePrefixSymbol(arg_381_1.text_)

				local var_384_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421093", "story_v_out_120421.awb") ~= 0 then
					local var_384_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421093", "story_v_out_120421.awb") / 1000

					if var_384_8 + var_384_0 > arg_381_1.duration_ then
						arg_381_1.duration_ = var_384_8 + var_384_0
					end

					if var_384_3.prefab_name ~= "" and arg_381_1.actors_[var_384_3.prefab_name] ~= nil then
						local var_384_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_381_1.actors_[var_384_3.prefab_name].transform, "story_v_out_120421", "120421093", "story_v_out_120421.awb")

						arg_381_1:RecordAudio("120421093", var_384_9)
						arg_381_1:RecordAudio("120421093", var_384_9)
					else
						arg_381_1:AudioAction("play", "voice", "story_v_out_120421", "120421093", "story_v_out_120421.awb")
					end

					arg_381_1:RecordHistoryTalkVoice("story_v_out_120421", "120421093", "story_v_out_120421.awb")
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
	Play120421094 = function(arg_385_0, arg_385_1)
		arg_385_1.time_ = 0
		arg_385_1.frameCnt_ = 0
		arg_385_1.state_ = "playing"
		arg_385_1.curTalkId_ = 120421094
		arg_385_1.duration_ = 5

		SetActive(arg_385_1.tipsGo_, false)

		function arg_385_1.onSingleLineFinish_()
			arg_385_1.onSingleLineUpdate_ = nil
			arg_385_1.onSingleLineFinish_ = nil
			arg_385_1.state_ = "waiting"
		end

		function arg_385_1.playNext_(arg_387_0)
			if arg_387_0 == 1 then
				arg_385_0:Play120421095(arg_385_1)
			end
		end

		function arg_385_1.onSingleLineUpdate_(arg_388_0)
			local var_388_0 = 0
			local var_388_1 = 1.2

			if var_388_0 < arg_385_1.time_ and arg_385_1.time_ <= var_388_0 + arg_388_0 then
				arg_385_1.talkMaxDuration = 0
				arg_385_1.dialogCg_.alpha = 1

				arg_385_1.dialog_:SetActive(true)
				SetActive(arg_385_1.leftNameGo_, false)

				arg_385_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_385_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_385_1:RecordName(arg_385_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_385_1.iconTrs_.gameObject, false)
				arg_385_1.callingController_:SetSelectedState("normal")

				local var_388_2 = arg_385_1:GetWordFromCfg(120421094)
				local var_388_3 = arg_385_1:FormatText(var_388_2.content)

				arg_385_1.text_.text = var_388_3

				LuaForUtil.ClearLinePrefixSymbol(arg_385_1.text_)

				local var_388_4 = 48
				local var_388_5 = utf8.len(var_388_3)
				local var_388_6 = var_388_4 <= 0 and var_388_1 or var_388_1 * (var_388_5 / var_388_4)

				if var_388_6 > 0 and var_388_1 < var_388_6 then
					arg_385_1.talkMaxDuration = var_388_6

					if var_388_6 + var_388_0 > arg_385_1.duration_ then
						arg_385_1.duration_ = var_388_6 + var_388_0
					end
				end

				arg_385_1.text_.text = var_388_3
				arg_385_1.typewritter.percent = 0

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(false)
				arg_385_1:RecordContent(arg_385_1.text_.text)
			end

			local var_388_7 = math.max(var_388_1, arg_385_1.talkMaxDuration)

			if var_388_0 <= arg_385_1.time_ and arg_385_1.time_ < var_388_0 + var_388_7 then
				arg_385_1.typewritter.percent = (arg_385_1.time_ - var_388_0) / var_388_7

				arg_385_1.typewritter:SetDirty()
			end

			if arg_385_1.time_ >= var_388_0 + var_388_7 and arg_385_1.time_ < var_388_0 + var_388_7 + arg_388_0 then
				arg_385_1.typewritter.percent = 1

				arg_385_1.typewritter:SetDirty()
				arg_385_1:ShowNextGo(true)
			end
		end
	end,
	Play120421095 = function(arg_389_0, arg_389_1)
		arg_389_1.time_ = 0
		arg_389_1.frameCnt_ = 0
		arg_389_1.state_ = "playing"
		arg_389_1.curTalkId_ = 120421095
		arg_389_1.duration_ = 5

		SetActive(arg_389_1.tipsGo_, false)

		function arg_389_1.onSingleLineFinish_()
			arg_389_1.onSingleLineUpdate_ = nil
			arg_389_1.onSingleLineFinish_ = nil
			arg_389_1.state_ = "waiting"
		end

		function arg_389_1.playNext_(arg_391_0)
			if arg_391_0 == 1 then
				arg_389_0:Play120421096(arg_389_1)
			end
		end

		function arg_389_1.onSingleLineUpdate_(arg_392_0)
			local var_392_0 = 0
			local var_392_1 = 0.525

			if var_392_0 < arg_389_1.time_ and arg_389_1.time_ <= var_392_0 + arg_392_0 then
				arg_389_1.talkMaxDuration = 0
				arg_389_1.dialogCg_.alpha = 1

				arg_389_1.dialog_:SetActive(true)
				SetActive(arg_389_1.leftNameGo_, false)

				arg_389_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_389_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_389_1:RecordName(arg_389_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_389_1.iconTrs_.gameObject, false)
				arg_389_1.callingController_:SetSelectedState("normal")

				local var_392_2 = arg_389_1:GetWordFromCfg(120421095)
				local var_392_3 = arg_389_1:FormatText(var_392_2.content)

				arg_389_1.text_.text = var_392_3

				LuaForUtil.ClearLinePrefixSymbol(arg_389_1.text_)

				local var_392_4 = 21
				local var_392_5 = utf8.len(var_392_3)
				local var_392_6 = var_392_4 <= 0 and var_392_1 or var_392_1 * (var_392_5 / var_392_4)

				if var_392_6 > 0 and var_392_1 < var_392_6 then
					arg_389_1.talkMaxDuration = var_392_6

					if var_392_6 + var_392_0 > arg_389_1.duration_ then
						arg_389_1.duration_ = var_392_6 + var_392_0
					end
				end

				arg_389_1.text_.text = var_392_3
				arg_389_1.typewritter.percent = 0

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(false)
				arg_389_1:RecordContent(arg_389_1.text_.text)
			end

			local var_392_7 = math.max(var_392_1, arg_389_1.talkMaxDuration)

			if var_392_0 <= arg_389_1.time_ and arg_389_1.time_ < var_392_0 + var_392_7 then
				arg_389_1.typewritter.percent = (arg_389_1.time_ - var_392_0) / var_392_7

				arg_389_1.typewritter:SetDirty()
			end

			if arg_389_1.time_ >= var_392_0 + var_392_7 and arg_389_1.time_ < var_392_0 + var_392_7 + arg_392_0 then
				arg_389_1.typewritter.percent = 1

				arg_389_1.typewritter:SetDirty()
				arg_389_1:ShowNextGo(true)
			end
		end
	end,
	Play120421096 = function(arg_393_0, arg_393_1)
		arg_393_1.time_ = 0
		arg_393_1.frameCnt_ = 0
		arg_393_1.state_ = "playing"
		arg_393_1.curTalkId_ = 120421096
		arg_393_1.duration_ = 5

		SetActive(arg_393_1.tipsGo_, false)

		function arg_393_1.onSingleLineFinish_()
			arg_393_1.onSingleLineUpdate_ = nil
			arg_393_1.onSingleLineFinish_ = nil
			arg_393_1.state_ = "waiting"
		end

		function arg_393_1.playNext_(arg_395_0)
			if arg_395_0 == 1 then
				arg_393_0:Play120421097(arg_393_1)
			end
		end

		function arg_393_1.onSingleLineUpdate_(arg_396_0)
			local var_396_0 = 0

			if var_396_0 < arg_393_1.time_ and arg_393_1.time_ <= var_396_0 + arg_396_0 then
				local var_396_1 = manager.ui.mainCamera.transform.localPosition
				local var_396_2 = Vector3.New(0, 0, 10) + Vector3.New(var_396_1.x, var_396_1.y, 0)
				local var_396_3 = arg_393_1.bgs_.ST37

				var_396_3.transform.localPosition = var_396_2
				var_396_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_396_4 = var_396_3:GetComponent("SpriteRenderer")

				if var_396_4 and var_396_4.sprite then
					local var_396_5 = (var_396_3.transform.localPosition - var_396_1).z
					local var_396_6 = manager.ui.mainCameraCom_
					local var_396_7 = 2 * var_396_5 * Mathf.Tan(var_396_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_396_8 = var_396_7 * var_396_6.aspect
					local var_396_9 = var_396_4.sprite.bounds.size.x
					local var_396_10 = var_396_4.sprite.bounds.size.y
					local var_396_11 = var_396_8 / var_396_9
					local var_396_12 = var_396_7 / var_396_10
					local var_396_13 = var_396_12 < var_396_11 and var_396_11 or var_396_12

					var_396_3.transform.localScale = Vector3.New(var_396_13, var_396_13, 0)
				end

				for iter_396_0, iter_396_1 in pairs(arg_393_1.bgs_) do
					if iter_396_0 ~= "ST37" then
						iter_396_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_396_14 = 0

			if var_396_14 < arg_393_1.time_ and arg_393_1.time_ <= var_396_14 + arg_396_0 then
				arg_393_1.mask_.enabled = true
				arg_393_1.mask_.raycastTarget = true

				arg_393_1:SetGaussion(false)
			end

			local var_396_15 = 2

			if var_396_14 <= arg_393_1.time_ and arg_393_1.time_ < var_396_14 + var_396_15 then
				local var_396_16 = (arg_393_1.time_ - var_396_14) / var_396_15
				local var_396_17 = Color.New(1, 1, 1)

				var_396_17.a = Mathf.Lerp(1, 0, var_396_16)
				arg_393_1.mask_.color = var_396_17
			end

			if arg_393_1.time_ >= var_396_14 + var_396_15 and arg_393_1.time_ < var_396_14 + var_396_15 + arg_396_0 then
				local var_396_18 = Color.New(1, 1, 1)
				local var_396_19 = 0

				arg_393_1.mask_.enabled = false
				var_396_18.a = var_396_19
				arg_393_1.mask_.color = var_396_18
			end

			local var_396_20 = 0
			local var_396_21 = 1

			if var_396_20 < arg_393_1.time_ and arg_393_1.time_ <= var_396_20 + arg_396_0 then
				local var_396_22 = "play"
				local var_396_23 = "effect"

				arg_393_1:AudioAction(var_396_22, var_396_23, "se_story_120_04", "se_story_120_04_dooropen", "")
			end

			local var_396_24 = 0
			local var_396_25 = 0.05

			if var_396_24 < arg_393_1.time_ and arg_393_1.time_ <= var_396_24 + arg_396_0 then
				arg_393_1.talkMaxDuration = 0
				arg_393_1.dialogCg_.alpha = 1

				arg_393_1.dialog_:SetActive(true)
				SetActive(arg_393_1.leftNameGo_, false)

				arg_393_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_393_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_393_1:RecordName(arg_393_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_393_1.iconTrs_.gameObject, false)
				arg_393_1.callingController_:SetSelectedState("normal")

				local var_396_26 = arg_393_1:GetWordFromCfg(120421096)
				local var_396_27 = arg_393_1:FormatText(var_396_26.content)

				arg_393_1.text_.text = var_396_27

				LuaForUtil.ClearLinePrefixSymbol(arg_393_1.text_)

				local var_396_28 = 2
				local var_396_29 = utf8.len(var_396_27)
				local var_396_30 = var_396_28 <= 0 and var_396_25 or var_396_25 * (var_396_29 / var_396_28)

				if var_396_30 > 0 and var_396_25 < var_396_30 then
					arg_393_1.talkMaxDuration = var_396_30

					if var_396_30 + var_396_24 > arg_393_1.duration_ then
						arg_393_1.duration_ = var_396_30 + var_396_24
					end
				end

				arg_393_1.text_.text = var_396_27
				arg_393_1.typewritter.percent = 0

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(false)
				arg_393_1:RecordContent(arg_393_1.text_.text)
			end

			local var_396_31 = math.max(var_396_25, arg_393_1.talkMaxDuration)

			if var_396_24 <= arg_393_1.time_ and arg_393_1.time_ < var_396_24 + var_396_31 then
				arg_393_1.typewritter.percent = (arg_393_1.time_ - var_396_24) / var_396_31

				arg_393_1.typewritter:SetDirty()
			end

			if arg_393_1.time_ >= var_396_24 + var_396_31 and arg_393_1.time_ < var_396_24 + var_396_31 + arg_396_0 then
				arg_393_1.typewritter.percent = 1

				arg_393_1.typewritter:SetDirty()
				arg_393_1:ShowNextGo(true)
			end
		end
	end,
	Play120421097 = function(arg_397_0, arg_397_1)
		arg_397_1.time_ = 0
		arg_397_1.frameCnt_ = 0
		arg_397_1.state_ = "playing"
		arg_397_1.curTalkId_ = 120421097
		arg_397_1.duration_ = 5

		SetActive(arg_397_1.tipsGo_, false)

		function arg_397_1.onSingleLineFinish_()
			arg_397_1.onSingleLineUpdate_ = nil
			arg_397_1.onSingleLineFinish_ = nil
			arg_397_1.state_ = "waiting"
		end

		function arg_397_1.playNext_(arg_399_0)
			if arg_399_0 == 1 then
				arg_397_0:Play120421098(arg_397_1)
			end
		end

		function arg_397_1.onSingleLineUpdate_(arg_400_0)
			local var_400_0 = 0
			local var_400_1 = 1.075

			if var_400_0 < arg_397_1.time_ and arg_397_1.time_ <= var_400_0 + arg_400_0 then
				arg_397_1.talkMaxDuration = 0
				arg_397_1.dialogCg_.alpha = 1

				arg_397_1.dialog_:SetActive(true)
				SetActive(arg_397_1.leftNameGo_, false)

				arg_397_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_397_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_397_1:RecordName(arg_397_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_397_1.iconTrs_.gameObject, false)
				arg_397_1.callingController_:SetSelectedState("normal")

				local var_400_2 = arg_397_1:GetWordFromCfg(120421097)
				local var_400_3 = arg_397_1:FormatText(var_400_2.content)

				arg_397_1.text_.text = var_400_3

				LuaForUtil.ClearLinePrefixSymbol(arg_397_1.text_)

				local var_400_4 = 43
				local var_400_5 = utf8.len(var_400_3)
				local var_400_6 = var_400_4 <= 0 and var_400_1 or var_400_1 * (var_400_5 / var_400_4)

				if var_400_6 > 0 and var_400_1 < var_400_6 then
					arg_397_1.talkMaxDuration = var_400_6

					if var_400_6 + var_400_0 > arg_397_1.duration_ then
						arg_397_1.duration_ = var_400_6 + var_400_0
					end
				end

				arg_397_1.text_.text = var_400_3
				arg_397_1.typewritter.percent = 0

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(false)
				arg_397_1:RecordContent(arg_397_1.text_.text)
			end

			local var_400_7 = math.max(var_400_1, arg_397_1.talkMaxDuration)

			if var_400_0 <= arg_397_1.time_ and arg_397_1.time_ < var_400_0 + var_400_7 then
				arg_397_1.typewritter.percent = (arg_397_1.time_ - var_400_0) / var_400_7

				arg_397_1.typewritter:SetDirty()
			end

			if arg_397_1.time_ >= var_400_0 + var_400_7 and arg_397_1.time_ < var_400_0 + var_400_7 + arg_400_0 then
				arg_397_1.typewritter.percent = 1

				arg_397_1.typewritter:SetDirty()
				arg_397_1:ShowNextGo(true)
			end
		end
	end,
	Play120421098 = function(arg_401_0, arg_401_1)
		arg_401_1.time_ = 0
		arg_401_1.frameCnt_ = 0
		arg_401_1.state_ = "playing"
		arg_401_1.curTalkId_ = 120421098
		arg_401_1.duration_ = 4.466

		local var_401_0 = {
			zh = 4.466,
			ja = 3.566
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
				arg_401_0:Play120421099(arg_401_1)
			end
		end

		function arg_401_1.onSingleLineUpdate_(arg_404_0)
			local var_404_0 = arg_401_1.actors_["1074ui_story"].transform
			local var_404_1 = 0

			if var_404_1 < arg_401_1.time_ and arg_401_1.time_ <= var_404_1 + arg_404_0 then
				arg_401_1.var_.moveOldPos1074ui_story = var_404_0.localPosition
			end

			local var_404_2 = 0.001

			if var_404_1 <= arg_401_1.time_ and arg_401_1.time_ < var_404_1 + var_404_2 then
				local var_404_3 = (arg_401_1.time_ - var_404_1) / var_404_2
				local var_404_4 = Vector3.New(0, -1.055, -6.12)

				var_404_0.localPosition = Vector3.Lerp(arg_401_1.var_.moveOldPos1074ui_story, var_404_4, var_404_3)

				local var_404_5 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_5.x, var_404_5.y, var_404_5.z)

				local var_404_6 = var_404_0.localEulerAngles

				var_404_6.z = 0
				var_404_6.x = 0
				var_404_0.localEulerAngles = var_404_6
			end

			if arg_401_1.time_ >= var_404_1 + var_404_2 and arg_401_1.time_ < var_404_1 + var_404_2 + arg_404_0 then
				var_404_0.localPosition = Vector3.New(0, -1.055, -6.12)

				local var_404_7 = manager.ui.mainCamera.transform.position - var_404_0.position

				var_404_0.forward = Vector3.New(var_404_7.x, var_404_7.y, var_404_7.z)

				local var_404_8 = var_404_0.localEulerAngles

				var_404_8.z = 0
				var_404_8.x = 0
				var_404_0.localEulerAngles = var_404_8
			end

			local var_404_9 = 0

			if var_404_9 < arg_401_1.time_ and arg_401_1.time_ <= var_404_9 + arg_404_0 then
				arg_401_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_404_10 = 0

			if var_404_10 < arg_401_1.time_ and arg_401_1.time_ <= var_404_10 + arg_404_0 then
				arg_401_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3202cva")
			end

			local var_404_11 = arg_401_1.actors_["1074ui_story"]
			local var_404_12 = 0

			if var_404_12 < arg_401_1.time_ and arg_401_1.time_ <= var_404_12 + arg_404_0 and arg_401_1.var_.characterEffect1074ui_story == nil then
				arg_401_1.var_.characterEffect1074ui_story = var_404_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_404_13 = 0.2

			if var_404_12 <= arg_401_1.time_ and arg_401_1.time_ < var_404_12 + var_404_13 then
				local var_404_14 = (arg_401_1.time_ - var_404_12) / var_404_13

				if arg_401_1.var_.characterEffect1074ui_story then
					arg_401_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_401_1.time_ >= var_404_12 + var_404_13 and arg_401_1.time_ < var_404_12 + var_404_13 + arg_404_0 and arg_401_1.var_.characterEffect1074ui_story then
				arg_401_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_404_15 = 0
			local var_404_16 = 0.1

			if var_404_15 < arg_401_1.time_ and arg_401_1.time_ <= var_404_15 + arg_404_0 then
				arg_401_1.talkMaxDuration = 0
				arg_401_1.dialogCg_.alpha = 1

				arg_401_1.dialog_:SetActive(true)
				SetActive(arg_401_1.leftNameGo_, true)

				local var_404_17 = arg_401_1:FormatText(StoryNameCfg[400].name)

				arg_401_1.leftNameTxt_.text = var_404_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_401_1.leftNameTxt_.transform)

				arg_401_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_401_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_401_1:RecordName(arg_401_1.leftNameTxt_.text)
				SetActive(arg_401_1.iconTrs_.gameObject, false)
				arg_401_1.callingController_:SetSelectedState("normal")

				local var_404_18 = arg_401_1:GetWordFromCfg(120421098)
				local var_404_19 = arg_401_1:FormatText(var_404_18.content)

				arg_401_1.text_.text = var_404_19

				LuaForUtil.ClearLinePrefixSymbol(arg_401_1.text_)

				local var_404_20 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421098", "story_v_out_120421.awb") ~= 0 then
					local var_404_23 = manager.audio:GetVoiceLength("story_v_out_120421", "120421098", "story_v_out_120421.awb") / 1000

					if var_404_23 + var_404_15 > arg_401_1.duration_ then
						arg_401_1.duration_ = var_404_23 + var_404_15
					end

					if var_404_18.prefab_name ~= "" and arg_401_1.actors_[var_404_18.prefab_name] ~= nil then
						local var_404_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_401_1.actors_[var_404_18.prefab_name].transform, "story_v_out_120421", "120421098", "story_v_out_120421.awb")

						arg_401_1:RecordAudio("120421098", var_404_24)
						arg_401_1:RecordAudio("120421098", var_404_24)
					else
						arg_401_1:AudioAction("play", "voice", "story_v_out_120421", "120421098", "story_v_out_120421.awb")
					end

					arg_401_1:RecordHistoryTalkVoice("story_v_out_120421", "120421098", "story_v_out_120421.awb")
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
	Play120421099 = function(arg_405_0, arg_405_1)
		arg_405_1.time_ = 0
		arg_405_1.frameCnt_ = 0
		arg_405_1.state_ = "playing"
		arg_405_1.curTalkId_ = 120421099
		arg_405_1.duration_ = 5

		SetActive(arg_405_1.tipsGo_, false)

		function arg_405_1.onSingleLineFinish_()
			arg_405_1.onSingleLineUpdate_ = nil
			arg_405_1.onSingleLineFinish_ = nil
			arg_405_1.state_ = "waiting"
		end

		function arg_405_1.playNext_(arg_407_0)
			if arg_407_0 == 1 then
				arg_405_0:Play120421100(arg_405_1)
			end
		end

		function arg_405_1.onSingleLineUpdate_(arg_408_0)
			local var_408_0 = arg_405_1.actors_["1074ui_story"]
			local var_408_1 = 0

			if var_408_1 < arg_405_1.time_ and arg_405_1.time_ <= var_408_1 + arg_408_0 and arg_405_1.var_.characterEffect1074ui_story == nil then
				arg_405_1.var_.characterEffect1074ui_story = var_408_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_408_2 = 0.2

			if var_408_1 <= arg_405_1.time_ and arg_405_1.time_ < var_408_1 + var_408_2 then
				local var_408_3 = (arg_405_1.time_ - var_408_1) / var_408_2

				if arg_405_1.var_.characterEffect1074ui_story then
					local var_408_4 = Mathf.Lerp(0, 0.5, var_408_3)

					arg_405_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_405_1.var_.characterEffect1074ui_story.fillRatio = var_408_4
				end
			end

			if arg_405_1.time_ >= var_408_1 + var_408_2 and arg_405_1.time_ < var_408_1 + var_408_2 + arg_408_0 and arg_405_1.var_.characterEffect1074ui_story then
				local var_408_5 = 0.5

				arg_405_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_405_1.var_.characterEffect1074ui_story.fillRatio = var_408_5
			end

			local var_408_6 = 0
			local var_408_7 = 0.725

			if var_408_6 < arg_405_1.time_ and arg_405_1.time_ <= var_408_6 + arg_408_0 then
				arg_405_1.talkMaxDuration = 0
				arg_405_1.dialogCg_.alpha = 1

				arg_405_1.dialog_:SetActive(true)
				SetActive(arg_405_1.leftNameGo_, false)

				arg_405_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_405_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_405_1:RecordName(arg_405_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_405_1.iconTrs_.gameObject, false)
				arg_405_1.callingController_:SetSelectedState("normal")

				local var_408_8 = arg_405_1:GetWordFromCfg(120421099)
				local var_408_9 = arg_405_1:FormatText(var_408_8.content)

				arg_405_1.text_.text = var_408_9

				LuaForUtil.ClearLinePrefixSymbol(arg_405_1.text_)

				local var_408_10 = 29
				local var_408_11 = utf8.len(var_408_9)
				local var_408_12 = var_408_10 <= 0 and var_408_7 or var_408_7 * (var_408_11 / var_408_10)

				if var_408_12 > 0 and var_408_7 < var_408_12 then
					arg_405_1.talkMaxDuration = var_408_12

					if var_408_12 + var_408_6 > arg_405_1.duration_ then
						arg_405_1.duration_ = var_408_12 + var_408_6
					end
				end

				arg_405_1.text_.text = var_408_9
				arg_405_1.typewritter.percent = 0

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(false)
				arg_405_1:RecordContent(arg_405_1.text_.text)
			end

			local var_408_13 = math.max(var_408_7, arg_405_1.talkMaxDuration)

			if var_408_6 <= arg_405_1.time_ and arg_405_1.time_ < var_408_6 + var_408_13 then
				arg_405_1.typewritter.percent = (arg_405_1.time_ - var_408_6) / var_408_13

				arg_405_1.typewritter:SetDirty()
			end

			if arg_405_1.time_ >= var_408_6 + var_408_13 and arg_405_1.time_ < var_408_6 + var_408_13 + arg_408_0 then
				arg_405_1.typewritter.percent = 1

				arg_405_1.typewritter:SetDirty()
				arg_405_1:ShowNextGo(true)
			end
		end
	end,
	Play120421100 = function(arg_409_0, arg_409_1)
		arg_409_1.time_ = 0
		arg_409_1.frameCnt_ = 0
		arg_409_1.state_ = "playing"
		arg_409_1.curTalkId_ = 120421100
		arg_409_1.duration_ = 5

		SetActive(arg_409_1.tipsGo_, false)

		function arg_409_1.onSingleLineFinish_()
			arg_409_1.onSingleLineUpdate_ = nil
			arg_409_1.onSingleLineFinish_ = nil
			arg_409_1.state_ = "waiting"
		end

		function arg_409_1.playNext_(arg_411_0)
			if arg_411_0 == 1 then
				arg_409_0:Play120421101(arg_409_1)
			end
		end

		function arg_409_1.onSingleLineUpdate_(arg_412_0)
			local var_412_0 = 0
			local var_412_1 = 1

			if var_412_0 < arg_409_1.time_ and arg_409_1.time_ <= var_412_0 + arg_412_0 then
				local var_412_2 = "play"
				local var_412_3 = "music"

				arg_409_1:AudioAction(var_412_2, var_412_3, "bgm_side_daily03", "bgm_side_daily03", "bgm_side_daily03.awb")
			end

			local var_412_4 = 0
			local var_412_5 = 1.55

			if var_412_4 < arg_409_1.time_ and arg_409_1.time_ <= var_412_4 + arg_412_0 then
				arg_409_1.talkMaxDuration = 0
				arg_409_1.dialogCg_.alpha = 1

				arg_409_1.dialog_:SetActive(true)
				SetActive(arg_409_1.leftNameGo_, false)

				arg_409_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_409_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_409_1:RecordName(arg_409_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_409_1.iconTrs_.gameObject, false)
				arg_409_1.callingController_:SetSelectedState("normal")

				local var_412_6 = arg_409_1:GetWordFromCfg(120421100)
				local var_412_7 = arg_409_1:FormatText(var_412_6.content)

				arg_409_1.text_.text = var_412_7

				LuaForUtil.ClearLinePrefixSymbol(arg_409_1.text_)

				local var_412_8 = 62
				local var_412_9 = utf8.len(var_412_7)
				local var_412_10 = var_412_8 <= 0 and var_412_5 or var_412_5 * (var_412_9 / var_412_8)

				if var_412_10 > 0 and var_412_5 < var_412_10 then
					arg_409_1.talkMaxDuration = var_412_10

					if var_412_10 + var_412_4 > arg_409_1.duration_ then
						arg_409_1.duration_ = var_412_10 + var_412_4
					end
				end

				arg_409_1.text_.text = var_412_7
				arg_409_1.typewritter.percent = 0

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(false)
				arg_409_1:RecordContent(arg_409_1.text_.text)
			end

			local var_412_11 = math.max(var_412_5, arg_409_1.talkMaxDuration)

			if var_412_4 <= arg_409_1.time_ and arg_409_1.time_ < var_412_4 + var_412_11 then
				arg_409_1.typewritter.percent = (arg_409_1.time_ - var_412_4) / var_412_11

				arg_409_1.typewritter:SetDirty()
			end

			if arg_409_1.time_ >= var_412_4 + var_412_11 and arg_409_1.time_ < var_412_4 + var_412_11 + arg_412_0 then
				arg_409_1.typewritter.percent = 1

				arg_409_1.typewritter:SetDirty()
				arg_409_1:ShowNextGo(true)
			end
		end
	end,
	Play120421101 = function(arg_413_0, arg_413_1)
		arg_413_1.time_ = 0
		arg_413_1.frameCnt_ = 0
		arg_413_1.state_ = "playing"
		arg_413_1.curTalkId_ = 120421101
		arg_413_1.duration_ = 2.533

		local var_413_0 = {
			zh = 2.399999999999,
			ja = 2.533
		}
		local var_413_1 = manager.audio:GetLocalizationFlag()

		if var_413_0[var_413_1] ~= nil then
			arg_413_1.duration_ = var_413_0[var_413_1]
		end

		SetActive(arg_413_1.tipsGo_, false)

		function arg_413_1.onSingleLineFinish_()
			arg_413_1.onSingleLineUpdate_ = nil
			arg_413_1.onSingleLineFinish_ = nil
			arg_413_1.state_ = "waiting"
		end

		function arg_413_1.playNext_(arg_415_0)
			if arg_415_0 == 1 then
				arg_413_0:Play120421102(arg_413_1)
			end
		end

		function arg_413_1.onSingleLineUpdate_(arg_416_0)
			local var_416_0 = arg_413_1.actors_["1074ui_story"].transform
			local var_416_1 = 0

			if var_416_1 < arg_413_1.time_ and arg_413_1.time_ <= var_416_1 + arg_416_0 then
				arg_413_1.var_.moveOldPos1074ui_story = var_416_0.localPosition
			end

			local var_416_2 = 0.001

			if var_416_1 <= arg_413_1.time_ and arg_413_1.time_ < var_416_1 + var_416_2 then
				local var_416_3 = (arg_413_1.time_ - var_416_1) / var_416_2
				local var_416_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_416_0.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos1074ui_story, var_416_4, var_416_3)

				local var_416_5 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_5.x, var_416_5.y, var_416_5.z)

				local var_416_6 = var_416_0.localEulerAngles

				var_416_6.z = 0
				var_416_6.x = 0
				var_416_0.localEulerAngles = var_416_6
			end

			if arg_413_1.time_ >= var_416_1 + var_416_2 and arg_413_1.time_ < var_416_1 + var_416_2 + arg_416_0 then
				var_416_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_416_7 = manager.ui.mainCamera.transform.position - var_416_0.position

				var_416_0.forward = Vector3.New(var_416_7.x, var_416_7.y, var_416_7.z)

				local var_416_8 = var_416_0.localEulerAngles

				var_416_8.z = 0
				var_416_8.x = 0
				var_416_0.localEulerAngles = var_416_8
			end

			local var_416_9 = "10044ui_story"

			if arg_413_1.actors_[var_416_9] == nil then
				local var_416_10 = Object.Instantiate(Asset.Load("Char/" .. var_416_9), arg_413_1.stage_.transform)

				var_416_10.name = var_416_9
				var_416_10.transform.localPosition = Vector3.New(0, 100, 0)
				arg_413_1.actors_[var_416_9] = var_416_10

				local var_416_11 = var_416_10:GetComponentInChildren(typeof(CharacterEffect))

				var_416_11.enabled = true

				local var_416_12 = GameObjectTools.GetOrAddComponent(var_416_10, typeof(DynamicBoneHelper))

				if var_416_12 then
					var_416_12:EnableDynamicBone(false)
				end

				arg_413_1:ShowWeapon(var_416_11.transform, false)

				arg_413_1.var_[var_416_9 .. "Animator"] = var_416_11.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_413_1.var_[var_416_9 .. "Animator"].applyRootMotion = true
				arg_413_1.var_[var_416_9 .. "LipSync"] = var_416_11.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_416_13 = arg_413_1.actors_["10044ui_story"].transform
			local var_416_14 = 0

			if var_416_14 < arg_413_1.time_ and arg_413_1.time_ <= var_416_14 + arg_416_0 then
				arg_413_1.var_.moveOldPos10044ui_story = var_416_13.localPosition
			end

			local var_416_15 = 0.001

			if var_416_14 <= arg_413_1.time_ and arg_413_1.time_ < var_416_14 + var_416_15 then
				local var_416_16 = (arg_413_1.time_ - var_416_14) / var_416_15
				local var_416_17 = Vector3.New(0.7, -0.72, -6.3)

				var_416_13.localPosition = Vector3.Lerp(arg_413_1.var_.moveOldPos10044ui_story, var_416_17, var_416_16)

				local var_416_18 = manager.ui.mainCamera.transform.position - var_416_13.position

				var_416_13.forward = Vector3.New(var_416_18.x, var_416_18.y, var_416_18.z)

				local var_416_19 = var_416_13.localEulerAngles

				var_416_19.z = 0
				var_416_19.x = 0
				var_416_13.localEulerAngles = var_416_19
			end

			if arg_413_1.time_ >= var_416_14 + var_416_15 and arg_413_1.time_ < var_416_14 + var_416_15 + arg_416_0 then
				var_416_13.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_416_20 = manager.ui.mainCamera.transform.position - var_416_13.position

				var_416_13.forward = Vector3.New(var_416_20.x, var_416_20.y, var_416_20.z)

				local var_416_21 = var_416_13.localEulerAngles

				var_416_21.z = 0
				var_416_21.x = 0
				var_416_13.localEulerAngles = var_416_21
			end

			local var_416_22 = 0

			if var_416_22 < arg_413_1.time_ and arg_413_1.time_ <= var_416_22 + arg_416_0 then
				arg_413_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1203cva")
			end

			local var_416_23 = 0

			if var_416_23 < arg_413_1.time_ and arg_413_1.time_ <= var_416_23 + arg_416_0 then
				arg_413_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_416_24 = arg_413_1.actors_["10044ui_story"]
			local var_416_25 = 0

			if var_416_25 < arg_413_1.time_ and arg_413_1.time_ <= var_416_25 + arg_416_0 and arg_413_1.var_.characterEffect10044ui_story == nil then
				arg_413_1.var_.characterEffect10044ui_story = var_416_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_416_26 = 0.2

			if var_416_25 <= arg_413_1.time_ and arg_413_1.time_ < var_416_25 + var_416_26 then
				local var_416_27 = (arg_413_1.time_ - var_416_25) / var_416_26

				if arg_413_1.var_.characterEffect10044ui_story then
					arg_413_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_413_1.time_ >= var_416_25 + var_416_26 and arg_413_1.time_ < var_416_25 + var_416_26 + arg_416_0 and arg_413_1.var_.characterEffect10044ui_story then
				arg_413_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_416_28 = 0
			local var_416_29 = 0.05

			if var_416_28 < arg_413_1.time_ and arg_413_1.time_ <= var_416_28 + arg_416_0 then
				arg_413_1.talkMaxDuration = 0
				arg_413_1.dialogCg_.alpha = 1

				arg_413_1.dialog_:SetActive(true)
				SetActive(arg_413_1.leftNameGo_, true)

				local var_416_30 = arg_413_1:FormatText(StoryNameCfg[380].name)

				arg_413_1.leftNameTxt_.text = var_416_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_413_1.leftNameTxt_.transform)

				arg_413_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_413_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_413_1:RecordName(arg_413_1.leftNameTxt_.text)
				SetActive(arg_413_1.iconTrs_.gameObject, false)
				arg_413_1.callingController_:SetSelectedState("normal")

				local var_416_31 = arg_413_1:GetWordFromCfg(120421101)
				local var_416_32 = arg_413_1:FormatText(var_416_31.content)

				arg_413_1.text_.text = var_416_32

				LuaForUtil.ClearLinePrefixSymbol(arg_413_1.text_)

				local var_416_33 = 2
				local var_416_34 = utf8.len(var_416_32)
				local var_416_35 = var_416_33 <= 0 and var_416_29 or var_416_29 * (var_416_34 / var_416_33)

				if var_416_35 > 0 and var_416_29 < var_416_35 then
					arg_413_1.talkMaxDuration = var_416_35

					if var_416_35 + var_416_28 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_35 + var_416_28
					end
				end

				arg_413_1.text_.text = var_416_32
				arg_413_1.typewritter.percent = 0

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421101", "story_v_out_120421.awb") ~= 0 then
					local var_416_36 = manager.audio:GetVoiceLength("story_v_out_120421", "120421101", "story_v_out_120421.awb") / 1000

					if var_416_36 + var_416_28 > arg_413_1.duration_ then
						arg_413_1.duration_ = var_416_36 + var_416_28
					end

					if var_416_31.prefab_name ~= "" and arg_413_1.actors_[var_416_31.prefab_name] ~= nil then
						local var_416_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_413_1.actors_[var_416_31.prefab_name].transform, "story_v_out_120421", "120421101", "story_v_out_120421.awb")

						arg_413_1:RecordAudio("120421101", var_416_37)
						arg_413_1:RecordAudio("120421101", var_416_37)
					else
						arg_413_1:AudioAction("play", "voice", "story_v_out_120421", "120421101", "story_v_out_120421.awb")
					end

					arg_413_1:RecordHistoryTalkVoice("story_v_out_120421", "120421101", "story_v_out_120421.awb")
				end

				arg_413_1:RecordContent(arg_413_1.text_.text)
			end

			local var_416_38 = math.max(var_416_29, arg_413_1.talkMaxDuration)

			if var_416_28 <= arg_413_1.time_ and arg_413_1.time_ < var_416_28 + var_416_38 then
				arg_413_1.typewritter.percent = (arg_413_1.time_ - var_416_28) / var_416_38

				arg_413_1.typewritter:SetDirty()
			end

			if arg_413_1.time_ >= var_416_28 + var_416_38 and arg_413_1.time_ < var_416_28 + var_416_38 + arg_416_0 then
				arg_413_1.typewritter.percent = 1

				arg_413_1.typewritter:SetDirty()
				arg_413_1:ShowNextGo(true)
			end
		end
	end,
	Play120421102 = function(arg_417_0, arg_417_1)
		arg_417_1.time_ = 0
		arg_417_1.frameCnt_ = 0
		arg_417_1.state_ = "playing"
		arg_417_1.curTalkId_ = 120421102
		arg_417_1.duration_ = 12.3

		local var_417_0 = {
			zh = 5.4,
			ja = 12.3
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
				arg_417_0:Play120421103(arg_417_1)
			end
		end

		function arg_417_1.onSingleLineUpdate_(arg_420_0)
			local var_420_0 = arg_417_1.actors_["10044ui_story"]
			local var_420_1 = 0

			if var_420_1 < arg_417_1.time_ and arg_417_1.time_ <= var_420_1 + arg_420_0 and arg_417_1.var_.characterEffect10044ui_story == nil then
				arg_417_1.var_.characterEffect10044ui_story = var_420_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_2 = 0.2

			if var_420_1 <= arg_417_1.time_ and arg_417_1.time_ < var_420_1 + var_420_2 then
				local var_420_3 = (arg_417_1.time_ - var_420_1) / var_420_2

				if arg_417_1.var_.characterEffect10044ui_story then
					local var_420_4 = Mathf.Lerp(0, 0.5, var_420_3)

					arg_417_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_417_1.var_.characterEffect10044ui_story.fillRatio = var_420_4
				end
			end

			if arg_417_1.time_ >= var_420_1 + var_420_2 and arg_417_1.time_ < var_420_1 + var_420_2 + arg_420_0 and arg_417_1.var_.characterEffect10044ui_story then
				local var_420_5 = 0.5

				arg_417_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_417_1.var_.characterEffect10044ui_story.fillRatio = var_420_5
			end

			local var_420_6 = arg_417_1.actors_["1074ui_story"]
			local var_420_7 = 0

			if var_420_7 < arg_417_1.time_ and arg_417_1.time_ <= var_420_7 + arg_420_0 and arg_417_1.var_.characterEffect1074ui_story == nil then
				arg_417_1.var_.characterEffect1074ui_story = var_420_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_420_8 = 0.2

			if var_420_7 <= arg_417_1.time_ and arg_417_1.time_ < var_420_7 + var_420_8 then
				local var_420_9 = (arg_417_1.time_ - var_420_7) / var_420_8

				if arg_417_1.var_.characterEffect1074ui_story then
					arg_417_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_417_1.time_ >= var_420_7 + var_420_8 and arg_417_1.time_ < var_420_7 + var_420_8 + arg_420_0 and arg_417_1.var_.characterEffect1074ui_story then
				arg_417_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_420_10 = 0

			if var_420_10 < arg_417_1.time_ and arg_417_1.time_ <= var_420_10 + arg_420_0 then
				arg_417_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_420_11 = 0
			local var_420_12 = 0.4

			if var_420_11 < arg_417_1.time_ and arg_417_1.time_ <= var_420_11 + arg_420_0 then
				arg_417_1.talkMaxDuration = 0
				arg_417_1.dialogCg_.alpha = 1

				arg_417_1.dialog_:SetActive(true)
				SetActive(arg_417_1.leftNameGo_, true)

				local var_420_13 = arg_417_1:FormatText(StoryNameCfg[410].name)

				arg_417_1.leftNameTxt_.text = var_420_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_417_1.leftNameTxt_.transform)

				arg_417_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_417_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_417_1:RecordName(arg_417_1.leftNameTxt_.text)
				SetActive(arg_417_1.iconTrs_.gameObject, false)
				arg_417_1.callingController_:SetSelectedState("normal")

				local var_420_14 = arg_417_1:GetWordFromCfg(120421102)
				local var_420_15 = arg_417_1:FormatText(var_420_14.content)

				arg_417_1.text_.text = var_420_15

				LuaForUtil.ClearLinePrefixSymbol(arg_417_1.text_)

				local var_420_16 = 16
				local var_420_17 = utf8.len(var_420_15)
				local var_420_18 = var_420_16 <= 0 and var_420_12 or var_420_12 * (var_420_17 / var_420_16)

				if var_420_18 > 0 and var_420_12 < var_420_18 then
					arg_417_1.talkMaxDuration = var_420_18

					if var_420_18 + var_420_11 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_18 + var_420_11
					end
				end

				arg_417_1.text_.text = var_420_15
				arg_417_1.typewritter.percent = 0

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421102", "story_v_out_120421.awb") ~= 0 then
					local var_420_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421102", "story_v_out_120421.awb") / 1000

					if var_420_19 + var_420_11 > arg_417_1.duration_ then
						arg_417_1.duration_ = var_420_19 + var_420_11
					end

					if var_420_14.prefab_name ~= "" and arg_417_1.actors_[var_420_14.prefab_name] ~= nil then
						local var_420_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_417_1.actors_[var_420_14.prefab_name].transform, "story_v_out_120421", "120421102", "story_v_out_120421.awb")

						arg_417_1:RecordAudio("120421102", var_420_20)
						arg_417_1:RecordAudio("120421102", var_420_20)
					else
						arg_417_1:AudioAction("play", "voice", "story_v_out_120421", "120421102", "story_v_out_120421.awb")
					end

					arg_417_1:RecordHistoryTalkVoice("story_v_out_120421", "120421102", "story_v_out_120421.awb")
				end

				arg_417_1:RecordContent(arg_417_1.text_.text)
			end

			local var_420_21 = math.max(var_420_12, arg_417_1.talkMaxDuration)

			if var_420_11 <= arg_417_1.time_ and arg_417_1.time_ < var_420_11 + var_420_21 then
				arg_417_1.typewritter.percent = (arg_417_1.time_ - var_420_11) / var_420_21

				arg_417_1.typewritter:SetDirty()
			end

			if arg_417_1.time_ >= var_420_11 + var_420_21 and arg_417_1.time_ < var_420_11 + var_420_21 + arg_420_0 then
				arg_417_1.typewritter.percent = 1

				arg_417_1.typewritter:SetDirty()
				arg_417_1:ShowNextGo(true)
			end
		end
	end,
	Play120421103 = function(arg_421_0, arg_421_1)
		arg_421_1.time_ = 0
		arg_421_1.frameCnt_ = 0
		arg_421_1.state_ = "playing"
		arg_421_1.curTalkId_ = 120421103
		arg_421_1.duration_ = 7.933

		local var_421_0 = {
			zh = 4.233,
			ja = 7.933
		}
		local var_421_1 = manager.audio:GetLocalizationFlag()

		if var_421_0[var_421_1] ~= nil then
			arg_421_1.duration_ = var_421_0[var_421_1]
		end

		SetActive(arg_421_1.tipsGo_, false)

		function arg_421_1.onSingleLineFinish_()
			arg_421_1.onSingleLineUpdate_ = nil
			arg_421_1.onSingleLineFinish_ = nil
			arg_421_1.state_ = "waiting"
		end

		function arg_421_1.playNext_(arg_423_0)
			if arg_423_0 == 1 then
				arg_421_0:Play120421104(arg_421_1)
			end
		end

		function arg_421_1.onSingleLineUpdate_(arg_424_0)
			local var_424_0 = arg_421_1.actors_["10044ui_story"].transform
			local var_424_1 = 0

			if var_424_1 < arg_421_1.time_ and arg_421_1.time_ <= var_424_1 + arg_424_0 then
				arg_421_1.var_.moveOldPos10044ui_story = var_424_0.localPosition
			end

			local var_424_2 = 0.001

			if var_424_1 <= arg_421_1.time_ and arg_421_1.time_ < var_424_1 + var_424_2 then
				local var_424_3 = (arg_421_1.time_ - var_424_1) / var_424_2
				local var_424_4 = Vector3.New(0, 100, 0)

				var_424_0.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos10044ui_story, var_424_4, var_424_3)

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

			local var_424_9 = arg_421_1.actors_["1074ui_story"]
			local var_424_10 = 0

			if var_424_10 < arg_421_1.time_ and arg_421_1.time_ <= var_424_10 + arg_424_0 and arg_421_1.var_.characterEffect1074ui_story == nil then
				arg_421_1.var_.characterEffect1074ui_story = var_424_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_11 = 0.2

			if var_424_10 <= arg_421_1.time_ and arg_421_1.time_ < var_424_10 + var_424_11 then
				local var_424_12 = (arg_421_1.time_ - var_424_10) / var_424_11

				if arg_421_1.var_.characterEffect1074ui_story then
					local var_424_13 = Mathf.Lerp(0, 0.5, var_424_12)

					arg_421_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_421_1.var_.characterEffect1074ui_story.fillRatio = var_424_13
				end
			end

			if arg_421_1.time_ >= var_424_10 + var_424_11 and arg_421_1.time_ < var_424_10 + var_424_11 + arg_424_0 and arg_421_1.var_.characterEffect1074ui_story then
				local var_424_14 = 0.5

				arg_421_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_421_1.var_.characterEffect1074ui_story.fillRatio = var_424_14
			end

			local var_424_15 = 0

			if var_424_15 < arg_421_1.time_ and arg_421_1.time_ <= var_424_15 + arg_424_0 then
				arg_421_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_424_16 = arg_421_1.actors_["1075ui_story"].transform
			local var_424_17 = 0

			if var_424_17 < arg_421_1.time_ and arg_421_1.time_ <= var_424_17 + arg_424_0 then
				arg_421_1.var_.moveOldPos1075ui_story = var_424_16.localPosition
			end

			local var_424_18 = 0.001

			if var_424_17 <= arg_421_1.time_ and arg_421_1.time_ < var_424_17 + var_424_18 then
				local var_424_19 = (arg_421_1.time_ - var_424_17) / var_424_18
				local var_424_20 = Vector3.New(0.7, -1.055, -6.16)

				var_424_16.localPosition = Vector3.Lerp(arg_421_1.var_.moveOldPos1075ui_story, var_424_20, var_424_19)

				local var_424_21 = manager.ui.mainCamera.transform.position - var_424_16.position

				var_424_16.forward = Vector3.New(var_424_21.x, var_424_21.y, var_424_21.z)

				local var_424_22 = var_424_16.localEulerAngles

				var_424_22.z = 0
				var_424_22.x = 0
				var_424_16.localEulerAngles = var_424_22
			end

			if arg_421_1.time_ >= var_424_17 + var_424_18 and arg_421_1.time_ < var_424_17 + var_424_18 + arg_424_0 then
				var_424_16.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_424_23 = manager.ui.mainCamera.transform.position - var_424_16.position

				var_424_16.forward = Vector3.New(var_424_23.x, var_424_23.y, var_424_23.z)

				local var_424_24 = var_424_16.localEulerAngles

				var_424_24.z = 0
				var_424_24.x = 0
				var_424_16.localEulerAngles = var_424_24
			end

			local var_424_25 = arg_421_1.actors_["1075ui_story"]
			local var_424_26 = 0

			if var_424_26 < arg_421_1.time_ and arg_421_1.time_ <= var_424_26 + arg_424_0 and arg_421_1.var_.characterEffect1075ui_story == nil then
				arg_421_1.var_.characterEffect1075ui_story = var_424_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_424_27 = 0.2

			if var_424_26 <= arg_421_1.time_ and arg_421_1.time_ < var_424_26 + var_424_27 then
				local var_424_28 = (arg_421_1.time_ - var_424_26) / var_424_27

				if arg_421_1.var_.characterEffect1075ui_story then
					arg_421_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_421_1.time_ >= var_424_26 + var_424_27 and arg_421_1.time_ < var_424_26 + var_424_27 + arg_424_0 and arg_421_1.var_.characterEffect1075ui_story then
				arg_421_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_424_29 = 0
			local var_424_30 = 0.525

			if var_424_29 < arg_421_1.time_ and arg_421_1.time_ <= var_424_29 + arg_424_0 then
				arg_421_1.talkMaxDuration = 0
				arg_421_1.dialogCg_.alpha = 1

				arg_421_1.dialog_:SetActive(true)
				SetActive(arg_421_1.leftNameGo_, true)

				local var_424_31 = arg_421_1:FormatText(StoryNameCfg[381].name)

				arg_421_1.leftNameTxt_.text = var_424_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_421_1.leftNameTxt_.transform)

				arg_421_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_421_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_421_1:RecordName(arg_421_1.leftNameTxt_.text)
				SetActive(arg_421_1.iconTrs_.gameObject, false)
				arg_421_1.callingController_:SetSelectedState("normal")

				local var_424_32 = arg_421_1:GetWordFromCfg(120421103)
				local var_424_33 = arg_421_1:FormatText(var_424_32.content)

				arg_421_1.text_.text = var_424_33

				LuaForUtil.ClearLinePrefixSymbol(arg_421_1.text_)

				local var_424_34 = 21
				local var_424_35 = utf8.len(var_424_33)
				local var_424_36 = var_424_34 <= 0 and var_424_30 or var_424_30 * (var_424_35 / var_424_34)

				if var_424_36 > 0 and var_424_30 < var_424_36 then
					arg_421_1.talkMaxDuration = var_424_36

					if var_424_36 + var_424_29 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_36 + var_424_29
					end
				end

				arg_421_1.text_.text = var_424_33
				arg_421_1.typewritter.percent = 0

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421103", "story_v_out_120421.awb") ~= 0 then
					local var_424_37 = manager.audio:GetVoiceLength("story_v_out_120421", "120421103", "story_v_out_120421.awb") / 1000

					if var_424_37 + var_424_29 > arg_421_1.duration_ then
						arg_421_1.duration_ = var_424_37 + var_424_29
					end

					if var_424_32.prefab_name ~= "" and arg_421_1.actors_[var_424_32.prefab_name] ~= nil then
						local var_424_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_421_1.actors_[var_424_32.prefab_name].transform, "story_v_out_120421", "120421103", "story_v_out_120421.awb")

						arg_421_1:RecordAudio("120421103", var_424_38)
						arg_421_1:RecordAudio("120421103", var_424_38)
					else
						arg_421_1:AudioAction("play", "voice", "story_v_out_120421", "120421103", "story_v_out_120421.awb")
					end

					arg_421_1:RecordHistoryTalkVoice("story_v_out_120421", "120421103", "story_v_out_120421.awb")
				end

				arg_421_1:RecordContent(arg_421_1.text_.text)
			end

			local var_424_39 = math.max(var_424_30, arg_421_1.talkMaxDuration)

			if var_424_29 <= arg_421_1.time_ and arg_421_1.time_ < var_424_29 + var_424_39 then
				arg_421_1.typewritter.percent = (arg_421_1.time_ - var_424_29) / var_424_39

				arg_421_1.typewritter:SetDirty()
			end

			if arg_421_1.time_ >= var_424_29 + var_424_39 and arg_421_1.time_ < var_424_29 + var_424_39 + arg_424_0 then
				arg_421_1.typewritter.percent = 1

				arg_421_1.typewritter:SetDirty()
				arg_421_1:ShowNextGo(true)
			end
		end
	end,
	Play120421104 = function(arg_425_0, arg_425_1)
		arg_425_1.time_ = 0
		arg_425_1.frameCnt_ = 0
		arg_425_1.state_ = "playing"
		arg_425_1.curTalkId_ = 120421104
		arg_425_1.duration_ = 8.3

		local var_425_0 = {
			zh = 3.6,
			ja = 8.3
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
				arg_425_0:Play120421105(arg_425_1)
			end
		end

		function arg_425_1.onSingleLineUpdate_(arg_428_0)
			local var_428_0 = arg_425_1.actors_["1074ui_story"]
			local var_428_1 = 0

			if var_428_1 < arg_425_1.time_ and arg_425_1.time_ <= var_428_1 + arg_428_0 and arg_425_1.var_.characterEffect1074ui_story == nil then
				arg_425_1.var_.characterEffect1074ui_story = var_428_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_2 = 0.2

			if var_428_1 <= arg_425_1.time_ and arg_425_1.time_ < var_428_1 + var_428_2 then
				local var_428_3 = (arg_425_1.time_ - var_428_1) / var_428_2

				if arg_425_1.var_.characterEffect1074ui_story then
					arg_425_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_425_1.time_ >= var_428_1 + var_428_2 and arg_425_1.time_ < var_428_1 + var_428_2 + arg_428_0 and arg_425_1.var_.characterEffect1074ui_story then
				arg_425_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_428_4 = arg_425_1.actors_["1075ui_story"]
			local var_428_5 = 0

			if var_428_5 < arg_425_1.time_ and arg_425_1.time_ <= var_428_5 + arg_428_0 and arg_425_1.var_.characterEffect1075ui_story == nil then
				arg_425_1.var_.characterEffect1075ui_story = var_428_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_428_6 = 0.2

			if var_428_5 <= arg_425_1.time_ and arg_425_1.time_ < var_428_5 + var_428_6 then
				local var_428_7 = (arg_425_1.time_ - var_428_5) / var_428_6

				if arg_425_1.var_.characterEffect1075ui_story then
					local var_428_8 = Mathf.Lerp(0, 0.5, var_428_7)

					arg_425_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_425_1.var_.characterEffect1075ui_story.fillRatio = var_428_8
				end
			end

			if arg_425_1.time_ >= var_428_5 + var_428_6 and arg_425_1.time_ < var_428_5 + var_428_6 + arg_428_0 and arg_425_1.var_.characterEffect1075ui_story then
				local var_428_9 = 0.5

				arg_425_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_425_1.var_.characterEffect1075ui_story.fillRatio = var_428_9
			end

			local var_428_10 = 0
			local var_428_11 = 0.4

			if var_428_10 < arg_425_1.time_ and arg_425_1.time_ <= var_428_10 + arg_428_0 then
				arg_425_1.talkMaxDuration = 0
				arg_425_1.dialogCg_.alpha = 1

				arg_425_1.dialog_:SetActive(true)
				SetActive(arg_425_1.leftNameGo_, true)

				local var_428_12 = arg_425_1:FormatText(StoryNameCfg[410].name)

				arg_425_1.leftNameTxt_.text = var_428_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_425_1.leftNameTxt_.transform)

				arg_425_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_425_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_425_1:RecordName(arg_425_1.leftNameTxt_.text)
				SetActive(arg_425_1.iconTrs_.gameObject, false)
				arg_425_1.callingController_:SetSelectedState("normal")

				local var_428_13 = arg_425_1:GetWordFromCfg(120421104)
				local var_428_14 = arg_425_1:FormatText(var_428_13.content)

				arg_425_1.text_.text = var_428_14

				LuaForUtil.ClearLinePrefixSymbol(arg_425_1.text_)

				local var_428_15 = 16
				local var_428_16 = utf8.len(var_428_14)
				local var_428_17 = var_428_15 <= 0 and var_428_11 or var_428_11 * (var_428_16 / var_428_15)

				if var_428_17 > 0 and var_428_11 < var_428_17 then
					arg_425_1.talkMaxDuration = var_428_17

					if var_428_17 + var_428_10 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_17 + var_428_10
					end
				end

				arg_425_1.text_.text = var_428_14
				arg_425_1.typewritter.percent = 0

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421104", "story_v_out_120421.awb") ~= 0 then
					local var_428_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421104", "story_v_out_120421.awb") / 1000

					if var_428_18 + var_428_10 > arg_425_1.duration_ then
						arg_425_1.duration_ = var_428_18 + var_428_10
					end

					if var_428_13.prefab_name ~= "" and arg_425_1.actors_[var_428_13.prefab_name] ~= nil then
						local var_428_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_425_1.actors_[var_428_13.prefab_name].transform, "story_v_out_120421", "120421104", "story_v_out_120421.awb")

						arg_425_1:RecordAudio("120421104", var_428_19)
						arg_425_1:RecordAudio("120421104", var_428_19)
					else
						arg_425_1:AudioAction("play", "voice", "story_v_out_120421", "120421104", "story_v_out_120421.awb")
					end

					arg_425_1:RecordHistoryTalkVoice("story_v_out_120421", "120421104", "story_v_out_120421.awb")
				end

				arg_425_1:RecordContent(arg_425_1.text_.text)
			end

			local var_428_20 = math.max(var_428_11, arg_425_1.talkMaxDuration)

			if var_428_10 <= arg_425_1.time_ and arg_425_1.time_ < var_428_10 + var_428_20 then
				arg_425_1.typewritter.percent = (arg_425_1.time_ - var_428_10) / var_428_20

				arg_425_1.typewritter:SetDirty()
			end

			if arg_425_1.time_ >= var_428_10 + var_428_20 and arg_425_1.time_ < var_428_10 + var_428_20 + arg_428_0 then
				arg_425_1.typewritter.percent = 1

				arg_425_1.typewritter:SetDirty()
				arg_425_1:ShowNextGo(true)
			end
		end
	end,
	Play120421105 = function(arg_429_0, arg_429_1)
		arg_429_1.time_ = 0
		arg_429_1.frameCnt_ = 0
		arg_429_1.state_ = "playing"
		arg_429_1.curTalkId_ = 120421105
		arg_429_1.duration_ = 5

		SetActive(arg_429_1.tipsGo_, false)

		function arg_429_1.onSingleLineFinish_()
			arg_429_1.onSingleLineUpdate_ = nil
			arg_429_1.onSingleLineFinish_ = nil
			arg_429_1.state_ = "waiting"
		end

		function arg_429_1.playNext_(arg_431_0)
			if arg_431_0 == 1 then
				arg_429_0:Play120421106(arg_429_1)
			end
		end

		function arg_429_1.onSingleLineUpdate_(arg_432_0)
			local var_432_0 = arg_429_1.actors_["1074ui_story"]
			local var_432_1 = 0

			if var_432_1 < arg_429_1.time_ and arg_429_1.time_ <= var_432_1 + arg_432_0 and arg_429_1.var_.characterEffect1074ui_story == nil then
				arg_429_1.var_.characterEffect1074ui_story = var_432_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_432_2 = 0.2

			if var_432_1 <= arg_429_1.time_ and arg_429_1.time_ < var_432_1 + var_432_2 then
				local var_432_3 = (arg_429_1.time_ - var_432_1) / var_432_2

				if arg_429_1.var_.characterEffect1074ui_story then
					local var_432_4 = Mathf.Lerp(0, 0.5, var_432_3)

					arg_429_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_429_1.var_.characterEffect1074ui_story.fillRatio = var_432_4
				end
			end

			if arg_429_1.time_ >= var_432_1 + var_432_2 and arg_429_1.time_ < var_432_1 + var_432_2 + arg_432_0 and arg_429_1.var_.characterEffect1074ui_story then
				local var_432_5 = 0.5

				arg_429_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_429_1.var_.characterEffect1074ui_story.fillRatio = var_432_5
			end

			local var_432_6 = 0
			local var_432_7 = 1.175

			if var_432_6 < arg_429_1.time_ and arg_429_1.time_ <= var_432_6 + arg_432_0 then
				arg_429_1.talkMaxDuration = 0
				arg_429_1.dialogCg_.alpha = 1

				arg_429_1.dialog_:SetActive(true)
				SetActive(arg_429_1.leftNameGo_, false)

				arg_429_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_429_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_429_1:RecordName(arg_429_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_429_1.iconTrs_.gameObject, false)
				arg_429_1.callingController_:SetSelectedState("normal")

				local var_432_8 = arg_429_1:GetWordFromCfg(120421105)
				local var_432_9 = arg_429_1:FormatText(var_432_8.content)

				arg_429_1.text_.text = var_432_9

				LuaForUtil.ClearLinePrefixSymbol(arg_429_1.text_)

				local var_432_10 = 47
				local var_432_11 = utf8.len(var_432_9)
				local var_432_12 = var_432_10 <= 0 and var_432_7 or var_432_7 * (var_432_11 / var_432_10)

				if var_432_12 > 0 and var_432_7 < var_432_12 then
					arg_429_1.talkMaxDuration = var_432_12

					if var_432_12 + var_432_6 > arg_429_1.duration_ then
						arg_429_1.duration_ = var_432_12 + var_432_6
					end
				end

				arg_429_1.text_.text = var_432_9
				arg_429_1.typewritter.percent = 0

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(false)
				arg_429_1:RecordContent(arg_429_1.text_.text)
			end

			local var_432_13 = math.max(var_432_7, arg_429_1.talkMaxDuration)

			if var_432_6 <= arg_429_1.time_ and arg_429_1.time_ < var_432_6 + var_432_13 then
				arg_429_1.typewritter.percent = (arg_429_1.time_ - var_432_6) / var_432_13

				arg_429_1.typewritter:SetDirty()
			end

			if arg_429_1.time_ >= var_432_6 + var_432_13 and arg_429_1.time_ < var_432_6 + var_432_13 + arg_432_0 then
				arg_429_1.typewritter.percent = 1

				arg_429_1.typewritter:SetDirty()
				arg_429_1:ShowNextGo(true)
			end
		end
	end,
	Play120421106 = function(arg_433_0, arg_433_1)
		arg_433_1.time_ = 0
		arg_433_1.frameCnt_ = 0
		arg_433_1.state_ = "playing"
		arg_433_1.curTalkId_ = 120421106
		arg_433_1.duration_ = 8.56666666666667

		SetActive(arg_433_1.tipsGo_, false)

		function arg_433_1.onSingleLineFinish_()
			arg_433_1.onSingleLineUpdate_ = nil
			arg_433_1.onSingleLineFinish_ = nil
			arg_433_1.state_ = "waiting"
		end

		function arg_433_1.playNext_(arg_435_0)
			if arg_435_0 == 1 then
				arg_433_0:Play120421107(arg_433_1)
			end
		end

		function arg_433_1.onSingleLineUpdate_(arg_436_0)
			local var_436_0 = 0

			if var_436_0 < arg_433_1.time_ and arg_433_1.time_ <= var_436_0 + arg_436_0 then
				arg_433_1.mask_.enabled = true
				arg_433_1.mask_.raycastTarget = true

				arg_433_1:SetGaussion(false)
			end

			local var_436_1 = 2

			if var_436_0 <= arg_433_1.time_ and arg_433_1.time_ < var_436_0 + var_436_1 then
				local var_436_2 = (arg_433_1.time_ - var_436_0) / var_436_1
				local var_436_3 = Color.New(0, 0, 0)

				var_436_3.a = Mathf.Lerp(0, 1, var_436_2)
				arg_433_1.mask_.color = var_436_3
			end

			if arg_433_1.time_ >= var_436_0 + var_436_1 and arg_433_1.time_ < var_436_0 + var_436_1 + arg_436_0 then
				local var_436_4 = Color.New(0, 0, 0)

				var_436_4.a = 1
				arg_433_1.mask_.color = var_436_4
			end

			local var_436_5 = 2

			if var_436_5 < arg_433_1.time_ and arg_433_1.time_ <= var_436_5 + arg_436_0 then
				arg_433_1.mask_.enabled = true
				arg_433_1.mask_.raycastTarget = true

				arg_433_1:SetGaussion(false)
			end

			local var_436_6 = 2

			if var_436_5 <= arg_433_1.time_ and arg_433_1.time_ < var_436_5 + var_436_6 then
				local var_436_7 = (arg_433_1.time_ - var_436_5) / var_436_6
				local var_436_8 = Color.New(0, 0, 0)

				var_436_8.a = Mathf.Lerp(1, 0, var_436_7)
				arg_433_1.mask_.color = var_436_8
			end

			if arg_433_1.time_ >= var_436_5 + var_436_6 and arg_433_1.time_ < var_436_5 + var_436_6 + arg_436_0 then
				local var_436_9 = Color.New(0, 0, 0)
				local var_436_10 = 0

				arg_433_1.mask_.enabled = false
				var_436_9.a = var_436_10
				arg_433_1.mask_.color = var_436_9
			end

			if arg_433_1.frameCnt_ <= 1 then
				arg_433_1.dialog_:SetActive(false)
			end

			local var_436_11 = 3.56666666666667
			local var_436_12 = 1.55

			if var_436_11 < arg_433_1.time_ and arg_433_1.time_ <= var_436_11 + arg_436_0 then
				arg_433_1.talkMaxDuration = 0

				arg_433_1.dialog_:SetActive(true)

				local var_436_13 = LeanTween.value(arg_433_1.dialog_, 0, 1, 0.3)

				var_436_13:setOnUpdate(LuaHelper.FloatAction(function(arg_437_0)
					arg_433_1.dialogCg_.alpha = arg_437_0
				end))
				var_436_13:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_433_1.dialog_)
					var_436_13:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_433_1.duration_ = arg_433_1.duration_ + 0.3

				SetActive(arg_433_1.leftNameGo_, false)

				arg_433_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_433_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_433_1:RecordName(arg_433_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_433_1.iconTrs_.gameObject, false)
				arg_433_1.callingController_:SetSelectedState("normal")

				local var_436_14 = arg_433_1:GetWordFromCfg(120421106)
				local var_436_15 = arg_433_1:FormatText(var_436_14.content)

				arg_433_1.text_.text = var_436_15

				LuaForUtil.ClearLinePrefixSymbol(arg_433_1.text_)

				local var_436_16 = 62
				local var_436_17 = utf8.len(var_436_15)
				local var_436_18 = var_436_16 <= 0 and var_436_12 or var_436_12 * (var_436_17 / var_436_16)

				if var_436_18 > 0 and var_436_12 < var_436_18 then
					arg_433_1.talkMaxDuration = var_436_18
					var_436_11 = var_436_11 + 0.3

					if var_436_18 + var_436_11 > arg_433_1.duration_ then
						arg_433_1.duration_ = var_436_18 + var_436_11
					end
				end

				arg_433_1.text_.text = var_436_15
				arg_433_1.typewritter.percent = 0

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(false)
				arg_433_1:RecordContent(arg_433_1.text_.text)
			end

			local var_436_19 = var_436_11 + 0.3
			local var_436_20 = math.max(var_436_12, arg_433_1.talkMaxDuration)

			if var_436_19 <= arg_433_1.time_ and arg_433_1.time_ < var_436_19 + var_436_20 then
				arg_433_1.typewritter.percent = (arg_433_1.time_ - var_436_19) / var_436_20

				arg_433_1.typewritter:SetDirty()
			end

			if arg_433_1.time_ >= var_436_19 + var_436_20 and arg_433_1.time_ < var_436_19 + var_436_20 + arg_436_0 then
				arg_433_1.typewritter.percent = 1

				arg_433_1.typewritter:SetDirty()
				arg_433_1:ShowNextGo(true)
			end
		end
	end,
	Play120421107 = function(arg_439_0, arg_439_1)
		arg_439_1.time_ = 0
		arg_439_1.frameCnt_ = 0
		arg_439_1.state_ = "playing"
		arg_439_1.curTalkId_ = 120421107
		arg_439_1.duration_ = 11.333

		local var_439_0 = {
			zh = 8.033,
			ja = 11.333
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
				arg_439_0:Play120421108(arg_439_1)
			end
		end

		function arg_439_1.onSingleLineUpdate_(arg_442_0)
			local var_442_0 = arg_439_1.actors_["1074ui_story"]
			local var_442_1 = 0

			if var_442_1 < arg_439_1.time_ and arg_439_1.time_ <= var_442_1 + arg_442_0 and arg_439_1.var_.characterEffect1074ui_story == nil then
				arg_439_1.var_.characterEffect1074ui_story = var_442_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_442_2 = 0.2

			if var_442_1 <= arg_439_1.time_ and arg_439_1.time_ < var_442_1 + var_442_2 then
				local var_442_3 = (arg_439_1.time_ - var_442_1) / var_442_2

				if arg_439_1.var_.characterEffect1074ui_story then
					arg_439_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_439_1.time_ >= var_442_1 + var_442_2 and arg_439_1.time_ < var_442_1 + var_442_2 + arg_442_0 and arg_439_1.var_.characterEffect1074ui_story then
				arg_439_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_442_4 = 0
			local var_442_5 = 0.8

			if var_442_4 < arg_439_1.time_ and arg_439_1.time_ <= var_442_4 + arg_442_0 then
				arg_439_1.talkMaxDuration = 0
				arg_439_1.dialogCg_.alpha = 1

				arg_439_1.dialog_:SetActive(true)
				SetActive(arg_439_1.leftNameGo_, true)

				local var_442_6 = arg_439_1:FormatText(StoryNameCfg[410].name)

				arg_439_1.leftNameTxt_.text = var_442_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_439_1.leftNameTxt_.transform)

				arg_439_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_439_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_439_1:RecordName(arg_439_1.leftNameTxt_.text)
				SetActive(arg_439_1.iconTrs_.gameObject, false)
				arg_439_1.callingController_:SetSelectedState("normal")

				local var_442_7 = arg_439_1:GetWordFromCfg(120421107)
				local var_442_8 = arg_439_1:FormatText(var_442_7.content)

				arg_439_1.text_.text = var_442_8

				LuaForUtil.ClearLinePrefixSymbol(arg_439_1.text_)

				local var_442_9 = 32
				local var_442_10 = utf8.len(var_442_8)
				local var_442_11 = var_442_9 <= 0 and var_442_5 or var_442_5 * (var_442_10 / var_442_9)

				if var_442_11 > 0 and var_442_5 < var_442_11 then
					arg_439_1.talkMaxDuration = var_442_11

					if var_442_11 + var_442_4 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_11 + var_442_4
					end
				end

				arg_439_1.text_.text = var_442_8
				arg_439_1.typewritter.percent = 0

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421107", "story_v_out_120421.awb") ~= 0 then
					local var_442_12 = manager.audio:GetVoiceLength("story_v_out_120421", "120421107", "story_v_out_120421.awb") / 1000

					if var_442_12 + var_442_4 > arg_439_1.duration_ then
						arg_439_1.duration_ = var_442_12 + var_442_4
					end

					if var_442_7.prefab_name ~= "" and arg_439_1.actors_[var_442_7.prefab_name] ~= nil then
						local var_442_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_439_1.actors_[var_442_7.prefab_name].transform, "story_v_out_120421", "120421107", "story_v_out_120421.awb")

						arg_439_1:RecordAudio("120421107", var_442_13)
						arg_439_1:RecordAudio("120421107", var_442_13)
					else
						arg_439_1:AudioAction("play", "voice", "story_v_out_120421", "120421107", "story_v_out_120421.awb")
					end

					arg_439_1:RecordHistoryTalkVoice("story_v_out_120421", "120421107", "story_v_out_120421.awb")
				end

				arg_439_1:RecordContent(arg_439_1.text_.text)
			end

			local var_442_14 = math.max(var_442_5, arg_439_1.talkMaxDuration)

			if var_442_4 <= arg_439_1.time_ and arg_439_1.time_ < var_442_4 + var_442_14 then
				arg_439_1.typewritter.percent = (arg_439_1.time_ - var_442_4) / var_442_14

				arg_439_1.typewritter:SetDirty()
			end

			if arg_439_1.time_ >= var_442_4 + var_442_14 and arg_439_1.time_ < var_442_4 + var_442_14 + arg_442_0 then
				arg_439_1.typewritter.percent = 1

				arg_439_1.typewritter:SetDirty()
				arg_439_1:ShowNextGo(true)
			end
		end
	end,
	Play120421108 = function(arg_443_0, arg_443_1)
		arg_443_1.time_ = 0
		arg_443_1.frameCnt_ = 0
		arg_443_1.state_ = "playing"
		arg_443_1.curTalkId_ = 120421108
		arg_443_1.duration_ = 4.6

		local var_443_0 = {
			zh = 3.1,
			ja = 4.6
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
				arg_443_0:Play120421109(arg_443_1)
			end
		end

		function arg_443_1.onSingleLineUpdate_(arg_446_0)
			local var_446_0 = arg_443_1.actors_["1075ui_story"].transform
			local var_446_1 = 0

			if var_446_1 < arg_443_1.time_ and arg_443_1.time_ <= var_446_1 + arg_446_0 then
				arg_443_1.var_.moveOldPos1075ui_story = var_446_0.localPosition
			end

			local var_446_2 = 0.001

			if var_446_1 <= arg_443_1.time_ and arg_443_1.time_ < var_446_1 + var_446_2 then
				local var_446_3 = (arg_443_1.time_ - var_446_1) / var_446_2
				local var_446_4 = Vector3.New(0, 100, 0)

				var_446_0.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos1075ui_story, var_446_4, var_446_3)

				local var_446_5 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_5.x, var_446_5.y, var_446_5.z)

				local var_446_6 = var_446_0.localEulerAngles

				var_446_6.z = 0
				var_446_6.x = 0
				var_446_0.localEulerAngles = var_446_6
			end

			if arg_443_1.time_ >= var_446_1 + var_446_2 and arg_443_1.time_ < var_446_1 + var_446_2 + arg_446_0 then
				var_446_0.localPosition = Vector3.New(0, 100, 0)

				local var_446_7 = manager.ui.mainCamera.transform.position - var_446_0.position

				var_446_0.forward = Vector3.New(var_446_7.x, var_446_7.y, var_446_7.z)

				local var_446_8 = var_446_0.localEulerAngles

				var_446_8.z = 0
				var_446_8.x = 0
				var_446_0.localEulerAngles = var_446_8
			end

			local var_446_9 = arg_443_1.actors_["10044ui_story"].transform
			local var_446_10 = 0

			if var_446_10 < arg_443_1.time_ and arg_443_1.time_ <= var_446_10 + arg_446_0 then
				arg_443_1.var_.moveOldPos10044ui_story = var_446_9.localPosition
			end

			local var_446_11 = 0.001

			if var_446_10 <= arg_443_1.time_ and arg_443_1.time_ < var_446_10 + var_446_11 then
				local var_446_12 = (arg_443_1.time_ - var_446_10) / var_446_11
				local var_446_13 = Vector3.New(0.7, -0.72, -6.3)

				var_446_9.localPosition = Vector3.Lerp(arg_443_1.var_.moveOldPos10044ui_story, var_446_13, var_446_12)

				local var_446_14 = manager.ui.mainCamera.transform.position - var_446_9.position

				var_446_9.forward = Vector3.New(var_446_14.x, var_446_14.y, var_446_14.z)

				local var_446_15 = var_446_9.localEulerAngles

				var_446_15.z = 0
				var_446_15.x = 0
				var_446_9.localEulerAngles = var_446_15
			end

			if arg_443_1.time_ >= var_446_10 + var_446_11 and arg_443_1.time_ < var_446_10 + var_446_11 + arg_446_0 then
				var_446_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_446_16 = manager.ui.mainCamera.transform.position - var_446_9.position

				var_446_9.forward = Vector3.New(var_446_16.x, var_446_16.y, var_446_16.z)

				local var_446_17 = var_446_9.localEulerAngles

				var_446_17.z = 0
				var_446_17.x = 0
				var_446_9.localEulerAngles = var_446_17
			end

			local var_446_18 = 0

			if var_446_18 < arg_443_1.time_ and arg_443_1.time_ <= var_446_18 + arg_446_0 then
				arg_443_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_446_19 = 0

			if var_446_19 < arg_443_1.time_ and arg_443_1.time_ <= var_446_19 + arg_446_0 then
				arg_443_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_446_20 = arg_443_1.actors_["10044ui_story"]
			local var_446_21 = 0

			if var_446_21 < arg_443_1.time_ and arg_443_1.time_ <= var_446_21 + arg_446_0 and arg_443_1.var_.characterEffect10044ui_story == nil then
				arg_443_1.var_.characterEffect10044ui_story = var_446_20:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_22 = 0.2

			if var_446_21 <= arg_443_1.time_ and arg_443_1.time_ < var_446_21 + var_446_22 then
				local var_446_23 = (arg_443_1.time_ - var_446_21) / var_446_22

				if arg_443_1.var_.characterEffect10044ui_story then
					arg_443_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_443_1.time_ >= var_446_21 + var_446_22 and arg_443_1.time_ < var_446_21 + var_446_22 + arg_446_0 and arg_443_1.var_.characterEffect10044ui_story then
				arg_443_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_446_24 = arg_443_1.actors_["1074ui_story"]
			local var_446_25 = 0

			if var_446_25 < arg_443_1.time_ and arg_443_1.time_ <= var_446_25 + arg_446_0 and arg_443_1.var_.characterEffect1074ui_story == nil then
				arg_443_1.var_.characterEffect1074ui_story = var_446_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_446_26 = 0.2

			if var_446_25 <= arg_443_1.time_ and arg_443_1.time_ < var_446_25 + var_446_26 then
				local var_446_27 = (arg_443_1.time_ - var_446_25) / var_446_26

				if arg_443_1.var_.characterEffect1074ui_story then
					local var_446_28 = Mathf.Lerp(0, 0.5, var_446_27)

					arg_443_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_443_1.var_.characterEffect1074ui_story.fillRatio = var_446_28
				end
			end

			if arg_443_1.time_ >= var_446_25 + var_446_26 and arg_443_1.time_ < var_446_25 + var_446_26 + arg_446_0 and arg_443_1.var_.characterEffect1074ui_story then
				local var_446_29 = 0.5

				arg_443_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_443_1.var_.characterEffect1074ui_story.fillRatio = var_446_29
			end

			local var_446_30 = 0
			local var_446_31 = 0.35

			if var_446_30 < arg_443_1.time_ and arg_443_1.time_ <= var_446_30 + arg_446_0 then
				arg_443_1.talkMaxDuration = 0
				arg_443_1.dialogCg_.alpha = 1

				arg_443_1.dialog_:SetActive(true)
				SetActive(arg_443_1.leftNameGo_, true)

				local var_446_32 = arg_443_1:FormatText(StoryNameCfg[380].name)

				arg_443_1.leftNameTxt_.text = var_446_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_443_1.leftNameTxt_.transform)

				arg_443_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_443_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_443_1:RecordName(arg_443_1.leftNameTxt_.text)
				SetActive(arg_443_1.iconTrs_.gameObject, false)
				arg_443_1.callingController_:SetSelectedState("normal")

				local var_446_33 = arg_443_1:GetWordFromCfg(120421108)
				local var_446_34 = arg_443_1:FormatText(var_446_33.content)

				arg_443_1.text_.text = var_446_34

				LuaForUtil.ClearLinePrefixSymbol(arg_443_1.text_)

				local var_446_35 = 14
				local var_446_36 = utf8.len(var_446_34)
				local var_446_37 = var_446_35 <= 0 and var_446_31 or var_446_31 * (var_446_36 / var_446_35)

				if var_446_37 > 0 and var_446_31 < var_446_37 then
					arg_443_1.talkMaxDuration = var_446_37

					if var_446_37 + var_446_30 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_37 + var_446_30
					end
				end

				arg_443_1.text_.text = var_446_34
				arg_443_1.typewritter.percent = 0

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421108", "story_v_out_120421.awb") ~= 0 then
					local var_446_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421108", "story_v_out_120421.awb") / 1000

					if var_446_38 + var_446_30 > arg_443_1.duration_ then
						arg_443_1.duration_ = var_446_38 + var_446_30
					end

					if var_446_33.prefab_name ~= "" and arg_443_1.actors_[var_446_33.prefab_name] ~= nil then
						local var_446_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_443_1.actors_[var_446_33.prefab_name].transform, "story_v_out_120421", "120421108", "story_v_out_120421.awb")

						arg_443_1:RecordAudio("120421108", var_446_39)
						arg_443_1:RecordAudio("120421108", var_446_39)
					else
						arg_443_1:AudioAction("play", "voice", "story_v_out_120421", "120421108", "story_v_out_120421.awb")
					end

					arg_443_1:RecordHistoryTalkVoice("story_v_out_120421", "120421108", "story_v_out_120421.awb")
				end

				arg_443_1:RecordContent(arg_443_1.text_.text)
			end

			local var_446_40 = math.max(var_446_31, arg_443_1.talkMaxDuration)

			if var_446_30 <= arg_443_1.time_ and arg_443_1.time_ < var_446_30 + var_446_40 then
				arg_443_1.typewritter.percent = (arg_443_1.time_ - var_446_30) / var_446_40

				arg_443_1.typewritter:SetDirty()
			end

			if arg_443_1.time_ >= var_446_30 + var_446_40 and arg_443_1.time_ < var_446_30 + var_446_40 + arg_446_0 then
				arg_443_1.typewritter.percent = 1

				arg_443_1.typewritter:SetDirty()
				arg_443_1:ShowNextGo(true)
			end
		end
	end,
	Play120421109 = function(arg_447_0, arg_447_1)
		arg_447_1.time_ = 0
		arg_447_1.frameCnt_ = 0
		arg_447_1.state_ = "playing"
		arg_447_1.curTalkId_ = 120421109
		arg_447_1.duration_ = 3.1

		local var_447_0 = {
			zh = 2.3,
			ja = 3.1
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
				arg_447_0:Play120421110(arg_447_1)
			end
		end

		function arg_447_1.onSingleLineUpdate_(arg_450_0)
			local var_450_0 = arg_447_1.actors_["10044ui_story"]
			local var_450_1 = 0

			if var_450_1 < arg_447_1.time_ and arg_447_1.time_ <= var_450_1 + arg_450_0 and arg_447_1.var_.characterEffect10044ui_story == nil then
				arg_447_1.var_.characterEffect10044ui_story = var_450_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_2 = 0.2

			if var_450_1 <= arg_447_1.time_ and arg_447_1.time_ < var_450_1 + var_450_2 then
				local var_450_3 = (arg_447_1.time_ - var_450_1) / var_450_2

				if arg_447_1.var_.characterEffect10044ui_story then
					local var_450_4 = Mathf.Lerp(0, 0.5, var_450_3)

					arg_447_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_447_1.var_.characterEffect10044ui_story.fillRatio = var_450_4
				end
			end

			if arg_447_1.time_ >= var_450_1 + var_450_2 and arg_447_1.time_ < var_450_1 + var_450_2 + arg_450_0 and arg_447_1.var_.characterEffect10044ui_story then
				local var_450_5 = 0.5

				arg_447_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_447_1.var_.characterEffect10044ui_story.fillRatio = var_450_5
			end

			local var_450_6 = arg_447_1.actors_["1074ui_story"]
			local var_450_7 = 0

			if var_450_7 < arg_447_1.time_ and arg_447_1.time_ <= var_450_7 + arg_450_0 and arg_447_1.var_.characterEffect1074ui_story == nil then
				arg_447_1.var_.characterEffect1074ui_story = var_450_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_450_8 = 0.2

			if var_450_7 <= arg_447_1.time_ and arg_447_1.time_ < var_450_7 + var_450_8 then
				local var_450_9 = (arg_447_1.time_ - var_450_7) / var_450_8

				if arg_447_1.var_.characterEffect1074ui_story then
					arg_447_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_447_1.time_ >= var_450_7 + var_450_8 and arg_447_1.time_ < var_450_7 + var_450_8 + arg_450_0 and arg_447_1.var_.characterEffect1074ui_story then
				arg_447_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_450_10 = 0
			local var_450_11 = 0.175

			if var_450_10 < arg_447_1.time_ and arg_447_1.time_ <= var_450_10 + arg_450_0 then
				arg_447_1.talkMaxDuration = 0
				arg_447_1.dialogCg_.alpha = 1

				arg_447_1.dialog_:SetActive(true)
				SetActive(arg_447_1.leftNameGo_, true)

				local var_450_12 = arg_447_1:FormatText(StoryNameCfg[410].name)

				arg_447_1.leftNameTxt_.text = var_450_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_447_1.leftNameTxt_.transform)

				arg_447_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_447_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_447_1:RecordName(arg_447_1.leftNameTxt_.text)
				SetActive(arg_447_1.iconTrs_.gameObject, false)
				arg_447_1.callingController_:SetSelectedState("normal")

				local var_450_13 = arg_447_1:GetWordFromCfg(120421109)
				local var_450_14 = arg_447_1:FormatText(var_450_13.content)

				arg_447_1.text_.text = var_450_14

				LuaForUtil.ClearLinePrefixSymbol(arg_447_1.text_)

				local var_450_15 = 7
				local var_450_16 = utf8.len(var_450_14)
				local var_450_17 = var_450_15 <= 0 and var_450_11 or var_450_11 * (var_450_16 / var_450_15)

				if var_450_17 > 0 and var_450_11 < var_450_17 then
					arg_447_1.talkMaxDuration = var_450_17

					if var_450_17 + var_450_10 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_17 + var_450_10
					end
				end

				arg_447_1.text_.text = var_450_14
				arg_447_1.typewritter.percent = 0

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421109", "story_v_out_120421.awb") ~= 0 then
					local var_450_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421109", "story_v_out_120421.awb") / 1000

					if var_450_18 + var_450_10 > arg_447_1.duration_ then
						arg_447_1.duration_ = var_450_18 + var_450_10
					end

					if var_450_13.prefab_name ~= "" and arg_447_1.actors_[var_450_13.prefab_name] ~= nil then
						local var_450_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_447_1.actors_[var_450_13.prefab_name].transform, "story_v_out_120421", "120421109", "story_v_out_120421.awb")

						arg_447_1:RecordAudio("120421109", var_450_19)
						arg_447_1:RecordAudio("120421109", var_450_19)
					else
						arg_447_1:AudioAction("play", "voice", "story_v_out_120421", "120421109", "story_v_out_120421.awb")
					end

					arg_447_1:RecordHistoryTalkVoice("story_v_out_120421", "120421109", "story_v_out_120421.awb")
				end

				arg_447_1:RecordContent(arg_447_1.text_.text)
			end

			local var_450_20 = math.max(var_450_11, arg_447_1.talkMaxDuration)

			if var_450_10 <= arg_447_1.time_ and arg_447_1.time_ < var_450_10 + var_450_20 then
				arg_447_1.typewritter.percent = (arg_447_1.time_ - var_450_10) / var_450_20

				arg_447_1.typewritter:SetDirty()
			end

			if arg_447_1.time_ >= var_450_10 + var_450_20 and arg_447_1.time_ < var_450_10 + var_450_20 + arg_450_0 then
				arg_447_1.typewritter.percent = 1

				arg_447_1.typewritter:SetDirty()
				arg_447_1:ShowNextGo(true)
			end
		end
	end,
	Play120421110 = function(arg_451_0, arg_451_1)
		arg_451_1.time_ = 0
		arg_451_1.frameCnt_ = 0
		arg_451_1.state_ = "playing"
		arg_451_1.curTalkId_ = 120421110
		arg_451_1.duration_ = 5

		SetActive(arg_451_1.tipsGo_, false)

		function arg_451_1.onSingleLineFinish_()
			arg_451_1.onSingleLineUpdate_ = nil
			arg_451_1.onSingleLineFinish_ = nil
			arg_451_1.state_ = "waiting"
		end

		function arg_451_1.playNext_(arg_453_0)
			if arg_453_0 == 1 then
				arg_451_0:Play120421111(arg_451_1)
			end
		end

		function arg_451_1.onSingleLineUpdate_(arg_454_0)
			local var_454_0 = arg_451_1.actors_["10044ui_story"].transform
			local var_454_1 = 0

			if var_454_1 < arg_451_1.time_ and arg_451_1.time_ <= var_454_1 + arg_454_0 then
				arg_451_1.var_.moveOldPos10044ui_story = var_454_0.localPosition
			end

			local var_454_2 = 0.001

			if var_454_1 <= arg_451_1.time_ and arg_451_1.time_ < var_454_1 + var_454_2 then
				local var_454_3 = (arg_451_1.time_ - var_454_1) / var_454_2
				local var_454_4 = Vector3.New(0, 100, 0)

				var_454_0.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos10044ui_story, var_454_4, var_454_3)

				local var_454_5 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_5.x, var_454_5.y, var_454_5.z)

				local var_454_6 = var_454_0.localEulerAngles

				var_454_6.z = 0
				var_454_6.x = 0
				var_454_0.localEulerAngles = var_454_6
			end

			if arg_451_1.time_ >= var_454_1 + var_454_2 and arg_451_1.time_ < var_454_1 + var_454_2 + arg_454_0 then
				var_454_0.localPosition = Vector3.New(0, 100, 0)

				local var_454_7 = manager.ui.mainCamera.transform.position - var_454_0.position

				var_454_0.forward = Vector3.New(var_454_7.x, var_454_7.y, var_454_7.z)

				local var_454_8 = var_454_0.localEulerAngles

				var_454_8.z = 0
				var_454_8.x = 0
				var_454_0.localEulerAngles = var_454_8
			end

			local var_454_9 = arg_451_1.actors_["1074ui_story"].transform
			local var_454_10 = 0

			if var_454_10 < arg_451_1.time_ and arg_451_1.time_ <= var_454_10 + arg_454_0 then
				arg_451_1.var_.moveOldPos1074ui_story = var_454_9.localPosition
			end

			local var_454_11 = 0.001

			if var_454_10 <= arg_451_1.time_ and arg_451_1.time_ < var_454_10 + var_454_11 then
				local var_454_12 = (arg_451_1.time_ - var_454_10) / var_454_11
				local var_454_13 = Vector3.New(0, 100, 0)

				var_454_9.localPosition = Vector3.Lerp(arg_451_1.var_.moveOldPos1074ui_story, var_454_13, var_454_12)

				local var_454_14 = manager.ui.mainCamera.transform.position - var_454_9.position

				var_454_9.forward = Vector3.New(var_454_14.x, var_454_14.y, var_454_14.z)

				local var_454_15 = var_454_9.localEulerAngles

				var_454_15.z = 0
				var_454_15.x = 0
				var_454_9.localEulerAngles = var_454_15
			end

			if arg_451_1.time_ >= var_454_10 + var_454_11 and arg_451_1.time_ < var_454_10 + var_454_11 + arg_454_0 then
				var_454_9.localPosition = Vector3.New(0, 100, 0)

				local var_454_16 = manager.ui.mainCamera.transform.position - var_454_9.position

				var_454_9.forward = Vector3.New(var_454_16.x, var_454_16.y, var_454_16.z)

				local var_454_17 = var_454_9.localEulerAngles

				var_454_17.z = 0
				var_454_17.x = 0
				var_454_9.localEulerAngles = var_454_17
			end

			local var_454_18 = 0
			local var_454_19 = 1.05

			if var_454_18 < arg_451_1.time_ and arg_451_1.time_ <= var_454_18 + arg_454_0 then
				arg_451_1.talkMaxDuration = 0
				arg_451_1.dialogCg_.alpha = 1

				arg_451_1.dialog_:SetActive(true)
				SetActive(arg_451_1.leftNameGo_, false)

				arg_451_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_451_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_451_1:RecordName(arg_451_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_451_1.iconTrs_.gameObject, false)
				arg_451_1.callingController_:SetSelectedState("normal")

				local var_454_20 = arg_451_1:GetWordFromCfg(120421110)
				local var_454_21 = arg_451_1:FormatText(var_454_20.content)

				arg_451_1.text_.text = var_454_21

				LuaForUtil.ClearLinePrefixSymbol(arg_451_1.text_)

				local var_454_22 = 42
				local var_454_23 = utf8.len(var_454_21)
				local var_454_24 = var_454_22 <= 0 and var_454_19 or var_454_19 * (var_454_23 / var_454_22)

				if var_454_24 > 0 and var_454_19 < var_454_24 then
					arg_451_1.talkMaxDuration = var_454_24

					if var_454_24 + var_454_18 > arg_451_1.duration_ then
						arg_451_1.duration_ = var_454_24 + var_454_18
					end
				end

				arg_451_1.text_.text = var_454_21
				arg_451_1.typewritter.percent = 0

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(false)
				arg_451_1:RecordContent(arg_451_1.text_.text)
			end

			local var_454_25 = math.max(var_454_19, arg_451_1.talkMaxDuration)

			if var_454_18 <= arg_451_1.time_ and arg_451_1.time_ < var_454_18 + var_454_25 then
				arg_451_1.typewritter.percent = (arg_451_1.time_ - var_454_18) / var_454_25

				arg_451_1.typewritter:SetDirty()
			end

			if arg_451_1.time_ >= var_454_18 + var_454_25 and arg_451_1.time_ < var_454_18 + var_454_25 + arg_454_0 then
				arg_451_1.typewritter.percent = 1

				arg_451_1.typewritter:SetDirty()
				arg_451_1:ShowNextGo(true)
			end
		end
	end,
	Play120421111 = function(arg_455_0, arg_455_1)
		arg_455_1.time_ = 0
		arg_455_1.frameCnt_ = 0
		arg_455_1.state_ = "playing"
		arg_455_1.curTalkId_ = 120421111
		arg_455_1.duration_ = 13.266

		local var_455_0 = {
			zh = 9.966,
			ja = 13.266
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
				arg_455_0:Play120421112(arg_455_1)
			end
		end

		function arg_455_1.onSingleLineUpdate_(arg_458_0)
			local var_458_0 = arg_455_1.actors_["1074ui_story"].transform
			local var_458_1 = 0

			if var_458_1 < arg_455_1.time_ and arg_455_1.time_ <= var_458_1 + arg_458_0 then
				arg_455_1.var_.moveOldPos1074ui_story = var_458_0.localPosition
			end

			local var_458_2 = 0.001

			if var_458_1 <= arg_455_1.time_ and arg_455_1.time_ < var_458_1 + var_458_2 then
				local var_458_3 = (arg_455_1.time_ - var_458_1) / var_458_2
				local var_458_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_458_0.localPosition = Vector3.Lerp(arg_455_1.var_.moveOldPos1074ui_story, var_458_4, var_458_3)

				local var_458_5 = manager.ui.mainCamera.transform.position - var_458_0.position

				var_458_0.forward = Vector3.New(var_458_5.x, var_458_5.y, var_458_5.z)

				local var_458_6 = var_458_0.localEulerAngles

				var_458_6.z = 0
				var_458_6.x = 0
				var_458_0.localEulerAngles = var_458_6
			end

			if arg_455_1.time_ >= var_458_1 + var_458_2 and arg_455_1.time_ < var_458_1 + var_458_2 + arg_458_0 then
				var_458_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_458_7 = manager.ui.mainCamera.transform.position - var_458_0.position

				var_458_0.forward = Vector3.New(var_458_7.x, var_458_7.y, var_458_7.z)

				local var_458_8 = var_458_0.localEulerAngles

				var_458_8.z = 0
				var_458_8.x = 0
				var_458_0.localEulerAngles = var_458_8
			end

			local var_458_9 = arg_455_1.actors_["10044ui_story"].transform
			local var_458_10 = 0

			if var_458_10 < arg_455_1.time_ and arg_455_1.time_ <= var_458_10 + arg_458_0 then
				arg_455_1.var_.moveOldPos10044ui_story = var_458_9.localPosition
			end

			local var_458_11 = 0.001

			if var_458_10 <= arg_455_1.time_ and arg_455_1.time_ < var_458_10 + var_458_11 then
				local var_458_12 = (arg_455_1.time_ - var_458_10) / var_458_11
				local var_458_13 = Vector3.New(0.7, -0.72, -6.3)

				var_458_9.localPosition = Vector3.Lerp(arg_455_1.var_.moveOldPos10044ui_story, var_458_13, var_458_12)

				local var_458_14 = manager.ui.mainCamera.transform.position - var_458_9.position

				var_458_9.forward = Vector3.New(var_458_14.x, var_458_14.y, var_458_14.z)

				local var_458_15 = var_458_9.localEulerAngles

				var_458_15.z = 0
				var_458_15.x = 0
				var_458_9.localEulerAngles = var_458_15
			end

			if arg_455_1.time_ >= var_458_10 + var_458_11 and arg_455_1.time_ < var_458_10 + var_458_11 + arg_458_0 then
				var_458_9.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_458_16 = manager.ui.mainCamera.transform.position - var_458_9.position

				var_458_9.forward = Vector3.New(var_458_16.x, var_458_16.y, var_458_16.z)

				local var_458_17 = var_458_9.localEulerAngles

				var_458_17.z = 0
				var_458_17.x = 0
				var_458_9.localEulerAngles = var_458_17
			end

			local var_458_18 = 0

			if var_458_18 < arg_455_1.time_ and arg_455_1.time_ <= var_458_18 + arg_458_0 then
				arg_455_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_458_19 = 0

			if var_458_19 < arg_455_1.time_ and arg_455_1.time_ <= var_458_19 + arg_458_0 then
				arg_455_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_458_20 = 0

			if var_458_20 < arg_455_1.time_ and arg_455_1.time_ <= var_458_20 + arg_458_0 then
				arg_455_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_458_21 = 0

			if var_458_21 < arg_455_1.time_ and arg_455_1.time_ <= var_458_21 + arg_458_0 then
				arg_455_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_458_22 = arg_455_1.actors_["10044ui_story"]
			local var_458_23 = 0

			if var_458_23 < arg_455_1.time_ and arg_455_1.time_ <= var_458_23 + arg_458_0 and arg_455_1.var_.characterEffect10044ui_story == nil then
				arg_455_1.var_.characterEffect10044ui_story = var_458_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_24 = 0.2

			if var_458_23 <= arg_455_1.time_ and arg_455_1.time_ < var_458_23 + var_458_24 then
				local var_458_25 = (arg_455_1.time_ - var_458_23) / var_458_24

				if arg_455_1.var_.characterEffect10044ui_story then
					local var_458_26 = Mathf.Lerp(0, 0.5, var_458_25)

					arg_455_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_455_1.var_.characterEffect10044ui_story.fillRatio = var_458_26
				end
			end

			if arg_455_1.time_ >= var_458_23 + var_458_24 and arg_455_1.time_ < var_458_23 + var_458_24 + arg_458_0 and arg_455_1.var_.characterEffect10044ui_story then
				local var_458_27 = 0.5

				arg_455_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_455_1.var_.characterEffect10044ui_story.fillRatio = var_458_27
			end

			local var_458_28 = arg_455_1.actors_["1074ui_story"]
			local var_458_29 = 0

			if var_458_29 < arg_455_1.time_ and arg_455_1.time_ <= var_458_29 + arg_458_0 and arg_455_1.var_.characterEffect1074ui_story == nil then
				arg_455_1.var_.characterEffect1074ui_story = var_458_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_458_30 = 0.2

			if var_458_29 <= arg_455_1.time_ and arg_455_1.time_ < var_458_29 + var_458_30 then
				local var_458_31 = (arg_455_1.time_ - var_458_29) / var_458_30

				if arg_455_1.var_.characterEffect1074ui_story then
					arg_455_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_455_1.time_ >= var_458_29 + var_458_30 and arg_455_1.time_ < var_458_29 + var_458_30 + arg_458_0 and arg_455_1.var_.characterEffect1074ui_story then
				arg_455_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_458_32 = 0
			local var_458_33 = 1.1

			if var_458_32 < arg_455_1.time_ and arg_455_1.time_ <= var_458_32 + arg_458_0 then
				arg_455_1.talkMaxDuration = 0
				arg_455_1.dialogCg_.alpha = 1

				arg_455_1.dialog_:SetActive(true)
				SetActive(arg_455_1.leftNameGo_, true)

				local var_458_34 = arg_455_1:FormatText(StoryNameCfg[410].name)

				arg_455_1.leftNameTxt_.text = var_458_34

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_455_1.leftNameTxt_.transform)

				arg_455_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_455_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_455_1:RecordName(arg_455_1.leftNameTxt_.text)
				SetActive(arg_455_1.iconTrs_.gameObject, false)
				arg_455_1.callingController_:SetSelectedState("normal")

				local var_458_35 = arg_455_1:GetWordFromCfg(120421111)
				local var_458_36 = arg_455_1:FormatText(var_458_35.content)

				arg_455_1.text_.text = var_458_36

				LuaForUtil.ClearLinePrefixSymbol(arg_455_1.text_)

				local var_458_37 = 44
				local var_458_38 = utf8.len(var_458_36)
				local var_458_39 = var_458_37 <= 0 and var_458_33 or var_458_33 * (var_458_38 / var_458_37)

				if var_458_39 > 0 and var_458_33 < var_458_39 then
					arg_455_1.talkMaxDuration = var_458_39

					if var_458_39 + var_458_32 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_39 + var_458_32
					end
				end

				arg_455_1.text_.text = var_458_36
				arg_455_1.typewritter.percent = 0

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421111", "story_v_out_120421.awb") ~= 0 then
					local var_458_40 = manager.audio:GetVoiceLength("story_v_out_120421", "120421111", "story_v_out_120421.awb") / 1000

					if var_458_40 + var_458_32 > arg_455_1.duration_ then
						arg_455_1.duration_ = var_458_40 + var_458_32
					end

					if var_458_35.prefab_name ~= "" and arg_455_1.actors_[var_458_35.prefab_name] ~= nil then
						local var_458_41 = LuaForUtil.PlayVoiceWithCriLipsync(arg_455_1.actors_[var_458_35.prefab_name].transform, "story_v_out_120421", "120421111", "story_v_out_120421.awb")

						arg_455_1:RecordAudio("120421111", var_458_41)
						arg_455_1:RecordAudio("120421111", var_458_41)
					else
						arg_455_1:AudioAction("play", "voice", "story_v_out_120421", "120421111", "story_v_out_120421.awb")
					end

					arg_455_1:RecordHistoryTalkVoice("story_v_out_120421", "120421111", "story_v_out_120421.awb")
				end

				arg_455_1:RecordContent(arg_455_1.text_.text)
			end

			local var_458_42 = math.max(var_458_33, arg_455_1.talkMaxDuration)

			if var_458_32 <= arg_455_1.time_ and arg_455_1.time_ < var_458_32 + var_458_42 then
				arg_455_1.typewritter.percent = (arg_455_1.time_ - var_458_32) / var_458_42

				arg_455_1.typewritter:SetDirty()
			end

			if arg_455_1.time_ >= var_458_32 + var_458_42 and arg_455_1.time_ < var_458_32 + var_458_42 + arg_458_0 then
				arg_455_1.typewritter.percent = 1

				arg_455_1.typewritter:SetDirty()
				arg_455_1:ShowNextGo(true)
			end
		end
	end,
	Play120421112 = function(arg_459_0, arg_459_1)
		arg_459_1.time_ = 0
		arg_459_1.frameCnt_ = 0
		arg_459_1.state_ = "playing"
		arg_459_1.curTalkId_ = 120421112
		arg_459_1.duration_ = 14.533

		local var_459_0 = {
			zh = 12.133,
			ja = 14.533
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
				arg_459_0:Play120421113(arg_459_1)
			end
		end

		function arg_459_1.onSingleLineUpdate_(arg_462_0)
			local var_462_0 = 0
			local var_462_1 = 1.25

			if var_462_0 < arg_459_1.time_ and arg_459_1.time_ <= var_462_0 + arg_462_0 then
				arg_459_1.talkMaxDuration = 0
				arg_459_1.dialogCg_.alpha = 1

				arg_459_1.dialog_:SetActive(true)
				SetActive(arg_459_1.leftNameGo_, true)

				local var_462_2 = arg_459_1:FormatText(StoryNameCfg[410].name)

				arg_459_1.leftNameTxt_.text = var_462_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_459_1.leftNameTxt_.transform)

				arg_459_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_459_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_459_1:RecordName(arg_459_1.leftNameTxt_.text)
				SetActive(arg_459_1.iconTrs_.gameObject, false)
				arg_459_1.callingController_:SetSelectedState("normal")

				local var_462_3 = arg_459_1:GetWordFromCfg(120421112)
				local var_462_4 = arg_459_1:FormatText(var_462_3.content)

				arg_459_1.text_.text = var_462_4

				LuaForUtil.ClearLinePrefixSymbol(arg_459_1.text_)

				local var_462_5 = 50
				local var_462_6 = utf8.len(var_462_4)
				local var_462_7 = var_462_5 <= 0 and var_462_1 or var_462_1 * (var_462_6 / var_462_5)

				if var_462_7 > 0 and var_462_1 < var_462_7 then
					arg_459_1.talkMaxDuration = var_462_7

					if var_462_7 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_7 + var_462_0
					end
				end

				arg_459_1.text_.text = var_462_4
				arg_459_1.typewritter.percent = 0

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421112", "story_v_out_120421.awb") ~= 0 then
					local var_462_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421112", "story_v_out_120421.awb") / 1000

					if var_462_8 + var_462_0 > arg_459_1.duration_ then
						arg_459_1.duration_ = var_462_8 + var_462_0
					end

					if var_462_3.prefab_name ~= "" and arg_459_1.actors_[var_462_3.prefab_name] ~= nil then
						local var_462_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_459_1.actors_[var_462_3.prefab_name].transform, "story_v_out_120421", "120421112", "story_v_out_120421.awb")

						arg_459_1:RecordAudio("120421112", var_462_9)
						arg_459_1:RecordAudio("120421112", var_462_9)
					else
						arg_459_1:AudioAction("play", "voice", "story_v_out_120421", "120421112", "story_v_out_120421.awb")
					end

					arg_459_1:RecordHistoryTalkVoice("story_v_out_120421", "120421112", "story_v_out_120421.awb")
				end

				arg_459_1:RecordContent(arg_459_1.text_.text)
			end

			local var_462_10 = math.max(var_462_1, arg_459_1.talkMaxDuration)

			if var_462_0 <= arg_459_1.time_ and arg_459_1.time_ < var_462_0 + var_462_10 then
				arg_459_1.typewritter.percent = (arg_459_1.time_ - var_462_0) / var_462_10

				arg_459_1.typewritter:SetDirty()
			end

			if arg_459_1.time_ >= var_462_0 + var_462_10 and arg_459_1.time_ < var_462_0 + var_462_10 + arg_462_0 then
				arg_459_1.typewritter.percent = 1

				arg_459_1.typewritter:SetDirty()
				arg_459_1:ShowNextGo(true)
			end
		end
	end,
	Play120421113 = function(arg_463_0, arg_463_1)
		arg_463_1.time_ = 0
		arg_463_1.frameCnt_ = 0
		arg_463_1.state_ = "playing"
		arg_463_1.curTalkId_ = 120421113
		arg_463_1.duration_ = 5.733

		local var_463_0 = {
			zh = 1.933,
			ja = 5.733
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
				arg_463_0:Play120421114(arg_463_1)
			end
		end

		function arg_463_1.onSingleLineUpdate_(arg_466_0)
			local var_466_0 = 0
			local var_466_1 = 0.2

			if var_466_0 < arg_463_1.time_ and arg_463_1.time_ <= var_466_0 + arg_466_0 then
				arg_463_1.talkMaxDuration = 0
				arg_463_1.dialogCg_.alpha = 1

				arg_463_1.dialog_:SetActive(true)
				SetActive(arg_463_1.leftNameGo_, true)

				local var_466_2 = arg_463_1:FormatText(StoryNameCfg[410].name)

				arg_463_1.leftNameTxt_.text = var_466_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_463_1.leftNameTxt_.transform)

				arg_463_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_463_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_463_1:RecordName(arg_463_1.leftNameTxt_.text)
				SetActive(arg_463_1.iconTrs_.gameObject, false)
				arg_463_1.callingController_:SetSelectedState("normal")

				local var_466_3 = arg_463_1:GetWordFromCfg(120421113)
				local var_466_4 = arg_463_1:FormatText(var_466_3.content)

				arg_463_1.text_.text = var_466_4

				LuaForUtil.ClearLinePrefixSymbol(arg_463_1.text_)

				local var_466_5 = 8
				local var_466_6 = utf8.len(var_466_4)
				local var_466_7 = var_466_5 <= 0 and var_466_1 or var_466_1 * (var_466_6 / var_466_5)

				if var_466_7 > 0 and var_466_1 < var_466_7 then
					arg_463_1.talkMaxDuration = var_466_7

					if var_466_7 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_7 + var_466_0
					end
				end

				arg_463_1.text_.text = var_466_4
				arg_463_1.typewritter.percent = 0

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421113", "story_v_out_120421.awb") ~= 0 then
					local var_466_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421113", "story_v_out_120421.awb") / 1000

					if var_466_8 + var_466_0 > arg_463_1.duration_ then
						arg_463_1.duration_ = var_466_8 + var_466_0
					end

					if var_466_3.prefab_name ~= "" and arg_463_1.actors_[var_466_3.prefab_name] ~= nil then
						local var_466_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_463_1.actors_[var_466_3.prefab_name].transform, "story_v_out_120421", "120421113", "story_v_out_120421.awb")

						arg_463_1:RecordAudio("120421113", var_466_9)
						arg_463_1:RecordAudio("120421113", var_466_9)
					else
						arg_463_1:AudioAction("play", "voice", "story_v_out_120421", "120421113", "story_v_out_120421.awb")
					end

					arg_463_1:RecordHistoryTalkVoice("story_v_out_120421", "120421113", "story_v_out_120421.awb")
				end

				arg_463_1:RecordContent(arg_463_1.text_.text)
			end

			local var_466_10 = math.max(var_466_1, arg_463_1.talkMaxDuration)

			if var_466_0 <= arg_463_1.time_ and arg_463_1.time_ < var_466_0 + var_466_10 then
				arg_463_1.typewritter.percent = (arg_463_1.time_ - var_466_0) / var_466_10

				arg_463_1.typewritter:SetDirty()
			end

			if arg_463_1.time_ >= var_466_0 + var_466_10 and arg_463_1.time_ < var_466_0 + var_466_10 + arg_466_0 then
				arg_463_1.typewritter.percent = 1

				arg_463_1.typewritter:SetDirty()
				arg_463_1:ShowNextGo(true)
			end
		end
	end,
	Play120421114 = function(arg_467_0, arg_467_1)
		arg_467_1.time_ = 0
		arg_467_1.frameCnt_ = 0
		arg_467_1.state_ = "playing"
		arg_467_1.curTalkId_ = 120421114
		arg_467_1.duration_ = 4.966

		local var_467_0 = {
			zh = 2.5,
			ja = 4.966
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
				arg_467_0:Play120421115(arg_467_1)
			end
		end

		function arg_467_1.onSingleLineUpdate_(arg_470_0)
			local var_470_0 = arg_467_1.actors_["10044ui_story"]
			local var_470_1 = 0

			if var_470_1 < arg_467_1.time_ and arg_467_1.time_ <= var_470_1 + arg_470_0 and arg_467_1.var_.characterEffect10044ui_story == nil then
				arg_467_1.var_.characterEffect10044ui_story = var_470_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_2 = 0.2

			if var_470_1 <= arg_467_1.time_ and arg_467_1.time_ < var_470_1 + var_470_2 then
				local var_470_3 = (arg_467_1.time_ - var_470_1) / var_470_2

				if arg_467_1.var_.characterEffect10044ui_story then
					arg_467_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_467_1.time_ >= var_470_1 + var_470_2 and arg_467_1.time_ < var_470_1 + var_470_2 + arg_470_0 and arg_467_1.var_.characterEffect10044ui_story then
				arg_467_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_470_4 = arg_467_1.actors_["1074ui_story"]
			local var_470_5 = 0

			if var_470_5 < arg_467_1.time_ and arg_467_1.time_ <= var_470_5 + arg_470_0 and arg_467_1.var_.characterEffect1074ui_story == nil then
				arg_467_1.var_.characterEffect1074ui_story = var_470_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_470_6 = 0.2

			if var_470_5 <= arg_467_1.time_ and arg_467_1.time_ < var_470_5 + var_470_6 then
				local var_470_7 = (arg_467_1.time_ - var_470_5) / var_470_6

				if arg_467_1.var_.characterEffect1074ui_story then
					local var_470_8 = Mathf.Lerp(0, 0.5, var_470_7)

					arg_467_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_467_1.var_.characterEffect1074ui_story.fillRatio = var_470_8
				end
			end

			if arg_467_1.time_ >= var_470_5 + var_470_6 and arg_467_1.time_ < var_470_5 + var_470_6 + arg_470_0 and arg_467_1.var_.characterEffect1074ui_story then
				local var_470_9 = 0.5

				arg_467_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_467_1.var_.characterEffect1074ui_story.fillRatio = var_470_9
			end

			local var_470_10 = 0

			if var_470_10 < arg_467_1.time_ and arg_467_1.time_ <= var_470_10 + arg_470_0 then
				arg_467_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action4_1")
			end

			local var_470_11 = 0
			local var_470_12 = 0.3

			if var_470_11 < arg_467_1.time_ and arg_467_1.time_ <= var_470_11 + arg_470_0 then
				arg_467_1.talkMaxDuration = 0
				arg_467_1.dialogCg_.alpha = 1

				arg_467_1.dialog_:SetActive(true)
				SetActive(arg_467_1.leftNameGo_, true)

				local var_470_13 = arg_467_1:FormatText(StoryNameCfg[380].name)

				arg_467_1.leftNameTxt_.text = var_470_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_467_1.leftNameTxt_.transform)

				arg_467_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_467_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_467_1:RecordName(arg_467_1.leftNameTxt_.text)
				SetActive(arg_467_1.iconTrs_.gameObject, false)
				arg_467_1.callingController_:SetSelectedState("normal")

				local var_470_14 = arg_467_1:GetWordFromCfg(120421114)
				local var_470_15 = arg_467_1:FormatText(var_470_14.content)

				arg_467_1.text_.text = var_470_15

				LuaForUtil.ClearLinePrefixSymbol(arg_467_1.text_)

				local var_470_16 = 12
				local var_470_17 = utf8.len(var_470_15)
				local var_470_18 = var_470_16 <= 0 and var_470_12 or var_470_12 * (var_470_17 / var_470_16)

				if var_470_18 > 0 and var_470_12 < var_470_18 then
					arg_467_1.talkMaxDuration = var_470_18

					if var_470_18 + var_470_11 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_18 + var_470_11
					end
				end

				arg_467_1.text_.text = var_470_15
				arg_467_1.typewritter.percent = 0

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421114", "story_v_out_120421.awb") ~= 0 then
					local var_470_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421114", "story_v_out_120421.awb") / 1000

					if var_470_19 + var_470_11 > arg_467_1.duration_ then
						arg_467_1.duration_ = var_470_19 + var_470_11
					end

					if var_470_14.prefab_name ~= "" and arg_467_1.actors_[var_470_14.prefab_name] ~= nil then
						local var_470_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_467_1.actors_[var_470_14.prefab_name].transform, "story_v_out_120421", "120421114", "story_v_out_120421.awb")

						arg_467_1:RecordAudio("120421114", var_470_20)
						arg_467_1:RecordAudio("120421114", var_470_20)
					else
						arg_467_1:AudioAction("play", "voice", "story_v_out_120421", "120421114", "story_v_out_120421.awb")
					end

					arg_467_1:RecordHistoryTalkVoice("story_v_out_120421", "120421114", "story_v_out_120421.awb")
				end

				arg_467_1:RecordContent(arg_467_1.text_.text)
			end

			local var_470_21 = math.max(var_470_12, arg_467_1.talkMaxDuration)

			if var_470_11 <= arg_467_1.time_ and arg_467_1.time_ < var_470_11 + var_470_21 then
				arg_467_1.typewritter.percent = (arg_467_1.time_ - var_470_11) / var_470_21

				arg_467_1.typewritter:SetDirty()
			end

			if arg_467_1.time_ >= var_470_11 + var_470_21 and arg_467_1.time_ < var_470_11 + var_470_21 + arg_470_0 then
				arg_467_1.typewritter.percent = 1

				arg_467_1.typewritter:SetDirty()
				arg_467_1:ShowNextGo(true)
			end
		end
	end,
	Play120421115 = function(arg_471_0, arg_471_1)
		arg_471_1.time_ = 0
		arg_471_1.frameCnt_ = 0
		arg_471_1.state_ = "playing"
		arg_471_1.curTalkId_ = 120421115
		arg_471_1.duration_ = 1.999999999999

		SetActive(arg_471_1.tipsGo_, false)

		function arg_471_1.onSingleLineFinish_()
			arg_471_1.onSingleLineUpdate_ = nil
			arg_471_1.onSingleLineFinish_ = nil
			arg_471_1.state_ = "waiting"
		end

		function arg_471_1.playNext_(arg_473_0)
			if arg_473_0 == 1 then
				arg_471_0:Play120421116(arg_471_1)
			end
		end

		function arg_471_1.onSingleLineUpdate_(arg_474_0)
			local var_474_0 = arg_471_1.actors_["10044ui_story"]
			local var_474_1 = 0

			if var_474_1 < arg_471_1.time_ and arg_471_1.time_ <= var_474_1 + arg_474_0 and arg_471_1.var_.characterEffect10044ui_story == nil then
				arg_471_1.var_.characterEffect10044ui_story = var_474_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_2 = 0.2

			if var_474_1 <= arg_471_1.time_ and arg_471_1.time_ < var_474_1 + var_474_2 then
				local var_474_3 = (arg_471_1.time_ - var_474_1) / var_474_2

				if arg_471_1.var_.characterEffect10044ui_story then
					local var_474_4 = Mathf.Lerp(0, 0.5, var_474_3)

					arg_471_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_471_1.var_.characterEffect10044ui_story.fillRatio = var_474_4
				end
			end

			if arg_471_1.time_ >= var_474_1 + var_474_2 and arg_471_1.time_ < var_474_1 + var_474_2 + arg_474_0 and arg_471_1.var_.characterEffect10044ui_story then
				local var_474_5 = 0.5

				arg_471_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_471_1.var_.characterEffect10044ui_story.fillRatio = var_474_5
			end

			local var_474_6 = arg_471_1.actors_["1074ui_story"]
			local var_474_7 = 0

			if var_474_7 < arg_471_1.time_ and arg_471_1.time_ <= var_474_7 + arg_474_0 and arg_471_1.var_.characterEffect1074ui_story == nil then
				arg_471_1.var_.characterEffect1074ui_story = var_474_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_474_8 = 0.2

			if var_474_7 <= arg_471_1.time_ and arg_471_1.time_ < var_474_7 + var_474_8 then
				local var_474_9 = (arg_471_1.time_ - var_474_7) / var_474_8

				if arg_471_1.var_.characterEffect1074ui_story then
					arg_471_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_471_1.time_ >= var_474_7 + var_474_8 and arg_471_1.time_ < var_474_7 + var_474_8 + arg_474_0 and arg_471_1.var_.characterEffect1074ui_story then
				arg_471_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_474_10 = 0

			if var_474_10 < arg_471_1.time_ and arg_471_1.time_ <= var_474_10 + arg_474_0 then
				arg_471_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_474_11 = 0
			local var_474_12 = 0.225

			if var_474_11 < arg_471_1.time_ and arg_471_1.time_ <= var_474_11 + arg_474_0 then
				arg_471_1.talkMaxDuration = 0
				arg_471_1.dialogCg_.alpha = 1

				arg_471_1.dialog_:SetActive(true)
				SetActive(arg_471_1.leftNameGo_, true)

				local var_474_13 = arg_471_1:FormatText(StoryNameCfg[410].name)

				arg_471_1.leftNameTxt_.text = var_474_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_471_1.leftNameTxt_.transform)

				arg_471_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_471_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_471_1:RecordName(arg_471_1.leftNameTxt_.text)
				SetActive(arg_471_1.iconTrs_.gameObject, false)
				arg_471_1.callingController_:SetSelectedState("normal")

				local var_474_14 = arg_471_1:GetWordFromCfg(120421115)
				local var_474_15 = arg_471_1:FormatText(var_474_14.content)

				arg_471_1.text_.text = var_474_15

				LuaForUtil.ClearLinePrefixSymbol(arg_471_1.text_)

				local var_474_16 = 9
				local var_474_17 = utf8.len(var_474_15)
				local var_474_18 = var_474_16 <= 0 and var_474_12 or var_474_12 * (var_474_17 / var_474_16)

				if var_474_18 > 0 and var_474_12 < var_474_18 then
					arg_471_1.talkMaxDuration = var_474_18

					if var_474_18 + var_474_11 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_18 + var_474_11
					end
				end

				arg_471_1.text_.text = var_474_15
				arg_471_1.typewritter.percent = 0

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421115", "story_v_out_120421.awb") ~= 0 then
					local var_474_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421115", "story_v_out_120421.awb") / 1000

					if var_474_19 + var_474_11 > arg_471_1.duration_ then
						arg_471_1.duration_ = var_474_19 + var_474_11
					end

					if var_474_14.prefab_name ~= "" and arg_471_1.actors_[var_474_14.prefab_name] ~= nil then
						local var_474_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_471_1.actors_[var_474_14.prefab_name].transform, "story_v_out_120421", "120421115", "story_v_out_120421.awb")

						arg_471_1:RecordAudio("120421115", var_474_20)
						arg_471_1:RecordAudio("120421115", var_474_20)
					else
						arg_471_1:AudioAction("play", "voice", "story_v_out_120421", "120421115", "story_v_out_120421.awb")
					end

					arg_471_1:RecordHistoryTalkVoice("story_v_out_120421", "120421115", "story_v_out_120421.awb")
				end

				arg_471_1:RecordContent(arg_471_1.text_.text)
			end

			local var_474_21 = math.max(var_474_12, arg_471_1.talkMaxDuration)

			if var_474_11 <= arg_471_1.time_ and arg_471_1.time_ < var_474_11 + var_474_21 then
				arg_471_1.typewritter.percent = (arg_471_1.time_ - var_474_11) / var_474_21

				arg_471_1.typewritter:SetDirty()
			end

			if arg_471_1.time_ >= var_474_11 + var_474_21 and arg_471_1.time_ < var_474_11 + var_474_21 + arg_474_0 then
				arg_471_1.typewritter.percent = 1

				arg_471_1.typewritter:SetDirty()
				arg_471_1:ShowNextGo(true)
			end
		end
	end,
	Play120421116 = function(arg_475_0, arg_475_1)
		arg_475_1.time_ = 0
		arg_475_1.frameCnt_ = 0
		arg_475_1.state_ = "playing"
		arg_475_1.curTalkId_ = 120421116
		arg_475_1.duration_ = 9.166

		local var_475_0 = {
			zh = 7.333,
			ja = 9.166
		}
		local var_475_1 = manager.audio:GetLocalizationFlag()

		if var_475_0[var_475_1] ~= nil then
			arg_475_1.duration_ = var_475_0[var_475_1]
		end

		SetActive(arg_475_1.tipsGo_, false)

		function arg_475_1.onSingleLineFinish_()
			arg_475_1.onSingleLineUpdate_ = nil
			arg_475_1.onSingleLineFinish_ = nil
			arg_475_1.state_ = "waiting"
		end

		function arg_475_1.playNext_(arg_477_0)
			if arg_477_0 == 1 then
				arg_475_0:Play120421117(arg_475_1)
			end
		end

		function arg_475_1.onSingleLineUpdate_(arg_478_0)
			local var_478_0 = 0
			local var_478_1 = 0.775

			if var_478_0 < arg_475_1.time_ and arg_475_1.time_ <= var_478_0 + arg_478_0 then
				arg_475_1.talkMaxDuration = 0
				arg_475_1.dialogCg_.alpha = 1

				arg_475_1.dialog_:SetActive(true)
				SetActive(arg_475_1.leftNameGo_, true)

				local var_478_2 = arg_475_1:FormatText(StoryNameCfg[410].name)

				arg_475_1.leftNameTxt_.text = var_478_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_475_1.leftNameTxt_.transform)

				arg_475_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_475_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_475_1:RecordName(arg_475_1.leftNameTxt_.text)
				SetActive(arg_475_1.iconTrs_.gameObject, false)
				arg_475_1.callingController_:SetSelectedState("normal")

				local var_478_3 = arg_475_1:GetWordFromCfg(120421116)
				local var_478_4 = arg_475_1:FormatText(var_478_3.content)

				arg_475_1.text_.text = var_478_4

				LuaForUtil.ClearLinePrefixSymbol(arg_475_1.text_)

				local var_478_5 = 31
				local var_478_6 = utf8.len(var_478_4)
				local var_478_7 = var_478_5 <= 0 and var_478_1 or var_478_1 * (var_478_6 / var_478_5)

				if var_478_7 > 0 and var_478_1 < var_478_7 then
					arg_475_1.talkMaxDuration = var_478_7

					if var_478_7 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_7 + var_478_0
					end
				end

				arg_475_1.text_.text = var_478_4
				arg_475_1.typewritter.percent = 0

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421116", "story_v_out_120421.awb") ~= 0 then
					local var_478_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421116", "story_v_out_120421.awb") / 1000

					if var_478_8 + var_478_0 > arg_475_1.duration_ then
						arg_475_1.duration_ = var_478_8 + var_478_0
					end

					if var_478_3.prefab_name ~= "" and arg_475_1.actors_[var_478_3.prefab_name] ~= nil then
						local var_478_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_475_1.actors_[var_478_3.prefab_name].transform, "story_v_out_120421", "120421116", "story_v_out_120421.awb")

						arg_475_1:RecordAudio("120421116", var_478_9)
						arg_475_1:RecordAudio("120421116", var_478_9)
					else
						arg_475_1:AudioAction("play", "voice", "story_v_out_120421", "120421116", "story_v_out_120421.awb")
					end

					arg_475_1:RecordHistoryTalkVoice("story_v_out_120421", "120421116", "story_v_out_120421.awb")
				end

				arg_475_1:RecordContent(arg_475_1.text_.text)
			end

			local var_478_10 = math.max(var_478_1, arg_475_1.talkMaxDuration)

			if var_478_0 <= arg_475_1.time_ and arg_475_1.time_ < var_478_0 + var_478_10 then
				arg_475_1.typewritter.percent = (arg_475_1.time_ - var_478_0) / var_478_10

				arg_475_1.typewritter:SetDirty()
			end

			if arg_475_1.time_ >= var_478_0 + var_478_10 and arg_475_1.time_ < var_478_0 + var_478_10 + arg_478_0 then
				arg_475_1.typewritter.percent = 1

				arg_475_1.typewritter:SetDirty()
				arg_475_1:ShowNextGo(true)
			end
		end
	end,
	Play120421117 = function(arg_479_0, arg_479_1)
		arg_479_1.time_ = 0
		arg_479_1.frameCnt_ = 0
		arg_479_1.state_ = "playing"
		arg_479_1.curTalkId_ = 120421117
		arg_479_1.duration_ = 1.999999999999

		SetActive(arg_479_1.tipsGo_, false)

		function arg_479_1.onSingleLineFinish_()
			arg_479_1.onSingleLineUpdate_ = nil
			arg_479_1.onSingleLineFinish_ = nil
			arg_479_1.state_ = "waiting"
		end

		function arg_479_1.playNext_(arg_481_0)
			if arg_481_0 == 1 then
				arg_479_0:Play120421118(arg_479_1)
			end
		end

		function arg_479_1.onSingleLineUpdate_(arg_482_0)
			local var_482_0 = arg_479_1.actors_["10044ui_story"]
			local var_482_1 = 0

			if var_482_1 < arg_479_1.time_ and arg_479_1.time_ <= var_482_1 + arg_482_0 and arg_479_1.var_.characterEffect10044ui_story == nil then
				arg_479_1.var_.characterEffect10044ui_story = var_482_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_2 = 0.2

			if var_482_1 <= arg_479_1.time_ and arg_479_1.time_ < var_482_1 + var_482_2 then
				local var_482_3 = (arg_479_1.time_ - var_482_1) / var_482_2

				if arg_479_1.var_.characterEffect10044ui_story then
					arg_479_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_479_1.time_ >= var_482_1 + var_482_2 and arg_479_1.time_ < var_482_1 + var_482_2 + arg_482_0 and arg_479_1.var_.characterEffect10044ui_story then
				arg_479_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_482_4 = arg_479_1.actors_["1074ui_story"]
			local var_482_5 = 0

			if var_482_5 < arg_479_1.time_ and arg_479_1.time_ <= var_482_5 + arg_482_0 and arg_479_1.var_.characterEffect1074ui_story == nil then
				arg_479_1.var_.characterEffect1074ui_story = var_482_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_482_6 = 0.2

			if var_482_5 <= arg_479_1.time_ and arg_479_1.time_ < var_482_5 + var_482_6 then
				local var_482_7 = (arg_479_1.time_ - var_482_5) / var_482_6

				if arg_479_1.var_.characterEffect1074ui_story then
					local var_482_8 = Mathf.Lerp(0, 0.5, var_482_7)

					arg_479_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_479_1.var_.characterEffect1074ui_story.fillRatio = var_482_8
				end
			end

			if arg_479_1.time_ >= var_482_5 + var_482_6 and arg_479_1.time_ < var_482_5 + var_482_6 + arg_482_0 and arg_479_1.var_.characterEffect1074ui_story then
				local var_482_9 = 0.5

				arg_479_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_479_1.var_.characterEffect1074ui_story.fillRatio = var_482_9
			end

			local var_482_10 = 0

			if var_482_10 < arg_479_1.time_ and arg_479_1.time_ <= var_482_10 + arg_482_0 then
				arg_479_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044actionlink/10044action443")
			end

			local var_482_11 = 0
			local var_482_12 = 0.1

			if var_482_11 < arg_479_1.time_ and arg_479_1.time_ <= var_482_11 + arg_482_0 then
				arg_479_1.talkMaxDuration = 0
				arg_479_1.dialogCg_.alpha = 1

				arg_479_1.dialog_:SetActive(true)
				SetActive(arg_479_1.leftNameGo_, true)

				local var_482_13 = arg_479_1:FormatText(StoryNameCfg[380].name)

				arg_479_1.leftNameTxt_.text = var_482_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_479_1.leftNameTxt_.transform)

				arg_479_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_479_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_479_1:RecordName(arg_479_1.leftNameTxt_.text)
				SetActive(arg_479_1.iconTrs_.gameObject, false)
				arg_479_1.callingController_:SetSelectedState("normal")

				local var_482_14 = arg_479_1:GetWordFromCfg(120421117)
				local var_482_15 = arg_479_1:FormatText(var_482_14.content)

				arg_479_1.text_.text = var_482_15

				LuaForUtil.ClearLinePrefixSymbol(arg_479_1.text_)

				local var_482_16 = 4
				local var_482_17 = utf8.len(var_482_15)
				local var_482_18 = var_482_16 <= 0 and var_482_12 or var_482_12 * (var_482_17 / var_482_16)

				if var_482_18 > 0 and var_482_12 < var_482_18 then
					arg_479_1.talkMaxDuration = var_482_18

					if var_482_18 + var_482_11 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_18 + var_482_11
					end
				end

				arg_479_1.text_.text = var_482_15
				arg_479_1.typewritter.percent = 0

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421117", "story_v_out_120421.awb") ~= 0 then
					local var_482_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421117", "story_v_out_120421.awb") / 1000

					if var_482_19 + var_482_11 > arg_479_1.duration_ then
						arg_479_1.duration_ = var_482_19 + var_482_11
					end

					if var_482_14.prefab_name ~= "" and arg_479_1.actors_[var_482_14.prefab_name] ~= nil then
						local var_482_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_479_1.actors_[var_482_14.prefab_name].transform, "story_v_out_120421", "120421117", "story_v_out_120421.awb")

						arg_479_1:RecordAudio("120421117", var_482_20)
						arg_479_1:RecordAudio("120421117", var_482_20)
					else
						arg_479_1:AudioAction("play", "voice", "story_v_out_120421", "120421117", "story_v_out_120421.awb")
					end

					arg_479_1:RecordHistoryTalkVoice("story_v_out_120421", "120421117", "story_v_out_120421.awb")
				end

				arg_479_1:RecordContent(arg_479_1.text_.text)
			end

			local var_482_21 = math.max(var_482_12, arg_479_1.talkMaxDuration)

			if var_482_11 <= arg_479_1.time_ and arg_479_1.time_ < var_482_11 + var_482_21 then
				arg_479_1.typewritter.percent = (arg_479_1.time_ - var_482_11) / var_482_21

				arg_479_1.typewritter:SetDirty()
			end

			if arg_479_1.time_ >= var_482_11 + var_482_21 and arg_479_1.time_ < var_482_11 + var_482_21 + arg_482_0 then
				arg_479_1.typewritter.percent = 1

				arg_479_1.typewritter:SetDirty()
				arg_479_1:ShowNextGo(true)
			end
		end
	end,
	Play120421118 = function(arg_483_0, arg_483_1)
		arg_483_1.time_ = 0
		arg_483_1.frameCnt_ = 0
		arg_483_1.state_ = "playing"
		arg_483_1.curTalkId_ = 120421118
		arg_483_1.duration_ = 8.2

		local var_483_0 = {
			zh = 8.2,
			ja = 8.166
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
				arg_483_0:Play120421119(arg_483_1)
			end
		end

		function arg_483_1.onSingleLineUpdate_(arg_486_0)
			local var_486_0 = arg_483_1.actors_["10044ui_story"]
			local var_486_1 = 0

			if var_486_1 < arg_483_1.time_ and arg_483_1.time_ <= var_486_1 + arg_486_0 and arg_483_1.var_.characterEffect10044ui_story == nil then
				arg_483_1.var_.characterEffect10044ui_story = var_486_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_2 = 0.2

			if var_486_1 <= arg_483_1.time_ and arg_483_1.time_ < var_486_1 + var_486_2 then
				local var_486_3 = (arg_483_1.time_ - var_486_1) / var_486_2

				if arg_483_1.var_.characterEffect10044ui_story then
					local var_486_4 = Mathf.Lerp(0, 0.5, var_486_3)

					arg_483_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_483_1.var_.characterEffect10044ui_story.fillRatio = var_486_4
				end
			end

			if arg_483_1.time_ >= var_486_1 + var_486_2 and arg_483_1.time_ < var_486_1 + var_486_2 + arg_486_0 and arg_483_1.var_.characterEffect10044ui_story then
				local var_486_5 = 0.5

				arg_483_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_483_1.var_.characterEffect10044ui_story.fillRatio = var_486_5
			end

			local var_486_6 = arg_483_1.actors_["1074ui_story"]
			local var_486_7 = 0

			if var_486_7 < arg_483_1.time_ and arg_483_1.time_ <= var_486_7 + arg_486_0 and arg_483_1.var_.characterEffect1074ui_story == nil then
				arg_483_1.var_.characterEffect1074ui_story = var_486_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_486_8 = 0.2

			if var_486_7 <= arg_483_1.time_ and arg_483_1.time_ < var_486_7 + var_486_8 then
				local var_486_9 = (arg_483_1.time_ - var_486_7) / var_486_8

				if arg_483_1.var_.characterEffect1074ui_story then
					arg_483_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_483_1.time_ >= var_486_7 + var_486_8 and arg_483_1.time_ < var_486_7 + var_486_8 + arg_486_0 and arg_483_1.var_.characterEffect1074ui_story then
				arg_483_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_486_10 = 0
			local var_486_11 = 0.9

			if var_486_10 < arg_483_1.time_ and arg_483_1.time_ <= var_486_10 + arg_486_0 then
				arg_483_1.talkMaxDuration = 0
				arg_483_1.dialogCg_.alpha = 1

				arg_483_1.dialog_:SetActive(true)
				SetActive(arg_483_1.leftNameGo_, true)

				local var_486_12 = arg_483_1:FormatText(StoryNameCfg[410].name)

				arg_483_1.leftNameTxt_.text = var_486_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_483_1.leftNameTxt_.transform)

				arg_483_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_483_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_483_1:RecordName(arg_483_1.leftNameTxt_.text)
				SetActive(arg_483_1.iconTrs_.gameObject, false)
				arg_483_1.callingController_:SetSelectedState("normal")

				local var_486_13 = arg_483_1:GetWordFromCfg(120421118)
				local var_486_14 = arg_483_1:FormatText(var_486_13.content)

				arg_483_1.text_.text = var_486_14

				LuaForUtil.ClearLinePrefixSymbol(arg_483_1.text_)

				local var_486_15 = 36
				local var_486_16 = utf8.len(var_486_14)
				local var_486_17 = var_486_15 <= 0 and var_486_11 or var_486_11 * (var_486_16 / var_486_15)

				if var_486_17 > 0 and var_486_11 < var_486_17 then
					arg_483_1.talkMaxDuration = var_486_17

					if var_486_17 + var_486_10 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_17 + var_486_10
					end
				end

				arg_483_1.text_.text = var_486_14
				arg_483_1.typewritter.percent = 0

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421118", "story_v_out_120421.awb") ~= 0 then
					local var_486_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421118", "story_v_out_120421.awb") / 1000

					if var_486_18 + var_486_10 > arg_483_1.duration_ then
						arg_483_1.duration_ = var_486_18 + var_486_10
					end

					if var_486_13.prefab_name ~= "" and arg_483_1.actors_[var_486_13.prefab_name] ~= nil then
						local var_486_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_483_1.actors_[var_486_13.prefab_name].transform, "story_v_out_120421", "120421118", "story_v_out_120421.awb")

						arg_483_1:RecordAudio("120421118", var_486_19)
						arg_483_1:RecordAudio("120421118", var_486_19)
					else
						arg_483_1:AudioAction("play", "voice", "story_v_out_120421", "120421118", "story_v_out_120421.awb")
					end

					arg_483_1:RecordHistoryTalkVoice("story_v_out_120421", "120421118", "story_v_out_120421.awb")
				end

				arg_483_1:RecordContent(arg_483_1.text_.text)
			end

			local var_486_20 = math.max(var_486_11, arg_483_1.talkMaxDuration)

			if var_486_10 <= arg_483_1.time_ and arg_483_1.time_ < var_486_10 + var_486_20 then
				arg_483_1.typewritter.percent = (arg_483_1.time_ - var_486_10) / var_486_20

				arg_483_1.typewritter:SetDirty()
			end

			if arg_483_1.time_ >= var_486_10 + var_486_20 and arg_483_1.time_ < var_486_10 + var_486_20 + arg_486_0 then
				arg_483_1.typewritter.percent = 1

				arg_483_1.typewritter:SetDirty()
				arg_483_1:ShowNextGo(true)
			end
		end
	end,
	Play120421119 = function(arg_487_0, arg_487_1)
		arg_487_1.time_ = 0
		arg_487_1.frameCnt_ = 0
		arg_487_1.state_ = "playing"
		arg_487_1.curTalkId_ = 120421119
		arg_487_1.duration_ = 4.8

		local var_487_0 = {
			zh = 0.999999999999,
			ja = 4.8
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
				arg_487_0:Play120421120(arg_487_1)
			end
		end

		function arg_487_1.onSingleLineUpdate_(arg_490_0)
			local var_490_0 = arg_487_1.actors_["10044ui_story"]
			local var_490_1 = 0

			if var_490_1 < arg_487_1.time_ and arg_487_1.time_ <= var_490_1 + arg_490_0 and arg_487_1.var_.characterEffect10044ui_story == nil then
				arg_487_1.var_.characterEffect10044ui_story = var_490_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_2 = 0.2

			if var_490_1 <= arg_487_1.time_ and arg_487_1.time_ < var_490_1 + var_490_2 then
				local var_490_3 = (arg_487_1.time_ - var_490_1) / var_490_2

				if arg_487_1.var_.characterEffect10044ui_story then
					arg_487_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_487_1.time_ >= var_490_1 + var_490_2 and arg_487_1.time_ < var_490_1 + var_490_2 + arg_490_0 and arg_487_1.var_.characterEffect10044ui_story then
				arg_487_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_490_4 = arg_487_1.actors_["1074ui_story"]
			local var_490_5 = 0

			if var_490_5 < arg_487_1.time_ and arg_487_1.time_ <= var_490_5 + arg_490_0 and arg_487_1.var_.characterEffect1074ui_story == nil then
				arg_487_1.var_.characterEffect1074ui_story = var_490_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_490_6 = 0.2

			if var_490_5 <= arg_487_1.time_ and arg_487_1.time_ < var_490_5 + var_490_6 then
				local var_490_7 = (arg_487_1.time_ - var_490_5) / var_490_6

				if arg_487_1.var_.characterEffect1074ui_story then
					local var_490_8 = Mathf.Lerp(0, 0.5, var_490_7)

					arg_487_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_487_1.var_.characterEffect1074ui_story.fillRatio = var_490_8
				end
			end

			if arg_487_1.time_ >= var_490_5 + var_490_6 and arg_487_1.time_ < var_490_5 + var_490_6 + arg_490_0 and arg_487_1.var_.characterEffect1074ui_story then
				local var_490_9 = 0.5

				arg_487_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_487_1.var_.characterEffect1074ui_story.fillRatio = var_490_9
			end

			local var_490_10 = 0
			local var_490_11 = 0.125

			if var_490_10 < arg_487_1.time_ and arg_487_1.time_ <= var_490_10 + arg_490_0 then
				arg_487_1.talkMaxDuration = 0
				arg_487_1.dialogCg_.alpha = 1

				arg_487_1.dialog_:SetActive(true)
				SetActive(arg_487_1.leftNameGo_, true)

				local var_490_12 = arg_487_1:FormatText(StoryNameCfg[380].name)

				arg_487_1.leftNameTxt_.text = var_490_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_487_1.leftNameTxt_.transform)

				arg_487_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_487_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_487_1:RecordName(arg_487_1.leftNameTxt_.text)
				SetActive(arg_487_1.iconTrs_.gameObject, false)
				arg_487_1.callingController_:SetSelectedState("normal")

				local var_490_13 = arg_487_1:GetWordFromCfg(120421119)
				local var_490_14 = arg_487_1:FormatText(var_490_13.content)

				arg_487_1.text_.text = var_490_14

				LuaForUtil.ClearLinePrefixSymbol(arg_487_1.text_)

				local var_490_15 = 5
				local var_490_16 = utf8.len(var_490_14)
				local var_490_17 = var_490_15 <= 0 and var_490_11 or var_490_11 * (var_490_16 / var_490_15)

				if var_490_17 > 0 and var_490_11 < var_490_17 then
					arg_487_1.talkMaxDuration = var_490_17

					if var_490_17 + var_490_10 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_17 + var_490_10
					end
				end

				arg_487_1.text_.text = var_490_14
				arg_487_1.typewritter.percent = 0

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421119", "story_v_out_120421.awb") ~= 0 then
					local var_490_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421119", "story_v_out_120421.awb") / 1000

					if var_490_18 + var_490_10 > arg_487_1.duration_ then
						arg_487_1.duration_ = var_490_18 + var_490_10
					end

					if var_490_13.prefab_name ~= "" and arg_487_1.actors_[var_490_13.prefab_name] ~= nil then
						local var_490_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_487_1.actors_[var_490_13.prefab_name].transform, "story_v_out_120421", "120421119", "story_v_out_120421.awb")

						arg_487_1:RecordAudio("120421119", var_490_19)
						arg_487_1:RecordAudio("120421119", var_490_19)
					else
						arg_487_1:AudioAction("play", "voice", "story_v_out_120421", "120421119", "story_v_out_120421.awb")
					end

					arg_487_1:RecordHistoryTalkVoice("story_v_out_120421", "120421119", "story_v_out_120421.awb")
				end

				arg_487_1:RecordContent(arg_487_1.text_.text)
			end

			local var_490_20 = math.max(var_490_11, arg_487_1.talkMaxDuration)

			if var_490_10 <= arg_487_1.time_ and arg_487_1.time_ < var_490_10 + var_490_20 then
				arg_487_1.typewritter.percent = (arg_487_1.time_ - var_490_10) / var_490_20

				arg_487_1.typewritter:SetDirty()
			end

			if arg_487_1.time_ >= var_490_10 + var_490_20 and arg_487_1.time_ < var_490_10 + var_490_20 + arg_490_0 then
				arg_487_1.typewritter.percent = 1

				arg_487_1.typewritter:SetDirty()
				arg_487_1:ShowNextGo(true)
			end
		end
	end,
	Play120421120 = function(arg_491_0, arg_491_1)
		arg_491_1.time_ = 0
		arg_491_1.frameCnt_ = 0
		arg_491_1.state_ = "playing"
		arg_491_1.curTalkId_ = 120421120
		arg_491_1.duration_ = 8.1

		local var_491_0 = {
			zh = 4.3,
			ja = 8.1
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
				arg_491_0:Play120421121(arg_491_1)
			end
		end

		function arg_491_1.onSingleLineUpdate_(arg_494_0)
			local var_494_0 = arg_491_1.actors_["1075ui_story"]
			local var_494_1 = 0

			if var_494_1 < arg_491_1.time_ and arg_491_1.time_ <= var_494_1 + arg_494_0 and arg_491_1.var_.characterEffect1075ui_story == nil then
				arg_491_1.var_.characterEffect1075ui_story = var_494_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_2 = 0.2

			if var_494_1 <= arg_491_1.time_ and arg_491_1.time_ < var_494_1 + var_494_2 then
				local var_494_3 = (arg_491_1.time_ - var_494_1) / var_494_2

				if arg_491_1.var_.characterEffect1075ui_story then
					arg_491_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_491_1.time_ >= var_494_1 + var_494_2 and arg_491_1.time_ < var_494_1 + var_494_2 + arg_494_0 and arg_491_1.var_.characterEffect1075ui_story then
				arg_491_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_494_4 = arg_491_1.actors_["1074ui_story"]
			local var_494_5 = 0

			if var_494_5 < arg_491_1.time_ and arg_491_1.time_ <= var_494_5 + arg_494_0 and arg_491_1.var_.characterEffect1074ui_story == nil then
				arg_491_1.var_.characterEffect1074ui_story = var_494_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_494_6 = 0.2

			if var_494_5 <= arg_491_1.time_ and arg_491_1.time_ < var_494_5 + var_494_6 then
				local var_494_7 = (arg_491_1.time_ - var_494_5) / var_494_6

				if arg_491_1.var_.characterEffect1074ui_story then
					local var_494_8 = Mathf.Lerp(0, 0.5, var_494_7)

					arg_491_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_491_1.var_.characterEffect1074ui_story.fillRatio = var_494_8
				end
			end

			if arg_491_1.time_ >= var_494_5 + var_494_6 and arg_491_1.time_ < var_494_5 + var_494_6 + arg_494_0 and arg_491_1.var_.characterEffect1074ui_story then
				local var_494_9 = 0.5

				arg_491_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_491_1.var_.characterEffect1074ui_story.fillRatio = var_494_9
			end

			local var_494_10 = 0

			if var_494_10 < arg_491_1.time_ and arg_491_1.time_ <= var_494_10 + arg_494_0 then
				arg_491_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_494_11 = arg_491_1.actors_["1075ui_story"].transform
			local var_494_12 = 0

			if var_494_12 < arg_491_1.time_ and arg_491_1.time_ <= var_494_12 + arg_494_0 then
				arg_491_1.var_.moveOldPos1075ui_story = var_494_11.localPosition
			end

			local var_494_13 = 0.001

			if var_494_12 <= arg_491_1.time_ and arg_491_1.time_ < var_494_12 + var_494_13 then
				local var_494_14 = (arg_491_1.time_ - var_494_12) / var_494_13
				local var_494_15 = Vector3.New(0.7, -1.055, -6.16)

				var_494_11.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos1075ui_story, var_494_15, var_494_14)

				local var_494_16 = manager.ui.mainCamera.transform.position - var_494_11.position

				var_494_11.forward = Vector3.New(var_494_16.x, var_494_16.y, var_494_16.z)

				local var_494_17 = var_494_11.localEulerAngles

				var_494_17.z = 0
				var_494_17.x = 0
				var_494_11.localEulerAngles = var_494_17
			end

			if arg_491_1.time_ >= var_494_12 + var_494_13 and arg_491_1.time_ < var_494_12 + var_494_13 + arg_494_0 then
				var_494_11.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_494_18 = manager.ui.mainCamera.transform.position - var_494_11.position

				var_494_11.forward = Vector3.New(var_494_18.x, var_494_18.y, var_494_18.z)

				local var_494_19 = var_494_11.localEulerAngles

				var_494_19.z = 0
				var_494_19.x = 0
				var_494_11.localEulerAngles = var_494_19
			end

			local var_494_20 = arg_491_1.actors_["10044ui_story"].transform
			local var_494_21 = 0

			if var_494_21 < arg_491_1.time_ and arg_491_1.time_ <= var_494_21 + arg_494_0 then
				arg_491_1.var_.moveOldPos10044ui_story = var_494_20.localPosition
			end

			local var_494_22 = 0.001

			if var_494_21 <= arg_491_1.time_ and arg_491_1.time_ < var_494_21 + var_494_22 then
				local var_494_23 = (arg_491_1.time_ - var_494_21) / var_494_22
				local var_494_24 = Vector3.New(0, 100, 0)

				var_494_20.localPosition = Vector3.Lerp(arg_491_1.var_.moveOldPos10044ui_story, var_494_24, var_494_23)

				local var_494_25 = manager.ui.mainCamera.transform.position - var_494_20.position

				var_494_20.forward = Vector3.New(var_494_25.x, var_494_25.y, var_494_25.z)

				local var_494_26 = var_494_20.localEulerAngles

				var_494_26.z = 0
				var_494_26.x = 0
				var_494_20.localEulerAngles = var_494_26
			end

			if arg_491_1.time_ >= var_494_21 + var_494_22 and arg_491_1.time_ < var_494_21 + var_494_22 + arg_494_0 then
				var_494_20.localPosition = Vector3.New(0, 100, 0)

				local var_494_27 = manager.ui.mainCamera.transform.position - var_494_20.position

				var_494_20.forward = Vector3.New(var_494_27.x, var_494_27.y, var_494_27.z)

				local var_494_28 = var_494_20.localEulerAngles

				var_494_28.z = 0
				var_494_28.x = 0
				var_494_20.localEulerAngles = var_494_28
			end

			local var_494_29 = 0
			local var_494_30 = 0.5

			if var_494_29 < arg_491_1.time_ and arg_491_1.time_ <= var_494_29 + arg_494_0 then
				arg_491_1.talkMaxDuration = 0
				arg_491_1.dialogCg_.alpha = 1

				arg_491_1.dialog_:SetActive(true)
				SetActive(arg_491_1.leftNameGo_, true)

				local var_494_31 = arg_491_1:FormatText(StoryNameCfg[381].name)

				arg_491_1.leftNameTxt_.text = var_494_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_491_1.leftNameTxt_.transform)

				arg_491_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_491_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_491_1:RecordName(arg_491_1.leftNameTxt_.text)
				SetActive(arg_491_1.iconTrs_.gameObject, false)
				arg_491_1.callingController_:SetSelectedState("normal")

				local var_494_32 = arg_491_1:GetWordFromCfg(120421120)
				local var_494_33 = arg_491_1:FormatText(var_494_32.content)

				arg_491_1.text_.text = var_494_33

				LuaForUtil.ClearLinePrefixSymbol(arg_491_1.text_)

				local var_494_34 = 20
				local var_494_35 = utf8.len(var_494_33)
				local var_494_36 = var_494_34 <= 0 and var_494_30 or var_494_30 * (var_494_35 / var_494_34)

				if var_494_36 > 0 and var_494_30 < var_494_36 then
					arg_491_1.talkMaxDuration = var_494_36

					if var_494_36 + var_494_29 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_36 + var_494_29
					end
				end

				arg_491_1.text_.text = var_494_33
				arg_491_1.typewritter.percent = 0

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421120", "story_v_out_120421.awb") ~= 0 then
					local var_494_37 = manager.audio:GetVoiceLength("story_v_out_120421", "120421120", "story_v_out_120421.awb") / 1000

					if var_494_37 + var_494_29 > arg_491_1.duration_ then
						arg_491_1.duration_ = var_494_37 + var_494_29
					end

					if var_494_32.prefab_name ~= "" and arg_491_1.actors_[var_494_32.prefab_name] ~= nil then
						local var_494_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_491_1.actors_[var_494_32.prefab_name].transform, "story_v_out_120421", "120421120", "story_v_out_120421.awb")

						arg_491_1:RecordAudio("120421120", var_494_38)
						arg_491_1:RecordAudio("120421120", var_494_38)
					else
						arg_491_1:AudioAction("play", "voice", "story_v_out_120421", "120421120", "story_v_out_120421.awb")
					end

					arg_491_1:RecordHistoryTalkVoice("story_v_out_120421", "120421120", "story_v_out_120421.awb")
				end

				arg_491_1:RecordContent(arg_491_1.text_.text)
			end

			local var_494_39 = math.max(var_494_30, arg_491_1.talkMaxDuration)

			if var_494_29 <= arg_491_1.time_ and arg_491_1.time_ < var_494_29 + var_494_39 then
				arg_491_1.typewritter.percent = (arg_491_1.time_ - var_494_29) / var_494_39

				arg_491_1.typewritter:SetDirty()
			end

			if arg_491_1.time_ >= var_494_29 + var_494_39 and arg_491_1.time_ < var_494_29 + var_494_39 + arg_494_0 then
				arg_491_1.typewritter.percent = 1

				arg_491_1.typewritter:SetDirty()
				arg_491_1:ShowNextGo(true)
			end
		end
	end,
	Play120421121 = function(arg_495_0, arg_495_1)
		arg_495_1.time_ = 0
		arg_495_1.frameCnt_ = 0
		arg_495_1.state_ = "playing"
		arg_495_1.curTalkId_ = 120421121
		arg_495_1.duration_ = 8.966

		local var_495_0 = {
			zh = 5.2,
			ja = 8.966
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
				arg_495_0:Play120421122(arg_495_1)
			end
		end

		function arg_495_1.onSingleLineUpdate_(arg_498_0)
			local var_498_0 = 0
			local var_498_1 = 0.625

			if var_498_0 < arg_495_1.time_ and arg_495_1.time_ <= var_498_0 + arg_498_0 then
				arg_495_1.talkMaxDuration = 0
				arg_495_1.dialogCg_.alpha = 1

				arg_495_1.dialog_:SetActive(true)
				SetActive(arg_495_1.leftNameGo_, true)

				local var_498_2 = arg_495_1:FormatText(StoryNameCfg[381].name)

				arg_495_1.leftNameTxt_.text = var_498_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_495_1.leftNameTxt_.transform)

				arg_495_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_495_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_495_1:RecordName(arg_495_1.leftNameTxt_.text)
				SetActive(arg_495_1.iconTrs_.gameObject, false)
				arg_495_1.callingController_:SetSelectedState("normal")

				local var_498_3 = arg_495_1:GetWordFromCfg(120421121)
				local var_498_4 = arg_495_1:FormatText(var_498_3.content)

				arg_495_1.text_.text = var_498_4

				LuaForUtil.ClearLinePrefixSymbol(arg_495_1.text_)

				local var_498_5 = 25
				local var_498_6 = utf8.len(var_498_4)
				local var_498_7 = var_498_5 <= 0 and var_498_1 or var_498_1 * (var_498_6 / var_498_5)

				if var_498_7 > 0 and var_498_1 < var_498_7 then
					arg_495_1.talkMaxDuration = var_498_7

					if var_498_7 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_7 + var_498_0
					end
				end

				arg_495_1.text_.text = var_498_4
				arg_495_1.typewritter.percent = 0

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421121", "story_v_out_120421.awb") ~= 0 then
					local var_498_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421121", "story_v_out_120421.awb") / 1000

					if var_498_8 + var_498_0 > arg_495_1.duration_ then
						arg_495_1.duration_ = var_498_8 + var_498_0
					end

					if var_498_3.prefab_name ~= "" and arg_495_1.actors_[var_498_3.prefab_name] ~= nil then
						local var_498_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_495_1.actors_[var_498_3.prefab_name].transform, "story_v_out_120421", "120421121", "story_v_out_120421.awb")

						arg_495_1:RecordAudio("120421121", var_498_9)
						arg_495_1:RecordAudio("120421121", var_498_9)
					else
						arg_495_1:AudioAction("play", "voice", "story_v_out_120421", "120421121", "story_v_out_120421.awb")
					end

					arg_495_1:RecordHistoryTalkVoice("story_v_out_120421", "120421121", "story_v_out_120421.awb")
				end

				arg_495_1:RecordContent(arg_495_1.text_.text)
			end

			local var_498_10 = math.max(var_498_1, arg_495_1.talkMaxDuration)

			if var_498_0 <= arg_495_1.time_ and arg_495_1.time_ < var_498_0 + var_498_10 then
				arg_495_1.typewritter.percent = (arg_495_1.time_ - var_498_0) / var_498_10

				arg_495_1.typewritter:SetDirty()
			end

			if arg_495_1.time_ >= var_498_0 + var_498_10 and arg_495_1.time_ < var_498_0 + var_498_10 + arg_498_0 then
				arg_495_1.typewritter.percent = 1

				arg_495_1.typewritter:SetDirty()
				arg_495_1:ShowNextGo(true)
			end
		end
	end,
	Play120421122 = function(arg_499_0, arg_499_1)
		arg_499_1.time_ = 0
		arg_499_1.frameCnt_ = 0
		arg_499_1.state_ = "playing"
		arg_499_1.curTalkId_ = 120421122
		arg_499_1.duration_ = 3.866

		local var_499_0 = {
			zh = 2.366666666666,
			ja = 3.866
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
				arg_499_0:Play120421123(arg_499_1)
			end
		end

		function arg_499_1.onSingleLineUpdate_(arg_502_0)
			local var_502_0 = arg_499_1.actors_["1075ui_story"]
			local var_502_1 = 0

			if var_502_1 < arg_499_1.time_ and arg_499_1.time_ <= var_502_1 + arg_502_0 and arg_499_1.var_.characterEffect1075ui_story == nil then
				arg_499_1.var_.characterEffect1075ui_story = var_502_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_2 = 0.2

			if var_502_1 <= arg_499_1.time_ and arg_499_1.time_ < var_502_1 + var_502_2 then
				local var_502_3 = (arg_499_1.time_ - var_502_1) / var_502_2

				if arg_499_1.var_.characterEffect1075ui_story then
					local var_502_4 = Mathf.Lerp(0, 0.5, var_502_3)

					arg_499_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_499_1.var_.characterEffect1075ui_story.fillRatio = var_502_4
				end
			end

			if arg_499_1.time_ >= var_502_1 + var_502_2 and arg_499_1.time_ < var_502_1 + var_502_2 + arg_502_0 and arg_499_1.var_.characterEffect1075ui_story then
				local var_502_5 = 0.5

				arg_499_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_499_1.var_.characterEffect1075ui_story.fillRatio = var_502_5
			end

			local var_502_6 = arg_499_1.actors_["1074ui_story"]
			local var_502_7 = 0

			if var_502_7 < arg_499_1.time_ and arg_499_1.time_ <= var_502_7 + arg_502_0 and arg_499_1.var_.characterEffect1074ui_story == nil then
				arg_499_1.var_.characterEffect1074ui_story = var_502_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_502_8 = 0.2

			if var_502_7 <= arg_499_1.time_ and arg_499_1.time_ < var_502_7 + var_502_8 then
				local var_502_9 = (arg_499_1.time_ - var_502_7) / var_502_8

				if arg_499_1.var_.characterEffect1074ui_story then
					arg_499_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_499_1.time_ >= var_502_7 + var_502_8 and arg_499_1.time_ < var_502_7 + var_502_8 + arg_502_0 and arg_499_1.var_.characterEffect1074ui_story then
				arg_499_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_502_10 = 0

			if var_502_10 < arg_499_1.time_ and arg_499_1.time_ <= var_502_10 + arg_502_0 then
				arg_499_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_502_11 = 0

			if var_502_11 < arg_499_1.time_ and arg_499_1.time_ <= var_502_11 + arg_502_0 then
				arg_499_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_502_12 = 0
			local var_502_13 = 0.175

			if var_502_12 < arg_499_1.time_ and arg_499_1.time_ <= var_502_12 + arg_502_0 then
				arg_499_1.talkMaxDuration = 0
				arg_499_1.dialogCg_.alpha = 1

				arg_499_1.dialog_:SetActive(true)
				SetActive(arg_499_1.leftNameGo_, true)

				local var_502_14 = arg_499_1:FormatText(StoryNameCfg[410].name)

				arg_499_1.leftNameTxt_.text = var_502_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_499_1.leftNameTxt_.transform)

				arg_499_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_499_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_499_1:RecordName(arg_499_1.leftNameTxt_.text)
				SetActive(arg_499_1.iconTrs_.gameObject, false)
				arg_499_1.callingController_:SetSelectedState("normal")

				local var_502_15 = arg_499_1:GetWordFromCfg(120421122)
				local var_502_16 = arg_499_1:FormatText(var_502_15.content)

				arg_499_1.text_.text = var_502_16

				LuaForUtil.ClearLinePrefixSymbol(arg_499_1.text_)

				local var_502_17 = 7
				local var_502_18 = utf8.len(var_502_16)
				local var_502_19 = var_502_17 <= 0 and var_502_13 or var_502_13 * (var_502_18 / var_502_17)

				if var_502_19 > 0 and var_502_13 < var_502_19 then
					arg_499_1.talkMaxDuration = var_502_19

					if var_502_19 + var_502_12 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_19 + var_502_12
					end
				end

				arg_499_1.text_.text = var_502_16
				arg_499_1.typewritter.percent = 0

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421122", "story_v_out_120421.awb") ~= 0 then
					local var_502_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421122", "story_v_out_120421.awb") / 1000

					if var_502_20 + var_502_12 > arg_499_1.duration_ then
						arg_499_1.duration_ = var_502_20 + var_502_12
					end

					if var_502_15.prefab_name ~= "" and arg_499_1.actors_[var_502_15.prefab_name] ~= nil then
						local var_502_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_499_1.actors_[var_502_15.prefab_name].transform, "story_v_out_120421", "120421122", "story_v_out_120421.awb")

						arg_499_1:RecordAudio("120421122", var_502_21)
						arg_499_1:RecordAudio("120421122", var_502_21)
					else
						arg_499_1:AudioAction("play", "voice", "story_v_out_120421", "120421122", "story_v_out_120421.awb")
					end

					arg_499_1:RecordHistoryTalkVoice("story_v_out_120421", "120421122", "story_v_out_120421.awb")
				end

				arg_499_1:RecordContent(arg_499_1.text_.text)
			end

			local var_502_22 = math.max(var_502_13, arg_499_1.talkMaxDuration)

			if var_502_12 <= arg_499_1.time_ and arg_499_1.time_ < var_502_12 + var_502_22 then
				arg_499_1.typewritter.percent = (arg_499_1.time_ - var_502_12) / var_502_22

				arg_499_1.typewritter:SetDirty()
			end

			if arg_499_1.time_ >= var_502_12 + var_502_22 and arg_499_1.time_ < var_502_12 + var_502_22 + arg_502_0 then
				arg_499_1.typewritter.percent = 1

				arg_499_1.typewritter:SetDirty()
				arg_499_1:ShowNextGo(true)
			end
		end
	end,
	Play120421123 = function(arg_503_0, arg_503_1)
		arg_503_1.time_ = 0
		arg_503_1.frameCnt_ = 0
		arg_503_1.state_ = "playing"
		arg_503_1.curTalkId_ = 120421123
		arg_503_1.duration_ = 7.766

		local var_503_0 = {
			zh = 4.033,
			ja = 7.766
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
				arg_503_0:Play120421124(arg_503_1)
			end
		end

		function arg_503_1.onSingleLineUpdate_(arg_506_0)
			local var_506_0 = arg_503_1.actors_["1075ui_story"]
			local var_506_1 = 0

			if var_506_1 < arg_503_1.time_ and arg_503_1.time_ <= var_506_1 + arg_506_0 and arg_503_1.var_.characterEffect1075ui_story == nil then
				arg_503_1.var_.characterEffect1075ui_story = var_506_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_2 = 0.2

			if var_506_1 <= arg_503_1.time_ and arg_503_1.time_ < var_506_1 + var_506_2 then
				local var_506_3 = (arg_503_1.time_ - var_506_1) / var_506_2

				if arg_503_1.var_.characterEffect1075ui_story then
					arg_503_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_503_1.time_ >= var_506_1 + var_506_2 and arg_503_1.time_ < var_506_1 + var_506_2 + arg_506_0 and arg_503_1.var_.characterEffect1075ui_story then
				arg_503_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_506_4 = arg_503_1.actors_["1074ui_story"]
			local var_506_5 = 0

			if var_506_5 < arg_503_1.time_ and arg_503_1.time_ <= var_506_5 + arg_506_0 and arg_503_1.var_.characterEffect1074ui_story == nil then
				arg_503_1.var_.characterEffect1074ui_story = var_506_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_506_6 = 0.2

			if var_506_5 <= arg_503_1.time_ and arg_503_1.time_ < var_506_5 + var_506_6 then
				local var_506_7 = (arg_503_1.time_ - var_506_5) / var_506_6

				if arg_503_1.var_.characterEffect1074ui_story then
					local var_506_8 = Mathf.Lerp(0, 0.5, var_506_7)

					arg_503_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_503_1.var_.characterEffect1074ui_story.fillRatio = var_506_8
				end
			end

			if arg_503_1.time_ >= var_506_5 + var_506_6 and arg_503_1.time_ < var_506_5 + var_506_6 + arg_506_0 and arg_503_1.var_.characterEffect1074ui_story then
				local var_506_9 = 0.5

				arg_503_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_503_1.var_.characterEffect1074ui_story.fillRatio = var_506_9
			end

			local var_506_10 = 0

			if var_506_10 < arg_503_1.time_ and arg_503_1.time_ <= var_506_10 + arg_506_0 then
				arg_503_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action4_1")
			end

			local var_506_11 = 0

			if var_506_11 < arg_503_1.time_ and arg_503_1.time_ <= var_506_11 + arg_506_0 then
				arg_503_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_506_12 = 0
			local var_506_13 = 0.525

			if var_506_12 < arg_503_1.time_ and arg_503_1.time_ <= var_506_12 + arg_506_0 then
				arg_503_1.talkMaxDuration = 0
				arg_503_1.dialogCg_.alpha = 1

				arg_503_1.dialog_:SetActive(true)
				SetActive(arg_503_1.leftNameGo_, true)

				local var_506_14 = arg_503_1:FormatText(StoryNameCfg[381].name)

				arg_503_1.leftNameTxt_.text = var_506_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_503_1.leftNameTxt_.transform)

				arg_503_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_503_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_503_1:RecordName(arg_503_1.leftNameTxt_.text)
				SetActive(arg_503_1.iconTrs_.gameObject, false)
				arg_503_1.callingController_:SetSelectedState("normal")

				local var_506_15 = arg_503_1:GetWordFromCfg(120421123)
				local var_506_16 = arg_503_1:FormatText(var_506_15.content)

				arg_503_1.text_.text = var_506_16

				LuaForUtil.ClearLinePrefixSymbol(arg_503_1.text_)

				local var_506_17 = 21
				local var_506_18 = utf8.len(var_506_16)
				local var_506_19 = var_506_17 <= 0 and var_506_13 or var_506_13 * (var_506_18 / var_506_17)

				if var_506_19 > 0 and var_506_13 < var_506_19 then
					arg_503_1.talkMaxDuration = var_506_19

					if var_506_19 + var_506_12 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_19 + var_506_12
					end
				end

				arg_503_1.text_.text = var_506_16
				arg_503_1.typewritter.percent = 0

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421123", "story_v_out_120421.awb") ~= 0 then
					local var_506_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421123", "story_v_out_120421.awb") / 1000

					if var_506_20 + var_506_12 > arg_503_1.duration_ then
						arg_503_1.duration_ = var_506_20 + var_506_12
					end

					if var_506_15.prefab_name ~= "" and arg_503_1.actors_[var_506_15.prefab_name] ~= nil then
						local var_506_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_503_1.actors_[var_506_15.prefab_name].transform, "story_v_out_120421", "120421123", "story_v_out_120421.awb")

						arg_503_1:RecordAudio("120421123", var_506_21)
						arg_503_1:RecordAudio("120421123", var_506_21)
					else
						arg_503_1:AudioAction("play", "voice", "story_v_out_120421", "120421123", "story_v_out_120421.awb")
					end

					arg_503_1:RecordHistoryTalkVoice("story_v_out_120421", "120421123", "story_v_out_120421.awb")
				end

				arg_503_1:RecordContent(arg_503_1.text_.text)
			end

			local var_506_22 = math.max(var_506_13, arg_503_1.talkMaxDuration)

			if var_506_12 <= arg_503_1.time_ and arg_503_1.time_ < var_506_12 + var_506_22 then
				arg_503_1.typewritter.percent = (arg_503_1.time_ - var_506_12) / var_506_22

				arg_503_1.typewritter:SetDirty()
			end

			if arg_503_1.time_ >= var_506_12 + var_506_22 and arg_503_1.time_ < var_506_12 + var_506_22 + arg_506_0 then
				arg_503_1.typewritter.percent = 1

				arg_503_1.typewritter:SetDirty()
				arg_503_1:ShowNextGo(true)
			end
		end
	end,
	Play120421124 = function(arg_507_0, arg_507_1)
		arg_507_1.time_ = 0
		arg_507_1.frameCnt_ = 0
		arg_507_1.state_ = "playing"
		arg_507_1.curTalkId_ = 120421124
		arg_507_1.duration_ = 8.5

		local var_507_0 = {
			zh = 4.8,
			ja = 8.5
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
				arg_507_0:Play120421125(arg_507_1)
			end
		end

		function arg_507_1.onSingleLineUpdate_(arg_510_0)
			local var_510_0 = 0
			local var_510_1 = 0.6

			if var_510_0 < arg_507_1.time_ and arg_507_1.time_ <= var_510_0 + arg_510_0 then
				arg_507_1.talkMaxDuration = 0
				arg_507_1.dialogCg_.alpha = 1

				arg_507_1.dialog_:SetActive(true)
				SetActive(arg_507_1.leftNameGo_, true)

				local var_510_2 = arg_507_1:FormatText(StoryNameCfg[381].name)

				arg_507_1.leftNameTxt_.text = var_510_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_507_1.leftNameTxt_.transform)

				arg_507_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_507_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_507_1:RecordName(arg_507_1.leftNameTxt_.text)
				SetActive(arg_507_1.iconTrs_.gameObject, false)
				arg_507_1.callingController_:SetSelectedState("normal")

				local var_510_3 = arg_507_1:GetWordFromCfg(120421124)
				local var_510_4 = arg_507_1:FormatText(var_510_3.content)

				arg_507_1.text_.text = var_510_4

				LuaForUtil.ClearLinePrefixSymbol(arg_507_1.text_)

				local var_510_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421124", "story_v_out_120421.awb") ~= 0 then
					local var_510_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421124", "story_v_out_120421.awb") / 1000

					if var_510_8 + var_510_0 > arg_507_1.duration_ then
						arg_507_1.duration_ = var_510_8 + var_510_0
					end

					if var_510_3.prefab_name ~= "" and arg_507_1.actors_[var_510_3.prefab_name] ~= nil then
						local var_510_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_507_1.actors_[var_510_3.prefab_name].transform, "story_v_out_120421", "120421124", "story_v_out_120421.awb")

						arg_507_1:RecordAudio("120421124", var_510_9)
						arg_507_1:RecordAudio("120421124", var_510_9)
					else
						arg_507_1:AudioAction("play", "voice", "story_v_out_120421", "120421124", "story_v_out_120421.awb")
					end

					arg_507_1:RecordHistoryTalkVoice("story_v_out_120421", "120421124", "story_v_out_120421.awb")
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
	Play120421125 = function(arg_511_0, arg_511_1)
		arg_511_1.time_ = 0
		arg_511_1.frameCnt_ = 0
		arg_511_1.state_ = "playing"
		arg_511_1.curTalkId_ = 120421125
		arg_511_1.duration_ = 11.466

		local var_511_0 = {
			zh = 8.566,
			ja = 11.466
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
				arg_511_0:Play120421126(arg_511_1)
			end
		end

		function arg_511_1.onSingleLineUpdate_(arg_514_0)
			local var_514_0 = 0
			local var_514_1 = 1.1

			if var_514_0 < arg_511_1.time_ and arg_511_1.time_ <= var_514_0 + arg_514_0 then
				arg_511_1.talkMaxDuration = 0
				arg_511_1.dialogCg_.alpha = 1

				arg_511_1.dialog_:SetActive(true)
				SetActive(arg_511_1.leftNameGo_, true)

				local var_514_2 = arg_511_1:FormatText(StoryNameCfg[381].name)

				arg_511_1.leftNameTxt_.text = var_514_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_511_1.leftNameTxt_.transform)

				arg_511_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_511_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_511_1:RecordName(arg_511_1.leftNameTxt_.text)
				SetActive(arg_511_1.iconTrs_.gameObject, false)
				arg_511_1.callingController_:SetSelectedState("normal")

				local var_514_3 = arg_511_1:GetWordFromCfg(120421125)
				local var_514_4 = arg_511_1:FormatText(var_514_3.content)

				arg_511_1.text_.text = var_514_4

				LuaForUtil.ClearLinePrefixSymbol(arg_511_1.text_)

				local var_514_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421125", "story_v_out_120421.awb") ~= 0 then
					local var_514_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421125", "story_v_out_120421.awb") / 1000

					if var_514_8 + var_514_0 > arg_511_1.duration_ then
						arg_511_1.duration_ = var_514_8 + var_514_0
					end

					if var_514_3.prefab_name ~= "" and arg_511_1.actors_[var_514_3.prefab_name] ~= nil then
						local var_514_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_511_1.actors_[var_514_3.prefab_name].transform, "story_v_out_120421", "120421125", "story_v_out_120421.awb")

						arg_511_1:RecordAudio("120421125", var_514_9)
						arg_511_1:RecordAudio("120421125", var_514_9)
					else
						arg_511_1:AudioAction("play", "voice", "story_v_out_120421", "120421125", "story_v_out_120421.awb")
					end

					arg_511_1:RecordHistoryTalkVoice("story_v_out_120421", "120421125", "story_v_out_120421.awb")
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
	Play120421126 = function(arg_515_0, arg_515_1)
		arg_515_1.time_ = 0
		arg_515_1.frameCnt_ = 0
		arg_515_1.state_ = "playing"
		arg_515_1.curTalkId_ = 120421126
		arg_515_1.duration_ = 3.5

		local var_515_0 = {
			zh = 3.5,
			ja = 1.999999999999
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
				arg_515_0:Play120421127(arg_515_1)
			end
		end

		function arg_515_1.onSingleLineUpdate_(arg_518_0)
			local var_518_0 = arg_515_1.actors_["1075ui_story"]
			local var_518_1 = 0

			if var_518_1 < arg_515_1.time_ and arg_515_1.time_ <= var_518_1 + arg_518_0 and arg_515_1.var_.characterEffect1075ui_story == nil then
				arg_515_1.var_.characterEffect1075ui_story = var_518_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_2 = 0.2

			if var_518_1 <= arg_515_1.time_ and arg_515_1.time_ < var_518_1 + var_518_2 then
				local var_518_3 = (arg_515_1.time_ - var_518_1) / var_518_2

				if arg_515_1.var_.characterEffect1075ui_story then
					local var_518_4 = Mathf.Lerp(0, 0.5, var_518_3)

					arg_515_1.var_.characterEffect1075ui_story.fillFlat = true
					arg_515_1.var_.characterEffect1075ui_story.fillRatio = var_518_4
				end
			end

			if arg_515_1.time_ >= var_518_1 + var_518_2 and arg_515_1.time_ < var_518_1 + var_518_2 + arg_518_0 and arg_515_1.var_.characterEffect1075ui_story then
				local var_518_5 = 0.5

				arg_515_1.var_.characterEffect1075ui_story.fillFlat = true
				arg_515_1.var_.characterEffect1075ui_story.fillRatio = var_518_5
			end

			local var_518_6 = arg_515_1.actors_["1074ui_story"]
			local var_518_7 = 0

			if var_518_7 < arg_515_1.time_ and arg_515_1.time_ <= var_518_7 + arg_518_0 and arg_515_1.var_.characterEffect1074ui_story == nil then
				arg_515_1.var_.characterEffect1074ui_story = var_518_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_518_8 = 0.2

			if var_518_7 <= arg_515_1.time_ and arg_515_1.time_ < var_518_7 + var_518_8 then
				local var_518_9 = (arg_515_1.time_ - var_518_7) / var_518_8

				if arg_515_1.var_.characterEffect1074ui_story then
					arg_515_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_515_1.time_ >= var_518_7 + var_518_8 and arg_515_1.time_ < var_518_7 + var_518_8 + arg_518_0 and arg_515_1.var_.characterEffect1074ui_story then
				arg_515_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_518_10 = 0

			if var_518_10 < arg_515_1.time_ and arg_515_1.time_ <= var_518_10 + arg_518_0 then
				arg_515_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_518_11 = 0

			if var_518_11 < arg_515_1.time_ and arg_515_1.time_ <= var_518_11 + arg_518_0 then
				arg_515_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action6_1")
			end

			local var_518_12 = 0
			local var_518_13 = 0.125

			if var_518_12 < arg_515_1.time_ and arg_515_1.time_ <= var_518_12 + arg_518_0 then
				arg_515_1.talkMaxDuration = 0
				arg_515_1.dialogCg_.alpha = 1

				arg_515_1.dialog_:SetActive(true)
				SetActive(arg_515_1.leftNameGo_, true)

				local var_518_14 = arg_515_1:FormatText(StoryNameCfg[410].name)

				arg_515_1.leftNameTxt_.text = var_518_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_515_1.leftNameTxt_.transform)

				arg_515_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_515_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_515_1:RecordName(arg_515_1.leftNameTxt_.text)
				SetActive(arg_515_1.iconTrs_.gameObject, false)
				arg_515_1.callingController_:SetSelectedState("normal")

				local var_518_15 = arg_515_1:GetWordFromCfg(120421126)
				local var_518_16 = arg_515_1:FormatText(var_518_15.content)

				arg_515_1.text_.text = var_518_16

				LuaForUtil.ClearLinePrefixSymbol(arg_515_1.text_)

				local var_518_17 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421126", "story_v_out_120421.awb") ~= 0 then
					local var_518_20 = manager.audio:GetVoiceLength("story_v_out_120421", "120421126", "story_v_out_120421.awb") / 1000

					if var_518_20 + var_518_12 > arg_515_1.duration_ then
						arg_515_1.duration_ = var_518_20 + var_518_12
					end

					if var_518_15.prefab_name ~= "" and arg_515_1.actors_[var_518_15.prefab_name] ~= nil then
						local var_518_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_515_1.actors_[var_518_15.prefab_name].transform, "story_v_out_120421", "120421126", "story_v_out_120421.awb")

						arg_515_1:RecordAudio("120421126", var_518_21)
						arg_515_1:RecordAudio("120421126", var_518_21)
					else
						arg_515_1:AudioAction("play", "voice", "story_v_out_120421", "120421126", "story_v_out_120421.awb")
					end

					arg_515_1:RecordHistoryTalkVoice("story_v_out_120421", "120421126", "story_v_out_120421.awb")
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
	Play120421127 = function(arg_519_0, arg_519_1)
		arg_519_1.time_ = 0
		arg_519_1.frameCnt_ = 0
		arg_519_1.state_ = "playing"
		arg_519_1.curTalkId_ = 120421127
		arg_519_1.duration_ = 9.4

		local var_519_0 = {
			zh = 5.633,
			ja = 9.4
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
				arg_519_0:Play120421128(arg_519_1)
			end
		end

		function arg_519_1.onSingleLineUpdate_(arg_522_0)
			local var_522_0 = arg_519_1.actors_["10044ui_story"]
			local var_522_1 = 0

			if var_522_1 < arg_519_1.time_ and arg_519_1.time_ <= var_522_1 + arg_522_0 and arg_519_1.var_.characterEffect10044ui_story == nil then
				arg_519_1.var_.characterEffect10044ui_story = var_522_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_2 = 0.2

			if var_522_1 <= arg_519_1.time_ and arg_519_1.time_ < var_522_1 + var_522_2 then
				local var_522_3 = (arg_519_1.time_ - var_522_1) / var_522_2

				if arg_519_1.var_.characterEffect10044ui_story then
					arg_519_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_519_1.time_ >= var_522_1 + var_522_2 and arg_519_1.time_ < var_522_1 + var_522_2 + arg_522_0 and arg_519_1.var_.characterEffect10044ui_story then
				arg_519_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_522_4 = arg_519_1.actors_["1074ui_story"]
			local var_522_5 = 0

			if var_522_5 < arg_519_1.time_ and arg_519_1.time_ <= var_522_5 + arg_522_0 and arg_519_1.var_.characterEffect1074ui_story == nil then
				arg_519_1.var_.characterEffect1074ui_story = var_522_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_522_6 = 0.2

			if var_522_5 <= arg_519_1.time_ and arg_519_1.time_ < var_522_5 + var_522_6 then
				local var_522_7 = (arg_519_1.time_ - var_522_5) / var_522_6

				if arg_519_1.var_.characterEffect1074ui_story then
					local var_522_8 = Mathf.Lerp(0, 0.5, var_522_7)

					arg_519_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_519_1.var_.characterEffect1074ui_story.fillRatio = var_522_8
				end
			end

			if arg_519_1.time_ >= var_522_5 + var_522_6 and arg_519_1.time_ < var_522_5 + var_522_6 + arg_522_0 and arg_519_1.var_.characterEffect1074ui_story then
				local var_522_9 = 0.5

				arg_519_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_519_1.var_.characterEffect1074ui_story.fillRatio = var_522_9
			end

			local var_522_10 = 0

			if var_522_10 < arg_519_1.time_ and arg_519_1.time_ <= var_522_10 + arg_522_0 then
				arg_519_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_522_11 = 0

			if var_522_11 < arg_519_1.time_ and arg_519_1.time_ <= var_522_11 + arg_522_0 then
				arg_519_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_522_12 = arg_519_1.actors_["1075ui_story"].transform
			local var_522_13 = 0

			if var_522_13 < arg_519_1.time_ and arg_519_1.time_ <= var_522_13 + arg_522_0 then
				arg_519_1.var_.moveOldPos1075ui_story = var_522_12.localPosition
			end

			local var_522_14 = 0.001

			if var_522_13 <= arg_519_1.time_ and arg_519_1.time_ < var_522_13 + var_522_14 then
				local var_522_15 = (arg_519_1.time_ - var_522_13) / var_522_14
				local var_522_16 = Vector3.New(0, 100, 0)

				var_522_12.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos1075ui_story, var_522_16, var_522_15)

				local var_522_17 = manager.ui.mainCamera.transform.position - var_522_12.position

				var_522_12.forward = Vector3.New(var_522_17.x, var_522_17.y, var_522_17.z)

				local var_522_18 = var_522_12.localEulerAngles

				var_522_18.z = 0
				var_522_18.x = 0
				var_522_12.localEulerAngles = var_522_18
			end

			if arg_519_1.time_ >= var_522_13 + var_522_14 and arg_519_1.time_ < var_522_13 + var_522_14 + arg_522_0 then
				var_522_12.localPosition = Vector3.New(0, 100, 0)

				local var_522_19 = manager.ui.mainCamera.transform.position - var_522_12.position

				var_522_12.forward = Vector3.New(var_522_19.x, var_522_19.y, var_522_19.z)

				local var_522_20 = var_522_12.localEulerAngles

				var_522_20.z = 0
				var_522_20.x = 0
				var_522_12.localEulerAngles = var_522_20
			end

			local var_522_21 = arg_519_1.actors_["10044ui_story"].transform
			local var_522_22 = 0

			if var_522_22 < arg_519_1.time_ and arg_519_1.time_ <= var_522_22 + arg_522_0 then
				arg_519_1.var_.moveOldPos10044ui_story = var_522_21.localPosition
			end

			local var_522_23 = 0.001

			if var_522_22 <= arg_519_1.time_ and arg_519_1.time_ < var_522_22 + var_522_23 then
				local var_522_24 = (arg_519_1.time_ - var_522_22) / var_522_23
				local var_522_25 = Vector3.New(0.7, -0.72, -6.3)

				var_522_21.localPosition = Vector3.Lerp(arg_519_1.var_.moveOldPos10044ui_story, var_522_25, var_522_24)

				local var_522_26 = manager.ui.mainCamera.transform.position - var_522_21.position

				var_522_21.forward = Vector3.New(var_522_26.x, var_522_26.y, var_522_26.z)

				local var_522_27 = var_522_21.localEulerAngles

				var_522_27.z = 0
				var_522_27.x = 0
				var_522_21.localEulerAngles = var_522_27
			end

			if arg_519_1.time_ >= var_522_22 + var_522_23 and arg_519_1.time_ < var_522_22 + var_522_23 + arg_522_0 then
				var_522_21.localPosition = Vector3.New(0.7, -0.72, -6.3)

				local var_522_28 = manager.ui.mainCamera.transform.position - var_522_21.position

				var_522_21.forward = Vector3.New(var_522_28.x, var_522_28.y, var_522_28.z)

				local var_522_29 = var_522_21.localEulerAngles

				var_522_29.z = 0
				var_522_29.x = 0
				var_522_21.localEulerAngles = var_522_29
			end

			local var_522_30 = 0
			local var_522_31 = 0.575

			if var_522_30 < arg_519_1.time_ and arg_519_1.time_ <= var_522_30 + arg_522_0 then
				arg_519_1.talkMaxDuration = 0
				arg_519_1.dialogCg_.alpha = 1

				arg_519_1.dialog_:SetActive(true)
				SetActive(arg_519_1.leftNameGo_, true)

				local var_522_32 = arg_519_1:FormatText(StoryNameCfg[380].name)

				arg_519_1.leftNameTxt_.text = var_522_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_519_1.leftNameTxt_.transform)

				arg_519_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_519_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_519_1:RecordName(arg_519_1.leftNameTxt_.text)
				SetActive(arg_519_1.iconTrs_.gameObject, false)
				arg_519_1.callingController_:SetSelectedState("normal")

				local var_522_33 = arg_519_1:GetWordFromCfg(120421127)
				local var_522_34 = arg_519_1:FormatText(var_522_33.content)

				arg_519_1.text_.text = var_522_34

				LuaForUtil.ClearLinePrefixSymbol(arg_519_1.text_)

				local var_522_35 = 23
				local var_522_36 = utf8.len(var_522_34)
				local var_522_37 = var_522_35 <= 0 and var_522_31 or var_522_31 * (var_522_36 / var_522_35)

				if var_522_37 > 0 and var_522_31 < var_522_37 then
					arg_519_1.talkMaxDuration = var_522_37

					if var_522_37 + var_522_30 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_37 + var_522_30
					end
				end

				arg_519_1.text_.text = var_522_34
				arg_519_1.typewritter.percent = 0

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421127", "story_v_out_120421.awb") ~= 0 then
					local var_522_38 = manager.audio:GetVoiceLength("story_v_out_120421", "120421127", "story_v_out_120421.awb") / 1000

					if var_522_38 + var_522_30 > arg_519_1.duration_ then
						arg_519_1.duration_ = var_522_38 + var_522_30
					end

					if var_522_33.prefab_name ~= "" and arg_519_1.actors_[var_522_33.prefab_name] ~= nil then
						local var_522_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_519_1.actors_[var_522_33.prefab_name].transform, "story_v_out_120421", "120421127", "story_v_out_120421.awb")

						arg_519_1:RecordAudio("120421127", var_522_39)
						arg_519_1:RecordAudio("120421127", var_522_39)
					else
						arg_519_1:AudioAction("play", "voice", "story_v_out_120421", "120421127", "story_v_out_120421.awb")
					end

					arg_519_1:RecordHistoryTalkVoice("story_v_out_120421", "120421127", "story_v_out_120421.awb")
				end

				arg_519_1:RecordContent(arg_519_1.text_.text)
			end

			local var_522_40 = math.max(var_522_31, arg_519_1.talkMaxDuration)

			if var_522_30 <= arg_519_1.time_ and arg_519_1.time_ < var_522_30 + var_522_40 then
				arg_519_1.typewritter.percent = (arg_519_1.time_ - var_522_30) / var_522_40

				arg_519_1.typewritter:SetDirty()
			end

			if arg_519_1.time_ >= var_522_30 + var_522_40 and arg_519_1.time_ < var_522_30 + var_522_40 + arg_522_0 then
				arg_519_1.typewritter.percent = 1

				arg_519_1.typewritter:SetDirty()
				arg_519_1:ShowNextGo(true)
			end
		end
	end,
	Play120421128 = function(arg_523_0, arg_523_1)
		arg_523_1.time_ = 0
		arg_523_1.frameCnt_ = 0
		arg_523_1.state_ = "playing"
		arg_523_1.curTalkId_ = 120421128
		arg_523_1.duration_ = 5

		SetActive(arg_523_1.tipsGo_, false)

		function arg_523_1.onSingleLineFinish_()
			arg_523_1.onSingleLineUpdate_ = nil
			arg_523_1.onSingleLineFinish_ = nil
			arg_523_1.state_ = "waiting"
		end

		function arg_523_1.playNext_(arg_525_0)
			if arg_525_0 == 1 then
				arg_523_0:Play120421129(arg_523_1)
			end
		end

		function arg_523_1.onSingleLineUpdate_(arg_526_0)
			local var_526_0 = arg_523_1.actors_["10044ui_story"].transform
			local var_526_1 = 0

			if var_526_1 < arg_523_1.time_ and arg_523_1.time_ <= var_526_1 + arg_526_0 then
				arg_523_1.var_.moveOldPos10044ui_story = var_526_0.localPosition
			end

			local var_526_2 = 0.001

			if var_526_1 <= arg_523_1.time_ and arg_523_1.time_ < var_526_1 + var_526_2 then
				local var_526_3 = (arg_523_1.time_ - var_526_1) / var_526_2
				local var_526_4 = Vector3.New(0, 100, 0)

				var_526_0.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos10044ui_story, var_526_4, var_526_3)

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

			local var_526_9 = arg_523_1.actors_["1074ui_story"].transform
			local var_526_10 = 0

			if var_526_10 < arg_523_1.time_ and arg_523_1.time_ <= var_526_10 + arg_526_0 then
				arg_523_1.var_.moveOldPos1074ui_story = var_526_9.localPosition
			end

			local var_526_11 = 0.001

			if var_526_10 <= arg_523_1.time_ and arg_523_1.time_ < var_526_10 + var_526_11 then
				local var_526_12 = (arg_523_1.time_ - var_526_10) / var_526_11
				local var_526_13 = Vector3.New(0, 100, 0)

				var_526_9.localPosition = Vector3.Lerp(arg_523_1.var_.moveOldPos1074ui_story, var_526_13, var_526_12)

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
			local var_526_19 = 1.075

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

				local var_526_20 = arg_523_1:GetWordFromCfg(120421128)
				local var_526_21 = arg_523_1:FormatText(var_526_20.content)

				arg_523_1.text_.text = var_526_21

				LuaForUtil.ClearLinePrefixSymbol(arg_523_1.text_)

				local var_526_22 = 43
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
	Play120421129 = function(arg_527_0, arg_527_1)
		arg_527_1.time_ = 0
		arg_527_1.frameCnt_ = 0
		arg_527_1.state_ = "playing"
		arg_527_1.curTalkId_ = 120421129
		arg_527_1.duration_ = 5

		SetActive(arg_527_1.tipsGo_, false)

		function arg_527_1.onSingleLineFinish_()
			arg_527_1.onSingleLineUpdate_ = nil
			arg_527_1.onSingleLineFinish_ = nil
			arg_527_1.state_ = "waiting"
		end

		function arg_527_1.playNext_(arg_529_0)
			if arg_529_0 == 1 then
				arg_527_0:Play120421130(arg_527_1)
			end
		end

		function arg_527_1.onSingleLineUpdate_(arg_530_0)
			local var_530_0 = 0
			local var_530_1 = 1.1

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

				local var_530_2 = arg_527_1:GetWordFromCfg(120421129)
				local var_530_3 = arg_527_1:FormatText(var_530_2.content)

				arg_527_1.text_.text = var_530_3

				LuaForUtil.ClearLinePrefixSymbol(arg_527_1.text_)

				local var_530_4 = 44
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
	Play120421130 = function(arg_531_0, arg_531_1)
		arg_531_1.time_ = 0
		arg_531_1.frameCnt_ = 0
		arg_531_1.state_ = "playing"
		arg_531_1.curTalkId_ = 120421130
		arg_531_1.duration_ = 5

		SetActive(arg_531_1.tipsGo_, false)

		function arg_531_1.onSingleLineFinish_()
			arg_531_1.onSingleLineUpdate_ = nil
			arg_531_1.onSingleLineFinish_ = nil
			arg_531_1.state_ = "waiting"
		end

		function arg_531_1.playNext_(arg_533_0)
			if arg_533_0 == 1 then
				arg_531_0:Play120421131(arg_531_1)
			end
		end

		function arg_531_1.onSingleLineUpdate_(arg_534_0)
			local var_534_0 = 0
			local var_534_1 = 0.825

			if var_534_0 < arg_531_1.time_ and arg_531_1.time_ <= var_534_0 + arg_534_0 then
				arg_531_1.talkMaxDuration = 0
				arg_531_1.dialogCg_.alpha = 1

				arg_531_1.dialog_:SetActive(true)
				SetActive(arg_531_1.leftNameGo_, false)

				arg_531_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_531_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_531_1:RecordName(arg_531_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_531_1.iconTrs_.gameObject, false)
				arg_531_1.callingController_:SetSelectedState("normal")

				local var_534_2 = arg_531_1:GetWordFromCfg(120421130)
				local var_534_3 = arg_531_1:FormatText(var_534_2.content)

				arg_531_1.text_.text = var_534_3

				LuaForUtil.ClearLinePrefixSymbol(arg_531_1.text_)

				local var_534_4 = 33
				local var_534_5 = utf8.len(var_534_3)
				local var_534_6 = var_534_4 <= 0 and var_534_1 or var_534_1 * (var_534_5 / var_534_4)

				if var_534_6 > 0 and var_534_1 < var_534_6 then
					arg_531_1.talkMaxDuration = var_534_6

					if var_534_6 + var_534_0 > arg_531_1.duration_ then
						arg_531_1.duration_ = var_534_6 + var_534_0
					end
				end

				arg_531_1.text_.text = var_534_3
				arg_531_1.typewritter.percent = 0

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(false)
				arg_531_1:RecordContent(arg_531_1.text_.text)
			end

			local var_534_7 = math.max(var_534_1, arg_531_1.talkMaxDuration)

			if var_534_0 <= arg_531_1.time_ and arg_531_1.time_ < var_534_0 + var_534_7 then
				arg_531_1.typewritter.percent = (arg_531_1.time_ - var_534_0) / var_534_7

				arg_531_1.typewritter:SetDirty()
			end

			if arg_531_1.time_ >= var_534_0 + var_534_7 and arg_531_1.time_ < var_534_0 + var_534_7 + arg_534_0 then
				arg_531_1.typewritter.percent = 1

				arg_531_1.typewritter:SetDirty()
				arg_531_1:ShowNextGo(true)
			end
		end
	end,
	Play120421131 = function(arg_535_0, arg_535_1)
		arg_535_1.time_ = 0
		arg_535_1.frameCnt_ = 0
		arg_535_1.state_ = "playing"
		arg_535_1.curTalkId_ = 120421131
		arg_535_1.duration_ = 4.533

		local var_535_0 = {
			zh = 4.533,
			ja = 3.5
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
				arg_535_0:Play120421132(arg_535_1)
			end
		end

		function arg_535_1.onSingleLineUpdate_(arg_538_0)
			local var_538_0 = arg_535_1.actors_["10044ui_story"].transform
			local var_538_1 = 0

			if var_538_1 < arg_535_1.time_ and arg_535_1.time_ <= var_538_1 + arg_538_0 then
				arg_535_1.var_.moveOldPos10044ui_story = var_538_0.localPosition
			end

			local var_538_2 = 0.001

			if var_538_1 <= arg_535_1.time_ and arg_535_1.time_ < var_538_1 + var_538_2 then
				local var_538_3 = (arg_535_1.time_ - var_538_1) / var_538_2
				local var_538_4 = Vector3.New(-0.7, -0.72, -6.3)

				var_538_0.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos10044ui_story, var_538_4, var_538_3)

				local var_538_5 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_5.x, var_538_5.y, var_538_5.z)

				local var_538_6 = var_538_0.localEulerAngles

				var_538_6.z = 0
				var_538_6.x = 0
				var_538_0.localEulerAngles = var_538_6
			end

			if arg_535_1.time_ >= var_538_1 + var_538_2 and arg_535_1.time_ < var_538_1 + var_538_2 + arg_538_0 then
				var_538_0.localPosition = Vector3.New(-0.7, -0.72, -6.3)

				local var_538_7 = manager.ui.mainCamera.transform.position - var_538_0.position

				var_538_0.forward = Vector3.New(var_538_7.x, var_538_7.y, var_538_7.z)

				local var_538_8 = var_538_0.localEulerAngles

				var_538_8.z = 0
				var_538_8.x = 0
				var_538_0.localEulerAngles = var_538_8
			end

			local var_538_9 = 0

			if var_538_9 < arg_535_1.time_ and arg_535_1.time_ <= var_538_9 + arg_538_0 then
				arg_535_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_538_10 = 0

			if var_538_10 < arg_535_1.time_ and arg_535_1.time_ <= var_538_10 + arg_538_0 then
				arg_535_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_538_11 = arg_535_1.actors_["10044ui_story"]
			local var_538_12 = 0

			if var_538_12 < arg_535_1.time_ and arg_535_1.time_ <= var_538_12 + arg_538_0 and arg_535_1.var_.characterEffect10044ui_story == nil then
				arg_535_1.var_.characterEffect10044ui_story = var_538_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_538_13 = 0.2

			if var_538_12 <= arg_535_1.time_ and arg_535_1.time_ < var_538_12 + var_538_13 then
				local var_538_14 = (arg_535_1.time_ - var_538_12) / var_538_13

				if arg_535_1.var_.characterEffect10044ui_story then
					arg_535_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_535_1.time_ >= var_538_12 + var_538_13 and arg_535_1.time_ < var_538_12 + var_538_13 + arg_538_0 and arg_535_1.var_.characterEffect10044ui_story then
				arg_535_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_538_15 = arg_535_1.actors_["1074ui_story"].transform
			local var_538_16 = 0

			if var_538_16 < arg_535_1.time_ and arg_535_1.time_ <= var_538_16 + arg_538_0 then
				arg_535_1.var_.moveOldPos1074ui_story = var_538_15.localPosition
			end

			local var_538_17 = 0.001

			if var_538_16 <= arg_535_1.time_ and arg_535_1.time_ < var_538_16 + var_538_17 then
				local var_538_18 = (arg_535_1.time_ - var_538_16) / var_538_17
				local var_538_19 = Vector3.New(0.7, -1.055, -6.12)

				var_538_15.localPosition = Vector3.Lerp(arg_535_1.var_.moveOldPos1074ui_story, var_538_19, var_538_18)

				local var_538_20 = manager.ui.mainCamera.transform.position - var_538_15.position

				var_538_15.forward = Vector3.New(var_538_20.x, var_538_20.y, var_538_20.z)

				local var_538_21 = var_538_15.localEulerAngles

				var_538_21.z = 0
				var_538_21.x = 0
				var_538_15.localEulerAngles = var_538_21
			end

			if arg_535_1.time_ >= var_538_16 + var_538_17 and arg_535_1.time_ < var_538_16 + var_538_17 + arg_538_0 then
				var_538_15.localPosition = Vector3.New(0.7, -1.055, -6.12)

				local var_538_22 = manager.ui.mainCamera.transform.position - var_538_15.position

				var_538_15.forward = Vector3.New(var_538_22.x, var_538_22.y, var_538_22.z)

				local var_538_23 = var_538_15.localEulerAngles

				var_538_23.z = 0
				var_538_23.x = 0
				var_538_15.localEulerAngles = var_538_23
			end

			local var_538_24 = 0

			if var_538_24 < arg_535_1.time_ and arg_535_1.time_ <= var_538_24 + arg_538_0 then
				arg_535_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_538_25 = 0
			local var_538_26 = 0.525

			if var_538_25 < arg_535_1.time_ and arg_535_1.time_ <= var_538_25 + arg_538_0 then
				arg_535_1.talkMaxDuration = 0
				arg_535_1.dialogCg_.alpha = 1

				arg_535_1.dialog_:SetActive(true)
				SetActive(arg_535_1.leftNameGo_, true)

				local var_538_27 = arg_535_1:FormatText(StoryNameCfg[380].name)

				arg_535_1.leftNameTxt_.text = var_538_27

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_535_1.leftNameTxt_.transform)

				arg_535_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_535_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_535_1:RecordName(arg_535_1.leftNameTxt_.text)
				SetActive(arg_535_1.iconTrs_.gameObject, false)
				arg_535_1.callingController_:SetSelectedState("normal")

				local var_538_28 = arg_535_1:GetWordFromCfg(120421131)
				local var_538_29 = arg_535_1:FormatText(var_538_28.content)

				arg_535_1.text_.text = var_538_29

				LuaForUtil.ClearLinePrefixSymbol(arg_535_1.text_)

				local var_538_30 = 21
				local var_538_31 = utf8.len(var_538_29)
				local var_538_32 = var_538_30 <= 0 and var_538_26 or var_538_26 * (var_538_31 / var_538_30)

				if var_538_32 > 0 and var_538_26 < var_538_32 then
					arg_535_1.talkMaxDuration = var_538_32

					if var_538_32 + var_538_25 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_32 + var_538_25
					end
				end

				arg_535_1.text_.text = var_538_29
				arg_535_1.typewritter.percent = 0

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421131", "story_v_out_120421.awb") ~= 0 then
					local var_538_33 = manager.audio:GetVoiceLength("story_v_out_120421", "120421131", "story_v_out_120421.awb") / 1000

					if var_538_33 + var_538_25 > arg_535_1.duration_ then
						arg_535_1.duration_ = var_538_33 + var_538_25
					end

					if var_538_28.prefab_name ~= "" and arg_535_1.actors_[var_538_28.prefab_name] ~= nil then
						local var_538_34 = LuaForUtil.PlayVoiceWithCriLipsync(arg_535_1.actors_[var_538_28.prefab_name].transform, "story_v_out_120421", "120421131", "story_v_out_120421.awb")

						arg_535_1:RecordAudio("120421131", var_538_34)
						arg_535_1:RecordAudio("120421131", var_538_34)
					else
						arg_535_1:AudioAction("play", "voice", "story_v_out_120421", "120421131", "story_v_out_120421.awb")
					end

					arg_535_1:RecordHistoryTalkVoice("story_v_out_120421", "120421131", "story_v_out_120421.awb")
				end

				arg_535_1:RecordContent(arg_535_1.text_.text)
			end

			local var_538_35 = math.max(var_538_26, arg_535_1.talkMaxDuration)

			if var_538_25 <= arg_535_1.time_ and arg_535_1.time_ < var_538_25 + var_538_35 then
				arg_535_1.typewritter.percent = (arg_535_1.time_ - var_538_25) / var_538_35

				arg_535_1.typewritter:SetDirty()
			end

			if arg_535_1.time_ >= var_538_25 + var_538_35 and arg_535_1.time_ < var_538_25 + var_538_35 + arg_538_0 then
				arg_535_1.typewritter.percent = 1

				arg_535_1.typewritter:SetDirty()
				arg_535_1:ShowNextGo(true)
			end
		end
	end,
	Play120421132 = function(arg_539_0, arg_539_1)
		arg_539_1.time_ = 0
		arg_539_1.frameCnt_ = 0
		arg_539_1.state_ = "playing"
		arg_539_1.curTalkId_ = 120421132
		arg_539_1.duration_ = 1.999999999999

		SetActive(arg_539_1.tipsGo_, false)

		function arg_539_1.onSingleLineFinish_()
			arg_539_1.onSingleLineUpdate_ = nil
			arg_539_1.onSingleLineFinish_ = nil
			arg_539_1.state_ = "waiting"
		end

		function arg_539_1.playNext_(arg_541_0)
			if arg_541_0 == 1 then
				arg_539_0:Play120421133(arg_539_1)
			end
		end

		function arg_539_1.onSingleLineUpdate_(arg_542_0)
			local var_542_0 = arg_539_1.actors_["10044ui_story"]
			local var_542_1 = 0

			if var_542_1 < arg_539_1.time_ and arg_539_1.time_ <= var_542_1 + arg_542_0 and arg_539_1.var_.characterEffect10044ui_story == nil then
				arg_539_1.var_.characterEffect10044ui_story = var_542_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_2 = 0.2

			if var_542_1 <= arg_539_1.time_ and arg_539_1.time_ < var_542_1 + var_542_2 then
				local var_542_3 = (arg_539_1.time_ - var_542_1) / var_542_2

				if arg_539_1.var_.characterEffect10044ui_story then
					local var_542_4 = Mathf.Lerp(0, 0.5, var_542_3)

					arg_539_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_539_1.var_.characterEffect10044ui_story.fillRatio = var_542_4
				end
			end

			if arg_539_1.time_ >= var_542_1 + var_542_2 and arg_539_1.time_ < var_542_1 + var_542_2 + arg_542_0 and arg_539_1.var_.characterEffect10044ui_story then
				local var_542_5 = 0.5

				arg_539_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_539_1.var_.characterEffect10044ui_story.fillRatio = var_542_5
			end

			local var_542_6 = 0

			if var_542_6 < arg_539_1.time_ and arg_539_1.time_ <= var_542_6 + arg_542_0 then
				arg_539_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0103cva")
			end

			local var_542_7 = arg_539_1.actors_["1074ui_story"]
			local var_542_8 = 0

			if var_542_8 < arg_539_1.time_ and arg_539_1.time_ <= var_542_8 + arg_542_0 and arg_539_1.var_.characterEffect1074ui_story == nil then
				arg_539_1.var_.characterEffect1074ui_story = var_542_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_542_9 = 0.2

			if var_542_8 <= arg_539_1.time_ and arg_539_1.time_ < var_542_8 + var_542_9 then
				local var_542_10 = (arg_539_1.time_ - var_542_8) / var_542_9

				if arg_539_1.var_.characterEffect1074ui_story then
					arg_539_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_539_1.time_ >= var_542_8 + var_542_9 and arg_539_1.time_ < var_542_8 + var_542_9 + arg_542_0 and arg_539_1.var_.characterEffect1074ui_story then
				arg_539_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_542_11 = 0
			local var_542_12 = 0.125

			if var_542_11 < arg_539_1.time_ and arg_539_1.time_ <= var_542_11 + arg_542_0 then
				arg_539_1.talkMaxDuration = 0
				arg_539_1.dialogCg_.alpha = 1

				arg_539_1.dialog_:SetActive(true)
				SetActive(arg_539_1.leftNameGo_, true)

				local var_542_13 = arg_539_1:FormatText(StoryNameCfg[410].name)

				arg_539_1.leftNameTxt_.text = var_542_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_539_1.leftNameTxt_.transform)

				arg_539_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_539_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_539_1:RecordName(arg_539_1.leftNameTxt_.text)
				SetActive(arg_539_1.iconTrs_.gameObject, false)
				arg_539_1.callingController_:SetSelectedState("normal")

				local var_542_14 = arg_539_1:GetWordFromCfg(120421132)
				local var_542_15 = arg_539_1:FormatText(var_542_14.content)

				arg_539_1.text_.text = var_542_15

				LuaForUtil.ClearLinePrefixSymbol(arg_539_1.text_)

				local var_542_16 = 5
				local var_542_17 = utf8.len(var_542_15)
				local var_542_18 = var_542_16 <= 0 and var_542_12 or var_542_12 * (var_542_17 / var_542_16)

				if var_542_18 > 0 and var_542_12 < var_542_18 then
					arg_539_1.talkMaxDuration = var_542_18

					if var_542_18 + var_542_11 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_18 + var_542_11
					end
				end

				arg_539_1.text_.text = var_542_15
				arg_539_1.typewritter.percent = 0

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421132", "story_v_out_120421.awb") ~= 0 then
					local var_542_19 = manager.audio:GetVoiceLength("story_v_out_120421", "120421132", "story_v_out_120421.awb") / 1000

					if var_542_19 + var_542_11 > arg_539_1.duration_ then
						arg_539_1.duration_ = var_542_19 + var_542_11
					end

					if var_542_14.prefab_name ~= "" and arg_539_1.actors_[var_542_14.prefab_name] ~= nil then
						local var_542_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_539_1.actors_[var_542_14.prefab_name].transform, "story_v_out_120421", "120421132", "story_v_out_120421.awb")

						arg_539_1:RecordAudio("120421132", var_542_20)
						arg_539_1:RecordAudio("120421132", var_542_20)
					else
						arg_539_1:AudioAction("play", "voice", "story_v_out_120421", "120421132", "story_v_out_120421.awb")
					end

					arg_539_1:RecordHistoryTalkVoice("story_v_out_120421", "120421132", "story_v_out_120421.awb")
				end

				arg_539_1:RecordContent(arg_539_1.text_.text)
			end

			local var_542_21 = math.max(var_542_12, arg_539_1.talkMaxDuration)

			if var_542_11 <= arg_539_1.time_ and arg_539_1.time_ < var_542_11 + var_542_21 then
				arg_539_1.typewritter.percent = (arg_539_1.time_ - var_542_11) / var_542_21

				arg_539_1.typewritter:SetDirty()
			end

			if arg_539_1.time_ >= var_542_11 + var_542_21 and arg_539_1.time_ < var_542_11 + var_542_21 + arg_542_0 then
				arg_539_1.typewritter.percent = 1

				arg_539_1.typewritter:SetDirty()
				arg_539_1:ShowNextGo(true)
			end
		end
	end,
	Play120421133 = function(arg_543_0, arg_543_1)
		arg_543_1.time_ = 0
		arg_543_1.frameCnt_ = 0
		arg_543_1.state_ = "playing"
		arg_543_1.curTalkId_ = 120421133
		arg_543_1.duration_ = 7.3

		local var_543_0 = {
			zh = 3.3,
			ja = 7.3
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
				arg_543_0:Play120421134(arg_543_1)
			end
		end

		function arg_543_1.onSingleLineUpdate_(arg_546_0)
			local var_546_0 = 0

			if var_546_0 < arg_543_1.time_ and arg_543_1.time_ <= var_546_0 + arg_546_0 then
				arg_543_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_546_1 = arg_543_1.actors_["1074ui_story"]
			local var_546_2 = 0

			if var_546_2 < arg_543_1.time_ and arg_543_1.time_ <= var_546_2 + arg_546_0 and arg_543_1.var_.characterEffect1074ui_story == nil then
				arg_543_1.var_.characterEffect1074ui_story = var_546_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_546_3 = 0.2

			if var_546_2 <= arg_543_1.time_ and arg_543_1.time_ < var_546_2 + var_546_3 then
				local var_546_4 = (arg_543_1.time_ - var_546_2) / var_546_3

				if arg_543_1.var_.characterEffect1074ui_story then
					arg_543_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_543_1.time_ >= var_546_2 + var_546_3 and arg_543_1.time_ < var_546_2 + var_546_3 + arg_546_0 and arg_543_1.var_.characterEffect1074ui_story then
				arg_543_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_546_5 = 0
			local var_546_6 = 0.25

			if var_546_5 < arg_543_1.time_ and arg_543_1.time_ <= var_546_5 + arg_546_0 then
				arg_543_1.talkMaxDuration = 0
				arg_543_1.dialogCg_.alpha = 1

				arg_543_1.dialog_:SetActive(true)
				SetActive(arg_543_1.leftNameGo_, true)

				local var_546_7 = arg_543_1:FormatText(StoryNameCfg[410].name)

				arg_543_1.leftNameTxt_.text = var_546_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_543_1.leftNameTxt_.transform)

				arg_543_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_543_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_543_1:RecordName(arg_543_1.leftNameTxt_.text)
				SetActive(arg_543_1.iconTrs_.gameObject, false)
				arg_543_1.callingController_:SetSelectedState("normal")

				local var_546_8 = arg_543_1:GetWordFromCfg(120421133)
				local var_546_9 = arg_543_1:FormatText(var_546_8.content)

				arg_543_1.text_.text = var_546_9

				LuaForUtil.ClearLinePrefixSymbol(arg_543_1.text_)

				local var_546_10 = 10
				local var_546_11 = utf8.len(var_546_9)
				local var_546_12 = var_546_10 <= 0 and var_546_6 or var_546_6 * (var_546_11 / var_546_10)

				if var_546_12 > 0 and var_546_6 < var_546_12 then
					arg_543_1.talkMaxDuration = var_546_12

					if var_546_12 + var_546_5 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_12 + var_546_5
					end
				end

				arg_543_1.text_.text = var_546_9
				arg_543_1.typewritter.percent = 0

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421133", "story_v_out_120421.awb") ~= 0 then
					local var_546_13 = manager.audio:GetVoiceLength("story_v_out_120421", "120421133", "story_v_out_120421.awb") / 1000

					if var_546_13 + var_546_5 > arg_543_1.duration_ then
						arg_543_1.duration_ = var_546_13 + var_546_5
					end

					if var_546_8.prefab_name ~= "" and arg_543_1.actors_[var_546_8.prefab_name] ~= nil then
						local var_546_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_543_1.actors_[var_546_8.prefab_name].transform, "story_v_out_120421", "120421133", "story_v_out_120421.awb")

						arg_543_1:RecordAudio("120421133", var_546_14)
						arg_543_1:RecordAudio("120421133", var_546_14)
					else
						arg_543_1:AudioAction("play", "voice", "story_v_out_120421", "120421133", "story_v_out_120421.awb")
					end

					arg_543_1:RecordHistoryTalkVoice("story_v_out_120421", "120421133", "story_v_out_120421.awb")
				end

				arg_543_1:RecordContent(arg_543_1.text_.text)
			end

			local var_546_15 = math.max(var_546_6, arg_543_1.talkMaxDuration)

			if var_546_5 <= arg_543_1.time_ and arg_543_1.time_ < var_546_5 + var_546_15 then
				arg_543_1.typewritter.percent = (arg_543_1.time_ - var_546_5) / var_546_15

				arg_543_1.typewritter:SetDirty()
			end

			if arg_543_1.time_ >= var_546_5 + var_546_15 and arg_543_1.time_ < var_546_5 + var_546_15 + arg_546_0 then
				arg_543_1.typewritter.percent = 1

				arg_543_1.typewritter:SetDirty()
				arg_543_1:ShowNextGo(true)
			end
		end
	end,
	Play120421134 = function(arg_547_0, arg_547_1)
		arg_547_1.time_ = 0
		arg_547_1.frameCnt_ = 0
		arg_547_1.state_ = "playing"
		arg_547_1.curTalkId_ = 120421134
		arg_547_1.duration_ = 5.3

		local var_547_0 = {
			zh = 4.066,
			ja = 5.3
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
				arg_547_0:Play120421135(arg_547_1)
			end
		end

		function arg_547_1.onSingleLineUpdate_(arg_550_0)
			local var_550_0 = arg_547_1.actors_["1074ui_story"]
			local var_550_1 = 0

			if var_550_1 < arg_547_1.time_ and arg_547_1.time_ <= var_550_1 + arg_550_0 and arg_547_1.var_.characterEffect1074ui_story == nil then
				arg_547_1.var_.characterEffect1074ui_story = var_550_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_2 = 0.2

			if var_550_1 <= arg_547_1.time_ and arg_547_1.time_ < var_550_1 + var_550_2 then
				local var_550_3 = (arg_547_1.time_ - var_550_1) / var_550_2

				if arg_547_1.var_.characterEffect1074ui_story then
					local var_550_4 = Mathf.Lerp(0, 0.5, var_550_3)

					arg_547_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_547_1.var_.characterEffect1074ui_story.fillRatio = var_550_4
				end
			end

			if arg_547_1.time_ >= var_550_1 + var_550_2 and arg_547_1.time_ < var_550_1 + var_550_2 + arg_550_0 and arg_547_1.var_.characterEffect1074ui_story then
				local var_550_5 = 0.5

				arg_547_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_547_1.var_.characterEffect1074ui_story.fillRatio = var_550_5
			end

			local var_550_6 = arg_547_1.actors_["10044ui_story"]
			local var_550_7 = 0

			if var_550_7 < arg_547_1.time_ and arg_547_1.time_ <= var_550_7 + arg_550_0 and arg_547_1.var_.characterEffect10044ui_story == nil then
				arg_547_1.var_.characterEffect10044ui_story = var_550_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_550_8 = 0.2

			if var_550_7 <= arg_547_1.time_ and arg_547_1.time_ < var_550_7 + var_550_8 then
				local var_550_9 = (arg_547_1.time_ - var_550_7) / var_550_8

				if arg_547_1.var_.characterEffect10044ui_story then
					arg_547_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_547_1.time_ >= var_550_7 + var_550_8 and arg_547_1.time_ < var_550_7 + var_550_8 + arg_550_0 and arg_547_1.var_.characterEffect10044ui_story then
				arg_547_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_550_10 = 0
			local var_550_11 = 0.4

			if var_550_10 < arg_547_1.time_ and arg_547_1.time_ <= var_550_10 + arg_550_0 then
				arg_547_1.talkMaxDuration = 0
				arg_547_1.dialogCg_.alpha = 1

				arg_547_1.dialog_:SetActive(true)
				SetActive(arg_547_1.leftNameGo_, true)

				local var_550_12 = arg_547_1:FormatText(StoryNameCfg[380].name)

				arg_547_1.leftNameTxt_.text = var_550_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_547_1.leftNameTxt_.transform)

				arg_547_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_547_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_547_1:RecordName(arg_547_1.leftNameTxt_.text)
				SetActive(arg_547_1.iconTrs_.gameObject, false)
				arg_547_1.callingController_:SetSelectedState("normal")

				local var_550_13 = arg_547_1:GetWordFromCfg(120421134)
				local var_550_14 = arg_547_1:FormatText(var_550_13.content)

				arg_547_1.text_.text = var_550_14

				LuaForUtil.ClearLinePrefixSymbol(arg_547_1.text_)

				local var_550_15 = 16
				local var_550_16 = utf8.len(var_550_14)
				local var_550_17 = var_550_15 <= 0 and var_550_11 or var_550_11 * (var_550_16 / var_550_15)

				if var_550_17 > 0 and var_550_11 < var_550_17 then
					arg_547_1.talkMaxDuration = var_550_17

					if var_550_17 + var_550_10 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_17 + var_550_10
					end
				end

				arg_547_1.text_.text = var_550_14
				arg_547_1.typewritter.percent = 0

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421134", "story_v_out_120421.awb") ~= 0 then
					local var_550_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421134", "story_v_out_120421.awb") / 1000

					if var_550_18 + var_550_10 > arg_547_1.duration_ then
						arg_547_1.duration_ = var_550_18 + var_550_10
					end

					if var_550_13.prefab_name ~= "" and arg_547_1.actors_[var_550_13.prefab_name] ~= nil then
						local var_550_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_547_1.actors_[var_550_13.prefab_name].transform, "story_v_out_120421", "120421134", "story_v_out_120421.awb")

						arg_547_1:RecordAudio("120421134", var_550_19)
						arg_547_1:RecordAudio("120421134", var_550_19)
					else
						arg_547_1:AudioAction("play", "voice", "story_v_out_120421", "120421134", "story_v_out_120421.awb")
					end

					arg_547_1:RecordHistoryTalkVoice("story_v_out_120421", "120421134", "story_v_out_120421.awb")
				end

				arg_547_1:RecordContent(arg_547_1.text_.text)
			end

			local var_550_20 = math.max(var_550_11, arg_547_1.talkMaxDuration)

			if var_550_10 <= arg_547_1.time_ and arg_547_1.time_ < var_550_10 + var_550_20 then
				arg_547_1.typewritter.percent = (arg_547_1.time_ - var_550_10) / var_550_20

				arg_547_1.typewritter:SetDirty()
			end

			if arg_547_1.time_ >= var_550_10 + var_550_20 and arg_547_1.time_ < var_550_10 + var_550_20 + arg_550_0 then
				arg_547_1.typewritter.percent = 1

				arg_547_1.typewritter:SetDirty()
				arg_547_1:ShowNextGo(true)
			end
		end
	end,
	Play120421135 = function(arg_551_0, arg_551_1)
		arg_551_1.time_ = 0
		arg_551_1.frameCnt_ = 0
		arg_551_1.state_ = "playing"
		arg_551_1.curTalkId_ = 120421135
		arg_551_1.duration_ = 5

		SetActive(arg_551_1.tipsGo_, false)

		function arg_551_1.onSingleLineFinish_()
			arg_551_1.onSingleLineUpdate_ = nil
			arg_551_1.onSingleLineFinish_ = nil
			arg_551_1.state_ = "waiting"
		end

		function arg_551_1.playNext_(arg_553_0)
			if arg_553_0 == 1 then
				arg_551_0:Play120421136(arg_551_1)
			end
		end

		function arg_551_1.onSingleLineUpdate_(arg_554_0)
			local var_554_0 = arg_551_1.actors_["10044ui_story"].transform
			local var_554_1 = 0

			if var_554_1 < arg_551_1.time_ and arg_551_1.time_ <= var_554_1 + arg_554_0 then
				arg_551_1.var_.moveOldPos10044ui_story = var_554_0.localPosition
			end

			local var_554_2 = 0.001

			if var_554_1 <= arg_551_1.time_ and arg_551_1.time_ < var_554_1 + var_554_2 then
				local var_554_3 = (arg_551_1.time_ - var_554_1) / var_554_2
				local var_554_4 = Vector3.New(0, 100, 0)

				var_554_0.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos10044ui_story, var_554_4, var_554_3)

				local var_554_5 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_5.x, var_554_5.y, var_554_5.z)

				local var_554_6 = var_554_0.localEulerAngles

				var_554_6.z = 0
				var_554_6.x = 0
				var_554_0.localEulerAngles = var_554_6
			end

			if arg_551_1.time_ >= var_554_1 + var_554_2 and arg_551_1.time_ < var_554_1 + var_554_2 + arg_554_0 then
				var_554_0.localPosition = Vector3.New(0, 100, 0)

				local var_554_7 = manager.ui.mainCamera.transform.position - var_554_0.position

				var_554_0.forward = Vector3.New(var_554_7.x, var_554_7.y, var_554_7.z)

				local var_554_8 = var_554_0.localEulerAngles

				var_554_8.z = 0
				var_554_8.x = 0
				var_554_0.localEulerAngles = var_554_8
			end

			local var_554_9 = arg_551_1.actors_["1074ui_story"].transform
			local var_554_10 = 0

			if var_554_10 < arg_551_1.time_ and arg_551_1.time_ <= var_554_10 + arg_554_0 then
				arg_551_1.var_.moveOldPos1074ui_story = var_554_9.localPosition
			end

			local var_554_11 = 0.001

			if var_554_10 <= arg_551_1.time_ and arg_551_1.time_ < var_554_10 + var_554_11 then
				local var_554_12 = (arg_551_1.time_ - var_554_10) / var_554_11
				local var_554_13 = Vector3.New(0, 100, 0)

				var_554_9.localPosition = Vector3.Lerp(arg_551_1.var_.moveOldPos1074ui_story, var_554_13, var_554_12)

				local var_554_14 = manager.ui.mainCamera.transform.position - var_554_9.position

				var_554_9.forward = Vector3.New(var_554_14.x, var_554_14.y, var_554_14.z)

				local var_554_15 = var_554_9.localEulerAngles

				var_554_15.z = 0
				var_554_15.x = 0
				var_554_9.localEulerAngles = var_554_15
			end

			if arg_551_1.time_ >= var_554_10 + var_554_11 and arg_551_1.time_ < var_554_10 + var_554_11 + arg_554_0 then
				var_554_9.localPosition = Vector3.New(0, 100, 0)

				local var_554_16 = manager.ui.mainCamera.transform.position - var_554_9.position

				var_554_9.forward = Vector3.New(var_554_16.x, var_554_16.y, var_554_16.z)

				local var_554_17 = var_554_9.localEulerAngles

				var_554_17.z = 0
				var_554_17.x = 0
				var_554_9.localEulerAngles = var_554_17
			end

			local var_554_18 = 0
			local var_554_19 = 0.9

			if var_554_18 < arg_551_1.time_ and arg_551_1.time_ <= var_554_18 + arg_554_0 then
				arg_551_1.talkMaxDuration = 0
				arg_551_1.dialogCg_.alpha = 1

				arg_551_1.dialog_:SetActive(true)
				SetActive(arg_551_1.leftNameGo_, false)

				arg_551_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_551_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_551_1:RecordName(arg_551_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_551_1.iconTrs_.gameObject, false)
				arg_551_1.callingController_:SetSelectedState("normal")

				local var_554_20 = arg_551_1:GetWordFromCfg(120421135)
				local var_554_21 = arg_551_1:FormatText(var_554_20.content)

				arg_551_1.text_.text = var_554_21

				LuaForUtil.ClearLinePrefixSymbol(arg_551_1.text_)

				local var_554_22 = 36
				local var_554_23 = utf8.len(var_554_21)
				local var_554_24 = var_554_22 <= 0 and var_554_19 or var_554_19 * (var_554_23 / var_554_22)

				if var_554_24 > 0 and var_554_19 < var_554_24 then
					arg_551_1.talkMaxDuration = var_554_24

					if var_554_24 + var_554_18 > arg_551_1.duration_ then
						arg_551_1.duration_ = var_554_24 + var_554_18
					end
				end

				arg_551_1.text_.text = var_554_21
				arg_551_1.typewritter.percent = 0

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(false)
				arg_551_1:RecordContent(arg_551_1.text_.text)
			end

			local var_554_25 = math.max(var_554_19, arg_551_1.talkMaxDuration)

			if var_554_18 <= arg_551_1.time_ and arg_551_1.time_ < var_554_18 + var_554_25 then
				arg_551_1.typewritter.percent = (arg_551_1.time_ - var_554_18) / var_554_25

				arg_551_1.typewritter:SetDirty()
			end

			if arg_551_1.time_ >= var_554_18 + var_554_25 and arg_551_1.time_ < var_554_18 + var_554_25 + arg_554_0 then
				arg_551_1.typewritter.percent = 1

				arg_551_1.typewritter:SetDirty()
				arg_551_1:ShowNextGo(true)
			end
		end
	end,
	Play120421136 = function(arg_555_0, arg_555_1)
		arg_555_1.time_ = 0
		arg_555_1.frameCnt_ = 0
		arg_555_1.state_ = "playing"
		arg_555_1.curTalkId_ = 120421136
		arg_555_1.duration_ = 12.1

		local var_555_0 = {
			zh = 7.9,
			ja = 12.1
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
				arg_555_0:Play120421137(arg_555_1)
			end
		end

		function arg_555_1.onSingleLineUpdate_(arg_558_0)
			local var_558_0 = arg_555_1.actors_["1074ui_story"].transform
			local var_558_1 = 0

			if var_558_1 < arg_555_1.time_ and arg_555_1.time_ <= var_558_1 + arg_558_0 then
				arg_555_1.var_.moveOldPos1074ui_story = var_558_0.localPosition
			end

			local var_558_2 = 0.001

			if var_558_1 <= arg_555_1.time_ and arg_555_1.time_ < var_558_1 + var_558_2 then
				local var_558_3 = (arg_555_1.time_ - var_558_1) / var_558_2
				local var_558_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_558_0.localPosition = Vector3.Lerp(arg_555_1.var_.moveOldPos1074ui_story, var_558_4, var_558_3)

				local var_558_5 = manager.ui.mainCamera.transform.position - var_558_0.position

				var_558_0.forward = Vector3.New(var_558_5.x, var_558_5.y, var_558_5.z)

				local var_558_6 = var_558_0.localEulerAngles

				var_558_6.z = 0
				var_558_6.x = 0
				var_558_0.localEulerAngles = var_558_6
			end

			if arg_555_1.time_ >= var_558_1 + var_558_2 and arg_555_1.time_ < var_558_1 + var_558_2 + arg_558_0 then
				var_558_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_558_7 = manager.ui.mainCamera.transform.position - var_558_0.position

				var_558_0.forward = Vector3.New(var_558_7.x, var_558_7.y, var_558_7.z)

				local var_558_8 = var_558_0.localEulerAngles

				var_558_8.z = 0
				var_558_8.x = 0
				var_558_0.localEulerAngles = var_558_8
			end

			local var_558_9 = 0

			if var_558_9 < arg_555_1.time_ and arg_555_1.time_ <= var_558_9 + arg_558_0 then
				arg_555_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_558_10 = arg_555_1.actors_["1074ui_story"]
			local var_558_11 = 0

			if var_558_11 < arg_555_1.time_ and arg_555_1.time_ <= var_558_11 + arg_558_0 and arg_555_1.var_.characterEffect1074ui_story == nil then
				arg_555_1.var_.characterEffect1074ui_story = var_558_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_558_12 = 0.2

			if var_558_11 <= arg_555_1.time_ and arg_555_1.time_ < var_558_11 + var_558_12 then
				local var_558_13 = (arg_555_1.time_ - var_558_11) / var_558_12

				if arg_555_1.var_.characterEffect1074ui_story then
					arg_555_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_555_1.time_ >= var_558_11 + var_558_12 and arg_555_1.time_ < var_558_11 + var_558_12 + arg_558_0 and arg_555_1.var_.characterEffect1074ui_story then
				arg_555_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_558_14 = 0
			local var_558_15 = 0.825

			if var_558_14 < arg_555_1.time_ and arg_555_1.time_ <= var_558_14 + arg_558_0 then
				arg_555_1.talkMaxDuration = 0
				arg_555_1.dialogCg_.alpha = 1

				arg_555_1.dialog_:SetActive(true)
				SetActive(arg_555_1.leftNameGo_, true)

				local var_558_16 = arg_555_1:FormatText(StoryNameCfg[410].name)

				arg_555_1.leftNameTxt_.text = var_558_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_555_1.leftNameTxt_.transform)

				arg_555_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_555_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_555_1:RecordName(arg_555_1.leftNameTxt_.text)
				SetActive(arg_555_1.iconTrs_.gameObject, false)
				arg_555_1.callingController_:SetSelectedState("normal")

				local var_558_17 = arg_555_1:GetWordFromCfg(120421136)
				local var_558_18 = arg_555_1:FormatText(var_558_17.content)

				arg_555_1.text_.text = var_558_18

				LuaForUtil.ClearLinePrefixSymbol(arg_555_1.text_)

				local var_558_19 = 33
				local var_558_20 = utf8.len(var_558_18)
				local var_558_21 = var_558_19 <= 0 and var_558_15 or var_558_15 * (var_558_20 / var_558_19)

				if var_558_21 > 0 and var_558_15 < var_558_21 then
					arg_555_1.talkMaxDuration = var_558_21

					if var_558_21 + var_558_14 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_21 + var_558_14
					end
				end

				arg_555_1.text_.text = var_558_18
				arg_555_1.typewritter.percent = 0

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421136", "story_v_out_120421.awb") ~= 0 then
					local var_558_22 = manager.audio:GetVoiceLength("story_v_out_120421", "120421136", "story_v_out_120421.awb") / 1000

					if var_558_22 + var_558_14 > arg_555_1.duration_ then
						arg_555_1.duration_ = var_558_22 + var_558_14
					end

					if var_558_17.prefab_name ~= "" and arg_555_1.actors_[var_558_17.prefab_name] ~= nil then
						local var_558_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_555_1.actors_[var_558_17.prefab_name].transform, "story_v_out_120421", "120421136", "story_v_out_120421.awb")

						arg_555_1:RecordAudio("120421136", var_558_23)
						arg_555_1:RecordAudio("120421136", var_558_23)
					else
						arg_555_1:AudioAction("play", "voice", "story_v_out_120421", "120421136", "story_v_out_120421.awb")
					end

					arg_555_1:RecordHistoryTalkVoice("story_v_out_120421", "120421136", "story_v_out_120421.awb")
				end

				arg_555_1:RecordContent(arg_555_1.text_.text)
			end

			local var_558_24 = math.max(var_558_15, arg_555_1.talkMaxDuration)

			if var_558_14 <= arg_555_1.time_ and arg_555_1.time_ < var_558_14 + var_558_24 then
				arg_555_1.typewritter.percent = (arg_555_1.time_ - var_558_14) / var_558_24

				arg_555_1.typewritter:SetDirty()
			end

			if arg_555_1.time_ >= var_558_14 + var_558_24 and arg_555_1.time_ < var_558_14 + var_558_24 + arg_558_0 then
				arg_555_1.typewritter.percent = 1

				arg_555_1.typewritter:SetDirty()
				arg_555_1:ShowNextGo(true)
			end
		end
	end,
	Play120421137 = function(arg_559_0, arg_559_1)
		arg_559_1.time_ = 0
		arg_559_1.frameCnt_ = 0
		arg_559_1.state_ = "playing"
		arg_559_1.curTalkId_ = 120421137
		arg_559_1.duration_ = 2.3

		local var_559_0 = {
			zh = 2.166,
			ja = 2.3
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
				arg_559_0:Play120421138(arg_559_1)
			end
		end

		function arg_559_1.onSingleLineUpdate_(arg_562_0)
			local var_562_0 = arg_559_1.actors_["1084ui_story"]
			local var_562_1 = 0

			if var_562_1 < arg_559_1.time_ and arg_559_1.time_ <= var_562_1 + arg_562_0 and arg_559_1.var_.characterEffect1084ui_story == nil then
				arg_559_1.var_.characterEffect1084ui_story = var_562_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_2 = 0.2

			if var_562_1 <= arg_559_1.time_ and arg_559_1.time_ < var_562_1 + var_562_2 then
				local var_562_3 = (arg_559_1.time_ - var_562_1) / var_562_2

				if arg_559_1.var_.characterEffect1084ui_story then
					arg_559_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_559_1.time_ >= var_562_1 + var_562_2 and arg_559_1.time_ < var_562_1 + var_562_2 + arg_562_0 and arg_559_1.var_.characterEffect1084ui_story then
				arg_559_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_562_4 = arg_559_1.actors_["1084ui_story"].transform
			local var_562_5 = 0

			if var_562_5 < arg_559_1.time_ and arg_559_1.time_ <= var_562_5 + arg_562_0 then
				arg_559_1.var_.moveOldPos1084ui_story = var_562_4.localPosition
			end

			local var_562_6 = 0.001

			if var_562_5 <= arg_559_1.time_ and arg_559_1.time_ < var_562_5 + var_562_6 then
				local var_562_7 = (arg_559_1.time_ - var_562_5) / var_562_6
				local var_562_8 = Vector3.New(0.7, -0.97, -6)

				var_562_4.localPosition = Vector3.Lerp(arg_559_1.var_.moveOldPos1084ui_story, var_562_8, var_562_7)

				local var_562_9 = manager.ui.mainCamera.transform.position - var_562_4.position

				var_562_4.forward = Vector3.New(var_562_9.x, var_562_9.y, var_562_9.z)

				local var_562_10 = var_562_4.localEulerAngles

				var_562_10.z = 0
				var_562_10.x = 0
				var_562_4.localEulerAngles = var_562_10
			end

			if arg_559_1.time_ >= var_562_5 + var_562_6 and arg_559_1.time_ < var_562_5 + var_562_6 + arg_562_0 then
				var_562_4.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_562_11 = manager.ui.mainCamera.transform.position - var_562_4.position

				var_562_4.forward = Vector3.New(var_562_11.x, var_562_11.y, var_562_11.z)

				local var_562_12 = var_562_4.localEulerAngles

				var_562_12.z = 0
				var_562_12.x = 0
				var_562_4.localEulerAngles = var_562_12
			end

			local var_562_13 = 0

			if var_562_13 < arg_559_1.time_ and arg_559_1.time_ <= var_562_13 + arg_562_0 then
				arg_559_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_562_14 = 0

			if var_562_14 < arg_559_1.time_ and arg_559_1.time_ <= var_562_14 + arg_562_0 then
				arg_559_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_562_15 = arg_559_1.actors_["1074ui_story"]
			local var_562_16 = 0

			if var_562_16 < arg_559_1.time_ and arg_559_1.time_ <= var_562_16 + arg_562_0 and arg_559_1.var_.characterEffect1074ui_story == nil then
				arg_559_1.var_.characterEffect1074ui_story = var_562_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_562_17 = 0.2

			if var_562_16 <= arg_559_1.time_ and arg_559_1.time_ < var_562_16 + var_562_17 then
				local var_562_18 = (arg_559_1.time_ - var_562_16) / var_562_17

				if arg_559_1.var_.characterEffect1074ui_story then
					local var_562_19 = Mathf.Lerp(0, 0.5, var_562_18)

					arg_559_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_559_1.var_.characterEffect1074ui_story.fillRatio = var_562_19
				end
			end

			if arg_559_1.time_ >= var_562_16 + var_562_17 and arg_559_1.time_ < var_562_16 + var_562_17 + arg_562_0 and arg_559_1.var_.characterEffect1074ui_story then
				local var_562_20 = 0.5

				arg_559_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_559_1.var_.characterEffect1074ui_story.fillRatio = var_562_20
			end

			local var_562_21 = 0
			local var_562_22 = 0.2

			if var_562_21 < arg_559_1.time_ and arg_559_1.time_ <= var_562_21 + arg_562_0 then
				arg_559_1.talkMaxDuration = 0
				arg_559_1.dialogCg_.alpha = 1

				arg_559_1.dialog_:SetActive(true)
				SetActive(arg_559_1.leftNameGo_, true)

				local var_562_23 = arg_559_1:FormatText(StoryNameCfg[6].name)

				arg_559_1.leftNameTxt_.text = var_562_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_559_1.leftNameTxt_.transform)

				arg_559_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_559_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_559_1:RecordName(arg_559_1.leftNameTxt_.text)
				SetActive(arg_559_1.iconTrs_.gameObject, false)
				arg_559_1.callingController_:SetSelectedState("normal")

				local var_562_24 = arg_559_1:GetWordFromCfg(120421137)
				local var_562_25 = arg_559_1:FormatText(var_562_24.content)

				arg_559_1.text_.text = var_562_25

				LuaForUtil.ClearLinePrefixSymbol(arg_559_1.text_)

				local var_562_26 = 8
				local var_562_27 = utf8.len(var_562_25)
				local var_562_28 = var_562_26 <= 0 and var_562_22 or var_562_22 * (var_562_27 / var_562_26)

				if var_562_28 > 0 and var_562_22 < var_562_28 then
					arg_559_1.talkMaxDuration = var_562_28

					if var_562_28 + var_562_21 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_28 + var_562_21
					end
				end

				arg_559_1.text_.text = var_562_25
				arg_559_1.typewritter.percent = 0

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421137", "story_v_out_120421.awb") ~= 0 then
					local var_562_29 = manager.audio:GetVoiceLength("story_v_out_120421", "120421137", "story_v_out_120421.awb") / 1000

					if var_562_29 + var_562_21 > arg_559_1.duration_ then
						arg_559_1.duration_ = var_562_29 + var_562_21
					end

					if var_562_24.prefab_name ~= "" and arg_559_1.actors_[var_562_24.prefab_name] ~= nil then
						local var_562_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_559_1.actors_[var_562_24.prefab_name].transform, "story_v_out_120421", "120421137", "story_v_out_120421.awb")

						arg_559_1:RecordAudio("120421137", var_562_30)
						arg_559_1:RecordAudio("120421137", var_562_30)
					else
						arg_559_1:AudioAction("play", "voice", "story_v_out_120421", "120421137", "story_v_out_120421.awb")
					end

					arg_559_1:RecordHistoryTalkVoice("story_v_out_120421", "120421137", "story_v_out_120421.awb")
				end

				arg_559_1:RecordContent(arg_559_1.text_.text)
			end

			local var_562_31 = math.max(var_562_22, arg_559_1.talkMaxDuration)

			if var_562_21 <= arg_559_1.time_ and arg_559_1.time_ < var_562_21 + var_562_31 then
				arg_559_1.typewritter.percent = (arg_559_1.time_ - var_562_21) / var_562_31

				arg_559_1.typewritter:SetDirty()
			end

			if arg_559_1.time_ >= var_562_21 + var_562_31 and arg_559_1.time_ < var_562_21 + var_562_31 + arg_562_0 then
				arg_559_1.typewritter.percent = 1

				arg_559_1.typewritter:SetDirty()
				arg_559_1:ShowNextGo(true)
			end
		end
	end,
	Play120421138 = function(arg_563_0, arg_563_1)
		arg_563_1.time_ = 0
		arg_563_1.frameCnt_ = 0
		arg_563_1.state_ = "playing"
		arg_563_1.curTalkId_ = 120421138
		arg_563_1.duration_ = 7.266

		local var_563_0 = {
			zh = 7.266,
			ja = 6.733
		}
		local var_563_1 = manager.audio:GetLocalizationFlag()

		if var_563_0[var_563_1] ~= nil then
			arg_563_1.duration_ = var_563_0[var_563_1]
		end

		SetActive(arg_563_1.tipsGo_, false)

		function arg_563_1.onSingleLineFinish_()
			arg_563_1.onSingleLineUpdate_ = nil
			arg_563_1.onSingleLineFinish_ = nil
			arg_563_1.state_ = "waiting"
		end

		function arg_563_1.playNext_(arg_565_0)
			if arg_565_0 == 1 then
				arg_563_0:Play120421139(arg_563_1)
			end
		end

		function arg_563_1.onSingleLineUpdate_(arg_566_0)
			local var_566_0 = arg_563_1.actors_["1084ui_story"]
			local var_566_1 = 0

			if var_566_1 < arg_563_1.time_ and arg_563_1.time_ <= var_566_1 + arg_566_0 and arg_563_1.var_.characterEffect1084ui_story == nil then
				arg_563_1.var_.characterEffect1084ui_story = var_566_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_2 = 0.2

			if var_566_1 <= arg_563_1.time_ and arg_563_1.time_ < var_566_1 + var_566_2 then
				local var_566_3 = (arg_563_1.time_ - var_566_1) / var_566_2

				if arg_563_1.var_.characterEffect1084ui_story then
					local var_566_4 = Mathf.Lerp(0, 0.5, var_566_3)

					arg_563_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_563_1.var_.characterEffect1084ui_story.fillRatio = var_566_4
				end
			end

			if arg_563_1.time_ >= var_566_1 + var_566_2 and arg_563_1.time_ < var_566_1 + var_566_2 + arg_566_0 and arg_563_1.var_.characterEffect1084ui_story then
				local var_566_5 = 0.5

				arg_563_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_563_1.var_.characterEffect1084ui_story.fillRatio = var_566_5
			end

			local var_566_6 = arg_563_1.actors_["1074ui_story"]
			local var_566_7 = 0

			if var_566_7 < arg_563_1.time_ and arg_563_1.time_ <= var_566_7 + arg_566_0 and arg_563_1.var_.characterEffect1074ui_story == nil then
				arg_563_1.var_.characterEffect1074ui_story = var_566_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_566_8 = 0.2

			if var_566_7 <= arg_563_1.time_ and arg_563_1.time_ < var_566_7 + var_566_8 then
				local var_566_9 = (arg_563_1.time_ - var_566_7) / var_566_8

				if arg_563_1.var_.characterEffect1074ui_story then
					arg_563_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_563_1.time_ >= var_566_7 + var_566_8 and arg_563_1.time_ < var_566_7 + var_566_8 + arg_566_0 and arg_563_1.var_.characterEffect1074ui_story then
				arg_563_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_566_10 = 0
			local var_566_11 = 0.925

			if var_566_10 < arg_563_1.time_ and arg_563_1.time_ <= var_566_10 + arg_566_0 then
				arg_563_1.talkMaxDuration = 0
				arg_563_1.dialogCg_.alpha = 1

				arg_563_1.dialog_:SetActive(true)
				SetActive(arg_563_1.leftNameGo_, true)

				local var_566_12 = arg_563_1:FormatText(StoryNameCfg[410].name)

				arg_563_1.leftNameTxt_.text = var_566_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_563_1.leftNameTxt_.transform)

				arg_563_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_563_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_563_1:RecordName(arg_563_1.leftNameTxt_.text)
				SetActive(arg_563_1.iconTrs_.gameObject, false)
				arg_563_1.callingController_:SetSelectedState("normal")

				local var_566_13 = arg_563_1:GetWordFromCfg(120421138)
				local var_566_14 = arg_563_1:FormatText(var_566_13.content)

				arg_563_1.text_.text = var_566_14

				LuaForUtil.ClearLinePrefixSymbol(arg_563_1.text_)

				local var_566_15 = 37
				local var_566_16 = utf8.len(var_566_14)
				local var_566_17 = var_566_15 <= 0 and var_566_11 or var_566_11 * (var_566_16 / var_566_15)

				if var_566_17 > 0 and var_566_11 < var_566_17 then
					arg_563_1.talkMaxDuration = var_566_17

					if var_566_17 + var_566_10 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_17 + var_566_10
					end
				end

				arg_563_1.text_.text = var_566_14
				arg_563_1.typewritter.percent = 0

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421138", "story_v_out_120421.awb") ~= 0 then
					local var_566_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421138", "story_v_out_120421.awb") / 1000

					if var_566_18 + var_566_10 > arg_563_1.duration_ then
						arg_563_1.duration_ = var_566_18 + var_566_10
					end

					if var_566_13.prefab_name ~= "" and arg_563_1.actors_[var_566_13.prefab_name] ~= nil then
						local var_566_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_563_1.actors_[var_566_13.prefab_name].transform, "story_v_out_120421", "120421138", "story_v_out_120421.awb")

						arg_563_1:RecordAudio("120421138", var_566_19)
						arg_563_1:RecordAudio("120421138", var_566_19)
					else
						arg_563_1:AudioAction("play", "voice", "story_v_out_120421", "120421138", "story_v_out_120421.awb")
					end

					arg_563_1:RecordHistoryTalkVoice("story_v_out_120421", "120421138", "story_v_out_120421.awb")
				end

				arg_563_1:RecordContent(arg_563_1.text_.text)
			end

			local var_566_20 = math.max(var_566_11, arg_563_1.talkMaxDuration)

			if var_566_10 <= arg_563_1.time_ and arg_563_1.time_ < var_566_10 + var_566_20 then
				arg_563_1.typewritter.percent = (arg_563_1.time_ - var_566_10) / var_566_20

				arg_563_1.typewritter:SetDirty()
			end

			if arg_563_1.time_ >= var_566_10 + var_566_20 and arg_563_1.time_ < var_566_10 + var_566_20 + arg_566_0 then
				arg_563_1.typewritter.percent = 1

				arg_563_1.typewritter:SetDirty()
				arg_563_1:ShowNextGo(true)
			end
		end
	end,
	Play120421139 = function(arg_567_0, arg_567_1)
		arg_567_1.time_ = 0
		arg_567_1.frameCnt_ = 0
		arg_567_1.state_ = "playing"
		arg_567_1.curTalkId_ = 120421139
		arg_567_1.duration_ = 9.3

		local var_567_0 = {
			zh = 3.5,
			ja = 9.3
		}
		local var_567_1 = manager.audio:GetLocalizationFlag()

		if var_567_0[var_567_1] ~= nil then
			arg_567_1.duration_ = var_567_0[var_567_1]
		end

		SetActive(arg_567_1.tipsGo_, false)

		function arg_567_1.onSingleLineFinish_()
			arg_567_1.onSingleLineUpdate_ = nil
			arg_567_1.onSingleLineFinish_ = nil
			arg_567_1.state_ = "waiting"
		end

		function arg_567_1.playNext_(arg_569_0)
			if arg_569_0 == 1 then
				arg_567_0:Play120421140(arg_567_1)
			end
		end

		function arg_567_1.onSingleLineUpdate_(arg_570_0)
			local var_570_0 = 0
			local var_570_1 = 0.35

			if var_570_0 < arg_567_1.time_ and arg_567_1.time_ <= var_570_0 + arg_570_0 then
				arg_567_1.talkMaxDuration = 0
				arg_567_1.dialogCg_.alpha = 1

				arg_567_1.dialog_:SetActive(true)
				SetActive(arg_567_1.leftNameGo_, true)

				local var_570_2 = arg_567_1:FormatText(StoryNameCfg[410].name)

				arg_567_1.leftNameTxt_.text = var_570_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_567_1.leftNameTxt_.transform)

				arg_567_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_567_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_567_1:RecordName(arg_567_1.leftNameTxt_.text)
				SetActive(arg_567_1.iconTrs_.gameObject, false)
				arg_567_1.callingController_:SetSelectedState("normal")

				local var_570_3 = arg_567_1:GetWordFromCfg(120421139)
				local var_570_4 = arg_567_1:FormatText(var_570_3.content)

				arg_567_1.text_.text = var_570_4

				LuaForUtil.ClearLinePrefixSymbol(arg_567_1.text_)

				local var_570_5 = 14
				local var_570_6 = utf8.len(var_570_4)
				local var_570_7 = var_570_5 <= 0 and var_570_1 or var_570_1 * (var_570_6 / var_570_5)

				if var_570_7 > 0 and var_570_1 < var_570_7 then
					arg_567_1.talkMaxDuration = var_570_7

					if var_570_7 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_7 + var_570_0
					end
				end

				arg_567_1.text_.text = var_570_4
				arg_567_1.typewritter.percent = 0

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421139", "story_v_out_120421.awb") ~= 0 then
					local var_570_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421139", "story_v_out_120421.awb") / 1000

					if var_570_8 + var_570_0 > arg_567_1.duration_ then
						arg_567_1.duration_ = var_570_8 + var_570_0
					end

					if var_570_3.prefab_name ~= "" and arg_567_1.actors_[var_570_3.prefab_name] ~= nil then
						local var_570_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_567_1.actors_[var_570_3.prefab_name].transform, "story_v_out_120421", "120421139", "story_v_out_120421.awb")

						arg_567_1:RecordAudio("120421139", var_570_9)
						arg_567_1:RecordAudio("120421139", var_570_9)
					else
						arg_567_1:AudioAction("play", "voice", "story_v_out_120421", "120421139", "story_v_out_120421.awb")
					end

					arg_567_1:RecordHistoryTalkVoice("story_v_out_120421", "120421139", "story_v_out_120421.awb")
				end

				arg_567_1:RecordContent(arg_567_1.text_.text)
			end

			local var_570_10 = math.max(var_570_1, arg_567_1.talkMaxDuration)

			if var_570_0 <= arg_567_1.time_ and arg_567_1.time_ < var_570_0 + var_570_10 then
				arg_567_1.typewritter.percent = (arg_567_1.time_ - var_570_0) / var_570_10

				arg_567_1.typewritter:SetDirty()
			end

			if arg_567_1.time_ >= var_570_0 + var_570_10 and arg_567_1.time_ < var_570_0 + var_570_10 + arg_570_0 then
				arg_567_1.typewritter.percent = 1

				arg_567_1.typewritter:SetDirty()
				arg_567_1:ShowNextGo(true)
			end
		end
	end,
	Play120421140 = function(arg_571_0, arg_571_1)
		arg_571_1.time_ = 0
		arg_571_1.frameCnt_ = 0
		arg_571_1.state_ = "playing"
		arg_571_1.curTalkId_ = 120421140
		arg_571_1.duration_ = 5

		SetActive(arg_571_1.tipsGo_, false)

		function arg_571_1.onSingleLineFinish_()
			arg_571_1.onSingleLineUpdate_ = nil
			arg_571_1.onSingleLineFinish_ = nil
			arg_571_1.state_ = "waiting"
		end

		function arg_571_1.playNext_(arg_573_0)
			if arg_573_0 == 1 then
				arg_571_0:Play120421141(arg_571_1)
			end
		end

		function arg_571_1.onSingleLineUpdate_(arg_574_0)
			local var_574_0 = arg_571_1.actors_["1084ui_story"].transform
			local var_574_1 = 0

			if var_574_1 < arg_571_1.time_ and arg_571_1.time_ <= var_574_1 + arg_574_0 then
				arg_571_1.var_.moveOldPos1084ui_story = var_574_0.localPosition
			end

			local var_574_2 = 0.001

			if var_574_1 <= arg_571_1.time_ and arg_571_1.time_ < var_574_1 + var_574_2 then
				local var_574_3 = (arg_571_1.time_ - var_574_1) / var_574_2
				local var_574_4 = Vector3.New(0, 100, 0)

				var_574_0.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1084ui_story, var_574_4, var_574_3)

				local var_574_5 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_5.x, var_574_5.y, var_574_5.z)

				local var_574_6 = var_574_0.localEulerAngles

				var_574_6.z = 0
				var_574_6.x = 0
				var_574_0.localEulerAngles = var_574_6
			end

			if arg_571_1.time_ >= var_574_1 + var_574_2 and arg_571_1.time_ < var_574_1 + var_574_2 + arg_574_0 then
				var_574_0.localPosition = Vector3.New(0, 100, 0)

				local var_574_7 = manager.ui.mainCamera.transform.position - var_574_0.position

				var_574_0.forward = Vector3.New(var_574_7.x, var_574_7.y, var_574_7.z)

				local var_574_8 = var_574_0.localEulerAngles

				var_574_8.z = 0
				var_574_8.x = 0
				var_574_0.localEulerAngles = var_574_8
			end

			local var_574_9 = arg_571_1.actors_["1074ui_story"].transform
			local var_574_10 = 0

			if var_574_10 < arg_571_1.time_ and arg_571_1.time_ <= var_574_10 + arg_574_0 then
				arg_571_1.var_.moveOldPos1074ui_story = var_574_9.localPosition
			end

			local var_574_11 = 0.001

			if var_574_10 <= arg_571_1.time_ and arg_571_1.time_ < var_574_10 + var_574_11 then
				local var_574_12 = (arg_571_1.time_ - var_574_10) / var_574_11
				local var_574_13 = Vector3.New(0, 100, 0)

				var_574_9.localPosition = Vector3.Lerp(arg_571_1.var_.moveOldPos1074ui_story, var_574_13, var_574_12)

				local var_574_14 = manager.ui.mainCamera.transform.position - var_574_9.position

				var_574_9.forward = Vector3.New(var_574_14.x, var_574_14.y, var_574_14.z)

				local var_574_15 = var_574_9.localEulerAngles

				var_574_15.z = 0
				var_574_15.x = 0
				var_574_9.localEulerAngles = var_574_15
			end

			if arg_571_1.time_ >= var_574_10 + var_574_11 and arg_571_1.time_ < var_574_10 + var_574_11 + arg_574_0 then
				var_574_9.localPosition = Vector3.New(0, 100, 0)

				local var_574_16 = manager.ui.mainCamera.transform.position - var_574_9.position

				var_574_9.forward = Vector3.New(var_574_16.x, var_574_16.y, var_574_16.z)

				local var_574_17 = var_574_9.localEulerAngles

				var_574_17.z = 0
				var_574_17.x = 0
				var_574_9.localEulerAngles = var_574_17
			end

			local var_574_18 = 0
			local var_574_19 = 0.975

			if var_574_18 < arg_571_1.time_ and arg_571_1.time_ <= var_574_18 + arg_574_0 then
				arg_571_1.talkMaxDuration = 0
				arg_571_1.dialogCg_.alpha = 1

				arg_571_1.dialog_:SetActive(true)
				SetActive(arg_571_1.leftNameGo_, false)

				arg_571_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_571_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_571_1:RecordName(arg_571_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_571_1.iconTrs_.gameObject, false)
				arg_571_1.callingController_:SetSelectedState("normal")

				local var_574_20 = arg_571_1:GetWordFromCfg(120421140)
				local var_574_21 = arg_571_1:FormatText(var_574_20.content)

				arg_571_1.text_.text = var_574_21

				LuaForUtil.ClearLinePrefixSymbol(arg_571_1.text_)

				local var_574_22 = 39
				local var_574_23 = utf8.len(var_574_21)
				local var_574_24 = var_574_22 <= 0 and var_574_19 or var_574_19 * (var_574_23 / var_574_22)

				if var_574_24 > 0 and var_574_19 < var_574_24 then
					arg_571_1.talkMaxDuration = var_574_24

					if var_574_24 + var_574_18 > arg_571_1.duration_ then
						arg_571_1.duration_ = var_574_24 + var_574_18
					end
				end

				arg_571_1.text_.text = var_574_21
				arg_571_1.typewritter.percent = 0

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(false)
				arg_571_1:RecordContent(arg_571_1.text_.text)
			end

			local var_574_25 = math.max(var_574_19, arg_571_1.talkMaxDuration)

			if var_574_18 <= arg_571_1.time_ and arg_571_1.time_ < var_574_18 + var_574_25 then
				arg_571_1.typewritter.percent = (arg_571_1.time_ - var_574_18) / var_574_25

				arg_571_1.typewritter:SetDirty()
			end

			if arg_571_1.time_ >= var_574_18 + var_574_25 and arg_571_1.time_ < var_574_18 + var_574_25 + arg_574_0 then
				arg_571_1.typewritter.percent = 1

				arg_571_1.typewritter:SetDirty()
				arg_571_1:ShowNextGo(true)
			end
		end
	end,
	Play120421141 = function(arg_575_0, arg_575_1)
		arg_575_1.time_ = 0
		arg_575_1.frameCnt_ = 0
		arg_575_1.state_ = "playing"
		arg_575_1.curTalkId_ = 120421141
		arg_575_1.duration_ = 9.666

		local var_575_0 = {
			zh = 6.066,
			ja = 9.666
		}
		local var_575_1 = manager.audio:GetLocalizationFlag()

		if var_575_0[var_575_1] ~= nil then
			arg_575_1.duration_ = var_575_0[var_575_1]
		end

		SetActive(arg_575_1.tipsGo_, false)

		function arg_575_1.onSingleLineFinish_()
			arg_575_1.onSingleLineUpdate_ = nil
			arg_575_1.onSingleLineFinish_ = nil
			arg_575_1.state_ = "waiting"
		end

		function arg_575_1.playNext_(arg_577_0)
			if arg_577_0 == 1 then
				arg_575_0:Play120421142(arg_575_1)
			end
		end

		function arg_575_1.onSingleLineUpdate_(arg_578_0)
			local var_578_0 = arg_575_1.actors_["1084ui_story"].transform
			local var_578_1 = 0

			if var_578_1 < arg_575_1.time_ and arg_575_1.time_ <= var_578_1 + arg_578_0 then
				arg_575_1.var_.moveOldPos1084ui_story = var_578_0.localPosition
			end

			local var_578_2 = 0.001

			if var_578_1 <= arg_575_1.time_ and arg_575_1.time_ < var_578_1 + var_578_2 then
				local var_578_3 = (arg_575_1.time_ - var_578_1) / var_578_2
				local var_578_4 = Vector3.New(-0.7, -0.97, -6)

				var_578_0.localPosition = Vector3.Lerp(arg_575_1.var_.moveOldPos1084ui_story, var_578_4, var_578_3)

				local var_578_5 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_5.x, var_578_5.y, var_578_5.z)

				local var_578_6 = var_578_0.localEulerAngles

				var_578_6.z = 0
				var_578_6.x = 0
				var_578_0.localEulerAngles = var_578_6
			end

			if arg_575_1.time_ >= var_578_1 + var_578_2 and arg_575_1.time_ < var_578_1 + var_578_2 + arg_578_0 then
				var_578_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_578_7 = manager.ui.mainCamera.transform.position - var_578_0.position

				var_578_0.forward = Vector3.New(var_578_7.x, var_578_7.y, var_578_7.z)

				local var_578_8 = var_578_0.localEulerAngles

				var_578_8.z = 0
				var_578_8.x = 0
				var_578_0.localEulerAngles = var_578_8
			end

			local var_578_9 = 0

			if var_578_9 < arg_575_1.time_ and arg_575_1.time_ <= var_578_9 + arg_578_0 then
				arg_575_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_578_10 = 0

			if var_578_10 < arg_575_1.time_ and arg_575_1.time_ <= var_578_10 + arg_578_0 then
				arg_575_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_578_11 = arg_575_1.actors_["1084ui_story"]
			local var_578_12 = 0

			if var_578_12 < arg_575_1.time_ and arg_575_1.time_ <= var_578_12 + arg_578_0 and arg_575_1.var_.characterEffect1084ui_story == nil then
				arg_575_1.var_.characterEffect1084ui_story = var_578_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_578_13 = 0.2

			if var_578_12 <= arg_575_1.time_ and arg_575_1.time_ < var_578_12 + var_578_13 then
				local var_578_14 = (arg_575_1.time_ - var_578_12) / var_578_13

				if arg_575_1.var_.characterEffect1084ui_story then
					arg_575_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_575_1.time_ >= var_578_12 + var_578_13 and arg_575_1.time_ < var_578_12 + var_578_13 + arg_578_0 and arg_575_1.var_.characterEffect1084ui_story then
				arg_575_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_578_15 = 0
			local var_578_16 = 0.525

			if var_578_15 < arg_575_1.time_ and arg_575_1.time_ <= var_578_15 + arg_578_0 then
				arg_575_1.talkMaxDuration = 0
				arg_575_1.dialogCg_.alpha = 1

				arg_575_1.dialog_:SetActive(true)
				SetActive(arg_575_1.leftNameGo_, true)

				local var_578_17 = arg_575_1:FormatText(StoryNameCfg[6].name)

				arg_575_1.leftNameTxt_.text = var_578_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_575_1.leftNameTxt_.transform)

				arg_575_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_575_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_575_1:RecordName(arg_575_1.leftNameTxt_.text)
				SetActive(arg_575_1.iconTrs_.gameObject, false)
				arg_575_1.callingController_:SetSelectedState("normal")

				local var_578_18 = arg_575_1:GetWordFromCfg(120421141)
				local var_578_19 = arg_575_1:FormatText(var_578_18.content)

				arg_575_1.text_.text = var_578_19

				LuaForUtil.ClearLinePrefixSymbol(arg_575_1.text_)

				local var_578_20 = 21
				local var_578_21 = utf8.len(var_578_19)
				local var_578_22 = var_578_20 <= 0 and var_578_16 or var_578_16 * (var_578_21 / var_578_20)

				if var_578_22 > 0 and var_578_16 < var_578_22 then
					arg_575_1.talkMaxDuration = var_578_22

					if var_578_22 + var_578_15 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_22 + var_578_15
					end
				end

				arg_575_1.text_.text = var_578_19
				arg_575_1.typewritter.percent = 0

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421141", "story_v_out_120421.awb") ~= 0 then
					local var_578_23 = manager.audio:GetVoiceLength("story_v_out_120421", "120421141", "story_v_out_120421.awb") / 1000

					if var_578_23 + var_578_15 > arg_575_1.duration_ then
						arg_575_1.duration_ = var_578_23 + var_578_15
					end

					if var_578_18.prefab_name ~= "" and arg_575_1.actors_[var_578_18.prefab_name] ~= nil then
						local var_578_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_575_1.actors_[var_578_18.prefab_name].transform, "story_v_out_120421", "120421141", "story_v_out_120421.awb")

						arg_575_1:RecordAudio("120421141", var_578_24)
						arg_575_1:RecordAudio("120421141", var_578_24)
					else
						arg_575_1:AudioAction("play", "voice", "story_v_out_120421", "120421141", "story_v_out_120421.awb")
					end

					arg_575_1:RecordHistoryTalkVoice("story_v_out_120421", "120421141", "story_v_out_120421.awb")
				end

				arg_575_1:RecordContent(arg_575_1.text_.text)
			end

			local var_578_25 = math.max(var_578_16, arg_575_1.talkMaxDuration)

			if var_578_15 <= arg_575_1.time_ and arg_575_1.time_ < var_578_15 + var_578_25 then
				arg_575_1.typewritter.percent = (arg_575_1.time_ - var_578_15) / var_578_25

				arg_575_1.typewritter:SetDirty()
			end

			if arg_575_1.time_ >= var_578_15 + var_578_25 and arg_575_1.time_ < var_578_15 + var_578_25 + arg_578_0 then
				arg_575_1.typewritter.percent = 1

				arg_575_1.typewritter:SetDirty()
				arg_575_1:ShowNextGo(true)
			end
		end
	end,
	Play120421142 = function(arg_579_0, arg_579_1)
		arg_579_1.time_ = 0
		arg_579_1.frameCnt_ = 0
		arg_579_1.state_ = "playing"
		arg_579_1.curTalkId_ = 120421142
		arg_579_1.duration_ = 7.333

		local var_579_0 = {
			zh = 3.233,
			ja = 7.333
		}
		local var_579_1 = manager.audio:GetLocalizationFlag()

		if var_579_0[var_579_1] ~= nil then
			arg_579_1.duration_ = var_579_0[var_579_1]
		end

		SetActive(arg_579_1.tipsGo_, false)

		function arg_579_1.onSingleLineFinish_()
			arg_579_1.onSingleLineUpdate_ = nil
			arg_579_1.onSingleLineFinish_ = nil
			arg_579_1.state_ = "waiting"
		end

		function arg_579_1.playNext_(arg_581_0)
			if arg_581_0 == 1 then
				arg_579_0:Play120421143(arg_579_1)
			end
		end

		function arg_579_1.onSingleLineUpdate_(arg_582_0)
			local var_582_0 = 0

			if var_582_0 < arg_579_1.time_ and arg_579_1.time_ <= var_582_0 + arg_582_0 then
				arg_579_1:PlayTimeline("1075ui_story", "StoryTimeline/CharAction/story1075/story1075action/1075action1_1")
			end

			local var_582_1 = arg_579_1.actors_["1075ui_story"]
			local var_582_2 = 0

			if var_582_2 < arg_579_1.time_ and arg_579_1.time_ <= var_582_2 + arg_582_0 and arg_579_1.var_.characterEffect1075ui_story == nil then
				arg_579_1.var_.characterEffect1075ui_story = var_582_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_3 = 0.2

			if var_582_2 <= arg_579_1.time_ and arg_579_1.time_ < var_582_2 + var_582_3 then
				local var_582_4 = (arg_579_1.time_ - var_582_2) / var_582_3

				if arg_579_1.var_.characterEffect1075ui_story then
					arg_579_1.var_.characterEffect1075ui_story.fillFlat = false
				end
			end

			if arg_579_1.time_ >= var_582_2 + var_582_3 and arg_579_1.time_ < var_582_2 + var_582_3 + arg_582_0 and arg_579_1.var_.characterEffect1075ui_story then
				arg_579_1.var_.characterEffect1075ui_story.fillFlat = false
			end

			local var_582_5 = arg_579_1.actors_["1075ui_story"].transform
			local var_582_6 = 0

			if var_582_6 < arg_579_1.time_ and arg_579_1.time_ <= var_582_6 + arg_582_0 then
				arg_579_1.var_.moveOldPos1075ui_story = var_582_5.localPosition
			end

			local var_582_7 = 0.001

			if var_582_6 <= arg_579_1.time_ and arg_579_1.time_ < var_582_6 + var_582_7 then
				local var_582_8 = (arg_579_1.time_ - var_582_6) / var_582_7
				local var_582_9 = Vector3.New(0.7, -1.055, -6.16)

				var_582_5.localPosition = Vector3.Lerp(arg_579_1.var_.moveOldPos1075ui_story, var_582_9, var_582_8)

				local var_582_10 = manager.ui.mainCamera.transform.position - var_582_5.position

				var_582_5.forward = Vector3.New(var_582_10.x, var_582_10.y, var_582_10.z)

				local var_582_11 = var_582_5.localEulerAngles

				var_582_11.z = 0
				var_582_11.x = 0
				var_582_5.localEulerAngles = var_582_11
			end

			if arg_579_1.time_ >= var_582_6 + var_582_7 and arg_579_1.time_ < var_582_6 + var_582_7 + arg_582_0 then
				var_582_5.localPosition = Vector3.New(0.7, -1.055, -6.16)

				local var_582_12 = manager.ui.mainCamera.transform.position - var_582_5.position

				var_582_5.forward = Vector3.New(var_582_12.x, var_582_12.y, var_582_12.z)

				local var_582_13 = var_582_5.localEulerAngles

				var_582_13.z = 0
				var_582_13.x = 0
				var_582_5.localEulerAngles = var_582_13
			end

			local var_582_14 = arg_579_1.actors_["1084ui_story"]
			local var_582_15 = 0

			if var_582_15 < arg_579_1.time_ and arg_579_1.time_ <= var_582_15 + arg_582_0 and arg_579_1.var_.characterEffect1084ui_story == nil then
				arg_579_1.var_.characterEffect1084ui_story = var_582_14:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_582_16 = 0.2

			if var_582_15 <= arg_579_1.time_ and arg_579_1.time_ < var_582_15 + var_582_16 then
				local var_582_17 = (arg_579_1.time_ - var_582_15) / var_582_16

				if arg_579_1.var_.characterEffect1084ui_story then
					local var_582_18 = Mathf.Lerp(0, 0.5, var_582_17)

					arg_579_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_579_1.var_.characterEffect1084ui_story.fillRatio = var_582_18
				end
			end

			if arg_579_1.time_ >= var_582_15 + var_582_16 and arg_579_1.time_ < var_582_15 + var_582_16 + arg_582_0 and arg_579_1.var_.characterEffect1084ui_story then
				local var_582_19 = 0.5

				arg_579_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_579_1.var_.characterEffect1084ui_story.fillRatio = var_582_19
			end

			local var_582_20 = 0
			local var_582_21 = 0.275

			if var_582_20 < arg_579_1.time_ and arg_579_1.time_ <= var_582_20 + arg_582_0 then
				arg_579_1.talkMaxDuration = 0
				arg_579_1.dialogCg_.alpha = 1

				arg_579_1.dialog_:SetActive(true)
				SetActive(arg_579_1.leftNameGo_, true)

				local var_582_22 = arg_579_1:FormatText(StoryNameCfg[381].name)

				arg_579_1.leftNameTxt_.text = var_582_22

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_579_1.leftNameTxt_.transform)

				arg_579_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_579_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_579_1:RecordName(arg_579_1.leftNameTxt_.text)
				SetActive(arg_579_1.iconTrs_.gameObject, false)
				arg_579_1.callingController_:SetSelectedState("normal")

				local var_582_23 = arg_579_1:GetWordFromCfg(120421142)
				local var_582_24 = arg_579_1:FormatText(var_582_23.content)

				arg_579_1.text_.text = var_582_24

				LuaForUtil.ClearLinePrefixSymbol(arg_579_1.text_)

				local var_582_25 = 11
				local var_582_26 = utf8.len(var_582_24)
				local var_582_27 = var_582_25 <= 0 and var_582_21 or var_582_21 * (var_582_26 / var_582_25)

				if var_582_27 > 0 and var_582_21 < var_582_27 then
					arg_579_1.talkMaxDuration = var_582_27

					if var_582_27 + var_582_20 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_27 + var_582_20
					end
				end

				arg_579_1.text_.text = var_582_24
				arg_579_1.typewritter.percent = 0

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421142", "story_v_out_120421.awb") ~= 0 then
					local var_582_28 = manager.audio:GetVoiceLength("story_v_out_120421", "120421142", "story_v_out_120421.awb") / 1000

					if var_582_28 + var_582_20 > arg_579_1.duration_ then
						arg_579_1.duration_ = var_582_28 + var_582_20
					end

					if var_582_23.prefab_name ~= "" and arg_579_1.actors_[var_582_23.prefab_name] ~= nil then
						local var_582_29 = LuaForUtil.PlayVoiceWithCriLipsync(arg_579_1.actors_[var_582_23.prefab_name].transform, "story_v_out_120421", "120421142", "story_v_out_120421.awb")

						arg_579_1:RecordAudio("120421142", var_582_29)
						arg_579_1:RecordAudio("120421142", var_582_29)
					else
						arg_579_1:AudioAction("play", "voice", "story_v_out_120421", "120421142", "story_v_out_120421.awb")
					end

					arg_579_1:RecordHistoryTalkVoice("story_v_out_120421", "120421142", "story_v_out_120421.awb")
				end

				arg_579_1:RecordContent(arg_579_1.text_.text)
			end

			local var_582_30 = math.max(var_582_21, arg_579_1.talkMaxDuration)

			if var_582_20 <= arg_579_1.time_ and arg_579_1.time_ < var_582_20 + var_582_30 then
				arg_579_1.typewritter.percent = (arg_579_1.time_ - var_582_20) / var_582_30

				arg_579_1.typewritter:SetDirty()
			end

			if arg_579_1.time_ >= var_582_20 + var_582_30 and arg_579_1.time_ < var_582_20 + var_582_30 + arg_582_0 then
				arg_579_1.typewritter.percent = 1

				arg_579_1.typewritter:SetDirty()
				arg_579_1:ShowNextGo(true)
			end
		end
	end,
	Play120421143 = function(arg_583_0, arg_583_1)
		arg_583_1.time_ = 0
		arg_583_1.frameCnt_ = 0
		arg_583_1.state_ = "playing"
		arg_583_1.curTalkId_ = 120421143
		arg_583_1.duration_ = 11.766

		local var_583_0 = {
			zh = 8.9,
			ja = 11.766
		}
		local var_583_1 = manager.audio:GetLocalizationFlag()

		if var_583_0[var_583_1] ~= nil then
			arg_583_1.duration_ = var_583_0[var_583_1]
		end

		SetActive(arg_583_1.tipsGo_, false)

		function arg_583_1.onSingleLineFinish_()
			arg_583_1.onSingleLineUpdate_ = nil
			arg_583_1.onSingleLineFinish_ = nil
			arg_583_1.state_ = "waiting"
		end

		function arg_583_1.playNext_(arg_585_0)
			if arg_585_0 == 1 then
				arg_583_0:Play120421144(arg_583_1)
			end
		end

		function arg_583_1.onSingleLineUpdate_(arg_586_0)
			local var_586_0 = arg_583_1.actors_["1084ui_story"].transform
			local var_586_1 = 0

			if var_586_1 < arg_583_1.time_ and arg_583_1.time_ <= var_586_1 + arg_586_0 then
				arg_583_1.var_.moveOldPos1084ui_story = var_586_0.localPosition
			end

			local var_586_2 = 0.001

			if var_586_1 <= arg_583_1.time_ and arg_583_1.time_ < var_586_1 + var_586_2 then
				local var_586_3 = (arg_583_1.time_ - var_586_1) / var_586_2
				local var_586_4 = Vector3.New(0, 100, 0)

				var_586_0.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1084ui_story, var_586_4, var_586_3)

				local var_586_5 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_5.x, var_586_5.y, var_586_5.z)

				local var_586_6 = var_586_0.localEulerAngles

				var_586_6.z = 0
				var_586_6.x = 0
				var_586_0.localEulerAngles = var_586_6
			end

			if arg_583_1.time_ >= var_586_1 + var_586_2 and arg_583_1.time_ < var_586_1 + var_586_2 + arg_586_0 then
				var_586_0.localPosition = Vector3.New(0, 100, 0)

				local var_586_7 = manager.ui.mainCamera.transform.position - var_586_0.position

				var_586_0.forward = Vector3.New(var_586_7.x, var_586_7.y, var_586_7.z)

				local var_586_8 = var_586_0.localEulerAngles

				var_586_8.z = 0
				var_586_8.x = 0
				var_586_0.localEulerAngles = var_586_8
			end

			local var_586_9 = arg_583_1.actors_["1075ui_story"].transform
			local var_586_10 = 0

			if var_586_10 < arg_583_1.time_ and arg_583_1.time_ <= var_586_10 + arg_586_0 then
				arg_583_1.var_.moveOldPos1075ui_story = var_586_9.localPosition
			end

			local var_586_11 = 0.001

			if var_586_10 <= arg_583_1.time_ and arg_583_1.time_ < var_586_10 + var_586_11 then
				local var_586_12 = (arg_583_1.time_ - var_586_10) / var_586_11
				local var_586_13 = Vector3.New(0, 100, 0)

				var_586_9.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos1075ui_story, var_586_13, var_586_12)

				local var_586_14 = manager.ui.mainCamera.transform.position - var_586_9.position

				var_586_9.forward = Vector3.New(var_586_14.x, var_586_14.y, var_586_14.z)

				local var_586_15 = var_586_9.localEulerAngles

				var_586_15.z = 0
				var_586_15.x = 0
				var_586_9.localEulerAngles = var_586_15
			end

			if arg_583_1.time_ >= var_586_10 + var_586_11 and arg_583_1.time_ < var_586_10 + var_586_11 + arg_586_0 then
				var_586_9.localPosition = Vector3.New(0, 100, 0)

				local var_586_16 = manager.ui.mainCamera.transform.position - var_586_9.position

				var_586_9.forward = Vector3.New(var_586_16.x, var_586_16.y, var_586_16.z)

				local var_586_17 = var_586_9.localEulerAngles

				var_586_17.z = 0
				var_586_17.x = 0
				var_586_9.localEulerAngles = var_586_17
			end

			local var_586_18 = arg_583_1.actors_["10044ui_story"].transform
			local var_586_19 = 0

			if var_586_19 < arg_583_1.time_ and arg_583_1.time_ <= var_586_19 + arg_586_0 then
				arg_583_1.var_.moveOldPos10044ui_story = var_586_18.localPosition
			end

			local var_586_20 = 0.001

			if var_586_19 <= arg_583_1.time_ and arg_583_1.time_ < var_586_19 + var_586_20 then
				local var_586_21 = (arg_583_1.time_ - var_586_19) / var_586_20
				local var_586_22 = Vector3.New(0, -0.72, -6.3)

				var_586_18.localPosition = Vector3.Lerp(arg_583_1.var_.moveOldPos10044ui_story, var_586_22, var_586_21)

				local var_586_23 = manager.ui.mainCamera.transform.position - var_586_18.position

				var_586_18.forward = Vector3.New(var_586_23.x, var_586_23.y, var_586_23.z)

				local var_586_24 = var_586_18.localEulerAngles

				var_586_24.z = 0
				var_586_24.x = 0
				var_586_18.localEulerAngles = var_586_24
			end

			if arg_583_1.time_ >= var_586_19 + var_586_20 and arg_583_1.time_ < var_586_19 + var_586_20 + arg_586_0 then
				var_586_18.localPosition = Vector3.New(0, -0.72, -6.3)

				local var_586_25 = manager.ui.mainCamera.transform.position - var_586_18.position

				var_586_18.forward = Vector3.New(var_586_25.x, var_586_25.y, var_586_25.z)

				local var_586_26 = var_586_18.localEulerAngles

				var_586_26.z = 0
				var_586_26.x = 0
				var_586_18.localEulerAngles = var_586_26
			end

			local var_586_27 = 0

			if var_586_27 < arg_583_1.time_ and arg_583_1.time_ <= var_586_27 + arg_586_0 then
				arg_583_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_1")
			end

			local var_586_28 = 0

			if var_586_28 < arg_583_1.time_ and arg_583_1.time_ <= var_586_28 + arg_586_0 then
				arg_583_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2103cva")
			end

			local var_586_29 = arg_583_1.actors_["10044ui_story"]
			local var_586_30 = 0

			if var_586_30 < arg_583_1.time_ and arg_583_1.time_ <= var_586_30 + arg_586_0 and arg_583_1.var_.characterEffect10044ui_story == nil then
				arg_583_1.var_.characterEffect10044ui_story = var_586_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_586_31 = 0.2

			if var_586_30 <= arg_583_1.time_ and arg_583_1.time_ < var_586_30 + var_586_31 then
				local var_586_32 = (arg_583_1.time_ - var_586_30) / var_586_31

				if arg_583_1.var_.characterEffect10044ui_story then
					arg_583_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_583_1.time_ >= var_586_30 + var_586_31 and arg_583_1.time_ < var_586_30 + var_586_31 + arg_586_0 and arg_583_1.var_.characterEffect10044ui_story then
				arg_583_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_586_33 = 0
			local var_586_34 = 0.85

			if var_586_33 < arg_583_1.time_ and arg_583_1.time_ <= var_586_33 + arg_586_0 then
				arg_583_1.talkMaxDuration = 0
				arg_583_1.dialogCg_.alpha = 1

				arg_583_1.dialog_:SetActive(true)
				SetActive(arg_583_1.leftNameGo_, true)

				local var_586_35 = arg_583_1:FormatText(StoryNameCfg[380].name)

				arg_583_1.leftNameTxt_.text = var_586_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_583_1.leftNameTxt_.transform)

				arg_583_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_583_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_583_1:RecordName(arg_583_1.leftNameTxt_.text)
				SetActive(arg_583_1.iconTrs_.gameObject, false)
				arg_583_1.callingController_:SetSelectedState("normal")

				local var_586_36 = arg_583_1:GetWordFromCfg(120421143)
				local var_586_37 = arg_583_1:FormatText(var_586_36.content)

				arg_583_1.text_.text = var_586_37

				LuaForUtil.ClearLinePrefixSymbol(arg_583_1.text_)

				local var_586_38 = 34
				local var_586_39 = utf8.len(var_586_37)
				local var_586_40 = var_586_38 <= 0 and var_586_34 or var_586_34 * (var_586_39 / var_586_38)

				if var_586_40 > 0 and var_586_34 < var_586_40 then
					arg_583_1.talkMaxDuration = var_586_40

					if var_586_40 + var_586_33 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_40 + var_586_33
					end
				end

				arg_583_1.text_.text = var_586_37
				arg_583_1.typewritter.percent = 0

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421143", "story_v_out_120421.awb") ~= 0 then
					local var_586_41 = manager.audio:GetVoiceLength("story_v_out_120421", "120421143", "story_v_out_120421.awb") / 1000

					if var_586_41 + var_586_33 > arg_583_1.duration_ then
						arg_583_1.duration_ = var_586_41 + var_586_33
					end

					if var_586_36.prefab_name ~= "" and arg_583_1.actors_[var_586_36.prefab_name] ~= nil then
						local var_586_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_583_1.actors_[var_586_36.prefab_name].transform, "story_v_out_120421", "120421143", "story_v_out_120421.awb")

						arg_583_1:RecordAudio("120421143", var_586_42)
						arg_583_1:RecordAudio("120421143", var_586_42)
					else
						arg_583_1:AudioAction("play", "voice", "story_v_out_120421", "120421143", "story_v_out_120421.awb")
					end

					arg_583_1:RecordHistoryTalkVoice("story_v_out_120421", "120421143", "story_v_out_120421.awb")
				end

				arg_583_1:RecordContent(arg_583_1.text_.text)
			end

			local var_586_43 = math.max(var_586_34, arg_583_1.talkMaxDuration)

			if var_586_33 <= arg_583_1.time_ and arg_583_1.time_ < var_586_33 + var_586_43 then
				arg_583_1.typewritter.percent = (arg_583_1.time_ - var_586_33) / var_586_43

				arg_583_1.typewritter:SetDirty()
			end

			if arg_583_1.time_ >= var_586_33 + var_586_43 and arg_583_1.time_ < var_586_33 + var_586_43 + arg_586_0 then
				arg_583_1.typewritter.percent = 1

				arg_583_1.typewritter:SetDirty()
				arg_583_1:ShowNextGo(true)
			end
		end
	end,
	Play120421144 = function(arg_587_0, arg_587_1)
		arg_587_1.time_ = 0
		arg_587_1.frameCnt_ = 0
		arg_587_1.state_ = "playing"
		arg_587_1.curTalkId_ = 120421144
		arg_587_1.duration_ = 15.4

		local var_587_0 = {
			zh = 15.4,
			ja = 13.366
		}
		local var_587_1 = manager.audio:GetLocalizationFlag()

		if var_587_0[var_587_1] ~= nil then
			arg_587_1.duration_ = var_587_0[var_587_1]
		end

		SetActive(arg_587_1.tipsGo_, false)

		function arg_587_1.onSingleLineFinish_()
			arg_587_1.onSingleLineUpdate_ = nil
			arg_587_1.onSingleLineFinish_ = nil
			arg_587_1.state_ = "waiting"
		end

		function arg_587_1.playNext_(arg_589_0)
			if arg_589_0 == 1 then
				arg_587_0:Play120421145(arg_587_1)
			end
		end

		function arg_587_1.onSingleLineUpdate_(arg_590_0)
			local var_590_0 = 0
			local var_590_1 = 1.475

			if var_590_0 < arg_587_1.time_ and arg_587_1.time_ <= var_590_0 + arg_590_0 then
				arg_587_1.talkMaxDuration = 0
				arg_587_1.dialogCg_.alpha = 1

				arg_587_1.dialog_:SetActive(true)
				SetActive(arg_587_1.leftNameGo_, true)

				local var_590_2 = arg_587_1:FormatText(StoryNameCfg[380].name)

				arg_587_1.leftNameTxt_.text = var_590_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_587_1.leftNameTxt_.transform)

				arg_587_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_587_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_587_1:RecordName(arg_587_1.leftNameTxt_.text)
				SetActive(arg_587_1.iconTrs_.gameObject, false)
				arg_587_1.callingController_:SetSelectedState("normal")

				local var_590_3 = arg_587_1:GetWordFromCfg(120421144)
				local var_590_4 = arg_587_1:FormatText(var_590_3.content)

				arg_587_1.text_.text = var_590_4

				LuaForUtil.ClearLinePrefixSymbol(arg_587_1.text_)

				local var_590_5 = 59
				local var_590_6 = utf8.len(var_590_4)
				local var_590_7 = var_590_5 <= 0 and var_590_1 or var_590_1 * (var_590_6 / var_590_5)

				if var_590_7 > 0 and var_590_1 < var_590_7 then
					arg_587_1.talkMaxDuration = var_590_7

					if var_590_7 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_7 + var_590_0
					end
				end

				arg_587_1.text_.text = var_590_4
				arg_587_1.typewritter.percent = 0

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421144", "story_v_out_120421.awb") ~= 0 then
					local var_590_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421144", "story_v_out_120421.awb") / 1000

					if var_590_8 + var_590_0 > arg_587_1.duration_ then
						arg_587_1.duration_ = var_590_8 + var_590_0
					end

					if var_590_3.prefab_name ~= "" and arg_587_1.actors_[var_590_3.prefab_name] ~= nil then
						local var_590_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_587_1.actors_[var_590_3.prefab_name].transform, "story_v_out_120421", "120421144", "story_v_out_120421.awb")

						arg_587_1:RecordAudio("120421144", var_590_9)
						arg_587_1:RecordAudio("120421144", var_590_9)
					else
						arg_587_1:AudioAction("play", "voice", "story_v_out_120421", "120421144", "story_v_out_120421.awb")
					end

					arg_587_1:RecordHistoryTalkVoice("story_v_out_120421", "120421144", "story_v_out_120421.awb")
				end

				arg_587_1:RecordContent(arg_587_1.text_.text)
			end

			local var_590_10 = math.max(var_590_1, arg_587_1.talkMaxDuration)

			if var_590_0 <= arg_587_1.time_ and arg_587_1.time_ < var_590_0 + var_590_10 then
				arg_587_1.typewritter.percent = (arg_587_1.time_ - var_590_0) / var_590_10

				arg_587_1.typewritter:SetDirty()
			end

			if arg_587_1.time_ >= var_590_0 + var_590_10 and arg_587_1.time_ < var_590_0 + var_590_10 + arg_590_0 then
				arg_587_1.typewritter.percent = 1

				arg_587_1.typewritter:SetDirty()
				arg_587_1:ShowNextGo(true)
			end
		end
	end,
	Play120421145 = function(arg_591_0, arg_591_1)
		arg_591_1.time_ = 0
		arg_591_1.frameCnt_ = 0
		arg_591_1.state_ = "playing"
		arg_591_1.curTalkId_ = 120421145
		arg_591_1.duration_ = 7.8

		local var_591_0 = {
			zh = 7.066,
			ja = 7.8
		}
		local var_591_1 = manager.audio:GetLocalizationFlag()

		if var_591_0[var_591_1] ~= nil then
			arg_591_1.duration_ = var_591_0[var_591_1]
		end

		SetActive(arg_591_1.tipsGo_, false)

		function arg_591_1.onSingleLineFinish_()
			arg_591_1.onSingleLineUpdate_ = nil
			arg_591_1.onSingleLineFinish_ = nil
			arg_591_1.state_ = "waiting"
		end

		function arg_591_1.playNext_(arg_593_0)
			if arg_593_0 == 1 then
				arg_591_0:Play120421146(arg_591_1)
			end
		end

		function arg_591_1.onSingleLineUpdate_(arg_594_0)
			local var_594_0 = 0
			local var_594_1 = 0.65

			if var_594_0 < arg_591_1.time_ and arg_591_1.time_ <= var_594_0 + arg_594_0 then
				arg_591_1.talkMaxDuration = 0
				arg_591_1.dialogCg_.alpha = 1

				arg_591_1.dialog_:SetActive(true)
				SetActive(arg_591_1.leftNameGo_, true)

				local var_594_2 = arg_591_1:FormatText(StoryNameCfg[380].name)

				arg_591_1.leftNameTxt_.text = var_594_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_591_1.leftNameTxt_.transform)

				arg_591_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_591_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_591_1:RecordName(arg_591_1.leftNameTxt_.text)
				SetActive(arg_591_1.iconTrs_.gameObject, false)
				arg_591_1.callingController_:SetSelectedState("normal")

				local var_594_3 = arg_591_1:GetWordFromCfg(120421145)
				local var_594_4 = arg_591_1:FormatText(var_594_3.content)

				arg_591_1.text_.text = var_594_4

				LuaForUtil.ClearLinePrefixSymbol(arg_591_1.text_)

				local var_594_5 = 26
				local var_594_6 = utf8.len(var_594_4)
				local var_594_7 = var_594_5 <= 0 and var_594_1 or var_594_1 * (var_594_6 / var_594_5)

				if var_594_7 > 0 and var_594_1 < var_594_7 then
					arg_591_1.talkMaxDuration = var_594_7

					if var_594_7 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_7 + var_594_0
					end
				end

				arg_591_1.text_.text = var_594_4
				arg_591_1.typewritter.percent = 0

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421145", "story_v_out_120421.awb") ~= 0 then
					local var_594_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421145", "story_v_out_120421.awb") / 1000

					if var_594_8 + var_594_0 > arg_591_1.duration_ then
						arg_591_1.duration_ = var_594_8 + var_594_0
					end

					if var_594_3.prefab_name ~= "" and arg_591_1.actors_[var_594_3.prefab_name] ~= nil then
						local var_594_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_591_1.actors_[var_594_3.prefab_name].transform, "story_v_out_120421", "120421145", "story_v_out_120421.awb")

						arg_591_1:RecordAudio("120421145", var_594_9)
						arg_591_1:RecordAudio("120421145", var_594_9)
					else
						arg_591_1:AudioAction("play", "voice", "story_v_out_120421", "120421145", "story_v_out_120421.awb")
					end

					arg_591_1:RecordHistoryTalkVoice("story_v_out_120421", "120421145", "story_v_out_120421.awb")
				end

				arg_591_1:RecordContent(arg_591_1.text_.text)
			end

			local var_594_10 = math.max(var_594_1, arg_591_1.talkMaxDuration)

			if var_594_0 <= arg_591_1.time_ and arg_591_1.time_ < var_594_0 + var_594_10 then
				arg_591_1.typewritter.percent = (arg_591_1.time_ - var_594_0) / var_594_10

				arg_591_1.typewritter:SetDirty()
			end

			if arg_591_1.time_ >= var_594_0 + var_594_10 and arg_591_1.time_ < var_594_0 + var_594_10 + arg_594_0 then
				arg_591_1.typewritter.percent = 1

				arg_591_1.typewritter:SetDirty()
				arg_591_1:ShowNextGo(true)
			end
		end
	end,
	Play120421146 = function(arg_595_0, arg_595_1)
		arg_595_1.time_ = 0
		arg_595_1.frameCnt_ = 0
		arg_595_1.state_ = "playing"
		arg_595_1.curTalkId_ = 120421146
		arg_595_1.duration_ = 5

		SetActive(arg_595_1.tipsGo_, false)

		function arg_595_1.onSingleLineFinish_()
			arg_595_1.onSingleLineUpdate_ = nil
			arg_595_1.onSingleLineFinish_ = nil
			arg_595_1.state_ = "waiting"
		end

		function arg_595_1.playNext_(arg_597_0)
			if arg_597_0 == 1 then
				arg_595_0:Play120421147(arg_595_1)
			end
		end

		function arg_595_1.onSingleLineUpdate_(arg_598_0)
			local var_598_0 = arg_595_1.actors_["10044ui_story"]
			local var_598_1 = 0

			if var_598_1 < arg_595_1.time_ and arg_595_1.time_ <= var_598_1 + arg_598_0 and arg_595_1.var_.characterEffect10044ui_story == nil then
				arg_595_1.var_.characterEffect10044ui_story = var_598_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_598_2 = 0.2

			if var_598_1 <= arg_595_1.time_ and arg_595_1.time_ < var_598_1 + var_598_2 then
				local var_598_3 = (arg_595_1.time_ - var_598_1) / var_598_2

				if arg_595_1.var_.characterEffect10044ui_story then
					local var_598_4 = Mathf.Lerp(0, 0.5, var_598_3)

					arg_595_1.var_.characterEffect10044ui_story.fillFlat = true
					arg_595_1.var_.characterEffect10044ui_story.fillRatio = var_598_4
				end
			end

			if arg_595_1.time_ >= var_598_1 + var_598_2 and arg_595_1.time_ < var_598_1 + var_598_2 + arg_598_0 and arg_595_1.var_.characterEffect10044ui_story then
				local var_598_5 = 0.5

				arg_595_1.var_.characterEffect10044ui_story.fillFlat = true
				arg_595_1.var_.characterEffect10044ui_story.fillRatio = var_598_5
			end

			local var_598_6 = 0

			if var_598_6 < arg_595_1.time_ and arg_595_1.time_ <= var_598_6 + arg_598_0 then
				arg_595_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action3_2")
			end

			local var_598_7 = 0
			local var_598_8 = 0.8

			if var_598_7 < arg_595_1.time_ and arg_595_1.time_ <= var_598_7 + arg_598_0 then
				arg_595_1.talkMaxDuration = 0
				arg_595_1.dialogCg_.alpha = 1

				arg_595_1.dialog_:SetActive(true)
				SetActive(arg_595_1.leftNameGo_, false)

				arg_595_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_595_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_595_1:RecordName(arg_595_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_595_1.iconTrs_.gameObject, false)
				arg_595_1.callingController_:SetSelectedState("normal")

				local var_598_9 = arg_595_1:GetWordFromCfg(120421146)
				local var_598_10 = arg_595_1:FormatText(var_598_9.content)

				arg_595_1.text_.text = var_598_10

				LuaForUtil.ClearLinePrefixSymbol(arg_595_1.text_)

				local var_598_11 = 32
				local var_598_12 = utf8.len(var_598_10)
				local var_598_13 = var_598_11 <= 0 and var_598_8 or var_598_8 * (var_598_12 / var_598_11)

				if var_598_13 > 0 and var_598_8 < var_598_13 then
					arg_595_1.talkMaxDuration = var_598_13

					if var_598_13 + var_598_7 > arg_595_1.duration_ then
						arg_595_1.duration_ = var_598_13 + var_598_7
					end
				end

				arg_595_1.text_.text = var_598_10
				arg_595_1.typewritter.percent = 0

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(false)
				arg_595_1:RecordContent(arg_595_1.text_.text)
			end

			local var_598_14 = math.max(var_598_8, arg_595_1.talkMaxDuration)

			if var_598_7 <= arg_595_1.time_ and arg_595_1.time_ < var_598_7 + var_598_14 then
				arg_595_1.typewritter.percent = (arg_595_1.time_ - var_598_7) / var_598_14

				arg_595_1.typewritter:SetDirty()
			end

			if arg_595_1.time_ >= var_598_7 + var_598_14 and arg_595_1.time_ < var_598_7 + var_598_14 + arg_598_0 then
				arg_595_1.typewritter.percent = 1

				arg_595_1.typewritter:SetDirty()
				arg_595_1:ShowNextGo(true)
			end
		end
	end,
	Play120421147 = function(arg_599_0, arg_599_1)
		arg_599_1.time_ = 0
		arg_599_1.frameCnt_ = 0
		arg_599_1.state_ = "playing"
		arg_599_1.curTalkId_ = 120421147
		arg_599_1.duration_ = 6.066

		local var_599_0 = {
			zh = 4.966,
			ja = 6.066
		}
		local var_599_1 = manager.audio:GetLocalizationFlag()

		if var_599_0[var_599_1] ~= nil then
			arg_599_1.duration_ = var_599_0[var_599_1]
		end

		SetActive(arg_599_1.tipsGo_, false)

		function arg_599_1.onSingleLineFinish_()
			arg_599_1.onSingleLineUpdate_ = nil
			arg_599_1.onSingleLineFinish_ = nil
			arg_599_1.state_ = "waiting"
		end

		function arg_599_1.playNext_(arg_601_0)
			if arg_601_0 == 1 then
				arg_599_0:Play120421148(arg_599_1)
			end
		end

		function arg_599_1.onSingleLineUpdate_(arg_602_0)
			local var_602_0 = 0

			if var_602_0 < arg_599_1.time_ and arg_599_1.time_ <= var_602_0 + arg_602_0 then
				arg_599_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1103cva")
			end

			local var_602_1 = 0

			if var_602_1 < arg_599_1.time_ and arg_599_1.time_ <= var_602_1 + arg_602_0 then
				arg_599_1:PlayTimeline("10044ui_story", "StoryTimeline/CharAction/story10044/story10044action/10044action1_1")
			end

			local var_602_2 = arg_599_1.actors_["10044ui_story"]
			local var_602_3 = 0

			if var_602_3 < arg_599_1.time_ and arg_599_1.time_ <= var_602_3 + arg_602_0 and arg_599_1.var_.characterEffect10044ui_story == nil then
				arg_599_1.var_.characterEffect10044ui_story = var_602_2:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_602_4 = 0.2

			if var_602_3 <= arg_599_1.time_ and arg_599_1.time_ < var_602_3 + var_602_4 then
				local var_602_5 = (arg_599_1.time_ - var_602_3) / var_602_4

				if arg_599_1.var_.characterEffect10044ui_story then
					arg_599_1.var_.characterEffect10044ui_story.fillFlat = false
				end
			end

			if arg_599_1.time_ >= var_602_3 + var_602_4 and arg_599_1.time_ < var_602_3 + var_602_4 + arg_602_0 and arg_599_1.var_.characterEffect10044ui_story then
				arg_599_1.var_.characterEffect10044ui_story.fillFlat = false
			end

			local var_602_6 = 0
			local var_602_7 = 0.375

			if var_602_6 < arg_599_1.time_ and arg_599_1.time_ <= var_602_6 + arg_602_0 then
				arg_599_1.talkMaxDuration = 0
				arg_599_1.dialogCg_.alpha = 1

				arg_599_1.dialog_:SetActive(true)
				SetActive(arg_599_1.leftNameGo_, true)

				local var_602_8 = arg_599_1:FormatText(StoryNameCfg[380].name)

				arg_599_1.leftNameTxt_.text = var_602_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_599_1.leftNameTxt_.transform)

				arg_599_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_599_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_599_1:RecordName(arg_599_1.leftNameTxt_.text)
				SetActive(arg_599_1.iconTrs_.gameObject, false)
				arg_599_1.callingController_:SetSelectedState("normal")

				local var_602_9 = arg_599_1:GetWordFromCfg(120421147)
				local var_602_10 = arg_599_1:FormatText(var_602_9.content)

				arg_599_1.text_.text = var_602_10

				LuaForUtil.ClearLinePrefixSymbol(arg_599_1.text_)

				local var_602_11 = 15
				local var_602_12 = utf8.len(var_602_10)
				local var_602_13 = var_602_11 <= 0 and var_602_7 or var_602_7 * (var_602_12 / var_602_11)

				if var_602_13 > 0 and var_602_7 < var_602_13 then
					arg_599_1.talkMaxDuration = var_602_13

					if var_602_13 + var_602_6 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_13 + var_602_6
					end
				end

				arg_599_1.text_.text = var_602_10
				arg_599_1.typewritter.percent = 0

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421147", "story_v_out_120421.awb") ~= 0 then
					local var_602_14 = manager.audio:GetVoiceLength("story_v_out_120421", "120421147", "story_v_out_120421.awb") / 1000

					if var_602_14 + var_602_6 > arg_599_1.duration_ then
						arg_599_1.duration_ = var_602_14 + var_602_6
					end

					if var_602_9.prefab_name ~= "" and arg_599_1.actors_[var_602_9.prefab_name] ~= nil then
						local var_602_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_599_1.actors_[var_602_9.prefab_name].transform, "story_v_out_120421", "120421147", "story_v_out_120421.awb")

						arg_599_1:RecordAudio("120421147", var_602_15)
						arg_599_1:RecordAudio("120421147", var_602_15)
					else
						arg_599_1:AudioAction("play", "voice", "story_v_out_120421", "120421147", "story_v_out_120421.awb")
					end

					arg_599_1:RecordHistoryTalkVoice("story_v_out_120421", "120421147", "story_v_out_120421.awb")
				end

				arg_599_1:RecordContent(arg_599_1.text_.text)
			end

			local var_602_16 = math.max(var_602_7, arg_599_1.talkMaxDuration)

			if var_602_6 <= arg_599_1.time_ and arg_599_1.time_ < var_602_6 + var_602_16 then
				arg_599_1.typewritter.percent = (arg_599_1.time_ - var_602_6) / var_602_16

				arg_599_1.typewritter:SetDirty()
			end

			if arg_599_1.time_ >= var_602_6 + var_602_16 and arg_599_1.time_ < var_602_6 + var_602_16 + arg_602_0 then
				arg_599_1.typewritter.percent = 1

				arg_599_1.typewritter:SetDirty()
				arg_599_1:ShowNextGo(true)
			end
		end
	end,
	Play120421148 = function(arg_603_0, arg_603_1)
		arg_603_1.time_ = 0
		arg_603_1.frameCnt_ = 0
		arg_603_1.state_ = "playing"
		arg_603_1.curTalkId_ = 120421148
		arg_603_1.duration_ = 9

		SetActive(arg_603_1.tipsGo_, false)

		function arg_603_1.onSingleLineFinish_()
			arg_603_1.onSingleLineUpdate_ = nil
			arg_603_1.onSingleLineFinish_ = nil
			arg_603_1.state_ = "waiting"
		end

		function arg_603_1.playNext_(arg_605_0)
			if arg_605_0 == 1 then
				arg_603_0:Play120421149(arg_603_1)
			end
		end

		function arg_603_1.onSingleLineUpdate_(arg_606_0)
			local var_606_0 = 2

			if var_606_0 < arg_603_1.time_ and arg_603_1.time_ <= var_606_0 + arg_606_0 then
				local var_606_1 = manager.ui.mainCamera.transform.localPosition
				local var_606_2 = Vector3.New(0, 0, 10) + Vector3.New(var_606_1.x, var_606_1.y, 0)
				local var_606_3 = arg_603_1.bgs_.ST29

				var_606_3.transform.localPosition = var_606_2
				var_606_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_606_4 = var_606_3:GetComponent("SpriteRenderer")

				if var_606_4 and var_606_4.sprite then
					local var_606_5 = (var_606_3.transform.localPosition - var_606_1).z
					local var_606_6 = manager.ui.mainCameraCom_
					local var_606_7 = 2 * var_606_5 * Mathf.Tan(var_606_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_606_8 = var_606_7 * var_606_6.aspect
					local var_606_9 = var_606_4.sprite.bounds.size.x
					local var_606_10 = var_606_4.sprite.bounds.size.y
					local var_606_11 = var_606_8 / var_606_9
					local var_606_12 = var_606_7 / var_606_10
					local var_606_13 = var_606_12 < var_606_11 and var_606_11 or var_606_12

					var_606_3.transform.localScale = Vector3.New(var_606_13, var_606_13, 0)
				end

				for iter_606_0, iter_606_1 in pairs(arg_603_1.bgs_) do
					if iter_606_0 ~= "ST29" then
						iter_606_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_606_14 = 2

			if var_606_14 < arg_603_1.time_ and arg_603_1.time_ <= var_606_14 + arg_606_0 then
				arg_603_1.mask_.enabled = true
				arg_603_1.mask_.raycastTarget = true

				arg_603_1:SetGaussion(false)
			end

			local var_606_15 = 2

			if var_606_14 <= arg_603_1.time_ and arg_603_1.time_ < var_606_14 + var_606_15 then
				local var_606_16 = (arg_603_1.time_ - var_606_14) / var_606_15
				local var_606_17 = Color.New(0, 0, 0)

				var_606_17.a = Mathf.Lerp(1, 0, var_606_16)
				arg_603_1.mask_.color = var_606_17
			end

			if arg_603_1.time_ >= var_606_14 + var_606_15 and arg_603_1.time_ < var_606_14 + var_606_15 + arg_606_0 then
				local var_606_18 = Color.New(0, 0, 0)
				local var_606_19 = 0

				arg_603_1.mask_.enabled = false
				var_606_18.a = var_606_19
				arg_603_1.mask_.color = var_606_18
			end

			local var_606_20 = 0

			if var_606_20 < arg_603_1.time_ and arg_603_1.time_ <= var_606_20 + arg_606_0 then
				arg_603_1.mask_.enabled = true
				arg_603_1.mask_.raycastTarget = true

				arg_603_1:SetGaussion(false)
			end

			local var_606_21 = 2

			if var_606_20 <= arg_603_1.time_ and arg_603_1.time_ < var_606_20 + var_606_21 then
				local var_606_22 = (arg_603_1.time_ - var_606_20) / var_606_21
				local var_606_23 = Color.New(0, 0, 0)

				var_606_23.a = Mathf.Lerp(0, 1, var_606_22)
				arg_603_1.mask_.color = var_606_23
			end

			if arg_603_1.time_ >= var_606_20 + var_606_21 and arg_603_1.time_ < var_606_20 + var_606_21 + arg_606_0 then
				local var_606_24 = Color.New(0, 0, 0)

				var_606_24.a = 1
				arg_603_1.mask_.color = var_606_24
			end

			local var_606_25 = arg_603_1.actors_["10044ui_story"].transform
			local var_606_26 = 1.966

			if var_606_26 < arg_603_1.time_ and arg_603_1.time_ <= var_606_26 + arg_606_0 then
				arg_603_1.var_.moveOldPos10044ui_story = var_606_25.localPosition
			end

			local var_606_27 = 0.001

			if var_606_26 <= arg_603_1.time_ and arg_603_1.time_ < var_606_26 + var_606_27 then
				local var_606_28 = (arg_603_1.time_ - var_606_26) / var_606_27
				local var_606_29 = Vector3.New(0, 100, 0)

				var_606_25.localPosition = Vector3.Lerp(arg_603_1.var_.moveOldPos10044ui_story, var_606_29, var_606_28)

				local var_606_30 = manager.ui.mainCamera.transform.position - var_606_25.position

				var_606_25.forward = Vector3.New(var_606_30.x, var_606_30.y, var_606_30.z)

				local var_606_31 = var_606_25.localEulerAngles

				var_606_31.z = 0
				var_606_31.x = 0
				var_606_25.localEulerAngles = var_606_31
			end

			if arg_603_1.time_ >= var_606_26 + var_606_27 and arg_603_1.time_ < var_606_26 + var_606_27 + arg_606_0 then
				var_606_25.localPosition = Vector3.New(0, 100, 0)

				local var_606_32 = manager.ui.mainCamera.transform.position - var_606_25.position

				var_606_25.forward = Vector3.New(var_606_32.x, var_606_32.y, var_606_32.z)

				local var_606_33 = var_606_25.localEulerAngles

				var_606_33.z = 0
				var_606_33.x = 0
				var_606_25.localEulerAngles = var_606_33
			end

			if arg_603_1.frameCnt_ <= 1 then
				arg_603_1.dialog_:SetActive(false)
			end

			local var_606_34 = 4
			local var_606_35 = 0.675

			if var_606_34 < arg_603_1.time_ and arg_603_1.time_ <= var_606_34 + arg_606_0 then
				arg_603_1.talkMaxDuration = 0

				arg_603_1.dialog_:SetActive(true)

				local var_606_36 = LeanTween.value(arg_603_1.dialog_, 0, 1, 0.3)

				var_606_36:setOnUpdate(LuaHelper.FloatAction(function(arg_607_0)
					arg_603_1.dialogCg_.alpha = arg_607_0
				end))
				var_606_36:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_603_1.dialog_)
					var_606_36:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_603_1.duration_ = arg_603_1.duration_ + 0.3

				SetActive(arg_603_1.leftNameGo_, false)

				arg_603_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_603_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_603_1:RecordName(arg_603_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_603_1.iconTrs_.gameObject, false)
				arg_603_1.callingController_:SetSelectedState("normal")

				local var_606_37 = arg_603_1:GetWordFromCfg(120421148)
				local var_606_38 = arg_603_1:FormatText(var_606_37.content)

				arg_603_1.text_.text = var_606_38

				LuaForUtil.ClearLinePrefixSymbol(arg_603_1.text_)

				local var_606_39 = 27
				local var_606_40 = utf8.len(var_606_38)
				local var_606_41 = var_606_39 <= 0 and var_606_35 or var_606_35 * (var_606_40 / var_606_39)

				if var_606_41 > 0 and var_606_35 < var_606_41 then
					arg_603_1.talkMaxDuration = var_606_41
					var_606_34 = var_606_34 + 0.3

					if var_606_41 + var_606_34 > arg_603_1.duration_ then
						arg_603_1.duration_ = var_606_41 + var_606_34
					end
				end

				arg_603_1.text_.text = var_606_38
				arg_603_1.typewritter.percent = 0

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(false)
				arg_603_1:RecordContent(arg_603_1.text_.text)
			end

			local var_606_42 = var_606_34 + 0.3
			local var_606_43 = math.max(var_606_35, arg_603_1.talkMaxDuration)

			if var_606_42 <= arg_603_1.time_ and arg_603_1.time_ < var_606_42 + var_606_43 then
				arg_603_1.typewritter.percent = (arg_603_1.time_ - var_606_42) / var_606_43

				arg_603_1.typewritter:SetDirty()
			end

			if arg_603_1.time_ >= var_606_42 + var_606_43 and arg_603_1.time_ < var_606_42 + var_606_43 + arg_606_0 then
				arg_603_1.typewritter.percent = 1

				arg_603_1.typewritter:SetDirty()
				arg_603_1:ShowNextGo(true)
			end
		end
	end,
	Play120421149 = function(arg_609_0, arg_609_1)
		arg_609_1.time_ = 0
		arg_609_1.frameCnt_ = 0
		arg_609_1.state_ = "playing"
		arg_609_1.curTalkId_ = 120421149
		arg_609_1.duration_ = 5

		SetActive(arg_609_1.tipsGo_, false)

		function arg_609_1.onSingleLineFinish_()
			arg_609_1.onSingleLineUpdate_ = nil
			arg_609_1.onSingleLineFinish_ = nil
			arg_609_1.state_ = "waiting"
		end

		function arg_609_1.playNext_(arg_611_0)
			if arg_611_0 == 1 then
				arg_609_0:Play120421150(arg_609_1)
			end
		end

		function arg_609_1.onSingleLineUpdate_(arg_612_0)
			local var_612_0 = 0
			local var_612_1 = 0.925

			if var_612_0 < arg_609_1.time_ and arg_609_1.time_ <= var_612_0 + arg_612_0 then
				arg_609_1.talkMaxDuration = 0
				arg_609_1.dialogCg_.alpha = 1

				arg_609_1.dialog_:SetActive(true)
				SetActive(arg_609_1.leftNameGo_, false)

				arg_609_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_609_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_609_1:RecordName(arg_609_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_609_1.iconTrs_.gameObject, false)
				arg_609_1.callingController_:SetSelectedState("normal")

				local var_612_2 = arg_609_1:GetWordFromCfg(120421149)
				local var_612_3 = arg_609_1:FormatText(var_612_2.content)

				arg_609_1.text_.text = var_612_3

				LuaForUtil.ClearLinePrefixSymbol(arg_609_1.text_)

				local var_612_4 = 37
				local var_612_5 = utf8.len(var_612_3)
				local var_612_6 = var_612_4 <= 0 and var_612_1 or var_612_1 * (var_612_5 / var_612_4)

				if var_612_6 > 0 and var_612_1 < var_612_6 then
					arg_609_1.talkMaxDuration = var_612_6

					if var_612_6 + var_612_0 > arg_609_1.duration_ then
						arg_609_1.duration_ = var_612_6 + var_612_0
					end
				end

				arg_609_1.text_.text = var_612_3
				arg_609_1.typewritter.percent = 0

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(false)
				arg_609_1:RecordContent(arg_609_1.text_.text)
			end

			local var_612_7 = math.max(var_612_1, arg_609_1.talkMaxDuration)

			if var_612_0 <= arg_609_1.time_ and arg_609_1.time_ < var_612_0 + var_612_7 then
				arg_609_1.typewritter.percent = (arg_609_1.time_ - var_612_0) / var_612_7

				arg_609_1.typewritter:SetDirty()
			end

			if arg_609_1.time_ >= var_612_0 + var_612_7 and arg_609_1.time_ < var_612_0 + var_612_7 + arg_612_0 then
				arg_609_1.typewritter.percent = 1

				arg_609_1.typewritter:SetDirty()
				arg_609_1:ShowNextGo(true)
			end
		end
	end,
	Play120421150 = function(arg_613_0, arg_613_1)
		arg_613_1.time_ = 0
		arg_613_1.frameCnt_ = 0
		arg_613_1.state_ = "playing"
		arg_613_1.curTalkId_ = 120421150
		arg_613_1.duration_ = 5

		SetActive(arg_613_1.tipsGo_, false)

		function arg_613_1.onSingleLineFinish_()
			arg_613_1.onSingleLineUpdate_ = nil
			arg_613_1.onSingleLineFinish_ = nil
			arg_613_1.state_ = "waiting"
		end

		function arg_613_1.playNext_(arg_615_0)
			if arg_615_0 == 1 then
				arg_613_0:Play120421151(arg_613_1)
			end
		end

		function arg_613_1.onSingleLineUpdate_(arg_616_0)
			local var_616_0 = 0
			local var_616_1 = 0.6

			if var_616_0 < arg_613_1.time_ and arg_613_1.time_ <= var_616_0 + arg_616_0 then
				arg_613_1.talkMaxDuration = 0
				arg_613_1.dialogCg_.alpha = 1

				arg_613_1.dialog_:SetActive(true)
				SetActive(arg_613_1.leftNameGo_, false)

				arg_613_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_613_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_613_1:RecordName(arg_613_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_613_1.iconTrs_.gameObject, false)
				arg_613_1.callingController_:SetSelectedState("normal")

				local var_616_2 = arg_613_1:GetWordFromCfg(120421150)
				local var_616_3 = arg_613_1:FormatText(var_616_2.content)

				arg_613_1.text_.text = var_616_3

				LuaForUtil.ClearLinePrefixSymbol(arg_613_1.text_)

				local var_616_4 = 24
				local var_616_5 = utf8.len(var_616_3)
				local var_616_6 = var_616_4 <= 0 and var_616_1 or var_616_1 * (var_616_5 / var_616_4)

				if var_616_6 > 0 and var_616_1 < var_616_6 then
					arg_613_1.talkMaxDuration = var_616_6

					if var_616_6 + var_616_0 > arg_613_1.duration_ then
						arg_613_1.duration_ = var_616_6 + var_616_0
					end
				end

				arg_613_1.text_.text = var_616_3
				arg_613_1.typewritter.percent = 0

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(false)
				arg_613_1:RecordContent(arg_613_1.text_.text)
			end

			local var_616_7 = math.max(var_616_1, arg_613_1.talkMaxDuration)

			if var_616_0 <= arg_613_1.time_ and arg_613_1.time_ < var_616_0 + var_616_7 then
				arg_613_1.typewritter.percent = (arg_613_1.time_ - var_616_0) / var_616_7

				arg_613_1.typewritter:SetDirty()
			end

			if arg_613_1.time_ >= var_616_0 + var_616_7 and arg_613_1.time_ < var_616_0 + var_616_7 + arg_616_0 then
				arg_613_1.typewritter.percent = 1

				arg_613_1.typewritter:SetDirty()
				arg_613_1:ShowNextGo(true)
			end
		end
	end,
	Play120421151 = function(arg_617_0, arg_617_1)
		arg_617_1.time_ = 0
		arg_617_1.frameCnt_ = 0
		arg_617_1.state_ = "playing"
		arg_617_1.curTalkId_ = 120421151
		arg_617_1.duration_ = 3.9

		local var_617_0 = {
			zh = 3.9,
			ja = 3.5
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
				arg_617_0:Play120421152(arg_617_1)
			end
		end

		function arg_617_1.onSingleLineUpdate_(arg_620_0)
			local var_620_0 = arg_617_1.actors_["1074ui_story"].transform
			local var_620_1 = 0

			if var_620_1 < arg_617_1.time_ and arg_617_1.time_ <= var_620_1 + arg_620_0 then
				arg_617_1.var_.moveOldPos1074ui_story = var_620_0.localPosition
			end

			local var_620_2 = 0.001

			if var_620_1 <= arg_617_1.time_ and arg_617_1.time_ < var_620_1 + var_620_2 then
				local var_620_3 = (arg_617_1.time_ - var_620_1) / var_620_2
				local var_620_4 = Vector3.New(-0.7, -1.055, -6.12)

				var_620_0.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos1074ui_story, var_620_4, var_620_3)

				local var_620_5 = manager.ui.mainCamera.transform.position - var_620_0.position

				var_620_0.forward = Vector3.New(var_620_5.x, var_620_5.y, var_620_5.z)

				local var_620_6 = var_620_0.localEulerAngles

				var_620_6.z = 0
				var_620_6.x = 0
				var_620_0.localEulerAngles = var_620_6
			end

			if arg_617_1.time_ >= var_620_1 + var_620_2 and arg_617_1.time_ < var_620_1 + var_620_2 + arg_620_0 then
				var_620_0.localPosition = Vector3.New(-0.7, -1.055, -6.12)

				local var_620_7 = manager.ui.mainCamera.transform.position - var_620_0.position

				var_620_0.forward = Vector3.New(var_620_7.x, var_620_7.y, var_620_7.z)

				local var_620_8 = var_620_0.localEulerAngles

				var_620_8.z = 0
				var_620_8.x = 0
				var_620_0.localEulerAngles = var_620_8
			end

			local var_620_9 = 0

			if var_620_9 < arg_617_1.time_ and arg_617_1.time_ <= var_620_9 + arg_620_0 then
				arg_617_1:PlayTimeline("1074ui_story", "StoryTimeline/CharAction/story1074/story1074action/1074action1_1")
			end

			local var_620_10 = arg_617_1.actors_["1074ui_story"]
			local var_620_11 = 0

			if var_620_11 < arg_617_1.time_ and arg_617_1.time_ <= var_620_11 + arg_620_0 and arg_617_1.var_.characterEffect1074ui_story == nil then
				arg_617_1.var_.characterEffect1074ui_story = var_620_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_620_12 = 0.2

			if var_620_11 <= arg_617_1.time_ and arg_617_1.time_ < var_620_11 + var_620_12 then
				local var_620_13 = (arg_617_1.time_ - var_620_11) / var_620_12

				if arg_617_1.var_.characterEffect1074ui_story then
					arg_617_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_617_1.time_ >= var_620_11 + var_620_12 and arg_617_1.time_ < var_620_11 + var_620_12 + arg_620_0 and arg_617_1.var_.characterEffect1074ui_story then
				arg_617_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_620_14 = "1076ui_story"

			if arg_617_1.actors_[var_620_14] == nil then
				local var_620_15 = Object.Instantiate(Asset.Load("Char/" .. var_620_14), arg_617_1.stage_.transform)

				var_620_15.name = var_620_14
				var_620_15.transform.localPosition = Vector3.New(0, 100, 0)
				arg_617_1.actors_[var_620_14] = var_620_15

				local var_620_16 = var_620_15:GetComponentInChildren(typeof(CharacterEffect))

				var_620_16.enabled = true

				local var_620_17 = GameObjectTools.GetOrAddComponent(var_620_15, typeof(DynamicBoneHelper))

				if var_620_17 then
					var_620_17:EnableDynamicBone(false)
				end

				arg_617_1:ShowWeapon(var_620_16.transform, false)

				arg_617_1.var_[var_620_14 .. "Animator"] = var_620_16.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_617_1.var_[var_620_14 .. "Animator"].applyRootMotion = true
				arg_617_1.var_[var_620_14 .. "LipSync"] = var_620_16.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_620_18 = arg_617_1.actors_["1076ui_story"]
			local var_620_19 = 0

			if var_620_19 < arg_617_1.time_ and arg_617_1.time_ <= var_620_19 + arg_620_0 and arg_617_1.var_.characterEffect1076ui_story == nil then
				arg_617_1.var_.characterEffect1076ui_story = var_620_18:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_620_20 = 0.2

			if var_620_19 <= arg_617_1.time_ and arg_617_1.time_ < var_620_19 + var_620_20 then
				local var_620_21 = (arg_617_1.time_ - var_620_19) / var_620_20

				if arg_617_1.var_.characterEffect1076ui_story then
					local var_620_22 = Mathf.Lerp(0, 0.5, var_620_21)

					arg_617_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_617_1.var_.characterEffect1076ui_story.fillRatio = var_620_22
				end
			end

			if arg_617_1.time_ >= var_620_19 + var_620_20 and arg_617_1.time_ < var_620_19 + var_620_20 + arg_620_0 and arg_617_1.var_.characterEffect1076ui_story then
				local var_620_23 = 0.5

				arg_617_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_617_1.var_.characterEffect1076ui_story.fillRatio = var_620_23
			end

			local var_620_24 = 0

			if var_620_24 < arg_617_1.time_ and arg_617_1.time_ <= var_620_24 + arg_620_0 then
				arg_617_1:PlayTimeline("1076ui_story", "StoryTimeline/CharAction/story1076/story1076action/1076action1_1")
			end

			local var_620_25 = arg_617_1.actors_["1076ui_story"].transform
			local var_620_26 = 0

			if var_620_26 < arg_617_1.time_ and arg_617_1.time_ <= var_620_26 + arg_620_0 then
				arg_617_1.var_.moveOldPos1076ui_story = var_620_25.localPosition
			end

			local var_620_27 = 0.001

			if var_620_26 <= arg_617_1.time_ and arg_617_1.time_ < var_620_26 + var_620_27 then
				local var_620_28 = (arg_617_1.time_ - var_620_26) / var_620_27
				local var_620_29 = Vector3.New(0.7, -1.06, -6.2)

				var_620_25.localPosition = Vector3.Lerp(arg_617_1.var_.moveOldPos1076ui_story, var_620_29, var_620_28)

				local var_620_30 = manager.ui.mainCamera.transform.position - var_620_25.position

				var_620_25.forward = Vector3.New(var_620_30.x, var_620_30.y, var_620_30.z)

				local var_620_31 = var_620_25.localEulerAngles

				var_620_31.z = 0
				var_620_31.x = 0
				var_620_25.localEulerAngles = var_620_31
			end

			if arg_617_1.time_ >= var_620_26 + var_620_27 and arg_617_1.time_ < var_620_26 + var_620_27 + arg_620_0 then
				var_620_25.localPosition = Vector3.New(0.7, -1.06, -6.2)

				local var_620_32 = manager.ui.mainCamera.transform.position - var_620_25.position

				var_620_25.forward = Vector3.New(var_620_32.x, var_620_32.y, var_620_32.z)

				local var_620_33 = var_620_25.localEulerAngles

				var_620_33.z = 0
				var_620_33.x = 0
				var_620_25.localEulerAngles = var_620_33
			end

			local var_620_34 = 0
			local var_620_35 = 0.225

			if var_620_34 < arg_617_1.time_ and arg_617_1.time_ <= var_620_34 + arg_620_0 then
				arg_617_1.talkMaxDuration = 0
				arg_617_1.dialogCg_.alpha = 1

				arg_617_1.dialog_:SetActive(true)
				SetActive(arg_617_1.leftNameGo_, true)

				local var_620_36 = arg_617_1:FormatText(StoryNameCfg[410].name)

				arg_617_1.leftNameTxt_.text = var_620_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_617_1.leftNameTxt_.transform)

				arg_617_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_617_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_617_1:RecordName(arg_617_1.leftNameTxt_.text)
				SetActive(arg_617_1.iconTrs_.gameObject, false)
				arg_617_1.callingController_:SetSelectedState("normal")

				local var_620_37 = arg_617_1:GetWordFromCfg(120421151)
				local var_620_38 = arg_617_1:FormatText(var_620_37.content)

				arg_617_1.text_.text = var_620_38

				LuaForUtil.ClearLinePrefixSymbol(arg_617_1.text_)

				local var_620_39 = 9
				local var_620_40 = utf8.len(var_620_38)
				local var_620_41 = var_620_39 <= 0 and var_620_35 or var_620_35 * (var_620_40 / var_620_39)

				if var_620_41 > 0 and var_620_35 < var_620_41 then
					arg_617_1.talkMaxDuration = var_620_41

					if var_620_41 + var_620_34 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_41 + var_620_34
					end
				end

				arg_617_1.text_.text = var_620_38
				arg_617_1.typewritter.percent = 0

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421151", "story_v_out_120421.awb") ~= 0 then
					local var_620_42 = manager.audio:GetVoiceLength("story_v_out_120421", "120421151", "story_v_out_120421.awb") / 1000

					if var_620_42 + var_620_34 > arg_617_1.duration_ then
						arg_617_1.duration_ = var_620_42 + var_620_34
					end

					if var_620_37.prefab_name ~= "" and arg_617_1.actors_[var_620_37.prefab_name] ~= nil then
						local var_620_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_617_1.actors_[var_620_37.prefab_name].transform, "story_v_out_120421", "120421151", "story_v_out_120421.awb")

						arg_617_1:RecordAudio("120421151", var_620_43)
						arg_617_1:RecordAudio("120421151", var_620_43)
					else
						arg_617_1:AudioAction("play", "voice", "story_v_out_120421", "120421151", "story_v_out_120421.awb")
					end

					arg_617_1:RecordHistoryTalkVoice("story_v_out_120421", "120421151", "story_v_out_120421.awb")
				end

				arg_617_1:RecordContent(arg_617_1.text_.text)
			end

			local var_620_44 = math.max(var_620_35, arg_617_1.talkMaxDuration)

			if var_620_34 <= arg_617_1.time_ and arg_617_1.time_ < var_620_34 + var_620_44 then
				arg_617_1.typewritter.percent = (arg_617_1.time_ - var_620_34) / var_620_44

				arg_617_1.typewritter:SetDirty()
			end

			if arg_617_1.time_ >= var_620_34 + var_620_44 and arg_617_1.time_ < var_620_34 + var_620_44 + arg_620_0 then
				arg_617_1.typewritter.percent = 1

				arg_617_1.typewritter:SetDirty()
				arg_617_1:ShowNextGo(true)
			end
		end
	end,
	Play120421152 = function(arg_621_0, arg_621_1)
		arg_621_1.time_ = 0
		arg_621_1.frameCnt_ = 0
		arg_621_1.state_ = "playing"
		arg_621_1.curTalkId_ = 120421152
		arg_621_1.duration_ = 5.6

		local var_621_0 = {
			zh = 3.566,
			ja = 5.6
		}
		local var_621_1 = manager.audio:GetLocalizationFlag()

		if var_621_0[var_621_1] ~= nil then
			arg_621_1.duration_ = var_621_0[var_621_1]
		end

		SetActive(arg_621_1.tipsGo_, false)

		function arg_621_1.onSingleLineFinish_()
			arg_621_1.onSingleLineUpdate_ = nil
			arg_621_1.onSingleLineFinish_ = nil
			arg_621_1.state_ = "waiting"
		end

		function arg_621_1.playNext_(arg_623_0)
			if arg_623_0 == 1 then
				arg_621_0:Play120421153(arg_621_1)
			end
		end

		function arg_621_1.onSingleLineUpdate_(arg_624_0)
			local var_624_0 = arg_621_1.actors_["1074ui_story"]
			local var_624_1 = 0

			if var_624_1 < arg_621_1.time_ and arg_621_1.time_ <= var_624_1 + arg_624_0 and arg_621_1.var_.characterEffect1074ui_story == nil then
				arg_621_1.var_.characterEffect1074ui_story = var_624_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_624_2 = 0.2

			if var_624_1 <= arg_621_1.time_ and arg_621_1.time_ < var_624_1 + var_624_2 then
				local var_624_3 = (arg_621_1.time_ - var_624_1) / var_624_2

				if arg_621_1.var_.characterEffect1074ui_story then
					local var_624_4 = Mathf.Lerp(0, 0.5, var_624_3)

					arg_621_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_621_1.var_.characterEffect1074ui_story.fillRatio = var_624_4
				end
			end

			if arg_621_1.time_ >= var_624_1 + var_624_2 and arg_621_1.time_ < var_624_1 + var_624_2 + arg_624_0 and arg_621_1.var_.characterEffect1074ui_story then
				local var_624_5 = 0.5

				arg_621_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_621_1.var_.characterEffect1074ui_story.fillRatio = var_624_5
			end

			local var_624_6 = arg_621_1.actors_["1076ui_story"]
			local var_624_7 = 0

			if var_624_7 < arg_621_1.time_ and arg_621_1.time_ <= var_624_7 + arg_624_0 and arg_621_1.var_.characterEffect1076ui_story == nil then
				arg_621_1.var_.characterEffect1076ui_story = var_624_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_624_8 = 0.2

			if var_624_7 <= arg_621_1.time_ and arg_621_1.time_ < var_624_7 + var_624_8 then
				local var_624_9 = (arg_621_1.time_ - var_624_7) / var_624_8

				if arg_621_1.var_.characterEffect1076ui_story then
					arg_621_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_621_1.time_ >= var_624_7 + var_624_8 and arg_621_1.time_ < var_624_7 + var_624_8 + arg_624_0 and arg_621_1.var_.characterEffect1076ui_story then
				arg_621_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_624_10 = 0
			local var_624_11 = 0.35

			if var_624_10 < arg_621_1.time_ and arg_621_1.time_ <= var_624_10 + arg_624_0 then
				arg_621_1.talkMaxDuration = 0
				arg_621_1.dialogCg_.alpha = 1

				arg_621_1.dialog_:SetActive(true)
				SetActive(arg_621_1.leftNameGo_, true)

				local var_624_12 = arg_621_1:FormatText(StoryNameCfg[389].name)

				arg_621_1.leftNameTxt_.text = var_624_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_621_1.leftNameTxt_.transform)

				arg_621_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_621_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_621_1:RecordName(arg_621_1.leftNameTxt_.text)
				SetActive(arg_621_1.iconTrs_.gameObject, false)
				arg_621_1.callingController_:SetSelectedState("normal")

				local var_624_13 = arg_621_1:GetWordFromCfg(120421152)
				local var_624_14 = arg_621_1:FormatText(var_624_13.content)

				arg_621_1.text_.text = var_624_14

				LuaForUtil.ClearLinePrefixSymbol(arg_621_1.text_)

				local var_624_15 = 14
				local var_624_16 = utf8.len(var_624_14)
				local var_624_17 = var_624_15 <= 0 and var_624_11 or var_624_11 * (var_624_16 / var_624_15)

				if var_624_17 > 0 and var_624_11 < var_624_17 then
					arg_621_1.talkMaxDuration = var_624_17

					if var_624_17 + var_624_10 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_17 + var_624_10
					end
				end

				arg_621_1.text_.text = var_624_14
				arg_621_1.typewritter.percent = 0

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421152", "story_v_out_120421.awb") ~= 0 then
					local var_624_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421152", "story_v_out_120421.awb") / 1000

					if var_624_18 + var_624_10 > arg_621_1.duration_ then
						arg_621_1.duration_ = var_624_18 + var_624_10
					end

					if var_624_13.prefab_name ~= "" and arg_621_1.actors_[var_624_13.prefab_name] ~= nil then
						local var_624_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_621_1.actors_[var_624_13.prefab_name].transform, "story_v_out_120421", "120421152", "story_v_out_120421.awb")

						arg_621_1:RecordAudio("120421152", var_624_19)
						arg_621_1:RecordAudio("120421152", var_624_19)
					else
						arg_621_1:AudioAction("play", "voice", "story_v_out_120421", "120421152", "story_v_out_120421.awb")
					end

					arg_621_1:RecordHistoryTalkVoice("story_v_out_120421", "120421152", "story_v_out_120421.awb")
				end

				arg_621_1:RecordContent(arg_621_1.text_.text)
			end

			local var_624_20 = math.max(var_624_11, arg_621_1.talkMaxDuration)

			if var_624_10 <= arg_621_1.time_ and arg_621_1.time_ < var_624_10 + var_624_20 then
				arg_621_1.typewritter.percent = (arg_621_1.time_ - var_624_10) / var_624_20

				arg_621_1.typewritter:SetDirty()
			end

			if arg_621_1.time_ >= var_624_10 + var_624_20 and arg_621_1.time_ < var_624_10 + var_624_20 + arg_624_0 then
				arg_621_1.typewritter.percent = 1

				arg_621_1.typewritter:SetDirty()
				arg_621_1:ShowNextGo(true)
			end
		end
	end,
	Play120421153 = function(arg_625_0, arg_625_1)
		arg_625_1.time_ = 0
		arg_625_1.frameCnt_ = 0
		arg_625_1.state_ = "playing"
		arg_625_1.curTalkId_ = 120421153
		arg_625_1.duration_ = 7.3

		local var_625_0 = {
			zh = 6.033,
			ja = 7.3
		}
		local var_625_1 = manager.audio:GetLocalizationFlag()

		if var_625_0[var_625_1] ~= nil then
			arg_625_1.duration_ = var_625_0[var_625_1]
		end

		SetActive(arg_625_1.tipsGo_, false)

		function arg_625_1.onSingleLineFinish_()
			arg_625_1.onSingleLineUpdate_ = nil
			arg_625_1.onSingleLineFinish_ = nil
			arg_625_1.state_ = "waiting"
		end

		function arg_625_1.playNext_(arg_627_0)
			if arg_627_0 == 1 then
				arg_625_0:Play120421154(arg_625_1)
			end
		end

		function arg_625_1.onSingleLineUpdate_(arg_628_0)
			local var_628_0 = arg_625_1.actors_["1074ui_story"]
			local var_628_1 = 0

			if var_628_1 < arg_625_1.time_ and arg_625_1.time_ <= var_628_1 + arg_628_0 and arg_625_1.var_.characterEffect1074ui_story == nil then
				arg_625_1.var_.characterEffect1074ui_story = var_628_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_628_2 = 0.2

			if var_628_1 <= arg_625_1.time_ and arg_625_1.time_ < var_628_1 + var_628_2 then
				local var_628_3 = (arg_625_1.time_ - var_628_1) / var_628_2

				if arg_625_1.var_.characterEffect1074ui_story then
					arg_625_1.var_.characterEffect1074ui_story.fillFlat = false
				end
			end

			if arg_625_1.time_ >= var_628_1 + var_628_2 and arg_625_1.time_ < var_628_1 + var_628_2 + arg_628_0 and arg_625_1.var_.characterEffect1074ui_story then
				arg_625_1.var_.characterEffect1074ui_story.fillFlat = false
			end

			local var_628_4 = arg_625_1.actors_["1076ui_story"]
			local var_628_5 = 0

			if var_628_5 < arg_625_1.time_ and arg_625_1.time_ <= var_628_5 + arg_628_0 and arg_625_1.var_.characterEffect1076ui_story == nil then
				arg_625_1.var_.characterEffect1076ui_story = var_628_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_628_6 = 0.2

			if var_628_5 <= arg_625_1.time_ and arg_625_1.time_ < var_628_5 + var_628_6 then
				local var_628_7 = (arg_625_1.time_ - var_628_5) / var_628_6

				if arg_625_1.var_.characterEffect1076ui_story then
					local var_628_8 = Mathf.Lerp(0, 0.5, var_628_7)

					arg_625_1.var_.characterEffect1076ui_story.fillFlat = true
					arg_625_1.var_.characterEffect1076ui_story.fillRatio = var_628_8
				end
			end

			if arg_625_1.time_ >= var_628_5 + var_628_6 and arg_625_1.time_ < var_628_5 + var_628_6 + arg_628_0 and arg_625_1.var_.characterEffect1076ui_story then
				local var_628_9 = 0.5

				arg_625_1.var_.characterEffect1076ui_story.fillFlat = true
				arg_625_1.var_.characterEffect1076ui_story.fillRatio = var_628_9
			end

			local var_628_10 = 0
			local var_628_11 = 0.65

			if var_628_10 < arg_625_1.time_ and arg_625_1.time_ <= var_628_10 + arg_628_0 then
				arg_625_1.talkMaxDuration = 0
				arg_625_1.dialogCg_.alpha = 1

				arg_625_1.dialog_:SetActive(true)
				SetActive(arg_625_1.leftNameGo_, true)

				local var_628_12 = arg_625_1:FormatText(StoryNameCfg[410].name)

				arg_625_1.leftNameTxt_.text = var_628_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_625_1.leftNameTxt_.transform)

				arg_625_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_625_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_625_1:RecordName(arg_625_1.leftNameTxt_.text)
				SetActive(arg_625_1.iconTrs_.gameObject, false)
				arg_625_1.callingController_:SetSelectedState("normal")

				local var_628_13 = arg_625_1:GetWordFromCfg(120421153)
				local var_628_14 = arg_625_1:FormatText(var_628_13.content)

				arg_625_1.text_.text = var_628_14

				LuaForUtil.ClearLinePrefixSymbol(arg_625_1.text_)

				local var_628_15 = 26
				local var_628_16 = utf8.len(var_628_14)
				local var_628_17 = var_628_15 <= 0 and var_628_11 or var_628_11 * (var_628_16 / var_628_15)

				if var_628_17 > 0 and var_628_11 < var_628_17 then
					arg_625_1.talkMaxDuration = var_628_17

					if var_628_17 + var_628_10 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_17 + var_628_10
					end
				end

				arg_625_1.text_.text = var_628_14
				arg_625_1.typewritter.percent = 0

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421153", "story_v_out_120421.awb") ~= 0 then
					local var_628_18 = manager.audio:GetVoiceLength("story_v_out_120421", "120421153", "story_v_out_120421.awb") / 1000

					if var_628_18 + var_628_10 > arg_625_1.duration_ then
						arg_625_1.duration_ = var_628_18 + var_628_10
					end

					if var_628_13.prefab_name ~= "" and arg_625_1.actors_[var_628_13.prefab_name] ~= nil then
						local var_628_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_625_1.actors_[var_628_13.prefab_name].transform, "story_v_out_120421", "120421153", "story_v_out_120421.awb")

						arg_625_1:RecordAudio("120421153", var_628_19)
						arg_625_1:RecordAudio("120421153", var_628_19)
					else
						arg_625_1:AudioAction("play", "voice", "story_v_out_120421", "120421153", "story_v_out_120421.awb")
					end

					arg_625_1:RecordHistoryTalkVoice("story_v_out_120421", "120421153", "story_v_out_120421.awb")
				end

				arg_625_1:RecordContent(arg_625_1.text_.text)
			end

			local var_628_20 = math.max(var_628_11, arg_625_1.talkMaxDuration)

			if var_628_10 <= arg_625_1.time_ and arg_625_1.time_ < var_628_10 + var_628_20 then
				arg_625_1.typewritter.percent = (arg_625_1.time_ - var_628_10) / var_628_20

				arg_625_1.typewritter:SetDirty()
			end

			if arg_625_1.time_ >= var_628_10 + var_628_20 and arg_625_1.time_ < var_628_10 + var_628_20 + arg_628_0 then
				arg_625_1.typewritter.percent = 1

				arg_625_1.typewritter:SetDirty()
				arg_625_1:ShowNextGo(true)
			end
		end
	end,
	Play120421154 = function(arg_629_0, arg_629_1)
		arg_629_1.time_ = 0
		arg_629_1.frameCnt_ = 0
		arg_629_1.state_ = "playing"
		arg_629_1.curTalkId_ = 120421154
		arg_629_1.duration_ = 6.9

		local var_629_0 = {
			zh = 4.633,
			ja = 6.9
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
				arg_629_0:Play120421155(arg_629_1)
			end
		end

		function arg_629_1.onSingleLineUpdate_(arg_632_0)
			local var_632_0 = 0
			local var_632_1 = 0.575

			if var_632_0 < arg_629_1.time_ and arg_629_1.time_ <= var_632_0 + arg_632_0 then
				arg_629_1.talkMaxDuration = 0
				arg_629_1.dialogCg_.alpha = 1

				arg_629_1.dialog_:SetActive(true)
				SetActive(arg_629_1.leftNameGo_, true)

				local var_632_2 = arg_629_1:FormatText(StoryNameCfg[410].name)

				arg_629_1.leftNameTxt_.text = var_632_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_629_1.leftNameTxt_.transform)

				arg_629_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_629_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_629_1:RecordName(arg_629_1.leftNameTxt_.text)
				SetActive(arg_629_1.iconTrs_.gameObject, false)
				arg_629_1.callingController_:SetSelectedState("normal")

				local var_632_3 = arg_629_1:GetWordFromCfg(120421154)
				local var_632_4 = arg_629_1:FormatText(var_632_3.content)

				arg_629_1.text_.text = var_632_4

				LuaForUtil.ClearLinePrefixSymbol(arg_629_1.text_)

				local var_632_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421154", "story_v_out_120421.awb") ~= 0 then
					local var_632_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421154", "story_v_out_120421.awb") / 1000

					if var_632_8 + var_632_0 > arg_629_1.duration_ then
						arg_629_1.duration_ = var_632_8 + var_632_0
					end

					if var_632_3.prefab_name ~= "" and arg_629_1.actors_[var_632_3.prefab_name] ~= nil then
						local var_632_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_629_1.actors_[var_632_3.prefab_name].transform, "story_v_out_120421", "120421154", "story_v_out_120421.awb")

						arg_629_1:RecordAudio("120421154", var_632_9)
						arg_629_1:RecordAudio("120421154", var_632_9)
					else
						arg_629_1:AudioAction("play", "voice", "story_v_out_120421", "120421154", "story_v_out_120421.awb")
					end

					arg_629_1:RecordHistoryTalkVoice("story_v_out_120421", "120421154", "story_v_out_120421.awb")
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
	Play120421155 = function(arg_633_0, arg_633_1)
		arg_633_1.time_ = 0
		arg_633_1.frameCnt_ = 0
		arg_633_1.state_ = "playing"
		arg_633_1.curTalkId_ = 120421155
		arg_633_1.duration_ = 3.933

		local var_633_0 = {
			zh = 2.933,
			ja = 3.933
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
				arg_633_0:Play120421156(arg_633_1)
			end
		end

		function arg_633_1.onSingleLineUpdate_(arg_636_0)
			local var_636_0 = arg_633_1.actors_["1074ui_story"]
			local var_636_1 = 0

			if var_636_1 < arg_633_1.time_ and arg_633_1.time_ <= var_636_1 + arg_636_0 and arg_633_1.var_.characterEffect1074ui_story == nil then
				arg_633_1.var_.characterEffect1074ui_story = var_636_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_636_2 = 0.2

			if var_636_1 <= arg_633_1.time_ and arg_633_1.time_ < var_636_1 + var_636_2 then
				local var_636_3 = (arg_633_1.time_ - var_636_1) / var_636_2

				if arg_633_1.var_.characterEffect1074ui_story then
					local var_636_4 = Mathf.Lerp(0, 0.5, var_636_3)

					arg_633_1.var_.characterEffect1074ui_story.fillFlat = true
					arg_633_1.var_.characterEffect1074ui_story.fillRatio = var_636_4
				end
			end

			if arg_633_1.time_ >= var_636_1 + var_636_2 and arg_633_1.time_ < var_636_1 + var_636_2 + arg_636_0 and arg_633_1.var_.characterEffect1074ui_story then
				local var_636_5 = 0.5

				arg_633_1.var_.characterEffect1074ui_story.fillFlat = true
				arg_633_1.var_.characterEffect1074ui_story.fillRatio = var_636_5
			end

			local var_636_6 = 0
			local var_636_7 = 0.3

			if var_636_6 < arg_633_1.time_ and arg_633_1.time_ <= var_636_6 + arg_636_0 then
				arg_633_1.talkMaxDuration = 0
				arg_633_1.dialogCg_.alpha = 1

				arg_633_1.dialog_:SetActive(true)
				SetActive(arg_633_1.leftNameGo_, true)

				local var_636_8 = arg_633_1:FormatText(StoryNameCfg[379].name)

				arg_633_1.leftNameTxt_.text = var_636_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_633_1.leftNameTxt_.transform)

				arg_633_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_633_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_633_1:RecordName(arg_633_1.leftNameTxt_.text)
				SetActive(arg_633_1.iconTrs_.gameObject, true)
				arg_633_1.iconController_:SetSelectedState("hero")

				arg_633_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1072")

				arg_633_1.callingController_:SetSelectedState("normal")

				local var_636_9 = arg_633_1:GetWordFromCfg(120421155)
				local var_636_10 = arg_633_1:FormatText(var_636_9.content)

				arg_633_1.text_.text = var_636_10

				LuaForUtil.ClearLinePrefixSymbol(arg_633_1.text_)

				local var_636_11 = 12
				local var_636_12 = utf8.len(var_636_10)
				local var_636_13 = var_636_11 <= 0 and var_636_7 or var_636_7 * (var_636_12 / var_636_11)

				if var_636_13 > 0 and var_636_7 < var_636_13 then
					arg_633_1.talkMaxDuration = var_636_13

					if var_636_13 + var_636_6 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_13 + var_636_6
					end
				end

				arg_633_1.text_.text = var_636_10
				arg_633_1.typewritter.percent = 0

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421155", "story_v_out_120421.awb") ~= 0 then
					local var_636_14 = manager.audio:GetVoiceLength("story_v_out_120421", "120421155", "story_v_out_120421.awb") / 1000

					if var_636_14 + var_636_6 > arg_633_1.duration_ then
						arg_633_1.duration_ = var_636_14 + var_636_6
					end

					if var_636_9.prefab_name ~= "" and arg_633_1.actors_[var_636_9.prefab_name] ~= nil then
						local var_636_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_633_1.actors_[var_636_9.prefab_name].transform, "story_v_out_120421", "120421155", "story_v_out_120421.awb")

						arg_633_1:RecordAudio("120421155", var_636_15)
						arg_633_1:RecordAudio("120421155", var_636_15)
					else
						arg_633_1:AudioAction("play", "voice", "story_v_out_120421", "120421155", "story_v_out_120421.awb")
					end

					arg_633_1:RecordHistoryTalkVoice("story_v_out_120421", "120421155", "story_v_out_120421.awb")
				end

				arg_633_1:RecordContent(arg_633_1.text_.text)
			end

			local var_636_16 = math.max(var_636_7, arg_633_1.talkMaxDuration)

			if var_636_6 <= arg_633_1.time_ and arg_633_1.time_ < var_636_6 + var_636_16 then
				arg_633_1.typewritter.percent = (arg_633_1.time_ - var_636_6) / var_636_16

				arg_633_1.typewritter:SetDirty()
			end

			if arg_633_1.time_ >= var_636_6 + var_636_16 and arg_633_1.time_ < var_636_6 + var_636_16 + arg_636_0 then
				arg_633_1.typewritter.percent = 1

				arg_633_1.typewritter:SetDirty()
				arg_633_1:ShowNextGo(true)
			end
		end
	end,
	Play120421156 = function(arg_637_0, arg_637_1)
		arg_637_1.time_ = 0
		arg_637_1.frameCnt_ = 0
		arg_637_1.state_ = "playing"
		arg_637_1.curTalkId_ = 120421156
		arg_637_1.duration_ = 8.1

		local var_637_0 = {
			zh = 4.433,
			ja = 8.1
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
				arg_637_0:Play120421157(arg_637_1)
			end
		end

		function arg_637_1.onSingleLineUpdate_(arg_640_0)
			local var_640_0 = arg_637_1.actors_["1076ui_story"]
			local var_640_1 = 0

			if var_640_1 < arg_637_1.time_ and arg_637_1.time_ <= var_640_1 + arg_640_0 and arg_637_1.var_.characterEffect1076ui_story == nil then
				arg_637_1.var_.characterEffect1076ui_story = var_640_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_640_2 = 0.2

			if var_640_1 <= arg_637_1.time_ and arg_637_1.time_ < var_640_1 + var_640_2 then
				local var_640_3 = (arg_637_1.time_ - var_640_1) / var_640_2

				if arg_637_1.var_.characterEffect1076ui_story then
					arg_637_1.var_.characterEffect1076ui_story.fillFlat = false
				end
			end

			if arg_637_1.time_ >= var_640_1 + var_640_2 and arg_637_1.time_ < var_640_1 + var_640_2 + arg_640_0 and arg_637_1.var_.characterEffect1076ui_story then
				arg_637_1.var_.characterEffect1076ui_story.fillFlat = false
			end

			local var_640_4 = 0
			local var_640_5 = 0.35

			if var_640_4 < arg_637_1.time_ and arg_637_1.time_ <= var_640_4 + arg_640_0 then
				arg_637_1.talkMaxDuration = 0
				arg_637_1.dialogCg_.alpha = 1

				arg_637_1.dialog_:SetActive(true)
				SetActive(arg_637_1.leftNameGo_, true)

				local var_640_6 = arg_637_1:FormatText(StoryNameCfg[389].name)

				arg_637_1.leftNameTxt_.text = var_640_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_637_1.leftNameTxt_.transform)

				arg_637_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_637_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_637_1:RecordName(arg_637_1.leftNameTxt_.text)
				SetActive(arg_637_1.iconTrs_.gameObject, false)
				arg_637_1.callingController_:SetSelectedState("normal")

				local var_640_7 = arg_637_1:GetWordFromCfg(120421156)
				local var_640_8 = arg_637_1:FormatText(var_640_7.content)

				arg_637_1.text_.text = var_640_8

				LuaForUtil.ClearLinePrefixSymbol(arg_637_1.text_)

				local var_640_9 = 14
				local var_640_10 = utf8.len(var_640_8)
				local var_640_11 = var_640_9 <= 0 and var_640_5 or var_640_5 * (var_640_10 / var_640_9)

				if var_640_11 > 0 and var_640_5 < var_640_11 then
					arg_637_1.talkMaxDuration = var_640_11

					if var_640_11 + var_640_4 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_11 + var_640_4
					end
				end

				arg_637_1.text_.text = var_640_8
				arg_637_1.typewritter.percent = 0

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421156", "story_v_out_120421.awb") ~= 0 then
					local var_640_12 = manager.audio:GetVoiceLength("story_v_out_120421", "120421156", "story_v_out_120421.awb") / 1000

					if var_640_12 + var_640_4 > arg_637_1.duration_ then
						arg_637_1.duration_ = var_640_12 + var_640_4
					end

					if var_640_7.prefab_name ~= "" and arg_637_1.actors_[var_640_7.prefab_name] ~= nil then
						local var_640_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_637_1.actors_[var_640_7.prefab_name].transform, "story_v_out_120421", "120421156", "story_v_out_120421.awb")

						arg_637_1:RecordAudio("120421156", var_640_13)
						arg_637_1:RecordAudio("120421156", var_640_13)
					else
						arg_637_1:AudioAction("play", "voice", "story_v_out_120421", "120421156", "story_v_out_120421.awb")
					end

					arg_637_1:RecordHistoryTalkVoice("story_v_out_120421", "120421156", "story_v_out_120421.awb")
				end

				arg_637_1:RecordContent(arg_637_1.text_.text)
			end

			local var_640_14 = math.max(var_640_5, arg_637_1.talkMaxDuration)

			if var_640_4 <= arg_637_1.time_ and arg_637_1.time_ < var_640_4 + var_640_14 then
				arg_637_1.typewritter.percent = (arg_637_1.time_ - var_640_4) / var_640_14

				arg_637_1.typewritter:SetDirty()
			end

			if arg_637_1.time_ >= var_640_4 + var_640_14 and arg_637_1.time_ < var_640_4 + var_640_14 + arg_640_0 then
				arg_637_1.typewritter.percent = 1

				arg_637_1.typewritter:SetDirty()
				arg_637_1:ShowNextGo(true)
			end
		end
	end,
	Play120421157 = function(arg_641_0, arg_641_1)
		arg_641_1.time_ = 0
		arg_641_1.frameCnt_ = 0
		arg_641_1.state_ = "playing"
		arg_641_1.curTalkId_ = 120421157
		arg_641_1.duration_ = 10.733

		local var_641_0 = {
			zh = 6.233,
			ja = 10.733
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
			arg_641_1.auto_ = false
		end

		function arg_641_1.playNext_(arg_643_0)
			arg_641_1.onStoryFinished_()
		end

		function arg_641_1.onSingleLineUpdate_(arg_644_0)
			local var_644_0 = 0
			local var_644_1 = 0.7

			if var_644_0 < arg_641_1.time_ and arg_641_1.time_ <= var_644_0 + arg_644_0 then
				arg_641_1.talkMaxDuration = 0
				arg_641_1.dialogCg_.alpha = 1

				arg_641_1.dialog_:SetActive(true)
				SetActive(arg_641_1.leftNameGo_, true)

				local var_644_2 = arg_641_1:FormatText(StoryNameCfg[389].name)

				arg_641_1.leftNameTxt_.text = var_644_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_641_1.leftNameTxt_.transform)

				arg_641_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_641_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_641_1:RecordName(arg_641_1.leftNameTxt_.text)
				SetActive(arg_641_1.iconTrs_.gameObject, false)
				arg_641_1.callingController_:SetSelectedState("normal")

				local var_644_3 = arg_641_1:GetWordFromCfg(120421157)
				local var_644_4 = arg_641_1:FormatText(var_644_3.content)

				arg_641_1.text_.text = var_644_4

				LuaForUtil.ClearLinePrefixSymbol(arg_641_1.text_)

				local var_644_5 = 28
				local var_644_6 = utf8.len(var_644_4)
				local var_644_7 = var_644_5 <= 0 and var_644_1 or var_644_1 * (var_644_6 / var_644_5)

				if var_644_7 > 0 and var_644_1 < var_644_7 then
					arg_641_1.talkMaxDuration = var_644_7

					if var_644_7 + var_644_0 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_7 + var_644_0
					end
				end

				arg_641_1.text_.text = var_644_4
				arg_641_1.typewritter.percent = 0

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_120421", "120421157", "story_v_out_120421.awb") ~= 0 then
					local var_644_8 = manager.audio:GetVoiceLength("story_v_out_120421", "120421157", "story_v_out_120421.awb") / 1000

					if var_644_8 + var_644_0 > arg_641_1.duration_ then
						arg_641_1.duration_ = var_644_8 + var_644_0
					end

					if var_644_3.prefab_name ~= "" and arg_641_1.actors_[var_644_3.prefab_name] ~= nil then
						local var_644_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_641_1.actors_[var_644_3.prefab_name].transform, "story_v_out_120421", "120421157", "story_v_out_120421.awb")

						arg_641_1:RecordAudio("120421157", var_644_9)
						arg_641_1:RecordAudio("120421157", var_644_9)
					else
						arg_641_1:AudioAction("play", "voice", "story_v_out_120421", "120421157", "story_v_out_120421.awb")
					end

					arg_641_1:RecordHistoryTalkVoice("story_v_out_120421", "120421157", "story_v_out_120421.awb")
				end

				arg_641_1:RecordContent(arg_641_1.text_.text)
			end

			local var_644_10 = math.max(var_644_1, arg_641_1.talkMaxDuration)

			if var_644_0 <= arg_641_1.time_ and arg_641_1.time_ < var_644_0 + var_644_10 then
				arg_641_1.typewritter.percent = (arg_641_1.time_ - var_644_0) / var_644_10

				arg_641_1.typewritter:SetDirty()
			end

			if arg_641_1.time_ >= var_644_0 + var_644_10 and arg_641_1.time_ < var_644_0 + var_644_10 + arg_644_0 then
				arg_641_1.typewritter.percent = 1

				arg_641_1.typewritter:SetDirty()
				arg_641_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/XH0204",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST37",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST29",
		"Assets/UIResources/UI_AB/TextureConfig/Background/ST31"
	},
	voices = {
		"story_v_out_120421.awb"
	}
}
