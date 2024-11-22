return {
	Play318202001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 318202001
		arg_1_1.duration_ = 5.6

		local var_1_0 = {
			zh = 4.833,
			ja = 5.6
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
				arg_1_0:Play318202002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "K07f"

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
				local var_4_5 = arg_1_1.bgs_.K07f

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
					if iter_4_0 ~= "K07f" then
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
			local var_4_23 = 0.533333333333333

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				local var_4_24 = "play"
				local var_4_25 = "music"

				arg_1_1:AudioAction(var_4_24, var_4_25, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_26 = 0.8
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "music"

				arg_1_1:AudioAction(var_4_28, var_4_29, "bgm_activity_2_4_story_wall", "bgm_activity_2_4_story_wall", "bgm_activity_2_4_story_wall.awb")
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

				local var_4_33 = arg_1_1:FormatText(StoryNameCfg[495].name)

				arg_1_1.leftNameTxt_.text = var_4_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_1_1.leftNameTxt_.transform)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1.leftNameTxt_.text)
				SetActive(arg_1_1.iconTrs_.gameObject, true)
				arg_1_1.iconController_:SetSelectedState("hero")

				arg_1_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzab")

				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_34 = arg_1_1:GetWordFromCfg(318202001)
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202001", "story_v_out_318202.awb") ~= 0 then
					local var_4_39 = manager.audio:GetVoiceLength("story_v_out_318202", "318202001", "story_v_out_318202.awb") / 1000

					if var_4_39 + var_4_30 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_39 + var_4_30
					end

					if var_4_34.prefab_name ~= "" and arg_1_1.actors_[var_4_34.prefab_name] ~= nil then
						local var_4_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_1_1.actors_[var_4_34.prefab_name].transform, "story_v_out_318202", "318202001", "story_v_out_318202.awb")

						arg_1_1:RecordAudio("318202001", var_4_40)
						arg_1_1:RecordAudio("318202001", var_4_40)
					else
						arg_1_1:AudioAction("play", "voice", "story_v_out_318202", "318202001", "story_v_out_318202.awb")
					end

					arg_1_1:RecordHistoryTalkVoice("story_v_out_318202", "318202001", "story_v_out_318202.awb")
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
	Play318202002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 318202002
		arg_7_1.duration_ = 3.066

		local var_7_0 = {
			zh = 3.066,
			ja = 1.833
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
				arg_7_0:Play318202003(arg_7_1)
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

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[655].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, true)
				arg_7_1.iconController_:SetSelectedState("hero")

				arg_7_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_c")

				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(318202002)
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202002", "story_v_out_318202.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202002", "story_v_out_318202.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_318202", "318202002", "story_v_out_318202.awb")

						arg_7_1:RecordAudio("318202002", var_10_9)
						arg_7_1:RecordAudio("318202002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_318202", "318202002", "story_v_out_318202.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_318202", "318202002", "story_v_out_318202.awb")
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
	Play318202003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 318202003
		arg_11_1.duration_ = 4.7

		local var_11_0 = {
			zh = 3.9,
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
				arg_11_0:Play318202004(arg_11_1)
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
			local var_14_9 = 0.575

			if var_14_8 < arg_11_1.time_ and arg_11_1.time_ <= var_14_8 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_10 = arg_11_1:FormatText(StoryNameCfg[495].name)

				arg_11_1.leftNameTxt_.text = var_14_10

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzab")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_11 = arg_11_1:GetWordFromCfg(318202003)
				local var_14_12 = arg_11_1:FormatText(var_14_11.content)

				arg_11_1.text_.text = var_14_12

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_13 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202003", "story_v_out_318202.awb") ~= 0 then
					local var_14_16 = manager.audio:GetVoiceLength("story_v_out_318202", "318202003", "story_v_out_318202.awb") / 1000

					if var_14_16 + var_14_8 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_16 + var_14_8
					end

					if var_14_11.prefab_name ~= "" and arg_11_1.actors_[var_14_11.prefab_name] ~= nil then
						local var_14_17 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_11.prefab_name].transform, "story_v_out_318202", "318202003", "story_v_out_318202.awb")

						arg_11_1:RecordAudio("318202003", var_14_17)
						arg_11_1:RecordAudio("318202003", var_14_17)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_318202", "318202003", "story_v_out_318202.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_318202", "318202003", "story_v_out_318202.awb")
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
	Play318202004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 318202004
		arg_15_1.duration_ = 2.366

		local var_15_0 = {
			zh = 2.033,
			ja = 2.366
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
				arg_15_0:Play318202005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.125

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[655].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_c")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(318202004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 5
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202004", "story_v_out_318202.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202004", "story_v_out_318202.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_318202", "318202004", "story_v_out_318202.awb")

						arg_15_1:RecordAudio("318202004", var_18_9)
						arg_15_1:RecordAudio("318202004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_318202", "318202004", "story_v_out_318202.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_318202", "318202004", "story_v_out_318202.awb")
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
	Play318202005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 318202005
		arg_19_1.duration_ = 9.1

		local var_19_0 = {
			zh = 5.1,
			ja = 9.1
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
				arg_19_0:Play318202006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = 0
			local var_22_1 = 0.625

			if var_22_0 < arg_19_1.time_ and arg_19_1.time_ <= var_22_0 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_2 = arg_19_1:FormatText(StoryNameCfg[495].name)

				arg_19_1.leftNameTxt_.text = var_22_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, true)
				arg_19_1.iconController_:SetSelectedState("hero")

				arg_19_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzab")

				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_3 = arg_19_1:GetWordFromCfg(318202005)
				local var_22_4 = arg_19_1:FormatText(var_22_3.content)

				arg_19_1.text_.text = var_22_4

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_5 = 25
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202005", "story_v_out_318202.awb") ~= 0 then
					local var_22_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202005", "story_v_out_318202.awb") / 1000

					if var_22_8 + var_22_0 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_8 + var_22_0
					end

					if var_22_3.prefab_name ~= "" and arg_19_1.actors_[var_22_3.prefab_name] ~= nil then
						local var_22_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_3.prefab_name].transform, "story_v_out_318202", "318202005", "story_v_out_318202.awb")

						arg_19_1:RecordAudio("318202005", var_22_9)
						arg_19_1:RecordAudio("318202005", var_22_9)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_318202", "318202005", "story_v_out_318202.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_318202", "318202005", "story_v_out_318202.awb")
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
	Play318202006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 318202006
		arg_23_1.duration_ = 4.066

		local var_23_0 = {
			zh = 2.433,
			ja = 4.066
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
				arg_23_0:Play318202007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = 0
			local var_26_1 = 0.225

			if var_26_0 < arg_23_1.time_ and arg_23_1.time_ <= var_26_0 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_2 = arg_23_1:FormatText(StoryNameCfg[655].name)

				arg_23_1.leftNameTxt_.text = var_26_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_c")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_3 = arg_23_1:GetWordFromCfg(318202006)
				local var_26_4 = arg_23_1:FormatText(var_26_3.content)

				arg_23_1.text_.text = var_26_4

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_5 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202006", "story_v_out_318202.awb") ~= 0 then
					local var_26_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202006", "story_v_out_318202.awb") / 1000

					if var_26_8 + var_26_0 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_8 + var_26_0
					end

					if var_26_3.prefab_name ~= "" and arg_23_1.actors_[var_26_3.prefab_name] ~= nil then
						local var_26_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_3.prefab_name].transform, "story_v_out_318202", "318202006", "story_v_out_318202.awb")

						arg_23_1:RecordAudio("318202006", var_26_9)
						arg_23_1:RecordAudio("318202006", var_26_9)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_318202", "318202006", "story_v_out_318202.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_318202", "318202006", "story_v_out_318202.awb")
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
	Play318202007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 318202007
		arg_27_1.duration_ = 2.2

		local var_27_0 = {
			zh = 1.5,
			ja = 2.2
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
				arg_27_0:Play318202008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 0.1

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, true)

				local var_30_2 = arg_27_1:FormatText(StoryNameCfg[495].name)

				arg_27_1.leftNameTxt_.text = var_30_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_27_1.leftNameTxt_.transform)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1.leftNameTxt_.text)
				SetActive(arg_27_1.iconTrs_.gameObject, true)
				arg_27_1.iconController_:SetSelectedState("hero")

				arg_27_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzab")

				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_3 = arg_27_1:GetWordFromCfg(318202007)
				local var_30_4 = arg_27_1:FormatText(var_30_3.content)

				arg_27_1.text_.text = var_30_4

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202007", "story_v_out_318202.awb") ~= 0 then
					local var_30_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202007", "story_v_out_318202.awb") / 1000

					if var_30_8 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_8 + var_30_0
					end

					if var_30_3.prefab_name ~= "" and arg_27_1.actors_[var_30_3.prefab_name] ~= nil then
						local var_30_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_27_1.actors_[var_30_3.prefab_name].transform, "story_v_out_318202", "318202007", "story_v_out_318202.awb")

						arg_27_1:RecordAudio("318202007", var_30_9)
						arg_27_1:RecordAudio("318202007", var_30_9)
					else
						arg_27_1:AudioAction("play", "voice", "story_v_out_318202", "318202007", "story_v_out_318202.awb")
					end

					arg_27_1:RecordHistoryTalkVoice("story_v_out_318202", "318202007", "story_v_out_318202.awb")
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
	Play318202008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 318202008
		arg_31_1.duration_ = 2.033

		local var_31_0 = {
			zh = 2.033,
			ja = 1.566
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
				arg_31_0:Play318202009(arg_31_1)
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

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[655].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_10056_c")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(318202008)
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202008", "story_v_out_318202.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202008", "story_v_out_318202.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_318202", "318202008", "story_v_out_318202.awb")

						arg_31_1:RecordAudio("318202008", var_34_9)
						arg_31_1:RecordAudio("318202008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_318202", "318202008", "story_v_out_318202.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_318202", "318202008", "story_v_out_318202.awb")
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
	Play318202009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 318202009
		arg_35_1.duration_ = 3.2

		local var_35_0 = {
			zh = 3.2,
			ja = 3.1
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
				arg_35_0:Play318202010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = 0
			local var_38_1 = 0.175

			if var_38_0 < arg_35_1.time_ and arg_35_1.time_ <= var_38_0 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_2 = arg_35_1:FormatText(StoryNameCfg[485].name)

				arg_35_1.leftNameTxt_.text = var_38_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, true)
				arg_35_1.iconController_:SetSelectedState("hero")

				arg_35_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_3 = arg_35_1:GetWordFromCfg(318202009)
				local var_38_4 = arg_35_1:FormatText(var_38_3.content)

				arg_35_1.text_.text = var_38_4

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202009", "story_v_out_318202.awb") ~= 0 then
					local var_38_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202009", "story_v_out_318202.awb") / 1000

					if var_38_8 + var_38_0 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_8 + var_38_0
					end

					if var_38_3.prefab_name ~= "" and arg_35_1.actors_[var_38_3.prefab_name] ~= nil then
						local var_38_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_3.prefab_name].transform, "story_v_out_318202", "318202009", "story_v_out_318202.awb")

						arg_35_1:RecordAudio("318202009", var_38_9)
						arg_35_1:RecordAudio("318202009", var_38_9)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_318202", "318202009", "story_v_out_318202.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_318202", "318202009", "story_v_out_318202.awb")
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
	Play318202010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 318202010
		arg_39_1.duration_ = 10.966

		local var_39_0 = {
			zh = 10.833,
			ja = 10.966
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
				arg_39_0:Play318202011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = 0
			local var_42_1 = 1.275

			if var_42_0 < arg_39_1.time_ and arg_39_1.time_ <= var_42_0 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_2 = arg_39_1:FormatText(StoryNameCfg[485].name)

				arg_39_1.leftNameTxt_.text = var_42_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_3 = arg_39_1:GetWordFromCfg(318202010)
				local var_42_4 = arg_39_1:FormatText(var_42_3.content)

				arg_39_1.text_.text = var_42_4

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202010", "story_v_out_318202.awb") ~= 0 then
					local var_42_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202010", "story_v_out_318202.awb") / 1000

					if var_42_8 + var_42_0 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_8 + var_42_0
					end

					if var_42_3.prefab_name ~= "" and arg_39_1.actors_[var_42_3.prefab_name] ~= nil then
						local var_42_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_3.prefab_name].transform, "story_v_out_318202", "318202010", "story_v_out_318202.awb")

						arg_39_1:RecordAudio("318202010", var_42_9)
						arg_39_1:RecordAudio("318202010", var_42_9)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_318202", "318202010", "story_v_out_318202.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_318202", "318202010", "story_v_out_318202.awb")
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
	Play318202011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 318202011
		arg_43_1.duration_ = 5

		SetActive(arg_43_1.tipsGo_, false)

		function arg_43_1.onSingleLineFinish_()
			arg_43_1.onSingleLineUpdate_ = nil
			arg_43_1.onSingleLineFinish_ = nil
			arg_43_1.state_ = "waiting"
		end

		function arg_43_1.playNext_(arg_45_0)
			if arg_45_0 == 1 then
				arg_43_0:Play318202012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = 0
			local var_46_1 = 1.025

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

				local var_46_2 = arg_43_1:GetWordFromCfg(318202011)
				local var_46_3 = arg_43_1:FormatText(var_46_2.content)

				arg_43_1.text_.text = var_46_3

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_4 = 41
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
	Play318202012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 318202012
		arg_47_1.duration_ = 4.966

		local var_47_0 = {
			zh = 3.7,
			ja = 4.966
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
				arg_47_0:Play318202013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = 0
			local var_50_1 = 0.375

			if var_50_0 < arg_47_1.time_ and arg_47_1.time_ <= var_50_0 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_2 = arg_47_1:FormatText(StoryNameCfg[495].name)

				arg_47_1.leftNameTxt_.text = var_50_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzab")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_3 = arg_47_1:GetWordFromCfg(318202012)
				local var_50_4 = arg_47_1:FormatText(var_50_3.content)

				arg_47_1.text_.text = var_50_4

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_5 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202012", "story_v_out_318202.awb") ~= 0 then
					local var_50_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202012", "story_v_out_318202.awb") / 1000

					if var_50_8 + var_50_0 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_8 + var_50_0
					end

					if var_50_3.prefab_name ~= "" and arg_47_1.actors_[var_50_3.prefab_name] ~= nil then
						local var_50_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_3.prefab_name].transform, "story_v_out_318202", "318202012", "story_v_out_318202.awb")

						arg_47_1:RecordAudio("318202012", var_50_9)
						arg_47_1:RecordAudio("318202012", var_50_9)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_318202", "318202012", "story_v_out_318202.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_318202", "318202012", "story_v_out_318202.awb")
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
	Play318202013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 318202013
		arg_51_1.duration_ = 6.6

		local var_51_0 = {
			zh = 5.433,
			ja = 6.6
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
				arg_51_0:Play318202014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = 0
			local var_54_1 = 0.6

			if var_54_0 < arg_51_1.time_ and arg_51_1.time_ <= var_54_0 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_2 = arg_51_1:FormatText(StoryNameCfg[485].name)

				arg_51_1.leftNameTxt_.text = var_54_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, true)
				arg_51_1.iconController_:SetSelectedState("hero")

				arg_51_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_3 = arg_51_1:GetWordFromCfg(318202013)
				local var_54_4 = arg_51_1:FormatText(var_54_3.content)

				arg_51_1.text_.text = var_54_4

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_5 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202013", "story_v_out_318202.awb") ~= 0 then
					local var_54_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202013", "story_v_out_318202.awb") / 1000

					if var_54_8 + var_54_0 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_8 + var_54_0
					end

					if var_54_3.prefab_name ~= "" and arg_51_1.actors_[var_54_3.prefab_name] ~= nil then
						local var_54_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_3.prefab_name].transform, "story_v_out_318202", "318202013", "story_v_out_318202.awb")

						arg_51_1:RecordAudio("318202013", var_54_9)
						arg_51_1:RecordAudio("318202013", var_54_9)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_318202", "318202013", "story_v_out_318202.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_318202", "318202013", "story_v_out_318202.awb")
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
	Play318202014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 318202014
		arg_55_1.duration_ = 10.133

		local var_55_0 = {
			zh = 5.866,
			ja = 10.133
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
				arg_55_0:Play318202015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = 0
			local var_58_1 = 0.525

			if var_58_0 < arg_55_1.time_ and arg_55_1.time_ <= var_58_0 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_2 = arg_55_1:FormatText(StoryNameCfg[485].name)

				arg_55_1.leftNameTxt_.text = var_58_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_3 = arg_55_1:GetWordFromCfg(318202014)
				local var_58_4 = arg_55_1:FormatText(var_58_3.content)

				arg_55_1.text_.text = var_58_4

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_5 = 21
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202014", "story_v_out_318202.awb") ~= 0 then
					local var_58_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202014", "story_v_out_318202.awb") / 1000

					if var_58_8 + var_58_0 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_8 + var_58_0
					end

					if var_58_3.prefab_name ~= "" and arg_55_1.actors_[var_58_3.prefab_name] ~= nil then
						local var_58_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_3.prefab_name].transform, "story_v_out_318202", "318202014", "story_v_out_318202.awb")

						arg_55_1:RecordAudio("318202014", var_58_9)
						arg_55_1:RecordAudio("318202014", var_58_9)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_318202", "318202014", "story_v_out_318202.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_318202", "318202014", "story_v_out_318202.awb")
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
	Play318202015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 318202015
		arg_59_1.duration_ = 5

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play318202016(arg_59_1)
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

				local var_62_2 = arg_59_1:GetWordFromCfg(318202015)
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
	Play318202016 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 318202016
		arg_63_1.duration_ = 2.833

		local var_63_0 = {
			zh = 2.766,
			ja = 2.833
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
				arg_63_0:Play318202017(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = 0
			local var_66_1 = 0.25

			if var_66_0 < arg_63_1.time_ and arg_63_1.time_ <= var_66_0 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_2 = arg_63_1:FormatText(StoryNameCfg[485].name)

				arg_63_1.leftNameTxt_.text = var_66_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_yakuzaa")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_3 = arg_63_1:GetWordFromCfg(318202016)
				local var_66_4 = arg_63_1:FormatText(var_66_3.content)

				arg_63_1.text_.text = var_66_4

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_5 = 10
				local var_66_6 = utf8.len(var_66_4)
				local var_66_7 = var_66_5 <= 0 and var_66_1 or var_66_1 * (var_66_6 / var_66_5)

				if var_66_7 > 0 and var_66_1 < var_66_7 then
					arg_63_1.talkMaxDuration = var_66_7

					if var_66_7 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_7 + var_66_0
					end
				end

				arg_63_1.text_.text = var_66_4
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202016", "story_v_out_318202.awb") ~= 0 then
					local var_66_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202016", "story_v_out_318202.awb") / 1000

					if var_66_8 + var_66_0 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_8 + var_66_0
					end

					if var_66_3.prefab_name ~= "" and arg_63_1.actors_[var_66_3.prefab_name] ~= nil then
						local var_66_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_3.prefab_name].transform, "story_v_out_318202", "318202016", "story_v_out_318202.awb")

						arg_63_1:RecordAudio("318202016", var_66_9)
						arg_63_1:RecordAudio("318202016", var_66_9)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_318202", "318202016", "story_v_out_318202.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_318202", "318202016", "story_v_out_318202.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_10 = math.max(var_66_1, arg_63_1.talkMaxDuration)

			if var_66_0 <= arg_63_1.time_ and arg_63_1.time_ < var_66_0 + var_66_10 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_0) / var_66_10

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_0 + var_66_10 and arg_63_1.time_ < var_66_0 + var_66_10 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play318202017 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 318202017
		arg_67_1.duration_ = 9

		SetActive(arg_67_1.tipsGo_, false)

		function arg_67_1.onSingleLineFinish_()
			arg_67_1.onSingleLineUpdate_ = nil
			arg_67_1.onSingleLineFinish_ = nil
			arg_67_1.state_ = "waiting"
		end

		function arg_67_1.playNext_(arg_69_0)
			if arg_69_0 == 1 then
				arg_67_0:Play318202018(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = "K05f"

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
				local var_70_5 = arg_67_1.bgs_.K05f

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
					if iter_70_0 ~= "K05f" then
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

			if arg_67_1.frameCnt_ <= 1 then
				arg_67_1.dialog_:SetActive(false)
			end

			local var_70_27 = 4
			local var_70_28 = 1.9

			if var_70_27 < arg_67_1.time_ and arg_67_1.time_ <= var_70_27 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0

				arg_67_1.dialog_:SetActive(true)

				local var_70_29 = LeanTween.value(arg_67_1.dialog_, 0, 1, 0.3)

				var_70_29:setOnUpdate(LuaHelper.FloatAction(function(arg_71_0)
					arg_67_1.dialogCg_.alpha = arg_71_0
				end))
				var_70_29:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_67_1.dialog_)
					var_70_29:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_67_1.duration_ = arg_67_1.duration_ + 0.3

				SetActive(arg_67_1.leftNameGo_, false)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_67_1.iconTrs_.gameObject, false)
				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_30 = arg_67_1:GetWordFromCfg(318202017)
				local var_70_31 = arg_67_1:FormatText(var_70_30.content)

				arg_67_1.text_.text = var_70_31

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_32 = 76
				local var_70_33 = utf8.len(var_70_31)
				local var_70_34 = var_70_32 <= 0 and var_70_28 or var_70_28 * (var_70_33 / var_70_32)

				if var_70_34 > 0 and var_70_28 < var_70_34 then
					arg_67_1.talkMaxDuration = var_70_34
					var_70_27 = var_70_27 + 0.3

					if var_70_34 + var_70_27 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_34 + var_70_27
					end
				end

				arg_67_1.text_.text = var_70_31
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)
				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_35 = var_70_27 + 0.3
			local var_70_36 = math.max(var_70_28, arg_67_1.talkMaxDuration)

			if var_70_35 <= arg_67_1.time_ and arg_67_1.time_ < var_70_35 + var_70_36 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_35) / var_70_36

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_35 + var_70_36 and arg_67_1.time_ < var_70_35 + var_70_36 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play318202018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 318202018
		arg_73_1.duration_ = 4.3

		local var_73_0 = {
			zh = 4,
			ja = 4.3
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
				arg_73_0:Play318202019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "1058ui_story"

			if arg_73_1.actors_[var_76_0] == nil then
				local var_76_1 = Object.Instantiate(Asset.Load("Char/" .. var_76_0), arg_73_1.stage_.transform)

				var_76_1.name = var_76_0
				var_76_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_73_1.actors_[var_76_0] = var_76_1

				local var_76_2 = var_76_1:GetComponentInChildren(typeof(CharacterEffect))

				var_76_2.enabled = true

				local var_76_3 = GameObjectTools.GetOrAddComponent(var_76_1, typeof(DynamicBoneHelper))

				if var_76_3 then
					var_76_3:EnableDynamicBone(false)
				end

				arg_73_1:ShowWeapon(var_76_2.transform, false)

				arg_73_1.var_[var_76_0 .. "Animator"] = var_76_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_73_1.var_[var_76_0 .. "Animator"].applyRootMotion = true
				arg_73_1.var_[var_76_0 .. "LipSync"] = var_76_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_76_4 = arg_73_1.actors_["1058ui_story"].transform
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1.var_.moveOldPos1058ui_story = var_76_4.localPosition
			end

			local var_76_6 = 0.001

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6
				local var_76_8 = Vector3.New(0, -0.95, -5.88)

				var_76_4.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1058ui_story, var_76_8, var_76_7)

				local var_76_9 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_9.x, var_76_9.y, var_76_9.z)

				local var_76_10 = var_76_4.localEulerAngles

				var_76_10.z = 0
				var_76_10.x = 0
				var_76_4.localEulerAngles = var_76_10
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 then
				var_76_4.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_4.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_4.localEulerAngles = var_76_12
			end

			local var_76_13 = arg_73_1.actors_["1058ui_story"]
			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 and arg_73_1.var_.characterEffect1058ui_story == nil then
				arg_73_1.var_.characterEffect1058ui_story = var_76_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_15 = 0.200000002980232

			if var_76_14 <= arg_73_1.time_ and arg_73_1.time_ < var_76_14 + var_76_15 then
				local var_76_16 = (arg_73_1.time_ - var_76_14) / var_76_15

				if arg_73_1.var_.characterEffect1058ui_story then
					arg_73_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_14 + var_76_15 and arg_73_1.time_ < var_76_14 + var_76_15 + arg_76_0 and arg_73_1.var_.characterEffect1058ui_story then
				arg_73_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_76_17 = 0

			if var_76_17 < arg_73_1.time_ and arg_73_1.time_ <= var_76_17 + arg_76_0 then
				arg_73_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_76_18 = 0

			if var_76_18 < arg_73_1.time_ and arg_73_1.time_ <= var_76_18 + arg_76_0 then
				arg_73_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_76_19 = 0
			local var_76_20 = 0.475

			if var_76_19 < arg_73_1.time_ and arg_73_1.time_ <= var_76_19 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_21 = arg_73_1:FormatText(StoryNameCfg[92].name)

				arg_73_1.leftNameTxt_.text = var_76_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_22 = arg_73_1:GetWordFromCfg(318202018)
				local var_76_23 = arg_73_1:FormatText(var_76_22.content)

				arg_73_1.text_.text = var_76_23

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_24 = 19
				local var_76_25 = utf8.len(var_76_23)
				local var_76_26 = var_76_24 <= 0 and var_76_20 or var_76_20 * (var_76_25 / var_76_24)

				if var_76_26 > 0 and var_76_20 < var_76_26 then
					arg_73_1.talkMaxDuration = var_76_26

					if var_76_26 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_26 + var_76_19
					end
				end

				arg_73_1.text_.text = var_76_23
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202018", "story_v_out_318202.awb") ~= 0 then
					local var_76_27 = manager.audio:GetVoiceLength("story_v_out_318202", "318202018", "story_v_out_318202.awb") / 1000

					if var_76_27 + var_76_19 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_27 + var_76_19
					end

					if var_76_22.prefab_name ~= "" and arg_73_1.actors_[var_76_22.prefab_name] ~= nil then
						local var_76_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_22.prefab_name].transform, "story_v_out_318202", "318202018", "story_v_out_318202.awb")

						arg_73_1:RecordAudio("318202018", var_76_28)
						arg_73_1:RecordAudio("318202018", var_76_28)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_318202", "318202018", "story_v_out_318202.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_318202", "318202018", "story_v_out_318202.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_29 = math.max(var_76_20, arg_73_1.talkMaxDuration)

			if var_76_19 <= arg_73_1.time_ and arg_73_1.time_ < var_76_19 + var_76_29 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_19) / var_76_29

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_19 + var_76_29 and arg_73_1.time_ < var_76_19 + var_76_29 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play318202019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 318202019
		arg_77_1.duration_ = 3.5

		local var_77_0 = {
			zh = 3.5,
			ja = 3.033
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
				arg_77_0:Play318202020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["1058ui_story"].transform
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 then
				arg_77_1.var_.moveOldPos1058ui_story = var_80_0.localPosition
			end

			local var_80_2 = 0.001

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2
				local var_80_4 = Vector3.New(0, -0.95, -5.88)

				var_80_0.localPosition = Vector3.Lerp(arg_77_1.var_.moveOldPos1058ui_story, var_80_4, var_80_3)

				local var_80_5 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_5.x, var_80_5.y, var_80_5.z)

				local var_80_6 = var_80_0.localEulerAngles

				var_80_6.z = 0
				var_80_6.x = 0
				var_80_0.localEulerAngles = var_80_6
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 then
				var_80_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_80_7 = manager.ui.mainCamera.transform.position - var_80_0.position

				var_80_0.forward = Vector3.New(var_80_7.x, var_80_7.y, var_80_7.z)

				local var_80_8 = var_80_0.localEulerAngles

				var_80_8.z = 0
				var_80_8.x = 0
				var_80_0.localEulerAngles = var_80_8
			end

			local var_80_9 = arg_77_1.actors_["1058ui_story"]
			local var_80_10 = 0

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 and arg_77_1.var_.characterEffect1058ui_story == nil then
				arg_77_1.var_.characterEffect1058ui_story = var_80_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_11 = 0.200000002980232

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_11 then
				local var_80_12 = (arg_77_1.time_ - var_80_10) / var_80_11

				if arg_77_1.var_.characterEffect1058ui_story then
					arg_77_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_10 + var_80_11 and arg_77_1.time_ < var_80_10 + var_80_11 + arg_80_0 and arg_77_1.var_.characterEffect1058ui_story then
				arg_77_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_80_13 = 0

			if var_80_13 < arg_77_1.time_ and arg_77_1.time_ <= var_80_13 + arg_80_0 then
				arg_77_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action1_1")
			end

			local var_80_14 = 0

			if var_80_14 < arg_77_1.time_ and arg_77_1.time_ <= var_80_14 + arg_80_0 then
				arg_77_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_80_15 = 0
			local var_80_16 = 0.575

			if var_80_15 < arg_77_1.time_ and arg_77_1.time_ <= var_80_15 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_17 = arg_77_1:FormatText(StoryNameCfg[92].name)

				arg_77_1.leftNameTxt_.text = var_80_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_18 = arg_77_1:GetWordFromCfg(318202019)
				local var_80_19 = arg_77_1:FormatText(var_80_18.content)

				arg_77_1.text_.text = var_80_19

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_20 = 23
				local var_80_21 = utf8.len(var_80_19)
				local var_80_22 = var_80_20 <= 0 and var_80_16 or var_80_16 * (var_80_21 / var_80_20)

				if var_80_22 > 0 and var_80_16 < var_80_22 then
					arg_77_1.talkMaxDuration = var_80_22

					if var_80_22 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_22 + var_80_15
					end
				end

				arg_77_1.text_.text = var_80_19
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202019", "story_v_out_318202.awb") ~= 0 then
					local var_80_23 = manager.audio:GetVoiceLength("story_v_out_318202", "318202019", "story_v_out_318202.awb") / 1000

					if var_80_23 + var_80_15 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_23 + var_80_15
					end

					if var_80_18.prefab_name ~= "" and arg_77_1.actors_[var_80_18.prefab_name] ~= nil then
						local var_80_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_18.prefab_name].transform, "story_v_out_318202", "318202019", "story_v_out_318202.awb")

						arg_77_1:RecordAudio("318202019", var_80_24)
						arg_77_1:RecordAudio("318202019", var_80_24)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_318202", "318202019", "story_v_out_318202.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_318202", "318202019", "story_v_out_318202.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_25 = math.max(var_80_16, arg_77_1.talkMaxDuration)

			if var_80_15 <= arg_77_1.time_ and arg_77_1.time_ < var_80_15 + var_80_25 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_15) / var_80_25

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_15 + var_80_25 and arg_77_1.time_ < var_80_15 + var_80_25 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play318202020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 318202020
		arg_81_1.duration_ = 4.3

		local var_81_0 = {
			zh = 3.2,
			ja = 4.3
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
				arg_81_0:Play318202021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["1058ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect1058ui_story == nil then
				arg_81_1.var_.characterEffect1058ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect1058ui_story then
					local var_84_4 = Mathf.Lerp(0, 0.5, var_84_3)

					arg_81_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1058ui_story.fillRatio = var_84_4
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect1058ui_story then
				local var_84_5 = 0.5

				arg_81_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1058ui_story.fillRatio = var_84_5
			end

			local var_84_6 = 0
			local var_84_7 = 0.45

			if var_84_6 < arg_81_1.time_ and arg_81_1.time_ <= var_84_6 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_8 = arg_81_1:FormatText(StoryNameCfg[523].name)

				arg_81_1.leftNameTxt_.text = var_84_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, true)
				arg_81_1.iconController_:SetSelectedState("hero")

				arg_81_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2095")

				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_9 = arg_81_1:GetWordFromCfg(318202020)
				local var_84_10 = arg_81_1:FormatText(var_84_9.content)

				arg_81_1.text_.text = var_84_10

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_11 = 18
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202020", "story_v_out_318202.awb") ~= 0 then
					local var_84_14 = manager.audio:GetVoiceLength("story_v_out_318202", "318202020", "story_v_out_318202.awb") / 1000

					if var_84_14 + var_84_6 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_14 + var_84_6
					end

					if var_84_9.prefab_name ~= "" and arg_81_1.actors_[var_84_9.prefab_name] ~= nil then
						local var_84_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_9.prefab_name].transform, "story_v_out_318202", "318202020", "story_v_out_318202.awb")

						arg_81_1:RecordAudio("318202020", var_84_15)
						arg_81_1:RecordAudio("318202020", var_84_15)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_318202", "318202020", "story_v_out_318202.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_318202", "318202020", "story_v_out_318202.awb")
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
	Play318202021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 318202021
		arg_85_1.duration_ = 5

		SetActive(arg_85_1.tipsGo_, false)

		function arg_85_1.onSingleLineFinish_()
			arg_85_1.onSingleLineUpdate_ = nil
			arg_85_1.onSingleLineFinish_ = nil
			arg_85_1.state_ = "waiting"
		end

		function arg_85_1.playNext_(arg_87_0)
			if arg_87_0 == 1 then
				arg_85_0:Play318202022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0
			local var_88_1 = 0.533333333333333

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				local var_88_2 = "play"
				local var_88_3 = "effect"

				arg_85_1:AudioAction(var_88_2, var_88_3, "se_story_1211", "se_story_1211_fall", "")
			end

			local var_88_4 = 0
			local var_88_5 = 1.125

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

				local var_88_6 = arg_85_1:GetWordFromCfg(318202021)
				local var_88_7 = arg_85_1:FormatText(var_88_6.content)

				arg_85_1.text_.text = var_88_7

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_8 = 45
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
	Play318202022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 318202022
		arg_89_1.duration_ = 9.5

		local var_89_0 = {
			zh = 9.5,
			ja = 6.033
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
				arg_89_0:Play318202023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = "10053ui_story"

			if arg_89_1.actors_[var_92_0] == nil then
				local var_92_1 = Object.Instantiate(Asset.Load("Char/" .. var_92_0), arg_89_1.stage_.transform)

				var_92_1.name = var_92_0
				var_92_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_89_1.actors_[var_92_0] = var_92_1

				local var_92_2 = var_92_1:GetComponentInChildren(typeof(CharacterEffect))

				var_92_2.enabled = true

				local var_92_3 = GameObjectTools.GetOrAddComponent(var_92_1, typeof(DynamicBoneHelper))

				if var_92_3 then
					var_92_3:EnableDynamicBone(false)
				end

				arg_89_1:ShowWeapon(var_92_2.transform, false)

				arg_89_1.var_[var_92_0 .. "Animator"] = var_92_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_89_1.var_[var_92_0 .. "Animator"].applyRootMotion = true
				arg_89_1.var_[var_92_0 .. "LipSync"] = var_92_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_92_4 = arg_89_1.actors_["10053ui_story"].transform
			local var_92_5 = 0

			if var_92_5 < arg_89_1.time_ and arg_89_1.time_ <= var_92_5 + arg_92_0 then
				arg_89_1.var_.moveOldPos10053ui_story = var_92_4.localPosition
			end

			local var_92_6 = 0.001

			if var_92_5 <= arg_89_1.time_ and arg_89_1.time_ < var_92_5 + var_92_6 then
				local var_92_7 = (arg_89_1.time_ - var_92_5) / var_92_6
				local var_92_8 = Vector3.New(0.7, -1.12, -5.99)

				var_92_4.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos10053ui_story, var_92_8, var_92_7)

				local var_92_9 = manager.ui.mainCamera.transform.position - var_92_4.position

				var_92_4.forward = Vector3.New(var_92_9.x, var_92_9.y, var_92_9.z)

				local var_92_10 = var_92_4.localEulerAngles

				var_92_10.z = 0
				var_92_10.x = 0
				var_92_4.localEulerAngles = var_92_10
			end

			if arg_89_1.time_ >= var_92_5 + var_92_6 and arg_89_1.time_ < var_92_5 + var_92_6 + arg_92_0 then
				var_92_4.localPosition = Vector3.New(0.7, -1.12, -5.99)

				local var_92_11 = manager.ui.mainCamera.transform.position - var_92_4.position

				var_92_4.forward = Vector3.New(var_92_11.x, var_92_11.y, var_92_11.z)

				local var_92_12 = var_92_4.localEulerAngles

				var_92_12.z = 0
				var_92_12.x = 0
				var_92_4.localEulerAngles = var_92_12
			end

			local var_92_13 = arg_89_1.actors_["10053ui_story"]
			local var_92_14 = 0

			if var_92_14 < arg_89_1.time_ and arg_89_1.time_ <= var_92_14 + arg_92_0 and arg_89_1.var_.characterEffect10053ui_story == nil then
				arg_89_1.var_.characterEffect10053ui_story = var_92_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_15 = 0.200000002980232

			if var_92_14 <= arg_89_1.time_ and arg_89_1.time_ < var_92_14 + var_92_15 then
				local var_92_16 = (arg_89_1.time_ - var_92_14) / var_92_15

				if arg_89_1.var_.characterEffect10053ui_story then
					arg_89_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_14 + var_92_15 and arg_89_1.time_ < var_92_14 + var_92_15 + arg_92_0 and arg_89_1.var_.characterEffect10053ui_story then
				arg_89_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_92_17 = 0

			if var_92_17 < arg_89_1.time_ and arg_89_1.time_ <= var_92_17 + arg_92_0 then
				arg_89_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_92_18 = 0

			if var_92_18 < arg_89_1.time_ and arg_89_1.time_ <= var_92_18 + arg_92_0 then
				arg_89_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_92_19 = arg_89_1.actors_["1058ui_story"].transform
			local var_92_20 = 0

			if var_92_20 < arg_89_1.time_ and arg_89_1.time_ <= var_92_20 + arg_92_0 then
				arg_89_1.var_.moveOldPos1058ui_story = var_92_19.localPosition
			end

			local var_92_21 = 0.001

			if var_92_20 <= arg_89_1.time_ and arg_89_1.time_ < var_92_20 + var_92_21 then
				local var_92_22 = (arg_89_1.time_ - var_92_20) / var_92_21
				local var_92_23 = Vector3.New(-0.7, -0.95, -5.88)

				var_92_19.localPosition = Vector3.Lerp(arg_89_1.var_.moveOldPos1058ui_story, var_92_23, var_92_22)

				local var_92_24 = manager.ui.mainCamera.transform.position - var_92_19.position

				var_92_19.forward = Vector3.New(var_92_24.x, var_92_24.y, var_92_24.z)

				local var_92_25 = var_92_19.localEulerAngles

				var_92_25.z = 0
				var_92_25.x = 0
				var_92_19.localEulerAngles = var_92_25
			end

			if arg_89_1.time_ >= var_92_20 + var_92_21 and arg_89_1.time_ < var_92_20 + var_92_21 + arg_92_0 then
				var_92_19.localPosition = Vector3.New(-0.7, -0.95, -5.88)

				local var_92_26 = manager.ui.mainCamera.transform.position - var_92_19.position

				var_92_19.forward = Vector3.New(var_92_26.x, var_92_26.y, var_92_26.z)

				local var_92_27 = var_92_19.localEulerAngles

				var_92_27.z = 0
				var_92_27.x = 0
				var_92_19.localEulerAngles = var_92_27
			end

			local var_92_28 = 0
			local var_92_29 = 0.625

			if var_92_28 < arg_89_1.time_ and arg_89_1.time_ <= var_92_28 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_30 = arg_89_1:FormatText(StoryNameCfg[477].name)

				arg_89_1.leftNameTxt_.text = var_92_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_31 = arg_89_1:GetWordFromCfg(318202022)
				local var_92_32 = arg_89_1:FormatText(var_92_31.content)

				arg_89_1.text_.text = var_92_32

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_33 = 25
				local var_92_34 = utf8.len(var_92_32)
				local var_92_35 = var_92_33 <= 0 and var_92_29 or var_92_29 * (var_92_34 / var_92_33)

				if var_92_35 > 0 and var_92_29 < var_92_35 then
					arg_89_1.talkMaxDuration = var_92_35

					if var_92_35 + var_92_28 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_35 + var_92_28
					end
				end

				arg_89_1.text_.text = var_92_32
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202022", "story_v_out_318202.awb") ~= 0 then
					local var_92_36 = manager.audio:GetVoiceLength("story_v_out_318202", "318202022", "story_v_out_318202.awb") / 1000

					if var_92_36 + var_92_28 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_36 + var_92_28
					end

					if var_92_31.prefab_name ~= "" and arg_89_1.actors_[var_92_31.prefab_name] ~= nil then
						local var_92_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_31.prefab_name].transform, "story_v_out_318202", "318202022", "story_v_out_318202.awb")

						arg_89_1:RecordAudio("318202022", var_92_37)
						arg_89_1:RecordAudio("318202022", var_92_37)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_318202", "318202022", "story_v_out_318202.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_318202", "318202022", "story_v_out_318202.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_38 = math.max(var_92_29, arg_89_1.talkMaxDuration)

			if var_92_28 <= arg_89_1.time_ and arg_89_1.time_ < var_92_28 + var_92_38 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_28) / var_92_38

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_28 + var_92_38 and arg_89_1.time_ < var_92_28 + var_92_38 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play318202023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 318202023
		arg_93_1.duration_ = 3.633

		local var_93_0 = {
			zh = 2.433,
			ja = 3.633
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
				arg_93_0:Play318202024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = "1055ui_story"

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

			local var_96_4 = arg_93_1.actors_["1055ui_story"].transform
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 then
				arg_93_1.var_.moveOldPos1055ui_story = var_96_4.localPosition
			end

			local var_96_6 = 0.001

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6
				local var_96_8 = Vector3.New(0, -0.965, -6.2)

				var_96_4.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1055ui_story, var_96_8, var_96_7)

				local var_96_9 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_9.x, var_96_9.y, var_96_9.z)

				local var_96_10 = var_96_4.localEulerAngles

				var_96_10.z = 0
				var_96_10.x = 0
				var_96_4.localEulerAngles = var_96_10
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 then
				var_96_4.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_96_11 = manager.ui.mainCamera.transform.position - var_96_4.position

				var_96_4.forward = Vector3.New(var_96_11.x, var_96_11.y, var_96_11.z)

				local var_96_12 = var_96_4.localEulerAngles

				var_96_12.z = 0
				var_96_12.x = 0
				var_96_4.localEulerAngles = var_96_12
			end

			local var_96_13 = arg_93_1.actors_["1055ui_story"]
			local var_96_14 = 0

			if var_96_14 < arg_93_1.time_ and arg_93_1.time_ <= var_96_14 + arg_96_0 and arg_93_1.var_.characterEffect1055ui_story == nil then
				arg_93_1.var_.characterEffect1055ui_story = var_96_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_15 = 0.200000002980232

			if var_96_14 <= arg_93_1.time_ and arg_93_1.time_ < var_96_14 + var_96_15 then
				local var_96_16 = (arg_93_1.time_ - var_96_14) / var_96_15

				if arg_93_1.var_.characterEffect1055ui_story then
					arg_93_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_14 + var_96_15 and arg_93_1.time_ < var_96_14 + var_96_15 + arg_96_0 and arg_93_1.var_.characterEffect1055ui_story then
				arg_93_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_96_17 = 0

			if var_96_17 < arg_93_1.time_ and arg_93_1.time_ <= var_96_17 + arg_96_0 then
				arg_93_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_96_18 = 0

			if var_96_18 < arg_93_1.time_ and arg_93_1.time_ <= var_96_18 + arg_96_0 then
				arg_93_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_96_19 = arg_93_1.actors_["10053ui_story"].transform
			local var_96_20 = 0

			if var_96_20 < arg_93_1.time_ and arg_93_1.time_ <= var_96_20 + arg_96_0 then
				arg_93_1.var_.moveOldPos10053ui_story = var_96_19.localPosition
			end

			local var_96_21 = 0.001

			if var_96_20 <= arg_93_1.time_ and arg_93_1.time_ < var_96_20 + var_96_21 then
				local var_96_22 = (arg_93_1.time_ - var_96_20) / var_96_21
				local var_96_23 = Vector3.New(0, 100, 0)

				var_96_19.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos10053ui_story, var_96_23, var_96_22)

				local var_96_24 = manager.ui.mainCamera.transform.position - var_96_19.position

				var_96_19.forward = Vector3.New(var_96_24.x, var_96_24.y, var_96_24.z)

				local var_96_25 = var_96_19.localEulerAngles

				var_96_25.z = 0
				var_96_25.x = 0
				var_96_19.localEulerAngles = var_96_25
			end

			if arg_93_1.time_ >= var_96_20 + var_96_21 and arg_93_1.time_ < var_96_20 + var_96_21 + arg_96_0 then
				var_96_19.localPosition = Vector3.New(0, 100, 0)

				local var_96_26 = manager.ui.mainCamera.transform.position - var_96_19.position

				var_96_19.forward = Vector3.New(var_96_26.x, var_96_26.y, var_96_26.z)

				local var_96_27 = var_96_19.localEulerAngles

				var_96_27.z = 0
				var_96_27.x = 0
				var_96_19.localEulerAngles = var_96_27
			end

			local var_96_28 = arg_93_1.actors_["10053ui_story"]
			local var_96_29 = 0

			if var_96_29 < arg_93_1.time_ and arg_93_1.time_ <= var_96_29 + arg_96_0 and arg_93_1.var_.characterEffect10053ui_story == nil then
				arg_93_1.var_.characterEffect10053ui_story = var_96_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_30 = 0.200000002980232

			if var_96_29 <= arg_93_1.time_ and arg_93_1.time_ < var_96_29 + var_96_30 then
				local var_96_31 = (arg_93_1.time_ - var_96_29) / var_96_30

				if arg_93_1.var_.characterEffect10053ui_story then
					local var_96_32 = Mathf.Lerp(0, 0.5, var_96_31)

					arg_93_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_93_1.var_.characterEffect10053ui_story.fillRatio = var_96_32
				end
			end

			if arg_93_1.time_ >= var_96_29 + var_96_30 and arg_93_1.time_ < var_96_29 + var_96_30 + arg_96_0 and arg_93_1.var_.characterEffect10053ui_story then
				local var_96_33 = 0.5

				arg_93_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_93_1.var_.characterEffect10053ui_story.fillRatio = var_96_33
			end

			local var_96_34 = arg_93_1.actors_["1058ui_story"].transform
			local var_96_35 = 0

			if var_96_35 < arg_93_1.time_ and arg_93_1.time_ <= var_96_35 + arg_96_0 then
				arg_93_1.var_.moveOldPos1058ui_story = var_96_34.localPosition
			end

			local var_96_36 = 0.001

			if var_96_35 <= arg_93_1.time_ and arg_93_1.time_ < var_96_35 + var_96_36 then
				local var_96_37 = (arg_93_1.time_ - var_96_35) / var_96_36
				local var_96_38 = Vector3.New(0, 100, 0)

				var_96_34.localPosition = Vector3.Lerp(arg_93_1.var_.moveOldPos1058ui_story, var_96_38, var_96_37)

				local var_96_39 = manager.ui.mainCamera.transform.position - var_96_34.position

				var_96_34.forward = Vector3.New(var_96_39.x, var_96_39.y, var_96_39.z)

				local var_96_40 = var_96_34.localEulerAngles

				var_96_40.z = 0
				var_96_40.x = 0
				var_96_34.localEulerAngles = var_96_40
			end

			if arg_93_1.time_ >= var_96_35 + var_96_36 and arg_93_1.time_ < var_96_35 + var_96_36 + arg_96_0 then
				var_96_34.localPosition = Vector3.New(0, 100, 0)

				local var_96_41 = manager.ui.mainCamera.transform.position - var_96_34.position

				var_96_34.forward = Vector3.New(var_96_41.x, var_96_41.y, var_96_41.z)

				local var_96_42 = var_96_34.localEulerAngles

				var_96_42.z = 0
				var_96_42.x = 0
				var_96_34.localEulerAngles = var_96_42
			end

			local var_96_43 = 0
			local var_96_44 = 0.325

			if var_96_43 < arg_93_1.time_ and arg_93_1.time_ <= var_96_43 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_45 = arg_93_1:FormatText(StoryNameCfg[481].name)

				arg_93_1.leftNameTxt_.text = var_96_45

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_46 = arg_93_1:GetWordFromCfg(318202023)
				local var_96_47 = arg_93_1:FormatText(var_96_46.content)

				arg_93_1.text_.text = var_96_47

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_48 = 13
				local var_96_49 = utf8.len(var_96_47)
				local var_96_50 = var_96_48 <= 0 and var_96_44 or var_96_44 * (var_96_49 / var_96_48)

				if var_96_50 > 0 and var_96_44 < var_96_50 then
					arg_93_1.talkMaxDuration = var_96_50

					if var_96_50 + var_96_43 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_50 + var_96_43
					end
				end

				arg_93_1.text_.text = var_96_47
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202023", "story_v_out_318202.awb") ~= 0 then
					local var_96_51 = manager.audio:GetVoiceLength("story_v_out_318202", "318202023", "story_v_out_318202.awb") / 1000

					if var_96_51 + var_96_43 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_51 + var_96_43
					end

					if var_96_46.prefab_name ~= "" and arg_93_1.actors_[var_96_46.prefab_name] ~= nil then
						local var_96_52 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_46.prefab_name].transform, "story_v_out_318202", "318202023", "story_v_out_318202.awb")

						arg_93_1:RecordAudio("318202023", var_96_52)
						arg_93_1:RecordAudio("318202023", var_96_52)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_318202", "318202023", "story_v_out_318202.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_318202", "318202023", "story_v_out_318202.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_53 = math.max(var_96_44, arg_93_1.talkMaxDuration)

			if var_96_43 <= arg_93_1.time_ and arg_93_1.time_ < var_96_43 + var_96_53 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_43) / var_96_53

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_43 + var_96_53 and arg_93_1.time_ < var_96_43 + var_96_53 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play318202024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 318202024
		arg_97_1.duration_ = 5

		SetActive(arg_97_1.tipsGo_, false)

		function arg_97_1.onSingleLineFinish_()
			arg_97_1.onSingleLineUpdate_ = nil
			arg_97_1.onSingleLineFinish_ = nil
			arg_97_1.state_ = "waiting"
		end

		function arg_97_1.playNext_(arg_99_0)
			if arg_99_0 == 1 then
				arg_97_0:Play318202025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1055ui_story"]
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 and arg_97_1.var_.characterEffect1055ui_story == nil then
				arg_97_1.var_.characterEffect1055ui_story = var_100_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_2 = 0.200000002980232

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2

				if arg_97_1.var_.characterEffect1055ui_story then
					local var_100_4 = Mathf.Lerp(0, 0.5, var_100_3)

					arg_97_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_97_1.var_.characterEffect1055ui_story.fillRatio = var_100_4
				end
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 and arg_97_1.var_.characterEffect1055ui_story then
				local var_100_5 = 0.5

				arg_97_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_97_1.var_.characterEffect1055ui_story.fillRatio = var_100_5
			end

			local var_100_6 = 0
			local var_100_7 = 0.825

			if var_100_6 < arg_97_1.time_ and arg_97_1.time_ <= var_100_6 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, false)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_8 = arg_97_1:GetWordFromCfg(318202024)
				local var_100_9 = arg_97_1:FormatText(var_100_8.content)

				arg_97_1.text_.text = var_100_9

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_10 = 33
				local var_100_11 = utf8.len(var_100_9)
				local var_100_12 = var_100_10 <= 0 and var_100_7 or var_100_7 * (var_100_11 / var_100_10)

				if var_100_12 > 0 and var_100_7 < var_100_12 then
					arg_97_1.talkMaxDuration = var_100_12

					if var_100_12 + var_100_6 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_12 + var_100_6
					end
				end

				arg_97_1.text_.text = var_100_9
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)
				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_13 = math.max(var_100_7, arg_97_1.talkMaxDuration)

			if var_100_6 <= arg_97_1.time_ and arg_97_1.time_ < var_100_6 + var_100_13 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_6) / var_100_13

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_6 + var_100_13 and arg_97_1.time_ < var_100_6 + var_100_13 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play318202025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 318202025
		arg_101_1.duration_ = 6.8

		local var_101_0 = {
			zh = 5.366,
			ja = 6.8
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
				arg_101_0:Play318202026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["1055ui_story"]
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 and arg_101_1.var_.characterEffect1055ui_story == nil then
				arg_101_1.var_.characterEffect1055ui_story = var_104_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_2 = 0.200000002980232

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2

				if arg_101_1.var_.characterEffect1055ui_story then
					arg_101_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 and arg_101_1.var_.characterEffect1055ui_story then
				arg_101_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_104_4 = 0

			if var_104_4 < arg_101_1.time_ and arg_101_1.time_ <= var_104_4 + arg_104_0 then
				arg_101_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action5_1")
			end

			local var_104_5 = 0

			if var_104_5 < arg_101_1.time_ and arg_101_1.time_ <= var_104_5 + arg_104_0 then
				arg_101_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_6 = 0
			local var_104_7 = 0.55

			if var_104_6 < arg_101_1.time_ and arg_101_1.time_ <= var_104_6 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_8 = arg_101_1:FormatText(StoryNameCfg[481].name)

				arg_101_1.leftNameTxt_.text = var_104_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_9 = arg_101_1:GetWordFromCfg(318202025)
				local var_104_10 = arg_101_1:FormatText(var_104_9.content)

				arg_101_1.text_.text = var_104_10

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_11 = 22
				local var_104_12 = utf8.len(var_104_10)
				local var_104_13 = var_104_11 <= 0 and var_104_7 or var_104_7 * (var_104_12 / var_104_11)

				if var_104_13 > 0 and var_104_7 < var_104_13 then
					arg_101_1.talkMaxDuration = var_104_13

					if var_104_13 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_13 + var_104_6
					end
				end

				arg_101_1.text_.text = var_104_10
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202025", "story_v_out_318202.awb") ~= 0 then
					local var_104_14 = manager.audio:GetVoiceLength("story_v_out_318202", "318202025", "story_v_out_318202.awb") / 1000

					if var_104_14 + var_104_6 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_14 + var_104_6
					end

					if var_104_9.prefab_name ~= "" and arg_101_1.actors_[var_104_9.prefab_name] ~= nil then
						local var_104_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_9.prefab_name].transform, "story_v_out_318202", "318202025", "story_v_out_318202.awb")

						arg_101_1:RecordAudio("318202025", var_104_15)
						arg_101_1:RecordAudio("318202025", var_104_15)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_318202", "318202025", "story_v_out_318202.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_318202", "318202025", "story_v_out_318202.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_16 = math.max(var_104_7, arg_101_1.talkMaxDuration)

			if var_104_6 <= arg_101_1.time_ and arg_101_1.time_ < var_104_6 + var_104_16 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_6) / var_104_16

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_6 + var_104_16 and arg_101_1.time_ < var_104_6 + var_104_16 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play318202026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 318202026
		arg_105_1.duration_ = 14.366

		local var_105_0 = {
			zh = 14.366,
			ja = 9.2
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
				arg_105_0:Play318202027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = arg_105_1.actors_["10053ui_story"].transform
			local var_108_1 = 0

			if var_108_1 < arg_105_1.time_ and arg_105_1.time_ <= var_108_1 + arg_108_0 then
				arg_105_1.var_.moveOldPos10053ui_story = var_108_0.localPosition
			end

			local var_108_2 = 0.001

			if var_108_1 <= arg_105_1.time_ and arg_105_1.time_ < var_108_1 + var_108_2 then
				local var_108_3 = (arg_105_1.time_ - var_108_1) / var_108_2
				local var_108_4 = Vector3.New(0, -1.12, -5.99)

				var_108_0.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos10053ui_story, var_108_4, var_108_3)

				local var_108_5 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_5.x, var_108_5.y, var_108_5.z)

				local var_108_6 = var_108_0.localEulerAngles

				var_108_6.z = 0
				var_108_6.x = 0
				var_108_0.localEulerAngles = var_108_6
			end

			if arg_105_1.time_ >= var_108_1 + var_108_2 and arg_105_1.time_ < var_108_1 + var_108_2 + arg_108_0 then
				var_108_0.localPosition = Vector3.New(0, -1.12, -5.99)

				local var_108_7 = manager.ui.mainCamera.transform.position - var_108_0.position

				var_108_0.forward = Vector3.New(var_108_7.x, var_108_7.y, var_108_7.z)

				local var_108_8 = var_108_0.localEulerAngles

				var_108_8.z = 0
				var_108_8.x = 0
				var_108_0.localEulerAngles = var_108_8
			end

			local var_108_9 = arg_105_1.actors_["10053ui_story"]
			local var_108_10 = 0

			if var_108_10 < arg_105_1.time_ and arg_105_1.time_ <= var_108_10 + arg_108_0 and arg_105_1.var_.characterEffect10053ui_story == nil then
				arg_105_1.var_.characterEffect10053ui_story = var_108_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_11 = 0.200000002980232

			if var_108_10 <= arg_105_1.time_ and arg_105_1.time_ < var_108_10 + var_108_11 then
				local var_108_12 = (arg_105_1.time_ - var_108_10) / var_108_11

				if arg_105_1.var_.characterEffect10053ui_story then
					arg_105_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_105_1.time_ >= var_108_10 + var_108_11 and arg_105_1.time_ < var_108_10 + var_108_11 + arg_108_0 and arg_105_1.var_.characterEffect10053ui_story then
				arg_105_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_108_13 = 0

			if var_108_13 < arg_105_1.time_ and arg_105_1.time_ <= var_108_13 + arg_108_0 then
				arg_105_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action4_1")
			end

			local var_108_14 = 0

			if var_108_14 < arg_105_1.time_ and arg_105_1.time_ <= var_108_14 + arg_108_0 then
				arg_105_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_108_15 = arg_105_1.actors_["1055ui_story"].transform
			local var_108_16 = 0

			if var_108_16 < arg_105_1.time_ and arg_105_1.time_ <= var_108_16 + arg_108_0 then
				arg_105_1.var_.moveOldPos1055ui_story = var_108_15.localPosition
			end

			local var_108_17 = 0.001

			if var_108_16 <= arg_105_1.time_ and arg_105_1.time_ < var_108_16 + var_108_17 then
				local var_108_18 = (arg_105_1.time_ - var_108_16) / var_108_17
				local var_108_19 = Vector3.New(0, 100, 0)

				var_108_15.localPosition = Vector3.Lerp(arg_105_1.var_.moveOldPos1055ui_story, var_108_19, var_108_18)

				local var_108_20 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_20.x, var_108_20.y, var_108_20.z)

				local var_108_21 = var_108_15.localEulerAngles

				var_108_21.z = 0
				var_108_21.x = 0
				var_108_15.localEulerAngles = var_108_21
			end

			if arg_105_1.time_ >= var_108_16 + var_108_17 and arg_105_1.time_ < var_108_16 + var_108_17 + arg_108_0 then
				var_108_15.localPosition = Vector3.New(0, 100, 0)

				local var_108_22 = manager.ui.mainCamera.transform.position - var_108_15.position

				var_108_15.forward = Vector3.New(var_108_22.x, var_108_22.y, var_108_22.z)

				local var_108_23 = var_108_15.localEulerAngles

				var_108_23.z = 0
				var_108_23.x = 0
				var_108_15.localEulerAngles = var_108_23
			end

			local var_108_24 = arg_105_1.actors_["1055ui_story"]
			local var_108_25 = 0

			if var_108_25 < arg_105_1.time_ and arg_105_1.time_ <= var_108_25 + arg_108_0 and arg_105_1.var_.characterEffect1055ui_story == nil then
				arg_105_1.var_.characterEffect1055ui_story = var_108_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_108_26 = 0.200000002980232

			if var_108_25 <= arg_105_1.time_ and arg_105_1.time_ < var_108_25 + var_108_26 then
				local var_108_27 = (arg_105_1.time_ - var_108_25) / var_108_26

				if arg_105_1.var_.characterEffect1055ui_story then
					local var_108_28 = Mathf.Lerp(0, 0.5, var_108_27)

					arg_105_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_105_1.var_.characterEffect1055ui_story.fillRatio = var_108_28
				end
			end

			if arg_105_1.time_ >= var_108_25 + var_108_26 and arg_105_1.time_ < var_108_25 + var_108_26 + arg_108_0 and arg_105_1.var_.characterEffect1055ui_story then
				local var_108_29 = 0.5

				arg_105_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_105_1.var_.characterEffect1055ui_story.fillRatio = var_108_29
			end

			local var_108_30 = 0
			local var_108_31 = 1.05

			if var_108_30 < arg_105_1.time_ and arg_105_1.time_ <= var_108_30 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_32 = arg_105_1:FormatText(StoryNameCfg[477].name)

				arg_105_1.leftNameTxt_.text = var_108_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_33 = arg_105_1:GetWordFromCfg(318202026)
				local var_108_34 = arg_105_1:FormatText(var_108_33.content)

				arg_105_1.text_.text = var_108_34

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_35 = 42
				local var_108_36 = utf8.len(var_108_34)
				local var_108_37 = var_108_35 <= 0 and var_108_31 or var_108_31 * (var_108_36 / var_108_35)

				if var_108_37 > 0 and var_108_31 < var_108_37 then
					arg_105_1.talkMaxDuration = var_108_37

					if var_108_37 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_37 + var_108_30
					end
				end

				arg_105_1.text_.text = var_108_34
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202026", "story_v_out_318202.awb") ~= 0 then
					local var_108_38 = manager.audio:GetVoiceLength("story_v_out_318202", "318202026", "story_v_out_318202.awb") / 1000

					if var_108_38 + var_108_30 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_38 + var_108_30
					end

					if var_108_33.prefab_name ~= "" and arg_105_1.actors_[var_108_33.prefab_name] ~= nil then
						local var_108_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_33.prefab_name].transform, "story_v_out_318202", "318202026", "story_v_out_318202.awb")

						arg_105_1:RecordAudio("318202026", var_108_39)
						arg_105_1:RecordAudio("318202026", var_108_39)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_318202", "318202026", "story_v_out_318202.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_318202", "318202026", "story_v_out_318202.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_40 = math.max(var_108_31, arg_105_1.talkMaxDuration)

			if var_108_30 <= arg_105_1.time_ and arg_105_1.time_ < var_108_30 + var_108_40 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_30) / var_108_40

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_30 + var_108_40 and arg_105_1.time_ < var_108_30 + var_108_40 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play318202027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 318202027
		arg_109_1.duration_ = 13.7

		local var_109_0 = {
			zh = 13.7,
			ja = 8.566
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
				arg_109_0:Play318202028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0
			local var_112_1 = 1.15

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_2 = arg_109_1:FormatText(StoryNameCfg[477].name)

				arg_109_1.leftNameTxt_.text = var_112_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_3 = arg_109_1:GetWordFromCfg(318202027)
				local var_112_4 = arg_109_1:FormatText(var_112_3.content)

				arg_109_1.text_.text = var_112_4

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_5 = 46
				local var_112_6 = utf8.len(var_112_4)
				local var_112_7 = var_112_5 <= 0 and var_112_1 or var_112_1 * (var_112_6 / var_112_5)

				if var_112_7 > 0 and var_112_1 < var_112_7 then
					arg_109_1.talkMaxDuration = var_112_7

					if var_112_7 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_7 + var_112_0
					end
				end

				arg_109_1.text_.text = var_112_4
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202027", "story_v_out_318202.awb") ~= 0 then
					local var_112_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202027", "story_v_out_318202.awb") / 1000

					if var_112_8 + var_112_0 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_8 + var_112_0
					end

					if var_112_3.prefab_name ~= "" and arg_109_1.actors_[var_112_3.prefab_name] ~= nil then
						local var_112_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_3.prefab_name].transform, "story_v_out_318202", "318202027", "story_v_out_318202.awb")

						arg_109_1:RecordAudio("318202027", var_112_9)
						arg_109_1:RecordAudio("318202027", var_112_9)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_318202", "318202027", "story_v_out_318202.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_318202", "318202027", "story_v_out_318202.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_10 = math.max(var_112_1, arg_109_1.talkMaxDuration)

			if var_112_0 <= arg_109_1.time_ and arg_109_1.time_ < var_112_0 + var_112_10 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_0) / var_112_10

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_0 + var_112_10 and arg_109_1.time_ < var_112_0 + var_112_10 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play318202028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 318202028
		arg_113_1.duration_ = 3.8

		local var_113_0 = {
			zh = 3.8,
			ja = 3.666
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
				arg_113_0:Play318202029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				arg_113_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action4_2")
			end

			local var_116_1 = 0
			local var_116_2 = 0.375

			if var_116_1 < arg_113_1.time_ and arg_113_1.time_ <= var_116_1 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, true)

				local var_116_3 = arg_113_1:FormatText(StoryNameCfg[477].name)

				arg_113_1.leftNameTxt_.text = var_116_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_113_1.leftNameTxt_.transform)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1.leftNameTxt_.text)
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_4 = arg_113_1:GetWordFromCfg(318202028)
				local var_116_5 = arg_113_1:FormatText(var_116_4.content)

				arg_113_1.text_.text = var_116_5

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_6 = 15
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202028", "story_v_out_318202.awb") ~= 0 then
					local var_116_9 = manager.audio:GetVoiceLength("story_v_out_318202", "318202028", "story_v_out_318202.awb") / 1000

					if var_116_9 + var_116_1 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_9 + var_116_1
					end

					if var_116_4.prefab_name ~= "" and arg_113_1.actors_[var_116_4.prefab_name] ~= nil then
						local var_116_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_113_1.actors_[var_116_4.prefab_name].transform, "story_v_out_318202", "318202028", "story_v_out_318202.awb")

						arg_113_1:RecordAudio("318202028", var_116_10)
						arg_113_1:RecordAudio("318202028", var_116_10)
					else
						arg_113_1:AudioAction("play", "voice", "story_v_out_318202", "318202028", "story_v_out_318202.awb")
					end

					arg_113_1:RecordHistoryTalkVoice("story_v_out_318202", "318202028", "story_v_out_318202.awb")
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
	Play318202029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 318202029
		arg_117_1.duration_ = 9.8

		local var_117_0 = {
			zh = 9.566,
			ja = 9.8
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
				arg_117_0:Play318202030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = arg_117_1.actors_["1055ui_story"].transform
			local var_120_1 = 0

			if var_120_1 < arg_117_1.time_ and arg_117_1.time_ <= var_120_1 + arg_120_0 then
				arg_117_1.var_.moveOldPos1055ui_story = var_120_0.localPosition
			end

			local var_120_2 = 0.001

			if var_120_1 <= arg_117_1.time_ and arg_117_1.time_ < var_120_1 + var_120_2 then
				local var_120_3 = (arg_117_1.time_ - var_120_1) / var_120_2
				local var_120_4 = Vector3.New(0, -0.965, -6.2)

				var_120_0.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos1055ui_story, var_120_4, var_120_3)

				local var_120_5 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_5.x, var_120_5.y, var_120_5.z)

				local var_120_6 = var_120_0.localEulerAngles

				var_120_6.z = 0
				var_120_6.x = 0
				var_120_0.localEulerAngles = var_120_6
			end

			if arg_117_1.time_ >= var_120_1 + var_120_2 and arg_117_1.time_ < var_120_1 + var_120_2 + arg_120_0 then
				var_120_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_120_7 = manager.ui.mainCamera.transform.position - var_120_0.position

				var_120_0.forward = Vector3.New(var_120_7.x, var_120_7.y, var_120_7.z)

				local var_120_8 = var_120_0.localEulerAngles

				var_120_8.z = 0
				var_120_8.x = 0
				var_120_0.localEulerAngles = var_120_8
			end

			local var_120_9 = arg_117_1.actors_["1055ui_story"]
			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 and arg_117_1.var_.characterEffect1055ui_story == nil then
				arg_117_1.var_.characterEffect1055ui_story = var_120_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_11 = 0.200000002980232

			if var_120_10 <= arg_117_1.time_ and arg_117_1.time_ < var_120_10 + var_120_11 then
				local var_120_12 = (arg_117_1.time_ - var_120_10) / var_120_11

				if arg_117_1.var_.characterEffect1055ui_story then
					arg_117_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 and arg_117_1.var_.characterEffect1055ui_story then
				arg_117_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_120_13 = arg_117_1.actors_["10053ui_story"].transform
			local var_120_14 = 0

			if var_120_14 < arg_117_1.time_ and arg_117_1.time_ <= var_120_14 + arg_120_0 then
				arg_117_1.var_.moveOldPos10053ui_story = var_120_13.localPosition
			end

			local var_120_15 = 0.001

			if var_120_14 <= arg_117_1.time_ and arg_117_1.time_ < var_120_14 + var_120_15 then
				local var_120_16 = (arg_117_1.time_ - var_120_14) / var_120_15
				local var_120_17 = Vector3.New(0, 100, 0)

				var_120_13.localPosition = Vector3.Lerp(arg_117_1.var_.moveOldPos10053ui_story, var_120_17, var_120_16)

				local var_120_18 = manager.ui.mainCamera.transform.position - var_120_13.position

				var_120_13.forward = Vector3.New(var_120_18.x, var_120_18.y, var_120_18.z)

				local var_120_19 = var_120_13.localEulerAngles

				var_120_19.z = 0
				var_120_19.x = 0
				var_120_13.localEulerAngles = var_120_19
			end

			if arg_117_1.time_ >= var_120_14 + var_120_15 and arg_117_1.time_ < var_120_14 + var_120_15 + arg_120_0 then
				var_120_13.localPosition = Vector3.New(0, 100, 0)

				local var_120_20 = manager.ui.mainCamera.transform.position - var_120_13.position

				var_120_13.forward = Vector3.New(var_120_20.x, var_120_20.y, var_120_20.z)

				local var_120_21 = var_120_13.localEulerAngles

				var_120_21.z = 0
				var_120_21.x = 0
				var_120_13.localEulerAngles = var_120_21
			end

			local var_120_22 = arg_117_1.actors_["10053ui_story"]
			local var_120_23 = 0

			if var_120_23 < arg_117_1.time_ and arg_117_1.time_ <= var_120_23 + arg_120_0 and arg_117_1.var_.characterEffect10053ui_story == nil then
				arg_117_1.var_.characterEffect10053ui_story = var_120_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_120_24 = 0.200000002980232

			if var_120_23 <= arg_117_1.time_ and arg_117_1.time_ < var_120_23 + var_120_24 then
				local var_120_25 = (arg_117_1.time_ - var_120_23) / var_120_24

				if arg_117_1.var_.characterEffect10053ui_story then
					local var_120_26 = Mathf.Lerp(0, 0.5, var_120_25)

					arg_117_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_117_1.var_.characterEffect10053ui_story.fillRatio = var_120_26
				end
			end

			if arg_117_1.time_ >= var_120_23 + var_120_24 and arg_117_1.time_ < var_120_23 + var_120_24 + arg_120_0 and arg_117_1.var_.characterEffect10053ui_story then
				local var_120_27 = 0.5

				arg_117_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_117_1.var_.characterEffect10053ui_story.fillRatio = var_120_27
			end

			local var_120_28 = 0

			if var_120_28 < arg_117_1.time_ and arg_117_1.time_ <= var_120_28 + arg_120_0 then
				arg_117_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_120_29 = 0
			local var_120_30 = 1.15

			if var_120_29 < arg_117_1.time_ and arg_117_1.time_ <= var_120_29 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, true)

				local var_120_31 = arg_117_1:FormatText(StoryNameCfg[481].name)

				arg_117_1.leftNameTxt_.text = var_120_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_117_1.leftNameTxt_.transform)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1.leftNameTxt_.text)
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_32 = arg_117_1:GetWordFromCfg(318202029)
				local var_120_33 = arg_117_1:FormatText(var_120_32.content)

				arg_117_1.text_.text = var_120_33

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_34 = 46
				local var_120_35 = utf8.len(var_120_33)
				local var_120_36 = var_120_34 <= 0 and var_120_30 or var_120_30 * (var_120_35 / var_120_34)

				if var_120_36 > 0 and var_120_30 < var_120_36 then
					arg_117_1.talkMaxDuration = var_120_36

					if var_120_36 + var_120_29 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_36 + var_120_29
					end
				end

				arg_117_1.text_.text = var_120_33
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202029", "story_v_out_318202.awb") ~= 0 then
					local var_120_37 = manager.audio:GetVoiceLength("story_v_out_318202", "318202029", "story_v_out_318202.awb") / 1000

					if var_120_37 + var_120_29 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_37 + var_120_29
					end

					if var_120_32.prefab_name ~= "" and arg_117_1.actors_[var_120_32.prefab_name] ~= nil then
						local var_120_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_117_1.actors_[var_120_32.prefab_name].transform, "story_v_out_318202", "318202029", "story_v_out_318202.awb")

						arg_117_1:RecordAudio("318202029", var_120_38)
						arg_117_1:RecordAudio("318202029", var_120_38)
					else
						arg_117_1:AudioAction("play", "voice", "story_v_out_318202", "318202029", "story_v_out_318202.awb")
					end

					arg_117_1:RecordHistoryTalkVoice("story_v_out_318202", "318202029", "story_v_out_318202.awb")
				end

				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_39 = math.max(var_120_30, arg_117_1.talkMaxDuration)

			if var_120_29 <= arg_117_1.time_ and arg_117_1.time_ < var_120_29 + var_120_39 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_29) / var_120_39

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_29 + var_120_39 and arg_117_1.time_ < var_120_29 + var_120_39 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play318202030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 318202030
		arg_121_1.duration_ = 2.433

		local var_121_0 = {
			zh = 2.133,
			ja = 2.433
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
				arg_121_0:Play318202031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = arg_121_1.actors_["1058ui_story"].transform
			local var_124_1 = 0

			if var_124_1 < arg_121_1.time_ and arg_121_1.time_ <= var_124_1 + arg_124_0 then
				arg_121_1.var_.moveOldPos1058ui_story = var_124_0.localPosition
			end

			local var_124_2 = 0.001

			if var_124_1 <= arg_121_1.time_ and arg_121_1.time_ < var_124_1 + var_124_2 then
				local var_124_3 = (arg_121_1.time_ - var_124_1) / var_124_2
				local var_124_4 = Vector3.New(0, -0.95, -5.88)

				var_124_0.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1058ui_story, var_124_4, var_124_3)

				local var_124_5 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_5.x, var_124_5.y, var_124_5.z)

				local var_124_6 = var_124_0.localEulerAngles

				var_124_6.z = 0
				var_124_6.x = 0
				var_124_0.localEulerAngles = var_124_6
			end

			if arg_121_1.time_ >= var_124_1 + var_124_2 and arg_121_1.time_ < var_124_1 + var_124_2 + arg_124_0 then
				var_124_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_124_7 = manager.ui.mainCamera.transform.position - var_124_0.position

				var_124_0.forward = Vector3.New(var_124_7.x, var_124_7.y, var_124_7.z)

				local var_124_8 = var_124_0.localEulerAngles

				var_124_8.z = 0
				var_124_8.x = 0
				var_124_0.localEulerAngles = var_124_8
			end

			local var_124_9 = arg_121_1.actors_["1058ui_story"]
			local var_124_10 = 0

			if var_124_10 < arg_121_1.time_ and arg_121_1.time_ <= var_124_10 + arg_124_0 and arg_121_1.var_.characterEffect1058ui_story == nil then
				arg_121_1.var_.characterEffect1058ui_story = var_124_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_11 = 0.200000002980232

			if var_124_10 <= arg_121_1.time_ and arg_121_1.time_ < var_124_10 + var_124_11 then
				local var_124_12 = (arg_121_1.time_ - var_124_10) / var_124_11

				if arg_121_1.var_.characterEffect1058ui_story then
					arg_121_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_121_1.time_ >= var_124_10 + var_124_11 and arg_121_1.time_ < var_124_10 + var_124_11 + arg_124_0 and arg_121_1.var_.characterEffect1058ui_story then
				arg_121_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_124_13 = 0

			if var_124_13 < arg_121_1.time_ and arg_121_1.time_ <= var_124_13 + arg_124_0 then
				arg_121_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action5_1")
			end

			local var_124_14 = 0

			if var_124_14 < arg_121_1.time_ and arg_121_1.time_ <= var_124_14 + arg_124_0 then
				arg_121_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_124_15 = arg_121_1.actors_["1055ui_story"].transform
			local var_124_16 = 0

			if var_124_16 < arg_121_1.time_ and arg_121_1.time_ <= var_124_16 + arg_124_0 then
				arg_121_1.var_.moveOldPos1055ui_story = var_124_15.localPosition
			end

			local var_124_17 = 0.001

			if var_124_16 <= arg_121_1.time_ and arg_121_1.time_ < var_124_16 + var_124_17 then
				local var_124_18 = (arg_121_1.time_ - var_124_16) / var_124_17
				local var_124_19 = Vector3.New(0, 100, 0)

				var_124_15.localPosition = Vector3.Lerp(arg_121_1.var_.moveOldPos1055ui_story, var_124_19, var_124_18)

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

			local var_124_24 = arg_121_1.actors_["1055ui_story"]
			local var_124_25 = 0

			if var_124_25 < arg_121_1.time_ and arg_121_1.time_ <= var_124_25 + arg_124_0 and arg_121_1.var_.characterEffect1055ui_story == nil then
				arg_121_1.var_.characterEffect1055ui_story = var_124_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_124_26 = 0.200000002980232

			if var_124_25 <= arg_121_1.time_ and arg_121_1.time_ < var_124_25 + var_124_26 then
				local var_124_27 = (arg_121_1.time_ - var_124_25) / var_124_26

				if arg_121_1.var_.characterEffect1055ui_story then
					local var_124_28 = Mathf.Lerp(0, 0.5, var_124_27)

					arg_121_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_121_1.var_.characterEffect1055ui_story.fillRatio = var_124_28
				end
			end

			if arg_121_1.time_ >= var_124_25 + var_124_26 and arg_121_1.time_ < var_124_25 + var_124_26 + arg_124_0 and arg_121_1.var_.characterEffect1055ui_story then
				local var_124_29 = 0.5

				arg_121_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_121_1.var_.characterEffect1055ui_story.fillRatio = var_124_29
			end

			local var_124_30 = 0
			local var_124_31 = 0.25

			if var_124_30 < arg_121_1.time_ and arg_121_1.time_ <= var_124_30 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, true)

				local var_124_32 = arg_121_1:FormatText(StoryNameCfg[92].name)

				arg_121_1.leftNameTxt_.text = var_124_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_121_1.leftNameTxt_.transform)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1.leftNameTxt_.text)
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_33 = arg_121_1:GetWordFromCfg(318202030)
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202030", "story_v_out_318202.awb") ~= 0 then
					local var_124_38 = manager.audio:GetVoiceLength("story_v_out_318202", "318202030", "story_v_out_318202.awb") / 1000

					if var_124_38 + var_124_30 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_38 + var_124_30
					end

					if var_124_33.prefab_name ~= "" and arg_121_1.actors_[var_124_33.prefab_name] ~= nil then
						local var_124_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_121_1.actors_[var_124_33.prefab_name].transform, "story_v_out_318202", "318202030", "story_v_out_318202.awb")

						arg_121_1:RecordAudio("318202030", var_124_39)
						arg_121_1:RecordAudio("318202030", var_124_39)
					else
						arg_121_1:AudioAction("play", "voice", "story_v_out_318202", "318202030", "story_v_out_318202.awb")
					end

					arg_121_1:RecordHistoryTalkVoice("story_v_out_318202", "318202030", "story_v_out_318202.awb")
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
	Play318202031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 318202031
		arg_125_1.duration_ = 5.933

		local var_125_0 = {
			zh = 2.6,
			ja = 5.933
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
				arg_125_0:Play318202032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = 0
			local var_128_1 = 0.375

			if var_128_0 < arg_125_1.time_ and arg_125_1.time_ <= var_128_0 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_2 = arg_125_1:FormatText(StoryNameCfg[92].name)

				arg_125_1.leftNameTxt_.text = var_128_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_3 = arg_125_1:GetWordFromCfg(318202031)
				local var_128_4 = arg_125_1:FormatText(var_128_3.content)

				arg_125_1.text_.text = var_128_4

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_5 = 15
				local var_128_6 = utf8.len(var_128_4)
				local var_128_7 = var_128_5 <= 0 and var_128_1 or var_128_1 * (var_128_6 / var_128_5)

				if var_128_7 > 0 and var_128_1 < var_128_7 then
					arg_125_1.talkMaxDuration = var_128_7

					if var_128_7 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_7 + var_128_0
					end
				end

				arg_125_1.text_.text = var_128_4
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202031", "story_v_out_318202.awb") ~= 0 then
					local var_128_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202031", "story_v_out_318202.awb") / 1000

					if var_128_8 + var_128_0 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_8 + var_128_0
					end

					if var_128_3.prefab_name ~= "" and arg_125_1.actors_[var_128_3.prefab_name] ~= nil then
						local var_128_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_3.prefab_name].transform, "story_v_out_318202", "318202031", "story_v_out_318202.awb")

						arg_125_1:RecordAudio("318202031", var_128_9)
						arg_125_1:RecordAudio("318202031", var_128_9)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_318202", "318202031", "story_v_out_318202.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_318202", "318202031", "story_v_out_318202.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_10 = math.max(var_128_1, arg_125_1.talkMaxDuration)

			if var_128_0 <= arg_125_1.time_ and arg_125_1.time_ < var_128_0 + var_128_10 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_0) / var_128_10

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_0 + var_128_10 and arg_125_1.time_ < var_128_0 + var_128_10 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play318202032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 318202032
		arg_129_1.duration_ = 5

		SetActive(arg_129_1.tipsGo_, false)

		function arg_129_1.onSingleLineFinish_()
			arg_129_1.onSingleLineUpdate_ = nil
			arg_129_1.onSingleLineFinish_ = nil
			arg_129_1.state_ = "waiting"
		end

		function arg_129_1.playNext_(arg_131_0)
			if arg_131_0 == 1 then
				arg_129_0:Play318202033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1058ui_story"].transform
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 then
				arg_129_1.var_.moveOldPos1058ui_story = var_132_0.localPosition
			end

			local var_132_2 = 0.001

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2
				local var_132_4 = Vector3.New(0, 100, 0)

				var_132_0.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1058ui_story, var_132_4, var_132_3)

				local var_132_5 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_5.x, var_132_5.y, var_132_5.z)

				local var_132_6 = var_132_0.localEulerAngles

				var_132_6.z = 0
				var_132_6.x = 0
				var_132_0.localEulerAngles = var_132_6
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 then
				var_132_0.localPosition = Vector3.New(0, 100, 0)

				local var_132_7 = manager.ui.mainCamera.transform.position - var_132_0.position

				var_132_0.forward = Vector3.New(var_132_7.x, var_132_7.y, var_132_7.z)

				local var_132_8 = var_132_0.localEulerAngles

				var_132_8.z = 0
				var_132_8.x = 0
				var_132_0.localEulerAngles = var_132_8
			end

			local var_132_9 = arg_129_1.actors_["1058ui_story"]
			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 and arg_129_1.var_.characterEffect1058ui_story == nil then
				arg_129_1.var_.characterEffect1058ui_story = var_132_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_11 = 0.200000002980232

			if var_132_10 <= arg_129_1.time_ and arg_129_1.time_ < var_132_10 + var_132_11 then
				local var_132_12 = (arg_129_1.time_ - var_132_10) / var_132_11

				if arg_129_1.var_.characterEffect1058ui_story then
					local var_132_13 = Mathf.Lerp(0, 0.5, var_132_12)

					arg_129_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_129_1.var_.characterEffect1058ui_story.fillRatio = var_132_13
				end
			end

			if arg_129_1.time_ >= var_132_10 + var_132_11 and arg_129_1.time_ < var_132_10 + var_132_11 + arg_132_0 and arg_129_1.var_.characterEffect1058ui_story then
				local var_132_14 = 0.5

				arg_129_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_129_1.var_.characterEffect1058ui_story.fillRatio = var_132_14
			end

			local var_132_15 = 0
			local var_132_16 = 0.625

			if var_132_15 < arg_129_1.time_ and arg_129_1.time_ <= var_132_15 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, false)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_17 = arg_129_1:GetWordFromCfg(318202032)
				local var_132_18 = arg_129_1:FormatText(var_132_17.content)

				arg_129_1.text_.text = var_132_18

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_19 = 25
				local var_132_20 = utf8.len(var_132_18)
				local var_132_21 = var_132_19 <= 0 and var_132_16 or var_132_16 * (var_132_20 / var_132_19)

				if var_132_21 > 0 and var_132_16 < var_132_21 then
					arg_129_1.talkMaxDuration = var_132_21

					if var_132_21 + var_132_15 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_21 + var_132_15
					end
				end

				arg_129_1.text_.text = var_132_18
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)
				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_22 = math.max(var_132_16, arg_129_1.talkMaxDuration)

			if var_132_15 <= arg_129_1.time_ and arg_129_1.time_ < var_132_15 + var_132_22 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_15) / var_132_22

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_15 + var_132_22 and arg_129_1.time_ < var_132_15 + var_132_22 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play318202033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 318202033
		arg_133_1.duration_ = 4.533

		local var_133_0 = {
			zh = 4.533,
			ja = 4.133
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
				arg_133_0:Play318202034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1055ui_story"].transform
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 then
				arg_133_1.var_.moveOldPos1055ui_story = var_136_0.localPosition
			end

			local var_136_2 = 0.001

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2
				local var_136_4 = Vector3.New(0, -0.965, -6.2)

				var_136_0.localPosition = Vector3.Lerp(arg_133_1.var_.moveOldPos1055ui_story, var_136_4, var_136_3)

				local var_136_5 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_5.x, var_136_5.y, var_136_5.z)

				local var_136_6 = var_136_0.localEulerAngles

				var_136_6.z = 0
				var_136_6.x = 0
				var_136_0.localEulerAngles = var_136_6
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 then
				var_136_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_136_7 = manager.ui.mainCamera.transform.position - var_136_0.position

				var_136_0.forward = Vector3.New(var_136_7.x, var_136_7.y, var_136_7.z)

				local var_136_8 = var_136_0.localEulerAngles

				var_136_8.z = 0
				var_136_8.x = 0
				var_136_0.localEulerAngles = var_136_8
			end

			local var_136_9 = arg_133_1.actors_["1055ui_story"]
			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 and arg_133_1.var_.characterEffect1055ui_story == nil then
				arg_133_1.var_.characterEffect1055ui_story = var_136_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_11 = 0.200000002980232

			if var_136_10 <= arg_133_1.time_ and arg_133_1.time_ < var_136_10 + var_136_11 then
				local var_136_12 = (arg_133_1.time_ - var_136_10) / var_136_11

				if arg_133_1.var_.characterEffect1055ui_story then
					arg_133_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_10 + var_136_11 and arg_133_1.time_ < var_136_10 + var_136_11 + arg_136_0 and arg_133_1.var_.characterEffect1055ui_story then
				arg_133_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_136_13 = 0

			if var_136_13 < arg_133_1.time_ and arg_133_1.time_ <= var_136_13 + arg_136_0 then
				arg_133_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action2_1")
			end

			local var_136_14 = 0

			if var_136_14 < arg_133_1.time_ and arg_133_1.time_ <= var_136_14 + arg_136_0 then
				arg_133_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_136_15 = 0
			local var_136_16 = 0.5

			if var_136_15 < arg_133_1.time_ and arg_133_1.time_ <= var_136_15 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_17 = arg_133_1:FormatText(StoryNameCfg[481].name)

				arg_133_1.leftNameTxt_.text = var_136_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_18 = arg_133_1:GetWordFromCfg(318202033)
				local var_136_19 = arg_133_1:FormatText(var_136_18.content)

				arg_133_1.text_.text = var_136_19

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_20 = 20
				local var_136_21 = utf8.len(var_136_19)
				local var_136_22 = var_136_20 <= 0 and var_136_16 or var_136_16 * (var_136_21 / var_136_20)

				if var_136_22 > 0 and var_136_16 < var_136_22 then
					arg_133_1.talkMaxDuration = var_136_22

					if var_136_22 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_22 + var_136_15
					end
				end

				arg_133_1.text_.text = var_136_19
				arg_133_1.typewritter.percent = 0

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202033", "story_v_out_318202.awb") ~= 0 then
					local var_136_23 = manager.audio:GetVoiceLength("story_v_out_318202", "318202033", "story_v_out_318202.awb") / 1000

					if var_136_23 + var_136_15 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_23 + var_136_15
					end

					if var_136_18.prefab_name ~= "" and arg_133_1.actors_[var_136_18.prefab_name] ~= nil then
						local var_136_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_18.prefab_name].transform, "story_v_out_318202", "318202033", "story_v_out_318202.awb")

						arg_133_1:RecordAudio("318202033", var_136_24)
						arg_133_1:RecordAudio("318202033", var_136_24)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_318202", "318202033", "story_v_out_318202.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_318202", "318202033", "story_v_out_318202.awb")
				end

				arg_133_1:RecordContent(arg_133_1.text_.text)
			end

			local var_136_25 = math.max(var_136_16, arg_133_1.talkMaxDuration)

			if var_136_15 <= arg_133_1.time_ and arg_133_1.time_ < var_136_15 + var_136_25 then
				arg_133_1.typewritter.percent = (arg_133_1.time_ - var_136_15) / var_136_25

				arg_133_1.typewritter:SetDirty()
			end

			if arg_133_1.time_ >= var_136_15 + var_136_25 and arg_133_1.time_ < var_136_15 + var_136_25 + arg_136_0 then
				arg_133_1.typewritter.percent = 1

				arg_133_1.typewritter:SetDirty()
				arg_133_1:ShowNextGo(true)
			end
		end
	end,
	Play318202034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 318202034
		arg_137_1.duration_ = 6.166

		local var_137_0 = {
			zh = 3.466,
			ja = 6.166
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
				arg_137_0:Play318202035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["1058ui_story"].transform
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 then
				arg_137_1.var_.moveOldPos1058ui_story = var_140_0.localPosition
			end

			local var_140_2 = 0.001

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2
				local var_140_4 = Vector3.New(0, -0.95, -5.88)

				var_140_0.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1058ui_story, var_140_4, var_140_3)

				local var_140_5 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_5.x, var_140_5.y, var_140_5.z)

				local var_140_6 = var_140_0.localEulerAngles

				var_140_6.z = 0
				var_140_6.x = 0
				var_140_0.localEulerAngles = var_140_6
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 then
				var_140_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_140_7 = manager.ui.mainCamera.transform.position - var_140_0.position

				var_140_0.forward = Vector3.New(var_140_7.x, var_140_7.y, var_140_7.z)

				local var_140_8 = var_140_0.localEulerAngles

				var_140_8.z = 0
				var_140_8.x = 0
				var_140_0.localEulerAngles = var_140_8
			end

			local var_140_9 = arg_137_1.actors_["1058ui_story"]
			local var_140_10 = 0

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 and arg_137_1.var_.characterEffect1058ui_story == nil then
				arg_137_1.var_.characterEffect1058ui_story = var_140_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_11 = 0.200000002980232

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_11 then
				local var_140_12 = (arg_137_1.time_ - var_140_10) / var_140_11

				if arg_137_1.var_.characterEffect1058ui_story then
					arg_137_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_10 + var_140_11 and arg_137_1.time_ < var_140_10 + var_140_11 + arg_140_0 and arg_137_1.var_.characterEffect1058ui_story then
				arg_137_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_140_13 = 0

			if var_140_13 < arg_137_1.time_ and arg_137_1.time_ <= var_140_13 + arg_140_0 then
				arg_137_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action5_2")
			end

			local var_140_14 = 0

			if var_140_14 < arg_137_1.time_ and arg_137_1.time_ <= var_140_14 + arg_140_0 then
				arg_137_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_140_15 = arg_137_1.actors_["1055ui_story"].transform
			local var_140_16 = 0

			if var_140_16 < arg_137_1.time_ and arg_137_1.time_ <= var_140_16 + arg_140_0 then
				arg_137_1.var_.moveOldPos1055ui_story = var_140_15.localPosition
			end

			local var_140_17 = 0.001

			if var_140_16 <= arg_137_1.time_ and arg_137_1.time_ < var_140_16 + var_140_17 then
				local var_140_18 = (arg_137_1.time_ - var_140_16) / var_140_17
				local var_140_19 = Vector3.New(0, 100, 0)

				var_140_15.localPosition = Vector3.Lerp(arg_137_1.var_.moveOldPos1055ui_story, var_140_19, var_140_18)

				local var_140_20 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_20.x, var_140_20.y, var_140_20.z)

				local var_140_21 = var_140_15.localEulerAngles

				var_140_21.z = 0
				var_140_21.x = 0
				var_140_15.localEulerAngles = var_140_21
			end

			if arg_137_1.time_ >= var_140_16 + var_140_17 and arg_137_1.time_ < var_140_16 + var_140_17 + arg_140_0 then
				var_140_15.localPosition = Vector3.New(0, 100, 0)

				local var_140_22 = manager.ui.mainCamera.transform.position - var_140_15.position

				var_140_15.forward = Vector3.New(var_140_22.x, var_140_22.y, var_140_22.z)

				local var_140_23 = var_140_15.localEulerAngles

				var_140_23.z = 0
				var_140_23.x = 0
				var_140_15.localEulerAngles = var_140_23
			end

			local var_140_24 = arg_137_1.actors_["1055ui_story"]
			local var_140_25 = 0

			if var_140_25 < arg_137_1.time_ and arg_137_1.time_ <= var_140_25 + arg_140_0 and arg_137_1.var_.characterEffect1055ui_story == nil then
				arg_137_1.var_.characterEffect1055ui_story = var_140_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_26 = 0.200000002980232

			if var_140_25 <= arg_137_1.time_ and arg_137_1.time_ < var_140_25 + var_140_26 then
				local var_140_27 = (arg_137_1.time_ - var_140_25) / var_140_26

				if arg_137_1.var_.characterEffect1055ui_story then
					local var_140_28 = Mathf.Lerp(0, 0.5, var_140_27)

					arg_137_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_137_1.var_.characterEffect1055ui_story.fillRatio = var_140_28
				end
			end

			if arg_137_1.time_ >= var_140_25 + var_140_26 and arg_137_1.time_ < var_140_25 + var_140_26 + arg_140_0 and arg_137_1.var_.characterEffect1055ui_story then
				local var_140_29 = 0.5

				arg_137_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_137_1.var_.characterEffect1055ui_story.fillRatio = var_140_29
			end

			local var_140_30 = 0
			local var_140_31 = 0.5

			if var_140_30 < arg_137_1.time_ and arg_137_1.time_ <= var_140_30 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_32 = arg_137_1:FormatText(StoryNameCfg[92].name)

				arg_137_1.leftNameTxt_.text = var_140_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_33 = arg_137_1:GetWordFromCfg(318202034)
				local var_140_34 = arg_137_1:FormatText(var_140_33.content)

				arg_137_1.text_.text = var_140_34

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_35 = 20
				local var_140_36 = utf8.len(var_140_34)
				local var_140_37 = var_140_35 <= 0 and var_140_31 or var_140_31 * (var_140_36 / var_140_35)

				if var_140_37 > 0 and var_140_31 < var_140_37 then
					arg_137_1.talkMaxDuration = var_140_37

					if var_140_37 + var_140_30 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_37 + var_140_30
					end
				end

				arg_137_1.text_.text = var_140_34
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202034", "story_v_out_318202.awb") ~= 0 then
					local var_140_38 = manager.audio:GetVoiceLength("story_v_out_318202", "318202034", "story_v_out_318202.awb") / 1000

					if var_140_38 + var_140_30 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_38 + var_140_30
					end

					if var_140_33.prefab_name ~= "" and arg_137_1.actors_[var_140_33.prefab_name] ~= nil then
						local var_140_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_33.prefab_name].transform, "story_v_out_318202", "318202034", "story_v_out_318202.awb")

						arg_137_1:RecordAudio("318202034", var_140_39)
						arg_137_1:RecordAudio("318202034", var_140_39)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_318202", "318202034", "story_v_out_318202.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_318202", "318202034", "story_v_out_318202.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_40 = math.max(var_140_31, arg_137_1.talkMaxDuration)

			if var_140_30 <= arg_137_1.time_ and arg_137_1.time_ < var_140_30 + var_140_40 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_30) / var_140_40

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_30 + var_140_40 and arg_137_1.time_ < var_140_30 + var_140_40 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play318202035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 318202035
		arg_141_1.duration_ = 15.433

		local var_141_0 = {
			zh = 9.066,
			ja = 15.433
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
				arg_141_0:Play318202036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = 0

			if var_144_0 < arg_141_1.time_ and arg_141_1.time_ <= var_144_0 + arg_144_0 then
				arg_141_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_144_1 = 0
			local var_144_2 = 1.225

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_3 = arg_141_1:FormatText(StoryNameCfg[92].name)

				arg_141_1.leftNameTxt_.text = var_144_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_4 = arg_141_1:GetWordFromCfg(318202035)
				local var_144_5 = arg_141_1:FormatText(var_144_4.content)

				arg_141_1.text_.text = var_144_5

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_6 = 49
				local var_144_7 = utf8.len(var_144_5)
				local var_144_8 = var_144_6 <= 0 and var_144_2 or var_144_2 * (var_144_7 / var_144_6)

				if var_144_8 > 0 and var_144_2 < var_144_8 then
					arg_141_1.talkMaxDuration = var_144_8

					if var_144_8 + var_144_1 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_8 + var_144_1
					end
				end

				arg_141_1.text_.text = var_144_5
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202035", "story_v_out_318202.awb") ~= 0 then
					local var_144_9 = manager.audio:GetVoiceLength("story_v_out_318202", "318202035", "story_v_out_318202.awb") / 1000

					if var_144_9 + var_144_1 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_9 + var_144_1
					end

					if var_144_4.prefab_name ~= "" and arg_141_1.actors_[var_144_4.prefab_name] ~= nil then
						local var_144_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_4.prefab_name].transform, "story_v_out_318202", "318202035", "story_v_out_318202.awb")

						arg_141_1:RecordAudio("318202035", var_144_10)
						arg_141_1:RecordAudio("318202035", var_144_10)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_318202", "318202035", "story_v_out_318202.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_318202", "318202035", "story_v_out_318202.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_11 = math.max(var_144_2, arg_141_1.talkMaxDuration)

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_11 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_1) / var_144_11

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_1 + var_144_11 and arg_141_1.time_ < var_144_1 + var_144_11 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play318202036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 318202036
		arg_145_1.duration_ = 8.866

		local var_145_0 = {
			zh = 8.866,
			ja = 6.433
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
				arg_145_0:Play318202037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["1055ui_story"].transform
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 then
				arg_145_1.var_.moveOldPos1055ui_story = var_148_0.localPosition
			end

			local var_148_2 = 0.001

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2
				local var_148_4 = Vector3.New(0, -0.965, -6.2)

				var_148_0.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1055ui_story, var_148_4, var_148_3)

				local var_148_5 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_5.x, var_148_5.y, var_148_5.z)

				local var_148_6 = var_148_0.localEulerAngles

				var_148_6.z = 0
				var_148_6.x = 0
				var_148_0.localEulerAngles = var_148_6
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 then
				var_148_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_148_7 = manager.ui.mainCamera.transform.position - var_148_0.position

				var_148_0.forward = Vector3.New(var_148_7.x, var_148_7.y, var_148_7.z)

				local var_148_8 = var_148_0.localEulerAngles

				var_148_8.z = 0
				var_148_8.x = 0
				var_148_0.localEulerAngles = var_148_8
			end

			local var_148_9 = arg_145_1.actors_["1055ui_story"]
			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 and arg_145_1.var_.characterEffect1055ui_story == nil then
				arg_145_1.var_.characterEffect1055ui_story = var_148_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_11 = 0.200000002980232

			if var_148_10 <= arg_145_1.time_ and arg_145_1.time_ < var_148_10 + var_148_11 then
				local var_148_12 = (arg_145_1.time_ - var_148_10) / var_148_11

				if arg_145_1.var_.characterEffect1055ui_story then
					arg_145_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_10 + var_148_11 and arg_145_1.time_ < var_148_10 + var_148_11 + arg_148_0 and arg_145_1.var_.characterEffect1055ui_story then
				arg_145_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_148_13 = 0

			if var_148_13 < arg_145_1.time_ and arg_145_1.time_ <= var_148_13 + arg_148_0 then
				arg_145_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_148_14 = 0

			if var_148_14 < arg_145_1.time_ and arg_145_1.time_ <= var_148_14 + arg_148_0 then
				arg_145_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_148_15 = arg_145_1.actors_["1058ui_story"].transform
			local var_148_16 = 0

			if var_148_16 < arg_145_1.time_ and arg_145_1.time_ <= var_148_16 + arg_148_0 then
				arg_145_1.var_.moveOldPos1058ui_story = var_148_15.localPosition
			end

			local var_148_17 = 0.001

			if var_148_16 <= arg_145_1.time_ and arg_145_1.time_ < var_148_16 + var_148_17 then
				local var_148_18 = (arg_145_1.time_ - var_148_16) / var_148_17
				local var_148_19 = Vector3.New(0, 100, 0)

				var_148_15.localPosition = Vector3.Lerp(arg_145_1.var_.moveOldPos1058ui_story, var_148_19, var_148_18)

				local var_148_20 = manager.ui.mainCamera.transform.position - var_148_15.position

				var_148_15.forward = Vector3.New(var_148_20.x, var_148_20.y, var_148_20.z)

				local var_148_21 = var_148_15.localEulerAngles

				var_148_21.z = 0
				var_148_21.x = 0
				var_148_15.localEulerAngles = var_148_21
			end

			if arg_145_1.time_ >= var_148_16 + var_148_17 and arg_145_1.time_ < var_148_16 + var_148_17 + arg_148_0 then
				var_148_15.localPosition = Vector3.New(0, 100, 0)

				local var_148_22 = manager.ui.mainCamera.transform.position - var_148_15.position

				var_148_15.forward = Vector3.New(var_148_22.x, var_148_22.y, var_148_22.z)

				local var_148_23 = var_148_15.localEulerAngles

				var_148_23.z = 0
				var_148_23.x = 0
				var_148_15.localEulerAngles = var_148_23
			end

			local var_148_24 = arg_145_1.actors_["1058ui_story"]
			local var_148_25 = 0

			if var_148_25 < arg_145_1.time_ and arg_145_1.time_ <= var_148_25 + arg_148_0 and arg_145_1.var_.characterEffect1058ui_story == nil then
				arg_145_1.var_.characterEffect1058ui_story = var_148_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_26 = 0.200000002980232

			if var_148_25 <= arg_145_1.time_ and arg_145_1.time_ < var_148_25 + var_148_26 then
				local var_148_27 = (arg_145_1.time_ - var_148_25) / var_148_26

				if arg_145_1.var_.characterEffect1058ui_story then
					local var_148_28 = Mathf.Lerp(0, 0.5, var_148_27)

					arg_145_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_145_1.var_.characterEffect1058ui_story.fillRatio = var_148_28
				end
			end

			if arg_145_1.time_ >= var_148_25 + var_148_26 and arg_145_1.time_ < var_148_25 + var_148_26 + arg_148_0 and arg_145_1.var_.characterEffect1058ui_story then
				local var_148_29 = 0.5

				arg_145_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_145_1.var_.characterEffect1058ui_story.fillRatio = var_148_29
			end

			local var_148_30 = 0
			local var_148_31 = 1.025

			if var_148_30 < arg_145_1.time_ and arg_145_1.time_ <= var_148_30 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_32 = arg_145_1:FormatText(StoryNameCfg[481].name)

				arg_145_1.leftNameTxt_.text = var_148_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_33 = arg_145_1:GetWordFromCfg(318202036)
				local var_148_34 = arg_145_1:FormatText(var_148_33.content)

				arg_145_1.text_.text = var_148_34

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_35 = 41
				local var_148_36 = utf8.len(var_148_34)
				local var_148_37 = var_148_35 <= 0 and var_148_31 or var_148_31 * (var_148_36 / var_148_35)

				if var_148_37 > 0 and var_148_31 < var_148_37 then
					arg_145_1.talkMaxDuration = var_148_37

					if var_148_37 + var_148_30 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_37 + var_148_30
					end
				end

				arg_145_1.text_.text = var_148_34
				arg_145_1.typewritter.percent = 0

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202036", "story_v_out_318202.awb") ~= 0 then
					local var_148_38 = manager.audio:GetVoiceLength("story_v_out_318202", "318202036", "story_v_out_318202.awb") / 1000

					if var_148_38 + var_148_30 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_38 + var_148_30
					end

					if var_148_33.prefab_name ~= "" and arg_145_1.actors_[var_148_33.prefab_name] ~= nil then
						local var_148_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_33.prefab_name].transform, "story_v_out_318202", "318202036", "story_v_out_318202.awb")

						arg_145_1:RecordAudio("318202036", var_148_39)
						arg_145_1:RecordAudio("318202036", var_148_39)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_318202", "318202036", "story_v_out_318202.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_318202", "318202036", "story_v_out_318202.awb")
				end

				arg_145_1:RecordContent(arg_145_1.text_.text)
			end

			local var_148_40 = math.max(var_148_31, arg_145_1.talkMaxDuration)

			if var_148_30 <= arg_145_1.time_ and arg_145_1.time_ < var_148_30 + var_148_40 then
				arg_145_1.typewritter.percent = (arg_145_1.time_ - var_148_30) / var_148_40

				arg_145_1.typewritter:SetDirty()
			end

			if arg_145_1.time_ >= var_148_30 + var_148_40 and arg_145_1.time_ < var_148_30 + var_148_40 + arg_148_0 then
				arg_145_1.typewritter.percent = 1

				arg_145_1.typewritter:SetDirty()
				arg_145_1:ShowNextGo(true)
			end
		end
	end,
	Play318202037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 318202037
		arg_149_1.duration_ = 4.466

		local var_149_0 = {
			zh = 4.466,
			ja = 4.166
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
				arg_149_0:Play318202038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0
			local var_152_1 = 0.475

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_2 = arg_149_1:FormatText(StoryNameCfg[481].name)

				arg_149_1.leftNameTxt_.text = var_152_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_3 = arg_149_1:GetWordFromCfg(318202037)
				local var_152_4 = arg_149_1:FormatText(var_152_3.content)

				arg_149_1.text_.text = var_152_4

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_5 = 19
				local var_152_6 = utf8.len(var_152_4)
				local var_152_7 = var_152_5 <= 0 and var_152_1 or var_152_1 * (var_152_6 / var_152_5)

				if var_152_7 > 0 and var_152_1 < var_152_7 then
					arg_149_1.talkMaxDuration = var_152_7

					if var_152_7 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_7 + var_152_0
					end
				end

				arg_149_1.text_.text = var_152_4
				arg_149_1.typewritter.percent = 0

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202037", "story_v_out_318202.awb") ~= 0 then
					local var_152_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202037", "story_v_out_318202.awb") / 1000

					if var_152_8 + var_152_0 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_8 + var_152_0
					end

					if var_152_3.prefab_name ~= "" and arg_149_1.actors_[var_152_3.prefab_name] ~= nil then
						local var_152_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_3.prefab_name].transform, "story_v_out_318202", "318202037", "story_v_out_318202.awb")

						arg_149_1:RecordAudio("318202037", var_152_9)
						arg_149_1:RecordAudio("318202037", var_152_9)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_318202", "318202037", "story_v_out_318202.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_318202", "318202037", "story_v_out_318202.awb")
				end

				arg_149_1:RecordContent(arg_149_1.text_.text)
			end

			local var_152_10 = math.max(var_152_1, arg_149_1.talkMaxDuration)

			if var_152_0 <= arg_149_1.time_ and arg_149_1.time_ < var_152_0 + var_152_10 then
				arg_149_1.typewritter.percent = (arg_149_1.time_ - var_152_0) / var_152_10

				arg_149_1.typewritter:SetDirty()
			end

			if arg_149_1.time_ >= var_152_0 + var_152_10 and arg_149_1.time_ < var_152_0 + var_152_10 + arg_152_0 then
				arg_149_1.typewritter.percent = 1

				arg_149_1.typewritter:SetDirty()
				arg_149_1:ShowNextGo(true)
			end
		end
	end,
	Play318202038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 318202038
		arg_153_1.duration_ = 9.533

		local var_153_0 = {
			zh = 9.533,
			ja = 5.466
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
				arg_153_0:Play318202039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["1058ui_story"].transform
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 then
				arg_153_1.var_.moveOldPos1058ui_story = var_156_0.localPosition
			end

			local var_156_2 = 0.001

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2
				local var_156_4 = Vector3.New(0, -0.95, -5.88)

				var_156_0.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1058ui_story, var_156_4, var_156_3)

				local var_156_5 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_5.x, var_156_5.y, var_156_5.z)

				local var_156_6 = var_156_0.localEulerAngles

				var_156_6.z = 0
				var_156_6.x = 0
				var_156_0.localEulerAngles = var_156_6
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 then
				var_156_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_156_7 = manager.ui.mainCamera.transform.position - var_156_0.position

				var_156_0.forward = Vector3.New(var_156_7.x, var_156_7.y, var_156_7.z)

				local var_156_8 = var_156_0.localEulerAngles

				var_156_8.z = 0
				var_156_8.x = 0
				var_156_0.localEulerAngles = var_156_8
			end

			local var_156_9 = arg_153_1.actors_["1058ui_story"]
			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 and arg_153_1.var_.characterEffect1058ui_story == nil then
				arg_153_1.var_.characterEffect1058ui_story = var_156_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_11 = 0.200000002980232

			if var_156_10 <= arg_153_1.time_ and arg_153_1.time_ < var_156_10 + var_156_11 then
				local var_156_12 = (arg_153_1.time_ - var_156_10) / var_156_11

				if arg_153_1.var_.characterEffect1058ui_story then
					arg_153_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_10 + var_156_11 and arg_153_1.time_ < var_156_10 + var_156_11 + arg_156_0 and arg_153_1.var_.characterEffect1058ui_story then
				arg_153_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_156_13 = arg_153_1.actors_["1055ui_story"].transform
			local var_156_14 = 0

			if var_156_14 < arg_153_1.time_ and arg_153_1.time_ <= var_156_14 + arg_156_0 then
				arg_153_1.var_.moveOldPos1055ui_story = var_156_13.localPosition
			end

			local var_156_15 = 0.001

			if var_156_14 <= arg_153_1.time_ and arg_153_1.time_ < var_156_14 + var_156_15 then
				local var_156_16 = (arg_153_1.time_ - var_156_14) / var_156_15
				local var_156_17 = Vector3.New(0, 100, 0)

				var_156_13.localPosition = Vector3.Lerp(arg_153_1.var_.moveOldPos1055ui_story, var_156_17, var_156_16)

				local var_156_18 = manager.ui.mainCamera.transform.position - var_156_13.position

				var_156_13.forward = Vector3.New(var_156_18.x, var_156_18.y, var_156_18.z)

				local var_156_19 = var_156_13.localEulerAngles

				var_156_19.z = 0
				var_156_19.x = 0
				var_156_13.localEulerAngles = var_156_19
			end

			if arg_153_1.time_ >= var_156_14 + var_156_15 and arg_153_1.time_ < var_156_14 + var_156_15 + arg_156_0 then
				var_156_13.localPosition = Vector3.New(0, 100, 0)

				local var_156_20 = manager.ui.mainCamera.transform.position - var_156_13.position

				var_156_13.forward = Vector3.New(var_156_20.x, var_156_20.y, var_156_20.z)

				local var_156_21 = var_156_13.localEulerAngles

				var_156_21.z = 0
				var_156_21.x = 0
				var_156_13.localEulerAngles = var_156_21
			end

			local var_156_22 = arg_153_1.actors_["1055ui_story"]
			local var_156_23 = 0

			if var_156_23 < arg_153_1.time_ and arg_153_1.time_ <= var_156_23 + arg_156_0 and arg_153_1.var_.characterEffect1055ui_story == nil then
				arg_153_1.var_.characterEffect1055ui_story = var_156_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_24 = 0.200000002980232

			if var_156_23 <= arg_153_1.time_ and arg_153_1.time_ < var_156_23 + var_156_24 then
				local var_156_25 = (arg_153_1.time_ - var_156_23) / var_156_24

				if arg_153_1.var_.characterEffect1055ui_story then
					local var_156_26 = Mathf.Lerp(0, 0.5, var_156_25)

					arg_153_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1055ui_story.fillRatio = var_156_26
				end
			end

			if arg_153_1.time_ >= var_156_23 + var_156_24 and arg_153_1.time_ < var_156_23 + var_156_24 + arg_156_0 and arg_153_1.var_.characterEffect1055ui_story then
				local var_156_27 = 0.5

				arg_153_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1055ui_story.fillRatio = var_156_27
			end

			local var_156_28 = 0
			local var_156_29 = 1.15

			if var_156_28 < arg_153_1.time_ and arg_153_1.time_ <= var_156_28 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_30 = arg_153_1:FormatText(StoryNameCfg[92].name)

				arg_153_1.leftNameTxt_.text = var_156_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_31 = arg_153_1:GetWordFromCfg(318202038)
				local var_156_32 = arg_153_1:FormatText(var_156_31.content)

				arg_153_1.text_.text = var_156_32

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_33 = 46
				local var_156_34 = utf8.len(var_156_32)
				local var_156_35 = var_156_33 <= 0 and var_156_29 or var_156_29 * (var_156_34 / var_156_33)

				if var_156_35 > 0 and var_156_29 < var_156_35 then
					arg_153_1.talkMaxDuration = var_156_35

					if var_156_35 + var_156_28 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_35 + var_156_28
					end
				end

				arg_153_1.text_.text = var_156_32
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202038", "story_v_out_318202.awb") ~= 0 then
					local var_156_36 = manager.audio:GetVoiceLength("story_v_out_318202", "318202038", "story_v_out_318202.awb") / 1000

					if var_156_36 + var_156_28 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_36 + var_156_28
					end

					if var_156_31.prefab_name ~= "" and arg_153_1.actors_[var_156_31.prefab_name] ~= nil then
						local var_156_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_31.prefab_name].transform, "story_v_out_318202", "318202038", "story_v_out_318202.awb")

						arg_153_1:RecordAudio("318202038", var_156_37)
						arg_153_1:RecordAudio("318202038", var_156_37)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_318202", "318202038", "story_v_out_318202.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_318202", "318202038", "story_v_out_318202.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_38 = math.max(var_156_29, arg_153_1.talkMaxDuration)

			if var_156_28 <= arg_153_1.time_ and arg_153_1.time_ < var_156_28 + var_156_38 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_28) / var_156_38

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_28 + var_156_38 and arg_153_1.time_ < var_156_28 + var_156_38 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play318202039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 318202039
		arg_157_1.duration_ = 5.1

		local var_157_0 = {
			zh = 3.933,
			ja = 5.1
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
				arg_157_0:Play318202040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["1055ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos1055ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, -0.965, -6.2)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1055ui_story, var_160_4, var_160_3)

				local var_160_5 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_5.x, var_160_5.y, var_160_5.z)

				local var_160_6 = var_160_0.localEulerAngles

				var_160_6.z = 0
				var_160_6.x = 0
				var_160_0.localEulerAngles = var_160_6
			end

			if arg_157_1.time_ >= var_160_1 + var_160_2 and arg_157_1.time_ < var_160_1 + var_160_2 + arg_160_0 then
				var_160_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_160_7 = manager.ui.mainCamera.transform.position - var_160_0.position

				var_160_0.forward = Vector3.New(var_160_7.x, var_160_7.y, var_160_7.z)

				local var_160_8 = var_160_0.localEulerAngles

				var_160_8.z = 0
				var_160_8.x = 0
				var_160_0.localEulerAngles = var_160_8
			end

			local var_160_9 = arg_157_1.actors_["1055ui_story"]
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 and arg_157_1.var_.characterEffect1055ui_story == nil then
				arg_157_1.var_.characterEffect1055ui_story = var_160_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_11 = 0.200000002980232

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11

				if arg_157_1.var_.characterEffect1055ui_story then
					arg_157_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 and arg_157_1.var_.characterEffect1055ui_story then
				arg_157_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_160_13 = arg_157_1.actors_["1058ui_story"].transform
			local var_160_14 = 0

			if var_160_14 < arg_157_1.time_ and arg_157_1.time_ <= var_160_14 + arg_160_0 then
				arg_157_1.var_.moveOldPos1058ui_story = var_160_13.localPosition
			end

			local var_160_15 = 0.001

			if var_160_14 <= arg_157_1.time_ and arg_157_1.time_ < var_160_14 + var_160_15 then
				local var_160_16 = (arg_157_1.time_ - var_160_14) / var_160_15
				local var_160_17 = Vector3.New(0, 100, 0)

				var_160_13.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1058ui_story, var_160_17, var_160_16)

				local var_160_18 = manager.ui.mainCamera.transform.position - var_160_13.position

				var_160_13.forward = Vector3.New(var_160_18.x, var_160_18.y, var_160_18.z)

				local var_160_19 = var_160_13.localEulerAngles

				var_160_19.z = 0
				var_160_19.x = 0
				var_160_13.localEulerAngles = var_160_19
			end

			if arg_157_1.time_ >= var_160_14 + var_160_15 and arg_157_1.time_ < var_160_14 + var_160_15 + arg_160_0 then
				var_160_13.localPosition = Vector3.New(0, 100, 0)

				local var_160_20 = manager.ui.mainCamera.transform.position - var_160_13.position

				var_160_13.forward = Vector3.New(var_160_20.x, var_160_20.y, var_160_20.z)

				local var_160_21 = var_160_13.localEulerAngles

				var_160_21.z = 0
				var_160_21.x = 0
				var_160_13.localEulerAngles = var_160_21
			end

			local var_160_22 = arg_157_1.actors_["1058ui_story"]
			local var_160_23 = 0

			if var_160_23 < arg_157_1.time_ and arg_157_1.time_ <= var_160_23 + arg_160_0 and arg_157_1.var_.characterEffect1058ui_story == nil then
				arg_157_1.var_.characterEffect1058ui_story = var_160_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_160_24 = 0.200000002980232

			if var_160_23 <= arg_157_1.time_ and arg_157_1.time_ < var_160_23 + var_160_24 then
				local var_160_25 = (arg_157_1.time_ - var_160_23) / var_160_24

				if arg_157_1.var_.characterEffect1058ui_story then
					local var_160_26 = Mathf.Lerp(0, 0.5, var_160_25)

					arg_157_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_157_1.var_.characterEffect1058ui_story.fillRatio = var_160_26
				end
			end

			if arg_157_1.time_ >= var_160_23 + var_160_24 and arg_157_1.time_ < var_160_23 + var_160_24 + arg_160_0 and arg_157_1.var_.characterEffect1058ui_story then
				local var_160_27 = 0.5

				arg_157_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_157_1.var_.characterEffect1058ui_story.fillRatio = var_160_27
			end

			local var_160_28 = 0

			if var_160_28 < arg_157_1.time_ and arg_157_1.time_ <= var_160_28 + arg_160_0 then
				arg_157_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action3_1")
			end

			local var_160_29 = 0
			local var_160_30 = 0.425

			if var_160_29 < arg_157_1.time_ and arg_157_1.time_ <= var_160_29 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, true)

				local var_160_31 = arg_157_1:FormatText(StoryNameCfg[481].name)

				arg_157_1.leftNameTxt_.text = var_160_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_157_1.leftNameTxt_.transform)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1.leftNameTxt_.text)
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_32 = arg_157_1:GetWordFromCfg(318202039)
				local var_160_33 = arg_157_1:FormatText(var_160_32.content)

				arg_157_1.text_.text = var_160_33

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_34 = 17
				local var_160_35 = utf8.len(var_160_33)
				local var_160_36 = var_160_34 <= 0 and var_160_30 or var_160_30 * (var_160_35 / var_160_34)

				if var_160_36 > 0 and var_160_30 < var_160_36 then
					arg_157_1.talkMaxDuration = var_160_36

					if var_160_36 + var_160_29 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_36 + var_160_29
					end
				end

				arg_157_1.text_.text = var_160_33
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202039", "story_v_out_318202.awb") ~= 0 then
					local var_160_37 = manager.audio:GetVoiceLength("story_v_out_318202", "318202039", "story_v_out_318202.awb") / 1000

					if var_160_37 + var_160_29 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_37 + var_160_29
					end

					if var_160_32.prefab_name ~= "" and arg_157_1.actors_[var_160_32.prefab_name] ~= nil then
						local var_160_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_157_1.actors_[var_160_32.prefab_name].transform, "story_v_out_318202", "318202039", "story_v_out_318202.awb")

						arg_157_1:RecordAudio("318202039", var_160_38)
						arg_157_1:RecordAudio("318202039", var_160_38)
					else
						arg_157_1:AudioAction("play", "voice", "story_v_out_318202", "318202039", "story_v_out_318202.awb")
					end

					arg_157_1:RecordHistoryTalkVoice("story_v_out_318202", "318202039", "story_v_out_318202.awb")
				end

				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_39 = math.max(var_160_30, arg_157_1.talkMaxDuration)

			if var_160_29 <= arg_157_1.time_ and arg_157_1.time_ < var_160_29 + var_160_39 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_29) / var_160_39

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_29 + var_160_39 and arg_157_1.time_ < var_160_29 + var_160_39 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play318202040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 318202040
		arg_161_1.duration_ = 1.266

		local var_161_0 = {
			zh = 1,
			ja = 1.266
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
				arg_161_0:Play318202041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = arg_161_1.actors_["1058ui_story"].transform
			local var_164_1 = 0

			if var_164_1 < arg_161_1.time_ and arg_161_1.time_ <= var_164_1 + arg_164_0 then
				arg_161_1.var_.moveOldPos1058ui_story = var_164_0.localPosition
			end

			local var_164_2 = 0.001

			if var_164_1 <= arg_161_1.time_ and arg_161_1.time_ < var_164_1 + var_164_2 then
				local var_164_3 = (arg_161_1.time_ - var_164_1) / var_164_2
				local var_164_4 = Vector3.New(0, -0.95, -5.88)

				var_164_0.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1058ui_story, var_164_4, var_164_3)

				local var_164_5 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_5.x, var_164_5.y, var_164_5.z)

				local var_164_6 = var_164_0.localEulerAngles

				var_164_6.z = 0
				var_164_6.x = 0
				var_164_0.localEulerAngles = var_164_6
			end

			if arg_161_1.time_ >= var_164_1 + var_164_2 and arg_161_1.time_ < var_164_1 + var_164_2 + arg_164_0 then
				var_164_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_164_7 = manager.ui.mainCamera.transform.position - var_164_0.position

				var_164_0.forward = Vector3.New(var_164_7.x, var_164_7.y, var_164_7.z)

				local var_164_8 = var_164_0.localEulerAngles

				var_164_8.z = 0
				var_164_8.x = 0
				var_164_0.localEulerAngles = var_164_8
			end

			local var_164_9 = arg_161_1.actors_["1058ui_story"]
			local var_164_10 = 0

			if var_164_10 < arg_161_1.time_ and arg_161_1.time_ <= var_164_10 + arg_164_0 and arg_161_1.var_.characterEffect1058ui_story == nil then
				arg_161_1.var_.characterEffect1058ui_story = var_164_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_11 = 0.200000002980232

			if var_164_10 <= arg_161_1.time_ and arg_161_1.time_ < var_164_10 + var_164_11 then
				local var_164_12 = (arg_161_1.time_ - var_164_10) / var_164_11

				if arg_161_1.var_.characterEffect1058ui_story then
					arg_161_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_161_1.time_ >= var_164_10 + var_164_11 and arg_161_1.time_ < var_164_10 + var_164_11 + arg_164_0 and arg_161_1.var_.characterEffect1058ui_story then
				arg_161_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_164_13 = arg_161_1.actors_["1055ui_story"].transform
			local var_164_14 = 0

			if var_164_14 < arg_161_1.time_ and arg_161_1.time_ <= var_164_14 + arg_164_0 then
				arg_161_1.var_.moveOldPos1055ui_story = var_164_13.localPosition
			end

			local var_164_15 = 0.001

			if var_164_14 <= arg_161_1.time_ and arg_161_1.time_ < var_164_14 + var_164_15 then
				local var_164_16 = (arg_161_1.time_ - var_164_14) / var_164_15
				local var_164_17 = Vector3.New(0, 100, 0)

				var_164_13.localPosition = Vector3.Lerp(arg_161_1.var_.moveOldPos1055ui_story, var_164_17, var_164_16)

				local var_164_18 = manager.ui.mainCamera.transform.position - var_164_13.position

				var_164_13.forward = Vector3.New(var_164_18.x, var_164_18.y, var_164_18.z)

				local var_164_19 = var_164_13.localEulerAngles

				var_164_19.z = 0
				var_164_19.x = 0
				var_164_13.localEulerAngles = var_164_19
			end

			if arg_161_1.time_ >= var_164_14 + var_164_15 and arg_161_1.time_ < var_164_14 + var_164_15 + arg_164_0 then
				var_164_13.localPosition = Vector3.New(0, 100, 0)

				local var_164_20 = manager.ui.mainCamera.transform.position - var_164_13.position

				var_164_13.forward = Vector3.New(var_164_20.x, var_164_20.y, var_164_20.z)

				local var_164_21 = var_164_13.localEulerAngles

				var_164_21.z = 0
				var_164_21.x = 0
				var_164_13.localEulerAngles = var_164_21
			end

			local var_164_22 = arg_161_1.actors_["1055ui_story"]
			local var_164_23 = 0

			if var_164_23 < arg_161_1.time_ and arg_161_1.time_ <= var_164_23 + arg_164_0 and arg_161_1.var_.characterEffect1055ui_story == nil then
				arg_161_1.var_.characterEffect1055ui_story = var_164_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_164_24 = 0.200000002980232

			if var_164_23 <= arg_161_1.time_ and arg_161_1.time_ < var_164_23 + var_164_24 then
				local var_164_25 = (arg_161_1.time_ - var_164_23) / var_164_24

				if arg_161_1.var_.characterEffect1055ui_story then
					local var_164_26 = Mathf.Lerp(0, 0.5, var_164_25)

					arg_161_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_161_1.var_.characterEffect1055ui_story.fillRatio = var_164_26
				end
			end

			if arg_161_1.time_ >= var_164_23 + var_164_24 and arg_161_1.time_ < var_164_23 + var_164_24 + arg_164_0 and arg_161_1.var_.characterEffect1055ui_story then
				local var_164_27 = 0.5

				arg_161_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_161_1.var_.characterEffect1055ui_story.fillRatio = var_164_27
			end

			local var_164_28 = 0
			local var_164_29 = 0.05

			if var_164_28 < arg_161_1.time_ and arg_161_1.time_ <= var_164_28 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, true)

				local var_164_30 = arg_161_1:FormatText(StoryNameCfg[92].name)

				arg_161_1.leftNameTxt_.text = var_164_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_161_1.leftNameTxt_.transform)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1.leftNameTxt_.text)
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_31 = arg_161_1:GetWordFromCfg(318202040)
				local var_164_32 = arg_161_1:FormatText(var_164_31.content)

				arg_161_1.text_.text = var_164_32

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_33 = 2
				local var_164_34 = utf8.len(var_164_32)
				local var_164_35 = var_164_33 <= 0 and var_164_29 or var_164_29 * (var_164_34 / var_164_33)

				if var_164_35 > 0 and var_164_29 < var_164_35 then
					arg_161_1.talkMaxDuration = var_164_35

					if var_164_35 + var_164_28 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_35 + var_164_28
					end
				end

				arg_161_1.text_.text = var_164_32
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202040", "story_v_out_318202.awb") ~= 0 then
					local var_164_36 = manager.audio:GetVoiceLength("story_v_out_318202", "318202040", "story_v_out_318202.awb") / 1000

					if var_164_36 + var_164_28 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_36 + var_164_28
					end

					if var_164_31.prefab_name ~= "" and arg_161_1.actors_[var_164_31.prefab_name] ~= nil then
						local var_164_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_161_1.actors_[var_164_31.prefab_name].transform, "story_v_out_318202", "318202040", "story_v_out_318202.awb")

						arg_161_1:RecordAudio("318202040", var_164_37)
						arg_161_1:RecordAudio("318202040", var_164_37)
					else
						arg_161_1:AudioAction("play", "voice", "story_v_out_318202", "318202040", "story_v_out_318202.awb")
					end

					arg_161_1:RecordHistoryTalkVoice("story_v_out_318202", "318202040", "story_v_out_318202.awb")
				end

				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_38 = math.max(var_164_29, arg_161_1.talkMaxDuration)

			if var_164_28 <= arg_161_1.time_ and arg_161_1.time_ < var_164_28 + var_164_38 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_28) / var_164_38

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_28 + var_164_38 and arg_161_1.time_ < var_164_28 + var_164_38 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play318202041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 318202041
		arg_165_1.duration_ = 9.133

		local var_165_0 = {
			zh = 7.933,
			ja = 9.133
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
				arg_165_0:Play318202042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["1055ui_story"].transform
			local var_168_1 = 0

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos1055ui_story = var_168_0.localPosition
			end

			local var_168_2 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_2 then
				local var_168_3 = (arg_165_1.time_ - var_168_1) / var_168_2
				local var_168_4 = Vector3.New(0, -0.965, -6.2)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1055ui_story, var_168_4, var_168_3)

				local var_168_5 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_5.x, var_168_5.y, var_168_5.z)

				local var_168_6 = var_168_0.localEulerAngles

				var_168_6.z = 0
				var_168_6.x = 0
				var_168_0.localEulerAngles = var_168_6
			end

			if arg_165_1.time_ >= var_168_1 + var_168_2 and arg_165_1.time_ < var_168_1 + var_168_2 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_168_7 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_7.x, var_168_7.y, var_168_7.z)

				local var_168_8 = var_168_0.localEulerAngles

				var_168_8.z = 0
				var_168_8.x = 0
				var_168_0.localEulerAngles = var_168_8
			end

			local var_168_9 = arg_165_1.actors_["1055ui_story"]
			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 and arg_165_1.var_.characterEffect1055ui_story == nil then
				arg_165_1.var_.characterEffect1055ui_story = var_168_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_11 = 0.200000002980232

			if var_168_10 <= arg_165_1.time_ and arg_165_1.time_ < var_168_10 + var_168_11 then
				local var_168_12 = (arg_165_1.time_ - var_168_10) / var_168_11

				if arg_165_1.var_.characterEffect1055ui_story then
					arg_165_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_165_1.time_ >= var_168_10 + var_168_11 and arg_165_1.time_ < var_168_10 + var_168_11 + arg_168_0 and arg_165_1.var_.characterEffect1055ui_story then
				arg_165_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_168_13 = 0

			if var_168_13 < arg_165_1.time_ and arg_165_1.time_ <= var_168_13 + arg_168_0 then
				arg_165_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action3_2")
			end

			local var_168_14 = arg_165_1.actors_["1058ui_story"].transform
			local var_168_15 = 0

			if var_168_15 < arg_165_1.time_ and arg_165_1.time_ <= var_168_15 + arg_168_0 then
				arg_165_1.var_.moveOldPos1058ui_story = var_168_14.localPosition
			end

			local var_168_16 = 0.001

			if var_168_15 <= arg_165_1.time_ and arg_165_1.time_ < var_168_15 + var_168_16 then
				local var_168_17 = (arg_165_1.time_ - var_168_15) / var_168_16
				local var_168_18 = Vector3.New(0, 100, 0)

				var_168_14.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos1058ui_story, var_168_18, var_168_17)

				local var_168_19 = manager.ui.mainCamera.transform.position - var_168_14.position

				var_168_14.forward = Vector3.New(var_168_19.x, var_168_19.y, var_168_19.z)

				local var_168_20 = var_168_14.localEulerAngles

				var_168_20.z = 0
				var_168_20.x = 0
				var_168_14.localEulerAngles = var_168_20
			end

			if arg_165_1.time_ >= var_168_15 + var_168_16 and arg_165_1.time_ < var_168_15 + var_168_16 + arg_168_0 then
				var_168_14.localPosition = Vector3.New(0, 100, 0)

				local var_168_21 = manager.ui.mainCamera.transform.position - var_168_14.position

				var_168_14.forward = Vector3.New(var_168_21.x, var_168_21.y, var_168_21.z)

				local var_168_22 = var_168_14.localEulerAngles

				var_168_22.z = 0
				var_168_22.x = 0
				var_168_14.localEulerAngles = var_168_22
			end

			local var_168_23 = arg_165_1.actors_["1058ui_story"]
			local var_168_24 = 0

			if var_168_24 < arg_165_1.time_ and arg_165_1.time_ <= var_168_24 + arg_168_0 and arg_165_1.var_.characterEffect1058ui_story == nil then
				arg_165_1.var_.characterEffect1058ui_story = var_168_23:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_168_25 = 0.200000002980232

			if var_168_24 <= arg_165_1.time_ and arg_165_1.time_ < var_168_24 + var_168_25 then
				local var_168_26 = (arg_165_1.time_ - var_168_24) / var_168_25

				if arg_165_1.var_.characterEffect1058ui_story then
					local var_168_27 = Mathf.Lerp(0, 0.5, var_168_26)

					arg_165_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_165_1.var_.characterEffect1058ui_story.fillRatio = var_168_27
				end
			end

			if arg_165_1.time_ >= var_168_24 + var_168_25 and arg_165_1.time_ < var_168_24 + var_168_25 + arg_168_0 and arg_165_1.var_.characterEffect1058ui_story then
				local var_168_28 = 0.5

				arg_165_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_165_1.var_.characterEffect1058ui_story.fillRatio = var_168_28
			end

			local var_168_29 = 0
			local var_168_30 = 0.9

			if var_168_29 < arg_165_1.time_ and arg_165_1.time_ <= var_168_29 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0
				arg_165_1.dialogCg_.alpha = 1

				arg_165_1.dialog_:SetActive(true)
				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_31 = arg_165_1:FormatText(StoryNameCfg[481].name)

				arg_165_1.leftNameTxt_.text = var_168_31

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_32 = arg_165_1:GetWordFromCfg(318202041)
				local var_168_33 = arg_165_1:FormatText(var_168_32.content)

				arg_165_1.text_.text = var_168_33

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_34 = 36
				local var_168_35 = utf8.len(var_168_33)
				local var_168_36 = var_168_34 <= 0 and var_168_30 or var_168_30 * (var_168_35 / var_168_34)

				if var_168_36 > 0 and var_168_30 < var_168_36 then
					arg_165_1.talkMaxDuration = var_168_36

					if var_168_36 + var_168_29 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_36 + var_168_29
					end
				end

				arg_165_1.text_.text = var_168_33
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202041", "story_v_out_318202.awb") ~= 0 then
					local var_168_37 = manager.audio:GetVoiceLength("story_v_out_318202", "318202041", "story_v_out_318202.awb") / 1000

					if var_168_37 + var_168_29 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_37 + var_168_29
					end

					if var_168_32.prefab_name ~= "" and arg_165_1.actors_[var_168_32.prefab_name] ~= nil then
						local var_168_38 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_32.prefab_name].transform, "story_v_out_318202", "318202041", "story_v_out_318202.awb")

						arg_165_1:RecordAudio("318202041", var_168_38)
						arg_165_1:RecordAudio("318202041", var_168_38)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_318202", "318202041", "story_v_out_318202.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_318202", "318202041", "story_v_out_318202.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_39 = math.max(var_168_30, arg_165_1.talkMaxDuration)

			if var_168_29 <= arg_165_1.time_ and arg_165_1.time_ < var_168_29 + var_168_39 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_29) / var_168_39

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_29 + var_168_39 and arg_165_1.time_ < var_168_29 + var_168_39 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play318202042 = function(arg_169_0, arg_169_1)
		arg_169_1.time_ = 0
		arg_169_1.frameCnt_ = 0
		arg_169_1.state_ = "playing"
		arg_169_1.curTalkId_ = 318202042
		arg_169_1.duration_ = 7.433

		local var_169_0 = {
			zh = 7.433,
			ja = 6.266
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
				arg_169_0:Play318202043(arg_169_1)
			end
		end

		function arg_169_1.onSingleLineUpdate_(arg_172_0)
			local var_172_0 = arg_169_1.actors_["1058ui_story"].transform
			local var_172_1 = 0

			if var_172_1 < arg_169_1.time_ and arg_169_1.time_ <= var_172_1 + arg_172_0 then
				arg_169_1.var_.moveOldPos1058ui_story = var_172_0.localPosition
			end

			local var_172_2 = 0.001

			if var_172_1 <= arg_169_1.time_ and arg_169_1.time_ < var_172_1 + var_172_2 then
				local var_172_3 = (arg_169_1.time_ - var_172_1) / var_172_2
				local var_172_4 = Vector3.New(0, -0.95, -5.88)

				var_172_0.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1058ui_story, var_172_4, var_172_3)

				local var_172_5 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_5.x, var_172_5.y, var_172_5.z)

				local var_172_6 = var_172_0.localEulerAngles

				var_172_6.z = 0
				var_172_6.x = 0
				var_172_0.localEulerAngles = var_172_6
			end

			if arg_169_1.time_ >= var_172_1 + var_172_2 and arg_169_1.time_ < var_172_1 + var_172_2 + arg_172_0 then
				var_172_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_172_7 = manager.ui.mainCamera.transform.position - var_172_0.position

				var_172_0.forward = Vector3.New(var_172_7.x, var_172_7.y, var_172_7.z)

				local var_172_8 = var_172_0.localEulerAngles

				var_172_8.z = 0
				var_172_8.x = 0
				var_172_0.localEulerAngles = var_172_8
			end

			local var_172_9 = arg_169_1.actors_["1058ui_story"]
			local var_172_10 = 0

			if var_172_10 < arg_169_1.time_ and arg_169_1.time_ <= var_172_10 + arg_172_0 and arg_169_1.var_.characterEffect1058ui_story == nil then
				arg_169_1.var_.characterEffect1058ui_story = var_172_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_11 = 0.200000002980232

			if var_172_10 <= arg_169_1.time_ and arg_169_1.time_ < var_172_10 + var_172_11 then
				local var_172_12 = (arg_169_1.time_ - var_172_10) / var_172_11

				if arg_169_1.var_.characterEffect1058ui_story then
					arg_169_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_169_1.time_ >= var_172_10 + var_172_11 and arg_169_1.time_ < var_172_10 + var_172_11 + arg_172_0 and arg_169_1.var_.characterEffect1058ui_story then
				arg_169_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_172_13 = arg_169_1.actors_["1055ui_story"].transform
			local var_172_14 = 0

			if var_172_14 < arg_169_1.time_ and arg_169_1.time_ <= var_172_14 + arg_172_0 then
				arg_169_1.var_.moveOldPos1055ui_story = var_172_13.localPosition
			end

			local var_172_15 = 0.001

			if var_172_14 <= arg_169_1.time_ and arg_169_1.time_ < var_172_14 + var_172_15 then
				local var_172_16 = (arg_169_1.time_ - var_172_14) / var_172_15
				local var_172_17 = Vector3.New(0, 100, 0)

				var_172_13.localPosition = Vector3.Lerp(arg_169_1.var_.moveOldPos1055ui_story, var_172_17, var_172_16)

				local var_172_18 = manager.ui.mainCamera.transform.position - var_172_13.position

				var_172_13.forward = Vector3.New(var_172_18.x, var_172_18.y, var_172_18.z)

				local var_172_19 = var_172_13.localEulerAngles

				var_172_19.z = 0
				var_172_19.x = 0
				var_172_13.localEulerAngles = var_172_19
			end

			if arg_169_1.time_ >= var_172_14 + var_172_15 and arg_169_1.time_ < var_172_14 + var_172_15 + arg_172_0 then
				var_172_13.localPosition = Vector3.New(0, 100, 0)

				local var_172_20 = manager.ui.mainCamera.transform.position - var_172_13.position

				var_172_13.forward = Vector3.New(var_172_20.x, var_172_20.y, var_172_20.z)

				local var_172_21 = var_172_13.localEulerAngles

				var_172_21.z = 0
				var_172_21.x = 0
				var_172_13.localEulerAngles = var_172_21
			end

			local var_172_22 = arg_169_1.actors_["1055ui_story"]
			local var_172_23 = 0

			if var_172_23 < arg_169_1.time_ and arg_169_1.time_ <= var_172_23 + arg_172_0 and arg_169_1.var_.characterEffect1055ui_story == nil then
				arg_169_1.var_.characterEffect1055ui_story = var_172_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_172_24 = 0.200000002980232

			if var_172_23 <= arg_169_1.time_ and arg_169_1.time_ < var_172_23 + var_172_24 then
				local var_172_25 = (arg_169_1.time_ - var_172_23) / var_172_24

				if arg_169_1.var_.characterEffect1055ui_story then
					local var_172_26 = Mathf.Lerp(0, 0.5, var_172_25)

					arg_169_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_169_1.var_.characterEffect1055ui_story.fillRatio = var_172_26
				end
			end

			if arg_169_1.time_ >= var_172_23 + var_172_24 and arg_169_1.time_ < var_172_23 + var_172_24 + arg_172_0 and arg_169_1.var_.characterEffect1055ui_story then
				local var_172_27 = 0.5

				arg_169_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_169_1.var_.characterEffect1055ui_story.fillRatio = var_172_27
			end

			local var_172_28 = 0
			local var_172_29 = 0.8

			if var_172_28 < arg_169_1.time_ and arg_169_1.time_ <= var_172_28 + arg_172_0 then
				arg_169_1.talkMaxDuration = 0
				arg_169_1.dialogCg_.alpha = 1

				arg_169_1.dialog_:SetActive(true)
				SetActive(arg_169_1.leftNameGo_, true)

				local var_172_30 = arg_169_1:FormatText(StoryNameCfg[92].name)

				arg_169_1.leftNameTxt_.text = var_172_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_169_1.leftNameTxt_.transform)

				arg_169_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_169_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_169_1:RecordName(arg_169_1.leftNameTxt_.text)
				SetActive(arg_169_1.iconTrs_.gameObject, false)
				arg_169_1.callingController_:SetSelectedState("normal")

				local var_172_31 = arg_169_1:GetWordFromCfg(318202042)
				local var_172_32 = arg_169_1:FormatText(var_172_31.content)

				arg_169_1.text_.text = var_172_32

				LuaForUtil.ClearLinePrefixSymbol(arg_169_1.text_)

				local var_172_33 = 32
				local var_172_34 = utf8.len(var_172_32)
				local var_172_35 = var_172_33 <= 0 and var_172_29 or var_172_29 * (var_172_34 / var_172_33)

				if var_172_35 > 0 and var_172_29 < var_172_35 then
					arg_169_1.talkMaxDuration = var_172_35

					if var_172_35 + var_172_28 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_35 + var_172_28
					end
				end

				arg_169_1.text_.text = var_172_32
				arg_169_1.typewritter.percent = 0

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202042", "story_v_out_318202.awb") ~= 0 then
					local var_172_36 = manager.audio:GetVoiceLength("story_v_out_318202", "318202042", "story_v_out_318202.awb") / 1000

					if var_172_36 + var_172_28 > arg_169_1.duration_ then
						arg_169_1.duration_ = var_172_36 + var_172_28
					end

					if var_172_31.prefab_name ~= "" and arg_169_1.actors_[var_172_31.prefab_name] ~= nil then
						local var_172_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_169_1.actors_[var_172_31.prefab_name].transform, "story_v_out_318202", "318202042", "story_v_out_318202.awb")

						arg_169_1:RecordAudio("318202042", var_172_37)
						arg_169_1:RecordAudio("318202042", var_172_37)
					else
						arg_169_1:AudioAction("play", "voice", "story_v_out_318202", "318202042", "story_v_out_318202.awb")
					end

					arg_169_1:RecordHistoryTalkVoice("story_v_out_318202", "318202042", "story_v_out_318202.awb")
				end

				arg_169_1:RecordContent(arg_169_1.text_.text)
			end

			local var_172_38 = math.max(var_172_29, arg_169_1.talkMaxDuration)

			if var_172_28 <= arg_169_1.time_ and arg_169_1.time_ < var_172_28 + var_172_38 then
				arg_169_1.typewritter.percent = (arg_169_1.time_ - var_172_28) / var_172_38

				arg_169_1.typewritter:SetDirty()
			end

			if arg_169_1.time_ >= var_172_28 + var_172_38 and arg_169_1.time_ < var_172_28 + var_172_38 + arg_172_0 then
				arg_169_1.typewritter.percent = 1

				arg_169_1.typewritter:SetDirty()
				arg_169_1:ShowNextGo(true)
			end
		end
	end,
	Play318202043 = function(arg_173_0, arg_173_1)
		arg_173_1.time_ = 0
		arg_173_1.frameCnt_ = 0
		arg_173_1.state_ = "playing"
		arg_173_1.curTalkId_ = 318202043
		arg_173_1.duration_ = 10.333

		local var_173_0 = {
			zh = 8.133,
			ja = 10.333
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
				arg_173_0:Play318202044(arg_173_1)
			end
		end

		function arg_173_1.onSingleLineUpdate_(arg_176_0)
			local var_176_0 = arg_173_1.actors_["1055ui_story"].transform
			local var_176_1 = 0

			if var_176_1 < arg_173_1.time_ and arg_173_1.time_ <= var_176_1 + arg_176_0 then
				arg_173_1.var_.moveOldPos1055ui_story = var_176_0.localPosition
			end

			local var_176_2 = 0.001

			if var_176_1 <= arg_173_1.time_ and arg_173_1.time_ < var_176_1 + var_176_2 then
				local var_176_3 = (arg_173_1.time_ - var_176_1) / var_176_2
				local var_176_4 = Vector3.New(0, -0.965, -6.2)

				var_176_0.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1055ui_story, var_176_4, var_176_3)

				local var_176_5 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_5.x, var_176_5.y, var_176_5.z)

				local var_176_6 = var_176_0.localEulerAngles

				var_176_6.z = 0
				var_176_6.x = 0
				var_176_0.localEulerAngles = var_176_6
			end

			if arg_173_1.time_ >= var_176_1 + var_176_2 and arg_173_1.time_ < var_176_1 + var_176_2 + arg_176_0 then
				var_176_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_176_7 = manager.ui.mainCamera.transform.position - var_176_0.position

				var_176_0.forward = Vector3.New(var_176_7.x, var_176_7.y, var_176_7.z)

				local var_176_8 = var_176_0.localEulerAngles

				var_176_8.z = 0
				var_176_8.x = 0
				var_176_0.localEulerAngles = var_176_8
			end

			local var_176_9 = arg_173_1.actors_["1055ui_story"]
			local var_176_10 = 0

			if var_176_10 < arg_173_1.time_ and arg_173_1.time_ <= var_176_10 + arg_176_0 and arg_173_1.var_.characterEffect1055ui_story == nil then
				arg_173_1.var_.characterEffect1055ui_story = var_176_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_11 = 0.200000002980232

			if var_176_10 <= arg_173_1.time_ and arg_173_1.time_ < var_176_10 + var_176_11 then
				local var_176_12 = (arg_173_1.time_ - var_176_10) / var_176_11

				if arg_173_1.var_.characterEffect1055ui_story then
					arg_173_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_173_1.time_ >= var_176_10 + var_176_11 and arg_173_1.time_ < var_176_10 + var_176_11 + arg_176_0 and arg_173_1.var_.characterEffect1055ui_story then
				arg_173_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_176_13 = arg_173_1.actors_["1058ui_story"].transform
			local var_176_14 = 0

			if var_176_14 < arg_173_1.time_ and arg_173_1.time_ <= var_176_14 + arg_176_0 then
				arg_173_1.var_.moveOldPos1058ui_story = var_176_13.localPosition
			end

			local var_176_15 = 0.001

			if var_176_14 <= arg_173_1.time_ and arg_173_1.time_ < var_176_14 + var_176_15 then
				local var_176_16 = (arg_173_1.time_ - var_176_14) / var_176_15
				local var_176_17 = Vector3.New(0, 100, 0)

				var_176_13.localPosition = Vector3.Lerp(arg_173_1.var_.moveOldPos1058ui_story, var_176_17, var_176_16)

				local var_176_18 = manager.ui.mainCamera.transform.position - var_176_13.position

				var_176_13.forward = Vector3.New(var_176_18.x, var_176_18.y, var_176_18.z)

				local var_176_19 = var_176_13.localEulerAngles

				var_176_19.z = 0
				var_176_19.x = 0
				var_176_13.localEulerAngles = var_176_19
			end

			if arg_173_1.time_ >= var_176_14 + var_176_15 and arg_173_1.time_ < var_176_14 + var_176_15 + arg_176_0 then
				var_176_13.localPosition = Vector3.New(0, 100, 0)

				local var_176_20 = manager.ui.mainCamera.transform.position - var_176_13.position

				var_176_13.forward = Vector3.New(var_176_20.x, var_176_20.y, var_176_20.z)

				local var_176_21 = var_176_13.localEulerAngles

				var_176_21.z = 0
				var_176_21.x = 0
				var_176_13.localEulerAngles = var_176_21
			end

			local var_176_22 = arg_173_1.actors_["1058ui_story"]
			local var_176_23 = 0

			if var_176_23 < arg_173_1.time_ and arg_173_1.time_ <= var_176_23 + arg_176_0 and arg_173_1.var_.characterEffect1058ui_story == nil then
				arg_173_1.var_.characterEffect1058ui_story = var_176_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_176_24 = 0.200000002980232

			if var_176_23 <= arg_173_1.time_ and arg_173_1.time_ < var_176_23 + var_176_24 then
				local var_176_25 = (arg_173_1.time_ - var_176_23) / var_176_24

				if arg_173_1.var_.characterEffect1058ui_story then
					local var_176_26 = Mathf.Lerp(0, 0.5, var_176_25)

					arg_173_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_173_1.var_.characterEffect1058ui_story.fillRatio = var_176_26
				end
			end

			if arg_173_1.time_ >= var_176_23 + var_176_24 and arg_173_1.time_ < var_176_23 + var_176_24 + arg_176_0 and arg_173_1.var_.characterEffect1058ui_story then
				local var_176_27 = 0.5

				arg_173_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_173_1.var_.characterEffect1058ui_story.fillRatio = var_176_27
			end

			local var_176_28 = 0
			local var_176_29 = 0.775

			if var_176_28 < arg_173_1.time_ and arg_173_1.time_ <= var_176_28 + arg_176_0 then
				arg_173_1.talkMaxDuration = 0
				arg_173_1.dialogCg_.alpha = 1

				arg_173_1.dialog_:SetActive(true)
				SetActive(arg_173_1.leftNameGo_, true)

				local var_176_30 = arg_173_1:FormatText(StoryNameCfg[481].name)

				arg_173_1.leftNameTxt_.text = var_176_30

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_173_1.leftNameTxt_.transform)

				arg_173_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_173_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_173_1:RecordName(arg_173_1.leftNameTxt_.text)
				SetActive(arg_173_1.iconTrs_.gameObject, false)
				arg_173_1.callingController_:SetSelectedState("normal")

				local var_176_31 = arg_173_1:GetWordFromCfg(318202043)
				local var_176_32 = arg_173_1:FormatText(var_176_31.content)

				arg_173_1.text_.text = var_176_32

				LuaForUtil.ClearLinePrefixSymbol(arg_173_1.text_)

				local var_176_33 = 31
				local var_176_34 = utf8.len(var_176_32)
				local var_176_35 = var_176_33 <= 0 and var_176_29 or var_176_29 * (var_176_34 / var_176_33)

				if var_176_35 > 0 and var_176_29 < var_176_35 then
					arg_173_1.talkMaxDuration = var_176_35

					if var_176_35 + var_176_28 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_35 + var_176_28
					end
				end

				arg_173_1.text_.text = var_176_32
				arg_173_1.typewritter.percent = 0

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202043", "story_v_out_318202.awb") ~= 0 then
					local var_176_36 = manager.audio:GetVoiceLength("story_v_out_318202", "318202043", "story_v_out_318202.awb") / 1000

					if var_176_36 + var_176_28 > arg_173_1.duration_ then
						arg_173_1.duration_ = var_176_36 + var_176_28
					end

					if var_176_31.prefab_name ~= "" and arg_173_1.actors_[var_176_31.prefab_name] ~= nil then
						local var_176_37 = LuaForUtil.PlayVoiceWithCriLipsync(arg_173_1.actors_[var_176_31.prefab_name].transform, "story_v_out_318202", "318202043", "story_v_out_318202.awb")

						arg_173_1:RecordAudio("318202043", var_176_37)
						arg_173_1:RecordAudio("318202043", var_176_37)
					else
						arg_173_1:AudioAction("play", "voice", "story_v_out_318202", "318202043", "story_v_out_318202.awb")
					end

					arg_173_1:RecordHistoryTalkVoice("story_v_out_318202", "318202043", "story_v_out_318202.awb")
				end

				arg_173_1:RecordContent(arg_173_1.text_.text)
			end

			local var_176_38 = math.max(var_176_29, arg_173_1.talkMaxDuration)

			if var_176_28 <= arg_173_1.time_ and arg_173_1.time_ < var_176_28 + var_176_38 then
				arg_173_1.typewritter.percent = (arg_173_1.time_ - var_176_28) / var_176_38

				arg_173_1.typewritter:SetDirty()
			end

			if arg_173_1.time_ >= var_176_28 + var_176_38 and arg_173_1.time_ < var_176_28 + var_176_38 + arg_176_0 then
				arg_173_1.typewritter.percent = 1

				arg_173_1.typewritter:SetDirty()
				arg_173_1:ShowNextGo(true)
			end
		end
	end,
	Play318202044 = function(arg_177_0, arg_177_1)
		arg_177_1.time_ = 0
		arg_177_1.frameCnt_ = 0
		arg_177_1.state_ = "playing"
		arg_177_1.curTalkId_ = 318202044
		arg_177_1.duration_ = 5

		SetActive(arg_177_1.tipsGo_, false)

		function arg_177_1.onSingleLineFinish_()
			arg_177_1.onSingleLineUpdate_ = nil
			arg_177_1.onSingleLineFinish_ = nil
			arg_177_1.state_ = "waiting"
		end

		function arg_177_1.playNext_(arg_179_0)
			if arg_179_0 == 1 then
				arg_177_0:Play318202045(arg_177_1)
			end
		end

		function arg_177_1.onSingleLineUpdate_(arg_180_0)
			local var_180_0 = arg_177_1.actors_["1055ui_story"].transform
			local var_180_1 = 0

			if var_180_1 < arg_177_1.time_ and arg_177_1.time_ <= var_180_1 + arg_180_0 then
				arg_177_1.var_.moveOldPos1055ui_story = var_180_0.localPosition
			end

			local var_180_2 = 0.001

			if var_180_1 <= arg_177_1.time_ and arg_177_1.time_ < var_180_1 + var_180_2 then
				local var_180_3 = (arg_177_1.time_ - var_180_1) / var_180_2
				local var_180_4 = Vector3.New(0, 100, 0)

				var_180_0.localPosition = Vector3.Lerp(arg_177_1.var_.moveOldPos1055ui_story, var_180_4, var_180_3)

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

			local var_180_9 = arg_177_1.actors_["1055ui_story"]
			local var_180_10 = 0

			if var_180_10 < arg_177_1.time_ and arg_177_1.time_ <= var_180_10 + arg_180_0 and arg_177_1.var_.characterEffect1055ui_story == nil then
				arg_177_1.var_.characterEffect1055ui_story = var_180_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_180_11 = 0.200000002980232

			if var_180_10 <= arg_177_1.time_ and arg_177_1.time_ < var_180_10 + var_180_11 then
				local var_180_12 = (arg_177_1.time_ - var_180_10) / var_180_11

				if arg_177_1.var_.characterEffect1055ui_story then
					local var_180_13 = Mathf.Lerp(0, 0.5, var_180_12)

					arg_177_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_177_1.var_.characterEffect1055ui_story.fillRatio = var_180_13
				end
			end

			if arg_177_1.time_ >= var_180_10 + var_180_11 and arg_177_1.time_ < var_180_10 + var_180_11 + arg_180_0 and arg_177_1.var_.characterEffect1055ui_story then
				local var_180_14 = 0.5

				arg_177_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_177_1.var_.characterEffect1055ui_story.fillRatio = var_180_14
			end

			local var_180_15 = 0
			local var_180_16 = 0.5

			if var_180_15 < arg_177_1.time_ and arg_177_1.time_ <= var_180_15 + arg_180_0 then
				arg_177_1.talkMaxDuration = 0
				arg_177_1.dialogCg_.alpha = 1

				arg_177_1.dialog_:SetActive(true)
				SetActive(arg_177_1.leftNameGo_, false)

				arg_177_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_177_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_177_1:RecordName(arg_177_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_177_1.iconTrs_.gameObject, false)
				arg_177_1.callingController_:SetSelectedState("normal")

				local var_180_17 = arg_177_1:GetWordFromCfg(318202044)
				local var_180_18 = arg_177_1:FormatText(var_180_17.content)

				arg_177_1.text_.text = var_180_18

				LuaForUtil.ClearLinePrefixSymbol(arg_177_1.text_)

				local var_180_19 = 20
				local var_180_20 = utf8.len(var_180_18)
				local var_180_21 = var_180_19 <= 0 and var_180_16 or var_180_16 * (var_180_20 / var_180_19)

				if var_180_21 > 0 and var_180_16 < var_180_21 then
					arg_177_1.talkMaxDuration = var_180_21

					if var_180_21 + var_180_15 > arg_177_1.duration_ then
						arg_177_1.duration_ = var_180_21 + var_180_15
					end
				end

				arg_177_1.text_.text = var_180_18
				arg_177_1.typewritter.percent = 0

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(false)
				arg_177_1:RecordContent(arg_177_1.text_.text)
			end

			local var_180_22 = math.max(var_180_16, arg_177_1.talkMaxDuration)

			if var_180_15 <= arg_177_1.time_ and arg_177_1.time_ < var_180_15 + var_180_22 then
				arg_177_1.typewritter.percent = (arg_177_1.time_ - var_180_15) / var_180_22

				arg_177_1.typewritter:SetDirty()
			end

			if arg_177_1.time_ >= var_180_15 + var_180_22 and arg_177_1.time_ < var_180_15 + var_180_22 + arg_180_0 then
				arg_177_1.typewritter.percent = 1

				arg_177_1.typewritter:SetDirty()
				arg_177_1:ShowNextGo(true)
			end
		end
	end,
	Play318202045 = function(arg_181_0, arg_181_1)
		arg_181_1.time_ = 0
		arg_181_1.frameCnt_ = 0
		arg_181_1.state_ = "playing"
		arg_181_1.curTalkId_ = 318202045
		arg_181_1.duration_ = 10.533

		local var_181_0 = {
			zh = 10.533,
			ja = 9.1
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
				arg_181_0:Play318202046(arg_181_1)
			end
		end

		function arg_181_1.onSingleLineUpdate_(arg_184_0)
			local var_184_0 = arg_181_1.actors_["1055ui_story"].transform
			local var_184_1 = 0

			if var_184_1 < arg_181_1.time_ and arg_181_1.time_ <= var_184_1 + arg_184_0 then
				arg_181_1.var_.moveOldPos1055ui_story = var_184_0.localPosition
			end

			local var_184_2 = 0.001

			if var_184_1 <= arg_181_1.time_ and arg_181_1.time_ < var_184_1 + var_184_2 then
				local var_184_3 = (arg_181_1.time_ - var_184_1) / var_184_2
				local var_184_4 = Vector3.New(0, -0.965, -6.2)

				var_184_0.localPosition = Vector3.Lerp(arg_181_1.var_.moveOldPos1055ui_story, var_184_4, var_184_3)

				local var_184_5 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_5.x, var_184_5.y, var_184_5.z)

				local var_184_6 = var_184_0.localEulerAngles

				var_184_6.z = 0
				var_184_6.x = 0
				var_184_0.localEulerAngles = var_184_6
			end

			if arg_181_1.time_ >= var_184_1 + var_184_2 and arg_181_1.time_ < var_184_1 + var_184_2 + arg_184_0 then
				var_184_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_184_7 = manager.ui.mainCamera.transform.position - var_184_0.position

				var_184_0.forward = Vector3.New(var_184_7.x, var_184_7.y, var_184_7.z)

				local var_184_8 = var_184_0.localEulerAngles

				var_184_8.z = 0
				var_184_8.x = 0
				var_184_0.localEulerAngles = var_184_8
			end

			local var_184_9 = arg_181_1.actors_["1055ui_story"]
			local var_184_10 = 0

			if var_184_10 < arg_181_1.time_ and arg_181_1.time_ <= var_184_10 + arg_184_0 and arg_181_1.var_.characterEffect1055ui_story == nil then
				arg_181_1.var_.characterEffect1055ui_story = var_184_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_184_11 = 0.200000002980232

			if var_184_10 <= arg_181_1.time_ and arg_181_1.time_ < var_184_10 + var_184_11 then
				local var_184_12 = (arg_181_1.time_ - var_184_10) / var_184_11

				if arg_181_1.var_.characterEffect1055ui_story then
					arg_181_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_181_1.time_ >= var_184_10 + var_184_11 and arg_181_1.time_ < var_184_10 + var_184_11 + arg_184_0 and arg_181_1.var_.characterEffect1055ui_story then
				arg_181_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_184_13 = 0
			local var_184_14 = 1.225

			if var_184_13 < arg_181_1.time_ and arg_181_1.time_ <= var_184_13 + arg_184_0 then
				arg_181_1.talkMaxDuration = 0
				arg_181_1.dialogCg_.alpha = 1

				arg_181_1.dialog_:SetActive(true)
				SetActive(arg_181_1.leftNameGo_, true)

				local var_184_15 = arg_181_1:FormatText(StoryNameCfg[481].name)

				arg_181_1.leftNameTxt_.text = var_184_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_181_1.leftNameTxt_.transform)

				arg_181_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_181_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_181_1:RecordName(arg_181_1.leftNameTxt_.text)
				SetActive(arg_181_1.iconTrs_.gameObject, false)
				arg_181_1.callingController_:SetSelectedState("normal")

				local var_184_16 = arg_181_1:GetWordFromCfg(318202045)
				local var_184_17 = arg_181_1:FormatText(var_184_16.content)

				arg_181_1.text_.text = var_184_17

				LuaForUtil.ClearLinePrefixSymbol(arg_181_1.text_)

				local var_184_18 = 49
				local var_184_19 = utf8.len(var_184_17)
				local var_184_20 = var_184_18 <= 0 and var_184_14 or var_184_14 * (var_184_19 / var_184_18)

				if var_184_20 > 0 and var_184_14 < var_184_20 then
					arg_181_1.talkMaxDuration = var_184_20

					if var_184_20 + var_184_13 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_20 + var_184_13
					end
				end

				arg_181_1.text_.text = var_184_17
				arg_181_1.typewritter.percent = 0

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202045", "story_v_out_318202.awb") ~= 0 then
					local var_184_21 = manager.audio:GetVoiceLength("story_v_out_318202", "318202045", "story_v_out_318202.awb") / 1000

					if var_184_21 + var_184_13 > arg_181_1.duration_ then
						arg_181_1.duration_ = var_184_21 + var_184_13
					end

					if var_184_16.prefab_name ~= "" and arg_181_1.actors_[var_184_16.prefab_name] ~= nil then
						local var_184_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_181_1.actors_[var_184_16.prefab_name].transform, "story_v_out_318202", "318202045", "story_v_out_318202.awb")

						arg_181_1:RecordAudio("318202045", var_184_22)
						arg_181_1:RecordAudio("318202045", var_184_22)
					else
						arg_181_1:AudioAction("play", "voice", "story_v_out_318202", "318202045", "story_v_out_318202.awb")
					end

					arg_181_1:RecordHistoryTalkVoice("story_v_out_318202", "318202045", "story_v_out_318202.awb")
				end

				arg_181_1:RecordContent(arg_181_1.text_.text)
			end

			local var_184_23 = math.max(var_184_14, arg_181_1.talkMaxDuration)

			if var_184_13 <= arg_181_1.time_ and arg_181_1.time_ < var_184_13 + var_184_23 then
				arg_181_1.typewritter.percent = (arg_181_1.time_ - var_184_13) / var_184_23

				arg_181_1.typewritter:SetDirty()
			end

			if arg_181_1.time_ >= var_184_13 + var_184_23 and arg_181_1.time_ < var_184_13 + var_184_23 + arg_184_0 then
				arg_181_1.typewritter.percent = 1

				arg_181_1.typewritter:SetDirty()
				arg_181_1:ShowNextGo(true)
			end
		end
	end,
	Play318202046 = function(arg_185_0, arg_185_1)
		arg_185_1.time_ = 0
		arg_185_1.frameCnt_ = 0
		arg_185_1.state_ = "playing"
		arg_185_1.curTalkId_ = 318202046
		arg_185_1.duration_ = 7

		local var_185_0 = {
			zh = 7,
			ja = 4.933
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
				arg_185_0:Play318202047(arg_185_1)
			end
		end

		function arg_185_1.onSingleLineUpdate_(arg_188_0)
			local var_188_0 = 0
			local var_188_1 = 0.825

			if var_188_0 < arg_185_1.time_ and arg_185_1.time_ <= var_188_0 + arg_188_0 then
				arg_185_1.talkMaxDuration = 0
				arg_185_1.dialogCg_.alpha = 1

				arg_185_1.dialog_:SetActive(true)
				SetActive(arg_185_1.leftNameGo_, true)

				local var_188_2 = arg_185_1:FormatText(StoryNameCfg[481].name)

				arg_185_1.leftNameTxt_.text = var_188_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_185_1.leftNameTxt_.transform)

				arg_185_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_185_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_185_1:RecordName(arg_185_1.leftNameTxt_.text)
				SetActive(arg_185_1.iconTrs_.gameObject, false)
				arg_185_1.callingController_:SetSelectedState("normal")

				local var_188_3 = arg_185_1:GetWordFromCfg(318202046)
				local var_188_4 = arg_185_1:FormatText(var_188_3.content)

				arg_185_1.text_.text = var_188_4

				LuaForUtil.ClearLinePrefixSymbol(arg_185_1.text_)

				local var_188_5 = 33
				local var_188_6 = utf8.len(var_188_4)
				local var_188_7 = var_188_5 <= 0 and var_188_1 or var_188_1 * (var_188_6 / var_188_5)

				if var_188_7 > 0 and var_188_1 < var_188_7 then
					arg_185_1.talkMaxDuration = var_188_7

					if var_188_7 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_7 + var_188_0
					end
				end

				arg_185_1.text_.text = var_188_4
				arg_185_1.typewritter.percent = 0

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202046", "story_v_out_318202.awb") ~= 0 then
					local var_188_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202046", "story_v_out_318202.awb") / 1000

					if var_188_8 + var_188_0 > arg_185_1.duration_ then
						arg_185_1.duration_ = var_188_8 + var_188_0
					end

					if var_188_3.prefab_name ~= "" and arg_185_1.actors_[var_188_3.prefab_name] ~= nil then
						local var_188_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_185_1.actors_[var_188_3.prefab_name].transform, "story_v_out_318202", "318202046", "story_v_out_318202.awb")

						arg_185_1:RecordAudio("318202046", var_188_9)
						arg_185_1:RecordAudio("318202046", var_188_9)
					else
						arg_185_1:AudioAction("play", "voice", "story_v_out_318202", "318202046", "story_v_out_318202.awb")
					end

					arg_185_1:RecordHistoryTalkVoice("story_v_out_318202", "318202046", "story_v_out_318202.awb")
				end

				arg_185_1:RecordContent(arg_185_1.text_.text)
			end

			local var_188_10 = math.max(var_188_1, arg_185_1.talkMaxDuration)

			if var_188_0 <= arg_185_1.time_ and arg_185_1.time_ < var_188_0 + var_188_10 then
				arg_185_1.typewritter.percent = (arg_185_1.time_ - var_188_0) / var_188_10

				arg_185_1.typewritter:SetDirty()
			end

			if arg_185_1.time_ >= var_188_0 + var_188_10 and arg_185_1.time_ < var_188_0 + var_188_10 + arg_188_0 then
				arg_185_1.typewritter.percent = 1

				arg_185_1.typewritter:SetDirty()
				arg_185_1:ShowNextGo(true)
			end
		end
	end,
	Play318202047 = function(arg_189_0, arg_189_1)
		arg_189_1.time_ = 0
		arg_189_1.frameCnt_ = 0
		arg_189_1.state_ = "playing"
		arg_189_1.curTalkId_ = 318202047
		arg_189_1.duration_ = 7.333

		local var_189_0 = {
			zh = 5.266,
			ja = 7.333
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
				arg_189_0:Play318202048(arg_189_1)
			end
		end

		function arg_189_1.onSingleLineUpdate_(arg_192_0)
			local var_192_0 = 0
			local var_192_1 = 0.575

			if var_192_0 < arg_189_1.time_ and arg_189_1.time_ <= var_192_0 + arg_192_0 then
				arg_189_1.talkMaxDuration = 0
				arg_189_1.dialogCg_.alpha = 1

				arg_189_1.dialog_:SetActive(true)
				SetActive(arg_189_1.leftNameGo_, true)

				local var_192_2 = arg_189_1:FormatText(StoryNameCfg[481].name)

				arg_189_1.leftNameTxt_.text = var_192_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_189_1.leftNameTxt_.transform)

				arg_189_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_189_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_189_1:RecordName(arg_189_1.leftNameTxt_.text)
				SetActive(arg_189_1.iconTrs_.gameObject, false)
				arg_189_1.callingController_:SetSelectedState("normal")

				local var_192_3 = arg_189_1:GetWordFromCfg(318202047)
				local var_192_4 = arg_189_1:FormatText(var_192_3.content)

				arg_189_1.text_.text = var_192_4

				LuaForUtil.ClearLinePrefixSymbol(arg_189_1.text_)

				local var_192_5 = 23
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202047", "story_v_out_318202.awb") ~= 0 then
					local var_192_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202047", "story_v_out_318202.awb") / 1000

					if var_192_8 + var_192_0 > arg_189_1.duration_ then
						arg_189_1.duration_ = var_192_8 + var_192_0
					end

					if var_192_3.prefab_name ~= "" and arg_189_1.actors_[var_192_3.prefab_name] ~= nil then
						local var_192_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_189_1.actors_[var_192_3.prefab_name].transform, "story_v_out_318202", "318202047", "story_v_out_318202.awb")

						arg_189_1:RecordAudio("318202047", var_192_9)
						arg_189_1:RecordAudio("318202047", var_192_9)
					else
						arg_189_1:AudioAction("play", "voice", "story_v_out_318202", "318202047", "story_v_out_318202.awb")
					end

					arg_189_1:RecordHistoryTalkVoice("story_v_out_318202", "318202047", "story_v_out_318202.awb")
				end

				arg_189_1:RecordContent(arg_189_1.text_.text)
			end

			local var_192_10 = math.max(var_192_1, arg_189_1.talkMaxDuration)

			if var_192_0 <= arg_189_1.time_ and arg_189_1.time_ < var_192_0 + var_192_10 then
				arg_189_1.typewritter.percent = (arg_189_1.time_ - var_192_0) / var_192_10

				arg_189_1.typewritter:SetDirty()
			end

			if arg_189_1.time_ >= var_192_0 + var_192_10 and arg_189_1.time_ < var_192_0 + var_192_10 + arg_192_0 then
				arg_189_1.typewritter.percent = 1

				arg_189_1.typewritter:SetDirty()
				arg_189_1:ShowNextGo(true)
			end
		end
	end,
	Play318202048 = function(arg_193_0, arg_193_1)
		arg_193_1.time_ = 0
		arg_193_1.frameCnt_ = 0
		arg_193_1.state_ = "playing"
		arg_193_1.curTalkId_ = 318202048
		arg_193_1.duration_ = 11.266

		local var_193_0 = {
			zh = 11.266,
			ja = 5.533
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
				arg_193_0:Play318202049(arg_193_1)
			end
		end

		function arg_193_1.onSingleLineUpdate_(arg_196_0)
			local var_196_0 = 0
			local var_196_1 = 0.675

			if var_196_0 < arg_193_1.time_ and arg_193_1.time_ <= var_196_0 + arg_196_0 then
				arg_193_1.talkMaxDuration = 0
				arg_193_1.dialogCg_.alpha = 1

				arg_193_1.dialog_:SetActive(true)
				SetActive(arg_193_1.leftNameGo_, true)

				local var_196_2 = arg_193_1:FormatText(StoryNameCfg[481].name)

				arg_193_1.leftNameTxt_.text = var_196_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_193_1.leftNameTxt_.transform)

				arg_193_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_193_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_193_1:RecordName(arg_193_1.leftNameTxt_.text)
				SetActive(arg_193_1.iconTrs_.gameObject, false)
				arg_193_1.callingController_:SetSelectedState("normal")

				local var_196_3 = arg_193_1:GetWordFromCfg(318202048)
				local var_196_4 = arg_193_1:FormatText(var_196_3.content)

				arg_193_1.text_.text = var_196_4

				LuaForUtil.ClearLinePrefixSymbol(arg_193_1.text_)

				local var_196_5 = 27
				local var_196_6 = utf8.len(var_196_4)
				local var_196_7 = var_196_5 <= 0 and var_196_1 or var_196_1 * (var_196_6 / var_196_5)

				if var_196_7 > 0 and var_196_1 < var_196_7 then
					arg_193_1.talkMaxDuration = var_196_7

					if var_196_7 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_7 + var_196_0
					end
				end

				arg_193_1.text_.text = var_196_4
				arg_193_1.typewritter.percent = 0

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202048", "story_v_out_318202.awb") ~= 0 then
					local var_196_8 = manager.audio:GetVoiceLength("story_v_out_318202", "318202048", "story_v_out_318202.awb") / 1000

					if var_196_8 + var_196_0 > arg_193_1.duration_ then
						arg_193_1.duration_ = var_196_8 + var_196_0
					end

					if var_196_3.prefab_name ~= "" and arg_193_1.actors_[var_196_3.prefab_name] ~= nil then
						local var_196_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_193_1.actors_[var_196_3.prefab_name].transform, "story_v_out_318202", "318202048", "story_v_out_318202.awb")

						arg_193_1:RecordAudio("318202048", var_196_9)
						arg_193_1:RecordAudio("318202048", var_196_9)
					else
						arg_193_1:AudioAction("play", "voice", "story_v_out_318202", "318202048", "story_v_out_318202.awb")
					end

					arg_193_1:RecordHistoryTalkVoice("story_v_out_318202", "318202048", "story_v_out_318202.awb")
				end

				arg_193_1:RecordContent(arg_193_1.text_.text)
			end

			local var_196_10 = math.max(var_196_1, arg_193_1.talkMaxDuration)

			if var_196_0 <= arg_193_1.time_ and arg_193_1.time_ < var_196_0 + var_196_10 then
				arg_193_1.typewritter.percent = (arg_193_1.time_ - var_196_0) / var_196_10

				arg_193_1.typewritter:SetDirty()
			end

			if arg_193_1.time_ >= var_196_0 + var_196_10 and arg_193_1.time_ < var_196_0 + var_196_10 + arg_196_0 then
				arg_193_1.typewritter.percent = 1

				arg_193_1.typewritter:SetDirty()
				arg_193_1:ShowNextGo(true)
			end
		end
	end,
	Play318202049 = function(arg_197_0, arg_197_1)
		arg_197_1.time_ = 0
		arg_197_1.frameCnt_ = 0
		arg_197_1.state_ = "playing"
		arg_197_1.curTalkId_ = 318202049
		arg_197_1.duration_ = 5

		SetActive(arg_197_1.tipsGo_, false)

		function arg_197_1.onSingleLineFinish_()
			arg_197_1.onSingleLineUpdate_ = nil
			arg_197_1.onSingleLineFinish_ = nil
			arg_197_1.state_ = "waiting"
		end

		function arg_197_1.playNext_(arg_199_0)
			if arg_199_0 == 1 then
				arg_197_0:Play318202050(arg_197_1)
			end
		end

		function arg_197_1.onSingleLineUpdate_(arg_200_0)
			local var_200_0 = arg_197_1.actors_["1055ui_story"]
			local var_200_1 = 0

			if var_200_1 < arg_197_1.time_ and arg_197_1.time_ <= var_200_1 + arg_200_0 and arg_197_1.var_.characterEffect1055ui_story == nil then
				arg_197_1.var_.characterEffect1055ui_story = var_200_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_200_2 = 0.200000002980232

			if var_200_1 <= arg_197_1.time_ and arg_197_1.time_ < var_200_1 + var_200_2 then
				local var_200_3 = (arg_197_1.time_ - var_200_1) / var_200_2

				if arg_197_1.var_.characterEffect1055ui_story then
					local var_200_4 = Mathf.Lerp(0, 0.5, var_200_3)

					arg_197_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_197_1.var_.characterEffect1055ui_story.fillRatio = var_200_4
				end
			end

			if arg_197_1.time_ >= var_200_1 + var_200_2 and arg_197_1.time_ < var_200_1 + var_200_2 + arg_200_0 and arg_197_1.var_.characterEffect1055ui_story then
				local var_200_5 = 0.5

				arg_197_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_197_1.var_.characterEffect1055ui_story.fillRatio = var_200_5
			end

			local var_200_6 = 0
			local var_200_7 = 0.725

			if var_200_6 < arg_197_1.time_ and arg_197_1.time_ <= var_200_6 + arg_200_0 then
				arg_197_1.talkMaxDuration = 0
				arg_197_1.dialogCg_.alpha = 1

				arg_197_1.dialog_:SetActive(true)
				SetActive(arg_197_1.leftNameGo_, false)

				arg_197_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_197_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_197_1:RecordName(arg_197_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_197_1.iconTrs_.gameObject, false)
				arg_197_1.callingController_:SetSelectedState("normal")

				local var_200_8 = arg_197_1:GetWordFromCfg(318202049)
				local var_200_9 = arg_197_1:FormatText(var_200_8.content)

				arg_197_1.text_.text = var_200_9

				LuaForUtil.ClearLinePrefixSymbol(arg_197_1.text_)

				local var_200_10 = 29
				local var_200_11 = utf8.len(var_200_9)
				local var_200_12 = var_200_10 <= 0 and var_200_7 or var_200_7 * (var_200_11 / var_200_10)

				if var_200_12 > 0 and var_200_7 < var_200_12 then
					arg_197_1.talkMaxDuration = var_200_12

					if var_200_12 + var_200_6 > arg_197_1.duration_ then
						arg_197_1.duration_ = var_200_12 + var_200_6
					end
				end

				arg_197_1.text_.text = var_200_9
				arg_197_1.typewritter.percent = 0

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(false)
				arg_197_1:RecordContent(arg_197_1.text_.text)
			end

			local var_200_13 = math.max(var_200_7, arg_197_1.talkMaxDuration)

			if var_200_6 <= arg_197_1.time_ and arg_197_1.time_ < var_200_6 + var_200_13 then
				arg_197_1.typewritter.percent = (arg_197_1.time_ - var_200_6) / var_200_13

				arg_197_1.typewritter:SetDirty()
			end

			if arg_197_1.time_ >= var_200_6 + var_200_13 and arg_197_1.time_ < var_200_6 + var_200_13 + arg_200_0 then
				arg_197_1.typewritter.percent = 1

				arg_197_1.typewritter:SetDirty()
				arg_197_1:ShowNextGo(true)
			end
		end
	end,
	Play318202050 = function(arg_201_0, arg_201_1)
		arg_201_1.time_ = 0
		arg_201_1.frameCnt_ = 0
		arg_201_1.state_ = "playing"
		arg_201_1.curTalkId_ = 318202050
		arg_201_1.duration_ = 4.1

		local var_201_0 = {
			zh = 3.766,
			ja = 4.1
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
				arg_201_0:Play318202051(arg_201_1)
			end
		end

		function arg_201_1.onSingleLineUpdate_(arg_204_0)
			local var_204_0 = arg_201_1.actors_["1055ui_story"].transform
			local var_204_1 = 0

			if var_204_1 < arg_201_1.time_ and arg_201_1.time_ <= var_204_1 + arg_204_0 then
				arg_201_1.var_.moveOldPos1055ui_story = var_204_0.localPosition
			end

			local var_204_2 = 0.001

			if var_204_1 <= arg_201_1.time_ and arg_201_1.time_ < var_204_1 + var_204_2 then
				local var_204_3 = (arg_201_1.time_ - var_204_1) / var_204_2
				local var_204_4 = Vector3.New(0, -0.965, -6.2)

				var_204_0.localPosition = Vector3.Lerp(arg_201_1.var_.moveOldPos1055ui_story, var_204_4, var_204_3)

				local var_204_5 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_5.x, var_204_5.y, var_204_5.z)

				local var_204_6 = var_204_0.localEulerAngles

				var_204_6.z = 0
				var_204_6.x = 0
				var_204_0.localEulerAngles = var_204_6
			end

			if arg_201_1.time_ >= var_204_1 + var_204_2 and arg_201_1.time_ < var_204_1 + var_204_2 + arg_204_0 then
				var_204_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_204_7 = manager.ui.mainCamera.transform.position - var_204_0.position

				var_204_0.forward = Vector3.New(var_204_7.x, var_204_7.y, var_204_7.z)

				local var_204_8 = var_204_0.localEulerAngles

				var_204_8.z = 0
				var_204_8.x = 0
				var_204_0.localEulerAngles = var_204_8
			end

			local var_204_9 = arg_201_1.actors_["1055ui_story"]
			local var_204_10 = 0

			if var_204_10 < arg_201_1.time_ and arg_201_1.time_ <= var_204_10 + arg_204_0 and arg_201_1.var_.characterEffect1055ui_story == nil then
				arg_201_1.var_.characterEffect1055ui_story = var_204_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_204_11 = 0.200000002980232

			if var_204_10 <= arg_201_1.time_ and arg_201_1.time_ < var_204_10 + var_204_11 then
				local var_204_12 = (arg_201_1.time_ - var_204_10) / var_204_11

				if arg_201_1.var_.characterEffect1055ui_story then
					arg_201_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_201_1.time_ >= var_204_10 + var_204_11 and arg_201_1.time_ < var_204_10 + var_204_11 + arg_204_0 and arg_201_1.var_.characterEffect1055ui_story then
				arg_201_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_204_13 = 0

			if var_204_13 < arg_201_1.time_ and arg_201_1.time_ <= var_204_13 + arg_204_0 then
				arg_201_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action2_1")
			end

			local var_204_14 = 0

			if var_204_14 < arg_201_1.time_ and arg_201_1.time_ <= var_204_14 + arg_204_0 then
				arg_201_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0201cva")
			end

			local var_204_15 = 0
			local var_204_16 = 0.4

			if var_204_15 < arg_201_1.time_ and arg_201_1.time_ <= var_204_15 + arg_204_0 then
				arg_201_1.talkMaxDuration = 0
				arg_201_1.dialogCg_.alpha = 1

				arg_201_1.dialog_:SetActive(true)
				SetActive(arg_201_1.leftNameGo_, true)

				local var_204_17 = arg_201_1:FormatText(StoryNameCfg[481].name)

				arg_201_1.leftNameTxt_.text = var_204_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_201_1.leftNameTxt_.transform)

				arg_201_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_201_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_201_1:RecordName(arg_201_1.leftNameTxt_.text)
				SetActive(arg_201_1.iconTrs_.gameObject, false)
				arg_201_1.callingController_:SetSelectedState("normal")

				local var_204_18 = arg_201_1:GetWordFromCfg(318202050)
				local var_204_19 = arg_201_1:FormatText(var_204_18.content)

				arg_201_1.text_.text = var_204_19

				LuaForUtil.ClearLinePrefixSymbol(arg_201_1.text_)

				local var_204_20 = 16
				local var_204_21 = utf8.len(var_204_19)
				local var_204_22 = var_204_20 <= 0 and var_204_16 or var_204_16 * (var_204_21 / var_204_20)

				if var_204_22 > 0 and var_204_16 < var_204_22 then
					arg_201_1.talkMaxDuration = var_204_22

					if var_204_22 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_22 + var_204_15
					end
				end

				arg_201_1.text_.text = var_204_19
				arg_201_1.typewritter.percent = 0

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202050", "story_v_out_318202.awb") ~= 0 then
					local var_204_23 = manager.audio:GetVoiceLength("story_v_out_318202", "318202050", "story_v_out_318202.awb") / 1000

					if var_204_23 + var_204_15 > arg_201_1.duration_ then
						arg_201_1.duration_ = var_204_23 + var_204_15
					end

					if var_204_18.prefab_name ~= "" and arg_201_1.actors_[var_204_18.prefab_name] ~= nil then
						local var_204_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_201_1.actors_[var_204_18.prefab_name].transform, "story_v_out_318202", "318202050", "story_v_out_318202.awb")

						arg_201_1:RecordAudio("318202050", var_204_24)
						arg_201_1:RecordAudio("318202050", var_204_24)
					else
						arg_201_1:AudioAction("play", "voice", "story_v_out_318202", "318202050", "story_v_out_318202.awb")
					end

					arg_201_1:RecordHistoryTalkVoice("story_v_out_318202", "318202050", "story_v_out_318202.awb")
				end

				arg_201_1:RecordContent(arg_201_1.text_.text)
			end

			local var_204_25 = math.max(var_204_16, arg_201_1.talkMaxDuration)

			if var_204_15 <= arg_201_1.time_ and arg_201_1.time_ < var_204_15 + var_204_25 then
				arg_201_1.typewritter.percent = (arg_201_1.time_ - var_204_15) / var_204_25

				arg_201_1.typewritter:SetDirty()
			end

			if arg_201_1.time_ >= var_204_15 + var_204_25 and arg_201_1.time_ < var_204_15 + var_204_25 + arg_204_0 then
				arg_201_1.typewritter.percent = 1

				arg_201_1.typewritter:SetDirty()
				arg_201_1:ShowNextGo(true)
			end
		end
	end,
	Play318202051 = function(arg_205_0, arg_205_1)
		arg_205_1.time_ = 0
		arg_205_1.frameCnt_ = 0
		arg_205_1.state_ = "playing"
		arg_205_1.curTalkId_ = 318202051
		arg_205_1.duration_ = 7.433

		local var_205_0 = {
			zh = 4.833,
			ja = 7.433
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
				arg_205_0:Play318202052(arg_205_1)
			end
		end

		function arg_205_1.onSingleLineUpdate_(arg_208_0)
			local var_208_0 = arg_205_1.actors_["1058ui_story"].transform
			local var_208_1 = 0

			if var_208_1 < arg_205_1.time_ and arg_205_1.time_ <= var_208_1 + arg_208_0 then
				arg_205_1.var_.moveOldPos1058ui_story = var_208_0.localPosition
			end

			local var_208_2 = 0.001

			if var_208_1 <= arg_205_1.time_ and arg_205_1.time_ < var_208_1 + var_208_2 then
				local var_208_3 = (arg_205_1.time_ - var_208_1) / var_208_2
				local var_208_4 = Vector3.New(0, -0.95, -5.88)

				var_208_0.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1058ui_story, var_208_4, var_208_3)

				local var_208_5 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_5.x, var_208_5.y, var_208_5.z)

				local var_208_6 = var_208_0.localEulerAngles

				var_208_6.z = 0
				var_208_6.x = 0
				var_208_0.localEulerAngles = var_208_6
			end

			if arg_205_1.time_ >= var_208_1 + var_208_2 and arg_205_1.time_ < var_208_1 + var_208_2 + arg_208_0 then
				var_208_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_208_7 = manager.ui.mainCamera.transform.position - var_208_0.position

				var_208_0.forward = Vector3.New(var_208_7.x, var_208_7.y, var_208_7.z)

				local var_208_8 = var_208_0.localEulerAngles

				var_208_8.z = 0
				var_208_8.x = 0
				var_208_0.localEulerAngles = var_208_8
			end

			local var_208_9 = arg_205_1.actors_["1058ui_story"]
			local var_208_10 = 0

			if var_208_10 < arg_205_1.time_ and arg_205_1.time_ <= var_208_10 + arg_208_0 and arg_205_1.var_.characterEffect1058ui_story == nil then
				arg_205_1.var_.characterEffect1058ui_story = var_208_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_11 = 0.200000002980232

			if var_208_10 <= arg_205_1.time_ and arg_205_1.time_ < var_208_10 + var_208_11 then
				local var_208_12 = (arg_205_1.time_ - var_208_10) / var_208_11

				if arg_205_1.var_.characterEffect1058ui_story then
					arg_205_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_205_1.time_ >= var_208_10 + var_208_11 and arg_205_1.time_ < var_208_10 + var_208_11 + arg_208_0 and arg_205_1.var_.characterEffect1058ui_story then
				arg_205_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_208_13 = 0

			if var_208_13 < arg_205_1.time_ and arg_205_1.time_ <= var_208_13 + arg_208_0 then
				arg_205_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action5_1")
			end

			local var_208_14 = 0

			if var_208_14 < arg_205_1.time_ and arg_205_1.time_ <= var_208_14 + arg_208_0 then
				arg_205_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_208_15 = arg_205_1.actors_["1055ui_story"].transform
			local var_208_16 = 0

			if var_208_16 < arg_205_1.time_ and arg_205_1.time_ <= var_208_16 + arg_208_0 then
				arg_205_1.var_.moveOldPos1055ui_story = var_208_15.localPosition
			end

			local var_208_17 = 0.001

			if var_208_16 <= arg_205_1.time_ and arg_205_1.time_ < var_208_16 + var_208_17 then
				local var_208_18 = (arg_205_1.time_ - var_208_16) / var_208_17
				local var_208_19 = Vector3.New(0, 100, 0)

				var_208_15.localPosition = Vector3.Lerp(arg_205_1.var_.moveOldPos1055ui_story, var_208_19, var_208_18)

				local var_208_20 = manager.ui.mainCamera.transform.position - var_208_15.position

				var_208_15.forward = Vector3.New(var_208_20.x, var_208_20.y, var_208_20.z)

				local var_208_21 = var_208_15.localEulerAngles

				var_208_21.z = 0
				var_208_21.x = 0
				var_208_15.localEulerAngles = var_208_21
			end

			if arg_205_1.time_ >= var_208_16 + var_208_17 and arg_205_1.time_ < var_208_16 + var_208_17 + arg_208_0 then
				var_208_15.localPosition = Vector3.New(0, 100, 0)

				local var_208_22 = manager.ui.mainCamera.transform.position - var_208_15.position

				var_208_15.forward = Vector3.New(var_208_22.x, var_208_22.y, var_208_22.z)

				local var_208_23 = var_208_15.localEulerAngles

				var_208_23.z = 0
				var_208_23.x = 0
				var_208_15.localEulerAngles = var_208_23
			end

			local var_208_24 = arg_205_1.actors_["1055ui_story"]
			local var_208_25 = 0

			if var_208_25 < arg_205_1.time_ and arg_205_1.time_ <= var_208_25 + arg_208_0 and arg_205_1.var_.characterEffect1055ui_story == nil then
				arg_205_1.var_.characterEffect1055ui_story = var_208_24:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_208_26 = 0.200000002980232

			if var_208_25 <= arg_205_1.time_ and arg_205_1.time_ < var_208_25 + var_208_26 then
				local var_208_27 = (arg_205_1.time_ - var_208_25) / var_208_26

				if arg_205_1.var_.characterEffect1055ui_story then
					local var_208_28 = Mathf.Lerp(0, 0.5, var_208_27)

					arg_205_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_205_1.var_.characterEffect1055ui_story.fillRatio = var_208_28
				end
			end

			if arg_205_1.time_ >= var_208_25 + var_208_26 and arg_205_1.time_ < var_208_25 + var_208_26 + arg_208_0 and arg_205_1.var_.characterEffect1055ui_story then
				local var_208_29 = 0.5

				arg_205_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_205_1.var_.characterEffect1055ui_story.fillRatio = var_208_29
			end

			local var_208_30 = 0
			local var_208_31 = 0.475

			if var_208_30 < arg_205_1.time_ and arg_205_1.time_ <= var_208_30 + arg_208_0 then
				arg_205_1.talkMaxDuration = 0
				arg_205_1.dialogCg_.alpha = 1

				arg_205_1.dialog_:SetActive(true)
				SetActive(arg_205_1.leftNameGo_, true)

				local var_208_32 = arg_205_1:FormatText(StoryNameCfg[92].name)

				arg_205_1.leftNameTxt_.text = var_208_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_205_1.leftNameTxt_.transform)

				arg_205_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_205_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_205_1:RecordName(arg_205_1.leftNameTxt_.text)
				SetActive(arg_205_1.iconTrs_.gameObject, false)
				arg_205_1.callingController_:SetSelectedState("normal")

				local var_208_33 = arg_205_1:GetWordFromCfg(318202051)
				local var_208_34 = arg_205_1:FormatText(var_208_33.content)

				arg_205_1.text_.text = var_208_34

				LuaForUtil.ClearLinePrefixSymbol(arg_205_1.text_)

				local var_208_35 = 19
				local var_208_36 = utf8.len(var_208_34)
				local var_208_37 = var_208_35 <= 0 and var_208_31 or var_208_31 * (var_208_36 / var_208_35)

				if var_208_37 > 0 and var_208_31 < var_208_37 then
					arg_205_1.talkMaxDuration = var_208_37

					if var_208_37 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_37 + var_208_30
					end
				end

				arg_205_1.text_.text = var_208_34
				arg_205_1.typewritter.percent = 0

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202051", "story_v_out_318202.awb") ~= 0 then
					local var_208_38 = manager.audio:GetVoiceLength("story_v_out_318202", "318202051", "story_v_out_318202.awb") / 1000

					if var_208_38 + var_208_30 > arg_205_1.duration_ then
						arg_205_1.duration_ = var_208_38 + var_208_30
					end

					if var_208_33.prefab_name ~= "" and arg_205_1.actors_[var_208_33.prefab_name] ~= nil then
						local var_208_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_205_1.actors_[var_208_33.prefab_name].transform, "story_v_out_318202", "318202051", "story_v_out_318202.awb")

						arg_205_1:RecordAudio("318202051", var_208_39)
						arg_205_1:RecordAudio("318202051", var_208_39)
					else
						arg_205_1:AudioAction("play", "voice", "story_v_out_318202", "318202051", "story_v_out_318202.awb")
					end

					arg_205_1:RecordHistoryTalkVoice("story_v_out_318202", "318202051", "story_v_out_318202.awb")
				end

				arg_205_1:RecordContent(arg_205_1.text_.text)
			end

			local var_208_40 = math.max(var_208_31, arg_205_1.talkMaxDuration)

			if var_208_30 <= arg_205_1.time_ and arg_205_1.time_ < var_208_30 + var_208_40 then
				arg_205_1.typewritter.percent = (arg_205_1.time_ - var_208_30) / var_208_40

				arg_205_1.typewritter:SetDirty()
			end

			if arg_205_1.time_ >= var_208_30 + var_208_40 and arg_205_1.time_ < var_208_30 + var_208_40 + arg_208_0 then
				arg_205_1.typewritter.percent = 1

				arg_205_1.typewritter:SetDirty()
				arg_205_1:ShowNextGo(true)
			end
		end
	end,
	Play318202052 = function(arg_209_0, arg_209_1)
		arg_209_1.time_ = 0
		arg_209_1.frameCnt_ = 0
		arg_209_1.state_ = "playing"
		arg_209_1.curTalkId_ = 318202052
		arg_209_1.duration_ = 13.466

		local var_209_0 = {
			zh = 6.833,
			ja = 13.466
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
				arg_209_0:Play318202053(arg_209_1)
			end
		end

		function arg_209_1.onSingleLineUpdate_(arg_212_0)
			local var_212_0 = arg_209_1.actors_["1058ui_story"].transform
			local var_212_1 = 0

			if var_212_1 < arg_209_1.time_ and arg_209_1.time_ <= var_212_1 + arg_212_0 then
				arg_209_1.var_.moveOldPos1058ui_story = var_212_0.localPosition
			end

			local var_212_2 = 0.001

			if var_212_1 <= arg_209_1.time_ and arg_209_1.time_ < var_212_1 + var_212_2 then
				local var_212_3 = (arg_209_1.time_ - var_212_1) / var_212_2
				local var_212_4 = Vector3.New(0, -0.95, -5.88)

				var_212_0.localPosition = Vector3.Lerp(arg_209_1.var_.moveOldPos1058ui_story, var_212_4, var_212_3)

				local var_212_5 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_5.x, var_212_5.y, var_212_5.z)

				local var_212_6 = var_212_0.localEulerAngles

				var_212_6.z = 0
				var_212_6.x = 0
				var_212_0.localEulerAngles = var_212_6
			end

			if arg_209_1.time_ >= var_212_1 + var_212_2 and arg_209_1.time_ < var_212_1 + var_212_2 + arg_212_0 then
				var_212_0.localPosition = Vector3.New(0, -0.95, -5.88)

				local var_212_7 = manager.ui.mainCamera.transform.position - var_212_0.position

				var_212_0.forward = Vector3.New(var_212_7.x, var_212_7.y, var_212_7.z)

				local var_212_8 = var_212_0.localEulerAngles

				var_212_8.z = 0
				var_212_8.x = 0
				var_212_0.localEulerAngles = var_212_8
			end

			local var_212_9 = arg_209_1.actors_["1058ui_story"]
			local var_212_10 = 0

			if var_212_10 < arg_209_1.time_ and arg_209_1.time_ <= var_212_10 + arg_212_0 and arg_209_1.var_.characterEffect1058ui_story == nil then
				arg_209_1.var_.characterEffect1058ui_story = var_212_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_212_11 = 0.200000002980232

			if var_212_10 <= arg_209_1.time_ and arg_209_1.time_ < var_212_10 + var_212_11 then
				local var_212_12 = (arg_209_1.time_ - var_212_10) / var_212_11

				if arg_209_1.var_.characterEffect1058ui_story then
					arg_209_1.var_.characterEffect1058ui_story.fillFlat = false
				end
			end

			if arg_209_1.time_ >= var_212_10 + var_212_11 and arg_209_1.time_ < var_212_10 + var_212_11 + arg_212_0 and arg_209_1.var_.characterEffect1058ui_story then
				arg_209_1.var_.characterEffect1058ui_story.fillFlat = false
			end

			local var_212_13 = 0

			if var_212_13 < arg_209_1.time_ and arg_209_1.time_ <= var_212_13 + arg_212_0 then
				arg_209_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/1058/1058action/1058action5_2")
			end

			local var_212_14 = 0

			if var_212_14 < arg_209_1.time_ and arg_209_1.time_ <= var_212_14 + arg_212_0 then
				arg_209_1:PlayTimeline("1058ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_212_15 = 0
			local var_212_16 = 0.825

			if var_212_15 < arg_209_1.time_ and arg_209_1.time_ <= var_212_15 + arg_212_0 then
				arg_209_1.talkMaxDuration = 0
				arg_209_1.dialogCg_.alpha = 1

				arg_209_1.dialog_:SetActive(true)
				SetActive(arg_209_1.leftNameGo_, true)

				local var_212_17 = arg_209_1:FormatText(StoryNameCfg[92].name)

				arg_209_1.leftNameTxt_.text = var_212_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_209_1.leftNameTxt_.transform)

				arg_209_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_209_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_209_1:RecordName(arg_209_1.leftNameTxt_.text)
				SetActive(arg_209_1.iconTrs_.gameObject, false)
				arg_209_1.callingController_:SetSelectedState("normal")

				local var_212_18 = arg_209_1:GetWordFromCfg(318202052)
				local var_212_19 = arg_209_1:FormatText(var_212_18.content)

				arg_209_1.text_.text = var_212_19

				LuaForUtil.ClearLinePrefixSymbol(arg_209_1.text_)

				local var_212_20 = 33
				local var_212_21 = utf8.len(var_212_19)
				local var_212_22 = var_212_20 <= 0 and var_212_16 or var_212_16 * (var_212_21 / var_212_20)

				if var_212_22 > 0 and var_212_16 < var_212_22 then
					arg_209_1.talkMaxDuration = var_212_22

					if var_212_22 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_22 + var_212_15
					end
				end

				arg_209_1.text_.text = var_212_19
				arg_209_1.typewritter.percent = 0

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202052", "story_v_out_318202.awb") ~= 0 then
					local var_212_23 = manager.audio:GetVoiceLength("story_v_out_318202", "318202052", "story_v_out_318202.awb") / 1000

					if var_212_23 + var_212_15 > arg_209_1.duration_ then
						arg_209_1.duration_ = var_212_23 + var_212_15
					end

					if var_212_18.prefab_name ~= "" and arg_209_1.actors_[var_212_18.prefab_name] ~= nil then
						local var_212_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_209_1.actors_[var_212_18.prefab_name].transform, "story_v_out_318202", "318202052", "story_v_out_318202.awb")

						arg_209_1:RecordAudio("318202052", var_212_24)
						arg_209_1:RecordAudio("318202052", var_212_24)
					else
						arg_209_1:AudioAction("play", "voice", "story_v_out_318202", "318202052", "story_v_out_318202.awb")
					end

					arg_209_1:RecordHistoryTalkVoice("story_v_out_318202", "318202052", "story_v_out_318202.awb")
				end

				arg_209_1:RecordContent(arg_209_1.text_.text)
			end

			local var_212_25 = math.max(var_212_16, arg_209_1.talkMaxDuration)

			if var_212_15 <= arg_209_1.time_ and arg_209_1.time_ < var_212_15 + var_212_25 then
				arg_209_1.typewritter.percent = (arg_209_1.time_ - var_212_15) / var_212_25

				arg_209_1.typewritter:SetDirty()
			end

			if arg_209_1.time_ >= var_212_15 + var_212_25 and arg_209_1.time_ < var_212_15 + var_212_25 + arg_212_0 then
				arg_209_1.typewritter.percent = 1

				arg_209_1.typewritter:SetDirty()
				arg_209_1:ShowNextGo(true)
			end
		end
	end,
	Play318202053 = function(arg_213_0, arg_213_1)
		arg_213_1.time_ = 0
		arg_213_1.frameCnt_ = 0
		arg_213_1.state_ = "playing"
		arg_213_1.curTalkId_ = 318202053
		arg_213_1.duration_ = 5

		SetActive(arg_213_1.tipsGo_, false)

		function arg_213_1.onSingleLineFinish_()
			arg_213_1.onSingleLineUpdate_ = nil
			arg_213_1.onSingleLineFinish_ = nil
			arg_213_1.state_ = "waiting"
		end

		function arg_213_1.playNext_(arg_215_0)
			if arg_215_0 == 1 then
				arg_213_0:Play318202054(arg_213_1)
			end
		end

		function arg_213_1.onSingleLineUpdate_(arg_216_0)
			local var_216_0 = arg_213_1.actors_["1058ui_story"].transform
			local var_216_1 = 0

			if var_216_1 < arg_213_1.time_ and arg_213_1.time_ <= var_216_1 + arg_216_0 then
				arg_213_1.var_.moveOldPos1058ui_story = var_216_0.localPosition
			end

			local var_216_2 = 0.001

			if var_216_1 <= arg_213_1.time_ and arg_213_1.time_ < var_216_1 + var_216_2 then
				local var_216_3 = (arg_213_1.time_ - var_216_1) / var_216_2
				local var_216_4 = Vector3.New(0, 100, 0)

				var_216_0.localPosition = Vector3.Lerp(arg_213_1.var_.moveOldPos1058ui_story, var_216_4, var_216_3)

				local var_216_5 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_5.x, var_216_5.y, var_216_5.z)

				local var_216_6 = var_216_0.localEulerAngles

				var_216_6.z = 0
				var_216_6.x = 0
				var_216_0.localEulerAngles = var_216_6
			end

			if arg_213_1.time_ >= var_216_1 + var_216_2 and arg_213_1.time_ < var_216_1 + var_216_2 + arg_216_0 then
				var_216_0.localPosition = Vector3.New(0, 100, 0)

				local var_216_7 = manager.ui.mainCamera.transform.position - var_216_0.position

				var_216_0.forward = Vector3.New(var_216_7.x, var_216_7.y, var_216_7.z)

				local var_216_8 = var_216_0.localEulerAngles

				var_216_8.z = 0
				var_216_8.x = 0
				var_216_0.localEulerAngles = var_216_8
			end

			local var_216_9 = arg_213_1.actors_["1058ui_story"]
			local var_216_10 = 0

			if var_216_10 < arg_213_1.time_ and arg_213_1.time_ <= var_216_10 + arg_216_0 and arg_213_1.var_.characterEffect1058ui_story == nil then
				arg_213_1.var_.characterEffect1058ui_story = var_216_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_216_11 = 0.200000002980232

			if var_216_10 <= arg_213_1.time_ and arg_213_1.time_ < var_216_10 + var_216_11 then
				local var_216_12 = (arg_213_1.time_ - var_216_10) / var_216_11

				if arg_213_1.var_.characterEffect1058ui_story then
					local var_216_13 = Mathf.Lerp(0, 0.5, var_216_12)

					arg_213_1.var_.characterEffect1058ui_story.fillFlat = true
					arg_213_1.var_.characterEffect1058ui_story.fillRatio = var_216_13
				end
			end

			if arg_213_1.time_ >= var_216_10 + var_216_11 and arg_213_1.time_ < var_216_10 + var_216_11 + arg_216_0 and arg_213_1.var_.characterEffect1058ui_story then
				local var_216_14 = 0.5

				arg_213_1.var_.characterEffect1058ui_story.fillFlat = true
				arg_213_1.var_.characterEffect1058ui_story.fillRatio = var_216_14
			end

			local var_216_15 = 0
			local var_216_16 = 0.65

			if var_216_15 < arg_213_1.time_ and arg_213_1.time_ <= var_216_15 + arg_216_0 then
				arg_213_1.talkMaxDuration = 0
				arg_213_1.dialogCg_.alpha = 1

				arg_213_1.dialog_:SetActive(true)
				SetActive(arg_213_1.leftNameGo_, false)

				arg_213_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_213_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_213_1:RecordName(arg_213_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_213_1.iconTrs_.gameObject, false)
				arg_213_1.callingController_:SetSelectedState("normal")

				local var_216_17 = arg_213_1:GetWordFromCfg(318202053)
				local var_216_18 = arg_213_1:FormatText(var_216_17.content)

				arg_213_1.text_.text = var_216_18

				LuaForUtil.ClearLinePrefixSymbol(arg_213_1.text_)

				local var_216_19 = 26
				local var_216_20 = utf8.len(var_216_18)
				local var_216_21 = var_216_19 <= 0 and var_216_16 or var_216_16 * (var_216_20 / var_216_19)

				if var_216_21 > 0 and var_216_16 < var_216_21 then
					arg_213_1.talkMaxDuration = var_216_21

					if var_216_21 + var_216_15 > arg_213_1.duration_ then
						arg_213_1.duration_ = var_216_21 + var_216_15
					end
				end

				arg_213_1.text_.text = var_216_18
				arg_213_1.typewritter.percent = 0

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(false)
				arg_213_1:RecordContent(arg_213_1.text_.text)
			end

			local var_216_22 = math.max(var_216_16, arg_213_1.talkMaxDuration)

			if var_216_15 <= arg_213_1.time_ and arg_213_1.time_ < var_216_15 + var_216_22 then
				arg_213_1.typewritter.percent = (arg_213_1.time_ - var_216_15) / var_216_22

				arg_213_1.typewritter:SetDirty()
			end

			if arg_213_1.time_ >= var_216_15 + var_216_22 and arg_213_1.time_ < var_216_15 + var_216_22 + arg_216_0 then
				arg_213_1.typewritter.percent = 1

				arg_213_1.typewritter:SetDirty()
				arg_213_1:ShowNextGo(true)
			end
		end
	end,
	Play318202054 = function(arg_217_0, arg_217_1)
		arg_217_1.time_ = 0
		arg_217_1.frameCnt_ = 0
		arg_217_1.state_ = "playing"
		arg_217_1.curTalkId_ = 318202054
		arg_217_1.duration_ = 1.8

		local var_217_0 = {
			zh = 1.8,
			ja = 1.233
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
				arg_217_0:Play318202055(arg_217_1)
			end
		end

		function arg_217_1.onSingleLineUpdate_(arg_220_0)
			local var_220_0 = arg_217_1.actors_["10053ui_story"].transform
			local var_220_1 = 0

			if var_220_1 < arg_217_1.time_ and arg_217_1.time_ <= var_220_1 + arg_220_0 then
				arg_217_1.var_.moveOldPos10053ui_story = var_220_0.localPosition
			end

			local var_220_2 = 0.001

			if var_220_1 <= arg_217_1.time_ and arg_217_1.time_ < var_220_1 + var_220_2 then
				local var_220_3 = (arg_217_1.time_ - var_220_1) / var_220_2
				local var_220_4 = Vector3.New(0, -1.12, -5.99)

				var_220_0.localPosition = Vector3.Lerp(arg_217_1.var_.moveOldPos10053ui_story, var_220_4, var_220_3)

				local var_220_5 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_5.x, var_220_5.y, var_220_5.z)

				local var_220_6 = var_220_0.localEulerAngles

				var_220_6.z = 0
				var_220_6.x = 0
				var_220_0.localEulerAngles = var_220_6
			end

			if arg_217_1.time_ >= var_220_1 + var_220_2 and arg_217_1.time_ < var_220_1 + var_220_2 + arg_220_0 then
				var_220_0.localPosition = Vector3.New(0, -1.12, -5.99)

				local var_220_7 = manager.ui.mainCamera.transform.position - var_220_0.position

				var_220_0.forward = Vector3.New(var_220_7.x, var_220_7.y, var_220_7.z)

				local var_220_8 = var_220_0.localEulerAngles

				var_220_8.z = 0
				var_220_8.x = 0
				var_220_0.localEulerAngles = var_220_8
			end

			local var_220_9 = arg_217_1.actors_["10053ui_story"]
			local var_220_10 = 0

			if var_220_10 < arg_217_1.time_ and arg_217_1.time_ <= var_220_10 + arg_220_0 and arg_217_1.var_.characterEffect10053ui_story == nil then
				arg_217_1.var_.characterEffect10053ui_story = var_220_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_220_11 = 0.200000002980232

			if var_220_10 <= arg_217_1.time_ and arg_217_1.time_ < var_220_10 + var_220_11 then
				local var_220_12 = (arg_217_1.time_ - var_220_10) / var_220_11

				if arg_217_1.var_.characterEffect10053ui_story then
					arg_217_1.var_.characterEffect10053ui_story.fillFlat = false
				end
			end

			if arg_217_1.time_ >= var_220_10 + var_220_11 and arg_217_1.time_ < var_220_10 + var_220_11 + arg_220_0 and arg_217_1.var_.characterEffect10053ui_story then
				arg_217_1.var_.characterEffect10053ui_story.fillFlat = false
			end

			local var_220_13 = 0

			if var_220_13 < arg_217_1.time_ and arg_217_1.time_ <= var_220_13 + arg_220_0 then
				arg_217_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/story10053/story10053action/10053action1_1")
			end

			local var_220_14 = 0

			if var_220_14 < arg_217_1.time_ and arg_217_1.time_ <= var_220_14 + arg_220_0 then
				arg_217_1:PlayTimeline("10053ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_220_15 = 0
			local var_220_16 = 0.25

			if var_220_15 < arg_217_1.time_ and arg_217_1.time_ <= var_220_15 + arg_220_0 then
				arg_217_1.talkMaxDuration = 0
				arg_217_1.dialogCg_.alpha = 1

				arg_217_1.dialog_:SetActive(true)
				SetActive(arg_217_1.leftNameGo_, true)

				local var_220_17 = arg_217_1:FormatText(StoryNameCfg[477].name)

				arg_217_1.leftNameTxt_.text = var_220_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_217_1.leftNameTxt_.transform)

				arg_217_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_217_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_217_1:RecordName(arg_217_1.leftNameTxt_.text)
				SetActive(arg_217_1.iconTrs_.gameObject, false)
				arg_217_1.callingController_:SetSelectedState("normal")

				local var_220_18 = arg_217_1:GetWordFromCfg(318202054)
				local var_220_19 = arg_217_1:FormatText(var_220_18.content)

				arg_217_1.text_.text = var_220_19

				LuaForUtil.ClearLinePrefixSymbol(arg_217_1.text_)

				local var_220_20 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202054", "story_v_out_318202.awb") ~= 0 then
					local var_220_23 = manager.audio:GetVoiceLength("story_v_out_318202", "318202054", "story_v_out_318202.awb") / 1000

					if var_220_23 + var_220_15 > arg_217_1.duration_ then
						arg_217_1.duration_ = var_220_23 + var_220_15
					end

					if var_220_18.prefab_name ~= "" and arg_217_1.actors_[var_220_18.prefab_name] ~= nil then
						local var_220_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_217_1.actors_[var_220_18.prefab_name].transform, "story_v_out_318202", "318202054", "story_v_out_318202.awb")

						arg_217_1:RecordAudio("318202054", var_220_24)
						arg_217_1:RecordAudio("318202054", var_220_24)
					else
						arg_217_1:AudioAction("play", "voice", "story_v_out_318202", "318202054", "story_v_out_318202.awb")
					end

					arg_217_1:RecordHistoryTalkVoice("story_v_out_318202", "318202054", "story_v_out_318202.awb")
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
	Play318202055 = function(arg_221_0, arg_221_1)
		arg_221_1.time_ = 0
		arg_221_1.frameCnt_ = 0
		arg_221_1.state_ = "playing"
		arg_221_1.curTalkId_ = 318202055
		arg_221_1.duration_ = 3.3

		local var_221_0 = {
			zh = 2.3,
			ja = 3.3
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
				arg_221_0:Play318202056(arg_221_1)
			end
		end

		function arg_221_1.onSingleLineUpdate_(arg_224_0)
			local var_224_0 = arg_221_1.actors_["1055ui_story"].transform
			local var_224_1 = 0

			if var_224_1 < arg_221_1.time_ and arg_221_1.time_ <= var_224_1 + arg_224_0 then
				arg_221_1.var_.moveOldPos1055ui_story = var_224_0.localPosition
			end

			local var_224_2 = 0.001

			if var_224_1 <= arg_221_1.time_ and arg_221_1.time_ < var_224_1 + var_224_2 then
				local var_224_3 = (arg_221_1.time_ - var_224_1) / var_224_2
				local var_224_4 = Vector3.New(0, -0.965, -6.2)

				var_224_0.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos1055ui_story, var_224_4, var_224_3)

				local var_224_5 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_5.x, var_224_5.y, var_224_5.z)

				local var_224_6 = var_224_0.localEulerAngles

				var_224_6.z = 0
				var_224_6.x = 0
				var_224_0.localEulerAngles = var_224_6
			end

			if arg_221_1.time_ >= var_224_1 + var_224_2 and arg_221_1.time_ < var_224_1 + var_224_2 + arg_224_0 then
				var_224_0.localPosition = Vector3.New(0, -0.965, -6.2)

				local var_224_7 = manager.ui.mainCamera.transform.position - var_224_0.position

				var_224_0.forward = Vector3.New(var_224_7.x, var_224_7.y, var_224_7.z)

				local var_224_8 = var_224_0.localEulerAngles

				var_224_8.z = 0
				var_224_8.x = 0
				var_224_0.localEulerAngles = var_224_8
			end

			local var_224_9 = arg_221_1.actors_["1055ui_story"]
			local var_224_10 = 0

			if var_224_10 < arg_221_1.time_ and arg_221_1.time_ <= var_224_10 + arg_224_0 and arg_221_1.var_.characterEffect1055ui_story == nil then
				arg_221_1.var_.characterEffect1055ui_story = var_224_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_11 = 0.200000002980232

			if var_224_10 <= arg_221_1.time_ and arg_221_1.time_ < var_224_10 + var_224_11 then
				local var_224_12 = (arg_221_1.time_ - var_224_10) / var_224_11

				if arg_221_1.var_.characterEffect1055ui_story then
					arg_221_1.var_.characterEffect1055ui_story.fillFlat = false
				end
			end

			if arg_221_1.time_ >= var_224_10 + var_224_11 and arg_221_1.time_ < var_224_10 + var_224_11 + arg_224_0 and arg_221_1.var_.characterEffect1055ui_story then
				arg_221_1.var_.characterEffect1055ui_story.fillFlat = false
			end

			local var_224_13 = arg_221_1.actors_["10053ui_story"].transform
			local var_224_14 = 0

			if var_224_14 < arg_221_1.time_ and arg_221_1.time_ <= var_224_14 + arg_224_0 then
				arg_221_1.var_.moveOldPos10053ui_story = var_224_13.localPosition
			end

			local var_224_15 = 0.001

			if var_224_14 <= arg_221_1.time_ and arg_221_1.time_ < var_224_14 + var_224_15 then
				local var_224_16 = (arg_221_1.time_ - var_224_14) / var_224_15
				local var_224_17 = Vector3.New(0, 100, 0)

				var_224_13.localPosition = Vector3.Lerp(arg_221_1.var_.moveOldPos10053ui_story, var_224_17, var_224_16)

				local var_224_18 = manager.ui.mainCamera.transform.position - var_224_13.position

				var_224_13.forward = Vector3.New(var_224_18.x, var_224_18.y, var_224_18.z)

				local var_224_19 = var_224_13.localEulerAngles

				var_224_19.z = 0
				var_224_19.x = 0
				var_224_13.localEulerAngles = var_224_19
			end

			if arg_221_1.time_ >= var_224_14 + var_224_15 and arg_221_1.time_ < var_224_14 + var_224_15 + arg_224_0 then
				var_224_13.localPosition = Vector3.New(0, 100, 0)

				local var_224_20 = manager.ui.mainCamera.transform.position - var_224_13.position

				var_224_13.forward = Vector3.New(var_224_20.x, var_224_20.y, var_224_20.z)

				local var_224_21 = var_224_13.localEulerAngles

				var_224_21.z = 0
				var_224_21.x = 0
				var_224_13.localEulerAngles = var_224_21
			end

			local var_224_22 = arg_221_1.actors_["10053ui_story"]
			local var_224_23 = 0

			if var_224_23 < arg_221_1.time_ and arg_221_1.time_ <= var_224_23 + arg_224_0 and arg_221_1.var_.characterEffect10053ui_story == nil then
				arg_221_1.var_.characterEffect10053ui_story = var_224_22:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_224_24 = 0.200000002980232

			if var_224_23 <= arg_221_1.time_ and arg_221_1.time_ < var_224_23 + var_224_24 then
				local var_224_25 = (arg_221_1.time_ - var_224_23) / var_224_24

				if arg_221_1.var_.characterEffect10053ui_story then
					local var_224_26 = Mathf.Lerp(0, 0.5, var_224_25)

					arg_221_1.var_.characterEffect10053ui_story.fillFlat = true
					arg_221_1.var_.characterEffect10053ui_story.fillRatio = var_224_26
				end
			end

			if arg_221_1.time_ >= var_224_23 + var_224_24 and arg_221_1.time_ < var_224_23 + var_224_24 + arg_224_0 and arg_221_1.var_.characterEffect10053ui_story then
				local var_224_27 = 0.5

				arg_221_1.var_.characterEffect10053ui_story.fillFlat = true
				arg_221_1.var_.characterEffect10053ui_story.fillRatio = var_224_27
			end

			local var_224_28 = 0

			if var_224_28 < arg_221_1.time_ and arg_221_1.time_ <= var_224_28 + arg_224_0 then
				arg_221_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_224_29 = 0

			if var_224_29 < arg_221_1.time_ and arg_221_1.time_ <= var_224_29 + arg_224_0 then
				arg_221_1:PlayTimeline("1055ui_story", "StoryTimeline/CharAction/story1055/story1055action/1055action1_1")
			end

			local var_224_30 = 0
			local var_224_31 = 0.275

			if var_224_30 < arg_221_1.time_ and arg_221_1.time_ <= var_224_30 + arg_224_0 then
				arg_221_1.talkMaxDuration = 0
				arg_221_1.dialogCg_.alpha = 1

				arg_221_1.dialog_:SetActive(true)
				SetActive(arg_221_1.leftNameGo_, true)

				local var_224_32 = arg_221_1:FormatText(StoryNameCfg[481].name)

				arg_221_1.leftNameTxt_.text = var_224_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_221_1.leftNameTxt_.transform)

				arg_221_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_221_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_221_1:RecordName(arg_221_1.leftNameTxt_.text)
				SetActive(arg_221_1.iconTrs_.gameObject, false)
				arg_221_1.callingController_:SetSelectedState("normal")

				local var_224_33 = arg_221_1:GetWordFromCfg(318202055)
				local var_224_34 = arg_221_1:FormatText(var_224_33.content)

				arg_221_1.text_.text = var_224_34

				LuaForUtil.ClearLinePrefixSymbol(arg_221_1.text_)

				local var_224_35 = 11
				local var_224_36 = utf8.len(var_224_34)
				local var_224_37 = var_224_35 <= 0 and var_224_31 or var_224_31 * (var_224_36 / var_224_35)

				if var_224_37 > 0 and var_224_31 < var_224_37 then
					arg_221_1.talkMaxDuration = var_224_37

					if var_224_37 + var_224_30 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_37 + var_224_30
					end
				end

				arg_221_1.text_.text = var_224_34
				arg_221_1.typewritter.percent = 0

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_318202", "318202055", "story_v_out_318202.awb") ~= 0 then
					local var_224_38 = manager.audio:GetVoiceLength("story_v_out_318202", "318202055", "story_v_out_318202.awb") / 1000

					if var_224_38 + var_224_30 > arg_221_1.duration_ then
						arg_221_1.duration_ = var_224_38 + var_224_30
					end

					if var_224_33.prefab_name ~= "" and arg_221_1.actors_[var_224_33.prefab_name] ~= nil then
						local var_224_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_221_1.actors_[var_224_33.prefab_name].transform, "story_v_out_318202", "318202055", "story_v_out_318202.awb")

						arg_221_1:RecordAudio("318202055", var_224_39)
						arg_221_1:RecordAudio("318202055", var_224_39)
					else
						arg_221_1:AudioAction("play", "voice", "story_v_out_318202", "318202055", "story_v_out_318202.awb")
					end

					arg_221_1:RecordHistoryTalkVoice("story_v_out_318202", "318202055", "story_v_out_318202.awb")
				end

				arg_221_1:RecordContent(arg_221_1.text_.text)
			end

			local var_224_40 = math.max(var_224_31, arg_221_1.talkMaxDuration)

			if var_224_30 <= arg_221_1.time_ and arg_221_1.time_ < var_224_30 + var_224_40 then
				arg_221_1.typewritter.percent = (arg_221_1.time_ - var_224_30) / var_224_40

				arg_221_1.typewritter:SetDirty()
			end

			if arg_221_1.time_ >= var_224_30 + var_224_40 and arg_221_1.time_ < var_224_30 + var_224_40 + arg_224_0 then
				arg_221_1.typewritter.percent = 1

				arg_221_1.typewritter:SetDirty()
				arg_221_1:ShowNextGo(true)
			end
		end
	end,
	Play318202056 = function(arg_225_0, arg_225_1)
		arg_225_1.time_ = 0
		arg_225_1.frameCnt_ = 0
		arg_225_1.state_ = "playing"
		arg_225_1.curTalkId_ = 318202056
		arg_225_1.duration_ = 5

		SetActive(arg_225_1.tipsGo_, false)

		function arg_225_1.onSingleLineFinish_()
			arg_225_1.onSingleLineUpdate_ = nil
			arg_225_1.onSingleLineFinish_ = nil
			arg_225_1.state_ = "waiting"
			arg_225_1.auto_ = false
		end

		function arg_225_1.playNext_(arg_227_0)
			arg_225_1.onStoryFinished_()
		end

		function arg_225_1.onSingleLineUpdate_(arg_228_0)
			local var_228_0 = arg_225_1.actors_["1055ui_story"].transform
			local var_228_1 = 0

			if var_228_1 < arg_225_1.time_ and arg_225_1.time_ <= var_228_1 + arg_228_0 then
				arg_225_1.var_.moveOldPos1055ui_story = var_228_0.localPosition
			end

			local var_228_2 = 0.001

			if var_228_1 <= arg_225_1.time_ and arg_225_1.time_ < var_228_1 + var_228_2 then
				local var_228_3 = (arg_225_1.time_ - var_228_1) / var_228_2
				local var_228_4 = Vector3.New(0, 100, 0)

				var_228_0.localPosition = Vector3.Lerp(arg_225_1.var_.moveOldPos1055ui_story, var_228_4, var_228_3)

				local var_228_5 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_5.x, var_228_5.y, var_228_5.z)

				local var_228_6 = var_228_0.localEulerAngles

				var_228_6.z = 0
				var_228_6.x = 0
				var_228_0.localEulerAngles = var_228_6
			end

			if arg_225_1.time_ >= var_228_1 + var_228_2 and arg_225_1.time_ < var_228_1 + var_228_2 + arg_228_0 then
				var_228_0.localPosition = Vector3.New(0, 100, 0)

				local var_228_7 = manager.ui.mainCamera.transform.position - var_228_0.position

				var_228_0.forward = Vector3.New(var_228_7.x, var_228_7.y, var_228_7.z)

				local var_228_8 = var_228_0.localEulerAngles

				var_228_8.z = 0
				var_228_8.x = 0
				var_228_0.localEulerAngles = var_228_8
			end

			local var_228_9 = arg_225_1.actors_["1055ui_story"]
			local var_228_10 = 0

			if var_228_10 < arg_225_1.time_ and arg_225_1.time_ <= var_228_10 + arg_228_0 and arg_225_1.var_.characterEffect1055ui_story == nil then
				arg_225_1.var_.characterEffect1055ui_story = var_228_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_228_11 = 0.200000002980232

			if var_228_10 <= arg_225_1.time_ and arg_225_1.time_ < var_228_10 + var_228_11 then
				local var_228_12 = (arg_225_1.time_ - var_228_10) / var_228_11

				if arg_225_1.var_.characterEffect1055ui_story then
					local var_228_13 = Mathf.Lerp(0, 0.5, var_228_12)

					arg_225_1.var_.characterEffect1055ui_story.fillFlat = true
					arg_225_1.var_.characterEffect1055ui_story.fillRatio = var_228_13
				end
			end

			if arg_225_1.time_ >= var_228_10 + var_228_11 and arg_225_1.time_ < var_228_10 + var_228_11 + arg_228_0 and arg_225_1.var_.characterEffect1055ui_story then
				local var_228_14 = 0.5

				arg_225_1.var_.characterEffect1055ui_story.fillFlat = true
				arg_225_1.var_.characterEffect1055ui_story.fillRatio = var_228_14
			end

			local var_228_15 = 0
			local var_228_16 = 0.475

			if var_228_15 < arg_225_1.time_ and arg_225_1.time_ <= var_228_15 + arg_228_0 then
				arg_225_1.talkMaxDuration = 0
				arg_225_1.dialogCg_.alpha = 1

				arg_225_1.dialog_:SetActive(true)
				SetActive(arg_225_1.leftNameGo_, false)

				arg_225_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_225_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_225_1:RecordName(arg_225_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_225_1.iconTrs_.gameObject, false)
				arg_225_1.callingController_:SetSelectedState("normal")

				local var_228_17 = arg_225_1:GetWordFromCfg(318202056)
				local var_228_18 = arg_225_1:FormatText(var_228_17.content)

				arg_225_1.text_.text = var_228_18

				LuaForUtil.ClearLinePrefixSymbol(arg_225_1.text_)

				local var_228_19 = 19
				local var_228_20 = utf8.len(var_228_18)
				local var_228_21 = var_228_19 <= 0 and var_228_16 or var_228_16 * (var_228_20 / var_228_19)

				if var_228_21 > 0 and var_228_16 < var_228_21 then
					arg_225_1.talkMaxDuration = var_228_21

					if var_228_21 + var_228_15 > arg_225_1.duration_ then
						arg_225_1.duration_ = var_228_21 + var_228_15
					end
				end

				arg_225_1.text_.text = var_228_18
				arg_225_1.typewritter.percent = 0

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(false)
				arg_225_1:RecordContent(arg_225_1.text_.text)
			end

			local var_228_22 = math.max(var_228_16, arg_225_1.talkMaxDuration)

			if var_228_15 <= arg_225_1.time_ and arg_225_1.time_ < var_228_15 + var_228_22 then
				arg_225_1.typewritter.percent = (arg_225_1.time_ - var_228_15) / var_228_22

				arg_225_1.typewritter:SetDirty()
			end

			if arg_225_1.time_ >= var_228_15 + var_228_22 and arg_225_1.time_ < var_228_15 + var_228_22 + arg_228_0 then
				arg_225_1.typewritter.percent = 1

				arg_225_1.typewritter:SetDirty()
				arg_225_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/K07f",
		"Assets/UIResources/UI_AB/TextureConfig/Background/K05f"
	},
	voices = {
		"story_v_out_318202.awb"
	}
}
