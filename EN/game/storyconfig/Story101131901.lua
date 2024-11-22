return {
	Play113191001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 113191001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play113191002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "OM0106"

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
				local var_4_5 = arg_1_1.bgs_.OM0106

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
					if iter_4_0 ~= "OM0106" then
						iter_4_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_4_16 = arg_1_1.bgs_.OM0106.transform
			local var_4_17 = 0

			if var_4_17 < arg_1_1.time_ and arg_1_1.time_ <= var_4_17 + arg_4_0 then
				arg_1_1.var_.moveOldPosOM0106 = var_4_16.localPosition
			end

			local var_4_18 = 0.001

			if var_4_17 <= arg_1_1.time_ and arg_1_1.time_ < var_4_17 + var_4_18 then
				local var_4_19 = (arg_1_1.time_ - var_4_17) / var_4_18
				local var_4_20 = Vector3.New(-1.5, -1, -0.5)

				var_4_16.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosOM0106, var_4_20, var_4_19)
			end

			if arg_1_1.time_ >= var_4_17 + var_4_18 and arg_1_1.time_ < var_4_17 + var_4_18 + arg_4_0 then
				var_4_16.localPosition = Vector3.New(-1.5, -1, -0.5)
			end

			local var_4_21 = arg_1_1.bgs_.OM0106.transform
			local var_4_22 = 0.034

			if var_4_22 < arg_1_1.time_ and arg_1_1.time_ <= var_4_22 + arg_4_0 then
				arg_1_1.var_.moveOldPosOM0106 = var_4_21.localPosition
			end

			local var_4_23 = 3

			if var_4_22 <= arg_1_1.time_ and arg_1_1.time_ < var_4_22 + var_4_23 then
				local var_4_24 = (arg_1_1.time_ - var_4_22) / var_4_23
				local var_4_25 = Vector3.New(-1.2, -1, -0.5)

				var_4_21.localPosition = Vector3.Lerp(arg_1_1.var_.moveOldPosOM0106, var_4_25, var_4_24)
			end

			if arg_1_1.time_ >= var_4_22 + var_4_23 and arg_1_1.time_ < var_4_22 + var_4_23 + arg_4_0 then
				var_4_21.localPosition = Vector3.New(-1.2, -1, -0.5)
			end

			local var_4_26 = 0

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				arg_1_1.mask_.enabled = true
				arg_1_1.mask_.raycastTarget = false

				arg_1_1:SetGaussion(false)
			end

			local var_4_27 = 2

			if var_4_26 <= arg_1_1.time_ and arg_1_1.time_ < var_4_26 + var_4_27 then
				local var_4_28 = (arg_1_1.time_ - var_4_26) / var_4_27
				local var_4_29 = Color.New(0, 0, 0)

				var_4_29.a = Mathf.Lerp(1, 0, var_4_28)
				arg_1_1.mask_.color = var_4_29
			end

			if arg_1_1.time_ >= var_4_26 + var_4_27 and arg_1_1.time_ < var_4_26 + var_4_27 + arg_4_0 then
				local var_4_30 = Color.New(0, 0, 0)
				local var_4_31 = 0

				arg_1_1.mask_.enabled = false
				var_4_30.a = var_4_31
				arg_1_1.mask_.color = var_4_30
			end

			local var_4_32 = 0

			if var_4_32 < arg_1_1.time_ and arg_1_1.time_ <= var_4_32 + arg_4_0 then
				arg_1_1.allBtn_.enabled = false
			end

			local var_4_33 = 3.034

			if arg_1_1.time_ >= var_4_32 + var_4_33 and arg_1_1.time_ < var_4_32 + var_4_33 + arg_4_0 then
				arg_1_1.allBtn_.enabled = true
			end

			local var_4_34 = 0
			local var_4_35 = 1

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "music"

				arg_1_1:AudioAction(var_4_36, var_4_37, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_4_38 = 2
			local var_4_39 = 1

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				local var_4_40 = "play"
				local var_4_41 = "music"

				arg_1_1:AudioAction(var_4_40, var_4_41, "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle", "bgm_activity_1_3_story_battle.awb")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_42 = 2
			local var_4_43 = 0.05

			if var_4_42 < arg_1_1.time_ and arg_1_1.time_ <= var_4_42 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_44 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_44:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_44:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_44:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_45 = arg_1_1:GetWordFromCfg(113191001)
				local var_4_46 = arg_1_1:FormatText(var_4_45.content)

				arg_1_1.text_.text = var_4_46

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_47 = 2
				local var_4_48 = utf8.len(var_4_46)
				local var_4_49 = var_4_47 <= 0 and var_4_43 or var_4_43 * (var_4_48 / var_4_47)

				if var_4_49 > 0 and var_4_43 < var_4_49 then
					arg_1_1.talkMaxDuration = var_4_49
					var_4_42 = var_4_42 + 0.3

					if var_4_49 + var_4_42 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_49 + var_4_42
					end
				end

				arg_1_1.text_.text = var_4_46
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_50 = var_4_42 + 0.3
			local var_4_51 = math.max(var_4_43, arg_1_1.talkMaxDuration)

			if var_4_50 <= arg_1_1.time_ and arg_1_1.time_ < var_4_50 + var_4_51 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_50) / var_4_51

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_50 + var_4_51 and arg_1_1.time_ < var_4_50 + var_4_51 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play113191002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 113191002
		arg_7_1.duration_ = 3.2

		local var_7_0 = {
			ja = 1.3,
			ko = 2.2,
			zh = 3.2,
			en = 2.3
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
				arg_7_0:Play113191003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = 0
			local var_10_1 = 0.05

			if var_10_0 < arg_7_1.time_ and arg_7_1.time_ <= var_10_0 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, true)

				local var_10_2 = arg_7_1:FormatText(StoryNameCfg[208].name)

				arg_7_1.leftNameTxt_.text = var_10_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_7_1.leftNameTxt_.transform)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1.leftNameTxt_.text)
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_3 = arg_7_1:GetWordFromCfg(113191002)
				local var_10_4 = arg_7_1:FormatText(var_10_3.content)

				arg_7_1.text_.text = var_10_4

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_5 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191002", "story_v_out_113191.awb") ~= 0 then
					local var_10_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191002", "story_v_out_113191.awb") / 1000

					if var_10_8 + var_10_0 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_8 + var_10_0
					end

					if var_10_3.prefab_name ~= "" and arg_7_1.actors_[var_10_3.prefab_name] ~= nil then
						local var_10_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_7_1.actors_[var_10_3.prefab_name].transform, "story_v_out_113191", "113191002", "story_v_out_113191.awb")

						arg_7_1:RecordAudio("113191002", var_10_9)
						arg_7_1:RecordAudio("113191002", var_10_9)
					else
						arg_7_1:AudioAction("play", "voice", "story_v_out_113191", "113191002", "story_v_out_113191.awb")
					end

					arg_7_1:RecordHistoryTalkVoice("story_v_out_113191", "113191002", "story_v_out_113191.awb")
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
	Play113191003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 113191003
		arg_11_1.duration_ = 5

		SetActive(arg_11_1.tipsGo_, false)

		function arg_11_1.onSingleLineFinish_()
			arg_11_1.onSingleLineUpdate_ = nil
			arg_11_1.onSingleLineFinish_ = nil
			arg_11_1.state_ = "waiting"
		end

		function arg_11_1.playNext_(arg_13_0)
			if arg_13_0 == 1 then
				arg_11_0:Play113191004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				local var_14_2 = "play"
				local var_14_3 = "music"

				arg_11_1:AudioAction(var_14_2, var_14_3, "bgm_activity_1_3_story_destroyed", "bgm_activity_1_3_story_destroyed", "bgm_activity_1_3_story_destroyed.awb")
			end

			local var_14_4 = 0
			local var_14_5 = 0.8

			if var_14_4 < arg_11_1.time_ and arg_11_1.time_ <= var_14_4 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, false)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_11_1.iconTrs_.gameObject, false)
				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_6 = arg_11_1:GetWordFromCfg(113191003)
				local var_14_7 = arg_11_1:FormatText(var_14_6.content)

				arg_11_1.text_.text = var_14_7

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_8 = 32
				local var_14_9 = utf8.len(var_14_7)
				local var_14_10 = var_14_8 <= 0 and var_14_5 or var_14_5 * (var_14_9 / var_14_8)

				if var_14_10 > 0 and var_14_5 < var_14_10 then
					arg_11_1.talkMaxDuration = var_14_10

					if var_14_10 + var_14_4 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_10 + var_14_4
					end
				end

				arg_11_1.text_.text = var_14_7
				arg_11_1.typewritter.percent = 0

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(false)
				arg_11_1:RecordContent(arg_11_1.text_.text)
			end

			local var_14_11 = math.max(var_14_5, arg_11_1.talkMaxDuration)

			if var_14_4 <= arg_11_1.time_ and arg_11_1.time_ < var_14_4 + var_14_11 then
				arg_11_1.typewritter.percent = (arg_11_1.time_ - var_14_4) / var_14_11

				arg_11_1.typewritter:SetDirty()
			end

			if arg_11_1.time_ >= var_14_4 + var_14_11 and arg_11_1.time_ < var_14_4 + var_14_11 + arg_14_0 then
				arg_11_1.typewritter.percent = 1

				arg_11_1.typewritter:SetDirty()
				arg_11_1:ShowNextGo(true)
			end
		end
	end,
	Play113191004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 113191004
		arg_15_1.duration_ = 8.166

		local var_15_0 = {
			ja = 5.533,
			ko = 5.366,
			zh = 8.166,
			en = 7.5
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
				arg_15_0:Play113191005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.35

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[208].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, false)
				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(113191004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191004", "story_v_out_113191.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191004", "story_v_out_113191.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_113191", "113191004", "story_v_out_113191.awb")

						arg_15_1:RecordAudio("113191004", var_18_9)
						arg_15_1:RecordAudio("113191004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_113191", "113191004", "story_v_out_113191.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_113191", "113191004", "story_v_out_113191.awb")
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
	Play113191005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 113191005
		arg_19_1.duration_ = 5

		SetActive(arg_19_1.tipsGo_, false)

		function arg_19_1.onSingleLineFinish_()
			arg_19_1.onSingleLineUpdate_ = nil
			arg_19_1.onSingleLineFinish_ = nil
			arg_19_1.state_ = "waiting"
		end

		function arg_19_1.playNext_(arg_21_0)
			if arg_21_0 == 1 then
				arg_19_0:Play113191006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "OM0103"

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
				local var_22_5 = arg_19_1.bgs_.OM0103

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
					if iter_22_0 ~= "OM0103" then
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
				local var_22_19 = Color.New(1, 1, 1)

				var_22_19.a = Mathf.Lerp(1, 0, var_22_18)
				arg_19_1.mask_.color = var_22_19
			end

			if arg_19_1.time_ >= var_22_16 + var_22_17 and arg_19_1.time_ < var_22_16 + var_22_17 + arg_22_0 then
				local var_22_20 = Color.New(1, 1, 1)
				local var_22_21 = 0

				arg_19_1.mask_.enabled = false
				var_22_20.a = var_22_21
				arg_19_1.mask_.color = var_22_20
			end

			local var_22_22 = 0

			if var_22_22 < arg_19_1.time_ and arg_19_1.time_ <= var_22_22 + arg_22_0 then
				arg_19_1.screenFilterGo_:SetActive(true)

				arg_19_1.screenFilterEffect_.profile = Asset.Load("Effect/Scene/fx_vintageStyle_Profile")
			end

			local var_22_23 = 2

			if var_22_22 <= arg_19_1.time_ and arg_19_1.time_ < var_22_22 + var_22_23 then
				local var_22_24 = (arg_19_1.time_ - var_22_22) / var_22_23

				arg_19_1.screenFilterEffect_.weight = Mathf.Lerp(0, 1, var_22_24)
			end

			if arg_19_1.time_ >= var_22_22 + var_22_23 and arg_19_1.time_ < var_22_22 + var_22_23 + arg_22_0 then
				arg_19_1.screenFilterEffect_.weight = 1
			end

			local var_22_25 = 0
			local var_22_26 = 0.05

			if var_22_25 < arg_19_1.time_ and arg_19_1.time_ <= var_22_25 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0

				arg_19_1.dialog_:SetActive(true)

				local var_22_27 = LeanTween.value(arg_19_1.dialog_, 0, 1, 0.3)

				var_22_27:setOnUpdate(LuaHelper.FloatAction(function(arg_23_0)
					arg_19_1.dialogCg_.alpha = arg_23_0
				end))
				var_22_27:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_19_1.dialog_)
					var_22_27:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_19_1.duration_ = arg_19_1.duration_ + 0.3

				SetActive(arg_19_1.leftNameGo_, false)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_28 = arg_19_1:GetWordFromCfg(113191001)
				local var_22_29 = arg_19_1:FormatText(var_22_28.content)

				arg_19_1.text_.text = var_22_29

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_30 = 2
				local var_22_31 = utf8.len(var_22_29)
				local var_22_32 = var_22_30 <= 0 and var_22_26 or var_22_26 * (var_22_31 / var_22_30)

				if var_22_32 > 0 and var_22_26 < var_22_32 then
					arg_19_1.talkMaxDuration = var_22_32
					var_22_25 = var_22_25 + 0.3

					if var_22_32 + var_22_25 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_32 + var_22_25
					end
				end

				arg_19_1.text_.text = var_22_29
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)
				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_33 = var_22_25 + 0.3
			local var_22_34 = math.max(var_22_26, arg_19_1.talkMaxDuration)

			if var_22_33 <= arg_19_1.time_ and arg_19_1.time_ < var_22_33 + var_22_34 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_33) / var_22_34

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_33 + var_22_34 and arg_19_1.time_ < var_22_33 + var_22_34 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play113191006 = function(arg_25_0, arg_25_1)
		arg_25_1.time_ = 0
		arg_25_1.frameCnt_ = 0
		arg_25_1.state_ = "playing"
		arg_25_1.curTalkId_ = 113191006
		arg_25_1.duration_ = 5

		SetActive(arg_25_1.tipsGo_, false)

		function arg_25_1.onSingleLineFinish_()
			arg_25_1.onSingleLineUpdate_ = nil
			arg_25_1.onSingleLineFinish_ = nil
			arg_25_1.state_ = "waiting"
		end

		function arg_25_1.playNext_(arg_27_0)
			if arg_27_0 == 1 then
				arg_25_0:Play113191007(arg_25_1)
			end
		end

		function arg_25_1.onSingleLineUpdate_(arg_28_0)
			local var_28_0 = "OM0105"

			if arg_25_1.bgs_[var_28_0] == nil then
				local var_28_1 = Object.Instantiate(arg_25_1.paintGo_)

				var_28_1:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_28_0)
				var_28_1.name = var_28_0
				var_28_1.transform.parent = arg_25_1.stage_.transform
				var_28_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_25_1.bgs_[var_28_0] = var_28_1
			end

			local var_28_2 = 0

			if var_28_2 < arg_25_1.time_ and arg_25_1.time_ <= var_28_2 + arg_28_0 then
				local var_28_3 = manager.ui.mainCamera.transform.localPosition
				local var_28_4 = Vector3.New(0, 0, 10) + Vector3.New(var_28_3.x, var_28_3.y, 0)
				local var_28_5 = arg_25_1.bgs_.OM0105

				var_28_5.transform.localPosition = var_28_4
				var_28_5.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_28_6 = var_28_5:GetComponent("SpriteRenderer")

				if var_28_6 and var_28_6.sprite then
					local var_28_7 = (var_28_5.transform.localPosition - var_28_3).z
					local var_28_8 = manager.ui.mainCameraCom_
					local var_28_9 = 2 * var_28_7 * Mathf.Tan(var_28_8.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_28_10 = var_28_9 * var_28_8.aspect
					local var_28_11 = var_28_6.sprite.bounds.size.x
					local var_28_12 = var_28_6.sprite.bounds.size.y
					local var_28_13 = var_28_10 / var_28_11
					local var_28_14 = var_28_9 / var_28_12
					local var_28_15 = var_28_14 < var_28_13 and var_28_13 or var_28_14

					var_28_5.transform.localScale = Vector3.New(var_28_15, var_28_15, 0)
				end

				for iter_28_0, iter_28_1 in pairs(arg_25_1.bgs_) do
					if iter_28_0 ~= "OM0105" then
						iter_28_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_28_16 = 0

			if var_28_16 < arg_25_1.time_ and arg_25_1.time_ <= var_28_16 + arg_28_0 then
				arg_25_1.mask_.enabled = true
				arg_25_1.mask_.raycastTarget = true

				arg_25_1:SetGaussion(false)
			end

			local var_28_17 = 2

			if var_28_16 <= arg_25_1.time_ and arg_25_1.time_ < var_28_16 + var_28_17 then
				local var_28_18 = (arg_25_1.time_ - var_28_16) / var_28_17
				local var_28_19 = Color.New(1, 1, 1)

				var_28_19.a = Mathf.Lerp(1, 0, var_28_18)
				arg_25_1.mask_.color = var_28_19
			end

			if arg_25_1.time_ >= var_28_16 + var_28_17 and arg_25_1.time_ < var_28_16 + var_28_17 + arg_28_0 then
				local var_28_20 = Color.New(1, 1, 1)
				local var_28_21 = 0

				arg_25_1.mask_.enabled = false
				var_28_20.a = var_28_21
				arg_25_1.mask_.color = var_28_20
			end

			local var_28_22 = 0
			local var_28_23 = 0.05

			if var_28_22 < arg_25_1.time_ and arg_25_1.time_ <= var_28_22 + arg_28_0 then
				arg_25_1.talkMaxDuration = 0

				arg_25_1.dialog_:SetActive(true)

				local var_28_24 = LeanTween.value(arg_25_1.dialog_, 0, 1, 0.3)

				var_28_24:setOnUpdate(LuaHelper.FloatAction(function(arg_29_0)
					arg_25_1.dialogCg_.alpha = arg_29_0
				end))
				var_28_24:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_25_1.dialog_)
					var_28_24:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_25_1.duration_ = arg_25_1.duration_ + 0.3

				SetActive(arg_25_1.leftNameGo_, false)

				arg_25_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_25_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_25_1:RecordName(arg_25_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_25_1.iconTrs_.gameObject, false)
				arg_25_1.callingController_:SetSelectedState("normal")

				local var_28_25 = arg_25_1:GetWordFromCfg(113191001)
				local var_28_26 = arg_25_1:FormatText(var_28_25.content)

				arg_25_1.text_.text = var_28_26

				LuaForUtil.ClearLinePrefixSymbol(arg_25_1.text_)

				local var_28_27 = 2
				local var_28_28 = utf8.len(var_28_26)
				local var_28_29 = var_28_27 <= 0 and var_28_23 or var_28_23 * (var_28_28 / var_28_27)

				if var_28_29 > 0 and var_28_23 < var_28_29 then
					arg_25_1.talkMaxDuration = var_28_29
					var_28_22 = var_28_22 + 0.3

					if var_28_29 + var_28_22 > arg_25_1.duration_ then
						arg_25_1.duration_ = var_28_29 + var_28_22
					end
				end

				arg_25_1.text_.text = var_28_26
				arg_25_1.typewritter.percent = 0

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(false)
				arg_25_1:RecordContent(arg_25_1.text_.text)
			end

			local var_28_30 = var_28_22 + 0.3
			local var_28_31 = math.max(var_28_23, arg_25_1.talkMaxDuration)

			if var_28_30 <= arg_25_1.time_ and arg_25_1.time_ < var_28_30 + var_28_31 then
				arg_25_1.typewritter.percent = (arg_25_1.time_ - var_28_30) / var_28_31

				arg_25_1.typewritter:SetDirty()
			end

			if arg_25_1.time_ >= var_28_30 + var_28_31 and arg_25_1.time_ < var_28_30 + var_28_31 + arg_28_0 then
				arg_25_1.typewritter.percent = 1

				arg_25_1.typewritter:SetDirty()
				arg_25_1:ShowNextGo(true)
			end
		end
	end,
	Play113191007 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 113191007
		arg_31_1.duration_ = 9.7

		local var_31_0 = {
			ja = 8.466,
			ko = 7.633,
			zh = 9.7,
			en = 7.466
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
				arg_31_0:Play113191008(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 2

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				local var_34_1 = manager.ui.mainCamera.transform.localPosition
				local var_34_2 = Vector3.New(0, 0, 10) + Vector3.New(var_34_1.x, var_34_1.y, 0)
				local var_34_3 = arg_31_1.bgs_.OM0106

				var_34_3.transform.localPosition = var_34_2
				var_34_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_34_4 = var_34_3:GetComponent("SpriteRenderer")

				if var_34_4 and var_34_4.sprite then
					local var_34_5 = (var_34_3.transform.localPosition - var_34_1).z
					local var_34_6 = manager.ui.mainCameraCom_
					local var_34_7 = 2 * var_34_5 * Mathf.Tan(var_34_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_34_8 = var_34_7 * var_34_6.aspect
					local var_34_9 = var_34_4.sprite.bounds.size.x
					local var_34_10 = var_34_4.sprite.bounds.size.y
					local var_34_11 = var_34_8 / var_34_9
					local var_34_12 = var_34_7 / var_34_10
					local var_34_13 = var_34_12 < var_34_11 and var_34_11 or var_34_12

					var_34_3.transform.localScale = Vector3.New(var_34_13, var_34_13, 0)
				end

				for iter_34_0, iter_34_1 in pairs(arg_31_1.bgs_) do
					if iter_34_0 ~= "OM0106" then
						iter_34_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_34_14 = 0

			if var_34_14 < arg_31_1.time_ and arg_31_1.time_ <= var_34_14 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_15 = 2

			if var_34_14 <= arg_31_1.time_ and arg_31_1.time_ < var_34_14 + var_34_15 then
				local var_34_16 = (arg_31_1.time_ - var_34_14) / var_34_15
				local var_34_17 = Color.New(0, 0, 0)

				var_34_17.a = Mathf.Lerp(0, 1, var_34_16)
				arg_31_1.mask_.color = var_34_17
			end

			if arg_31_1.time_ >= var_34_14 + var_34_15 and arg_31_1.time_ < var_34_14 + var_34_15 + arg_34_0 then
				local var_34_18 = Color.New(0, 0, 0)

				var_34_18.a = 1
				arg_31_1.mask_.color = var_34_18
			end

			local var_34_19 = 2

			if var_34_19 < arg_31_1.time_ and arg_31_1.time_ <= var_34_19 + arg_34_0 then
				arg_31_1.mask_.enabled = true
				arg_31_1.mask_.raycastTarget = true

				arg_31_1:SetGaussion(false)
			end

			local var_34_20 = 2

			if var_34_19 <= arg_31_1.time_ and arg_31_1.time_ < var_34_19 + var_34_20 then
				local var_34_21 = (arg_31_1.time_ - var_34_19) / var_34_20
				local var_34_22 = Color.New(0, 0, 0)

				var_34_22.a = Mathf.Lerp(1, 0, var_34_21)
				arg_31_1.mask_.color = var_34_22
			end

			if arg_31_1.time_ >= var_34_19 + var_34_20 and arg_31_1.time_ < var_34_19 + var_34_20 + arg_34_0 then
				local var_34_23 = Color.New(0, 0, 0)
				local var_34_24 = 0

				arg_31_1.mask_.enabled = false
				var_34_23.a = var_34_24
				arg_31_1.mask_.color = var_34_23
			end

			local var_34_25 = 2

			if var_34_25 < arg_31_1.time_ and arg_31_1.time_ <= var_34_25 + arg_34_0 then
				arg_31_1.screenFilterGo_:SetActive(false)
			end

			local var_34_26 = 0.0166666666666667

			if var_34_25 <= arg_31_1.time_ and arg_31_1.time_ < var_34_25 + var_34_26 then
				local var_34_27 = (arg_31_1.time_ - var_34_25) / var_34_26

				arg_31_1.screenFilterEffect_.weight = Mathf.Lerp(1, 0, var_34_27)
			end

			if arg_31_1.time_ >= var_34_25 + var_34_26 and arg_31_1.time_ < var_34_25 + var_34_26 + arg_34_0 then
				arg_31_1.screenFilterEffect_.weight = 0
			end

			local var_34_28 = arg_31_1.bgs_.OM0106.transform
			local var_34_29 = 2

			if var_34_29 < arg_31_1.time_ and arg_31_1.time_ <= var_34_29 + arg_34_0 then
				arg_31_1.var_.moveOldPosOM0106 = var_34_28.localPosition
			end

			local var_34_30 = 0.001

			if var_34_29 <= arg_31_1.time_ and arg_31_1.time_ < var_34_29 + var_34_30 then
				local var_34_31 = (arg_31_1.time_ - var_34_29) / var_34_30
				local var_34_32 = Vector3.New(0, 1, 9.6)

				var_34_28.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPosOM0106, var_34_32, var_34_31)
			end

			if arg_31_1.time_ >= var_34_29 + var_34_30 and arg_31_1.time_ < var_34_29 + var_34_30 + arg_34_0 then
				var_34_28.localPosition = Vector3.New(0, 1, 9.6)
			end

			local var_34_33 = arg_31_1.bgs_.OM0106.transform
			local var_34_34 = 2.034

			if var_34_34 < arg_31_1.time_ and arg_31_1.time_ <= var_34_34 + arg_34_0 then
				arg_31_1.var_.moveOldPosOM0106 = var_34_33.localPosition
			end

			local var_34_35 = 3

			if var_34_34 <= arg_31_1.time_ and arg_31_1.time_ < var_34_34 + var_34_35 then
				local var_34_36 = (arg_31_1.time_ - var_34_34) / var_34_35
				local var_34_37 = Vector3.New(0, 1, 10)

				var_34_33.localPosition = Vector3.Lerp(arg_31_1.var_.moveOldPosOM0106, var_34_37, var_34_36)
			end

			if arg_31_1.time_ >= var_34_34 + var_34_35 and arg_31_1.time_ < var_34_34 + var_34_35 + arg_34_0 then
				var_34_33.localPosition = Vector3.New(0, 1, 10)
			end

			local var_34_38 = 4

			if var_34_38 < arg_31_1.time_ and arg_31_1.time_ <= var_34_38 + arg_34_0 then
				arg_31_1.allBtn_.enabled = false
			end

			local var_34_39 = 1.034

			if arg_31_1.time_ >= var_34_38 + var_34_39 and arg_31_1.time_ < var_34_38 + var_34_39 + arg_34_0 then
				arg_31_1.allBtn_.enabled = true
			end

			if arg_31_1.frameCnt_ <= 1 then
				arg_31_1.dialog_:SetActive(false)
			end

			local var_34_40 = 4
			local var_34_41 = 0.2

			if var_34_40 < arg_31_1.time_ and arg_31_1.time_ <= var_34_40 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0

				arg_31_1.dialog_:SetActive(true)

				local var_34_42 = LeanTween.value(arg_31_1.dialog_, 0, 1, 0.3)

				var_34_42:setOnUpdate(LuaHelper.FloatAction(function(arg_35_0)
					arg_31_1.dialogCg_.alpha = arg_35_0
				end))
				var_34_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_31_1.dialog_)
					var_34_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_31_1.duration_ = arg_31_1.duration_ + 0.3

				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_43 = arg_31_1:FormatText(StoryNameCfg[208].name)

				arg_31_1.leftNameTxt_.text = var_34_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, false)
				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_44 = arg_31_1:GetWordFromCfg(113191007)
				local var_34_45 = arg_31_1:FormatText(var_34_44.content)

				arg_31_1.text_.text = var_34_45

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_46 = 8
				local var_34_47 = utf8.len(var_34_45)
				local var_34_48 = var_34_46 <= 0 and var_34_41 or var_34_41 * (var_34_47 / var_34_46)

				if var_34_48 > 0 and var_34_41 < var_34_48 then
					arg_31_1.talkMaxDuration = var_34_48
					var_34_40 = var_34_40 + 0.3

					if var_34_48 + var_34_40 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_48 + var_34_40
					end
				end

				arg_31_1.text_.text = var_34_45
				arg_31_1.typewritter.percent = 0

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191007", "story_v_out_113191.awb") ~= 0 then
					local var_34_49 = manager.audio:GetVoiceLength("story_v_out_113191", "113191007", "story_v_out_113191.awb") / 1000

					if var_34_49 + var_34_40 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_49 + var_34_40
					end

					if var_34_44.prefab_name ~= "" and arg_31_1.actors_[var_34_44.prefab_name] ~= nil then
						local var_34_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_44.prefab_name].transform, "story_v_out_113191", "113191007", "story_v_out_113191.awb")

						arg_31_1:RecordAudio("113191007", var_34_50)
						arg_31_1:RecordAudio("113191007", var_34_50)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_113191", "113191007", "story_v_out_113191.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_113191", "113191007", "story_v_out_113191.awb")
				end

				arg_31_1:RecordContent(arg_31_1.text_.text)
			end

			local var_34_51 = var_34_40 + 0.3
			local var_34_52 = math.max(var_34_41, arg_31_1.talkMaxDuration)

			if var_34_51 <= arg_31_1.time_ and arg_31_1.time_ < var_34_51 + var_34_52 then
				arg_31_1.typewritter.percent = (arg_31_1.time_ - var_34_51) / var_34_52

				arg_31_1.typewritter:SetDirty()
			end

			if arg_31_1.time_ >= var_34_51 + var_34_52 and arg_31_1.time_ < var_34_51 + var_34_52 + arg_34_0 then
				arg_31_1.typewritter.percent = 1

				arg_31_1.typewritter:SetDirty()
				arg_31_1:ShowNextGo(true)
			end
		end
	end,
	Play113191008 = function(arg_37_0, arg_37_1)
		arg_37_1.time_ = 0
		arg_37_1.frameCnt_ = 0
		arg_37_1.state_ = "playing"
		arg_37_1.curTalkId_ = 113191008
		arg_37_1.duration_ = 7.266

		local var_37_0 = {
			ja = 7.266,
			ko = 2.8,
			zh = 4.233,
			en = 5.466
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
				arg_37_0:Play113191009(arg_37_1)
			end
		end

		function arg_37_1.onSingleLineUpdate_(arg_40_0)
			local var_40_0 = 0
			local var_40_1 = 0.25

			if var_40_0 < arg_37_1.time_ and arg_37_1.time_ <= var_40_0 + arg_40_0 then
				arg_37_1.talkMaxDuration = 0
				arg_37_1.dialogCg_.alpha = 1

				arg_37_1.dialog_:SetActive(true)
				SetActive(arg_37_1.leftNameGo_, true)

				local var_40_2 = arg_37_1:FormatText(StoryNameCfg[208].name)

				arg_37_1.leftNameTxt_.text = var_40_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_37_1.leftNameTxt_.transform)

				arg_37_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_37_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_37_1:RecordName(arg_37_1.leftNameTxt_.text)
				SetActive(arg_37_1.iconTrs_.gameObject, false)
				arg_37_1.callingController_:SetSelectedState("normal")

				local var_40_3 = arg_37_1:GetWordFromCfg(113191008)
				local var_40_4 = arg_37_1:FormatText(var_40_3.content)

				arg_37_1.text_.text = var_40_4

				LuaForUtil.ClearLinePrefixSymbol(arg_37_1.text_)

				local var_40_5 = 10
				local var_40_6 = utf8.len(var_40_4)
				local var_40_7 = var_40_5 <= 0 and var_40_1 or var_40_1 * (var_40_6 / var_40_5)

				if var_40_7 > 0 and var_40_1 < var_40_7 then
					arg_37_1.talkMaxDuration = var_40_7

					if var_40_7 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_7 + var_40_0
					end
				end

				arg_37_1.text_.text = var_40_4
				arg_37_1.typewritter.percent = 0

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191008", "story_v_out_113191.awb") ~= 0 then
					local var_40_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191008", "story_v_out_113191.awb") / 1000

					if var_40_8 + var_40_0 > arg_37_1.duration_ then
						arg_37_1.duration_ = var_40_8 + var_40_0
					end

					if var_40_3.prefab_name ~= "" and arg_37_1.actors_[var_40_3.prefab_name] ~= nil then
						local var_40_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_37_1.actors_[var_40_3.prefab_name].transform, "story_v_out_113191", "113191008", "story_v_out_113191.awb")

						arg_37_1:RecordAudio("113191008", var_40_9)
						arg_37_1:RecordAudio("113191008", var_40_9)
					else
						arg_37_1:AudioAction("play", "voice", "story_v_out_113191", "113191008", "story_v_out_113191.awb")
					end

					arg_37_1:RecordHistoryTalkVoice("story_v_out_113191", "113191008", "story_v_out_113191.awb")
				end

				arg_37_1:RecordContent(arg_37_1.text_.text)
			end

			local var_40_10 = math.max(var_40_1, arg_37_1.talkMaxDuration)

			if var_40_0 <= arg_37_1.time_ and arg_37_1.time_ < var_40_0 + var_40_10 then
				arg_37_1.typewritter.percent = (arg_37_1.time_ - var_40_0) / var_40_10

				arg_37_1.typewritter:SetDirty()
			end

			if arg_37_1.time_ >= var_40_0 + var_40_10 and arg_37_1.time_ < var_40_0 + var_40_10 + arg_40_0 then
				arg_37_1.typewritter.percent = 1

				arg_37_1.typewritter:SetDirty()
				arg_37_1:ShowNextGo(true)
			end
		end
	end,
	Play113191009 = function(arg_41_0, arg_41_1)
		arg_41_1.time_ = 0
		arg_41_1.frameCnt_ = 0
		arg_41_1.state_ = "playing"
		arg_41_1.curTalkId_ = 113191009
		arg_41_1.duration_ = 1.233

		local var_41_0 = {
			ja = 1.066,
			ko = 1.233,
			zh = 1.133,
			en = 1.2
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
				arg_41_0:Play113191010(arg_41_1)
			end
		end

		function arg_41_1.onSingleLineUpdate_(arg_44_0)
			local var_44_0 = 0
			local var_44_1 = 0.1

			if var_44_0 < arg_41_1.time_ and arg_41_1.time_ <= var_44_0 + arg_44_0 then
				arg_41_1.talkMaxDuration = 0
				arg_41_1.dialogCg_.alpha = 1

				arg_41_1.dialog_:SetActive(true)
				SetActive(arg_41_1.leftNameGo_, true)

				local var_44_2 = arg_41_1:FormatText(StoryNameCfg[94].name)

				arg_41_1.leftNameTxt_.text = var_44_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_41_1.leftNameTxt_.transform)

				arg_41_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_41_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_41_1:RecordName(arg_41_1.leftNameTxt_.text)
				SetActive(arg_41_1.iconTrs_.gameObject, true)
				arg_41_1.iconController_:SetSelectedState("hero")

				arg_41_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1038_split_5")

				arg_41_1.callingController_:SetSelectedState("normal")

				local var_44_3 = arg_41_1:GetWordFromCfg(113191009)
				local var_44_4 = arg_41_1:FormatText(var_44_3.content)

				arg_41_1.text_.text = var_44_4

				LuaForUtil.ClearLinePrefixSymbol(arg_41_1.text_)

				local var_44_5 = 4
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191009", "story_v_out_113191.awb") ~= 0 then
					local var_44_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191009", "story_v_out_113191.awb") / 1000

					if var_44_8 + var_44_0 > arg_41_1.duration_ then
						arg_41_1.duration_ = var_44_8 + var_44_0
					end

					if var_44_3.prefab_name ~= "" and arg_41_1.actors_[var_44_3.prefab_name] ~= nil then
						local var_44_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_41_1.actors_[var_44_3.prefab_name].transform, "story_v_out_113191", "113191009", "story_v_out_113191.awb")

						arg_41_1:RecordAudio("113191009", var_44_9)
						arg_41_1:RecordAudio("113191009", var_44_9)
					else
						arg_41_1:AudioAction("play", "voice", "story_v_out_113191", "113191009", "story_v_out_113191.awb")
					end

					arg_41_1:RecordHistoryTalkVoice("story_v_out_113191", "113191009", "story_v_out_113191.awb")
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
	Play113191010 = function(arg_45_0, arg_45_1)
		arg_45_1.time_ = 0
		arg_45_1.frameCnt_ = 0
		arg_45_1.state_ = "playing"
		arg_45_1.curTalkId_ = 113191010
		arg_45_1.duration_ = 2.433

		local var_45_0 = {
			ja = 1.7,
			ko = 2.1,
			zh = 2.433,
			en = 1.333
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
				arg_45_0:Play113191011(arg_45_1)
			end
		end

		function arg_45_1.onSingleLineUpdate_(arg_48_0)
			local var_48_0 = 0
			local var_48_1 = 0.125

			if var_48_0 < arg_45_1.time_ and arg_45_1.time_ <= var_48_0 + arg_48_0 then
				arg_45_1.talkMaxDuration = 0
				arg_45_1.dialogCg_.alpha = 1

				arg_45_1.dialog_:SetActive(true)
				SetActive(arg_45_1.leftNameGo_, true)

				local var_48_2 = arg_45_1:FormatText(StoryNameCfg[208].name)

				arg_45_1.leftNameTxt_.text = var_48_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_45_1.leftNameTxt_.transform)

				arg_45_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_45_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_45_1:RecordName(arg_45_1.leftNameTxt_.text)
				SetActive(arg_45_1.iconTrs_.gameObject, false)
				arg_45_1.callingController_:SetSelectedState("normal")

				local var_48_3 = arg_45_1:GetWordFromCfg(113191010)
				local var_48_4 = arg_45_1:FormatText(var_48_3.content)

				arg_45_1.text_.text = var_48_4

				LuaForUtil.ClearLinePrefixSymbol(arg_45_1.text_)

				local var_48_5 = 5
				local var_48_6 = utf8.len(var_48_4)
				local var_48_7 = var_48_5 <= 0 and var_48_1 or var_48_1 * (var_48_6 / var_48_5)

				if var_48_7 > 0 and var_48_1 < var_48_7 then
					arg_45_1.talkMaxDuration = var_48_7

					if var_48_7 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_7 + var_48_0
					end
				end

				arg_45_1.text_.text = var_48_4
				arg_45_1.typewritter.percent = 0

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191010", "story_v_out_113191.awb") ~= 0 then
					local var_48_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191010", "story_v_out_113191.awb") / 1000

					if var_48_8 + var_48_0 > arg_45_1.duration_ then
						arg_45_1.duration_ = var_48_8 + var_48_0
					end

					if var_48_3.prefab_name ~= "" and arg_45_1.actors_[var_48_3.prefab_name] ~= nil then
						local var_48_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_45_1.actors_[var_48_3.prefab_name].transform, "story_v_out_113191", "113191010", "story_v_out_113191.awb")

						arg_45_1:RecordAudio("113191010", var_48_9)
						arg_45_1:RecordAudio("113191010", var_48_9)
					else
						arg_45_1:AudioAction("play", "voice", "story_v_out_113191", "113191010", "story_v_out_113191.awb")
					end

					arg_45_1:RecordHistoryTalkVoice("story_v_out_113191", "113191010", "story_v_out_113191.awb")
				end

				arg_45_1:RecordContent(arg_45_1.text_.text)
			end

			local var_48_10 = math.max(var_48_1, arg_45_1.talkMaxDuration)

			if var_48_0 <= arg_45_1.time_ and arg_45_1.time_ < var_48_0 + var_48_10 then
				arg_45_1.typewritter.percent = (arg_45_1.time_ - var_48_0) / var_48_10

				arg_45_1.typewritter:SetDirty()
			end

			if arg_45_1.time_ >= var_48_0 + var_48_10 and arg_45_1.time_ < var_48_0 + var_48_10 + arg_48_0 then
				arg_45_1.typewritter.percent = 1

				arg_45_1.typewritter:SetDirty()
				arg_45_1:ShowNextGo(true)
			end
		end
	end,
	Play113191011 = function(arg_49_0, arg_49_1)
		arg_49_1.time_ = 0
		arg_49_1.frameCnt_ = 0
		arg_49_1.state_ = "playing"
		arg_49_1.curTalkId_ = 113191011
		arg_49_1.duration_ = 10.366

		local var_49_0 = {
			ja = 6.1,
			ko = 10.366,
			zh = 8.933,
			en = 9.5
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
				arg_49_0:Play113191012(arg_49_1)
			end
		end

		function arg_49_1.onSingleLineUpdate_(arg_52_0)
			local var_52_0 = 0

			if var_52_0 < arg_49_1.time_ and arg_49_1.time_ <= var_52_0 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_1 = 2

			if var_52_0 <= arg_49_1.time_ and arg_49_1.time_ < var_52_0 + var_52_1 then
				local var_52_2 = (arg_49_1.time_ - var_52_0) / var_52_1
				local var_52_3 = Color.New(0, 0, 0)

				var_52_3.a = Mathf.Lerp(0, 1, var_52_2)
				arg_49_1.mask_.color = var_52_3
			end

			if arg_49_1.time_ >= var_52_0 + var_52_1 and arg_49_1.time_ < var_52_0 + var_52_1 + arg_52_0 then
				local var_52_4 = Color.New(0, 0, 0)

				var_52_4.a = 1
				arg_49_1.mask_.color = var_52_4
			end

			local var_52_5 = 2

			if var_52_5 < arg_49_1.time_ and arg_49_1.time_ <= var_52_5 + arg_52_0 then
				arg_49_1.mask_.enabled = true
				arg_49_1.mask_.raycastTarget = true

				arg_49_1:SetGaussion(false)
			end

			local var_52_6 = 2

			if var_52_5 <= arg_49_1.time_ and arg_49_1.time_ < var_52_5 + var_52_6 then
				local var_52_7 = (arg_49_1.time_ - var_52_5) / var_52_6
				local var_52_8 = Color.New(0, 0, 0)

				var_52_8.a = Mathf.Lerp(1, 0, var_52_7)
				arg_49_1.mask_.color = var_52_8
			end

			if arg_49_1.time_ >= var_52_5 + var_52_6 and arg_49_1.time_ < var_52_5 + var_52_6 + arg_52_0 then
				local var_52_9 = Color.New(0, 0, 0)
				local var_52_10 = 0

				arg_49_1.mask_.enabled = false
				var_52_9.a = var_52_10
				arg_49_1.mask_.color = var_52_9
			end

			local var_52_11 = "F03b"

			if arg_49_1.bgs_[var_52_11] == nil then
				local var_52_12 = Object.Instantiate(arg_49_1.paintGo_)

				var_52_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_52_11)
				var_52_12.name = var_52_11
				var_52_12.transform.parent = arg_49_1.stage_.transform
				var_52_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.bgs_[var_52_11] = var_52_12
			end

			local var_52_13 = 2

			if var_52_13 < arg_49_1.time_ and arg_49_1.time_ <= var_52_13 + arg_52_0 then
				local var_52_14 = manager.ui.mainCamera.transform.localPosition
				local var_52_15 = Vector3.New(0, 0, 10) + Vector3.New(var_52_14.x, var_52_14.y, 0)
				local var_52_16 = arg_49_1.bgs_.F03b

				var_52_16.transform.localPosition = var_52_15
				var_52_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_52_17 = var_52_16:GetComponent("SpriteRenderer")

				if var_52_17 and var_52_17.sprite then
					local var_52_18 = (var_52_16.transform.localPosition - var_52_14).z
					local var_52_19 = manager.ui.mainCameraCom_
					local var_52_20 = 2 * var_52_18 * Mathf.Tan(var_52_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_52_21 = var_52_20 * var_52_19.aspect
					local var_52_22 = var_52_17.sprite.bounds.size.x
					local var_52_23 = var_52_17.sprite.bounds.size.y
					local var_52_24 = var_52_21 / var_52_22
					local var_52_25 = var_52_20 / var_52_23
					local var_52_26 = var_52_25 < var_52_24 and var_52_24 or var_52_25

					var_52_16.transform.localScale = Vector3.New(var_52_26, var_52_26, 0)
				end

				for iter_52_0, iter_52_1 in pairs(arg_49_1.bgs_) do
					if iter_52_0 ~= "F03b" then
						iter_52_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_52_27 = "1084ui_story"

			if arg_49_1.actors_[var_52_27] == nil then
				local var_52_28 = Object.Instantiate(Asset.Load("Char/" .. var_52_27), arg_49_1.stage_.transform)

				var_52_28.name = var_52_27
				var_52_28.transform.localPosition = Vector3.New(0, 100, 0)
				arg_49_1.actors_[var_52_27] = var_52_28

				local var_52_29 = var_52_28:GetComponentInChildren(typeof(CharacterEffect))

				var_52_29.enabled = true

				local var_52_30 = GameObjectTools.GetOrAddComponent(var_52_28, typeof(DynamicBoneHelper))

				if var_52_30 then
					var_52_30:EnableDynamicBone(false)
				end

				arg_49_1:ShowWeapon(var_52_29.transform, false)

				arg_49_1.var_[var_52_27 .. "Animator"] = var_52_29.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_49_1.var_[var_52_27 .. "Animator"].applyRootMotion = true
				arg_49_1.var_[var_52_27 .. "LipSync"] = var_52_29.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_52_31 = arg_49_1.actors_["1084ui_story"].transform
			local var_52_32 = 3.8

			if var_52_32 < arg_49_1.time_ and arg_49_1.time_ <= var_52_32 + arg_52_0 then
				arg_49_1.var_.moveOldPos1084ui_story = var_52_31.localPosition
			end

			local var_52_33 = 0.001

			if var_52_32 <= arg_49_1.time_ and arg_49_1.time_ < var_52_32 + var_52_33 then
				local var_52_34 = (arg_49_1.time_ - var_52_32) / var_52_33
				local var_52_35 = Vector3.New(-0.7, -0.97, -6)

				var_52_31.localPosition = Vector3.Lerp(arg_49_1.var_.moveOldPos1084ui_story, var_52_35, var_52_34)

				local var_52_36 = manager.ui.mainCamera.transform.position - var_52_31.position

				var_52_31.forward = Vector3.New(var_52_36.x, var_52_36.y, var_52_36.z)

				local var_52_37 = var_52_31.localEulerAngles

				var_52_37.z = 0
				var_52_37.x = 0
				var_52_31.localEulerAngles = var_52_37
			end

			if arg_49_1.time_ >= var_52_32 + var_52_33 and arg_49_1.time_ < var_52_32 + var_52_33 + arg_52_0 then
				var_52_31.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_52_38 = manager.ui.mainCamera.transform.position - var_52_31.position

				var_52_31.forward = Vector3.New(var_52_38.x, var_52_38.y, var_52_38.z)

				local var_52_39 = var_52_31.localEulerAngles

				var_52_39.z = 0
				var_52_39.x = 0
				var_52_31.localEulerAngles = var_52_39
			end

			local var_52_40 = 3.8

			if var_52_40 < arg_49_1.time_ and arg_49_1.time_ <= var_52_40 + arg_52_0 then
				arg_49_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_52_41 = 3.8

			if var_52_41 < arg_49_1.time_ and arg_49_1.time_ <= var_52_41 + arg_52_0 then
				arg_49_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_52_42 = arg_49_1.actors_["1084ui_story"]
			local var_52_43 = 3.8

			if var_52_43 < arg_49_1.time_ and arg_49_1.time_ <= var_52_43 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story == nil then
				arg_49_1.var_.characterEffect1084ui_story = var_52_42:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_52_44 = 0.2

			if var_52_43 <= arg_49_1.time_ and arg_49_1.time_ < var_52_43 + var_52_44 then
				local var_52_45 = (arg_49_1.time_ - var_52_43) / var_52_44

				if arg_49_1.var_.characterEffect1084ui_story then
					arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_49_1.time_ >= var_52_43 + var_52_44 and arg_49_1.time_ < var_52_43 + var_52_44 + arg_52_0 and arg_49_1.var_.characterEffect1084ui_story then
				arg_49_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			if arg_49_1.frameCnt_ <= 1 then
				arg_49_1.dialog_:SetActive(false)
			end

			local var_52_46 = 4
			local var_52_47 = 0.525

			if var_52_46 < arg_49_1.time_ and arg_49_1.time_ <= var_52_46 + arg_52_0 then
				arg_49_1.talkMaxDuration = 0

				arg_49_1.dialog_:SetActive(true)

				local var_52_48 = LeanTween.value(arg_49_1.dialog_, 0, 1, 0.3)

				var_52_48:setOnUpdate(LuaHelper.FloatAction(function(arg_53_0)
					arg_49_1.dialogCg_.alpha = arg_53_0
				end))
				var_52_48:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_49_1.dialog_)
					var_52_48:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_49_1.duration_ = arg_49_1.duration_ + 0.3

				SetActive(arg_49_1.leftNameGo_, true)

				local var_52_49 = arg_49_1:FormatText(StoryNameCfg[6].name)

				arg_49_1.leftNameTxt_.text = var_52_49

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_49_1.leftNameTxt_.transform)

				arg_49_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_49_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_49_1:RecordName(arg_49_1.leftNameTxt_.text)
				SetActive(arg_49_1.iconTrs_.gameObject, false)
				arg_49_1.callingController_:SetSelectedState("normal")

				local var_52_50 = arg_49_1:GetWordFromCfg(113191011)
				local var_52_51 = arg_49_1:FormatText(var_52_50.content)

				arg_49_1.text_.text = var_52_51

				LuaForUtil.ClearLinePrefixSymbol(arg_49_1.text_)

				local var_52_52 = 21
				local var_52_53 = utf8.len(var_52_51)
				local var_52_54 = var_52_52 <= 0 and var_52_47 or var_52_47 * (var_52_53 / var_52_52)

				if var_52_54 > 0 and var_52_47 < var_52_54 then
					arg_49_1.talkMaxDuration = var_52_54
					var_52_46 = var_52_46 + 0.3

					if var_52_54 + var_52_46 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_54 + var_52_46
					end
				end

				arg_49_1.text_.text = var_52_51
				arg_49_1.typewritter.percent = 0

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191011", "story_v_out_113191.awb") ~= 0 then
					local var_52_55 = manager.audio:GetVoiceLength("story_v_out_113191", "113191011", "story_v_out_113191.awb") / 1000

					if var_52_55 + var_52_46 > arg_49_1.duration_ then
						arg_49_1.duration_ = var_52_55 + var_52_46
					end

					if var_52_50.prefab_name ~= "" and arg_49_1.actors_[var_52_50.prefab_name] ~= nil then
						local var_52_56 = LuaForUtil.PlayVoiceWithCriLipsync(arg_49_1.actors_[var_52_50.prefab_name].transform, "story_v_out_113191", "113191011", "story_v_out_113191.awb")

						arg_49_1:RecordAudio("113191011", var_52_56)
						arg_49_1:RecordAudio("113191011", var_52_56)
					else
						arg_49_1:AudioAction("play", "voice", "story_v_out_113191", "113191011", "story_v_out_113191.awb")
					end

					arg_49_1:RecordHistoryTalkVoice("story_v_out_113191", "113191011", "story_v_out_113191.awb")
				end

				arg_49_1:RecordContent(arg_49_1.text_.text)
			end

			local var_52_57 = var_52_46 + 0.3
			local var_52_58 = math.max(var_52_47, arg_49_1.talkMaxDuration)

			if var_52_57 <= arg_49_1.time_ and arg_49_1.time_ < var_52_57 + var_52_58 then
				arg_49_1.typewritter.percent = (arg_49_1.time_ - var_52_57) / var_52_58

				arg_49_1.typewritter:SetDirty()
			end

			if arg_49_1.time_ >= var_52_57 + var_52_58 and arg_49_1.time_ < var_52_57 + var_52_58 + arg_52_0 then
				arg_49_1.typewritter.percent = 1

				arg_49_1.typewritter:SetDirty()
				arg_49_1:ShowNextGo(true)
			end
		end
	end,
	Play113191012 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 113191012
		arg_55_1.duration_ = 9.1

		local var_55_0 = {
			ja = 9.1,
			ko = 5.866,
			zh = 4.633,
			en = 6.533
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
				arg_55_0:Play113191013(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1084ui_story"]
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 and arg_55_1.var_.characterEffect1084ui_story == nil then
				arg_55_1.var_.characterEffect1084ui_story = var_58_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_2 = 0.2

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
			local var_58_7 = 0.55

			if var_58_6 < arg_55_1.time_ and arg_55_1.time_ <= var_58_6 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_8 = arg_55_1:FormatText(StoryNameCfg[10].name)

				arg_55_1.leftNameTxt_.text = var_58_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, true)
				arg_55_1.iconController_:SetSelectedState("hero")

				arg_55_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_9 = arg_55_1:GetWordFromCfg(113191012)
				local var_58_10 = arg_55_1:FormatText(var_58_9.content)

				arg_55_1.text_.text = var_58_10

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_11 = 22
				local var_58_12 = utf8.len(var_58_10)
				local var_58_13 = var_58_11 <= 0 and var_58_7 or var_58_7 * (var_58_12 / var_58_11)

				if var_58_13 > 0 and var_58_7 < var_58_13 then
					arg_55_1.talkMaxDuration = var_58_13

					if var_58_13 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_13 + var_58_6
					end
				end

				arg_55_1.text_.text = var_58_10
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191012", "story_v_out_113191.awb") ~= 0 then
					local var_58_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191012", "story_v_out_113191.awb") / 1000

					if var_58_14 + var_58_6 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_14 + var_58_6
					end

					if var_58_9.prefab_name ~= "" and arg_55_1.actors_[var_58_9.prefab_name] ~= nil then
						local var_58_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_9.prefab_name].transform, "story_v_out_113191", "113191012", "story_v_out_113191.awb")

						arg_55_1:RecordAudio("113191012", var_58_15)
						arg_55_1:RecordAudio("113191012", var_58_15)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_113191", "113191012", "story_v_out_113191.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_113191", "113191012", "story_v_out_113191.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_16 = math.max(var_58_7, arg_55_1.talkMaxDuration)

			if var_58_6 <= arg_55_1.time_ and arg_55_1.time_ < var_58_6 + var_58_16 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_6) / var_58_16

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_6 + var_58_16 and arg_55_1.time_ < var_58_6 + var_58_16 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play113191013 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 113191013
		arg_59_1.duration_ = 4.5

		local var_59_0 = {
			ja = 4.5,
			ko = 3,
			zh = 2.1,
			en = 1.999999999999
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
				arg_59_0:Play113191014(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = "1038ui_story"

			if arg_59_1.actors_[var_62_0] == nil then
				local var_62_1 = Object.Instantiate(Asset.Load("Char/" .. var_62_0), arg_59_1.stage_.transform)

				var_62_1.name = var_62_0
				var_62_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_59_1.actors_[var_62_0] = var_62_1

				local var_62_2 = var_62_1:GetComponentInChildren(typeof(CharacterEffect))

				var_62_2.enabled = true

				local var_62_3 = GameObjectTools.GetOrAddComponent(var_62_1, typeof(DynamicBoneHelper))

				if var_62_3 then
					var_62_3:EnableDynamicBone(false)
				end

				arg_59_1:ShowWeapon(var_62_2.transform, false)

				arg_59_1.var_[var_62_0 .. "Animator"] = var_62_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_59_1.var_[var_62_0 .. "Animator"].applyRootMotion = true
				arg_59_1.var_[var_62_0 .. "LipSync"] = var_62_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_62_4 = arg_59_1.actors_["1038ui_story"].transform
			local var_62_5 = 0

			if var_62_5 < arg_59_1.time_ and arg_59_1.time_ <= var_62_5 + arg_62_0 then
				arg_59_1.var_.moveOldPos1038ui_story = var_62_4.localPosition
			end

			local var_62_6 = 0.001

			if var_62_5 <= arg_59_1.time_ and arg_59_1.time_ < var_62_5 + var_62_6 then
				local var_62_7 = (arg_59_1.time_ - var_62_5) / var_62_6
				local var_62_8 = Vector3.New(0.7, -1.11, -5.9)

				var_62_4.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1038ui_story, var_62_8, var_62_7)

				local var_62_9 = manager.ui.mainCamera.transform.position - var_62_4.position

				var_62_4.forward = Vector3.New(var_62_9.x, var_62_9.y, var_62_9.z)

				local var_62_10 = var_62_4.localEulerAngles

				var_62_10.z = 0
				var_62_10.x = 0
				var_62_4.localEulerAngles = var_62_10
			end

			if arg_59_1.time_ >= var_62_5 + var_62_6 and arg_59_1.time_ < var_62_5 + var_62_6 + arg_62_0 then
				var_62_4.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_62_11 = manager.ui.mainCamera.transform.position - var_62_4.position

				var_62_4.forward = Vector3.New(var_62_11.x, var_62_11.y, var_62_11.z)

				local var_62_12 = var_62_4.localEulerAngles

				var_62_12.z = 0
				var_62_12.x = 0
				var_62_4.localEulerAngles = var_62_12
			end

			local var_62_13 = 0

			if var_62_13 < arg_59_1.time_ and arg_59_1.time_ <= var_62_13 + arg_62_0 then
				arg_59_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_62_15 = arg_59_1.actors_["1038ui_story"]
			local var_62_16 = 0

			if var_62_16 < arg_59_1.time_ and arg_59_1.time_ <= var_62_16 + arg_62_0 and arg_59_1.var_.characterEffect1038ui_story == nil then
				arg_59_1.var_.characterEffect1038ui_story = var_62_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_17 = 0.2

			if var_62_16 <= arg_59_1.time_ and arg_59_1.time_ < var_62_16 + var_62_17 then
				local var_62_18 = (arg_59_1.time_ - var_62_16) / var_62_17

				if arg_59_1.var_.characterEffect1038ui_story then
					arg_59_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_59_1.time_ >= var_62_16 + var_62_17 and arg_59_1.time_ < var_62_16 + var_62_17 + arg_62_0 and arg_59_1.var_.characterEffect1038ui_story then
				arg_59_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_62_19 = 0
			local var_62_20 = 0.25

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0
				arg_59_1.dialogCg_.alpha = 1

				arg_59_1.dialog_:SetActive(true)
				SetActive(arg_59_1.leftNameGo_, true)

				local var_62_21 = arg_59_1:FormatText(StoryNameCfg[94].name)

				arg_59_1.leftNameTxt_.text = var_62_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_59_1.leftNameTxt_.transform)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1.leftNameTxt_.text)
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_22 = arg_59_1:GetWordFromCfg(113191013)
				local var_62_23 = arg_59_1:FormatText(var_62_22.content)

				arg_59_1.text_.text = var_62_23

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_24 = 10
				local var_62_25 = utf8.len(var_62_23)
				local var_62_26 = var_62_24 <= 0 and var_62_20 or var_62_20 * (var_62_25 / var_62_24)

				if var_62_26 > 0 and var_62_20 < var_62_26 then
					arg_59_1.talkMaxDuration = var_62_26

					if var_62_26 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_26 + var_62_19
					end
				end

				arg_59_1.text_.text = var_62_23
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191013", "story_v_out_113191.awb") ~= 0 then
					local var_62_27 = manager.audio:GetVoiceLength("story_v_out_113191", "113191013", "story_v_out_113191.awb") / 1000

					if var_62_27 + var_62_19 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_27 + var_62_19
					end

					if var_62_22.prefab_name ~= "" and arg_59_1.actors_[var_62_22.prefab_name] ~= nil then
						local var_62_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_59_1.actors_[var_62_22.prefab_name].transform, "story_v_out_113191", "113191013", "story_v_out_113191.awb")

						arg_59_1:RecordAudio("113191013", var_62_28)
						arg_59_1:RecordAudio("113191013", var_62_28)
					else
						arg_59_1:AudioAction("play", "voice", "story_v_out_113191", "113191013", "story_v_out_113191.awb")
					end

					arg_59_1:RecordHistoryTalkVoice("story_v_out_113191", "113191013", "story_v_out_113191.awb")
				end

				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_29 = math.max(var_62_20, arg_59_1.talkMaxDuration)

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_29 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_19) / var_62_29

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_19 + var_62_29 and arg_59_1.time_ < var_62_19 + var_62_29 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play113191014 = function(arg_63_0, arg_63_1)
		arg_63_1.time_ = 0
		arg_63_1.frameCnt_ = 0
		arg_63_1.state_ = "playing"
		arg_63_1.curTalkId_ = 113191014
		arg_63_1.duration_ = 4.833

		local var_63_0 = {
			ja = 0.999999999999,
			ko = 1.6,
			zh = 4.833,
			en = 1.3
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
				arg_63_0:Play113191015(arg_63_1)
			end
		end

		function arg_63_1.onSingleLineUpdate_(arg_66_0)
			local var_66_0 = arg_63_1.actors_["1038ui_story"]
			local var_66_1 = 0

			if var_66_1 < arg_63_1.time_ and arg_63_1.time_ <= var_66_1 + arg_66_0 and arg_63_1.var_.characterEffect1038ui_story == nil then
				arg_63_1.var_.characterEffect1038ui_story = var_66_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_66_2 = 0.2

			if var_66_1 <= arg_63_1.time_ and arg_63_1.time_ < var_66_1 + var_66_2 then
				local var_66_3 = (arg_63_1.time_ - var_66_1) / var_66_2

				if arg_63_1.var_.characterEffect1038ui_story then
					local var_66_4 = Mathf.Lerp(0, 0.5, var_66_3)

					arg_63_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_63_1.var_.characterEffect1038ui_story.fillRatio = var_66_4
				end
			end

			if arg_63_1.time_ >= var_66_1 + var_66_2 and arg_63_1.time_ < var_66_1 + var_66_2 + arg_66_0 and arg_63_1.var_.characterEffect1038ui_story then
				local var_66_5 = 0.5

				arg_63_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_63_1.var_.characterEffect1038ui_story.fillRatio = var_66_5
			end

			local var_66_6 = 0
			local var_66_7 = 0.05

			if var_66_6 < arg_63_1.time_ and arg_63_1.time_ <= var_66_6 + arg_66_0 then
				arg_63_1.talkMaxDuration = 0
				arg_63_1.dialogCg_.alpha = 1

				arg_63_1.dialog_:SetActive(true)
				SetActive(arg_63_1.leftNameGo_, true)

				local var_66_8 = arg_63_1:FormatText(StoryNameCfg[208].name)

				arg_63_1.leftNameTxt_.text = var_66_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_63_1.leftNameTxt_.transform)

				arg_63_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_63_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_63_1:RecordName(arg_63_1.leftNameTxt_.text)
				SetActive(arg_63_1.iconTrs_.gameObject, true)
				arg_63_1.iconController_:SetSelectedState("hero")

				arg_63_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_63_1.callingController_:SetSelectedState("normal")

				local var_66_9 = arg_63_1:GetWordFromCfg(113191014)
				local var_66_10 = arg_63_1:FormatText(var_66_9.content)

				arg_63_1.text_.text = var_66_10

				LuaForUtil.ClearLinePrefixSymbol(arg_63_1.text_)

				local var_66_11 = 2
				local var_66_12 = utf8.len(var_66_10)
				local var_66_13 = var_66_11 <= 0 and var_66_7 or var_66_7 * (var_66_12 / var_66_11)

				if var_66_13 > 0 and var_66_7 < var_66_13 then
					arg_63_1.talkMaxDuration = var_66_13

					if var_66_13 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_13 + var_66_6
					end
				end

				arg_63_1.text_.text = var_66_10
				arg_63_1.typewritter.percent = 0

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191014", "story_v_out_113191.awb") ~= 0 then
					local var_66_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191014", "story_v_out_113191.awb") / 1000

					if var_66_14 + var_66_6 > arg_63_1.duration_ then
						arg_63_1.duration_ = var_66_14 + var_66_6
					end

					if var_66_9.prefab_name ~= "" and arg_63_1.actors_[var_66_9.prefab_name] ~= nil then
						local var_66_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_63_1.actors_[var_66_9.prefab_name].transform, "story_v_out_113191", "113191014", "story_v_out_113191.awb")

						arg_63_1:RecordAudio("113191014", var_66_15)
						arg_63_1:RecordAudio("113191014", var_66_15)
					else
						arg_63_1:AudioAction("play", "voice", "story_v_out_113191", "113191014", "story_v_out_113191.awb")
					end

					arg_63_1:RecordHistoryTalkVoice("story_v_out_113191", "113191014", "story_v_out_113191.awb")
				end

				arg_63_1:RecordContent(arg_63_1.text_.text)
			end

			local var_66_16 = math.max(var_66_7, arg_63_1.talkMaxDuration)

			if var_66_6 <= arg_63_1.time_ and arg_63_1.time_ < var_66_6 + var_66_16 then
				arg_63_1.typewritter.percent = (arg_63_1.time_ - var_66_6) / var_66_16

				arg_63_1.typewritter:SetDirty()
			end

			if arg_63_1.time_ >= var_66_6 + var_66_16 and arg_63_1.time_ < var_66_6 + var_66_16 + arg_66_0 then
				arg_63_1.typewritter.percent = 1

				arg_63_1.typewritter:SetDirty()
				arg_63_1:ShowNextGo(true)
			end
		end
	end,
	Play113191015 = function(arg_67_0, arg_67_1)
		arg_67_1.time_ = 0
		arg_67_1.frameCnt_ = 0
		arg_67_1.state_ = "playing"
		arg_67_1.curTalkId_ = 113191015
		arg_67_1.duration_ = 7.433

		local var_67_0 = {
			ja = 7.433,
			ko = 3.433,
			zh = 4.7,
			en = 5.733
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
				arg_67_0:Play113191016(arg_67_1)
			end
		end

		function arg_67_1.onSingleLineUpdate_(arg_70_0)
			local var_70_0 = 0
			local var_70_1 = 0.275

			if var_70_0 < arg_67_1.time_ and arg_67_1.time_ <= var_70_0 + arg_70_0 then
				arg_67_1.talkMaxDuration = 0
				arg_67_1.dialogCg_.alpha = 1

				arg_67_1.dialog_:SetActive(true)
				SetActive(arg_67_1.leftNameGo_, true)

				local var_70_2 = arg_67_1:FormatText(StoryNameCfg[208].name)

				arg_67_1.leftNameTxt_.text = var_70_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_67_1.leftNameTxt_.transform)

				arg_67_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_67_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_67_1:RecordName(arg_67_1.leftNameTxt_.text)
				SetActive(arg_67_1.iconTrs_.gameObject, true)
				arg_67_1.iconController_:SetSelectedState("hero")

				arg_67_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_67_1.callingController_:SetSelectedState("normal")

				local var_70_3 = arg_67_1:GetWordFromCfg(113191015)
				local var_70_4 = arg_67_1:FormatText(var_70_3.content)

				arg_67_1.text_.text = var_70_4

				LuaForUtil.ClearLinePrefixSymbol(arg_67_1.text_)

				local var_70_5 = 11
				local var_70_6 = utf8.len(var_70_4)
				local var_70_7 = var_70_5 <= 0 and var_70_1 or var_70_1 * (var_70_6 / var_70_5)

				if var_70_7 > 0 and var_70_1 < var_70_7 then
					arg_67_1.talkMaxDuration = var_70_7

					if var_70_7 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_7 + var_70_0
					end
				end

				arg_67_1.text_.text = var_70_4
				arg_67_1.typewritter.percent = 0

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191015", "story_v_out_113191.awb") ~= 0 then
					local var_70_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191015", "story_v_out_113191.awb") / 1000

					if var_70_8 + var_70_0 > arg_67_1.duration_ then
						arg_67_1.duration_ = var_70_8 + var_70_0
					end

					if var_70_3.prefab_name ~= "" and arg_67_1.actors_[var_70_3.prefab_name] ~= nil then
						local var_70_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_67_1.actors_[var_70_3.prefab_name].transform, "story_v_out_113191", "113191015", "story_v_out_113191.awb")

						arg_67_1:RecordAudio("113191015", var_70_9)
						arg_67_1:RecordAudio("113191015", var_70_9)
					else
						arg_67_1:AudioAction("play", "voice", "story_v_out_113191", "113191015", "story_v_out_113191.awb")
					end

					arg_67_1:RecordHistoryTalkVoice("story_v_out_113191", "113191015", "story_v_out_113191.awb")
				end

				arg_67_1:RecordContent(arg_67_1.text_.text)
			end

			local var_70_10 = math.max(var_70_1, arg_67_1.talkMaxDuration)

			if var_70_0 <= arg_67_1.time_ and arg_67_1.time_ < var_70_0 + var_70_10 then
				arg_67_1.typewritter.percent = (arg_67_1.time_ - var_70_0) / var_70_10

				arg_67_1.typewritter:SetDirty()
			end

			if arg_67_1.time_ >= var_70_0 + var_70_10 and arg_67_1.time_ < var_70_0 + var_70_10 + arg_70_0 then
				arg_67_1.typewritter.percent = 1

				arg_67_1.typewritter:SetDirty()
				arg_67_1:ShowNextGo(true)
			end
		end
	end,
	Play113191016 = function(arg_71_0, arg_71_1)
		arg_71_1.time_ = 0
		arg_71_1.frameCnt_ = 0
		arg_71_1.state_ = "playing"
		arg_71_1.curTalkId_ = 113191016
		arg_71_1.duration_ = 3.4

		local var_71_0 = {
			ja = 1.999999999999,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 3.4
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
				arg_71_0:Play113191017(arg_71_1)
			end
		end

		function arg_71_1.onSingleLineUpdate_(arg_74_0)
			local var_74_0 = 0

			if var_74_0 < arg_71_1.time_ and arg_71_1.time_ <= var_74_0 + arg_74_0 then
				arg_71_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_74_1 = arg_71_1.actors_["1038ui_story"]
			local var_74_2 = 0

			if var_74_2 < arg_71_1.time_ and arg_71_1.time_ <= var_74_2 + arg_74_0 and arg_71_1.var_.characterEffect1038ui_story == nil then
				arg_71_1.var_.characterEffect1038ui_story = var_74_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_74_3 = 0.2

			if var_74_2 <= arg_71_1.time_ and arg_71_1.time_ < var_74_2 + var_74_3 then
				local var_74_4 = (arg_71_1.time_ - var_74_2) / var_74_3

				if arg_71_1.var_.characterEffect1038ui_story then
					arg_71_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_71_1.time_ >= var_74_2 + var_74_3 and arg_71_1.time_ < var_74_2 + var_74_3 + arg_74_0 and arg_71_1.var_.characterEffect1038ui_story then
				arg_71_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_74_5 = 0
			local var_74_6 = 0.125

			if var_74_5 < arg_71_1.time_ and arg_71_1.time_ <= var_74_5 + arg_74_0 then
				arg_71_1.talkMaxDuration = 0
				arg_71_1.dialogCg_.alpha = 1

				arg_71_1.dialog_:SetActive(true)
				SetActive(arg_71_1.leftNameGo_, true)

				local var_74_7 = arg_71_1:FormatText(StoryNameCfg[94].name)

				arg_71_1.leftNameTxt_.text = var_74_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_71_1.leftNameTxt_.transform)

				arg_71_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_71_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_71_1:RecordName(arg_71_1.leftNameTxt_.text)
				SetActive(arg_71_1.iconTrs_.gameObject, false)
				arg_71_1.callingController_:SetSelectedState("normal")

				local var_74_8 = arg_71_1:GetWordFromCfg(113191016)
				local var_74_9 = arg_71_1:FormatText(var_74_8.content)

				arg_71_1.text_.text = var_74_9

				LuaForUtil.ClearLinePrefixSymbol(arg_71_1.text_)

				local var_74_10 = 5
				local var_74_11 = utf8.len(var_74_9)
				local var_74_12 = var_74_10 <= 0 and var_74_6 or var_74_6 * (var_74_11 / var_74_10)

				if var_74_12 > 0 and var_74_6 < var_74_12 then
					arg_71_1.talkMaxDuration = var_74_12

					if var_74_12 + var_74_5 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_12 + var_74_5
					end
				end

				arg_71_1.text_.text = var_74_9
				arg_71_1.typewritter.percent = 0

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191016", "story_v_out_113191.awb") ~= 0 then
					local var_74_13 = manager.audio:GetVoiceLength("story_v_out_113191", "113191016", "story_v_out_113191.awb") / 1000

					if var_74_13 + var_74_5 > arg_71_1.duration_ then
						arg_71_1.duration_ = var_74_13 + var_74_5
					end

					if var_74_8.prefab_name ~= "" and arg_71_1.actors_[var_74_8.prefab_name] ~= nil then
						local var_74_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_71_1.actors_[var_74_8.prefab_name].transform, "story_v_out_113191", "113191016", "story_v_out_113191.awb")

						arg_71_1:RecordAudio("113191016", var_74_14)
						arg_71_1:RecordAudio("113191016", var_74_14)
					else
						arg_71_1:AudioAction("play", "voice", "story_v_out_113191", "113191016", "story_v_out_113191.awb")
					end

					arg_71_1:RecordHistoryTalkVoice("story_v_out_113191", "113191016", "story_v_out_113191.awb")
				end

				arg_71_1:RecordContent(arg_71_1.text_.text)
			end

			local var_74_15 = math.max(var_74_6, arg_71_1.talkMaxDuration)

			if var_74_5 <= arg_71_1.time_ and arg_71_1.time_ < var_74_5 + var_74_15 then
				arg_71_1.typewritter.percent = (arg_71_1.time_ - var_74_5) / var_74_15

				arg_71_1.typewritter:SetDirty()
			end

			if arg_71_1.time_ >= var_74_5 + var_74_15 and arg_71_1.time_ < var_74_5 + var_74_15 + arg_74_0 then
				arg_71_1.typewritter.percent = 1

				arg_71_1.typewritter:SetDirty()
				arg_71_1:ShowNextGo(true)
			end
		end
	end,
	Play113191017 = function(arg_75_0, arg_75_1)
		arg_75_1.time_ = 0
		arg_75_1.frameCnt_ = 0
		arg_75_1.state_ = "playing"
		arg_75_1.curTalkId_ = 113191017
		arg_75_1.duration_ = 5

		SetActive(arg_75_1.tipsGo_, false)

		function arg_75_1.onSingleLineFinish_()
			arg_75_1.onSingleLineUpdate_ = nil
			arg_75_1.onSingleLineFinish_ = nil
			arg_75_1.state_ = "waiting"
		end

		function arg_75_1.playNext_(arg_77_0)
			if arg_77_0 == 1 then
				arg_75_0:Play113191018(arg_75_1)
			end
		end

		function arg_75_1.onSingleLineUpdate_(arg_78_0)
			local var_78_0 = arg_75_1.actors_["1084ui_story"].transform
			local var_78_1 = 0

			if var_78_1 < arg_75_1.time_ and arg_75_1.time_ <= var_78_1 + arg_78_0 then
				arg_75_1.var_.moveOldPos1084ui_story = var_78_0.localPosition
			end

			local var_78_2 = 0.001

			if var_78_1 <= arg_75_1.time_ and arg_75_1.time_ < var_78_1 + var_78_2 then
				local var_78_3 = (arg_75_1.time_ - var_78_1) / var_78_2
				local var_78_4 = Vector3.New(0, 100, 0)

				var_78_0.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1084ui_story, var_78_4, var_78_3)

				local var_78_5 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_5.x, var_78_5.y, var_78_5.z)

				local var_78_6 = var_78_0.localEulerAngles

				var_78_6.z = 0
				var_78_6.x = 0
				var_78_0.localEulerAngles = var_78_6
			end

			if arg_75_1.time_ >= var_78_1 + var_78_2 and arg_75_1.time_ < var_78_1 + var_78_2 + arg_78_0 then
				var_78_0.localPosition = Vector3.New(0, 100, 0)

				local var_78_7 = manager.ui.mainCamera.transform.position - var_78_0.position

				var_78_0.forward = Vector3.New(var_78_7.x, var_78_7.y, var_78_7.z)

				local var_78_8 = var_78_0.localEulerAngles

				var_78_8.z = 0
				var_78_8.x = 0
				var_78_0.localEulerAngles = var_78_8
			end

			local var_78_9 = arg_75_1.actors_["1038ui_story"].transform
			local var_78_10 = 0

			if var_78_10 < arg_75_1.time_ and arg_75_1.time_ <= var_78_10 + arg_78_0 then
				arg_75_1.var_.moveOldPos1038ui_story = var_78_9.localPosition
			end

			local var_78_11 = 0.001

			if var_78_10 <= arg_75_1.time_ and arg_75_1.time_ < var_78_10 + var_78_11 then
				local var_78_12 = (arg_75_1.time_ - var_78_10) / var_78_11
				local var_78_13 = Vector3.New(0, 100, 0)

				var_78_9.localPosition = Vector3.Lerp(arg_75_1.var_.moveOldPos1038ui_story, var_78_13, var_78_12)

				local var_78_14 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_14.x, var_78_14.y, var_78_14.z)

				local var_78_15 = var_78_9.localEulerAngles

				var_78_15.z = 0
				var_78_15.x = 0
				var_78_9.localEulerAngles = var_78_15
			end

			if arg_75_1.time_ >= var_78_10 + var_78_11 and arg_75_1.time_ < var_78_10 + var_78_11 + arg_78_0 then
				var_78_9.localPosition = Vector3.New(0, 100, 0)

				local var_78_16 = manager.ui.mainCamera.transform.position - var_78_9.position

				var_78_9.forward = Vector3.New(var_78_16.x, var_78_16.y, var_78_16.z)

				local var_78_17 = var_78_9.localEulerAngles

				var_78_17.z = 0
				var_78_17.x = 0
				var_78_9.localEulerAngles = var_78_17
			end

			local var_78_18 = 0
			local var_78_19 = 0.6

			if var_78_18 < arg_75_1.time_ and arg_75_1.time_ <= var_78_18 + arg_78_0 then
				arg_75_1.talkMaxDuration = 0
				arg_75_1.dialogCg_.alpha = 1

				arg_75_1.dialog_:SetActive(true)
				SetActive(arg_75_1.leftNameGo_, false)

				arg_75_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_75_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_75_1:RecordName(arg_75_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_75_1.iconTrs_.gameObject, false)
				arg_75_1.callingController_:SetSelectedState("normal")

				local var_78_20 = arg_75_1:GetWordFromCfg(113191017)
				local var_78_21 = arg_75_1:FormatText(var_78_20.content)

				arg_75_1.text_.text = var_78_21

				LuaForUtil.ClearLinePrefixSymbol(arg_75_1.text_)

				local var_78_22 = 24
				local var_78_23 = utf8.len(var_78_21)
				local var_78_24 = var_78_22 <= 0 and var_78_19 or var_78_19 * (var_78_23 / var_78_22)

				if var_78_24 > 0 and var_78_19 < var_78_24 then
					arg_75_1.talkMaxDuration = var_78_24

					if var_78_24 + var_78_18 > arg_75_1.duration_ then
						arg_75_1.duration_ = var_78_24 + var_78_18
					end
				end

				arg_75_1.text_.text = var_78_21
				arg_75_1.typewritter.percent = 0

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(false)
				arg_75_1:RecordContent(arg_75_1.text_.text)
			end

			local var_78_25 = math.max(var_78_19, arg_75_1.talkMaxDuration)

			if var_78_18 <= arg_75_1.time_ and arg_75_1.time_ < var_78_18 + var_78_25 then
				arg_75_1.typewritter.percent = (arg_75_1.time_ - var_78_18) / var_78_25

				arg_75_1.typewritter:SetDirty()
			end

			if arg_75_1.time_ >= var_78_18 + var_78_25 and arg_75_1.time_ < var_78_18 + var_78_25 + arg_78_0 then
				arg_75_1.typewritter.percent = 1

				arg_75_1.typewritter:SetDirty()
				arg_75_1:ShowNextGo(true)
			end
		end
	end,
	Play113191018 = function(arg_79_0, arg_79_1)
		arg_79_1.time_ = 0
		arg_79_1.frameCnt_ = 0
		arg_79_1.state_ = "playing"
		arg_79_1.curTalkId_ = 113191018
		arg_79_1.duration_ = 8.1

		local var_79_0 = {
			ja = 3.8,
			ko = 6.9,
			zh = 8.1,
			en = 5.1
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
				arg_79_0:Play113191019(arg_79_1)
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

			local var_82_9 = 0

			if var_82_9 < arg_79_1.time_ and arg_79_1.time_ <= var_82_9 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_82_10 = 0

			if var_82_10 < arg_79_1.time_ and arg_79_1.time_ <= var_82_10 + arg_82_0 then
				arg_79_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_82_11 = arg_79_1.actors_["1084ui_story"]
			local var_82_12 = 0

			if var_82_12 < arg_79_1.time_ and arg_79_1.time_ <= var_82_12 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story == nil then
				arg_79_1.var_.characterEffect1084ui_story = var_82_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_82_13 = 0.2

			if var_82_12 <= arg_79_1.time_ and arg_79_1.time_ < var_82_12 + var_82_13 then
				local var_82_14 = (arg_79_1.time_ - var_82_12) / var_82_13

				if arg_79_1.var_.characterEffect1084ui_story then
					arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_79_1.time_ >= var_82_12 + var_82_13 and arg_79_1.time_ < var_82_12 + var_82_13 + arg_82_0 and arg_79_1.var_.characterEffect1084ui_story then
				arg_79_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_82_15 = 0
			local var_82_16 = 0.675

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

				local var_82_18 = arg_79_1:GetWordFromCfg(113191018)
				local var_82_19 = arg_79_1:FormatText(var_82_18.content)

				arg_79_1.text_.text = var_82_19

				LuaForUtil.ClearLinePrefixSymbol(arg_79_1.text_)

				local var_82_20 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191018", "story_v_out_113191.awb") ~= 0 then
					local var_82_23 = manager.audio:GetVoiceLength("story_v_out_113191", "113191018", "story_v_out_113191.awb") / 1000

					if var_82_23 + var_82_15 > arg_79_1.duration_ then
						arg_79_1.duration_ = var_82_23 + var_82_15
					end

					if var_82_18.prefab_name ~= "" and arg_79_1.actors_[var_82_18.prefab_name] ~= nil then
						local var_82_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_79_1.actors_[var_82_18.prefab_name].transform, "story_v_out_113191", "113191018", "story_v_out_113191.awb")

						arg_79_1:RecordAudio("113191018", var_82_24)
						arg_79_1:RecordAudio("113191018", var_82_24)
					else
						arg_79_1:AudioAction("play", "voice", "story_v_out_113191", "113191018", "story_v_out_113191.awb")
					end

					arg_79_1:RecordHistoryTalkVoice("story_v_out_113191", "113191018", "story_v_out_113191.awb")
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
	Play113191019 = function(arg_83_0, arg_83_1)
		arg_83_1.time_ = 0
		arg_83_1.frameCnt_ = 0
		arg_83_1.state_ = "playing"
		arg_83_1.curTalkId_ = 113191019
		arg_83_1.duration_ = 10.733

		local var_83_0 = {
			ja = 8.233,
			ko = 6.1,
			zh = 7.533,
			en = 10.733
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
				arg_83_0:Play113191020(arg_83_1)
			end
		end

		function arg_83_1.onSingleLineUpdate_(arg_86_0)
			local var_86_0 = arg_83_1.actors_["1084ui_story"]
			local var_86_1 = 0

			if var_86_1 < arg_83_1.time_ and arg_83_1.time_ <= var_86_1 + arg_86_0 and arg_83_1.var_.characterEffect1084ui_story == nil then
				arg_83_1.var_.characterEffect1084ui_story = var_86_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_86_2 = 0.2

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

			local var_86_6 = arg_83_1.actors_["1084ui_story"].transform
			local var_86_7 = 0

			if var_86_7 < arg_83_1.time_ and arg_83_1.time_ <= var_86_7 + arg_86_0 then
				arg_83_1.var_.moveOldPos1084ui_story = var_86_6.localPosition
			end

			local var_86_8 = 0.001

			if var_86_7 <= arg_83_1.time_ and arg_83_1.time_ < var_86_7 + var_86_8 then
				local var_86_9 = (arg_83_1.time_ - var_86_7) / var_86_8
				local var_86_10 = Vector3.New(0, 100, 0)

				var_86_6.localPosition = Vector3.Lerp(arg_83_1.var_.moveOldPos1084ui_story, var_86_10, var_86_9)

				local var_86_11 = manager.ui.mainCamera.transform.position - var_86_6.position

				var_86_6.forward = Vector3.New(var_86_11.x, var_86_11.y, var_86_11.z)

				local var_86_12 = var_86_6.localEulerAngles

				var_86_12.z = 0
				var_86_12.x = 0
				var_86_6.localEulerAngles = var_86_12
			end

			if arg_83_1.time_ >= var_86_7 + var_86_8 and arg_83_1.time_ < var_86_7 + var_86_8 + arg_86_0 then
				var_86_6.localPosition = Vector3.New(0, 100, 0)

				local var_86_13 = manager.ui.mainCamera.transform.position - var_86_6.position

				var_86_6.forward = Vector3.New(var_86_13.x, var_86_13.y, var_86_13.z)

				local var_86_14 = var_86_6.localEulerAngles

				var_86_14.z = 0
				var_86_14.x = 0
				var_86_6.localEulerAngles = var_86_14
			end

			local var_86_15 = 0
			local var_86_16 = 0.8

			if var_86_15 < arg_83_1.time_ and arg_83_1.time_ <= var_86_15 + arg_86_0 then
				arg_83_1.talkMaxDuration = 0
				arg_83_1.dialogCg_.alpha = 1

				arg_83_1.dialog_:SetActive(true)
				SetActive(arg_83_1.leftNameGo_, true)

				local var_86_17 = arg_83_1:FormatText(StoryNameCfg[10].name)

				arg_83_1.leftNameTxt_.text = var_86_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_83_1.leftNameTxt_.transform)

				arg_83_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_83_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_83_1:RecordName(arg_83_1.leftNameTxt_.text)
				SetActive(arg_83_1.iconTrs_.gameObject, true)
				arg_83_1.iconController_:SetSelectedState("hero")

				arg_83_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_83_1.callingController_:SetSelectedState("normal")

				local var_86_18 = arg_83_1:GetWordFromCfg(113191019)
				local var_86_19 = arg_83_1:FormatText(var_86_18.content)

				arg_83_1.text_.text = var_86_19

				LuaForUtil.ClearLinePrefixSymbol(arg_83_1.text_)

				local var_86_20 = 32
				local var_86_21 = utf8.len(var_86_19)
				local var_86_22 = var_86_20 <= 0 and var_86_16 or var_86_16 * (var_86_21 / var_86_20)

				if var_86_22 > 0 and var_86_16 < var_86_22 then
					arg_83_1.talkMaxDuration = var_86_22

					if var_86_22 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_22 + var_86_15
					end
				end

				arg_83_1.text_.text = var_86_19
				arg_83_1.typewritter.percent = 0

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191019", "story_v_out_113191.awb") ~= 0 then
					local var_86_23 = manager.audio:GetVoiceLength("story_v_out_113191", "113191019", "story_v_out_113191.awb") / 1000

					if var_86_23 + var_86_15 > arg_83_1.duration_ then
						arg_83_1.duration_ = var_86_23 + var_86_15
					end

					if var_86_18.prefab_name ~= "" and arg_83_1.actors_[var_86_18.prefab_name] ~= nil then
						local var_86_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_83_1.actors_[var_86_18.prefab_name].transform, "story_v_out_113191", "113191019", "story_v_out_113191.awb")

						arg_83_1:RecordAudio("113191019", var_86_24)
						arg_83_1:RecordAudio("113191019", var_86_24)
					else
						arg_83_1:AudioAction("play", "voice", "story_v_out_113191", "113191019", "story_v_out_113191.awb")
					end

					arg_83_1:RecordHistoryTalkVoice("story_v_out_113191", "113191019", "story_v_out_113191.awb")
				end

				arg_83_1:RecordContent(arg_83_1.text_.text)
			end

			local var_86_25 = math.max(var_86_16, arg_83_1.talkMaxDuration)

			if var_86_15 <= arg_83_1.time_ and arg_83_1.time_ < var_86_15 + var_86_25 then
				arg_83_1.typewritter.percent = (arg_83_1.time_ - var_86_15) / var_86_25

				arg_83_1.typewritter:SetDirty()
			end

			if arg_83_1.time_ >= var_86_15 + var_86_25 and arg_83_1.time_ < var_86_15 + var_86_25 + arg_86_0 then
				arg_83_1.typewritter.percent = 1

				arg_83_1.typewritter:SetDirty()
				arg_83_1:ShowNextGo(true)
			end
		end
	end,
	Play113191020 = function(arg_87_0, arg_87_1)
		arg_87_1.time_ = 0
		arg_87_1.frameCnt_ = 0
		arg_87_1.state_ = "playing"
		arg_87_1.curTalkId_ = 113191020
		arg_87_1.duration_ = 0.016666666666

		SetActive(arg_87_1.tipsGo_, false)

		function arg_87_1.onSingleLineFinish_()
			arg_87_1.onSingleLineUpdate_ = nil
			arg_87_1.onSingleLineFinish_ = nil
			arg_87_1.state_ = "waiting"

			SetActive(arg_87_1.choicesGo_, true)

			for iter_88_0, iter_88_1 in ipairs(arg_87_1.choices_) do
				local var_88_0 = iter_88_0 <= 1

				SetActive(iter_88_1.go, var_88_0)
			end

			arg_87_1.choices_[1].txt.text = arg_87_1:FormatText(StoryChoiceCfg[201].name)
		end

		function arg_87_1.playNext_(arg_89_0)
			if arg_89_0 == 1 then
				arg_87_0:Play113191021(arg_87_1)
			end
		end

		function arg_87_1.onSingleLineUpdate_(arg_90_0)
			return
		end
	end,
	Play113191021 = function(arg_91_0, arg_91_1)
		arg_91_1.time_ = 0
		arg_91_1.frameCnt_ = 0
		arg_91_1.state_ = "playing"
		arg_91_1.curTalkId_ = 113191021
		arg_91_1.duration_ = 12.466

		local var_91_0 = {
			ja = 10.566,
			ko = 8.633,
			zh = 7.8,
			en = 12.466
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
				arg_91_0:Play113191022(arg_91_1)
			end
		end

		function arg_91_1.onSingleLineUpdate_(arg_94_0)
			local var_94_0 = 0
			local var_94_1 = 1

			if var_94_0 < arg_91_1.time_ and arg_91_1.time_ <= var_94_0 + arg_94_0 then
				arg_91_1.talkMaxDuration = 0
				arg_91_1.dialogCg_.alpha = 1

				arg_91_1.dialog_:SetActive(true)
				SetActive(arg_91_1.leftNameGo_, true)

				local var_94_2 = arg_91_1:FormatText(StoryNameCfg[10].name)

				arg_91_1.leftNameTxt_.text = var_94_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_91_1.leftNameTxt_.transform)

				arg_91_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_91_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_91_1:RecordName(arg_91_1.leftNameTxt_.text)
				SetActive(arg_91_1.iconTrs_.gameObject, true)
				arg_91_1.iconController_:SetSelectedState("hero")

				arg_91_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_91_1.callingController_:SetSelectedState("normal")

				local var_94_3 = arg_91_1:GetWordFromCfg(113191021)
				local var_94_4 = arg_91_1:FormatText(var_94_3.content)

				arg_91_1.text_.text = var_94_4

				LuaForUtil.ClearLinePrefixSymbol(arg_91_1.text_)

				local var_94_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191021", "story_v_out_113191.awb") ~= 0 then
					local var_94_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191021", "story_v_out_113191.awb") / 1000

					if var_94_8 + var_94_0 > arg_91_1.duration_ then
						arg_91_1.duration_ = var_94_8 + var_94_0
					end

					if var_94_3.prefab_name ~= "" and arg_91_1.actors_[var_94_3.prefab_name] ~= nil then
						local var_94_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_91_1.actors_[var_94_3.prefab_name].transform, "story_v_out_113191", "113191021", "story_v_out_113191.awb")

						arg_91_1:RecordAudio("113191021", var_94_9)
						arg_91_1:RecordAudio("113191021", var_94_9)
					else
						arg_91_1:AudioAction("play", "voice", "story_v_out_113191", "113191021", "story_v_out_113191.awb")
					end

					arg_91_1:RecordHistoryTalkVoice("story_v_out_113191", "113191021", "story_v_out_113191.awb")
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
	Play113191022 = function(arg_95_0, arg_95_1)
		arg_95_1.time_ = 0
		arg_95_1.frameCnt_ = 0
		arg_95_1.state_ = "playing"
		arg_95_1.curTalkId_ = 113191022
		arg_95_1.duration_ = 12.033

		local var_95_0 = {
			ja = 12.033,
			ko = 9,
			zh = 9.666,
			en = 9.333
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
				arg_95_0:Play113191023(arg_95_1)
			end
		end

		function arg_95_1.onSingleLineUpdate_(arg_98_0)
			local var_98_0 = "1041ui_story"

			if arg_95_1.actors_[var_98_0] == nil then
				local var_98_1 = Object.Instantiate(Asset.Load("Char/" .. var_98_0), arg_95_1.stage_.transform)

				var_98_1.name = var_98_0
				var_98_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_95_1.actors_[var_98_0] = var_98_1

				local var_98_2 = var_98_1:GetComponentInChildren(typeof(CharacterEffect))

				var_98_2.enabled = true

				local var_98_3 = GameObjectTools.GetOrAddComponent(var_98_1, typeof(DynamicBoneHelper))

				if var_98_3 then
					var_98_3:EnableDynamicBone(false)
				end

				arg_95_1:ShowWeapon(var_98_2.transform, false)

				arg_95_1.var_[var_98_0 .. "Animator"] = var_98_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_95_1.var_[var_98_0 .. "Animator"].applyRootMotion = true
				arg_95_1.var_[var_98_0 .. "LipSync"] = var_98_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_98_4 = arg_95_1.actors_["1041ui_story"].transform
			local var_98_5 = 0

			if var_98_5 < arg_95_1.time_ and arg_95_1.time_ <= var_98_5 + arg_98_0 then
				arg_95_1.var_.moveOldPos1041ui_story = var_98_4.localPosition
			end

			local var_98_6 = 0.001

			if var_98_5 <= arg_95_1.time_ and arg_95_1.time_ < var_98_5 + var_98_6 then
				local var_98_7 = (arg_95_1.time_ - var_98_5) / var_98_6
				local var_98_8 = Vector3.New(-0.7, -1.11, -5.9)

				var_98_4.localPosition = Vector3.Lerp(arg_95_1.var_.moveOldPos1041ui_story, var_98_8, var_98_7)

				local var_98_9 = manager.ui.mainCamera.transform.position - var_98_4.position

				var_98_4.forward = Vector3.New(var_98_9.x, var_98_9.y, var_98_9.z)

				local var_98_10 = var_98_4.localEulerAngles

				var_98_10.z = 0
				var_98_10.x = 0
				var_98_4.localEulerAngles = var_98_10
			end

			if arg_95_1.time_ >= var_98_5 + var_98_6 and arg_95_1.time_ < var_98_5 + var_98_6 + arg_98_0 then
				var_98_4.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_98_11 = manager.ui.mainCamera.transform.position - var_98_4.position

				var_98_4.forward = Vector3.New(var_98_11.x, var_98_11.y, var_98_11.z)

				local var_98_12 = var_98_4.localEulerAngles

				var_98_12.z = 0
				var_98_12.x = 0
				var_98_4.localEulerAngles = var_98_12
			end

			local var_98_13 = 0

			if var_98_13 < arg_95_1.time_ and arg_95_1.time_ <= var_98_13 + arg_98_0 then
				arg_95_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action9_2")
			end

			local var_98_14 = 0

			if var_98_14 < arg_95_1.time_ and arg_95_1.time_ <= var_98_14 + arg_98_0 then
				arg_95_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_98_15 = arg_95_1.actors_["1041ui_story"]
			local var_98_16 = 0

			if var_98_16 < arg_95_1.time_ and arg_95_1.time_ <= var_98_16 + arg_98_0 and arg_95_1.var_.characterEffect1041ui_story == nil then
				arg_95_1.var_.characterEffect1041ui_story = var_98_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_98_17 = 0.2

			if var_98_16 <= arg_95_1.time_ and arg_95_1.time_ < var_98_16 + var_98_17 then
				local var_98_18 = (arg_95_1.time_ - var_98_16) / var_98_17

				if arg_95_1.var_.characterEffect1041ui_story then
					arg_95_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_95_1.time_ >= var_98_16 + var_98_17 and arg_95_1.time_ < var_98_16 + var_98_17 + arg_98_0 and arg_95_1.var_.characterEffect1041ui_story then
				arg_95_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_98_19 = 0
			local var_98_20 = 0.9

			if var_98_19 < arg_95_1.time_ and arg_95_1.time_ <= var_98_19 + arg_98_0 then
				arg_95_1.talkMaxDuration = 0
				arg_95_1.dialogCg_.alpha = 1

				arg_95_1.dialog_:SetActive(true)
				SetActive(arg_95_1.leftNameGo_, true)

				local var_98_21 = arg_95_1:FormatText(StoryNameCfg[208].name)

				arg_95_1.leftNameTxt_.text = var_98_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_95_1.leftNameTxt_.transform)

				arg_95_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_95_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_95_1:RecordName(arg_95_1.leftNameTxt_.text)
				SetActive(arg_95_1.iconTrs_.gameObject, false)
				arg_95_1.callingController_:SetSelectedState("normal")

				local var_98_22 = arg_95_1:GetWordFromCfg(113191022)
				local var_98_23 = arg_95_1:FormatText(var_98_22.content)

				arg_95_1.text_.text = var_98_23

				LuaForUtil.ClearLinePrefixSymbol(arg_95_1.text_)

				local var_98_24 = 36
				local var_98_25 = utf8.len(var_98_23)
				local var_98_26 = var_98_24 <= 0 and var_98_20 or var_98_20 * (var_98_25 / var_98_24)

				if var_98_26 > 0 and var_98_20 < var_98_26 then
					arg_95_1.talkMaxDuration = var_98_26

					if var_98_26 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_26 + var_98_19
					end
				end

				arg_95_1.text_.text = var_98_23
				arg_95_1.typewritter.percent = 0

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191022", "story_v_out_113191.awb") ~= 0 then
					local var_98_27 = manager.audio:GetVoiceLength("story_v_out_113191", "113191022", "story_v_out_113191.awb") / 1000

					if var_98_27 + var_98_19 > arg_95_1.duration_ then
						arg_95_1.duration_ = var_98_27 + var_98_19
					end

					if var_98_22.prefab_name ~= "" and arg_95_1.actors_[var_98_22.prefab_name] ~= nil then
						local var_98_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_95_1.actors_[var_98_22.prefab_name].transform, "story_v_out_113191", "113191022", "story_v_out_113191.awb")

						arg_95_1:RecordAudio("113191022", var_98_28)
						arg_95_1:RecordAudio("113191022", var_98_28)
					else
						arg_95_1:AudioAction("play", "voice", "story_v_out_113191", "113191022", "story_v_out_113191.awb")
					end

					arg_95_1:RecordHistoryTalkVoice("story_v_out_113191", "113191022", "story_v_out_113191.awb")
				end

				arg_95_1:RecordContent(arg_95_1.text_.text)
			end

			local var_98_29 = math.max(var_98_20, arg_95_1.talkMaxDuration)

			if var_98_19 <= arg_95_1.time_ and arg_95_1.time_ < var_98_19 + var_98_29 then
				arg_95_1.typewritter.percent = (arg_95_1.time_ - var_98_19) / var_98_29

				arg_95_1.typewritter:SetDirty()
			end

			if arg_95_1.time_ >= var_98_19 + var_98_29 and arg_95_1.time_ < var_98_19 + var_98_29 + arg_98_0 then
				arg_95_1.typewritter.percent = 1

				arg_95_1.typewritter:SetDirty()
				arg_95_1:ShowNextGo(true)
			end
		end
	end,
	Play113191023 = function(arg_99_0, arg_99_1)
		arg_99_1.time_ = 0
		arg_99_1.frameCnt_ = 0
		arg_99_1.state_ = "playing"
		arg_99_1.curTalkId_ = 113191023
		arg_99_1.duration_ = 5.933

		local var_99_0 = {
			ja = 5.933,
			ko = 3.133,
			zh = 4,
			en = 3.3
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
				arg_99_0:Play113191024(arg_99_1)
			end
		end

		function arg_99_1.onSingleLineUpdate_(arg_102_0)
			local var_102_0 = arg_99_1.actors_["1041ui_story"]
			local var_102_1 = 0

			if var_102_1 < arg_99_1.time_ and arg_99_1.time_ <= var_102_1 + arg_102_0 and arg_99_1.var_.characterEffect1041ui_story == nil then
				arg_99_1.var_.characterEffect1041ui_story = var_102_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_2 = 0.2

			if var_102_1 <= arg_99_1.time_ and arg_99_1.time_ < var_102_1 + var_102_2 then
				local var_102_3 = (arg_99_1.time_ - var_102_1) / var_102_2

				if arg_99_1.var_.characterEffect1041ui_story then
					local var_102_4 = Mathf.Lerp(0, 0.5, var_102_3)

					arg_99_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_99_1.var_.characterEffect1041ui_story.fillRatio = var_102_4
				end
			end

			if arg_99_1.time_ >= var_102_1 + var_102_2 and arg_99_1.time_ < var_102_1 + var_102_2 + arg_102_0 and arg_99_1.var_.characterEffect1041ui_story then
				local var_102_5 = 0.5

				arg_99_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_99_1.var_.characterEffect1041ui_story.fillRatio = var_102_5
			end

			local var_102_6 = arg_99_1.actors_["1038ui_story"].transform
			local var_102_7 = 0

			if var_102_7 < arg_99_1.time_ and arg_99_1.time_ <= var_102_7 + arg_102_0 then
				arg_99_1.var_.moveOldPos1038ui_story = var_102_6.localPosition
			end

			local var_102_8 = 0.001

			if var_102_7 <= arg_99_1.time_ and arg_99_1.time_ < var_102_7 + var_102_8 then
				local var_102_9 = (arg_99_1.time_ - var_102_7) / var_102_8
				local var_102_10 = Vector3.New(0.7, -1.11, -5.9)

				var_102_6.localPosition = Vector3.Lerp(arg_99_1.var_.moveOldPos1038ui_story, var_102_10, var_102_9)

				local var_102_11 = manager.ui.mainCamera.transform.position - var_102_6.position

				var_102_6.forward = Vector3.New(var_102_11.x, var_102_11.y, var_102_11.z)

				local var_102_12 = var_102_6.localEulerAngles

				var_102_12.z = 0
				var_102_12.x = 0
				var_102_6.localEulerAngles = var_102_12
			end

			if arg_99_1.time_ >= var_102_7 + var_102_8 and arg_99_1.time_ < var_102_7 + var_102_8 + arg_102_0 then
				var_102_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_102_13 = manager.ui.mainCamera.transform.position - var_102_6.position

				var_102_6.forward = Vector3.New(var_102_13.x, var_102_13.y, var_102_13.z)

				local var_102_14 = var_102_6.localEulerAngles

				var_102_14.z = 0
				var_102_14.x = 0
				var_102_6.localEulerAngles = var_102_14
			end

			local var_102_15 = 0

			if var_102_15 < arg_99_1.time_ and arg_99_1.time_ <= var_102_15 + arg_102_0 then
				arg_99_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_102_16 = 0

			if var_102_16 < arg_99_1.time_ and arg_99_1.time_ <= var_102_16 + arg_102_0 then
				arg_99_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_102_17 = arg_99_1.actors_["1038ui_story"]
			local var_102_18 = 0

			if var_102_18 < arg_99_1.time_ and arg_99_1.time_ <= var_102_18 + arg_102_0 and arg_99_1.var_.characterEffect1038ui_story == nil then
				arg_99_1.var_.characterEffect1038ui_story = var_102_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_102_19 = 0.2

			if var_102_18 <= arg_99_1.time_ and arg_99_1.time_ < var_102_18 + var_102_19 then
				local var_102_20 = (arg_99_1.time_ - var_102_18) / var_102_19

				if arg_99_1.var_.characterEffect1038ui_story then
					arg_99_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_99_1.time_ >= var_102_18 + var_102_19 and arg_99_1.time_ < var_102_18 + var_102_19 + arg_102_0 and arg_99_1.var_.characterEffect1038ui_story then
				arg_99_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_102_21 = 0
			local var_102_22 = 0.4

			if var_102_21 < arg_99_1.time_ and arg_99_1.time_ <= var_102_21 + arg_102_0 then
				arg_99_1.talkMaxDuration = 0
				arg_99_1.dialogCg_.alpha = 1

				arg_99_1.dialog_:SetActive(true)
				SetActive(arg_99_1.leftNameGo_, true)

				local var_102_23 = arg_99_1:FormatText(StoryNameCfg[94].name)

				arg_99_1.leftNameTxt_.text = var_102_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_99_1.leftNameTxt_.transform)

				arg_99_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_99_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_99_1:RecordName(arg_99_1.leftNameTxt_.text)
				SetActive(arg_99_1.iconTrs_.gameObject, false)
				arg_99_1.callingController_:SetSelectedState("normal")

				local var_102_24 = arg_99_1:GetWordFromCfg(113191023)
				local var_102_25 = arg_99_1:FormatText(var_102_24.content)

				arg_99_1.text_.text = var_102_25

				LuaForUtil.ClearLinePrefixSymbol(arg_99_1.text_)

				local var_102_26 = 16
				local var_102_27 = utf8.len(var_102_25)
				local var_102_28 = var_102_26 <= 0 and var_102_22 or var_102_22 * (var_102_27 / var_102_26)

				if var_102_28 > 0 and var_102_22 < var_102_28 then
					arg_99_1.talkMaxDuration = var_102_28

					if var_102_28 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_28 + var_102_21
					end
				end

				arg_99_1.text_.text = var_102_25
				arg_99_1.typewritter.percent = 0

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191023", "story_v_out_113191.awb") ~= 0 then
					local var_102_29 = manager.audio:GetVoiceLength("story_v_out_113191", "113191023", "story_v_out_113191.awb") / 1000

					if var_102_29 + var_102_21 > arg_99_1.duration_ then
						arg_99_1.duration_ = var_102_29 + var_102_21
					end

					if var_102_24.prefab_name ~= "" and arg_99_1.actors_[var_102_24.prefab_name] ~= nil then
						local var_102_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_99_1.actors_[var_102_24.prefab_name].transform, "story_v_out_113191", "113191023", "story_v_out_113191.awb")

						arg_99_1:RecordAudio("113191023", var_102_30)
						arg_99_1:RecordAudio("113191023", var_102_30)
					else
						arg_99_1:AudioAction("play", "voice", "story_v_out_113191", "113191023", "story_v_out_113191.awb")
					end

					arg_99_1:RecordHistoryTalkVoice("story_v_out_113191", "113191023", "story_v_out_113191.awb")
				end

				arg_99_1:RecordContent(arg_99_1.text_.text)
			end

			local var_102_31 = math.max(var_102_22, arg_99_1.talkMaxDuration)

			if var_102_21 <= arg_99_1.time_ and arg_99_1.time_ < var_102_21 + var_102_31 then
				arg_99_1.typewritter.percent = (arg_99_1.time_ - var_102_21) / var_102_31

				arg_99_1.typewritter:SetDirty()
			end

			if arg_99_1.time_ >= var_102_21 + var_102_31 and arg_99_1.time_ < var_102_21 + var_102_31 + arg_102_0 then
				arg_99_1.typewritter.percent = 1

				arg_99_1.typewritter:SetDirty()
				arg_99_1:ShowNextGo(true)
			end
		end
	end,
	Play113191024 = function(arg_103_0, arg_103_1)
		arg_103_1.time_ = 0
		arg_103_1.frameCnt_ = 0
		arg_103_1.state_ = "playing"
		arg_103_1.curTalkId_ = 113191024
		arg_103_1.duration_ = 7.466

		local var_103_0 = {
			ja = 6.233,
			ko = 4.7,
			zh = 7.466,
			en = 3.7
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
				arg_103_0:Play113191025(arg_103_1)
			end
		end

		function arg_103_1.onSingleLineUpdate_(arg_106_0)
			local var_106_0 = arg_103_1.actors_["1038ui_story"]
			local var_106_1 = 0

			if var_106_1 < arg_103_1.time_ and arg_103_1.time_ <= var_106_1 + arg_106_0 and arg_103_1.var_.characterEffect1038ui_story == nil then
				arg_103_1.var_.characterEffect1038ui_story = var_106_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_2 = 0.2

			if var_106_1 <= arg_103_1.time_ and arg_103_1.time_ < var_106_1 + var_106_2 then
				local var_106_3 = (arg_103_1.time_ - var_106_1) / var_106_2

				if arg_103_1.var_.characterEffect1038ui_story then
					local var_106_4 = Mathf.Lerp(0, 0.5, var_106_3)

					arg_103_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_103_1.var_.characterEffect1038ui_story.fillRatio = var_106_4
				end
			end

			if arg_103_1.time_ >= var_106_1 + var_106_2 and arg_103_1.time_ < var_106_1 + var_106_2 + arg_106_0 and arg_103_1.var_.characterEffect1038ui_story then
				local var_106_5 = 0.5

				arg_103_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_103_1.var_.characterEffect1038ui_story.fillRatio = var_106_5
			end

			local var_106_6 = 0

			if var_106_6 < arg_103_1.time_ and arg_103_1.time_ <= var_106_6 + arg_106_0 then
				arg_103_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_106_7 = arg_103_1.actors_["1041ui_story"]
			local var_106_8 = 0

			if var_106_8 < arg_103_1.time_ and arg_103_1.time_ <= var_106_8 + arg_106_0 and arg_103_1.var_.characterEffect1041ui_story == nil then
				arg_103_1.var_.characterEffect1041ui_story = var_106_7:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_106_9 = 0.2

			if var_106_8 <= arg_103_1.time_ and arg_103_1.time_ < var_106_8 + var_106_9 then
				local var_106_10 = (arg_103_1.time_ - var_106_8) / var_106_9

				if arg_103_1.var_.characterEffect1041ui_story then
					arg_103_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_103_1.time_ >= var_106_8 + var_106_9 and arg_103_1.time_ < var_106_8 + var_106_9 + arg_106_0 and arg_103_1.var_.characterEffect1041ui_story then
				arg_103_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_106_11 = 0
			local var_106_12 = 0.525

			if var_106_11 < arg_103_1.time_ and arg_103_1.time_ <= var_106_11 + arg_106_0 then
				arg_103_1.talkMaxDuration = 0
				arg_103_1.dialogCg_.alpha = 1

				arg_103_1.dialog_:SetActive(true)
				SetActive(arg_103_1.leftNameGo_, true)

				local var_106_13 = arg_103_1:FormatText(StoryNameCfg[208].name)

				arg_103_1.leftNameTxt_.text = var_106_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_103_1.leftNameTxt_.transform)

				arg_103_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_103_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_103_1:RecordName(arg_103_1.leftNameTxt_.text)
				SetActive(arg_103_1.iconTrs_.gameObject, false)
				arg_103_1.callingController_:SetSelectedState("normal")

				local var_106_14 = arg_103_1:GetWordFromCfg(113191024)
				local var_106_15 = arg_103_1:FormatText(var_106_14.content)

				arg_103_1.text_.text = var_106_15

				LuaForUtil.ClearLinePrefixSymbol(arg_103_1.text_)

				local var_106_16 = 21
				local var_106_17 = utf8.len(var_106_15)
				local var_106_18 = var_106_16 <= 0 and var_106_12 or var_106_12 * (var_106_17 / var_106_16)

				if var_106_18 > 0 and var_106_12 < var_106_18 then
					arg_103_1.talkMaxDuration = var_106_18

					if var_106_18 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_18 + var_106_11
					end
				end

				arg_103_1.text_.text = var_106_15
				arg_103_1.typewritter.percent = 0

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191024", "story_v_out_113191.awb") ~= 0 then
					local var_106_19 = manager.audio:GetVoiceLength("story_v_out_113191", "113191024", "story_v_out_113191.awb") / 1000

					if var_106_19 + var_106_11 > arg_103_1.duration_ then
						arg_103_1.duration_ = var_106_19 + var_106_11
					end

					if var_106_14.prefab_name ~= "" and arg_103_1.actors_[var_106_14.prefab_name] ~= nil then
						local var_106_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_103_1.actors_[var_106_14.prefab_name].transform, "story_v_out_113191", "113191024", "story_v_out_113191.awb")

						arg_103_1:RecordAudio("113191024", var_106_20)
						arg_103_1:RecordAudio("113191024", var_106_20)
					else
						arg_103_1:AudioAction("play", "voice", "story_v_out_113191", "113191024", "story_v_out_113191.awb")
					end

					arg_103_1:RecordHistoryTalkVoice("story_v_out_113191", "113191024", "story_v_out_113191.awb")
				end

				arg_103_1:RecordContent(arg_103_1.text_.text)
			end

			local var_106_21 = math.max(var_106_12, arg_103_1.talkMaxDuration)

			if var_106_11 <= arg_103_1.time_ and arg_103_1.time_ < var_106_11 + var_106_21 then
				arg_103_1.typewritter.percent = (arg_103_1.time_ - var_106_11) / var_106_21

				arg_103_1.typewritter:SetDirty()
			end

			if arg_103_1.time_ >= var_106_11 + var_106_21 and arg_103_1.time_ < var_106_11 + var_106_21 + arg_106_0 then
				arg_103_1.typewritter.percent = 1

				arg_103_1.typewritter:SetDirty()
				arg_103_1:ShowNextGo(true)
			end
		end
	end,
	Play113191025 = function(arg_107_0, arg_107_1)
		arg_107_1.time_ = 0
		arg_107_1.frameCnt_ = 0
		arg_107_1.state_ = "playing"
		arg_107_1.curTalkId_ = 113191025
		arg_107_1.duration_ = 12.466

		local var_107_0 = {
			ja = 10.966,
			ko = 7.966,
			zh = 7.333,
			en = 12.466
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
				arg_107_0:Play113191026(arg_107_1)
			end
		end

		function arg_107_1.onSingleLineUpdate_(arg_110_0)
			local var_110_0 = arg_107_1.actors_["1041ui_story"].transform
			local var_110_1 = 0

			if var_110_1 < arg_107_1.time_ and arg_107_1.time_ <= var_110_1 + arg_110_0 then
				arg_107_1.var_.moveOldPos1041ui_story = var_110_0.localPosition
			end

			local var_110_2 = 0.001

			if var_110_1 <= arg_107_1.time_ and arg_107_1.time_ < var_110_1 + var_110_2 then
				local var_110_3 = (arg_107_1.time_ - var_110_1) / var_110_2
				local var_110_4 = Vector3.New(0, 100, 0)

				var_110_0.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1041ui_story, var_110_4, var_110_3)

				local var_110_5 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_5.x, var_110_5.y, var_110_5.z)

				local var_110_6 = var_110_0.localEulerAngles

				var_110_6.z = 0
				var_110_6.x = 0
				var_110_0.localEulerAngles = var_110_6
			end

			if arg_107_1.time_ >= var_110_1 + var_110_2 and arg_107_1.time_ < var_110_1 + var_110_2 + arg_110_0 then
				var_110_0.localPosition = Vector3.New(0, 100, 0)

				local var_110_7 = manager.ui.mainCamera.transform.position - var_110_0.position

				var_110_0.forward = Vector3.New(var_110_7.x, var_110_7.y, var_110_7.z)

				local var_110_8 = var_110_0.localEulerAngles

				var_110_8.z = 0
				var_110_8.x = 0
				var_110_0.localEulerAngles = var_110_8
			end

			local var_110_9 = arg_107_1.actors_["1038ui_story"].transform
			local var_110_10 = 0

			if var_110_10 < arg_107_1.time_ and arg_107_1.time_ <= var_110_10 + arg_110_0 then
				arg_107_1.var_.moveOldPos1038ui_story = var_110_9.localPosition
			end

			local var_110_11 = 0.001

			if var_110_10 <= arg_107_1.time_ and arg_107_1.time_ < var_110_10 + var_110_11 then
				local var_110_12 = (arg_107_1.time_ - var_110_10) / var_110_11
				local var_110_13 = Vector3.New(0, 100, 0)

				var_110_9.localPosition = Vector3.Lerp(arg_107_1.var_.moveOldPos1038ui_story, var_110_13, var_110_12)

				local var_110_14 = manager.ui.mainCamera.transform.position - var_110_9.position

				var_110_9.forward = Vector3.New(var_110_14.x, var_110_14.y, var_110_14.z)

				local var_110_15 = var_110_9.localEulerAngles

				var_110_15.z = 0
				var_110_15.x = 0
				var_110_9.localEulerAngles = var_110_15
			end

			if arg_107_1.time_ >= var_110_10 + var_110_11 and arg_107_1.time_ < var_110_10 + var_110_11 + arg_110_0 then
				var_110_9.localPosition = Vector3.New(0, 100, 0)

				local var_110_16 = manager.ui.mainCamera.transform.position - var_110_9.position

				var_110_9.forward = Vector3.New(var_110_16.x, var_110_16.y, var_110_16.z)

				local var_110_17 = var_110_9.localEulerAngles

				var_110_17.z = 0
				var_110_17.x = 0
				var_110_9.localEulerAngles = var_110_17
			end

			local var_110_18 = 0
			local var_110_19 = 0.925

			if var_110_18 < arg_107_1.time_ and arg_107_1.time_ <= var_110_18 + arg_110_0 then
				arg_107_1.talkMaxDuration = 0
				arg_107_1.dialogCg_.alpha = 1

				arg_107_1.dialog_:SetActive(true)
				SetActive(arg_107_1.leftNameGo_, true)

				local var_110_20 = arg_107_1:FormatText(StoryNameCfg[10].name)

				arg_107_1.leftNameTxt_.text = var_110_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_107_1.leftNameTxt_.transform)

				arg_107_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_107_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_107_1:RecordName(arg_107_1.leftNameTxt_.text)
				SetActive(arg_107_1.iconTrs_.gameObject, true)
				arg_107_1.iconController_:SetSelectedState("hero")

				arg_107_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_107_1.callingController_:SetSelectedState("normal")

				local var_110_21 = arg_107_1:GetWordFromCfg(113191025)
				local var_110_22 = arg_107_1:FormatText(var_110_21.content)

				arg_107_1.text_.text = var_110_22

				LuaForUtil.ClearLinePrefixSymbol(arg_107_1.text_)

				local var_110_23 = 37
				local var_110_24 = utf8.len(var_110_22)
				local var_110_25 = var_110_23 <= 0 and var_110_19 or var_110_19 * (var_110_24 / var_110_23)

				if var_110_25 > 0 and var_110_19 < var_110_25 then
					arg_107_1.talkMaxDuration = var_110_25

					if var_110_25 + var_110_18 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_25 + var_110_18
					end
				end

				arg_107_1.text_.text = var_110_22
				arg_107_1.typewritter.percent = 0

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191025", "story_v_out_113191.awb") ~= 0 then
					local var_110_26 = manager.audio:GetVoiceLength("story_v_out_113191", "113191025", "story_v_out_113191.awb") / 1000

					if var_110_26 + var_110_18 > arg_107_1.duration_ then
						arg_107_1.duration_ = var_110_26 + var_110_18
					end

					if var_110_21.prefab_name ~= "" and arg_107_1.actors_[var_110_21.prefab_name] ~= nil then
						local var_110_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_107_1.actors_[var_110_21.prefab_name].transform, "story_v_out_113191", "113191025", "story_v_out_113191.awb")

						arg_107_1:RecordAudio("113191025", var_110_27)
						arg_107_1:RecordAudio("113191025", var_110_27)
					else
						arg_107_1:AudioAction("play", "voice", "story_v_out_113191", "113191025", "story_v_out_113191.awb")
					end

					arg_107_1:RecordHistoryTalkVoice("story_v_out_113191", "113191025", "story_v_out_113191.awb")
				end

				arg_107_1:RecordContent(arg_107_1.text_.text)
			end

			local var_110_28 = math.max(var_110_19, arg_107_1.talkMaxDuration)

			if var_110_18 <= arg_107_1.time_ and arg_107_1.time_ < var_110_18 + var_110_28 then
				arg_107_1.typewritter.percent = (arg_107_1.time_ - var_110_18) / var_110_28

				arg_107_1.typewritter:SetDirty()
			end

			if arg_107_1.time_ >= var_110_18 + var_110_28 and arg_107_1.time_ < var_110_18 + var_110_28 + arg_110_0 then
				arg_107_1.typewritter.percent = 1

				arg_107_1.typewritter:SetDirty()
				arg_107_1:ShowNextGo(true)
			end
		end
	end,
	Play113191026 = function(arg_111_0, arg_111_1)
		arg_111_1.time_ = 0
		arg_111_1.frameCnt_ = 0
		arg_111_1.state_ = "playing"
		arg_111_1.curTalkId_ = 113191026
		arg_111_1.duration_ = 5

		SetActive(arg_111_1.tipsGo_, false)

		function arg_111_1.onSingleLineFinish_()
			arg_111_1.onSingleLineUpdate_ = nil
			arg_111_1.onSingleLineFinish_ = nil
			arg_111_1.state_ = "waiting"
		end

		function arg_111_1.playNext_(arg_113_0)
			if arg_113_0 == 1 then
				arg_111_0:Play113191027(arg_111_1)
			end
		end

		function arg_111_1.onSingleLineUpdate_(arg_114_0)
			local var_114_0 = 0
			local var_114_1 = 1.25

			if var_114_0 < arg_111_1.time_ and arg_111_1.time_ <= var_114_0 + arg_114_0 then
				arg_111_1.talkMaxDuration = 0
				arg_111_1.dialogCg_.alpha = 1

				arg_111_1.dialog_:SetActive(true)
				SetActive(arg_111_1.leftNameGo_, true)

				local var_114_2 = arg_111_1:FormatText(StoryNameCfg[7].name)

				arg_111_1.leftNameTxt_.text = var_114_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_111_1.leftNameTxt_.transform)

				arg_111_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_111_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_111_1:RecordName(arg_111_1.leftNameTxt_.text)
				SetActive(arg_111_1.iconTrs_.gameObject, false)
				arg_111_1.callingController_:SetSelectedState("normal")

				local var_114_3 = arg_111_1:GetWordFromCfg(113191026)
				local var_114_4 = arg_111_1:FormatText(var_114_3.content)

				arg_111_1.text_.text = var_114_4

				LuaForUtil.ClearLinePrefixSymbol(arg_111_1.text_)

				local var_114_5 = 50
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
				arg_111_1:RecordContent(arg_111_1.text_.text)
			end

			local var_114_8 = math.max(var_114_1, arg_111_1.talkMaxDuration)

			if var_114_0 <= arg_111_1.time_ and arg_111_1.time_ < var_114_0 + var_114_8 then
				arg_111_1.typewritter.percent = (arg_111_1.time_ - var_114_0) / var_114_8

				arg_111_1.typewritter:SetDirty()
			end

			if arg_111_1.time_ >= var_114_0 + var_114_8 and arg_111_1.time_ < var_114_0 + var_114_8 + arg_114_0 then
				arg_111_1.typewritter.percent = 1

				arg_111_1.typewritter:SetDirty()
				arg_111_1:ShowNextGo(true)
			end
		end
	end,
	Play113191027 = function(arg_115_0, arg_115_1)
		arg_115_1.time_ = 0
		arg_115_1.frameCnt_ = 0
		arg_115_1.state_ = "playing"
		arg_115_1.curTalkId_ = 113191027
		arg_115_1.duration_ = 3.833

		local var_115_0 = {
			ja = 2.933,
			ko = 3.7,
			zh = 2.533,
			en = 3.833
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
				arg_115_0:Play113191028(arg_115_1)
			end
		end

		function arg_115_1.onSingleLineUpdate_(arg_118_0)
			local var_118_0 = arg_115_1.actors_["1084ui_story"].transform
			local var_118_1 = 0

			if var_118_1 < arg_115_1.time_ and arg_115_1.time_ <= var_118_1 + arg_118_0 then
				arg_115_1.var_.moveOldPos1084ui_story = var_118_0.localPosition

				local var_118_2 = "1084ui_story"

				arg_115_1:ShowWeapon(arg_115_1.var_[var_118_2 .. "Animator"].transform, true)
			end

			local var_118_3 = 0.001

			if var_118_1 <= arg_115_1.time_ and arg_115_1.time_ < var_118_1 + var_118_3 then
				local var_118_4 = (arg_115_1.time_ - var_118_1) / var_118_3
				local var_118_5 = Vector3.New(0, -0.97, -6)

				var_118_0.localPosition = Vector3.Lerp(arg_115_1.var_.moveOldPos1084ui_story, var_118_5, var_118_4)

				local var_118_6 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_6.x, var_118_6.y, var_118_6.z)

				local var_118_7 = var_118_0.localEulerAngles

				var_118_7.z = 0
				var_118_7.x = 0
				var_118_0.localEulerAngles = var_118_7
			end

			if arg_115_1.time_ >= var_118_1 + var_118_3 and arg_115_1.time_ < var_118_1 + var_118_3 + arg_118_0 then
				var_118_0.localPosition = Vector3.New(0, -0.97, -6)

				local var_118_8 = manager.ui.mainCamera.transform.position - var_118_0.position

				var_118_0.forward = Vector3.New(var_118_8.x, var_118_8.y, var_118_8.z)

				local var_118_9 = var_118_0.localEulerAngles

				var_118_9.z = 0
				var_118_9.x = 0
				var_118_0.localEulerAngles = var_118_9
			end

			local var_118_10 = 0

			if var_118_10 < arg_115_1.time_ and arg_115_1.time_ <= var_118_10 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action11_1")
			end

			local var_118_11 = 0

			if var_118_11 < arg_115_1.time_ and arg_115_1.time_ <= var_118_11 + arg_118_0 then
				arg_115_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_118_12 = arg_115_1.actors_["1084ui_story"]
			local var_118_13 = 0

			if var_118_13 < arg_115_1.time_ and arg_115_1.time_ <= var_118_13 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story == nil then
				arg_115_1.var_.characterEffect1084ui_story = var_118_12:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_118_14 = 0.2

			if var_118_13 <= arg_115_1.time_ and arg_115_1.time_ < var_118_13 + var_118_14 then
				local var_118_15 = (arg_115_1.time_ - var_118_13) / var_118_14

				if arg_115_1.var_.characterEffect1084ui_story then
					arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_115_1.time_ >= var_118_13 + var_118_14 and arg_115_1.time_ < var_118_13 + var_118_14 + arg_118_0 and arg_115_1.var_.characterEffect1084ui_story then
				arg_115_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_118_16 = 0
			local var_118_17 = 0.325

			if var_118_16 < arg_115_1.time_ and arg_115_1.time_ <= var_118_16 + arg_118_0 then
				arg_115_1.talkMaxDuration = 0
				arg_115_1.dialogCg_.alpha = 1

				arg_115_1.dialog_:SetActive(true)
				SetActive(arg_115_1.leftNameGo_, true)

				local var_118_18 = arg_115_1:FormatText(StoryNameCfg[6].name)

				arg_115_1.leftNameTxt_.text = var_118_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_115_1.leftNameTxt_.transform)

				arg_115_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_115_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_115_1:RecordName(arg_115_1.leftNameTxt_.text)
				SetActive(arg_115_1.iconTrs_.gameObject, false)
				arg_115_1.callingController_:SetSelectedState("normal")

				local var_118_19 = arg_115_1:GetWordFromCfg(113191027)
				local var_118_20 = arg_115_1:FormatText(var_118_19.content)

				arg_115_1.text_.text = var_118_20

				LuaForUtil.ClearLinePrefixSymbol(arg_115_1.text_)

				local var_118_21 = 13
				local var_118_22 = utf8.len(var_118_20)
				local var_118_23 = var_118_21 <= 0 and var_118_17 or var_118_17 * (var_118_22 / var_118_21)

				if var_118_23 > 0 and var_118_17 < var_118_23 then
					arg_115_1.talkMaxDuration = var_118_23

					if var_118_23 + var_118_16 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_23 + var_118_16
					end
				end

				arg_115_1.text_.text = var_118_20
				arg_115_1.typewritter.percent = 0

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191027", "story_v_out_113191.awb") ~= 0 then
					local var_118_24 = manager.audio:GetVoiceLength("story_v_out_113191", "113191027", "story_v_out_113191.awb") / 1000

					if var_118_24 + var_118_16 > arg_115_1.duration_ then
						arg_115_1.duration_ = var_118_24 + var_118_16
					end

					if var_118_19.prefab_name ~= "" and arg_115_1.actors_[var_118_19.prefab_name] ~= nil then
						local var_118_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_115_1.actors_[var_118_19.prefab_name].transform, "story_v_out_113191", "113191027", "story_v_out_113191.awb")

						arg_115_1:RecordAudio("113191027", var_118_25)
						arg_115_1:RecordAudio("113191027", var_118_25)
					else
						arg_115_1:AudioAction("play", "voice", "story_v_out_113191", "113191027", "story_v_out_113191.awb")
					end

					arg_115_1:RecordHistoryTalkVoice("story_v_out_113191", "113191027", "story_v_out_113191.awb")
				end

				arg_115_1:RecordContent(arg_115_1.text_.text)
			end

			local var_118_26 = math.max(var_118_17, arg_115_1.talkMaxDuration)

			if var_118_16 <= arg_115_1.time_ and arg_115_1.time_ < var_118_16 + var_118_26 then
				arg_115_1.typewritter.percent = (arg_115_1.time_ - var_118_16) / var_118_26

				arg_115_1.typewritter:SetDirty()
			end

			if arg_115_1.time_ >= var_118_16 + var_118_26 and arg_115_1.time_ < var_118_16 + var_118_26 + arg_118_0 then
				arg_115_1.typewritter.percent = 1

				arg_115_1.typewritter:SetDirty()
				arg_115_1:ShowNextGo(true)
			end
		end
	end,
	Play113191028 = function(arg_119_0, arg_119_1)
		arg_119_1.time_ = 0
		arg_119_1.frameCnt_ = 0
		arg_119_1.state_ = "playing"
		arg_119_1.curTalkId_ = 113191028
		arg_119_1.duration_ = 14.9

		local var_119_0 = {
			ja = 14.9,
			ko = 7.333,
			zh = 5.933,
			en = 9.333
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
				arg_119_0:Play113191029(arg_119_1)
			end
		end

		function arg_119_1.onSingleLineUpdate_(arg_122_0)
			local var_122_0 = arg_119_1.actors_["1084ui_story"]
			local var_122_1 = 0

			if var_122_1 < arg_119_1.time_ and arg_119_1.time_ <= var_122_1 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story == nil then
				arg_119_1.var_.characterEffect1084ui_story = var_122_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_122_2 = 0.2

			if var_122_1 <= arg_119_1.time_ and arg_119_1.time_ < var_122_1 + var_122_2 then
				local var_122_3 = (arg_119_1.time_ - var_122_1) / var_122_2

				if arg_119_1.var_.characterEffect1084ui_story then
					local var_122_4 = Mathf.Lerp(0, 0.5, var_122_3)

					arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_4
				end
			end

			if arg_119_1.time_ >= var_122_1 + var_122_2 and arg_119_1.time_ < var_122_1 + var_122_2 + arg_122_0 and arg_119_1.var_.characterEffect1084ui_story then
				local var_122_5 = 0.5

				arg_119_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_119_1.var_.characterEffect1084ui_story.fillRatio = var_122_5
			end

			local var_122_6 = 0
			local var_122_7 = 0.775

			if var_122_6 < arg_119_1.time_ and arg_119_1.time_ <= var_122_6 + arg_122_0 then
				arg_119_1.talkMaxDuration = 0
				arg_119_1.dialogCg_.alpha = 1

				arg_119_1.dialog_:SetActive(true)
				SetActive(arg_119_1.leftNameGo_, true)

				local var_122_8 = arg_119_1:FormatText(StoryNameCfg[10].name)

				arg_119_1.leftNameTxt_.text = var_122_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_119_1.leftNameTxt_.transform)

				arg_119_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_119_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_119_1:RecordName(arg_119_1.leftNameTxt_.text)
				SetActive(arg_119_1.iconTrs_.gameObject, true)
				arg_119_1.iconController_:SetSelectedState("hero")

				arg_119_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_mmr")

				arg_119_1.callingController_:SetSelectedState("normal")

				local var_122_9 = arg_119_1:GetWordFromCfg(113191028)
				local var_122_10 = arg_119_1:FormatText(var_122_9.content)

				arg_119_1.text_.text = var_122_10

				LuaForUtil.ClearLinePrefixSymbol(arg_119_1.text_)

				local var_122_11 = 31
				local var_122_12 = utf8.len(var_122_10)
				local var_122_13 = var_122_11 <= 0 and var_122_7 or var_122_7 * (var_122_12 / var_122_11)

				if var_122_13 > 0 and var_122_7 < var_122_13 then
					arg_119_1.talkMaxDuration = var_122_13

					if var_122_13 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_13 + var_122_6
					end
				end

				arg_119_1.text_.text = var_122_10
				arg_119_1.typewritter.percent = 0

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191028", "story_v_out_113191.awb") ~= 0 then
					local var_122_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191028", "story_v_out_113191.awb") / 1000

					if var_122_14 + var_122_6 > arg_119_1.duration_ then
						arg_119_1.duration_ = var_122_14 + var_122_6
					end

					if var_122_9.prefab_name ~= "" and arg_119_1.actors_[var_122_9.prefab_name] ~= nil then
						local var_122_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_119_1.actors_[var_122_9.prefab_name].transform, "story_v_out_113191", "113191028", "story_v_out_113191.awb")

						arg_119_1:RecordAudio("113191028", var_122_15)
						arg_119_1:RecordAudio("113191028", var_122_15)
					else
						arg_119_1:AudioAction("play", "voice", "story_v_out_113191", "113191028", "story_v_out_113191.awb")
					end

					arg_119_1:RecordHistoryTalkVoice("story_v_out_113191", "113191028", "story_v_out_113191.awb")
				end

				arg_119_1:RecordContent(arg_119_1.text_.text)
			end

			local var_122_16 = math.max(var_122_7, arg_119_1.talkMaxDuration)

			if var_122_6 <= arg_119_1.time_ and arg_119_1.time_ < var_122_6 + var_122_16 then
				arg_119_1.typewritter.percent = (arg_119_1.time_ - var_122_6) / var_122_16

				arg_119_1.typewritter:SetDirty()
			end

			if arg_119_1.time_ >= var_122_6 + var_122_16 and arg_119_1.time_ < var_122_6 + var_122_16 + arg_122_0 then
				arg_119_1.typewritter.percent = 1

				arg_119_1.typewritter:SetDirty()
				arg_119_1:ShowNextGo(true)
			end
		end
	end,
	Play113191029 = function(arg_123_0, arg_123_1)
		arg_123_1.time_ = 0
		arg_123_1.frameCnt_ = 0
		arg_123_1.state_ = "playing"
		arg_123_1.curTalkId_ = 113191029
		arg_123_1.duration_ = 3.6

		local var_123_0 = {
			ja = 3.3,
			ko = 3.2,
			zh = 2.833,
			en = 3.6
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
				arg_123_0:Play113191030(arg_123_1)
			end
		end

		function arg_123_1.onSingleLineUpdate_(arg_126_0)
			local var_126_0 = 0

			if var_126_0 < arg_123_1.time_ and arg_123_1.time_ <= var_126_0 + arg_126_0 then
				arg_123_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3204cva")
			end

			local var_126_1 = arg_123_1.actors_["1084ui_story"]
			local var_126_2 = 0

			if var_126_2 < arg_123_1.time_ and arg_123_1.time_ <= var_126_2 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story == nil then
				arg_123_1.var_.characterEffect1084ui_story = var_126_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_126_3 = 0.2

			if var_126_2 <= arg_123_1.time_ and arg_123_1.time_ < var_126_2 + var_126_3 then
				local var_126_4 = (arg_123_1.time_ - var_126_2) / var_126_3

				if arg_123_1.var_.characterEffect1084ui_story then
					arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_123_1.time_ >= var_126_2 + var_126_3 and arg_123_1.time_ < var_126_2 + var_126_3 + arg_126_0 and arg_123_1.var_.characterEffect1084ui_story then
				arg_123_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_126_5 = 0
			local var_126_6 = 0.275

			if var_126_5 < arg_123_1.time_ and arg_123_1.time_ <= var_126_5 + arg_126_0 then
				arg_123_1.talkMaxDuration = 0
				arg_123_1.dialogCg_.alpha = 1

				arg_123_1.dialog_:SetActive(true)
				SetActive(arg_123_1.leftNameGo_, true)

				local var_126_7 = arg_123_1:FormatText(StoryNameCfg[6].name)

				arg_123_1.leftNameTxt_.text = var_126_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_123_1.leftNameTxt_.transform)

				arg_123_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_123_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_123_1:RecordName(arg_123_1.leftNameTxt_.text)
				SetActive(arg_123_1.iconTrs_.gameObject, false)
				arg_123_1.callingController_:SetSelectedState("normal")

				local var_126_8 = arg_123_1:GetWordFromCfg(113191029)
				local var_126_9 = arg_123_1:FormatText(var_126_8.content)

				arg_123_1.text_.text = var_126_9

				LuaForUtil.ClearLinePrefixSymbol(arg_123_1.text_)

				local var_126_10 = 11
				local var_126_11 = utf8.len(var_126_9)
				local var_126_12 = var_126_10 <= 0 and var_126_6 or var_126_6 * (var_126_11 / var_126_10)

				if var_126_12 > 0 and var_126_6 < var_126_12 then
					arg_123_1.talkMaxDuration = var_126_12

					if var_126_12 + var_126_5 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_12 + var_126_5
					end
				end

				arg_123_1.text_.text = var_126_9
				arg_123_1.typewritter.percent = 0

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191029", "story_v_out_113191.awb") ~= 0 then
					local var_126_13 = manager.audio:GetVoiceLength("story_v_out_113191", "113191029", "story_v_out_113191.awb") / 1000

					if var_126_13 + var_126_5 > arg_123_1.duration_ then
						arg_123_1.duration_ = var_126_13 + var_126_5
					end

					if var_126_8.prefab_name ~= "" and arg_123_1.actors_[var_126_8.prefab_name] ~= nil then
						local var_126_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_123_1.actors_[var_126_8.prefab_name].transform, "story_v_out_113191", "113191029", "story_v_out_113191.awb")

						arg_123_1:RecordAudio("113191029", var_126_14)
						arg_123_1:RecordAudio("113191029", var_126_14)
					else
						arg_123_1:AudioAction("play", "voice", "story_v_out_113191", "113191029", "story_v_out_113191.awb")
					end

					arg_123_1:RecordHistoryTalkVoice("story_v_out_113191", "113191029", "story_v_out_113191.awb")
				end

				arg_123_1:RecordContent(arg_123_1.text_.text)
			end

			local var_126_15 = math.max(var_126_6, arg_123_1.talkMaxDuration)

			if var_126_5 <= arg_123_1.time_ and arg_123_1.time_ < var_126_5 + var_126_15 then
				arg_123_1.typewritter.percent = (arg_123_1.time_ - var_126_5) / var_126_15

				arg_123_1.typewritter:SetDirty()
			end

			if arg_123_1.time_ >= var_126_5 + var_126_15 and arg_123_1.time_ < var_126_5 + var_126_15 + arg_126_0 then
				arg_123_1.typewritter.percent = 1

				arg_123_1.typewritter:SetDirty()
				arg_123_1:ShowNextGo(true)
			end
		end
	end,
	Play113191030 = function(arg_127_0, arg_127_1)
		arg_127_1.time_ = 0
		arg_127_1.frameCnt_ = 0
		arg_127_1.state_ = "playing"
		arg_127_1.curTalkId_ = 113191030
		arg_127_1.duration_ = 7.866

		local var_127_0 = {
			ja = 5.633,
			ko = 7.866,
			zh = 4.533,
			en = 5.3
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
				arg_127_0:Play113191031(arg_127_1)
			end
		end

		function arg_127_1.onSingleLineUpdate_(arg_130_0)
			local var_130_0 = arg_127_1.actors_["1084ui_story"].transform
			local var_130_1 = 0

			if var_130_1 < arg_127_1.time_ and arg_127_1.time_ <= var_130_1 + arg_130_0 then
				arg_127_1.var_.moveOldPos1084ui_story = var_130_0.localPosition
			end

			local var_130_2 = 0.001

			if var_130_1 <= arg_127_1.time_ and arg_127_1.time_ < var_130_1 + var_130_2 then
				local var_130_3 = (arg_127_1.time_ - var_130_1) / var_130_2
				local var_130_4 = Vector3.New(0, 100, 0)

				var_130_0.localPosition = Vector3.Lerp(arg_127_1.var_.moveOldPos1084ui_story, var_130_4, var_130_3)

				local var_130_5 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_5.x, var_130_5.y, var_130_5.z)

				local var_130_6 = var_130_0.localEulerAngles

				var_130_6.z = 0
				var_130_6.x = 0
				var_130_0.localEulerAngles = var_130_6
			end

			if arg_127_1.time_ >= var_130_1 + var_130_2 and arg_127_1.time_ < var_130_1 + var_130_2 + arg_130_0 then
				var_130_0.localPosition = Vector3.New(0, 100, 0)

				local var_130_7 = manager.ui.mainCamera.transform.position - var_130_0.position

				var_130_0.forward = Vector3.New(var_130_7.x, var_130_7.y, var_130_7.z)

				local var_130_8 = var_130_0.localEulerAngles

				var_130_8.z = 0
				var_130_8.x = 0
				var_130_0.localEulerAngles = var_130_8
			end

			local var_130_9 = 0
			local var_130_10 = 0.425

			if var_130_9 < arg_127_1.time_ and arg_127_1.time_ <= var_130_9 + arg_130_0 then
				arg_127_1.talkMaxDuration = 0
				arg_127_1.dialogCg_.alpha = 1

				arg_127_1.dialog_:SetActive(true)
				SetActive(arg_127_1.leftNameGo_, true)

				local var_130_11 = arg_127_1:FormatText(StoryNameCfg[216].name)

				arg_127_1.leftNameTxt_.text = var_130_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_127_1.leftNameTxt_.transform)

				arg_127_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_127_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_127_1:RecordName(arg_127_1.leftNameTxt_.text)
				SetActive(arg_127_1.iconTrs_.gameObject, true)
				arg_127_1.iconController_:SetSelectedState("hero")

				arg_127_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1097")

				arg_127_1.callingController_:SetSelectedState("normal")

				local var_130_12 = arg_127_1:GetWordFromCfg(113191030)
				local var_130_13 = arg_127_1:FormatText(var_130_12.content)

				arg_127_1.text_.text = var_130_13

				LuaForUtil.ClearLinePrefixSymbol(arg_127_1.text_)

				local var_130_14 = 17
				local var_130_15 = utf8.len(var_130_13)
				local var_130_16 = var_130_14 <= 0 and var_130_10 or var_130_10 * (var_130_15 / var_130_14)

				if var_130_16 > 0 and var_130_10 < var_130_16 then
					arg_127_1.talkMaxDuration = var_130_16

					if var_130_16 + var_130_9 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_16 + var_130_9
					end
				end

				arg_127_1.text_.text = var_130_13
				arg_127_1.typewritter.percent = 0

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191030", "story_v_out_113191.awb") ~= 0 then
					local var_130_17 = manager.audio:GetVoiceLength("story_v_out_113191", "113191030", "story_v_out_113191.awb") / 1000

					if var_130_17 + var_130_9 > arg_127_1.duration_ then
						arg_127_1.duration_ = var_130_17 + var_130_9
					end

					if var_130_12.prefab_name ~= "" and arg_127_1.actors_[var_130_12.prefab_name] ~= nil then
						local var_130_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_127_1.actors_[var_130_12.prefab_name].transform, "story_v_out_113191", "113191030", "story_v_out_113191.awb")

						arg_127_1:RecordAudio("113191030", var_130_18)
						arg_127_1:RecordAudio("113191030", var_130_18)
					else
						arg_127_1:AudioAction("play", "voice", "story_v_out_113191", "113191030", "story_v_out_113191.awb")
					end

					arg_127_1:RecordHistoryTalkVoice("story_v_out_113191", "113191030", "story_v_out_113191.awb")
				end

				arg_127_1:RecordContent(arg_127_1.text_.text)
			end

			local var_130_19 = math.max(var_130_10, arg_127_1.talkMaxDuration)

			if var_130_9 <= arg_127_1.time_ and arg_127_1.time_ < var_130_9 + var_130_19 then
				arg_127_1.typewritter.percent = (arg_127_1.time_ - var_130_9) / var_130_19

				arg_127_1.typewritter:SetDirty()
			end

			if arg_127_1.time_ >= var_130_9 + var_130_19 and arg_127_1.time_ < var_130_9 + var_130_19 + arg_130_0 then
				arg_127_1.typewritter.percent = 1

				arg_127_1.typewritter:SetDirty()
				arg_127_1:ShowNextGo(true)
			end
		end
	end,
	Play113191031 = function(arg_131_0, arg_131_1)
		arg_131_1.time_ = 0
		arg_131_1.frameCnt_ = 0
		arg_131_1.state_ = "playing"
		arg_131_1.curTalkId_ = 113191031
		arg_131_1.duration_ = 5

		SetActive(arg_131_1.tipsGo_, false)

		function arg_131_1.onSingleLineFinish_()
			arg_131_1.onSingleLineUpdate_ = nil
			arg_131_1.onSingleLineFinish_ = nil
			arg_131_1.state_ = "waiting"
		end

		function arg_131_1.playNext_(arg_133_0)
			if arg_133_0 == 1 then
				arg_131_0:Play113191032(arg_131_1)
			end
		end

		function arg_131_1.onSingleLineUpdate_(arg_134_0)
			local var_134_0 = 0
			local var_134_1 = 0.475

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

				local var_134_2 = arg_131_1:GetWordFromCfg(113191031)
				local var_134_3 = arg_131_1:FormatText(var_134_2.content)

				arg_131_1.text_.text = var_134_3

				LuaForUtil.ClearLinePrefixSymbol(arg_131_1.text_)

				local var_134_4 = 19
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
	Play113191032 = function(arg_135_0, arg_135_1)
		arg_135_1.time_ = 0
		arg_135_1.frameCnt_ = 0
		arg_135_1.state_ = "playing"
		arg_135_1.curTalkId_ = 113191032
		arg_135_1.duration_ = 5.666

		local var_135_0 = {
			ja = 5.666,
			ko = 3.033,
			zh = 3.7,
			en = 5.4
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
				arg_135_0:Play113191033(arg_135_1)
			end
		end

		function arg_135_1.onSingleLineUpdate_(arg_138_0)
			local var_138_0 = "1097ui_story"

			if arg_135_1.actors_[var_138_0] == nil then
				local var_138_1 = Object.Instantiate(Asset.Load("Char/" .. var_138_0), arg_135_1.stage_.transform)

				var_138_1.name = var_138_0
				var_138_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_135_1.actors_[var_138_0] = var_138_1

				local var_138_2 = var_138_1:GetComponentInChildren(typeof(CharacterEffect))

				var_138_2.enabled = true

				local var_138_3 = GameObjectTools.GetOrAddComponent(var_138_1, typeof(DynamicBoneHelper))

				if var_138_3 then
					var_138_3:EnableDynamicBone(false)
				end

				arg_135_1:ShowWeapon(var_138_2.transform, false)

				arg_135_1.var_[var_138_0 .. "Animator"] = var_138_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_135_1.var_[var_138_0 .. "Animator"].applyRootMotion = true
				arg_135_1.var_[var_138_0 .. "LipSync"] = var_138_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_138_4 = arg_135_1.actors_["1097ui_story"].transform
			local var_138_5 = 0

			if var_138_5 < arg_135_1.time_ and arg_135_1.time_ <= var_138_5 + arg_138_0 then
				arg_135_1.var_.moveOldPos1097ui_story = var_138_4.localPosition
			end

			local var_138_6 = 0.001

			if var_138_5 <= arg_135_1.time_ and arg_135_1.time_ < var_138_5 + var_138_6 then
				local var_138_7 = (arg_135_1.time_ - var_138_5) / var_138_6
				local var_138_8 = Vector3.New(0, -0.54, -6.3)

				var_138_4.localPosition = Vector3.Lerp(arg_135_1.var_.moveOldPos1097ui_story, var_138_8, var_138_7)

				local var_138_9 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_9.x, var_138_9.y, var_138_9.z)

				local var_138_10 = var_138_4.localEulerAngles

				var_138_10.z = 0
				var_138_10.x = 0
				var_138_4.localEulerAngles = var_138_10
			end

			if arg_135_1.time_ >= var_138_5 + var_138_6 and arg_135_1.time_ < var_138_5 + var_138_6 + arg_138_0 then
				var_138_4.localPosition = Vector3.New(0, -0.54, -6.3)

				local var_138_11 = manager.ui.mainCamera.transform.position - var_138_4.position

				var_138_4.forward = Vector3.New(var_138_11.x, var_138_11.y, var_138_11.z)

				local var_138_12 = var_138_4.localEulerAngles

				var_138_12.z = 0
				var_138_12.x = 0
				var_138_4.localEulerAngles = var_138_12
			end

			local var_138_13 = 0

			if var_138_13 < arg_135_1.time_ and arg_135_1.time_ <= var_138_13 + arg_138_0 then
				arg_135_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_1")
			end

			local var_138_14 = 0

			if var_138_14 < arg_135_1.time_ and arg_135_1.time_ <= var_138_14 + arg_138_0 then
				arg_135_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_138_15 = arg_135_1.actors_["1097ui_story"]
			local var_138_16 = 0

			if var_138_16 < arg_135_1.time_ and arg_135_1.time_ <= var_138_16 + arg_138_0 and arg_135_1.var_.characterEffect1097ui_story == nil then
				arg_135_1.var_.characterEffect1097ui_story = var_138_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_138_17 = 0.2

			if var_138_16 <= arg_135_1.time_ and arg_135_1.time_ < var_138_16 + var_138_17 then
				local var_138_18 = (arg_135_1.time_ - var_138_16) / var_138_17

				if arg_135_1.var_.characterEffect1097ui_story then
					arg_135_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_135_1.time_ >= var_138_16 + var_138_17 and arg_135_1.time_ < var_138_16 + var_138_17 + arg_138_0 and arg_135_1.var_.characterEffect1097ui_story then
				arg_135_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_138_19 = 0
			local var_138_20 = 0.3

			if var_138_19 < arg_135_1.time_ and arg_135_1.time_ <= var_138_19 + arg_138_0 then
				arg_135_1.talkMaxDuration = 0
				arg_135_1.dialogCg_.alpha = 1

				arg_135_1.dialog_:SetActive(true)
				SetActive(arg_135_1.leftNameGo_, true)

				local var_138_21 = arg_135_1:FormatText(StoryNameCfg[216].name)

				arg_135_1.leftNameTxt_.text = var_138_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_135_1.leftNameTxt_.transform)

				arg_135_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_135_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_135_1:RecordName(arg_135_1.leftNameTxt_.text)
				SetActive(arg_135_1.iconTrs_.gameObject, false)
				arg_135_1.callingController_:SetSelectedState("normal")

				local var_138_22 = arg_135_1:GetWordFromCfg(113191032)
				local var_138_23 = arg_135_1:FormatText(var_138_22.content)

				arg_135_1.text_.text = var_138_23

				LuaForUtil.ClearLinePrefixSymbol(arg_135_1.text_)

				local var_138_24 = 12
				local var_138_25 = utf8.len(var_138_23)
				local var_138_26 = var_138_24 <= 0 and var_138_20 or var_138_20 * (var_138_25 / var_138_24)

				if var_138_26 > 0 and var_138_20 < var_138_26 then
					arg_135_1.talkMaxDuration = var_138_26

					if var_138_26 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_26 + var_138_19
					end
				end

				arg_135_1.text_.text = var_138_23
				arg_135_1.typewritter.percent = 0

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191032", "story_v_out_113191.awb") ~= 0 then
					local var_138_27 = manager.audio:GetVoiceLength("story_v_out_113191", "113191032", "story_v_out_113191.awb") / 1000

					if var_138_27 + var_138_19 > arg_135_1.duration_ then
						arg_135_1.duration_ = var_138_27 + var_138_19
					end

					if var_138_22.prefab_name ~= "" and arg_135_1.actors_[var_138_22.prefab_name] ~= nil then
						local var_138_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_135_1.actors_[var_138_22.prefab_name].transform, "story_v_out_113191", "113191032", "story_v_out_113191.awb")

						arg_135_1:RecordAudio("113191032", var_138_28)
						arg_135_1:RecordAudio("113191032", var_138_28)
					else
						arg_135_1:AudioAction("play", "voice", "story_v_out_113191", "113191032", "story_v_out_113191.awb")
					end

					arg_135_1:RecordHistoryTalkVoice("story_v_out_113191", "113191032", "story_v_out_113191.awb")
				end

				arg_135_1:RecordContent(arg_135_1.text_.text)
			end

			local var_138_29 = math.max(var_138_20, arg_135_1.talkMaxDuration)

			if var_138_19 <= arg_135_1.time_ and arg_135_1.time_ < var_138_19 + var_138_29 then
				arg_135_1.typewritter.percent = (arg_135_1.time_ - var_138_19) / var_138_29

				arg_135_1.typewritter:SetDirty()
			end

			if arg_135_1.time_ >= var_138_19 + var_138_29 and arg_135_1.time_ < var_138_19 + var_138_29 + arg_138_0 then
				arg_135_1.typewritter.percent = 1

				arg_135_1.typewritter:SetDirty()
				arg_135_1:ShowNextGo(true)
			end
		end
	end,
	Play113191033 = function(arg_139_0, arg_139_1)
		arg_139_1.time_ = 0
		arg_139_1.frameCnt_ = 0
		arg_139_1.state_ = "playing"
		arg_139_1.curTalkId_ = 113191033
		arg_139_1.duration_ = 14.666

		local var_139_0 = {
			ja = 12.2,
			ko = 10.933,
			zh = 10.066,
			en = 14.666
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
				arg_139_0:Play113191034(arg_139_1)
			end
		end

		function arg_139_1.onSingleLineUpdate_(arg_142_0)
			local var_142_0 = 0

			if var_142_0 < arg_139_1.time_ and arg_139_1.time_ <= var_142_0 + arg_142_0 then
				arg_139_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_142_1 = 0
			local var_142_2 = 0.975

			if var_142_1 < arg_139_1.time_ and arg_139_1.time_ <= var_142_1 + arg_142_0 then
				arg_139_1.talkMaxDuration = 0
				arg_139_1.dialogCg_.alpha = 1

				arg_139_1.dialog_:SetActive(true)
				SetActive(arg_139_1.leftNameGo_, true)

				local var_142_3 = arg_139_1:FormatText(StoryNameCfg[216].name)

				arg_139_1.leftNameTxt_.text = var_142_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_139_1.leftNameTxt_.transform)

				arg_139_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_139_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_139_1:RecordName(arg_139_1.leftNameTxt_.text)
				SetActive(arg_139_1.iconTrs_.gameObject, false)
				arg_139_1.callingController_:SetSelectedState("normal")

				local var_142_4 = arg_139_1:GetWordFromCfg(113191033)
				local var_142_5 = arg_139_1:FormatText(var_142_4.content)

				arg_139_1.text_.text = var_142_5

				LuaForUtil.ClearLinePrefixSymbol(arg_139_1.text_)

				local var_142_6 = 39
				local var_142_7 = utf8.len(var_142_5)
				local var_142_8 = var_142_6 <= 0 and var_142_2 or var_142_2 * (var_142_7 / var_142_6)

				if var_142_8 > 0 and var_142_2 < var_142_8 then
					arg_139_1.talkMaxDuration = var_142_8

					if var_142_8 + var_142_1 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_8 + var_142_1
					end
				end

				arg_139_1.text_.text = var_142_5
				arg_139_1.typewritter.percent = 0

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191033", "story_v_out_113191.awb") ~= 0 then
					local var_142_9 = manager.audio:GetVoiceLength("story_v_out_113191", "113191033", "story_v_out_113191.awb") / 1000

					if var_142_9 + var_142_1 > arg_139_1.duration_ then
						arg_139_1.duration_ = var_142_9 + var_142_1
					end

					if var_142_4.prefab_name ~= "" and arg_139_1.actors_[var_142_4.prefab_name] ~= nil then
						local var_142_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_139_1.actors_[var_142_4.prefab_name].transform, "story_v_out_113191", "113191033", "story_v_out_113191.awb")

						arg_139_1:RecordAudio("113191033", var_142_10)
						arg_139_1:RecordAudio("113191033", var_142_10)
					else
						arg_139_1:AudioAction("play", "voice", "story_v_out_113191", "113191033", "story_v_out_113191.awb")
					end

					arg_139_1:RecordHistoryTalkVoice("story_v_out_113191", "113191033", "story_v_out_113191.awb")
				end

				arg_139_1:RecordContent(arg_139_1.text_.text)
			end

			local var_142_11 = math.max(var_142_2, arg_139_1.talkMaxDuration)

			if var_142_1 <= arg_139_1.time_ and arg_139_1.time_ < var_142_1 + var_142_11 then
				arg_139_1.typewritter.percent = (arg_139_1.time_ - var_142_1) / var_142_11

				arg_139_1.typewritter:SetDirty()
			end

			if arg_139_1.time_ >= var_142_1 + var_142_11 and arg_139_1.time_ < var_142_1 + var_142_11 + arg_142_0 then
				arg_139_1.typewritter.percent = 1

				arg_139_1.typewritter:SetDirty()
				arg_139_1:ShowNextGo(true)
			end
		end
	end,
	Play113191034 = function(arg_143_0, arg_143_1)
		arg_143_1.time_ = 0
		arg_143_1.frameCnt_ = 0
		arg_143_1.state_ = "playing"
		arg_143_1.curTalkId_ = 113191034
		arg_143_1.duration_ = 3.233

		local var_143_0 = {
			ja = 2.4,
			ko = 3.233,
			zh = 2.4,
			en = 2.266
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
				arg_143_0:Play113191035(arg_143_1)
			end
		end

		function arg_143_1.onSingleLineUpdate_(arg_146_0)
			local var_146_0 = arg_143_1.actors_["1084ui_story"].transform
			local var_146_1 = 0

			if var_146_1 < arg_143_1.time_ and arg_143_1.time_ <= var_146_1 + arg_146_0 then
				arg_143_1.var_.moveOldPos1084ui_story = var_146_0.localPosition

				local var_146_2 = "1084ui_story"

				arg_143_1:ShowWeapon(arg_143_1.var_[var_146_2 .. "Animator"].transform, false)
			end

			local var_146_3 = 0.001

			if var_146_1 <= arg_143_1.time_ and arg_143_1.time_ < var_146_1 + var_146_3 then
				local var_146_4 = (arg_143_1.time_ - var_146_1) / var_146_3
				local var_146_5 = Vector3.New(0.7, -0.97, -6)

				var_146_0.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1084ui_story, var_146_5, var_146_4)

				local var_146_6 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_6.x, var_146_6.y, var_146_6.z)

				local var_146_7 = var_146_0.localEulerAngles

				var_146_7.z = 0
				var_146_7.x = 0
				var_146_0.localEulerAngles = var_146_7
			end

			if arg_143_1.time_ >= var_146_1 + var_146_3 and arg_143_1.time_ < var_146_1 + var_146_3 + arg_146_0 then
				var_146_0.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_146_8 = manager.ui.mainCamera.transform.position - var_146_0.position

				var_146_0.forward = Vector3.New(var_146_8.x, var_146_8.y, var_146_8.z)

				local var_146_9 = var_146_0.localEulerAngles

				var_146_9.z = 0
				var_146_9.x = 0
				var_146_0.localEulerAngles = var_146_9
			end

			local var_146_10 = 0

			if var_146_10 < arg_143_1.time_ and arg_143_1.time_ <= var_146_10 + arg_146_0 then
				arg_143_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_146_11 = arg_143_1.actors_["1084ui_story"]
			local var_146_12 = 0

			if var_146_12 < arg_143_1.time_ and arg_143_1.time_ <= var_146_12 + arg_146_0 and arg_143_1.var_.characterEffect1084ui_story == nil then
				arg_143_1.var_.characterEffect1084ui_story = var_146_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_13 = 0.2

			if var_146_12 <= arg_143_1.time_ and arg_143_1.time_ < var_146_12 + var_146_13 then
				local var_146_14 = (arg_143_1.time_ - var_146_12) / var_146_13

				if arg_143_1.var_.characterEffect1084ui_story then
					arg_143_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_143_1.time_ >= var_146_12 + var_146_13 and arg_143_1.time_ < var_146_12 + var_146_13 + arg_146_0 and arg_143_1.var_.characterEffect1084ui_story then
				arg_143_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_146_15 = 0

			if var_146_15 < arg_143_1.time_ and arg_143_1.time_ <= var_146_15 + arg_146_0 then
				arg_143_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_146_16 = arg_143_1.actors_["1097ui_story"].transform
			local var_146_17 = 0

			if var_146_17 < arg_143_1.time_ and arg_143_1.time_ <= var_146_17 + arg_146_0 then
				arg_143_1.var_.moveOldPos1097ui_story = var_146_16.localPosition
			end

			local var_146_18 = 0.5

			if var_146_17 <= arg_143_1.time_ and arg_143_1.time_ < var_146_17 + var_146_18 then
				local var_146_19 = (arg_143_1.time_ - var_146_17) / var_146_18
				local var_146_20 = Vector3.New(-0.7, -0.54, -6.3)

				var_146_16.localPosition = Vector3.Lerp(arg_143_1.var_.moveOldPos1097ui_story, var_146_20, var_146_19)

				local var_146_21 = manager.ui.mainCamera.transform.position - var_146_16.position

				var_146_16.forward = Vector3.New(var_146_21.x, var_146_21.y, var_146_21.z)

				local var_146_22 = var_146_16.localEulerAngles

				var_146_22.z = 0
				var_146_22.x = 0
				var_146_16.localEulerAngles = var_146_22
			end

			if arg_143_1.time_ >= var_146_17 + var_146_18 and arg_143_1.time_ < var_146_17 + var_146_18 + arg_146_0 then
				var_146_16.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_146_23 = manager.ui.mainCamera.transform.position - var_146_16.position

				var_146_16.forward = Vector3.New(var_146_23.x, var_146_23.y, var_146_23.z)

				local var_146_24 = var_146_16.localEulerAngles

				var_146_24.z = 0
				var_146_24.x = 0
				var_146_16.localEulerAngles = var_146_24
			end

			local var_146_25 = arg_143_1.actors_["1097ui_story"]
			local var_146_26 = 0

			if var_146_26 < arg_143_1.time_ and arg_143_1.time_ <= var_146_26 + arg_146_0 and arg_143_1.var_.characterEffect1097ui_story == nil then
				arg_143_1.var_.characterEffect1097ui_story = var_146_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_146_27 = 0.2

			if var_146_26 <= arg_143_1.time_ and arg_143_1.time_ < var_146_26 + var_146_27 then
				local var_146_28 = (arg_143_1.time_ - var_146_26) / var_146_27

				if arg_143_1.var_.characterEffect1097ui_story then
					local var_146_29 = Mathf.Lerp(0, 0.5, var_146_28)

					arg_143_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_143_1.var_.characterEffect1097ui_story.fillRatio = var_146_29
				end
			end

			if arg_143_1.time_ >= var_146_26 + var_146_27 and arg_143_1.time_ < var_146_26 + var_146_27 + arg_146_0 and arg_143_1.var_.characterEffect1097ui_story then
				local var_146_30 = 0.5

				arg_143_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_143_1.var_.characterEffect1097ui_story.fillRatio = var_146_30
			end

			local var_146_31 = 0
			local var_146_32 = 0.3

			if var_146_31 < arg_143_1.time_ and arg_143_1.time_ <= var_146_31 + arg_146_0 then
				arg_143_1.talkMaxDuration = 0
				arg_143_1.dialogCg_.alpha = 1

				arg_143_1.dialog_:SetActive(true)
				SetActive(arg_143_1.leftNameGo_, true)

				local var_146_33 = arg_143_1:FormatText(StoryNameCfg[6].name)

				arg_143_1.leftNameTxt_.text = var_146_33

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_143_1.leftNameTxt_.transform)

				arg_143_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_143_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_143_1:RecordName(arg_143_1.leftNameTxt_.text)
				SetActive(arg_143_1.iconTrs_.gameObject, false)
				arg_143_1.callingController_:SetSelectedState("normal")

				local var_146_34 = arg_143_1:GetWordFromCfg(113191034)
				local var_146_35 = arg_143_1:FormatText(var_146_34.content)

				arg_143_1.text_.text = var_146_35

				LuaForUtil.ClearLinePrefixSymbol(arg_143_1.text_)

				local var_146_36 = 12
				local var_146_37 = utf8.len(var_146_35)
				local var_146_38 = var_146_36 <= 0 and var_146_32 or var_146_32 * (var_146_37 / var_146_36)

				if var_146_38 > 0 and var_146_32 < var_146_38 then
					arg_143_1.talkMaxDuration = var_146_38

					if var_146_38 + var_146_31 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_38 + var_146_31
					end
				end

				arg_143_1.text_.text = var_146_35
				arg_143_1.typewritter.percent = 0

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191034", "story_v_out_113191.awb") ~= 0 then
					local var_146_39 = manager.audio:GetVoiceLength("story_v_out_113191", "113191034", "story_v_out_113191.awb") / 1000

					if var_146_39 + var_146_31 > arg_143_1.duration_ then
						arg_143_1.duration_ = var_146_39 + var_146_31
					end

					if var_146_34.prefab_name ~= "" and arg_143_1.actors_[var_146_34.prefab_name] ~= nil then
						local var_146_40 = LuaForUtil.PlayVoiceWithCriLipsync(arg_143_1.actors_[var_146_34.prefab_name].transform, "story_v_out_113191", "113191034", "story_v_out_113191.awb")

						arg_143_1:RecordAudio("113191034", var_146_40)
						arg_143_1:RecordAudio("113191034", var_146_40)
					else
						arg_143_1:AudioAction("play", "voice", "story_v_out_113191", "113191034", "story_v_out_113191.awb")
					end

					arg_143_1:RecordHistoryTalkVoice("story_v_out_113191", "113191034", "story_v_out_113191.awb")
				end

				arg_143_1:RecordContent(arg_143_1.text_.text)
			end

			local var_146_41 = math.max(var_146_32, arg_143_1.talkMaxDuration)

			if var_146_31 <= arg_143_1.time_ and arg_143_1.time_ < var_146_31 + var_146_41 then
				arg_143_1.typewritter.percent = (arg_143_1.time_ - var_146_31) / var_146_41

				arg_143_1.typewritter:SetDirty()
			end

			if arg_143_1.time_ >= var_146_31 + var_146_41 and arg_143_1.time_ < var_146_31 + var_146_41 + arg_146_0 then
				arg_143_1.typewritter.percent = 1

				arg_143_1.typewritter:SetDirty()
				arg_143_1:ShowNextGo(true)
			end
		end
	end,
	Play113191035 = function(arg_147_0, arg_147_1)
		arg_147_1.time_ = 0
		arg_147_1.frameCnt_ = 0
		arg_147_1.state_ = "playing"
		arg_147_1.curTalkId_ = 113191035
		arg_147_1.duration_ = 4.3

		local var_147_0 = {
			ja = 1.999999999999,
			ko = 4.3,
			zh = 3.7,
			en = 4.233
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
				arg_147_0:Play113191036(arg_147_1)
			end
		end

		function arg_147_1.onSingleLineUpdate_(arg_150_0)
			local var_150_0 = 0

			if var_150_0 < arg_147_1.time_ and arg_147_1.time_ <= var_150_0 + arg_150_0 then
				arg_147_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action7_2")
			end

			local var_150_1 = arg_147_1.actors_["1097ui_story"]
			local var_150_2 = 0

			if var_150_2 < arg_147_1.time_ and arg_147_1.time_ <= var_150_2 + arg_150_0 and arg_147_1.var_.characterEffect1097ui_story == nil then
				arg_147_1.var_.characterEffect1097ui_story = var_150_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_150_3 = 0.2

			if var_150_2 <= arg_147_1.time_ and arg_147_1.time_ < var_150_2 + var_150_3 then
				local var_150_4 = (arg_147_1.time_ - var_150_2) / var_150_3

				if arg_147_1.var_.characterEffect1097ui_story then
					arg_147_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_147_1.time_ >= var_150_2 + var_150_3 and arg_147_1.time_ < var_150_2 + var_150_3 + arg_150_0 and arg_147_1.var_.characterEffect1097ui_story then
				arg_147_1.var_.characterEffect1097ui_story.fillFlat = false
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

			if var_150_11 < arg_147_1.time_ and arg_147_1.time_ <= var_150_11 + arg_150_0 then
				arg_147_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_150_12 = 0
			local var_150_13 = 0.3

			if var_150_12 < arg_147_1.time_ and arg_147_1.time_ <= var_150_12 + arg_150_0 then
				arg_147_1.talkMaxDuration = 0
				arg_147_1.dialogCg_.alpha = 1

				arg_147_1.dialog_:SetActive(true)
				SetActive(arg_147_1.leftNameGo_, true)

				local var_150_14 = arg_147_1:FormatText(StoryNameCfg[216].name)

				arg_147_1.leftNameTxt_.text = var_150_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_147_1.leftNameTxt_.transform)

				arg_147_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_147_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_147_1:RecordName(arg_147_1.leftNameTxt_.text)
				SetActive(arg_147_1.iconTrs_.gameObject, false)
				arg_147_1.callingController_:SetSelectedState("normal")

				local var_150_15 = arg_147_1:GetWordFromCfg(113191035)
				local var_150_16 = arg_147_1:FormatText(var_150_15.content)

				arg_147_1.text_.text = var_150_16

				LuaForUtil.ClearLinePrefixSymbol(arg_147_1.text_)

				local var_150_17 = 12
				local var_150_18 = utf8.len(var_150_16)
				local var_150_19 = var_150_17 <= 0 and var_150_13 or var_150_13 * (var_150_18 / var_150_17)

				if var_150_19 > 0 and var_150_13 < var_150_19 then
					arg_147_1.talkMaxDuration = var_150_19

					if var_150_19 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_19 + var_150_12
					end
				end

				arg_147_1.text_.text = var_150_16
				arg_147_1.typewritter.percent = 0

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191035", "story_v_out_113191.awb") ~= 0 then
					local var_150_20 = manager.audio:GetVoiceLength("story_v_out_113191", "113191035", "story_v_out_113191.awb") / 1000

					if var_150_20 + var_150_12 > arg_147_1.duration_ then
						arg_147_1.duration_ = var_150_20 + var_150_12
					end

					if var_150_15.prefab_name ~= "" and arg_147_1.actors_[var_150_15.prefab_name] ~= nil then
						local var_150_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_147_1.actors_[var_150_15.prefab_name].transform, "story_v_out_113191", "113191035", "story_v_out_113191.awb")

						arg_147_1:RecordAudio("113191035", var_150_21)
						arg_147_1:RecordAudio("113191035", var_150_21)
					else
						arg_147_1:AudioAction("play", "voice", "story_v_out_113191", "113191035", "story_v_out_113191.awb")
					end

					arg_147_1:RecordHistoryTalkVoice("story_v_out_113191", "113191035", "story_v_out_113191.awb")
				end

				arg_147_1:RecordContent(arg_147_1.text_.text)
			end

			local var_150_22 = math.max(var_150_13, arg_147_1.talkMaxDuration)

			if var_150_12 <= arg_147_1.time_ and arg_147_1.time_ < var_150_12 + var_150_22 then
				arg_147_1.typewritter.percent = (arg_147_1.time_ - var_150_12) / var_150_22

				arg_147_1.typewritter:SetDirty()
			end

			if arg_147_1.time_ >= var_150_12 + var_150_22 and arg_147_1.time_ < var_150_12 + var_150_22 + arg_150_0 then
				arg_147_1.typewritter.percent = 1

				arg_147_1.typewritter:SetDirty()
				arg_147_1:ShowNextGo(true)
			end
		end
	end,
	Play113191036 = function(arg_151_0, arg_151_1)
		arg_151_1.time_ = 0
		arg_151_1.frameCnt_ = 0
		arg_151_1.state_ = "playing"
		arg_151_1.curTalkId_ = 113191036
		arg_151_1.duration_ = 5

		SetActive(arg_151_1.tipsGo_, false)

		function arg_151_1.onSingleLineFinish_()
			arg_151_1.onSingleLineUpdate_ = nil
			arg_151_1.onSingleLineFinish_ = nil
			arg_151_1.state_ = "waiting"
		end

		function arg_151_1.playNext_(arg_153_0)
			if arg_153_0 == 1 then
				arg_151_0:Play113191037(arg_151_1)
			end
		end

		function arg_151_1.onSingleLineUpdate_(arg_154_0)
			local var_154_0 = arg_151_1.actors_["1097ui_story"].transform
			local var_154_1 = 0

			if var_154_1 < arg_151_1.time_ and arg_151_1.time_ <= var_154_1 + arg_154_0 then
				arg_151_1.var_.moveOldPos1097ui_story = var_154_0.localPosition
			end

			local var_154_2 = 0.001

			if var_154_1 <= arg_151_1.time_ and arg_151_1.time_ < var_154_1 + var_154_2 then
				local var_154_3 = (arg_151_1.time_ - var_154_1) / var_154_2
				local var_154_4 = Vector3.New(0, 100, 0)

				var_154_0.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1097ui_story, var_154_4, var_154_3)

				local var_154_5 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_5.x, var_154_5.y, var_154_5.z)

				local var_154_6 = var_154_0.localEulerAngles

				var_154_6.z = 0
				var_154_6.x = 0
				var_154_0.localEulerAngles = var_154_6
			end

			if arg_151_1.time_ >= var_154_1 + var_154_2 and arg_151_1.time_ < var_154_1 + var_154_2 + arg_154_0 then
				var_154_0.localPosition = Vector3.New(0, 100, 0)

				local var_154_7 = manager.ui.mainCamera.transform.position - var_154_0.position

				var_154_0.forward = Vector3.New(var_154_7.x, var_154_7.y, var_154_7.z)

				local var_154_8 = var_154_0.localEulerAngles

				var_154_8.z = 0
				var_154_8.x = 0
				var_154_0.localEulerAngles = var_154_8
			end

			local var_154_9 = arg_151_1.actors_["1084ui_story"].transform
			local var_154_10 = 0

			if var_154_10 < arg_151_1.time_ and arg_151_1.time_ <= var_154_10 + arg_154_0 then
				arg_151_1.var_.moveOldPos1084ui_story = var_154_9.localPosition
			end

			local var_154_11 = 0.001

			if var_154_10 <= arg_151_1.time_ and arg_151_1.time_ < var_154_10 + var_154_11 then
				local var_154_12 = (arg_151_1.time_ - var_154_10) / var_154_11
				local var_154_13 = Vector3.New(0, 100, 0)

				var_154_9.localPosition = Vector3.Lerp(arg_151_1.var_.moveOldPos1084ui_story, var_154_13, var_154_12)

				local var_154_14 = manager.ui.mainCamera.transform.position - var_154_9.position

				var_154_9.forward = Vector3.New(var_154_14.x, var_154_14.y, var_154_14.z)

				local var_154_15 = var_154_9.localEulerAngles

				var_154_15.z = 0
				var_154_15.x = 0
				var_154_9.localEulerAngles = var_154_15
			end

			if arg_151_1.time_ >= var_154_10 + var_154_11 and arg_151_1.time_ < var_154_10 + var_154_11 + arg_154_0 then
				var_154_9.localPosition = Vector3.New(0, 100, 0)

				local var_154_16 = manager.ui.mainCamera.transform.position - var_154_9.position

				var_154_9.forward = Vector3.New(var_154_16.x, var_154_16.y, var_154_16.z)

				local var_154_17 = var_154_9.localEulerAngles

				var_154_17.z = 0
				var_154_17.x = 0
				var_154_9.localEulerAngles = var_154_17
			end

			local var_154_18 = 0
			local var_154_19 = 0.75

			if var_154_18 < arg_151_1.time_ and arg_151_1.time_ <= var_154_18 + arg_154_0 then
				local var_154_20 = "play"
				local var_154_21 = "effect"

				arg_151_1:AudioAction(var_154_20, var_154_21, "se_story_10", "se_story_10_light", "")
			end

			local var_154_22 = 0
			local var_154_23 = 0.75

			if var_154_22 < arg_151_1.time_ and arg_151_1.time_ <= var_154_22 + arg_154_0 then
				arg_151_1.talkMaxDuration = 0
				arg_151_1.dialogCg_.alpha = 1

				arg_151_1.dialog_:SetActive(true)
				SetActive(arg_151_1.leftNameGo_, false)

				arg_151_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_151_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_151_1:RecordName(arg_151_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_151_1.iconTrs_.gameObject, false)
				arg_151_1.callingController_:SetSelectedState("normal")

				local var_154_24 = arg_151_1:GetWordFromCfg(113191036)
				local var_154_25 = arg_151_1:FormatText(var_154_24.content)

				arg_151_1.text_.text = var_154_25

				LuaForUtil.ClearLinePrefixSymbol(arg_151_1.text_)

				local var_154_26 = 30
				local var_154_27 = utf8.len(var_154_25)
				local var_154_28 = var_154_26 <= 0 and var_154_23 or var_154_23 * (var_154_27 / var_154_26)

				if var_154_28 > 0 and var_154_23 < var_154_28 then
					arg_151_1.talkMaxDuration = var_154_28

					if var_154_28 + var_154_22 > arg_151_1.duration_ then
						arg_151_1.duration_ = var_154_28 + var_154_22
					end
				end

				arg_151_1.text_.text = var_154_25
				arg_151_1.typewritter.percent = 0

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(false)
				arg_151_1:RecordContent(arg_151_1.text_.text)
			end

			local var_154_29 = math.max(var_154_23, arg_151_1.talkMaxDuration)

			if var_154_22 <= arg_151_1.time_ and arg_151_1.time_ < var_154_22 + var_154_29 then
				arg_151_1.typewritter.percent = (arg_151_1.time_ - var_154_22) / var_154_29

				arg_151_1.typewritter:SetDirty()
			end

			if arg_151_1.time_ >= var_154_22 + var_154_29 and arg_151_1.time_ < var_154_22 + var_154_29 + arg_154_0 then
				arg_151_1.typewritter.percent = 1

				arg_151_1.typewritter:SetDirty()
				arg_151_1:ShowNextGo(true)
			end
		end
	end,
	Play113191037 = function(arg_155_0, arg_155_1)
		arg_155_1.time_ = 0
		arg_155_1.frameCnt_ = 0
		arg_155_1.state_ = "playing"
		arg_155_1.curTalkId_ = 113191037
		arg_155_1.duration_ = 5.533

		local var_155_0 = {
			ja = 5.533,
			ko = 4.066,
			zh = 2.7,
			en = 2.066
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
				arg_155_0:Play113191038(arg_155_1)
			end
		end

		function arg_155_1.onSingleLineUpdate_(arg_158_0)
			local var_158_0 = arg_155_1.actors_["1097ui_story"].transform
			local var_158_1 = 0

			if var_158_1 < arg_155_1.time_ and arg_155_1.time_ <= var_158_1 + arg_158_0 then
				arg_155_1.var_.moveOldPos1097ui_story = var_158_0.localPosition
			end

			local var_158_2 = 0.001

			if var_158_1 <= arg_155_1.time_ and arg_155_1.time_ < var_158_1 + var_158_2 then
				local var_158_3 = (arg_155_1.time_ - var_158_1) / var_158_2
				local var_158_4 = Vector3.New(-0.7, -0.54, -6.3)

				var_158_0.localPosition = Vector3.Lerp(arg_155_1.var_.moveOldPos1097ui_story, var_158_4, var_158_3)

				local var_158_5 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_5.x, var_158_5.y, var_158_5.z)

				local var_158_6 = var_158_0.localEulerAngles

				var_158_6.z = 0
				var_158_6.x = 0
				var_158_0.localEulerAngles = var_158_6
			end

			if arg_155_1.time_ >= var_158_1 + var_158_2 and arg_155_1.time_ < var_158_1 + var_158_2 + arg_158_0 then
				var_158_0.localPosition = Vector3.New(-0.7, -0.54, -6.3)

				local var_158_7 = manager.ui.mainCamera.transform.position - var_158_0.position

				var_158_0.forward = Vector3.New(var_158_7.x, var_158_7.y, var_158_7.z)

				local var_158_8 = var_158_0.localEulerAngles

				var_158_8.z = 0
				var_158_8.x = 0
				var_158_0.localEulerAngles = var_158_8
			end

			local var_158_9 = 0

			if var_158_9 < arg_155_1.time_ and arg_155_1.time_ <= var_158_9 + arg_158_0 then
				arg_155_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action1_1")
			end

			local var_158_10 = 0

			if var_158_10 < arg_155_1.time_ and arg_155_1.time_ <= var_158_10 + arg_158_0 then
				arg_155_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_158_11 = arg_155_1.actors_["1097ui_story"]
			local var_158_12 = 0

			if var_158_12 < arg_155_1.time_ and arg_155_1.time_ <= var_158_12 + arg_158_0 and arg_155_1.var_.characterEffect1097ui_story == nil then
				arg_155_1.var_.characterEffect1097ui_story = var_158_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_158_13 = 0.2

			if var_158_12 <= arg_155_1.time_ and arg_155_1.time_ < var_158_12 + var_158_13 then
				local var_158_14 = (arg_155_1.time_ - var_158_12) / var_158_13

				if arg_155_1.var_.characterEffect1097ui_story then
					arg_155_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_155_1.time_ >= var_158_12 + var_158_13 and arg_155_1.time_ < var_158_12 + var_158_13 + arg_158_0 and arg_155_1.var_.characterEffect1097ui_story then
				arg_155_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_158_15 = 0
			local var_158_16 = 0.25

			if var_158_15 < arg_155_1.time_ and arg_155_1.time_ <= var_158_15 + arg_158_0 then
				arg_155_1.talkMaxDuration = 0
				arg_155_1.dialogCg_.alpha = 1

				arg_155_1.dialog_:SetActive(true)
				SetActive(arg_155_1.leftNameGo_, true)

				local var_158_17 = arg_155_1:FormatText(StoryNameCfg[216].name)

				arg_155_1.leftNameTxt_.text = var_158_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_155_1.leftNameTxt_.transform)

				arg_155_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_155_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_155_1:RecordName(arg_155_1.leftNameTxt_.text)
				SetActive(arg_155_1.iconTrs_.gameObject, false)
				arg_155_1.callingController_:SetSelectedState("normal")

				local var_158_18 = arg_155_1:GetWordFromCfg(113191037)
				local var_158_19 = arg_155_1:FormatText(var_158_18.content)

				arg_155_1.text_.text = var_158_19

				LuaForUtil.ClearLinePrefixSymbol(arg_155_1.text_)

				local var_158_20 = 10
				local var_158_21 = utf8.len(var_158_19)
				local var_158_22 = var_158_20 <= 0 and var_158_16 or var_158_16 * (var_158_21 / var_158_20)

				if var_158_22 > 0 and var_158_16 < var_158_22 then
					arg_155_1.talkMaxDuration = var_158_22

					if var_158_22 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_22 + var_158_15
					end
				end

				arg_155_1.text_.text = var_158_19
				arg_155_1.typewritter.percent = 0

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191037", "story_v_out_113191.awb") ~= 0 then
					local var_158_23 = manager.audio:GetVoiceLength("story_v_out_113191", "113191037", "story_v_out_113191.awb") / 1000

					if var_158_23 + var_158_15 > arg_155_1.duration_ then
						arg_155_1.duration_ = var_158_23 + var_158_15
					end

					if var_158_18.prefab_name ~= "" and arg_155_1.actors_[var_158_18.prefab_name] ~= nil then
						local var_158_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_155_1.actors_[var_158_18.prefab_name].transform, "story_v_out_113191", "113191037", "story_v_out_113191.awb")

						arg_155_1:RecordAudio("113191037", var_158_24)
						arg_155_1:RecordAudio("113191037", var_158_24)
					else
						arg_155_1:AudioAction("play", "voice", "story_v_out_113191", "113191037", "story_v_out_113191.awb")
					end

					arg_155_1:RecordHistoryTalkVoice("story_v_out_113191", "113191037", "story_v_out_113191.awb")
				end

				arg_155_1:RecordContent(arg_155_1.text_.text)
			end

			local var_158_25 = math.max(var_158_16, arg_155_1.talkMaxDuration)

			if var_158_15 <= arg_155_1.time_ and arg_155_1.time_ < var_158_15 + var_158_25 then
				arg_155_1.typewritter.percent = (arg_155_1.time_ - var_158_15) / var_158_25

				arg_155_1.typewritter:SetDirty()
			end

			if arg_155_1.time_ >= var_158_15 + var_158_25 and arg_155_1.time_ < var_158_15 + var_158_25 + arg_158_0 then
				arg_155_1.typewritter.percent = 1

				arg_155_1.typewritter:SetDirty()
				arg_155_1:ShowNextGo(true)
			end
		end
	end,
	Play113191038 = function(arg_159_0, arg_159_1)
		arg_159_1.time_ = 0
		arg_159_1.frameCnt_ = 0
		arg_159_1.state_ = "playing"
		arg_159_1.curTalkId_ = 113191038
		arg_159_1.duration_ = 2.566

		local var_159_0 = {
			ja = 2.566,
			ko = 1.999999999999,
			zh = 2.4,
			en = 1.999999999999
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
				arg_159_0:Play113191039(arg_159_1)
			end
		end

		function arg_159_1.onSingleLineUpdate_(arg_162_0)
			local var_162_0 = arg_159_1.actors_["1097ui_story"]
			local var_162_1 = 0

			if var_162_1 < arg_159_1.time_ and arg_159_1.time_ <= var_162_1 + arg_162_0 and arg_159_1.var_.characterEffect1097ui_story == nil then
				arg_159_1.var_.characterEffect1097ui_story = var_162_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_2 = 0.2

			if var_162_1 <= arg_159_1.time_ and arg_159_1.time_ < var_162_1 + var_162_2 then
				local var_162_3 = (arg_159_1.time_ - var_162_1) / var_162_2

				if arg_159_1.var_.characterEffect1097ui_story then
					local var_162_4 = Mathf.Lerp(0, 0.5, var_162_3)

					arg_159_1.var_.characterEffect1097ui_story.fillFlat = true
					arg_159_1.var_.characterEffect1097ui_story.fillRatio = var_162_4
				end
			end

			if arg_159_1.time_ >= var_162_1 + var_162_2 and arg_159_1.time_ < var_162_1 + var_162_2 + arg_162_0 and arg_159_1.var_.characterEffect1097ui_story then
				local var_162_5 = 0.5

				arg_159_1.var_.characterEffect1097ui_story.fillFlat = true
				arg_159_1.var_.characterEffect1097ui_story.fillRatio = var_162_5
			end

			local var_162_6 = arg_159_1.actors_["1084ui_story"].transform
			local var_162_7 = 0

			if var_162_7 < arg_159_1.time_ and arg_159_1.time_ <= var_162_7 + arg_162_0 then
				arg_159_1.var_.moveOldPos1084ui_story = var_162_6.localPosition
			end

			local var_162_8 = 0.001

			if var_162_7 <= arg_159_1.time_ and arg_159_1.time_ < var_162_7 + var_162_8 then
				local var_162_9 = (arg_159_1.time_ - var_162_7) / var_162_8
				local var_162_10 = Vector3.New(0.7, -0.97, -6)

				var_162_6.localPosition = Vector3.Lerp(arg_159_1.var_.moveOldPos1084ui_story, var_162_10, var_162_9)

				local var_162_11 = manager.ui.mainCamera.transform.position - var_162_6.position

				var_162_6.forward = Vector3.New(var_162_11.x, var_162_11.y, var_162_11.z)

				local var_162_12 = var_162_6.localEulerAngles

				var_162_12.z = 0
				var_162_12.x = 0
				var_162_6.localEulerAngles = var_162_12
			end

			if arg_159_1.time_ >= var_162_7 + var_162_8 and arg_159_1.time_ < var_162_7 + var_162_8 + arg_162_0 then
				var_162_6.localPosition = Vector3.New(0.7, -0.97, -6)

				local var_162_13 = manager.ui.mainCamera.transform.position - var_162_6.position

				var_162_6.forward = Vector3.New(var_162_13.x, var_162_13.y, var_162_13.z)

				local var_162_14 = var_162_6.localEulerAngles

				var_162_14.z = 0
				var_162_14.x = 0
				var_162_6.localEulerAngles = var_162_14
			end

			local var_162_15 = 0

			if var_162_15 < arg_159_1.time_ and arg_159_1.time_ <= var_162_15 + arg_162_0 then
				arg_159_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_162_16 = 0

			if var_162_16 < arg_159_1.time_ and arg_159_1.time_ <= var_162_16 + arg_162_0 then
				arg_159_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_162_17 = arg_159_1.actors_["1084ui_story"]
			local var_162_18 = 0

			if var_162_18 < arg_159_1.time_ and arg_159_1.time_ <= var_162_18 + arg_162_0 and arg_159_1.var_.characterEffect1084ui_story == nil then
				arg_159_1.var_.characterEffect1084ui_story = var_162_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_162_19 = 0.2

			if var_162_18 <= arg_159_1.time_ and arg_159_1.time_ < var_162_18 + var_162_19 then
				local var_162_20 = (arg_159_1.time_ - var_162_18) / var_162_19

				if arg_159_1.var_.characterEffect1084ui_story then
					arg_159_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_159_1.time_ >= var_162_18 + var_162_19 and arg_159_1.time_ < var_162_18 + var_162_19 + arg_162_0 and arg_159_1.var_.characterEffect1084ui_story then
				arg_159_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_162_21 = 0
			local var_162_22 = 0.225

			if var_162_21 < arg_159_1.time_ and arg_159_1.time_ <= var_162_21 + arg_162_0 then
				arg_159_1.talkMaxDuration = 0
				arg_159_1.dialogCg_.alpha = 1

				arg_159_1.dialog_:SetActive(true)
				SetActive(arg_159_1.leftNameGo_, true)

				local var_162_23 = arg_159_1:FormatText(StoryNameCfg[6].name)

				arg_159_1.leftNameTxt_.text = var_162_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_159_1.leftNameTxt_.transform)

				arg_159_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_159_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_159_1:RecordName(arg_159_1.leftNameTxt_.text)
				SetActive(arg_159_1.iconTrs_.gameObject, false)
				arg_159_1.callingController_:SetSelectedState("normal")

				local var_162_24 = arg_159_1:GetWordFromCfg(113191038)
				local var_162_25 = arg_159_1:FormatText(var_162_24.content)

				arg_159_1.text_.text = var_162_25

				LuaForUtil.ClearLinePrefixSymbol(arg_159_1.text_)

				local var_162_26 = 9
				local var_162_27 = utf8.len(var_162_25)
				local var_162_28 = var_162_26 <= 0 and var_162_22 or var_162_22 * (var_162_27 / var_162_26)

				if var_162_28 > 0 and var_162_22 < var_162_28 then
					arg_159_1.talkMaxDuration = var_162_28

					if var_162_28 + var_162_21 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_28 + var_162_21
					end
				end

				arg_159_1.text_.text = var_162_25
				arg_159_1.typewritter.percent = 0

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191038", "story_v_out_113191.awb") ~= 0 then
					local var_162_29 = manager.audio:GetVoiceLength("story_v_out_113191", "113191038", "story_v_out_113191.awb") / 1000

					if var_162_29 + var_162_21 > arg_159_1.duration_ then
						arg_159_1.duration_ = var_162_29 + var_162_21
					end

					if var_162_24.prefab_name ~= "" and arg_159_1.actors_[var_162_24.prefab_name] ~= nil then
						local var_162_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_159_1.actors_[var_162_24.prefab_name].transform, "story_v_out_113191", "113191038", "story_v_out_113191.awb")

						arg_159_1:RecordAudio("113191038", var_162_30)
						arg_159_1:RecordAudio("113191038", var_162_30)
					else
						arg_159_1:AudioAction("play", "voice", "story_v_out_113191", "113191038", "story_v_out_113191.awb")
					end

					arg_159_1:RecordHistoryTalkVoice("story_v_out_113191", "113191038", "story_v_out_113191.awb")
				end

				arg_159_1:RecordContent(arg_159_1.text_.text)
			end

			local var_162_31 = math.max(var_162_22, arg_159_1.talkMaxDuration)

			if var_162_21 <= arg_159_1.time_ and arg_159_1.time_ < var_162_21 + var_162_31 then
				arg_159_1.typewritter.percent = (arg_159_1.time_ - var_162_21) / var_162_31

				arg_159_1.typewritter:SetDirty()
			end

			if arg_159_1.time_ >= var_162_21 + var_162_31 and arg_159_1.time_ < var_162_21 + var_162_31 + arg_162_0 then
				arg_159_1.typewritter.percent = 1

				arg_159_1.typewritter:SetDirty()
				arg_159_1:ShowNextGo(true)
			end
		end
	end,
	Play113191039 = function(arg_163_0, arg_163_1)
		arg_163_1.time_ = 0
		arg_163_1.frameCnt_ = 0
		arg_163_1.state_ = "playing"
		arg_163_1.curTalkId_ = 113191039
		arg_163_1.duration_ = 1.999999999999

		SetActive(arg_163_1.tipsGo_, false)

		function arg_163_1.onSingleLineFinish_()
			arg_163_1.onSingleLineUpdate_ = nil
			arg_163_1.onSingleLineFinish_ = nil
			arg_163_1.state_ = "waiting"
		end

		function arg_163_1.playNext_(arg_165_0)
			if arg_165_0 == 1 then
				arg_163_0:Play113191040(arg_163_1)
			end
		end

		function arg_163_1.onSingleLineUpdate_(arg_166_0)
			local var_166_0 = arg_163_1.actors_["1038ui_story"].transform
			local var_166_1 = 0

			if var_166_1 < arg_163_1.time_ and arg_163_1.time_ <= var_166_1 + arg_166_0 then
				arg_163_1.var_.moveOldPos1038ui_story = var_166_0.localPosition
			end

			local var_166_2 = 0.001

			if var_166_1 <= arg_163_1.time_ and arg_163_1.time_ < var_166_1 + var_166_2 then
				local var_166_3 = (arg_163_1.time_ - var_166_1) / var_166_2
				local var_166_4 = Vector3.New(0, -1.11, -5.9)

				var_166_0.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1038ui_story, var_166_4, var_166_3)

				local var_166_5 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_5.x, var_166_5.y, var_166_5.z)

				local var_166_6 = var_166_0.localEulerAngles

				var_166_6.z = 0
				var_166_6.x = 0
				var_166_0.localEulerAngles = var_166_6
			end

			if arg_163_1.time_ >= var_166_1 + var_166_2 and arg_163_1.time_ < var_166_1 + var_166_2 + arg_166_0 then
				var_166_0.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_166_7 = manager.ui.mainCamera.transform.position - var_166_0.position

				var_166_0.forward = Vector3.New(var_166_7.x, var_166_7.y, var_166_7.z)

				local var_166_8 = var_166_0.localEulerAngles

				var_166_8.z = 0
				var_166_8.x = 0
				var_166_0.localEulerAngles = var_166_8
			end

			local var_166_9 = arg_163_1.actors_["1097ui_story"].transform
			local var_166_10 = 0

			if var_166_10 < arg_163_1.time_ and arg_163_1.time_ <= var_166_10 + arg_166_0 then
				arg_163_1.var_.moveOldPos1097ui_story = var_166_9.localPosition
			end

			local var_166_11 = 0.001

			if var_166_10 <= arg_163_1.time_ and arg_163_1.time_ < var_166_10 + var_166_11 then
				local var_166_12 = (arg_163_1.time_ - var_166_10) / var_166_11
				local var_166_13 = Vector3.New(0, 100, 0)

				var_166_9.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1097ui_story, var_166_13, var_166_12)

				local var_166_14 = manager.ui.mainCamera.transform.position - var_166_9.position

				var_166_9.forward = Vector3.New(var_166_14.x, var_166_14.y, var_166_14.z)

				local var_166_15 = var_166_9.localEulerAngles

				var_166_15.z = 0
				var_166_15.x = 0
				var_166_9.localEulerAngles = var_166_15
			end

			if arg_163_1.time_ >= var_166_10 + var_166_11 and arg_163_1.time_ < var_166_10 + var_166_11 + arg_166_0 then
				var_166_9.localPosition = Vector3.New(0, 100, 0)

				local var_166_16 = manager.ui.mainCamera.transform.position - var_166_9.position

				var_166_9.forward = Vector3.New(var_166_16.x, var_166_16.y, var_166_16.z)

				local var_166_17 = var_166_9.localEulerAngles

				var_166_17.z = 0
				var_166_17.x = 0
				var_166_9.localEulerAngles = var_166_17
			end

			local var_166_18 = arg_163_1.actors_["1084ui_story"].transform
			local var_166_19 = 0

			if var_166_19 < arg_163_1.time_ and arg_163_1.time_ <= var_166_19 + arg_166_0 then
				arg_163_1.var_.moveOldPos1084ui_story = var_166_18.localPosition
			end

			local var_166_20 = 0.001

			if var_166_19 <= arg_163_1.time_ and arg_163_1.time_ < var_166_19 + var_166_20 then
				local var_166_21 = (arg_163_1.time_ - var_166_19) / var_166_20
				local var_166_22 = Vector3.New(0, 100, 0)

				var_166_18.localPosition = Vector3.Lerp(arg_163_1.var_.moveOldPos1084ui_story, var_166_22, var_166_21)

				local var_166_23 = manager.ui.mainCamera.transform.position - var_166_18.position

				var_166_18.forward = Vector3.New(var_166_23.x, var_166_23.y, var_166_23.z)

				local var_166_24 = var_166_18.localEulerAngles

				var_166_24.z = 0
				var_166_24.x = 0
				var_166_18.localEulerAngles = var_166_24
			end

			if arg_163_1.time_ >= var_166_19 + var_166_20 and arg_163_1.time_ < var_166_19 + var_166_20 + arg_166_0 then
				var_166_18.localPosition = Vector3.New(0, 100, 0)

				local var_166_25 = manager.ui.mainCamera.transform.position - var_166_18.position

				var_166_18.forward = Vector3.New(var_166_25.x, var_166_25.y, var_166_25.z)

				local var_166_26 = var_166_18.localEulerAngles

				var_166_26.z = 0
				var_166_26.x = 0
				var_166_18.localEulerAngles = var_166_26
			end

			local var_166_27 = 0

			if var_166_27 < arg_163_1.time_ and arg_163_1.time_ <= var_166_27 + arg_166_0 then
				arg_163_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_166_28 = 0

			if var_166_28 < arg_163_1.time_ and arg_163_1.time_ <= var_166_28 + arg_166_0 then
				arg_163_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3101cva")
			end

			local var_166_29 = arg_163_1.actors_["1038ui_story"]
			local var_166_30 = 0

			if var_166_30 < arg_163_1.time_ and arg_163_1.time_ <= var_166_30 + arg_166_0 and arg_163_1.var_.characterEffect1038ui_story == nil then
				arg_163_1.var_.characterEffect1038ui_story = var_166_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_166_31 = 0.2

			if var_166_30 <= arg_163_1.time_ and arg_163_1.time_ < var_166_30 + var_166_31 then
				local var_166_32 = (arg_163_1.time_ - var_166_30) / var_166_31

				if arg_163_1.var_.characterEffect1038ui_story then
					arg_163_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_163_1.time_ >= var_166_30 + var_166_31 and arg_163_1.time_ < var_166_30 + var_166_31 + arg_166_0 and arg_163_1.var_.characterEffect1038ui_story then
				arg_163_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_166_33 = 0
			local var_166_34 = 0.05

			if var_166_33 < arg_163_1.time_ and arg_163_1.time_ <= var_166_33 + arg_166_0 then
				arg_163_1.talkMaxDuration = 0
				arg_163_1.dialogCg_.alpha = 1

				arg_163_1.dialog_:SetActive(true)
				SetActive(arg_163_1.leftNameGo_, true)

				local var_166_35 = arg_163_1:FormatText(StoryNameCfg[94].name)

				arg_163_1.leftNameTxt_.text = var_166_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_163_1.leftNameTxt_.transform)

				arg_163_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_163_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_163_1:RecordName(arg_163_1.leftNameTxt_.text)
				SetActive(arg_163_1.iconTrs_.gameObject, false)
				arg_163_1.callingController_:SetSelectedState("normal")

				local var_166_36 = arg_163_1:GetWordFromCfg(113191039)
				local var_166_37 = arg_163_1:FormatText(var_166_36.content)

				arg_163_1.text_.text = var_166_37

				LuaForUtil.ClearLinePrefixSymbol(arg_163_1.text_)

				local var_166_38 = 2
				local var_166_39 = utf8.len(var_166_37)
				local var_166_40 = var_166_38 <= 0 and var_166_34 or var_166_34 * (var_166_39 / var_166_38)

				if var_166_40 > 0 and var_166_34 < var_166_40 then
					arg_163_1.talkMaxDuration = var_166_40

					if var_166_40 + var_166_33 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_40 + var_166_33
					end
				end

				arg_163_1.text_.text = var_166_37
				arg_163_1.typewritter.percent = 0

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191039", "story_v_out_113191.awb") ~= 0 then
					local var_166_41 = manager.audio:GetVoiceLength("story_v_out_113191", "113191039", "story_v_out_113191.awb") / 1000

					if var_166_41 + var_166_33 > arg_163_1.duration_ then
						arg_163_1.duration_ = var_166_41 + var_166_33
					end

					if var_166_36.prefab_name ~= "" and arg_163_1.actors_[var_166_36.prefab_name] ~= nil then
						local var_166_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_163_1.actors_[var_166_36.prefab_name].transform, "story_v_out_113191", "113191039", "story_v_out_113191.awb")

						arg_163_1:RecordAudio("113191039", var_166_42)
						arg_163_1:RecordAudio("113191039", var_166_42)
					else
						arg_163_1:AudioAction("play", "voice", "story_v_out_113191", "113191039", "story_v_out_113191.awb")
					end

					arg_163_1:RecordHistoryTalkVoice("story_v_out_113191", "113191039", "story_v_out_113191.awb")
				end

				arg_163_1:RecordContent(arg_163_1.text_.text)
			end

			local var_166_43 = math.max(var_166_34, arg_163_1.talkMaxDuration)

			if var_166_33 <= arg_163_1.time_ and arg_163_1.time_ < var_166_33 + var_166_43 then
				arg_163_1.typewritter.percent = (arg_163_1.time_ - var_166_33) / var_166_43

				arg_163_1.typewritter:SetDirty()
			end

			if arg_163_1.time_ >= var_166_33 + var_166_43 and arg_163_1.time_ < var_166_33 + var_166_43 + arg_166_0 then
				arg_163_1.typewritter.percent = 1

				arg_163_1.typewritter:SetDirty()
				arg_163_1:ShowNextGo(true)
			end
		end
	end,
	Play113191040 = function(arg_167_0, arg_167_1)
		arg_167_1.time_ = 0
		arg_167_1.frameCnt_ = 0
		arg_167_1.state_ = "playing"
		arg_167_1.curTalkId_ = 113191040
		arg_167_1.duration_ = 1.999999999999

		SetActive(arg_167_1.tipsGo_, false)

		function arg_167_1.onSingleLineFinish_()
			arg_167_1.onSingleLineUpdate_ = nil
			arg_167_1.onSingleLineFinish_ = nil
			arg_167_1.state_ = "waiting"
		end

		function arg_167_1.playNext_(arg_169_0)
			if arg_169_0 == 1 then
				arg_167_0:Play113191041(arg_167_1)
			end
		end

		function arg_167_1.onSingleLineUpdate_(arg_170_0)
			local var_170_0 = 0

			if var_170_0 < arg_167_1.time_ and arg_167_1.time_ <= var_170_0 + arg_170_0 then
				arg_167_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3103cva")
			end

			local var_170_1 = 0
			local var_170_2 = 0.1

			if var_170_1 < arg_167_1.time_ and arg_167_1.time_ <= var_170_1 + arg_170_0 then
				arg_167_1.talkMaxDuration = 0
				arg_167_1.dialogCg_.alpha = 1

				arg_167_1.dialog_:SetActive(true)
				SetActive(arg_167_1.leftNameGo_, true)

				local var_170_3 = arg_167_1:FormatText(StoryNameCfg[94].name)

				arg_167_1.leftNameTxt_.text = var_170_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_167_1.leftNameTxt_.transform)

				arg_167_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_167_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_167_1:RecordName(arg_167_1.leftNameTxt_.text)
				SetActive(arg_167_1.iconTrs_.gameObject, false)
				arg_167_1.callingController_:SetSelectedState("normal")

				local var_170_4 = arg_167_1:GetWordFromCfg(113191040)
				local var_170_5 = arg_167_1:FormatText(var_170_4.content)

				arg_167_1.text_.text = var_170_5

				LuaForUtil.ClearLinePrefixSymbol(arg_167_1.text_)

				local var_170_6 = 4
				local var_170_7 = utf8.len(var_170_5)
				local var_170_8 = var_170_6 <= 0 and var_170_2 or var_170_2 * (var_170_7 / var_170_6)

				if var_170_8 > 0 and var_170_2 < var_170_8 then
					arg_167_1.talkMaxDuration = var_170_8

					if var_170_8 + var_170_1 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_8 + var_170_1
					end
				end

				arg_167_1.text_.text = var_170_5
				arg_167_1.typewritter.percent = 0

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191040", "story_v_out_113191.awb") ~= 0 then
					local var_170_9 = manager.audio:GetVoiceLength("story_v_out_113191", "113191040", "story_v_out_113191.awb") / 1000

					if var_170_9 + var_170_1 > arg_167_1.duration_ then
						arg_167_1.duration_ = var_170_9 + var_170_1
					end

					if var_170_4.prefab_name ~= "" and arg_167_1.actors_[var_170_4.prefab_name] ~= nil then
						local var_170_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_167_1.actors_[var_170_4.prefab_name].transform, "story_v_out_113191", "113191040", "story_v_out_113191.awb")

						arg_167_1:RecordAudio("113191040", var_170_10)
						arg_167_1:RecordAudio("113191040", var_170_10)
					else
						arg_167_1:AudioAction("play", "voice", "story_v_out_113191", "113191040", "story_v_out_113191.awb")
					end

					arg_167_1:RecordHistoryTalkVoice("story_v_out_113191", "113191040", "story_v_out_113191.awb")
				end

				arg_167_1:RecordContent(arg_167_1.text_.text)
			end

			local var_170_11 = math.max(var_170_2, arg_167_1.talkMaxDuration)

			if var_170_1 <= arg_167_1.time_ and arg_167_1.time_ < var_170_1 + var_170_11 then
				arg_167_1.typewritter.percent = (arg_167_1.time_ - var_170_1) / var_170_11

				arg_167_1.typewritter:SetDirty()
			end

			if arg_167_1.time_ >= var_170_1 + var_170_11 and arg_167_1.time_ < var_170_1 + var_170_11 + arg_170_0 then
				arg_167_1.typewritter.percent = 1

				arg_167_1.typewritter:SetDirty()
				arg_167_1:ShowNextGo(true)
			end
		end
	end,
	Play113191041 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 113191041
		arg_171_1.duration_ = 5

		SetActive(arg_171_1.tipsGo_, false)

		function arg_171_1.onSingleLineFinish_()
			arg_171_1.onSingleLineUpdate_ = nil
			arg_171_1.onSingleLineFinish_ = nil
			arg_171_1.state_ = "waiting"
		end

		function arg_171_1.playNext_(arg_173_0)
			if arg_173_0 == 1 then
				arg_171_0:Play113191042(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = arg_171_1.actors_["1038ui_story"].transform
			local var_174_1 = 0

			if var_174_1 < arg_171_1.time_ and arg_171_1.time_ <= var_174_1 + arg_174_0 then
				arg_171_1.var_.moveOldPos1038ui_story = var_174_0.localPosition
			end

			local var_174_2 = 0.001

			if var_174_1 <= arg_171_1.time_ and arg_171_1.time_ < var_174_1 + var_174_2 then
				local var_174_3 = (arg_171_1.time_ - var_174_1) / var_174_2
				local var_174_4 = Vector3.New(0, 100, 0)

				var_174_0.localPosition = Vector3.Lerp(arg_171_1.var_.moveOldPos1038ui_story, var_174_4, var_174_3)

				local var_174_5 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_5.x, var_174_5.y, var_174_5.z)

				local var_174_6 = var_174_0.localEulerAngles

				var_174_6.z = 0
				var_174_6.x = 0
				var_174_0.localEulerAngles = var_174_6
			end

			if arg_171_1.time_ >= var_174_1 + var_174_2 and arg_171_1.time_ < var_174_1 + var_174_2 + arg_174_0 then
				var_174_0.localPosition = Vector3.New(0, 100, 0)

				local var_174_7 = manager.ui.mainCamera.transform.position - var_174_0.position

				var_174_0.forward = Vector3.New(var_174_7.x, var_174_7.y, var_174_7.z)

				local var_174_8 = var_174_0.localEulerAngles

				var_174_8.z = 0
				var_174_8.x = 0
				var_174_0.localEulerAngles = var_174_8
			end

			local var_174_9 = 0
			local var_174_10 = 0.425

			if var_174_9 < arg_171_1.time_ and arg_171_1.time_ <= var_174_9 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, false)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_11 = arg_171_1:GetWordFromCfg(113191041)
				local var_174_12 = arg_171_1:FormatText(var_174_11.content)

				arg_171_1.text_.text = var_174_12

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_13 = 17
				local var_174_14 = utf8.len(var_174_12)
				local var_174_15 = var_174_13 <= 0 and var_174_10 or var_174_10 * (var_174_14 / var_174_13)

				if var_174_15 > 0 and var_174_10 < var_174_15 then
					arg_171_1.talkMaxDuration = var_174_15

					if var_174_15 + var_174_9 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_15 + var_174_9
					end
				end

				arg_171_1.text_.text = var_174_12
				arg_171_1.typewritter.percent = 0

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(false)
				arg_171_1:RecordContent(arg_171_1.text_.text)
			end

			local var_174_16 = math.max(var_174_10, arg_171_1.talkMaxDuration)

			if var_174_9 <= arg_171_1.time_ and arg_171_1.time_ < var_174_9 + var_174_16 then
				arg_171_1.typewritter.percent = (arg_171_1.time_ - var_174_9) / var_174_16

				arg_171_1.typewritter:SetDirty()
			end

			if arg_171_1.time_ >= var_174_9 + var_174_16 and arg_171_1.time_ < var_174_9 + var_174_16 + arg_174_0 then
				arg_171_1.typewritter.percent = 1

				arg_171_1.typewritter:SetDirty()
				arg_171_1:ShowNextGo(true)
			end
		end
	end,
	Play113191042 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 113191042
		arg_175_1.duration_ = 2.866

		local var_175_0 = {
			ja = 2.266,
			ko = 2.866,
			zh = 2.1,
			en = 2.366
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
				arg_175_0:Play113191043(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["1038ui_story"].transform
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 then
				arg_175_1.var_.moveOldPos1038ui_story = var_178_0.localPosition
			end

			local var_178_2 = 0.001

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2
				local var_178_4 = Vector3.New(0, -1.11, -5.9)

				var_178_0.localPosition = Vector3.Lerp(arg_175_1.var_.moveOldPos1038ui_story, var_178_4, var_178_3)

				local var_178_5 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_5.x, var_178_5.y, var_178_5.z)

				local var_178_6 = var_178_0.localEulerAngles

				var_178_6.z = 0
				var_178_6.x = 0
				var_178_0.localEulerAngles = var_178_6
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 then
				var_178_0.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_178_7 = manager.ui.mainCamera.transform.position - var_178_0.position

				var_178_0.forward = Vector3.New(var_178_7.x, var_178_7.y, var_178_7.z)

				local var_178_8 = var_178_0.localEulerAngles

				var_178_8.z = 0
				var_178_8.x = 0
				var_178_0.localEulerAngles = var_178_8
			end

			local var_178_9 = 0

			if var_178_9 < arg_175_1.time_ and arg_175_1.time_ <= var_178_9 + arg_178_0 then
				arg_175_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_178_10 = 0

			if var_178_10 < arg_175_1.time_ and arg_175_1.time_ <= var_178_10 + arg_178_0 then
				arg_175_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_178_11 = arg_175_1.actors_["1038ui_story"]
			local var_178_12 = 0

			if var_178_12 < arg_175_1.time_ and arg_175_1.time_ <= var_178_12 + arg_178_0 and arg_175_1.var_.characterEffect1038ui_story == nil then
				arg_175_1.var_.characterEffect1038ui_story = var_178_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_13 = 0.2

			if var_178_12 <= arg_175_1.time_ and arg_175_1.time_ < var_178_12 + var_178_13 then
				local var_178_14 = (arg_175_1.time_ - var_178_12) / var_178_13

				if arg_175_1.var_.characterEffect1038ui_story then
					arg_175_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_175_1.time_ >= var_178_12 + var_178_13 and arg_175_1.time_ < var_178_12 + var_178_13 + arg_178_0 and arg_175_1.var_.characterEffect1038ui_story then
				arg_175_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_178_15 = 0
			local var_178_16 = 0.25

			if var_178_15 < arg_175_1.time_ and arg_175_1.time_ <= var_178_15 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, true)

				local var_178_17 = arg_175_1:FormatText(StoryNameCfg[94].name)

				arg_175_1.leftNameTxt_.text = var_178_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_175_1.leftNameTxt_.transform)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1.leftNameTxt_.text)
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_18 = arg_175_1:GetWordFromCfg(113191042)
				local var_178_19 = arg_175_1:FormatText(var_178_18.content)

				arg_175_1.text_.text = var_178_19

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_20 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191042", "story_v_out_113191.awb") ~= 0 then
					local var_178_23 = manager.audio:GetVoiceLength("story_v_out_113191", "113191042", "story_v_out_113191.awb") / 1000

					if var_178_23 + var_178_15 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_23 + var_178_15
					end

					if var_178_18.prefab_name ~= "" and arg_175_1.actors_[var_178_18.prefab_name] ~= nil then
						local var_178_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_175_1.actors_[var_178_18.prefab_name].transform, "story_v_out_113191", "113191042", "story_v_out_113191.awb")

						arg_175_1:RecordAudio("113191042", var_178_24)
						arg_175_1:RecordAudio("113191042", var_178_24)
					else
						arg_175_1:AudioAction("play", "voice", "story_v_out_113191", "113191042", "story_v_out_113191.awb")
					end

					arg_175_1:RecordHistoryTalkVoice("story_v_out_113191", "113191042", "story_v_out_113191.awb")
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
	Play113191043 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 113191043
		arg_179_1.duration_ = 4.833

		local var_179_0 = {
			ja = 1.033,
			ko = 1.766,
			zh = 4.833,
			en = 1
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
				arg_179_0:Play113191044(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1038ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1038ui_story == nil then
				arg_179_1.var_.characterEffect1038ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.2

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1038ui_story then
					local var_182_4 = Mathf.Lerp(0, 0.5, var_182_3)

					arg_179_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_179_1.var_.characterEffect1038ui_story.fillRatio = var_182_4
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1038ui_story then
				local var_182_5 = 0.5

				arg_179_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_179_1.var_.characterEffect1038ui_story.fillRatio = var_182_5
			end

			local var_182_6 = 0
			local var_182_7 = 0.05

			if var_182_6 < arg_179_1.time_ and arg_179_1.time_ <= var_182_6 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_8 = arg_179_1:FormatText(StoryNameCfg[208].name)

				arg_179_1.leftNameTxt_.text = var_182_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, true)
				arg_179_1.iconController_:SetSelectedState("hero")

				arg_179_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_9 = arg_179_1:GetWordFromCfg(113191043)
				local var_182_10 = arg_179_1:FormatText(var_182_9.content)

				arg_179_1.text_.text = var_182_10

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_11 = 2
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191043", "story_v_out_113191.awb") ~= 0 then
					local var_182_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191043", "story_v_out_113191.awb") / 1000

					if var_182_14 + var_182_6 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_14 + var_182_6
					end

					if var_182_9.prefab_name ~= "" and arg_179_1.actors_[var_182_9.prefab_name] ~= nil then
						local var_182_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_9.prefab_name].transform, "story_v_out_113191", "113191043", "story_v_out_113191.awb")

						arg_179_1:RecordAudio("113191043", var_182_15)
						arg_179_1:RecordAudio("113191043", var_182_15)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_113191", "113191043", "story_v_out_113191.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_113191", "113191043", "story_v_out_113191.awb")
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
	Play113191044 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 113191044
		arg_183_1.duration_ = 9.366

		local var_183_0 = {
			ja = 9.366,
			ko = 6.9,
			zh = 5.166,
			en = 6.133
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
				arg_183_0:Play113191045(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = 0

			if var_186_0 < arg_183_1.time_ and arg_183_1.time_ <= var_186_0 + arg_186_0 then
				arg_183_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_186_1 = arg_183_1.actors_["1038ui_story"]
			local var_186_2 = 0

			if var_186_2 < arg_183_1.time_ and arg_183_1.time_ <= var_186_2 + arg_186_0 and arg_183_1.var_.characterEffect1038ui_story == nil then
				arg_183_1.var_.characterEffect1038ui_story = var_186_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_3 = 0.2

			if var_186_2 <= arg_183_1.time_ and arg_183_1.time_ < var_186_2 + var_186_3 then
				local var_186_4 = (arg_183_1.time_ - var_186_2) / var_186_3

				if arg_183_1.var_.characterEffect1038ui_story then
					arg_183_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_2 + var_186_3 and arg_183_1.time_ < var_186_2 + var_186_3 + arg_186_0 and arg_183_1.var_.characterEffect1038ui_story then
				arg_183_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_186_5 = 0
			local var_186_6 = 0.675

			if var_186_5 < arg_183_1.time_ and arg_183_1.time_ <= var_186_5 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_7 = arg_183_1:FormatText(StoryNameCfg[94].name)

				arg_183_1.leftNameTxt_.text = var_186_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_8 = arg_183_1:GetWordFromCfg(113191044)
				local var_186_9 = arg_183_1:FormatText(var_186_8.content)

				arg_183_1.text_.text = var_186_9

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_10 = 27
				local var_186_11 = utf8.len(var_186_9)
				local var_186_12 = var_186_10 <= 0 and var_186_6 or var_186_6 * (var_186_11 / var_186_10)

				if var_186_12 > 0 and var_186_6 < var_186_12 then
					arg_183_1.talkMaxDuration = var_186_12

					if var_186_12 + var_186_5 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_12 + var_186_5
					end
				end

				arg_183_1.text_.text = var_186_9
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191044", "story_v_out_113191.awb") ~= 0 then
					local var_186_13 = manager.audio:GetVoiceLength("story_v_out_113191", "113191044", "story_v_out_113191.awb") / 1000

					if var_186_13 + var_186_5 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_13 + var_186_5
					end

					if var_186_8.prefab_name ~= "" and arg_183_1.actors_[var_186_8.prefab_name] ~= nil then
						local var_186_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_8.prefab_name].transform, "story_v_out_113191", "113191044", "story_v_out_113191.awb")

						arg_183_1:RecordAudio("113191044", var_186_14)
						arg_183_1:RecordAudio("113191044", var_186_14)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_113191", "113191044", "story_v_out_113191.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_113191", "113191044", "story_v_out_113191.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_15 = math.max(var_186_6, arg_183_1.talkMaxDuration)

			if var_186_5 <= arg_183_1.time_ and arg_183_1.time_ < var_186_5 + var_186_15 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_5) / var_186_15

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_5 + var_186_15 and arg_183_1.time_ < var_186_5 + var_186_15 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play113191045 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 113191045
		arg_187_1.duration_ = 5.466

		local var_187_0 = {
			ja = 5.366,
			ko = 4.6,
			zh = 5.466,
			en = 3.633
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
				arg_187_0:Play113191046(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["1038ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect1038ui_story == nil then
				arg_187_1.var_.characterEffect1038ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.2

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect1038ui_story then
					arg_187_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect1038ui_story then
				arg_187_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_190_4 = 0
			local var_190_5 = 0.425

			if var_190_4 < arg_187_1.time_ and arg_187_1.time_ <= var_190_4 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_6 = arg_187_1:FormatText(StoryNameCfg[208].name)

				arg_187_1.leftNameTxt_.text = var_190_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, true)
				arg_187_1.iconController_:SetSelectedState("hero")

				arg_187_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_7 = arg_187_1:GetWordFromCfg(113191045)
				local var_190_8 = arg_187_1:FormatText(var_190_7.content)

				arg_187_1.text_.text = var_190_8

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_9 = 17
				local var_190_10 = utf8.len(var_190_8)
				local var_190_11 = var_190_9 <= 0 and var_190_5 or var_190_5 * (var_190_10 / var_190_9)

				if var_190_11 > 0 and var_190_5 < var_190_11 then
					arg_187_1.talkMaxDuration = var_190_11

					if var_190_11 + var_190_4 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_11 + var_190_4
					end
				end

				arg_187_1.text_.text = var_190_8
				arg_187_1.typewritter.percent = 0

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191045", "story_v_out_113191.awb") ~= 0 then
					local var_190_12 = manager.audio:GetVoiceLength("story_v_out_113191", "113191045", "story_v_out_113191.awb") / 1000

					if var_190_12 + var_190_4 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_12 + var_190_4
					end

					if var_190_7.prefab_name ~= "" and arg_187_1.actors_[var_190_7.prefab_name] ~= nil then
						local var_190_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_7.prefab_name].transform, "story_v_out_113191", "113191045", "story_v_out_113191.awb")

						arg_187_1:RecordAudio("113191045", var_190_13)
						arg_187_1:RecordAudio("113191045", var_190_13)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_113191", "113191045", "story_v_out_113191.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_113191", "113191045", "story_v_out_113191.awb")
				end

				arg_187_1:RecordContent(arg_187_1.text_.text)
			end

			local var_190_14 = math.max(var_190_5, arg_187_1.talkMaxDuration)

			if var_190_4 <= arg_187_1.time_ and arg_187_1.time_ < var_190_4 + var_190_14 then
				arg_187_1.typewritter.percent = (arg_187_1.time_ - var_190_4) / var_190_14

				arg_187_1.typewritter:SetDirty()
			end

			if arg_187_1.time_ >= var_190_4 + var_190_14 and arg_187_1.time_ < var_190_4 + var_190_14 + arg_190_0 then
				arg_187_1.typewritter.percent = 1

				arg_187_1.typewritter:SetDirty()
				arg_187_1:ShowNextGo(true)
			end
		end
	end,
	Play113191046 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 113191046
		arg_191_1.duration_ = 1.999999999999

		SetActive(arg_191_1.tipsGo_, false)

		function arg_191_1.onSingleLineFinish_()
			arg_191_1.onSingleLineUpdate_ = nil
			arg_191_1.onSingleLineFinish_ = nil
			arg_191_1.state_ = "waiting"
		end

		function arg_191_1.playNext_(arg_193_0)
			if arg_193_0 == 1 then
				arg_191_0:Play113191047(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = 0

			if var_194_0 < arg_191_1.time_ and arg_191_1.time_ <= var_194_0 + arg_194_0 then
				arg_191_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3203cva")
			end

			local var_194_1 = arg_191_1.actors_["1038ui_story"]
			local var_194_2 = 0

			if var_194_2 < arg_191_1.time_ and arg_191_1.time_ <= var_194_2 + arg_194_0 and arg_191_1.var_.characterEffect1038ui_story == nil then
				arg_191_1.var_.characterEffect1038ui_story = var_194_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_3 = 0.2

			if var_194_2 <= arg_191_1.time_ and arg_191_1.time_ < var_194_2 + var_194_3 then
				local var_194_4 = (arg_191_1.time_ - var_194_2) / var_194_3

				if arg_191_1.var_.characterEffect1038ui_story then
					arg_191_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_2 + var_194_3 and arg_191_1.time_ < var_194_2 + var_194_3 + arg_194_0 and arg_191_1.var_.characterEffect1038ui_story then
				arg_191_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_194_5 = 0
			local var_194_6 = 0.125

			if var_194_5 < arg_191_1.time_ and arg_191_1.time_ <= var_194_5 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_7 = arg_191_1:FormatText(StoryNameCfg[94].name)

				arg_191_1.leftNameTxt_.text = var_194_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_8 = arg_191_1:GetWordFromCfg(113191046)
				local var_194_9 = arg_191_1:FormatText(var_194_8.content)

				arg_191_1.text_.text = var_194_9

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_10 = 5
				local var_194_11 = utf8.len(var_194_9)
				local var_194_12 = var_194_10 <= 0 and var_194_6 or var_194_6 * (var_194_11 / var_194_10)

				if var_194_12 > 0 and var_194_6 < var_194_12 then
					arg_191_1.talkMaxDuration = var_194_12

					if var_194_12 + var_194_5 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_12 + var_194_5
					end
				end

				arg_191_1.text_.text = var_194_9
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191046", "story_v_out_113191.awb") ~= 0 then
					local var_194_13 = manager.audio:GetVoiceLength("story_v_out_113191", "113191046", "story_v_out_113191.awb") / 1000

					if var_194_13 + var_194_5 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_13 + var_194_5
					end

					if var_194_8.prefab_name ~= "" and arg_191_1.actors_[var_194_8.prefab_name] ~= nil then
						local var_194_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_8.prefab_name].transform, "story_v_out_113191", "113191046", "story_v_out_113191.awb")

						arg_191_1:RecordAudio("113191046", var_194_14)
						arg_191_1:RecordAudio("113191046", var_194_14)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_113191", "113191046", "story_v_out_113191.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_113191", "113191046", "story_v_out_113191.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_15 = math.max(var_194_6, arg_191_1.talkMaxDuration)

			if var_194_5 <= arg_191_1.time_ and arg_191_1.time_ < var_194_5 + var_194_15 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_5) / var_194_15

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_5 + var_194_15 and arg_191_1.time_ < var_194_5 + var_194_15 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play113191047 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 113191047
		arg_195_1.duration_ = 12.1

		local var_195_0 = {
			ja = 8.966,
			ko = 10.2,
			zh = 12,
			en = 12.1
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
				arg_195_0:Play113191048(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1038ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1038ui_story == nil then
				arg_195_1.var_.characterEffect1038ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.2

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1038ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1038ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1038ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1038ui_story.fillRatio = var_198_5
			end

			local var_198_6 = 0
			local var_198_7 = 1.2

			if var_198_6 < arg_195_1.time_ and arg_195_1.time_ <= var_198_6 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_8 = arg_195_1:FormatText(StoryNameCfg[208].name)

				arg_195_1.leftNameTxt_.text = var_198_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, true)
				arg_195_1.iconController_:SetSelectedState("hero")

				arg_195_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_9 = arg_195_1:GetWordFromCfg(113191047)
				local var_198_10 = arg_195_1:FormatText(var_198_9.content)

				arg_195_1.text_.text = var_198_10

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_11 = 48
				local var_198_12 = utf8.len(var_198_10)
				local var_198_13 = var_198_11 <= 0 and var_198_7 or var_198_7 * (var_198_12 / var_198_11)

				if var_198_13 > 0 and var_198_7 < var_198_13 then
					arg_195_1.talkMaxDuration = var_198_13

					if var_198_13 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_13 + var_198_6
					end
				end

				arg_195_1.text_.text = var_198_10
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191047", "story_v_out_113191.awb") ~= 0 then
					local var_198_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191047", "story_v_out_113191.awb") / 1000

					if var_198_14 + var_198_6 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_14 + var_198_6
					end

					if var_198_9.prefab_name ~= "" and arg_195_1.actors_[var_198_9.prefab_name] ~= nil then
						local var_198_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_9.prefab_name].transform, "story_v_out_113191", "113191047", "story_v_out_113191.awb")

						arg_195_1:RecordAudio("113191047", var_198_15)
						arg_195_1:RecordAudio("113191047", var_198_15)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_113191", "113191047", "story_v_out_113191.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_113191", "113191047", "story_v_out_113191.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_16 = math.max(var_198_7, arg_195_1.talkMaxDuration)

			if var_198_6 <= arg_195_1.time_ and arg_195_1.time_ < var_198_6 + var_198_16 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_6) / var_198_16

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_6 + var_198_16 and arg_195_1.time_ < var_198_6 + var_198_16 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play113191048 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 113191048
		arg_199_1.duration_ = 7.133

		local var_199_0 = {
			ja = 5.8,
			ko = 7.133,
			zh = 4.7,
			en = 4.966
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
				arg_199_0:Play113191049(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = 0

			if var_202_0 < arg_199_1.time_ and arg_199_1.time_ <= var_202_0 + arg_202_0 then
				arg_199_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_202_1 = arg_199_1.actors_["1038ui_story"]
			local var_202_2 = 0

			if var_202_2 < arg_199_1.time_ and arg_199_1.time_ <= var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect1038ui_story == nil then
				arg_199_1.var_.characterEffect1038ui_story = var_202_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_3 = 0.2

			if var_202_2 <= arg_199_1.time_ and arg_199_1.time_ < var_202_2 + var_202_3 then
				local var_202_4 = (arg_199_1.time_ - var_202_2) / var_202_3

				if arg_199_1.var_.characterEffect1038ui_story then
					arg_199_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_199_1.time_ >= var_202_2 + var_202_3 and arg_199_1.time_ < var_202_2 + var_202_3 + arg_202_0 and arg_199_1.var_.characterEffect1038ui_story then
				arg_199_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_202_5 = 0

			if var_202_5 < arg_199_1.time_ and arg_199_1.time_ <= var_202_5 + arg_202_0 then
				arg_199_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_2")
			end

			local var_202_6 = 0
			local var_202_7 = 0.55

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_8 = arg_199_1:FormatText(StoryNameCfg[94].name)

				arg_199_1.leftNameTxt_.text = var_202_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, false)
				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_9 = arg_199_1:GetWordFromCfg(113191048)
				local var_202_10 = arg_199_1:FormatText(var_202_9.content)

				arg_199_1.text_.text = var_202_10

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_11 = 22
				local var_202_12 = utf8.len(var_202_10)
				local var_202_13 = var_202_11 <= 0 and var_202_7 or var_202_7 * (var_202_12 / var_202_11)

				if var_202_13 > 0 and var_202_7 < var_202_13 then
					arg_199_1.talkMaxDuration = var_202_13

					if var_202_13 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_13 + var_202_6
					end
				end

				arg_199_1.text_.text = var_202_10
				arg_199_1.typewritter.percent = 0

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191048", "story_v_out_113191.awb") ~= 0 then
					local var_202_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191048", "story_v_out_113191.awb") / 1000

					if var_202_14 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_14 + var_202_6
					end

					if var_202_9.prefab_name ~= "" and arg_199_1.actors_[var_202_9.prefab_name] ~= nil then
						local var_202_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_9.prefab_name].transform, "story_v_out_113191", "113191048", "story_v_out_113191.awb")

						arg_199_1:RecordAudio("113191048", var_202_15)
						arg_199_1:RecordAudio("113191048", var_202_15)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_113191", "113191048", "story_v_out_113191.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_113191", "113191048", "story_v_out_113191.awb")
				end

				arg_199_1:RecordContent(arg_199_1.text_.text)
			end

			local var_202_16 = math.max(var_202_7, arg_199_1.talkMaxDuration)

			if var_202_6 <= arg_199_1.time_ and arg_199_1.time_ < var_202_6 + var_202_16 then
				arg_199_1.typewritter.percent = (arg_199_1.time_ - var_202_6) / var_202_16

				arg_199_1.typewritter:SetDirty()
			end

			if arg_199_1.time_ >= var_202_6 + var_202_16 and arg_199_1.time_ < var_202_6 + var_202_16 + arg_202_0 then
				arg_199_1.typewritter.percent = 1

				arg_199_1.typewritter:SetDirty()
				arg_199_1:ShowNextGo(true)
			end
		end
	end,
	Play113191049 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 113191049
		arg_203_1.duration_ = 14.933

		local var_203_0 = {
			ja = 14.366,
			ko = 12.733,
			zh = 12.966,
			en = 14.933
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
				arg_203_0:Play113191050(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1038ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1038ui_story == nil then
				arg_203_1.var_.characterEffect1038ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.2

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1038ui_story then
					local var_206_4 = Mathf.Lerp(0, 0.5, var_206_3)

					arg_203_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_203_1.var_.characterEffect1038ui_story.fillRatio = var_206_4
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1038ui_story then
				local var_206_5 = 0.5

				arg_203_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_203_1.var_.characterEffect1038ui_story.fillRatio = var_206_5
			end

			local var_206_6 = 0
			local var_206_7 = 1.2

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[208].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, true)
				arg_203_1.iconController_:SetSelectedState("hero")

				arg_203_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(113191049)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 48
				local var_206_12 = utf8.len(var_206_10)
				local var_206_13 = var_206_11 <= 0 and var_206_7 or var_206_7 * (var_206_12 / var_206_11)

				if var_206_13 > 0 and var_206_7 < var_206_13 then
					arg_203_1.talkMaxDuration = var_206_13

					if var_206_13 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_13 + var_206_6
					end
				end

				arg_203_1.text_.text = var_206_10
				arg_203_1.typewritter.percent = 0

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191049", "story_v_out_113191.awb") ~= 0 then
					local var_206_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191049", "story_v_out_113191.awb") / 1000

					if var_206_14 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_14 + var_206_6
					end

					if var_206_9.prefab_name ~= "" and arg_203_1.actors_[var_206_9.prefab_name] ~= nil then
						local var_206_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_9.prefab_name].transform, "story_v_out_113191", "113191049", "story_v_out_113191.awb")

						arg_203_1:RecordAudio("113191049", var_206_15)
						arg_203_1:RecordAudio("113191049", var_206_15)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_113191", "113191049", "story_v_out_113191.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_113191", "113191049", "story_v_out_113191.awb")
				end

				arg_203_1:RecordContent(arg_203_1.text_.text)
			end

			local var_206_16 = math.max(var_206_7, arg_203_1.talkMaxDuration)

			if var_206_6 <= arg_203_1.time_ and arg_203_1.time_ < var_206_6 + var_206_16 then
				arg_203_1.typewritter.percent = (arg_203_1.time_ - var_206_6) / var_206_16

				arg_203_1.typewritter:SetDirty()
			end

			if arg_203_1.time_ >= var_206_6 + var_206_16 and arg_203_1.time_ < var_206_6 + var_206_16 + arg_206_0 then
				arg_203_1.typewritter.percent = 1

				arg_203_1.typewritter:SetDirty()
				arg_203_1:ShowNextGo(true)
			end
		end
	end,
	Play113191050 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 113191050
		arg_207_1.duration_ = 8.833

		local var_207_0 = {
			ja = 5.166,
			ko = 6.433,
			zh = 5.1,
			en = 8.833
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
				arg_207_0:Play113191051(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 0.525

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[208].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, true)
				arg_207_1.iconController_:SetSelectedState("hero")

				arg_207_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(113191050)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 21
				local var_210_6 = utf8.len(var_210_4)
				local var_210_7 = var_210_5 <= 0 and var_210_1 or var_210_1 * (var_210_6 / var_210_5)

				if var_210_7 > 0 and var_210_1 < var_210_7 then
					arg_207_1.talkMaxDuration = var_210_7

					if var_210_7 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_7 + var_210_0
					end
				end

				arg_207_1.text_.text = var_210_4
				arg_207_1.typewritter.percent = 0

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191050", "story_v_out_113191.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191050", "story_v_out_113191.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_113191", "113191050", "story_v_out_113191.awb")

						arg_207_1:RecordAudio("113191050", var_210_9)
						arg_207_1:RecordAudio("113191050", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_113191", "113191050", "story_v_out_113191.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_113191", "113191050", "story_v_out_113191.awb")
				end

				arg_207_1:RecordContent(arg_207_1.text_.text)
			end

			local var_210_10 = math.max(var_210_1, arg_207_1.talkMaxDuration)

			if var_210_0 <= arg_207_1.time_ and arg_207_1.time_ < var_210_0 + var_210_10 then
				arg_207_1.typewritter.percent = (arg_207_1.time_ - var_210_0) / var_210_10

				arg_207_1.typewritter:SetDirty()
			end

			if arg_207_1.time_ >= var_210_0 + var_210_10 and arg_207_1.time_ < var_210_0 + var_210_10 + arg_210_0 then
				arg_207_1.typewritter.percent = 1

				arg_207_1.typewritter:SetDirty()
				arg_207_1:ShowNextGo(true)
			end
		end
	end,
	Play113191051 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 113191051
		arg_211_1.duration_ = 2.133

		local var_211_0 = {
			ja = 2.133,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 1.999999999999
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
				arg_211_0:Play113191052(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = 0

			if var_214_0 < arg_211_1.time_ and arg_211_1.time_ <= var_214_0 + arg_214_0 then
				arg_211_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3102cva")
			end

			local var_214_1 = arg_211_1.actors_["1038ui_story"]
			local var_214_2 = 0

			if var_214_2 < arg_211_1.time_ and arg_211_1.time_ <= var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect1038ui_story == nil then
				arg_211_1.var_.characterEffect1038ui_story = var_214_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_3 = 0.2

			if var_214_2 <= arg_211_1.time_ and arg_211_1.time_ < var_214_2 + var_214_3 then
				local var_214_4 = (arg_211_1.time_ - var_214_2) / var_214_3

				if arg_211_1.var_.characterEffect1038ui_story then
					arg_211_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_2 + var_214_3 and arg_211_1.time_ < var_214_2 + var_214_3 + arg_214_0 and arg_211_1.var_.characterEffect1038ui_story then
				arg_211_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_214_5 = 0
			local var_214_6 = 0.075

			if var_214_5 < arg_211_1.time_ and arg_211_1.time_ <= var_214_5 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_7 = arg_211_1:FormatText(StoryNameCfg[94].name)

				arg_211_1.leftNameTxt_.text = var_214_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_8 = arg_211_1:GetWordFromCfg(113191051)
				local var_214_9 = arg_211_1:FormatText(var_214_8.content)

				arg_211_1.text_.text = var_214_9

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_10 = 3
				local var_214_11 = utf8.len(var_214_9)
				local var_214_12 = var_214_10 <= 0 and var_214_6 or var_214_6 * (var_214_11 / var_214_10)

				if var_214_12 > 0 and var_214_6 < var_214_12 then
					arg_211_1.talkMaxDuration = var_214_12

					if var_214_12 + var_214_5 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_12 + var_214_5
					end
				end

				arg_211_1.text_.text = var_214_9
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191051", "story_v_out_113191.awb") ~= 0 then
					local var_214_13 = manager.audio:GetVoiceLength("story_v_out_113191", "113191051", "story_v_out_113191.awb") / 1000

					if var_214_13 + var_214_5 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_13 + var_214_5
					end

					if var_214_8.prefab_name ~= "" and arg_211_1.actors_[var_214_8.prefab_name] ~= nil then
						local var_214_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_8.prefab_name].transform, "story_v_out_113191", "113191051", "story_v_out_113191.awb")

						arg_211_1:RecordAudio("113191051", var_214_14)
						arg_211_1:RecordAudio("113191051", var_214_14)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_113191", "113191051", "story_v_out_113191.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_113191", "113191051", "story_v_out_113191.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_15 = math.max(var_214_6, arg_211_1.talkMaxDuration)

			if var_214_5 <= arg_211_1.time_ and arg_211_1.time_ < var_214_5 + var_214_15 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_5) / var_214_15

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_5 + var_214_15 and arg_211_1.time_ < var_214_5 + var_214_15 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play113191052 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 113191052
		arg_215_1.duration_ = 13.7

		local var_215_0 = {
			ja = 9.9,
			ko = 13.7,
			zh = 9.3,
			en = 12.5
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
				arg_215_0:Play113191053(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = 0

			if var_218_0 < arg_215_1.time_ and arg_215_1.time_ <= var_218_0 + arg_218_0 then
				arg_215_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_218_1 = arg_215_1.actors_["1038ui_story"]
			local var_218_2 = 0

			if var_218_2 < arg_215_1.time_ and arg_215_1.time_ <= var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect1038ui_story == nil then
				arg_215_1.var_.characterEffect1038ui_story = var_218_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_3 = 0.2

			if var_218_2 <= arg_215_1.time_ and arg_215_1.time_ < var_218_2 + var_218_3 then
				local var_218_4 = (arg_215_1.time_ - var_218_2) / var_218_3

				if arg_215_1.var_.characterEffect1038ui_story then
					arg_215_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_2 + var_218_3 and arg_215_1.time_ < var_218_2 + var_218_3 + arg_218_0 and arg_215_1.var_.characterEffect1038ui_story then
				arg_215_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_218_5 = 0

			if var_218_5 < arg_215_1.time_ and arg_215_1.time_ <= var_218_5 + arg_218_0 then
				arg_215_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_218_6 = 0
			local var_218_7 = 1.325

			if var_218_6 < arg_215_1.time_ and arg_215_1.time_ <= var_218_6 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_8 = arg_215_1:FormatText(StoryNameCfg[94].name)

				arg_215_1.leftNameTxt_.text = var_218_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_9 = arg_215_1:GetWordFromCfg(113191052)
				local var_218_10 = arg_215_1:FormatText(var_218_9.content)

				arg_215_1.text_.text = var_218_10

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_11 = 53
				local var_218_12 = utf8.len(var_218_10)
				local var_218_13 = var_218_11 <= 0 and var_218_7 or var_218_7 * (var_218_12 / var_218_11)

				if var_218_13 > 0 and var_218_7 < var_218_13 then
					arg_215_1.talkMaxDuration = var_218_13

					if var_218_13 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_13 + var_218_6
					end
				end

				arg_215_1.text_.text = var_218_10
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191052", "story_v_out_113191.awb") ~= 0 then
					local var_218_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191052", "story_v_out_113191.awb") / 1000

					if var_218_14 + var_218_6 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_14 + var_218_6
					end

					if var_218_9.prefab_name ~= "" and arg_215_1.actors_[var_218_9.prefab_name] ~= nil then
						local var_218_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_9.prefab_name].transform, "story_v_out_113191", "113191052", "story_v_out_113191.awb")

						arg_215_1:RecordAudio("113191052", var_218_15)
						arg_215_1:RecordAudio("113191052", var_218_15)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_113191", "113191052", "story_v_out_113191.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_113191", "113191052", "story_v_out_113191.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_16 = math.max(var_218_7, arg_215_1.talkMaxDuration)

			if var_218_6 <= arg_215_1.time_ and arg_215_1.time_ < var_218_6 + var_218_16 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_6) / var_218_16

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_6 + var_218_16 and arg_215_1.time_ < var_218_6 + var_218_16 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play113191053 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 113191053
		arg_219_1.duration_ = 2.066

		local var_219_0 = {
			ja = 2.066,
			ko = 1.566,
			zh = 1.8,
			en = 1.366
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
				arg_219_0:Play113191054(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1038ui_story"]
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 and arg_219_1.var_.characterEffect1038ui_story == nil then
				arg_219_1.var_.characterEffect1038ui_story = var_222_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_2 = 0.2

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2

				if arg_219_1.var_.characterEffect1038ui_story then
					local var_222_4 = Mathf.Lerp(0, 0.5, var_222_3)

					arg_219_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_219_1.var_.characterEffect1038ui_story.fillRatio = var_222_4
				end
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 and arg_219_1.var_.characterEffect1038ui_story then
				local var_222_5 = 0.5

				arg_219_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_219_1.var_.characterEffect1038ui_story.fillRatio = var_222_5
			end

			local var_222_6 = 0
			local var_222_7 = 0.1

			if var_222_6 < arg_219_1.time_ and arg_219_1.time_ <= var_222_6 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_8 = arg_219_1:FormatText(StoryNameCfg[208].name)

				arg_219_1.leftNameTxt_.text = var_222_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, true)
				arg_219_1.iconController_:SetSelectedState("hero")

				arg_219_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_9 = arg_219_1:GetWordFromCfg(113191053)
				local var_222_10 = arg_219_1:FormatText(var_222_9.content)

				arg_219_1.text_.text = var_222_10

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_11 = 4
				local var_222_12 = utf8.len(var_222_10)
				local var_222_13 = var_222_11 <= 0 and var_222_7 or var_222_7 * (var_222_12 / var_222_11)

				if var_222_13 > 0 and var_222_7 < var_222_13 then
					arg_219_1.talkMaxDuration = var_222_13

					if var_222_13 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_13 + var_222_6
					end
				end

				arg_219_1.text_.text = var_222_10
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191053", "story_v_out_113191.awb") ~= 0 then
					local var_222_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191053", "story_v_out_113191.awb") / 1000

					if var_222_14 + var_222_6 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_14 + var_222_6
					end

					if var_222_9.prefab_name ~= "" and arg_219_1.actors_[var_222_9.prefab_name] ~= nil then
						local var_222_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_9.prefab_name].transform, "story_v_out_113191", "113191053", "story_v_out_113191.awb")

						arg_219_1:RecordAudio("113191053", var_222_15)
						arg_219_1:RecordAudio("113191053", var_222_15)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_113191", "113191053", "story_v_out_113191.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_113191", "113191053", "story_v_out_113191.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_16 = math.max(var_222_7, arg_219_1.talkMaxDuration)

			if var_222_6 <= arg_219_1.time_ and arg_219_1.time_ < var_222_6 + var_222_16 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_6) / var_222_16

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_6 + var_222_16 and arg_219_1.time_ < var_222_6 + var_222_16 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play113191054 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 113191054
		arg_223_1.duration_ = 10.1

		local var_223_0 = {
			ja = 8.633,
			ko = 10.1,
			zh = 8.066,
			en = 9.4
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
				arg_223_0:Play113191055(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = 0

			if var_226_0 < arg_223_1.time_ and arg_223_1.time_ <= var_226_0 + arg_226_0 then
				arg_223_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_226_1 = arg_223_1.actors_["1038ui_story"]
			local var_226_2 = 0

			if var_226_2 < arg_223_1.time_ and arg_223_1.time_ <= var_226_2 + arg_226_0 and arg_223_1.var_.characterEffect1038ui_story == nil then
				arg_223_1.var_.characterEffect1038ui_story = var_226_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_3 = 0.2

			if var_226_2 <= arg_223_1.time_ and arg_223_1.time_ < var_226_2 + var_226_3 then
				local var_226_4 = (arg_223_1.time_ - var_226_2) / var_226_3

				if arg_223_1.var_.characterEffect1038ui_story then
					arg_223_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_2 + var_226_3 and arg_223_1.time_ < var_226_2 + var_226_3 + arg_226_0 and arg_223_1.var_.characterEffect1038ui_story then
				arg_223_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_226_5 = 0
			local var_226_6 = 1.125

			if var_226_5 < arg_223_1.time_ and arg_223_1.time_ <= var_226_5 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_7 = arg_223_1:FormatText(StoryNameCfg[94].name)

				arg_223_1.leftNameTxt_.text = var_226_7

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_8 = arg_223_1:GetWordFromCfg(113191054)
				local var_226_9 = arg_223_1:FormatText(var_226_8.content)

				arg_223_1.text_.text = var_226_9

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_10 = 45
				local var_226_11 = utf8.len(var_226_9)
				local var_226_12 = var_226_10 <= 0 and var_226_6 or var_226_6 * (var_226_11 / var_226_10)

				if var_226_12 > 0 and var_226_6 < var_226_12 then
					arg_223_1.talkMaxDuration = var_226_12

					if var_226_12 + var_226_5 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_12 + var_226_5
					end
				end

				arg_223_1.text_.text = var_226_9
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191054", "story_v_out_113191.awb") ~= 0 then
					local var_226_13 = manager.audio:GetVoiceLength("story_v_out_113191", "113191054", "story_v_out_113191.awb") / 1000

					if var_226_13 + var_226_5 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_13 + var_226_5
					end

					if var_226_8.prefab_name ~= "" and arg_223_1.actors_[var_226_8.prefab_name] ~= nil then
						local var_226_14 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_8.prefab_name].transform, "story_v_out_113191", "113191054", "story_v_out_113191.awb")

						arg_223_1:RecordAudio("113191054", var_226_14)
						arg_223_1:RecordAudio("113191054", var_226_14)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_113191", "113191054", "story_v_out_113191.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_113191", "113191054", "story_v_out_113191.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_15 = math.max(var_226_6, arg_223_1.talkMaxDuration)

			if var_226_5 <= arg_223_1.time_ and arg_223_1.time_ < var_226_5 + var_226_15 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_5) / var_226_15

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_5 + var_226_15 and arg_223_1.time_ < var_226_5 + var_226_15 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play113191055 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 113191055
		arg_227_1.duration_ = 9.333

		local var_227_0 = {
			ja = 9.333,
			ko = 6.8,
			zh = 7.7,
			en = 6.833
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
				arg_227_0:Play113191056(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = 0

			if var_230_0 < arg_227_1.time_ and arg_227_1.time_ <= var_230_0 + arg_230_0 then
				arg_227_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_230_1 = arg_227_1.actors_["1038ui_story"]
			local var_230_2 = 0

			if var_230_2 < arg_227_1.time_ and arg_227_1.time_ <= var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect1038ui_story == nil then
				arg_227_1.var_.characterEffect1038ui_story = var_230_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_3 = 0.2

			if var_230_2 <= arg_227_1.time_ and arg_227_1.time_ < var_230_2 + var_230_3 then
				local var_230_4 = (arg_227_1.time_ - var_230_2) / var_230_3

				if arg_227_1.var_.characterEffect1038ui_story then
					arg_227_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_2 + var_230_3 and arg_227_1.time_ < var_230_2 + var_230_3 + arg_230_0 and arg_227_1.var_.characterEffect1038ui_story then
				arg_227_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_230_5 = 0

			if var_230_5 < arg_227_1.time_ and arg_227_1.time_ <= var_230_5 + arg_230_0 then
				arg_227_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_2")
			end

			local var_230_6 = 0
			local var_230_7 = 0.625

			if var_230_6 < arg_227_1.time_ and arg_227_1.time_ <= var_230_6 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_8 = arg_227_1:FormatText(StoryNameCfg[94].name)

				arg_227_1.leftNameTxt_.text = var_230_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_9 = arg_227_1:GetWordFromCfg(113191055)
				local var_230_10 = arg_227_1:FormatText(var_230_9.content)

				arg_227_1.text_.text = var_230_10

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_11 = 25
				local var_230_12 = utf8.len(var_230_10)
				local var_230_13 = var_230_11 <= 0 and var_230_7 or var_230_7 * (var_230_12 / var_230_11)

				if var_230_13 > 0 and var_230_7 < var_230_13 then
					arg_227_1.talkMaxDuration = var_230_13

					if var_230_13 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_13 + var_230_6
					end
				end

				arg_227_1.text_.text = var_230_10
				arg_227_1.typewritter.percent = 0

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191055", "story_v_out_113191.awb") ~= 0 then
					local var_230_14 = manager.audio:GetVoiceLength("story_v_out_113191", "113191055", "story_v_out_113191.awb") / 1000

					if var_230_14 + var_230_6 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_14 + var_230_6
					end

					if var_230_9.prefab_name ~= "" and arg_227_1.actors_[var_230_9.prefab_name] ~= nil then
						local var_230_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_9.prefab_name].transform, "story_v_out_113191", "113191055", "story_v_out_113191.awb")

						arg_227_1:RecordAudio("113191055", var_230_15)
						arg_227_1:RecordAudio("113191055", var_230_15)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_113191", "113191055", "story_v_out_113191.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_113191", "113191055", "story_v_out_113191.awb")
				end

				arg_227_1:RecordContent(arg_227_1.text_.text)
			end

			local var_230_16 = math.max(var_230_7, arg_227_1.talkMaxDuration)

			if var_230_6 <= arg_227_1.time_ and arg_227_1.time_ < var_230_6 + var_230_16 then
				arg_227_1.typewritter.percent = (arg_227_1.time_ - var_230_6) / var_230_16

				arg_227_1.typewritter:SetDirty()
			end

			if arg_227_1.time_ >= var_230_6 + var_230_16 and arg_227_1.time_ < var_230_6 + var_230_16 + arg_230_0 then
				arg_227_1.typewritter.percent = 1

				arg_227_1.typewritter:SetDirty()
				arg_227_1:ShowNextGo(true)
			end
		end
	end,
	Play113191056 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 113191056
		arg_231_1.duration_ = 1.633

		local var_231_0 = {
			ja = 1.3,
			ko = 1.6,
			zh = 1.633,
			en = 1.166
		}
		local var_231_1 = manager.audio:GetLocalizationFlag()

		if var_231_0[var_231_1] ~= nil then
			arg_231_1.duration_ = var_231_0[var_231_1]
		end

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
		end

		function arg_231_1.playNext_(arg_233_0)
			if arg_233_0 == 1 then
				arg_231_0:Play113191057(arg_231_1)
			end
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1038ui_story"].transform
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 then
				arg_231_1.var_.moveOldPos1038ui_story = var_234_0.localPosition
			end

			local var_234_2 = 0.001

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2
				local var_234_4 = Vector3.New(0, 100, 0)

				var_234_0.localPosition = Vector3.Lerp(arg_231_1.var_.moveOldPos1038ui_story, var_234_4, var_234_3)

				local var_234_5 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_5.x, var_234_5.y, var_234_5.z)

				local var_234_6 = var_234_0.localEulerAngles

				var_234_6.z = 0
				var_234_6.x = 0
				var_234_0.localEulerAngles = var_234_6
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 then
				var_234_0.localPosition = Vector3.New(0, 100, 0)

				local var_234_7 = manager.ui.mainCamera.transform.position - var_234_0.position

				var_234_0.forward = Vector3.New(var_234_7.x, var_234_7.y, var_234_7.z)

				local var_234_8 = var_234_0.localEulerAngles

				var_234_8.z = 0
				var_234_8.x = 0
				var_234_0.localEulerAngles = var_234_8
			end

			local var_234_9 = 0
			local var_234_10 = 0.05

			if var_234_9 < arg_231_1.time_ and arg_231_1.time_ <= var_234_9 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, true)

				local var_234_11 = arg_231_1:FormatText(StoryNameCfg[208].name)

				arg_231_1.leftNameTxt_.text = var_234_11

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_231_1.leftNameTxt_.transform)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1.leftNameTxt_.text)
				SetActive(arg_231_1.iconTrs_.gameObject, true)
				arg_231_1.iconController_:SetSelectedState("hero")

				arg_231_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_12 = arg_231_1:GetWordFromCfg(113191056)
				local var_234_13 = arg_231_1:FormatText(var_234_12.content)

				arg_231_1.text_.text = var_234_13

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_14 = 2
				local var_234_15 = utf8.len(var_234_13)
				local var_234_16 = var_234_14 <= 0 and var_234_10 or var_234_10 * (var_234_15 / var_234_14)

				if var_234_16 > 0 and var_234_10 < var_234_16 then
					arg_231_1.talkMaxDuration = var_234_16

					if var_234_16 + var_234_9 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_16 + var_234_9
					end
				end

				arg_231_1.text_.text = var_234_13
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191056", "story_v_out_113191.awb") ~= 0 then
					local var_234_17 = manager.audio:GetVoiceLength("story_v_out_113191", "113191056", "story_v_out_113191.awb") / 1000

					if var_234_17 + var_234_9 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_17 + var_234_9
					end

					if var_234_12.prefab_name ~= "" and arg_231_1.actors_[var_234_12.prefab_name] ~= nil then
						local var_234_18 = LuaForUtil.PlayVoiceWithCriLipsync(arg_231_1.actors_[var_234_12.prefab_name].transform, "story_v_out_113191", "113191056", "story_v_out_113191.awb")

						arg_231_1:RecordAudio("113191056", var_234_18)
						arg_231_1:RecordAudio("113191056", var_234_18)
					else
						arg_231_1:AudioAction("play", "voice", "story_v_out_113191", "113191056", "story_v_out_113191.awb")
					end

					arg_231_1:RecordHistoryTalkVoice("story_v_out_113191", "113191056", "story_v_out_113191.awb")
				end

				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_19 = math.max(var_234_10, arg_231_1.talkMaxDuration)

			if var_234_9 <= arg_231_1.time_ and arg_231_1.time_ < var_234_9 + var_234_19 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_9) / var_234_19

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_9 + var_234_19 and arg_231_1.time_ < var_234_9 + var_234_19 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	Play113191057 = function(arg_235_0, arg_235_1)
		arg_235_1.time_ = 0
		arg_235_1.frameCnt_ = 0
		arg_235_1.state_ = "playing"
		arg_235_1.curTalkId_ = 113191057
		arg_235_1.duration_ = 4

		local var_235_0 = {
			ja = 3.333,
			ko = 4,
			zh = 2.433,
			en = 3.333
		}
		local var_235_1 = manager.audio:GetLocalizationFlag()

		if var_235_0[var_235_1] ~= nil then
			arg_235_1.duration_ = var_235_0[var_235_1]
		end

		SetActive(arg_235_1.tipsGo_, false)

		function arg_235_1.onSingleLineFinish_()
			arg_235_1.onSingleLineUpdate_ = nil
			arg_235_1.onSingleLineFinish_ = nil
			arg_235_1.state_ = "waiting"
		end

		function arg_235_1.playNext_(arg_237_0)
			if arg_237_0 == 1 then
				arg_235_0:Play113191058(arg_235_1)
			end
		end

		function arg_235_1.onSingleLineUpdate_(arg_238_0)
			local var_238_0 = arg_235_1.actors_["1084ui_story"].transform
			local var_238_1 = 0

			if var_238_1 < arg_235_1.time_ and arg_235_1.time_ <= var_238_1 + arg_238_0 then
				arg_235_1.var_.moveOldPos1084ui_story = var_238_0.localPosition

				local var_238_2 = "1084ui_story"

				arg_235_1:ShowWeapon(arg_235_1.var_[var_238_2 .. "Animator"].transform, false)
			end

			local var_238_3 = 0.001

			if var_238_1 <= arg_235_1.time_ and arg_235_1.time_ < var_238_1 + var_238_3 then
				local var_238_4 = (arg_235_1.time_ - var_238_1) / var_238_3
				local var_238_5 = Vector3.New(-0.7, -0.97, -6)

				var_238_0.localPosition = Vector3.Lerp(arg_235_1.var_.moveOldPos1084ui_story, var_238_5, var_238_4)

				local var_238_6 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_6.x, var_238_6.y, var_238_6.z)

				local var_238_7 = var_238_0.localEulerAngles

				var_238_7.z = 0
				var_238_7.x = 0
				var_238_0.localEulerAngles = var_238_7
			end

			if arg_235_1.time_ >= var_238_1 + var_238_3 and arg_235_1.time_ < var_238_1 + var_238_3 + arg_238_0 then
				var_238_0.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_238_8 = manager.ui.mainCamera.transform.position - var_238_0.position

				var_238_0.forward = Vector3.New(var_238_8.x, var_238_8.y, var_238_8.z)

				local var_238_9 = var_238_0.localEulerAngles

				var_238_9.z = 0
				var_238_9.x = 0
				var_238_0.localEulerAngles = var_238_9
			end

			local var_238_10 = 0

			if var_238_10 < arg_235_1.time_ and arg_235_1.time_ <= var_238_10 + arg_238_0 then
				arg_235_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action13_1")
			end

			local var_238_11 = arg_235_1.actors_["1084ui_story"]
			local var_238_12 = 0

			if var_238_12 < arg_235_1.time_ and arg_235_1.time_ <= var_238_12 + arg_238_0 and arg_235_1.var_.characterEffect1084ui_story == nil then
				arg_235_1.var_.characterEffect1084ui_story = var_238_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_238_13 = 0.2

			if var_238_12 <= arg_235_1.time_ and arg_235_1.time_ < var_238_12 + var_238_13 then
				local var_238_14 = (arg_235_1.time_ - var_238_12) / var_238_13

				if arg_235_1.var_.characterEffect1084ui_story then
					arg_235_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_235_1.time_ >= var_238_12 + var_238_13 and arg_235_1.time_ < var_238_12 + var_238_13 + arg_238_0 and arg_235_1.var_.characterEffect1084ui_story then
				arg_235_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_238_15 = 0

			if var_238_15 < arg_235_1.time_ and arg_235_1.time_ <= var_238_15 + arg_238_0 then
				arg_235_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_238_16 = 0
			local var_238_17 = 0.275

			if var_238_16 < arg_235_1.time_ and arg_235_1.time_ <= var_238_16 + arg_238_0 then
				arg_235_1.talkMaxDuration = 0
				arg_235_1.dialogCg_.alpha = 1

				arg_235_1.dialog_:SetActive(true)
				SetActive(arg_235_1.leftNameGo_, true)

				local var_238_18 = arg_235_1:FormatText(StoryNameCfg[6].name)

				arg_235_1.leftNameTxt_.text = var_238_18

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_235_1.leftNameTxt_.transform)

				arg_235_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_235_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_235_1:RecordName(arg_235_1.leftNameTxt_.text)
				SetActive(arg_235_1.iconTrs_.gameObject, false)
				arg_235_1.callingController_:SetSelectedState("normal")

				local var_238_19 = arg_235_1:GetWordFromCfg(113191057)
				local var_238_20 = arg_235_1:FormatText(var_238_19.content)

				arg_235_1.text_.text = var_238_20

				LuaForUtil.ClearLinePrefixSymbol(arg_235_1.text_)

				local var_238_21 = 11
				local var_238_22 = utf8.len(var_238_20)
				local var_238_23 = var_238_21 <= 0 and var_238_17 or var_238_17 * (var_238_22 / var_238_21)

				if var_238_23 > 0 and var_238_17 < var_238_23 then
					arg_235_1.talkMaxDuration = var_238_23

					if var_238_23 + var_238_16 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_23 + var_238_16
					end
				end

				arg_235_1.text_.text = var_238_20
				arg_235_1.typewritter.percent = 0

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191057", "story_v_out_113191.awb") ~= 0 then
					local var_238_24 = manager.audio:GetVoiceLength("story_v_out_113191", "113191057", "story_v_out_113191.awb") / 1000

					if var_238_24 + var_238_16 > arg_235_1.duration_ then
						arg_235_1.duration_ = var_238_24 + var_238_16
					end

					if var_238_19.prefab_name ~= "" and arg_235_1.actors_[var_238_19.prefab_name] ~= nil then
						local var_238_25 = LuaForUtil.PlayVoiceWithCriLipsync(arg_235_1.actors_[var_238_19.prefab_name].transform, "story_v_out_113191", "113191057", "story_v_out_113191.awb")

						arg_235_1:RecordAudio("113191057", var_238_25)
						arg_235_1:RecordAudio("113191057", var_238_25)
					else
						arg_235_1:AudioAction("play", "voice", "story_v_out_113191", "113191057", "story_v_out_113191.awb")
					end

					arg_235_1:RecordHistoryTalkVoice("story_v_out_113191", "113191057", "story_v_out_113191.awb")
				end

				arg_235_1:RecordContent(arg_235_1.text_.text)
			end

			local var_238_26 = math.max(var_238_17, arg_235_1.talkMaxDuration)

			if var_238_16 <= arg_235_1.time_ and arg_235_1.time_ < var_238_16 + var_238_26 then
				arg_235_1.typewritter.percent = (arg_235_1.time_ - var_238_16) / var_238_26

				arg_235_1.typewritter:SetDirty()
			end

			if arg_235_1.time_ >= var_238_16 + var_238_26 and arg_235_1.time_ < var_238_16 + var_238_26 + arg_238_0 then
				arg_235_1.typewritter.percent = 1

				arg_235_1.typewritter:SetDirty()
				arg_235_1:ShowNextGo(true)
			end
		end
	end,
	Play113191058 = function(arg_239_0, arg_239_1)
		arg_239_1.time_ = 0
		arg_239_1.frameCnt_ = 0
		arg_239_1.state_ = "playing"
		arg_239_1.curTalkId_ = 113191058
		arg_239_1.duration_ = 4.833

		local var_239_0 = {
			ja = 4.833,
			ko = 4.733,
			zh = 3.4,
			en = 4.533
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
				arg_239_0:Play113191059(arg_239_1)
			end
		end

		function arg_239_1.onSingleLineUpdate_(arg_242_0)
			local var_242_0 = arg_239_1.actors_["1084ui_story"]
			local var_242_1 = 0

			if var_242_1 < arg_239_1.time_ and arg_239_1.time_ <= var_242_1 + arg_242_0 and arg_239_1.var_.characterEffect1084ui_story == nil then
				arg_239_1.var_.characterEffect1084ui_story = var_242_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_2 = 0.2

			if var_242_1 <= arg_239_1.time_ and arg_239_1.time_ < var_242_1 + var_242_2 then
				local var_242_3 = (arg_239_1.time_ - var_242_1) / var_242_2

				if arg_239_1.var_.characterEffect1084ui_story then
					local var_242_4 = Mathf.Lerp(0, 0.5, var_242_3)

					arg_239_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_239_1.var_.characterEffect1084ui_story.fillRatio = var_242_4
				end
			end

			if arg_239_1.time_ >= var_242_1 + var_242_2 and arg_239_1.time_ < var_242_1 + var_242_2 + arg_242_0 and arg_239_1.var_.characterEffect1084ui_story then
				local var_242_5 = 0.5

				arg_239_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_239_1.var_.characterEffect1084ui_story.fillRatio = var_242_5
			end

			local var_242_6 = arg_239_1.actors_["1038ui_story"].transform
			local var_242_7 = 0

			if var_242_7 < arg_239_1.time_ and arg_239_1.time_ <= var_242_7 + arg_242_0 then
				arg_239_1.var_.moveOldPos1038ui_story = var_242_6.localPosition
			end

			local var_242_8 = 0.001

			if var_242_7 <= arg_239_1.time_ and arg_239_1.time_ < var_242_7 + var_242_8 then
				local var_242_9 = (arg_239_1.time_ - var_242_7) / var_242_8
				local var_242_10 = Vector3.New(0.7, -1.11, -5.9)

				var_242_6.localPosition = Vector3.Lerp(arg_239_1.var_.moveOldPos1038ui_story, var_242_10, var_242_9)

				local var_242_11 = manager.ui.mainCamera.transform.position - var_242_6.position

				var_242_6.forward = Vector3.New(var_242_11.x, var_242_11.y, var_242_11.z)

				local var_242_12 = var_242_6.localEulerAngles

				var_242_12.z = 0
				var_242_12.x = 0
				var_242_6.localEulerAngles = var_242_12
			end

			if arg_239_1.time_ >= var_242_7 + var_242_8 and arg_239_1.time_ < var_242_7 + var_242_8 + arg_242_0 then
				var_242_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_242_13 = manager.ui.mainCamera.transform.position - var_242_6.position

				var_242_6.forward = Vector3.New(var_242_13.x, var_242_13.y, var_242_13.z)

				local var_242_14 = var_242_6.localEulerAngles

				var_242_14.z = 0
				var_242_14.x = 0
				var_242_6.localEulerAngles = var_242_14
			end

			local var_242_15 = 0

			if var_242_15 < arg_239_1.time_ and arg_239_1.time_ <= var_242_15 + arg_242_0 then
				arg_239_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action1_1")
			end

			local var_242_16 = 0

			if var_242_16 < arg_239_1.time_ and arg_239_1.time_ <= var_242_16 + arg_242_0 then
				arg_239_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_242_17 = arg_239_1.actors_["1038ui_story"]
			local var_242_18 = 0

			if var_242_18 < arg_239_1.time_ and arg_239_1.time_ <= var_242_18 + arg_242_0 and arg_239_1.var_.characterEffect1038ui_story == nil then
				arg_239_1.var_.characterEffect1038ui_story = var_242_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_242_19 = 0.2

			if var_242_18 <= arg_239_1.time_ and arg_239_1.time_ < var_242_18 + var_242_19 then
				local var_242_20 = (arg_239_1.time_ - var_242_18) / var_242_19

				if arg_239_1.var_.characterEffect1038ui_story then
					arg_239_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_239_1.time_ >= var_242_18 + var_242_19 and arg_239_1.time_ < var_242_18 + var_242_19 + arg_242_0 and arg_239_1.var_.characterEffect1038ui_story then
				arg_239_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_242_21 = 0
			local var_242_22 = 0.425

			if var_242_21 < arg_239_1.time_ and arg_239_1.time_ <= var_242_21 + arg_242_0 then
				arg_239_1.talkMaxDuration = 0
				arg_239_1.dialogCg_.alpha = 1

				arg_239_1.dialog_:SetActive(true)
				SetActive(arg_239_1.leftNameGo_, true)

				local var_242_23 = arg_239_1:FormatText(StoryNameCfg[94].name)

				arg_239_1.leftNameTxt_.text = var_242_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_239_1.leftNameTxt_.transform)

				arg_239_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_239_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_239_1:RecordName(arg_239_1.leftNameTxt_.text)
				SetActive(arg_239_1.iconTrs_.gameObject, false)
				arg_239_1.callingController_:SetSelectedState("normal")

				local var_242_24 = arg_239_1:GetWordFromCfg(113191058)
				local var_242_25 = arg_239_1:FormatText(var_242_24.content)

				arg_239_1.text_.text = var_242_25

				LuaForUtil.ClearLinePrefixSymbol(arg_239_1.text_)

				local var_242_26 = 17
				local var_242_27 = utf8.len(var_242_25)
				local var_242_28 = var_242_26 <= 0 and var_242_22 or var_242_22 * (var_242_27 / var_242_26)

				if var_242_28 > 0 and var_242_22 < var_242_28 then
					arg_239_1.talkMaxDuration = var_242_28

					if var_242_28 + var_242_21 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_28 + var_242_21
					end
				end

				arg_239_1.text_.text = var_242_25
				arg_239_1.typewritter.percent = 0

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191058", "story_v_out_113191.awb") ~= 0 then
					local var_242_29 = manager.audio:GetVoiceLength("story_v_out_113191", "113191058", "story_v_out_113191.awb") / 1000

					if var_242_29 + var_242_21 > arg_239_1.duration_ then
						arg_239_1.duration_ = var_242_29 + var_242_21
					end

					if var_242_24.prefab_name ~= "" and arg_239_1.actors_[var_242_24.prefab_name] ~= nil then
						local var_242_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_239_1.actors_[var_242_24.prefab_name].transform, "story_v_out_113191", "113191058", "story_v_out_113191.awb")

						arg_239_1:RecordAudio("113191058", var_242_30)
						arg_239_1:RecordAudio("113191058", var_242_30)
					else
						arg_239_1:AudioAction("play", "voice", "story_v_out_113191", "113191058", "story_v_out_113191.awb")
					end

					arg_239_1:RecordHistoryTalkVoice("story_v_out_113191", "113191058", "story_v_out_113191.awb")
				end

				arg_239_1:RecordContent(arg_239_1.text_.text)
			end

			local var_242_31 = math.max(var_242_22, arg_239_1.talkMaxDuration)

			if var_242_21 <= arg_239_1.time_ and arg_239_1.time_ < var_242_21 + var_242_31 then
				arg_239_1.typewritter.percent = (arg_239_1.time_ - var_242_21) / var_242_31

				arg_239_1.typewritter:SetDirty()
			end

			if arg_239_1.time_ >= var_242_21 + var_242_31 and arg_239_1.time_ < var_242_21 + var_242_31 + arg_242_0 then
				arg_239_1.typewritter.percent = 1

				arg_239_1.typewritter:SetDirty()
				arg_239_1:ShowNextGo(true)
			end
		end
	end,
	Play113191059 = function(arg_243_0, arg_243_1)
		arg_243_1.time_ = 0
		arg_243_1.frameCnt_ = 0
		arg_243_1.state_ = "playing"
		arg_243_1.curTalkId_ = 113191059
		arg_243_1.duration_ = 2.133

		local var_243_0 = {
			ja = 2.133,
			ko = 1.333,
			zh = 1.333,
			en = 1.4
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
				arg_243_0:Play113191060(arg_243_1)
			end
		end

		function arg_243_1.onSingleLineUpdate_(arg_246_0)
			local var_246_0 = arg_243_1.actors_["1038ui_story"].transform
			local var_246_1 = 0

			if var_246_1 < arg_243_1.time_ and arg_243_1.time_ <= var_246_1 + arg_246_0 then
				arg_243_1.var_.moveOldPos1038ui_story = var_246_0.localPosition
			end

			local var_246_2 = 0.001

			if var_246_1 <= arg_243_1.time_ and arg_243_1.time_ < var_246_1 + var_246_2 then
				local var_246_3 = (arg_243_1.time_ - var_246_1) / var_246_2
				local var_246_4 = Vector3.New(0, 100, 0)

				var_246_0.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1038ui_story, var_246_4, var_246_3)

				local var_246_5 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_5.x, var_246_5.y, var_246_5.z)

				local var_246_6 = var_246_0.localEulerAngles

				var_246_6.z = 0
				var_246_6.x = 0
				var_246_0.localEulerAngles = var_246_6
			end

			if arg_243_1.time_ >= var_246_1 + var_246_2 and arg_243_1.time_ < var_246_1 + var_246_2 + arg_246_0 then
				var_246_0.localPosition = Vector3.New(0, 100, 0)

				local var_246_7 = manager.ui.mainCamera.transform.position - var_246_0.position

				var_246_0.forward = Vector3.New(var_246_7.x, var_246_7.y, var_246_7.z)

				local var_246_8 = var_246_0.localEulerAngles

				var_246_8.z = 0
				var_246_8.x = 0
				var_246_0.localEulerAngles = var_246_8
			end

			local var_246_9 = arg_243_1.actors_["1084ui_story"].transform
			local var_246_10 = 0

			if var_246_10 < arg_243_1.time_ and arg_243_1.time_ <= var_246_10 + arg_246_0 then
				arg_243_1.var_.moveOldPos1084ui_story = var_246_9.localPosition
			end

			local var_246_11 = 0.001

			if var_246_10 <= arg_243_1.time_ and arg_243_1.time_ < var_246_10 + var_246_11 then
				local var_246_12 = (arg_243_1.time_ - var_246_10) / var_246_11
				local var_246_13 = Vector3.New(0, 100, 0)

				var_246_9.localPosition = Vector3.Lerp(arg_243_1.var_.moveOldPos1084ui_story, var_246_13, var_246_12)

				local var_246_14 = manager.ui.mainCamera.transform.position - var_246_9.position

				var_246_9.forward = Vector3.New(var_246_14.x, var_246_14.y, var_246_14.z)

				local var_246_15 = var_246_9.localEulerAngles

				var_246_15.z = 0
				var_246_15.x = 0
				var_246_9.localEulerAngles = var_246_15
			end

			if arg_243_1.time_ >= var_246_10 + var_246_11 and arg_243_1.time_ < var_246_10 + var_246_11 + arg_246_0 then
				var_246_9.localPosition = Vector3.New(0, 100, 0)

				local var_246_16 = manager.ui.mainCamera.transform.position - var_246_9.position

				var_246_9.forward = Vector3.New(var_246_16.x, var_246_16.y, var_246_16.z)

				local var_246_17 = var_246_9.localEulerAngles

				var_246_17.z = 0
				var_246_17.x = 0
				var_246_9.localEulerAngles = var_246_17
			end

			local var_246_18 = 0
			local var_246_19 = 0.05

			if var_246_18 < arg_243_1.time_ and arg_243_1.time_ <= var_246_18 + arg_246_0 then
				arg_243_1.talkMaxDuration = 0
				arg_243_1.dialogCg_.alpha = 1

				arg_243_1.dialog_:SetActive(true)
				SetActive(arg_243_1.leftNameGo_, true)

				local var_246_20 = arg_243_1:FormatText(StoryNameCfg[208].name)

				arg_243_1.leftNameTxt_.text = var_246_20

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_243_1.leftNameTxt_.transform)

				arg_243_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_243_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_243_1:RecordName(arg_243_1.leftNameTxt_.text)
				SetActive(arg_243_1.iconTrs_.gameObject, true)
				arg_243_1.iconController_:SetSelectedState("hero")

				arg_243_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_1041")

				arg_243_1.callingController_:SetSelectedState("normal")

				local var_246_21 = arg_243_1:GetWordFromCfg(113191059)
				local var_246_22 = arg_243_1:FormatText(var_246_21.content)

				arg_243_1.text_.text = var_246_22

				LuaForUtil.ClearLinePrefixSymbol(arg_243_1.text_)

				local var_246_23 = 2
				local var_246_24 = utf8.len(var_246_22)
				local var_246_25 = var_246_23 <= 0 and var_246_19 or var_246_19 * (var_246_24 / var_246_23)

				if var_246_25 > 0 and var_246_19 < var_246_25 then
					arg_243_1.talkMaxDuration = var_246_25

					if var_246_25 + var_246_18 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_25 + var_246_18
					end
				end

				arg_243_1.text_.text = var_246_22
				arg_243_1.typewritter.percent = 0

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191059", "story_v_out_113191.awb") ~= 0 then
					local var_246_26 = manager.audio:GetVoiceLength("story_v_out_113191", "113191059", "story_v_out_113191.awb") / 1000

					if var_246_26 + var_246_18 > arg_243_1.duration_ then
						arg_243_1.duration_ = var_246_26 + var_246_18
					end

					if var_246_21.prefab_name ~= "" and arg_243_1.actors_[var_246_21.prefab_name] ~= nil then
						local var_246_27 = LuaForUtil.PlayVoiceWithCriLipsync(arg_243_1.actors_[var_246_21.prefab_name].transform, "story_v_out_113191", "113191059", "story_v_out_113191.awb")

						arg_243_1:RecordAudio("113191059", var_246_27)
						arg_243_1:RecordAudio("113191059", var_246_27)
					else
						arg_243_1:AudioAction("play", "voice", "story_v_out_113191", "113191059", "story_v_out_113191.awb")
					end

					arg_243_1:RecordHistoryTalkVoice("story_v_out_113191", "113191059", "story_v_out_113191.awb")
				end

				arg_243_1:RecordContent(arg_243_1.text_.text)
			end

			local var_246_28 = math.max(var_246_19, arg_243_1.talkMaxDuration)

			if var_246_18 <= arg_243_1.time_ and arg_243_1.time_ < var_246_18 + var_246_28 then
				arg_243_1.typewritter.percent = (arg_243_1.time_ - var_246_18) / var_246_28

				arg_243_1.typewritter:SetDirty()
			end

			if arg_243_1.time_ >= var_246_18 + var_246_28 and arg_243_1.time_ < var_246_18 + var_246_28 + arg_246_0 then
				arg_243_1.typewritter.percent = 1

				arg_243_1.typewritter:SetDirty()
				arg_243_1:ShowNextGo(true)
			end
		end
	end,
	Play113191060 = function(arg_247_0, arg_247_1)
		arg_247_1.time_ = 0
		arg_247_1.frameCnt_ = 0
		arg_247_1.state_ = "playing"
		arg_247_1.curTalkId_ = 113191060
		arg_247_1.duration_ = 9.033

		local var_247_0 = {
			ja = 9.033,
			ko = 8.1,
			zh = 7.4,
			en = 7.833
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
				arg_247_0:Play113191061(arg_247_1)
			end
		end

		function arg_247_1.onSingleLineUpdate_(arg_250_0)
			local var_250_0 = 0

			if var_250_0 < arg_247_1.time_ and arg_247_1.time_ <= var_250_0 + arg_250_0 then
				arg_247_1.mask_.enabled = true
				arg_247_1.mask_.raycastTarget = true

				arg_247_1:SetGaussion(false)
			end

			local var_250_1 = 2

			if var_250_0 <= arg_247_1.time_ and arg_247_1.time_ < var_250_0 + var_250_1 then
				local var_250_2 = (arg_247_1.time_ - var_250_0) / var_250_1
				local var_250_3 = Color.New(0, 0, 0)

				var_250_3.a = Mathf.Lerp(0, 1, var_250_2)
				arg_247_1.mask_.color = var_250_3
			end

			if arg_247_1.time_ >= var_250_0 + var_250_1 and arg_247_1.time_ < var_250_0 + var_250_1 + arg_250_0 then
				local var_250_4 = Color.New(0, 0, 0)

				var_250_4.a = 1
				arg_247_1.mask_.color = var_250_4
			end

			local var_250_5 = 2

			if var_250_5 < arg_247_1.time_ and arg_247_1.time_ <= var_250_5 + arg_250_0 then
				arg_247_1.mask_.enabled = true
				arg_247_1.mask_.raycastTarget = true

				arg_247_1:SetGaussion(false)
			end

			local var_250_6 = 2

			if var_250_5 <= arg_247_1.time_ and arg_247_1.time_ < var_250_5 + var_250_6 then
				local var_250_7 = (arg_247_1.time_ - var_250_5) / var_250_6
				local var_250_8 = Color.New(0, 0, 0)

				var_250_8.a = Mathf.Lerp(1, 0, var_250_7)
				arg_247_1.mask_.color = var_250_8
			end

			if arg_247_1.time_ >= var_250_5 + var_250_6 and arg_247_1.time_ < var_250_5 + var_250_6 + arg_250_0 then
				local var_250_9 = Color.New(0, 0, 0)
				local var_250_10 = 0

				arg_247_1.mask_.enabled = false
				var_250_9.a = var_250_10
				arg_247_1.mask_.color = var_250_9
			end

			local var_250_11 = "OM0107"

			if arg_247_1.bgs_[var_250_11] == nil then
				local var_250_12 = Object.Instantiate(arg_247_1.paintGo_)

				var_250_12:GetComponent("SpriteRenderer").sprite = getSpriteWithoutAtlas("TextureConfig/Background/" .. var_250_11)
				var_250_12.name = var_250_11
				var_250_12.transform.parent = arg_247_1.stage_.transform
				var_250_12.transform.localPosition = Vector3.New(0, 100, 0)
				arg_247_1.bgs_[var_250_11] = var_250_12
			end

			local var_250_13 = 2

			if var_250_13 < arg_247_1.time_ and arg_247_1.time_ <= var_250_13 + arg_250_0 then
				local var_250_14 = manager.ui.mainCamera.transform.localPosition
				local var_250_15 = Vector3.New(0, 0, 10) + Vector3.New(var_250_14.x, var_250_14.y, 0)
				local var_250_16 = arg_247_1.bgs_.OM0107

				var_250_16.transform.localPosition = var_250_15
				var_250_16.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_250_17 = var_250_16:GetComponent("SpriteRenderer")

				if var_250_17 and var_250_17.sprite then
					local var_250_18 = (var_250_16.transform.localPosition - var_250_14).z
					local var_250_19 = manager.ui.mainCameraCom_
					local var_250_20 = 2 * var_250_18 * Mathf.Tan(var_250_19.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_250_21 = var_250_20 * var_250_19.aspect
					local var_250_22 = var_250_17.sprite.bounds.size.x
					local var_250_23 = var_250_17.sprite.bounds.size.y
					local var_250_24 = var_250_21 / var_250_22
					local var_250_25 = var_250_20 / var_250_23
					local var_250_26 = var_250_25 < var_250_24 and var_250_24 or var_250_25

					var_250_16.transform.localScale = Vector3.New(var_250_26, var_250_26, 0)
				end

				for iter_250_0, iter_250_1 in pairs(arg_247_1.bgs_) do
					if iter_250_0 ~= "OM0107" then
						iter_250_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_250_27 = arg_247_1.bgs_.OM0107.transform
			local var_250_28 = 2

			if var_250_28 < arg_247_1.time_ and arg_247_1.time_ <= var_250_28 + arg_250_0 then
				arg_247_1.var_.moveOldPosOM0107 = var_250_27.localPosition
			end

			local var_250_29 = 0.001

			if var_250_28 <= arg_247_1.time_ and arg_247_1.time_ < var_250_28 + var_250_29 then
				local var_250_30 = (arg_247_1.time_ - var_250_28) / var_250_29
				local var_250_31 = Vector3.New(-3.8, 2.5, 0)

				var_250_27.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPosOM0107, var_250_31, var_250_30)
			end

			if arg_247_1.time_ >= var_250_28 + var_250_29 and arg_247_1.time_ < var_250_28 + var_250_29 + arg_250_0 then
				var_250_27.localPosition = Vector3.New(-3.8, 2.5, 0)
			end

			local var_250_32 = arg_247_1.bgs_.OM0107.transform
			local var_250_33 = 2.034

			if var_250_33 < arg_247_1.time_ and arg_247_1.time_ <= var_250_33 + arg_250_0 then
				arg_247_1.var_.moveOldPosOM0107 = var_250_32.localPosition
			end

			local var_250_34 = 5

			if var_250_33 <= arg_247_1.time_ and arg_247_1.time_ < var_250_33 + var_250_34 then
				local var_250_35 = (arg_247_1.time_ - var_250_33) / var_250_34
				local var_250_36 = Vector3.New(-3.8, 2.25, 0)

				var_250_32.localPosition = Vector3.Lerp(arg_247_1.var_.moveOldPosOM0107, var_250_36, var_250_35)
			end

			if arg_247_1.time_ >= var_250_33 + var_250_34 and arg_247_1.time_ < var_250_33 + var_250_34 + arg_250_0 then
				var_250_32.localPosition = Vector3.New(-3.8, 2.25, 0)
			end

			local var_250_37 = 2

			if var_250_37 < arg_247_1.time_ and arg_247_1.time_ <= var_250_37 + arg_250_0 then
				arg_247_1.allBtn_.enabled = false
			end

			local var_250_38 = 5.034

			if arg_247_1.time_ >= var_250_37 + var_250_38 and arg_247_1.time_ < var_250_37 + var_250_38 + arg_250_0 then
				arg_247_1.allBtn_.enabled = true
			end

			if arg_247_1.frameCnt_ <= 1 then
				arg_247_1.dialog_:SetActive(false)
			end

			local var_250_39 = 4
			local var_250_40 = 0.4

			if var_250_39 < arg_247_1.time_ and arg_247_1.time_ <= var_250_39 + arg_250_0 then
				arg_247_1.talkMaxDuration = 0

				arg_247_1.dialog_:SetActive(true)

				local var_250_41 = LeanTween.value(arg_247_1.dialog_, 0, 1, 0.3)

				var_250_41:setOnUpdate(LuaHelper.FloatAction(function(arg_251_0)
					arg_247_1.dialogCg_.alpha = arg_251_0
				end))
				var_250_41:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_247_1.dialog_)
					var_250_41:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_247_1.duration_ = arg_247_1.duration_ + 0.3

				SetActive(arg_247_1.leftNameGo_, true)

				local var_250_42 = arg_247_1:FormatText(StoryNameCfg[208].name)

				arg_247_1.leftNameTxt_.text = var_250_42

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_247_1.leftNameTxt_.transform)

				arg_247_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_247_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_247_1:RecordName(arg_247_1.leftNameTxt_.text)
				SetActive(arg_247_1.iconTrs_.gameObject, false)
				arg_247_1.callingController_:SetSelectedState("normal")

				local var_250_43 = arg_247_1:GetWordFromCfg(113191060)
				local var_250_44 = arg_247_1:FormatText(var_250_43.content)

				arg_247_1.text_.text = var_250_44

				LuaForUtil.ClearLinePrefixSymbol(arg_247_1.text_)

				local var_250_45 = 16
				local var_250_46 = utf8.len(var_250_44)
				local var_250_47 = var_250_45 <= 0 and var_250_40 or var_250_40 * (var_250_46 / var_250_45)

				if var_250_47 > 0 and var_250_40 < var_250_47 then
					arg_247_1.talkMaxDuration = var_250_47
					var_250_39 = var_250_39 + 0.3

					if var_250_47 + var_250_39 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_47 + var_250_39
					end
				end

				arg_247_1.text_.text = var_250_44
				arg_247_1.typewritter.percent = 0

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191060", "story_v_out_113191.awb") ~= 0 then
					local var_250_48 = manager.audio:GetVoiceLength("story_v_out_113191", "113191060", "story_v_out_113191.awb") / 1000

					if var_250_48 + var_250_39 > arg_247_1.duration_ then
						arg_247_1.duration_ = var_250_48 + var_250_39
					end

					if var_250_43.prefab_name ~= "" and arg_247_1.actors_[var_250_43.prefab_name] ~= nil then
						local var_250_49 = LuaForUtil.PlayVoiceWithCriLipsync(arg_247_1.actors_[var_250_43.prefab_name].transform, "story_v_out_113191", "113191060", "story_v_out_113191.awb")

						arg_247_1:RecordAudio("113191060", var_250_49)
						arg_247_1:RecordAudio("113191060", var_250_49)
					else
						arg_247_1:AudioAction("play", "voice", "story_v_out_113191", "113191060", "story_v_out_113191.awb")
					end

					arg_247_1:RecordHistoryTalkVoice("story_v_out_113191", "113191060", "story_v_out_113191.awb")
				end

				arg_247_1:RecordContent(arg_247_1.text_.text)
			end

			local var_250_50 = var_250_39 + 0.3
			local var_250_51 = math.max(var_250_40, arg_247_1.talkMaxDuration)

			if var_250_50 <= arg_247_1.time_ and arg_247_1.time_ < var_250_50 + var_250_51 then
				arg_247_1.typewritter.percent = (arg_247_1.time_ - var_250_50) / var_250_51

				arg_247_1.typewritter:SetDirty()
			end

			if arg_247_1.time_ >= var_250_50 + var_250_51 and arg_247_1.time_ < var_250_50 + var_250_51 + arg_250_0 then
				arg_247_1.typewritter.percent = 1

				arg_247_1.typewritter:SetDirty()
				arg_247_1:ShowNextGo(true)
			end
		end
	end,
	Play113191061 = function(arg_253_0, arg_253_1)
		arg_253_1.time_ = 0
		arg_253_1.frameCnt_ = 0
		arg_253_1.state_ = "playing"
		arg_253_1.curTalkId_ = 113191061
		arg_253_1.duration_ = 10.433

		local var_253_0 = {
			ja = 9.966,
			ko = 8.533,
			zh = 10.433,
			en = 9.7
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
				arg_253_0:Play113191062(arg_253_1)
			end
		end

		function arg_253_1.onSingleLineUpdate_(arg_256_0)
			local var_256_0 = 2

			if var_256_0 < arg_253_1.time_ and arg_253_1.time_ <= var_256_0 + arg_256_0 then
				arg_253_1.mask_.enabled = true
				arg_253_1.mask_.raycastTarget = true

				arg_253_1:SetGaussion(false)
			end

			local var_256_1 = 2

			if var_256_0 <= arg_253_1.time_ and arg_253_1.time_ < var_256_0 + var_256_1 then
				local var_256_2 = (arg_253_1.time_ - var_256_0) / var_256_1
				local var_256_3 = Color.New(0, 0, 0)

				var_256_3.a = Mathf.Lerp(1, 0, var_256_2)
				arg_253_1.mask_.color = var_256_3
			end

			if arg_253_1.time_ >= var_256_0 + var_256_1 and arg_253_1.time_ < var_256_0 + var_256_1 + arg_256_0 then
				local var_256_4 = Color.New(0, 0, 0)
				local var_256_5 = 0

				arg_253_1.mask_.enabled = false
				var_256_4.a = var_256_5
				arg_253_1.mask_.color = var_256_4
			end

			local var_256_6 = 0

			if var_256_6 < arg_253_1.time_ and arg_253_1.time_ <= var_256_6 + arg_256_0 then
				arg_253_1.mask_.enabled = true
				arg_253_1.mask_.raycastTarget = true

				arg_253_1:SetGaussion(false)
			end

			local var_256_7 = 2

			if var_256_6 <= arg_253_1.time_ and arg_253_1.time_ < var_256_6 + var_256_7 then
				local var_256_8 = (arg_253_1.time_ - var_256_6) / var_256_7
				local var_256_9 = Color.New(0, 0, 0)

				var_256_9.a = Mathf.Lerp(0, 1, var_256_8)
				arg_253_1.mask_.color = var_256_9
			end

			if arg_253_1.time_ >= var_256_6 + var_256_7 and arg_253_1.time_ < var_256_6 + var_256_7 + arg_256_0 then
				local var_256_10 = Color.New(0, 0, 0)

				var_256_10.a = 1
				arg_253_1.mask_.color = var_256_10
			end

			local var_256_11 = arg_253_1.bgs_.OM0107.transform
			local var_256_12 = 1.966

			if var_256_12 < arg_253_1.time_ and arg_253_1.time_ <= var_256_12 + arg_256_0 then
				arg_253_1.var_.moveOldPosOM0107 = var_256_11.localPosition
			end

			local var_256_13 = 0.001

			if var_256_12 <= arg_253_1.time_ and arg_253_1.time_ < var_256_12 + var_256_13 then
				local var_256_14 = (arg_253_1.time_ - var_256_12) / var_256_13
				local var_256_15 = Vector3.New(3.15, -0.7, 0)

				var_256_11.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPosOM0107, var_256_15, var_256_14)
			end

			if arg_253_1.time_ >= var_256_12 + var_256_13 and arg_253_1.time_ < var_256_12 + var_256_13 + arg_256_0 then
				var_256_11.localPosition = Vector3.New(3.15, -0.7, 0)
			end

			local var_256_16 = arg_253_1.bgs_.OM0107.transform
			local var_256_17 = 2

			if var_256_17 < arg_253_1.time_ and arg_253_1.time_ <= var_256_17 + arg_256_0 then
				arg_253_1.var_.moveOldPosOM0107 = var_256_16.localPosition
			end

			local var_256_18 = 5

			if var_256_17 <= arg_253_1.time_ and arg_253_1.time_ < var_256_17 + var_256_18 then
				local var_256_19 = (arg_253_1.time_ - var_256_17) / var_256_18
				local var_256_20 = Vector3.New(3.15, -1, 0)

				var_256_16.localPosition = Vector3.Lerp(arg_253_1.var_.moveOldPosOM0107, var_256_20, var_256_19)
			end

			if arg_253_1.time_ >= var_256_17 + var_256_18 and arg_253_1.time_ < var_256_17 + var_256_18 + arg_256_0 then
				var_256_16.localPosition = Vector3.New(3.15, -1, 0)
			end

			local var_256_21 = 2

			if var_256_21 < arg_253_1.time_ and arg_253_1.time_ <= var_256_21 + arg_256_0 then
				arg_253_1.allBtn_.enabled = false
			end

			local var_256_22 = 5

			if arg_253_1.time_ >= var_256_21 + var_256_22 and arg_253_1.time_ < var_256_21 + var_256_22 + arg_256_0 then
				arg_253_1.allBtn_.enabled = true
			end

			if arg_253_1.frameCnt_ <= 1 then
				arg_253_1.dialog_:SetActive(false)
			end

			local var_256_23 = 4
			local var_256_24 = 0.475

			if var_256_23 < arg_253_1.time_ and arg_253_1.time_ <= var_256_23 + arg_256_0 then
				arg_253_1.talkMaxDuration = 0

				arg_253_1.dialog_:SetActive(true)

				local var_256_25 = LeanTween.value(arg_253_1.dialog_, 0, 1, 0.3)

				var_256_25:setOnUpdate(LuaHelper.FloatAction(function(arg_257_0)
					arg_253_1.dialogCg_.alpha = arg_257_0
				end))
				var_256_25:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_253_1.dialog_)
					var_256_25:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_253_1.duration_ = arg_253_1.duration_ + 0.3

				SetActive(arg_253_1.leftNameGo_, true)

				local var_256_26 = arg_253_1:FormatText(StoryNameCfg[226].name)

				arg_253_1.leftNameTxt_.text = var_256_26

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_253_1.leftNameTxt_.transform)

				arg_253_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_253_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_253_1:RecordName(arg_253_1.leftNameTxt_.text)
				SetActive(arg_253_1.iconTrs_.gameObject, false)
				arg_253_1.callingController_:SetSelectedState("normal")

				local var_256_27 = arg_253_1:GetWordFromCfg(113191061)
				local var_256_28 = arg_253_1:FormatText(var_256_27.content)

				arg_253_1.text_.text = var_256_28

				LuaForUtil.ClearLinePrefixSymbol(arg_253_1.text_)

				local var_256_29 = 19
				local var_256_30 = utf8.len(var_256_28)
				local var_256_31 = var_256_29 <= 0 and var_256_24 or var_256_24 * (var_256_30 / var_256_29)

				if var_256_31 > 0 and var_256_24 < var_256_31 then
					arg_253_1.talkMaxDuration = var_256_31
					var_256_23 = var_256_23 + 0.3

					if var_256_31 + var_256_23 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_31 + var_256_23
					end
				end

				arg_253_1.text_.text = var_256_28
				arg_253_1.typewritter.percent = 0

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191061", "story_v_out_113191.awb") ~= 0 then
					local var_256_32 = manager.audio:GetVoiceLength("story_v_out_113191", "113191061", "story_v_out_113191.awb") / 1000

					if var_256_32 + var_256_23 > arg_253_1.duration_ then
						arg_253_1.duration_ = var_256_32 + var_256_23
					end

					if var_256_27.prefab_name ~= "" and arg_253_1.actors_[var_256_27.prefab_name] ~= nil then
						local var_256_33 = LuaForUtil.PlayVoiceWithCriLipsync(arg_253_1.actors_[var_256_27.prefab_name].transform, "story_v_out_113191", "113191061", "story_v_out_113191.awb")

						arg_253_1:RecordAudio("113191061", var_256_33)
						arg_253_1:RecordAudio("113191061", var_256_33)
					else
						arg_253_1:AudioAction("play", "voice", "story_v_out_113191", "113191061", "story_v_out_113191.awb")
					end

					arg_253_1:RecordHistoryTalkVoice("story_v_out_113191", "113191061", "story_v_out_113191.awb")
				end

				arg_253_1:RecordContent(arg_253_1.text_.text)
			end

			local var_256_34 = var_256_23 + 0.3
			local var_256_35 = math.max(var_256_24, arg_253_1.talkMaxDuration)

			if var_256_34 <= arg_253_1.time_ and arg_253_1.time_ < var_256_34 + var_256_35 then
				arg_253_1.typewritter.percent = (arg_253_1.time_ - var_256_34) / var_256_35

				arg_253_1.typewritter:SetDirty()
			end

			if arg_253_1.time_ >= var_256_34 + var_256_35 and arg_253_1.time_ < var_256_34 + var_256_35 + arg_256_0 then
				arg_253_1.typewritter.percent = 1

				arg_253_1.typewritter:SetDirty()
				arg_253_1:ShowNextGo(true)
			end
		end
	end,
	Play113191062 = function(arg_259_0, arg_259_1)
		arg_259_1.time_ = 0
		arg_259_1.frameCnt_ = 0
		arg_259_1.state_ = "playing"
		arg_259_1.curTalkId_ = 113191062
		arg_259_1.duration_ = 6.566

		local var_259_0 = {
			ja = 4.333,
			ko = 4.433,
			zh = 5.133,
			en = 6.566
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
				arg_259_0:Play113191063(arg_259_1)
			end
		end

		function arg_259_1.onSingleLineUpdate_(arg_262_0)
			local var_262_0 = 0
			local var_262_1 = 0.425

			if var_262_0 < arg_259_1.time_ and arg_259_1.time_ <= var_262_0 + arg_262_0 then
				arg_259_1.talkMaxDuration = 0
				arg_259_1.dialogCg_.alpha = 1

				arg_259_1.dialog_:SetActive(true)
				SetActive(arg_259_1.leftNameGo_, true)

				local var_262_2 = arg_259_1:FormatText(StoryNameCfg[226].name)

				arg_259_1.leftNameTxt_.text = var_262_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_259_1.leftNameTxt_.transform)

				arg_259_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_259_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_259_1:RecordName(arg_259_1.leftNameTxt_.text)
				SetActive(arg_259_1.iconTrs_.gameObject, false)
				arg_259_1.callingController_:SetSelectedState("normal")

				local var_262_3 = arg_259_1:GetWordFromCfg(113191062)
				local var_262_4 = arg_259_1:FormatText(var_262_3.content)

				arg_259_1.text_.text = var_262_4

				LuaForUtil.ClearLinePrefixSymbol(arg_259_1.text_)

				local var_262_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191062", "story_v_out_113191.awb") ~= 0 then
					local var_262_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191062", "story_v_out_113191.awb") / 1000

					if var_262_8 + var_262_0 > arg_259_1.duration_ then
						arg_259_1.duration_ = var_262_8 + var_262_0
					end

					if var_262_3.prefab_name ~= "" and arg_259_1.actors_[var_262_3.prefab_name] ~= nil then
						local var_262_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_259_1.actors_[var_262_3.prefab_name].transform, "story_v_out_113191", "113191062", "story_v_out_113191.awb")

						arg_259_1:RecordAudio("113191062", var_262_9)
						arg_259_1:RecordAudio("113191062", var_262_9)
					else
						arg_259_1:AudioAction("play", "voice", "story_v_out_113191", "113191062", "story_v_out_113191.awb")
					end

					arg_259_1:RecordHistoryTalkVoice("story_v_out_113191", "113191062", "story_v_out_113191.awb")
				end

				arg_259_1:RecordContent(arg_259_1.text_.text)
			end

			local var_262_10 = math.max(var_262_1, arg_259_1.talkMaxDuration)

			if var_262_0 <= arg_259_1.time_ and arg_259_1.time_ < var_262_0 + var_262_10 then
				arg_259_1.typewritter.percent = (arg_259_1.time_ - var_262_0) / var_262_10

				arg_259_1.typewritter:SetDirty()
			end

			if arg_259_1.time_ >= var_262_0 + var_262_10 and arg_259_1.time_ < var_262_0 + var_262_10 + arg_262_0 then
				arg_259_1.typewritter.percent = 1

				arg_259_1.typewritter:SetDirty()
				arg_259_1:ShowNextGo(true)
			end
		end
	end,
	Play113191063 = function(arg_263_0, arg_263_1)
		arg_263_1.time_ = 0
		arg_263_1.frameCnt_ = 0
		arg_263_1.state_ = "playing"
		arg_263_1.curTalkId_ = 113191063
		arg_263_1.duration_ = 7.633

		local var_263_0 = {
			ja = 7.633,
			ko = 7.533,
			zh = 7.433,
			en = 6.7
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
				arg_263_0:Play113191064(arg_263_1)
			end
		end

		function arg_263_1.onSingleLineUpdate_(arg_266_0)
			local var_266_0 = 2

			if var_266_0 < arg_263_1.time_ and arg_263_1.time_ <= var_266_0 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = true

				arg_263_1:SetGaussion(false)
			end

			local var_266_1 = 2

			if var_266_0 <= arg_263_1.time_ and arg_263_1.time_ < var_266_0 + var_266_1 then
				local var_266_2 = (arg_263_1.time_ - var_266_0) / var_266_1
				local var_266_3 = Color.New(0, 0, 0)

				var_266_3.a = Mathf.Lerp(1, 0, var_266_2)
				arg_263_1.mask_.color = var_266_3
			end

			if arg_263_1.time_ >= var_266_0 + var_266_1 and arg_263_1.time_ < var_266_0 + var_266_1 + arg_266_0 then
				local var_266_4 = Color.New(0, 0, 0)
				local var_266_5 = 0

				arg_263_1.mask_.enabled = false
				var_266_4.a = var_266_5
				arg_263_1.mask_.color = var_266_4
			end

			local var_266_6 = 0

			if var_266_6 < arg_263_1.time_ and arg_263_1.time_ <= var_266_6 + arg_266_0 then
				arg_263_1.mask_.enabled = true
				arg_263_1.mask_.raycastTarget = true

				arg_263_1:SetGaussion(false)
			end

			local var_266_7 = 2

			if var_266_6 <= arg_263_1.time_ and arg_263_1.time_ < var_266_6 + var_266_7 then
				local var_266_8 = (arg_263_1.time_ - var_266_6) / var_266_7
				local var_266_9 = Color.New(0, 0, 0)

				var_266_9.a = Mathf.Lerp(0, 1, var_266_8)
				arg_263_1.mask_.color = var_266_9
			end

			if arg_263_1.time_ >= var_266_6 + var_266_7 and arg_263_1.time_ < var_266_6 + var_266_7 + arg_266_0 then
				local var_266_10 = Color.New(0, 0, 0)

				var_266_10.a = 1
				arg_263_1.mask_.color = var_266_10
			end

			local var_266_11 = arg_263_1.bgs_.OM0107.transform
			local var_266_12 = 2

			if var_266_12 < arg_263_1.time_ and arg_263_1.time_ <= var_266_12 + arg_266_0 then
				arg_263_1.var_.moveOldPosOM0107 = var_266_11.localPosition
			end

			local var_266_13 = 0.001

			if var_266_12 <= arg_263_1.time_ and arg_263_1.time_ < var_266_12 + var_266_13 then
				local var_266_14 = (arg_263_1.time_ - var_266_12) / var_266_13
				local var_266_15 = Vector3.New(0, 1, 10)

				var_266_11.localPosition = Vector3.Lerp(arg_263_1.var_.moveOldPosOM0107, var_266_15, var_266_14)
			end

			if arg_263_1.time_ >= var_266_12 + var_266_13 and arg_263_1.time_ < var_266_12 + var_266_13 + arg_266_0 then
				var_266_11.localPosition = Vector3.New(0, 1, 10)
			end

			if arg_263_1.frameCnt_ <= 1 then
				arg_263_1.dialog_:SetActive(false)
			end

			local var_266_16 = 4
			local var_266_17 = 0.375

			if var_266_16 < arg_263_1.time_ and arg_263_1.time_ <= var_266_16 + arg_266_0 then
				arg_263_1.talkMaxDuration = 0

				arg_263_1.dialog_:SetActive(true)

				local var_266_18 = LeanTween.value(arg_263_1.dialog_, 0, 1, 0.3)

				var_266_18:setOnUpdate(LuaHelper.FloatAction(function(arg_267_0)
					arg_263_1.dialogCg_.alpha = arg_267_0
				end))
				var_266_18:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_263_1.dialog_)
					var_266_18:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_263_1.duration_ = arg_263_1.duration_ + 0.3

				SetActive(arg_263_1.leftNameGo_, true)

				local var_266_19 = arg_263_1:FormatText(StoryNameCfg[208].name)

				arg_263_1.leftNameTxt_.text = var_266_19

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_263_1.leftNameTxt_.transform)

				arg_263_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_263_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_263_1:RecordName(arg_263_1.leftNameTxt_.text)
				SetActive(arg_263_1.iconTrs_.gameObject, false)
				arg_263_1.callingController_:SetSelectedState("normal")

				local var_266_20 = arg_263_1:GetWordFromCfg(113191063)
				local var_266_21 = arg_263_1:FormatText(var_266_20.content)

				arg_263_1.text_.text = var_266_21

				LuaForUtil.ClearLinePrefixSymbol(arg_263_1.text_)

				local var_266_22 = 15
				local var_266_23 = utf8.len(var_266_21)
				local var_266_24 = var_266_22 <= 0 and var_266_17 or var_266_17 * (var_266_23 / var_266_22)

				if var_266_24 > 0 and var_266_17 < var_266_24 then
					arg_263_1.talkMaxDuration = var_266_24
					var_266_16 = var_266_16 + 0.3

					if var_266_24 + var_266_16 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_24 + var_266_16
					end
				end

				arg_263_1.text_.text = var_266_21
				arg_263_1.typewritter.percent = 0

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191063", "story_v_out_113191.awb") ~= 0 then
					local var_266_25 = manager.audio:GetVoiceLength("story_v_out_113191", "113191063", "story_v_out_113191.awb") / 1000

					if var_266_25 + var_266_16 > arg_263_1.duration_ then
						arg_263_1.duration_ = var_266_25 + var_266_16
					end

					if var_266_20.prefab_name ~= "" and arg_263_1.actors_[var_266_20.prefab_name] ~= nil then
						local var_266_26 = LuaForUtil.PlayVoiceWithCriLipsync(arg_263_1.actors_[var_266_20.prefab_name].transform, "story_v_out_113191", "113191063", "story_v_out_113191.awb")

						arg_263_1:RecordAudio("113191063", var_266_26)
						arg_263_1:RecordAudio("113191063", var_266_26)
					else
						arg_263_1:AudioAction("play", "voice", "story_v_out_113191", "113191063", "story_v_out_113191.awb")
					end

					arg_263_1:RecordHistoryTalkVoice("story_v_out_113191", "113191063", "story_v_out_113191.awb")
				end

				arg_263_1:RecordContent(arg_263_1.text_.text)
			end

			local var_266_27 = var_266_16 + 0.3
			local var_266_28 = math.max(var_266_17, arg_263_1.talkMaxDuration)

			if var_266_27 <= arg_263_1.time_ and arg_263_1.time_ < var_266_27 + var_266_28 then
				arg_263_1.typewritter.percent = (arg_263_1.time_ - var_266_27) / var_266_28

				arg_263_1.typewritter:SetDirty()
			end

			if arg_263_1.time_ >= var_266_27 + var_266_28 and arg_263_1.time_ < var_266_27 + var_266_28 + arg_266_0 then
				arg_263_1.typewritter.percent = 1

				arg_263_1.typewritter:SetDirty()
				arg_263_1:ShowNextGo(true)
			end
		end
	end,
	Play113191064 = function(arg_269_0, arg_269_1)
		arg_269_1.time_ = 0
		arg_269_1.frameCnt_ = 0
		arg_269_1.state_ = "playing"
		arg_269_1.curTalkId_ = 113191064
		arg_269_1.duration_ = 2.533

		local var_269_0 = {
			ja = 2.1,
			ko = 0.999999999999,
			zh = 2.533,
			en = 2.466
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
				arg_269_0:Play113191065(arg_269_1)
			end
		end

		function arg_269_1.onSingleLineUpdate_(arg_272_0)
			local var_272_0 = 0
			local var_272_1 = 0.1

			if var_272_0 < arg_269_1.time_ and arg_269_1.time_ <= var_272_0 + arg_272_0 then
				arg_269_1.talkMaxDuration = 0
				arg_269_1.dialogCg_.alpha = 1

				arg_269_1.dialog_:SetActive(true)
				SetActive(arg_269_1.leftNameGo_, true)

				local var_272_2 = arg_269_1:FormatText(StoryNameCfg[226].name)

				arg_269_1.leftNameTxt_.text = var_272_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_269_1.leftNameTxt_.transform)

				arg_269_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_269_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_269_1:RecordName(arg_269_1.leftNameTxt_.text)
				SetActive(arg_269_1.iconTrs_.gameObject, false)
				arg_269_1.callingController_:SetSelectedState("normal")

				local var_272_3 = arg_269_1:GetWordFromCfg(113191064)
				local var_272_4 = arg_269_1:FormatText(var_272_3.content)

				arg_269_1.text_.text = var_272_4

				LuaForUtil.ClearLinePrefixSymbol(arg_269_1.text_)

				local var_272_5 = 4
				local var_272_6 = utf8.len(var_272_4)
				local var_272_7 = var_272_5 <= 0 and var_272_1 or var_272_1 * (var_272_6 / var_272_5)

				if var_272_7 > 0 and var_272_1 < var_272_7 then
					arg_269_1.talkMaxDuration = var_272_7

					if var_272_7 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_7 + var_272_0
					end
				end

				arg_269_1.text_.text = var_272_4
				arg_269_1.typewritter.percent = 0

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191064", "story_v_out_113191.awb") ~= 0 then
					local var_272_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191064", "story_v_out_113191.awb") / 1000

					if var_272_8 + var_272_0 > arg_269_1.duration_ then
						arg_269_1.duration_ = var_272_8 + var_272_0
					end

					if var_272_3.prefab_name ~= "" and arg_269_1.actors_[var_272_3.prefab_name] ~= nil then
						local var_272_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_269_1.actors_[var_272_3.prefab_name].transform, "story_v_out_113191", "113191064", "story_v_out_113191.awb")

						arg_269_1:RecordAudio("113191064", var_272_9)
						arg_269_1:RecordAudio("113191064", var_272_9)
					else
						arg_269_1:AudioAction("play", "voice", "story_v_out_113191", "113191064", "story_v_out_113191.awb")
					end

					arg_269_1:RecordHistoryTalkVoice("story_v_out_113191", "113191064", "story_v_out_113191.awb")
				end

				arg_269_1:RecordContent(arg_269_1.text_.text)
			end

			local var_272_10 = math.max(var_272_1, arg_269_1.talkMaxDuration)

			if var_272_0 <= arg_269_1.time_ and arg_269_1.time_ < var_272_0 + var_272_10 then
				arg_269_1.typewritter.percent = (arg_269_1.time_ - var_272_0) / var_272_10

				arg_269_1.typewritter:SetDirty()
			end

			if arg_269_1.time_ >= var_272_0 + var_272_10 and arg_269_1.time_ < var_272_0 + var_272_10 + arg_272_0 then
				arg_269_1.typewritter.percent = 1

				arg_269_1.typewritter:SetDirty()
				arg_269_1:ShowNextGo(true)
			end
		end
	end,
	Play113191065 = function(arg_273_0, arg_273_1)
		arg_273_1.time_ = 0
		arg_273_1.frameCnt_ = 0
		arg_273_1.state_ = "playing"
		arg_273_1.curTalkId_ = 113191065
		arg_273_1.duration_ = 1.5

		local var_273_0 = {
			ja = 1.4,
			ko = 1.466,
			zh = 1.133,
			en = 1.5
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
				arg_273_0:Play113191066(arg_273_1)
			end
		end

		function arg_273_1.onSingleLineUpdate_(arg_276_0)
			local var_276_0 = 0
			local var_276_1 = 0.075

			if var_276_0 < arg_273_1.time_ and arg_273_1.time_ <= var_276_0 + arg_276_0 then
				arg_273_1.talkMaxDuration = 0
				arg_273_1.dialogCg_.alpha = 1

				arg_273_1.dialog_:SetActive(true)
				SetActive(arg_273_1.leftNameGo_, true)

				local var_276_2 = arg_273_1:FormatText(StoryNameCfg[208].name)

				arg_273_1.leftNameTxt_.text = var_276_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_273_1.leftNameTxt_.transform)

				arg_273_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_273_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_273_1:RecordName(arg_273_1.leftNameTxt_.text)
				SetActive(arg_273_1.iconTrs_.gameObject, false)
				arg_273_1.callingController_:SetSelectedState("normal")

				local var_276_3 = arg_273_1:GetWordFromCfg(113191065)
				local var_276_4 = arg_273_1:FormatText(var_276_3.content)

				arg_273_1.text_.text = var_276_4

				LuaForUtil.ClearLinePrefixSymbol(arg_273_1.text_)

				local var_276_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191065", "story_v_out_113191.awb") ~= 0 then
					local var_276_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191065", "story_v_out_113191.awb") / 1000

					if var_276_8 + var_276_0 > arg_273_1.duration_ then
						arg_273_1.duration_ = var_276_8 + var_276_0
					end

					if var_276_3.prefab_name ~= "" and arg_273_1.actors_[var_276_3.prefab_name] ~= nil then
						local var_276_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_273_1.actors_[var_276_3.prefab_name].transform, "story_v_out_113191", "113191065", "story_v_out_113191.awb")

						arg_273_1:RecordAudio("113191065", var_276_9)
						arg_273_1:RecordAudio("113191065", var_276_9)
					else
						arg_273_1:AudioAction("play", "voice", "story_v_out_113191", "113191065", "story_v_out_113191.awb")
					end

					arg_273_1:RecordHistoryTalkVoice("story_v_out_113191", "113191065", "story_v_out_113191.awb")
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
	Play113191066 = function(arg_277_0, arg_277_1)
		arg_277_1.time_ = 0
		arg_277_1.frameCnt_ = 0
		arg_277_1.state_ = "playing"
		arg_277_1.curTalkId_ = 113191066
		arg_277_1.duration_ = 10.6

		local var_277_0 = {
			ja = 8.9,
			ko = 5.733,
			zh = 10.6,
			en = 7.7
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
				arg_277_0:Play113191067(arg_277_1)
			end
		end

		function arg_277_1.onSingleLineUpdate_(arg_280_0)
			local var_280_0 = 0
			local var_280_1 = 0.75

			if var_280_0 < arg_277_1.time_ and arg_277_1.time_ <= var_280_0 + arg_280_0 then
				arg_277_1.talkMaxDuration = 0
				arg_277_1.dialogCg_.alpha = 1

				arg_277_1.dialog_:SetActive(true)
				SetActive(arg_277_1.leftNameGo_, true)

				local var_280_2 = arg_277_1:FormatText(StoryNameCfg[226].name)

				arg_277_1.leftNameTxt_.text = var_280_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_277_1.leftNameTxt_.transform)

				arg_277_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_277_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_277_1:RecordName(arg_277_1.leftNameTxt_.text)
				SetActive(arg_277_1.iconTrs_.gameObject, false)
				arg_277_1.callingController_:SetSelectedState("normal")

				local var_280_3 = arg_277_1:GetWordFromCfg(113191066)
				local var_280_4 = arg_277_1:FormatText(var_280_3.content)

				arg_277_1.text_.text = var_280_4

				LuaForUtil.ClearLinePrefixSymbol(arg_277_1.text_)

				local var_280_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191066", "story_v_out_113191.awb") ~= 0 then
					local var_280_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191066", "story_v_out_113191.awb") / 1000

					if var_280_8 + var_280_0 > arg_277_1.duration_ then
						arg_277_1.duration_ = var_280_8 + var_280_0
					end

					if var_280_3.prefab_name ~= "" and arg_277_1.actors_[var_280_3.prefab_name] ~= nil then
						local var_280_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_277_1.actors_[var_280_3.prefab_name].transform, "story_v_out_113191", "113191066", "story_v_out_113191.awb")

						arg_277_1:RecordAudio("113191066", var_280_9)
						arg_277_1:RecordAudio("113191066", var_280_9)
					else
						arg_277_1:AudioAction("play", "voice", "story_v_out_113191", "113191066", "story_v_out_113191.awb")
					end

					arg_277_1:RecordHistoryTalkVoice("story_v_out_113191", "113191066", "story_v_out_113191.awb")
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
	Play113191067 = function(arg_281_0, arg_281_1)
		arg_281_1.time_ = 0
		arg_281_1.frameCnt_ = 0
		arg_281_1.state_ = "playing"
		arg_281_1.curTalkId_ = 113191067
		arg_281_1.duration_ = 7.2

		local var_281_0 = {
			ja = 7.2,
			ko = 5.4,
			zh = 4.333,
			en = 4.6
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
				arg_281_0:Play113191068(arg_281_1)
			end
		end

		function arg_281_1.onSingleLineUpdate_(arg_284_0)
			local var_284_0 = 0
			local var_284_1 = 0.325

			if var_284_0 < arg_281_1.time_ and arg_281_1.time_ <= var_284_0 + arg_284_0 then
				arg_281_1.talkMaxDuration = 0
				arg_281_1.dialogCg_.alpha = 1

				arg_281_1.dialog_:SetActive(true)
				SetActive(arg_281_1.leftNameGo_, true)

				local var_284_2 = arg_281_1:FormatText(StoryNameCfg[226].name)

				arg_281_1.leftNameTxt_.text = var_284_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_281_1.leftNameTxt_.transform)

				arg_281_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_281_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_281_1:RecordName(arg_281_1.leftNameTxt_.text)
				SetActive(arg_281_1.iconTrs_.gameObject, false)
				arg_281_1.callingController_:SetSelectedState("normal")

				local var_284_3 = arg_281_1:GetWordFromCfg(113191067)
				local var_284_4 = arg_281_1:FormatText(var_284_3.content)

				arg_281_1.text_.text = var_284_4

				LuaForUtil.ClearLinePrefixSymbol(arg_281_1.text_)

				local var_284_5 = 13
				local var_284_6 = utf8.len(var_284_4)
				local var_284_7 = var_284_5 <= 0 and var_284_1 or var_284_1 * (var_284_6 / var_284_5)

				if var_284_7 > 0 and var_284_1 < var_284_7 then
					arg_281_1.talkMaxDuration = var_284_7

					if var_284_7 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_7 + var_284_0
					end
				end

				arg_281_1.text_.text = var_284_4
				arg_281_1.typewritter.percent = 0

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191067", "story_v_out_113191.awb") ~= 0 then
					local var_284_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191067", "story_v_out_113191.awb") / 1000

					if var_284_8 + var_284_0 > arg_281_1.duration_ then
						arg_281_1.duration_ = var_284_8 + var_284_0
					end

					if var_284_3.prefab_name ~= "" and arg_281_1.actors_[var_284_3.prefab_name] ~= nil then
						local var_284_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_281_1.actors_[var_284_3.prefab_name].transform, "story_v_out_113191", "113191067", "story_v_out_113191.awb")

						arg_281_1:RecordAudio("113191067", var_284_9)
						arg_281_1:RecordAudio("113191067", var_284_9)
					else
						arg_281_1:AudioAction("play", "voice", "story_v_out_113191", "113191067", "story_v_out_113191.awb")
					end

					arg_281_1:RecordHistoryTalkVoice("story_v_out_113191", "113191067", "story_v_out_113191.awb")
				end

				arg_281_1:RecordContent(arg_281_1.text_.text)
			end

			local var_284_10 = math.max(var_284_1, arg_281_1.talkMaxDuration)

			if var_284_0 <= arg_281_1.time_ and arg_281_1.time_ < var_284_0 + var_284_10 then
				arg_281_1.typewritter.percent = (arg_281_1.time_ - var_284_0) / var_284_10

				arg_281_1.typewritter:SetDirty()
			end

			if arg_281_1.time_ >= var_284_0 + var_284_10 and arg_281_1.time_ < var_284_0 + var_284_10 + arg_284_0 then
				arg_281_1.typewritter.percent = 1

				arg_281_1.typewritter:SetDirty()
				arg_281_1:ShowNextGo(true)
			end
		end
	end,
	Play113191068 = function(arg_285_0, arg_285_1)
		arg_285_1.time_ = 0
		arg_285_1.frameCnt_ = 0
		arg_285_1.state_ = "playing"
		arg_285_1.curTalkId_ = 113191068
		arg_285_1.duration_ = 2.333

		local var_285_0 = {
			ja = 1.3,
			ko = 1.533,
			zh = 2.333,
			en = 1.533
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
				arg_285_0:Play113191069(arg_285_1)
			end
		end

		function arg_285_1.onSingleLineUpdate_(arg_288_0)
			local var_288_0 = 0
			local var_288_1 = 0.05

			if var_288_0 < arg_285_1.time_ and arg_285_1.time_ <= var_288_0 + arg_288_0 then
				arg_285_1.talkMaxDuration = 0
				arg_285_1.dialogCg_.alpha = 1

				arg_285_1.dialog_:SetActive(true)
				SetActive(arg_285_1.leftNameGo_, true)

				local var_288_2 = arg_285_1:FormatText(StoryNameCfg[208].name)

				arg_285_1.leftNameTxt_.text = var_288_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_285_1.leftNameTxt_.transform)

				arg_285_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_285_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_285_1:RecordName(arg_285_1.leftNameTxt_.text)
				SetActive(arg_285_1.iconTrs_.gameObject, false)
				arg_285_1.callingController_:SetSelectedState("normal")

				local var_288_3 = arg_285_1:GetWordFromCfg(113191068)
				local var_288_4 = arg_285_1:FormatText(var_288_3.content)

				arg_285_1.text_.text = var_288_4

				LuaForUtil.ClearLinePrefixSymbol(arg_285_1.text_)

				local var_288_5 = 2
				local var_288_6 = utf8.len(var_288_4)
				local var_288_7 = var_288_5 <= 0 and var_288_1 or var_288_1 * (var_288_6 / var_288_5)

				if var_288_7 > 0 and var_288_1 < var_288_7 then
					arg_285_1.talkMaxDuration = var_288_7

					if var_288_7 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_7 + var_288_0
					end
				end

				arg_285_1.text_.text = var_288_4
				arg_285_1.typewritter.percent = 0

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191068", "story_v_out_113191.awb") ~= 0 then
					local var_288_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191068", "story_v_out_113191.awb") / 1000

					if var_288_8 + var_288_0 > arg_285_1.duration_ then
						arg_285_1.duration_ = var_288_8 + var_288_0
					end

					if var_288_3.prefab_name ~= "" and arg_285_1.actors_[var_288_3.prefab_name] ~= nil then
						local var_288_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_285_1.actors_[var_288_3.prefab_name].transform, "story_v_out_113191", "113191068", "story_v_out_113191.awb")

						arg_285_1:RecordAudio("113191068", var_288_9)
						arg_285_1:RecordAudio("113191068", var_288_9)
					else
						arg_285_1:AudioAction("play", "voice", "story_v_out_113191", "113191068", "story_v_out_113191.awb")
					end

					arg_285_1:RecordHistoryTalkVoice("story_v_out_113191", "113191068", "story_v_out_113191.awb")
				end

				arg_285_1:RecordContent(arg_285_1.text_.text)
			end

			local var_288_10 = math.max(var_288_1, arg_285_1.talkMaxDuration)

			if var_288_0 <= arg_285_1.time_ and arg_285_1.time_ < var_288_0 + var_288_10 then
				arg_285_1.typewritter.percent = (arg_285_1.time_ - var_288_0) / var_288_10

				arg_285_1.typewritter:SetDirty()
			end

			if arg_285_1.time_ >= var_288_0 + var_288_10 and arg_285_1.time_ < var_288_0 + var_288_10 + arg_288_0 then
				arg_285_1.typewritter.percent = 1

				arg_285_1.typewritter:SetDirty()
				arg_285_1:ShowNextGo(true)
			end
		end
	end,
	Play113191069 = function(arg_289_0, arg_289_1)
		arg_289_1.time_ = 0
		arg_289_1.frameCnt_ = 0
		arg_289_1.state_ = "playing"
		arg_289_1.curTalkId_ = 113191069
		arg_289_1.duration_ = 9.633

		local var_289_0 = {
			ja = 9.633,
			ko = 7,
			zh = 6.433,
			en = 4.2
		}
		local var_289_1 = manager.audio:GetLocalizationFlag()

		if var_289_0[var_289_1] ~= nil then
			arg_289_1.duration_ = var_289_0[var_289_1]
		end

		SetActive(arg_289_1.tipsGo_, false)

		function arg_289_1.onSingleLineFinish_()
			arg_289_1.onSingleLineUpdate_ = nil
			arg_289_1.onSingleLineFinish_ = nil
			arg_289_1.state_ = "waiting"
		end

		function arg_289_1.playNext_(arg_291_0)
			if arg_291_0 == 1 then
				arg_289_0:Play113191070(arg_289_1)
			end
		end

		function arg_289_1.onSingleLineUpdate_(arg_292_0)
			local var_292_0 = 0
			local var_292_1 = 0.525

			if var_292_0 < arg_289_1.time_ and arg_289_1.time_ <= var_292_0 + arg_292_0 then
				arg_289_1.talkMaxDuration = 0
				arg_289_1.dialogCg_.alpha = 1

				arg_289_1.dialog_:SetActive(true)
				SetActive(arg_289_1.leftNameGo_, true)

				local var_292_2 = arg_289_1:FormatText(StoryNameCfg[226].name)

				arg_289_1.leftNameTxt_.text = var_292_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_289_1.leftNameTxt_.transform)

				arg_289_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_289_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_289_1:RecordName(arg_289_1.leftNameTxt_.text)
				SetActive(arg_289_1.iconTrs_.gameObject, false)
				arg_289_1.callingController_:SetSelectedState("normal")

				local var_292_3 = arg_289_1:GetWordFromCfg(113191069)
				local var_292_4 = arg_289_1:FormatText(var_292_3.content)

				arg_289_1.text_.text = var_292_4

				LuaForUtil.ClearLinePrefixSymbol(arg_289_1.text_)

				local var_292_5 = 21
				local var_292_6 = utf8.len(var_292_4)
				local var_292_7 = var_292_5 <= 0 and var_292_1 or var_292_1 * (var_292_6 / var_292_5)

				if var_292_7 > 0 and var_292_1 < var_292_7 then
					arg_289_1.talkMaxDuration = var_292_7

					if var_292_7 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_7 + var_292_0
					end
				end

				arg_289_1.text_.text = var_292_4
				arg_289_1.typewritter.percent = 0

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191069", "story_v_out_113191.awb") ~= 0 then
					local var_292_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191069", "story_v_out_113191.awb") / 1000

					if var_292_8 + var_292_0 > arg_289_1.duration_ then
						arg_289_1.duration_ = var_292_8 + var_292_0
					end

					if var_292_3.prefab_name ~= "" and arg_289_1.actors_[var_292_3.prefab_name] ~= nil then
						local var_292_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_289_1.actors_[var_292_3.prefab_name].transform, "story_v_out_113191", "113191069", "story_v_out_113191.awb")

						arg_289_1:RecordAudio("113191069", var_292_9)
						arg_289_1:RecordAudio("113191069", var_292_9)
					else
						arg_289_1:AudioAction("play", "voice", "story_v_out_113191", "113191069", "story_v_out_113191.awb")
					end

					arg_289_1:RecordHistoryTalkVoice("story_v_out_113191", "113191069", "story_v_out_113191.awb")
				end

				arg_289_1:RecordContent(arg_289_1.text_.text)
			end

			local var_292_10 = math.max(var_292_1, arg_289_1.talkMaxDuration)

			if var_292_0 <= arg_289_1.time_ and arg_289_1.time_ < var_292_0 + var_292_10 then
				arg_289_1.typewritter.percent = (arg_289_1.time_ - var_292_0) / var_292_10

				arg_289_1.typewritter:SetDirty()
			end

			if arg_289_1.time_ >= var_292_0 + var_292_10 and arg_289_1.time_ < var_292_0 + var_292_10 + arg_292_0 then
				arg_289_1.typewritter.percent = 1

				arg_289_1.typewritter:SetDirty()
				arg_289_1:ShowNextGo(true)
			end
		end
	end,
	Play113191070 = function(arg_293_0, arg_293_1)
		arg_293_1.time_ = 0
		arg_293_1.frameCnt_ = 0
		arg_293_1.state_ = "playing"
		arg_293_1.curTalkId_ = 113191070
		arg_293_1.duration_ = 18.5

		local var_293_0 = {
			ja = 18.5,
			ko = 11.566,
			zh = 12.3,
			en = 14.233
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
				arg_293_0:Play113191071(arg_293_1)
			end
		end

		function arg_293_1.onSingleLineUpdate_(arg_296_0)
			local var_296_0 = 0
			local var_296_1 = 0.925

			if var_296_0 < arg_293_1.time_ and arg_293_1.time_ <= var_296_0 + arg_296_0 then
				arg_293_1.talkMaxDuration = 0
				arg_293_1.dialogCg_.alpha = 1

				arg_293_1.dialog_:SetActive(true)
				SetActive(arg_293_1.leftNameGo_, true)

				local var_296_2 = arg_293_1:FormatText(StoryNameCfg[226].name)

				arg_293_1.leftNameTxt_.text = var_296_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_293_1.leftNameTxt_.transform)

				arg_293_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_293_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_293_1:RecordName(arg_293_1.leftNameTxt_.text)
				SetActive(arg_293_1.iconTrs_.gameObject, false)
				arg_293_1.callingController_:SetSelectedState("normal")

				local var_296_3 = arg_293_1:GetWordFromCfg(113191070)
				local var_296_4 = arg_293_1:FormatText(var_296_3.content)

				arg_293_1.text_.text = var_296_4

				LuaForUtil.ClearLinePrefixSymbol(arg_293_1.text_)

				local var_296_5 = 37
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191070", "story_v_out_113191.awb") ~= 0 then
					local var_296_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191070", "story_v_out_113191.awb") / 1000

					if var_296_8 + var_296_0 > arg_293_1.duration_ then
						arg_293_1.duration_ = var_296_8 + var_296_0
					end

					if var_296_3.prefab_name ~= "" and arg_293_1.actors_[var_296_3.prefab_name] ~= nil then
						local var_296_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_293_1.actors_[var_296_3.prefab_name].transform, "story_v_out_113191", "113191070", "story_v_out_113191.awb")

						arg_293_1:RecordAudio("113191070", var_296_9)
						arg_293_1:RecordAudio("113191070", var_296_9)
					else
						arg_293_1:AudioAction("play", "voice", "story_v_out_113191", "113191070", "story_v_out_113191.awb")
					end

					arg_293_1:RecordHistoryTalkVoice("story_v_out_113191", "113191070", "story_v_out_113191.awb")
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
	Play113191071 = function(arg_297_0, arg_297_1)
		arg_297_1.time_ = 0
		arg_297_1.frameCnt_ = 0
		arg_297_1.state_ = "playing"
		arg_297_1.curTalkId_ = 113191071
		arg_297_1.duration_ = 27.3

		local var_297_0 = {
			ja = 27.3,
			ko = 21.933,
			zh = 26.366,
			en = 23.466
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
				arg_297_0:Play113191072(arg_297_1)
			end
		end

		function arg_297_1.onSingleLineUpdate_(arg_300_0)
			local var_300_0 = 0
			local var_300_1 = 1.95

			if var_300_0 < arg_297_1.time_ and arg_297_1.time_ <= var_300_0 + arg_300_0 then
				arg_297_1.talkMaxDuration = 0
				arg_297_1.dialogCg_.alpha = 1

				arg_297_1.dialog_:SetActive(true)
				SetActive(arg_297_1.leftNameGo_, true)

				local var_300_2 = arg_297_1:FormatText(StoryNameCfg[226].name)

				arg_297_1.leftNameTxt_.text = var_300_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_297_1.leftNameTxt_.transform)

				arg_297_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_297_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_297_1:RecordName(arg_297_1.leftNameTxt_.text)
				SetActive(arg_297_1.iconTrs_.gameObject, false)
				arg_297_1.callingController_:SetSelectedState("normal")

				local var_300_3 = arg_297_1:GetWordFromCfg(113191071)
				local var_300_4 = arg_297_1:FormatText(var_300_3.content)

				arg_297_1.text_.text = var_300_4

				LuaForUtil.ClearLinePrefixSymbol(arg_297_1.text_)

				local var_300_5 = 78
				local var_300_6 = utf8.len(var_300_4)
				local var_300_7 = var_300_5 <= 0 and var_300_1 or var_300_1 * (var_300_6 / var_300_5)

				if var_300_7 > 0 and var_300_1 < var_300_7 then
					arg_297_1.talkMaxDuration = var_300_7

					if var_300_7 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_7 + var_300_0
					end
				end

				arg_297_1.text_.text = var_300_4
				arg_297_1.typewritter.percent = 0

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191071", "story_v_out_113191.awb") ~= 0 then
					local var_300_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191071", "story_v_out_113191.awb") / 1000

					if var_300_8 + var_300_0 > arg_297_1.duration_ then
						arg_297_1.duration_ = var_300_8 + var_300_0
					end

					if var_300_3.prefab_name ~= "" and arg_297_1.actors_[var_300_3.prefab_name] ~= nil then
						local var_300_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_297_1.actors_[var_300_3.prefab_name].transform, "story_v_out_113191", "113191071", "story_v_out_113191.awb")

						arg_297_1:RecordAudio("113191071", var_300_9)
						arg_297_1:RecordAudio("113191071", var_300_9)
					else
						arg_297_1:AudioAction("play", "voice", "story_v_out_113191", "113191071", "story_v_out_113191.awb")
					end

					arg_297_1:RecordHistoryTalkVoice("story_v_out_113191", "113191071", "story_v_out_113191.awb")
				end

				arg_297_1:RecordContent(arg_297_1.text_.text)
			end

			local var_300_10 = math.max(var_300_1, arg_297_1.talkMaxDuration)

			if var_300_0 <= arg_297_1.time_ and arg_297_1.time_ < var_300_0 + var_300_10 then
				arg_297_1.typewritter.percent = (arg_297_1.time_ - var_300_0) / var_300_10

				arg_297_1.typewritter:SetDirty()
			end

			if arg_297_1.time_ >= var_300_0 + var_300_10 and arg_297_1.time_ < var_300_0 + var_300_10 + arg_300_0 then
				arg_297_1.typewritter.percent = 1

				arg_297_1.typewritter:SetDirty()
				arg_297_1:ShowNextGo(true)
			end
		end
	end,
	Play113191072 = function(arg_301_0, arg_301_1)
		arg_301_1.time_ = 0
		arg_301_1.frameCnt_ = 0
		arg_301_1.state_ = "playing"
		arg_301_1.curTalkId_ = 113191072
		arg_301_1.duration_ = 20

		local var_301_0 = {
			ja = 20,
			ko = 11.4,
			zh = 15.3,
			en = 14.866
		}
		local var_301_1 = manager.audio:GetLocalizationFlag()

		if var_301_0[var_301_1] ~= nil then
			arg_301_1.duration_ = var_301_0[var_301_1]
		end

		SetActive(arg_301_1.tipsGo_, false)

		function arg_301_1.onSingleLineFinish_()
			arg_301_1.onSingleLineUpdate_ = nil
			arg_301_1.onSingleLineFinish_ = nil
			arg_301_1.state_ = "waiting"
		end

		function arg_301_1.playNext_(arg_303_0)
			if arg_303_0 == 1 then
				arg_301_0:Play113191073(arg_301_1)
			end
		end

		function arg_301_1.onSingleLineUpdate_(arg_304_0)
			local var_304_0 = 0
			local var_304_1 = 1.05

			if var_304_0 < arg_301_1.time_ and arg_301_1.time_ <= var_304_0 + arg_304_0 then
				arg_301_1.talkMaxDuration = 0
				arg_301_1.dialogCg_.alpha = 1

				arg_301_1.dialog_:SetActive(true)
				SetActive(arg_301_1.leftNameGo_, true)

				local var_304_2 = arg_301_1:FormatText(StoryNameCfg[226].name)

				arg_301_1.leftNameTxt_.text = var_304_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_301_1.leftNameTxt_.transform)

				arg_301_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_301_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_301_1:RecordName(arg_301_1.leftNameTxt_.text)
				SetActive(arg_301_1.iconTrs_.gameObject, false)
				arg_301_1.callingController_:SetSelectedState("normal")

				local var_304_3 = arg_301_1:GetWordFromCfg(113191072)
				local var_304_4 = arg_301_1:FormatText(var_304_3.content)

				arg_301_1.text_.text = var_304_4

				LuaForUtil.ClearLinePrefixSymbol(arg_301_1.text_)

				local var_304_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191072", "story_v_out_113191.awb") ~= 0 then
					local var_304_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191072", "story_v_out_113191.awb") / 1000

					if var_304_8 + var_304_0 > arg_301_1.duration_ then
						arg_301_1.duration_ = var_304_8 + var_304_0
					end

					if var_304_3.prefab_name ~= "" and arg_301_1.actors_[var_304_3.prefab_name] ~= nil then
						local var_304_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_301_1.actors_[var_304_3.prefab_name].transform, "story_v_out_113191", "113191072", "story_v_out_113191.awb")

						arg_301_1:RecordAudio("113191072", var_304_9)
						arg_301_1:RecordAudio("113191072", var_304_9)
					else
						arg_301_1:AudioAction("play", "voice", "story_v_out_113191", "113191072", "story_v_out_113191.awb")
					end

					arg_301_1:RecordHistoryTalkVoice("story_v_out_113191", "113191072", "story_v_out_113191.awb")
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
	Play113191073 = function(arg_305_0, arg_305_1)
		arg_305_1.time_ = 0
		arg_305_1.frameCnt_ = 0
		arg_305_1.state_ = "playing"
		arg_305_1.curTalkId_ = 113191073
		arg_305_1.duration_ = 11.4

		local var_305_0 = {
			ja = 11.4,
			ko = 9.366,
			zh = 6.2,
			en = 10.266
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
				arg_305_0:Play113191074(arg_305_1)
			end
		end

		function arg_305_1.onSingleLineUpdate_(arg_308_0)
			local var_308_0 = 0
			local var_308_1 = 0.8

			if var_308_0 < arg_305_1.time_ and arg_305_1.time_ <= var_308_0 + arg_308_0 then
				arg_305_1.talkMaxDuration = 0
				arg_305_1.dialogCg_.alpha = 1

				arg_305_1.dialog_:SetActive(true)
				SetActive(arg_305_1.leftNameGo_, true)

				local var_308_2 = arg_305_1:FormatText(StoryNameCfg[208].name)

				arg_305_1.leftNameTxt_.text = var_308_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_305_1.leftNameTxt_.transform)

				arg_305_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_305_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_305_1:RecordName(arg_305_1.leftNameTxt_.text)
				SetActive(arg_305_1.iconTrs_.gameObject, false)
				arg_305_1.callingController_:SetSelectedState("normal")

				local var_308_3 = arg_305_1:GetWordFromCfg(113191073)
				local var_308_4 = arg_305_1:FormatText(var_308_3.content)

				arg_305_1.text_.text = var_308_4

				LuaForUtil.ClearLinePrefixSymbol(arg_305_1.text_)

				local var_308_5 = 32
				local var_308_6 = utf8.len(var_308_4)
				local var_308_7 = var_308_5 <= 0 and var_308_1 or var_308_1 * (var_308_6 / var_308_5)

				if var_308_7 > 0 and var_308_1 < var_308_7 then
					arg_305_1.talkMaxDuration = var_308_7

					if var_308_7 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_7 + var_308_0
					end
				end

				arg_305_1.text_.text = var_308_4
				arg_305_1.typewritter.percent = 0

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191073", "story_v_out_113191.awb") ~= 0 then
					local var_308_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191073", "story_v_out_113191.awb") / 1000

					if var_308_8 + var_308_0 > arg_305_1.duration_ then
						arg_305_1.duration_ = var_308_8 + var_308_0
					end

					if var_308_3.prefab_name ~= "" and arg_305_1.actors_[var_308_3.prefab_name] ~= nil then
						local var_308_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_305_1.actors_[var_308_3.prefab_name].transform, "story_v_out_113191", "113191073", "story_v_out_113191.awb")

						arg_305_1:RecordAudio("113191073", var_308_9)
						arg_305_1:RecordAudio("113191073", var_308_9)
					else
						arg_305_1:AudioAction("play", "voice", "story_v_out_113191", "113191073", "story_v_out_113191.awb")
					end

					arg_305_1:RecordHistoryTalkVoice("story_v_out_113191", "113191073", "story_v_out_113191.awb")
				end

				arg_305_1:RecordContent(arg_305_1.text_.text)
			end

			local var_308_10 = math.max(var_308_1, arg_305_1.talkMaxDuration)

			if var_308_0 <= arg_305_1.time_ and arg_305_1.time_ < var_308_0 + var_308_10 then
				arg_305_1.typewritter.percent = (arg_305_1.time_ - var_308_0) / var_308_10

				arg_305_1.typewritter:SetDirty()
			end

			if arg_305_1.time_ >= var_308_0 + var_308_10 and arg_305_1.time_ < var_308_0 + var_308_10 + arg_308_0 then
				arg_305_1.typewritter.percent = 1

				arg_305_1.typewritter:SetDirty()
				arg_305_1:ShowNextGo(true)
			end
		end
	end,
	Play113191074 = function(arg_309_0, arg_309_1)
		arg_309_1.time_ = 0
		arg_309_1.frameCnt_ = 0
		arg_309_1.state_ = "playing"
		arg_309_1.curTalkId_ = 113191074
		arg_309_1.duration_ = 9.133

		local var_309_0 = {
			ja = 9.133,
			ko = 3.766,
			zh = 4.266,
			en = 8.1
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
				arg_309_0:Play113191075(arg_309_1)
			end
		end

		function arg_309_1.onSingleLineUpdate_(arg_312_0)
			local var_312_0 = 0
			local var_312_1 = 0.375

			if var_312_0 < arg_309_1.time_ and arg_309_1.time_ <= var_312_0 + arg_312_0 then
				arg_309_1.talkMaxDuration = 0
				arg_309_1.dialogCg_.alpha = 1

				arg_309_1.dialog_:SetActive(true)
				SetActive(arg_309_1.leftNameGo_, true)

				local var_312_2 = arg_309_1:FormatText(StoryNameCfg[226].name)

				arg_309_1.leftNameTxt_.text = var_312_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_309_1.leftNameTxt_.transform)

				arg_309_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_309_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_309_1:RecordName(arg_309_1.leftNameTxt_.text)
				SetActive(arg_309_1.iconTrs_.gameObject, false)
				arg_309_1.callingController_:SetSelectedState("normal")

				local var_312_3 = arg_309_1:GetWordFromCfg(113191074)
				local var_312_4 = arg_309_1:FormatText(var_312_3.content)

				arg_309_1.text_.text = var_312_4

				LuaForUtil.ClearLinePrefixSymbol(arg_309_1.text_)

				local var_312_5 = 15
				local var_312_6 = utf8.len(var_312_4)
				local var_312_7 = var_312_5 <= 0 and var_312_1 or var_312_1 * (var_312_6 / var_312_5)

				if var_312_7 > 0 and var_312_1 < var_312_7 then
					arg_309_1.talkMaxDuration = var_312_7

					if var_312_7 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_7 + var_312_0
					end
				end

				arg_309_1.text_.text = var_312_4
				arg_309_1.typewritter.percent = 0

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191074", "story_v_out_113191.awb") ~= 0 then
					local var_312_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191074", "story_v_out_113191.awb") / 1000

					if var_312_8 + var_312_0 > arg_309_1.duration_ then
						arg_309_1.duration_ = var_312_8 + var_312_0
					end

					if var_312_3.prefab_name ~= "" and arg_309_1.actors_[var_312_3.prefab_name] ~= nil then
						local var_312_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_309_1.actors_[var_312_3.prefab_name].transform, "story_v_out_113191", "113191074", "story_v_out_113191.awb")

						arg_309_1:RecordAudio("113191074", var_312_9)
						arg_309_1:RecordAudio("113191074", var_312_9)
					else
						arg_309_1:AudioAction("play", "voice", "story_v_out_113191", "113191074", "story_v_out_113191.awb")
					end

					arg_309_1:RecordHistoryTalkVoice("story_v_out_113191", "113191074", "story_v_out_113191.awb")
				end

				arg_309_1:RecordContent(arg_309_1.text_.text)
			end

			local var_312_10 = math.max(var_312_1, arg_309_1.talkMaxDuration)

			if var_312_0 <= arg_309_1.time_ and arg_309_1.time_ < var_312_0 + var_312_10 then
				arg_309_1.typewritter.percent = (arg_309_1.time_ - var_312_0) / var_312_10

				arg_309_1.typewritter:SetDirty()
			end

			if arg_309_1.time_ >= var_312_0 + var_312_10 and arg_309_1.time_ < var_312_0 + var_312_10 + arg_312_0 then
				arg_309_1.typewritter.percent = 1

				arg_309_1.typewritter:SetDirty()
				arg_309_1:ShowNextGo(true)
			end
		end
	end,
	Play113191075 = function(arg_313_0, arg_313_1)
		arg_313_1.time_ = 0
		arg_313_1.frameCnt_ = 0
		arg_313_1.state_ = "playing"
		arg_313_1.curTalkId_ = 113191075
		arg_313_1.duration_ = 16.333

		local var_313_0 = {
			ja = 8.533,
			ko = 12.233,
			zh = 14.633,
			en = 16.333
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
				arg_313_0:Play113191076(arg_313_1)
			end
		end

		function arg_313_1.onSingleLineUpdate_(arg_316_0)
			local var_316_0 = 0
			local var_316_1 = 1

			if var_316_0 < arg_313_1.time_ and arg_313_1.time_ <= var_316_0 + arg_316_0 then
				arg_313_1.talkMaxDuration = 0
				arg_313_1.dialogCg_.alpha = 1

				arg_313_1.dialog_:SetActive(true)
				SetActive(arg_313_1.leftNameGo_, true)

				local var_316_2 = arg_313_1:FormatText(StoryNameCfg[226].name)

				arg_313_1.leftNameTxt_.text = var_316_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_313_1.leftNameTxt_.transform)

				arg_313_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_313_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_313_1:RecordName(arg_313_1.leftNameTxt_.text)
				SetActive(arg_313_1.iconTrs_.gameObject, false)
				arg_313_1.callingController_:SetSelectedState("normal")

				local var_316_3 = arg_313_1:GetWordFromCfg(113191075)
				local var_316_4 = arg_313_1:FormatText(var_316_3.content)

				arg_313_1.text_.text = var_316_4

				LuaForUtil.ClearLinePrefixSymbol(arg_313_1.text_)

				local var_316_5 = 40
				local var_316_6 = utf8.len(var_316_4)
				local var_316_7 = var_316_5 <= 0 and var_316_1 or var_316_1 * (var_316_6 / var_316_5)

				if var_316_7 > 0 and var_316_1 < var_316_7 then
					arg_313_1.talkMaxDuration = var_316_7

					if var_316_7 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_7 + var_316_0
					end
				end

				arg_313_1.text_.text = var_316_4
				arg_313_1.typewritter.percent = 0

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191075", "story_v_out_113191.awb") ~= 0 then
					local var_316_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191075", "story_v_out_113191.awb") / 1000

					if var_316_8 + var_316_0 > arg_313_1.duration_ then
						arg_313_1.duration_ = var_316_8 + var_316_0
					end

					if var_316_3.prefab_name ~= "" and arg_313_1.actors_[var_316_3.prefab_name] ~= nil then
						local var_316_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_313_1.actors_[var_316_3.prefab_name].transform, "story_v_out_113191", "113191075", "story_v_out_113191.awb")

						arg_313_1:RecordAudio("113191075", var_316_9)
						arg_313_1:RecordAudio("113191075", var_316_9)
					else
						arg_313_1:AudioAction("play", "voice", "story_v_out_113191", "113191075", "story_v_out_113191.awb")
					end

					arg_313_1:RecordHistoryTalkVoice("story_v_out_113191", "113191075", "story_v_out_113191.awb")
				end

				arg_313_1:RecordContent(arg_313_1.text_.text)
			end

			local var_316_10 = math.max(var_316_1, arg_313_1.talkMaxDuration)

			if var_316_0 <= arg_313_1.time_ and arg_313_1.time_ < var_316_0 + var_316_10 then
				arg_313_1.typewritter.percent = (arg_313_1.time_ - var_316_0) / var_316_10

				arg_313_1.typewritter:SetDirty()
			end

			if arg_313_1.time_ >= var_316_0 + var_316_10 and arg_313_1.time_ < var_316_0 + var_316_10 + arg_316_0 then
				arg_313_1.typewritter.percent = 1

				arg_313_1.typewritter:SetDirty()
				arg_313_1:ShowNextGo(true)
			end
		end
	end,
	Play113191076 = function(arg_317_0, arg_317_1)
		arg_317_1.time_ = 0
		arg_317_1.frameCnt_ = 0
		arg_317_1.state_ = "playing"
		arg_317_1.curTalkId_ = 113191076
		arg_317_1.duration_ = 15.7

		local var_317_0 = {
			ja = 12.566,
			ko = 10.133,
			zh = 15.7,
			en = 15.7
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
				arg_317_0:Play113191077(arg_317_1)
			end
		end

		function arg_317_1.onSingleLineUpdate_(arg_320_0)
			local var_320_0 = 0
			local var_320_1 = 1

			if var_320_0 < arg_317_1.time_ and arg_317_1.time_ <= var_320_0 + arg_320_0 then
				arg_317_1.talkMaxDuration = 0
				arg_317_1.dialogCg_.alpha = 1

				arg_317_1.dialog_:SetActive(true)
				SetActive(arg_317_1.leftNameGo_, true)

				local var_320_2 = arg_317_1:FormatText(StoryNameCfg[226].name)

				arg_317_1.leftNameTxt_.text = var_320_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_317_1.leftNameTxt_.transform)

				arg_317_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_317_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_317_1:RecordName(arg_317_1.leftNameTxt_.text)
				SetActive(arg_317_1.iconTrs_.gameObject, false)
				arg_317_1.callingController_:SetSelectedState("normal")

				local var_320_3 = arg_317_1:GetWordFromCfg(113191076)
				local var_320_4 = arg_317_1:FormatText(var_320_3.content)

				arg_317_1.text_.text = var_320_4

				LuaForUtil.ClearLinePrefixSymbol(arg_317_1.text_)

				local var_320_5 = 40
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191076", "story_v_out_113191.awb") ~= 0 then
					local var_320_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191076", "story_v_out_113191.awb") / 1000

					if var_320_8 + var_320_0 > arg_317_1.duration_ then
						arg_317_1.duration_ = var_320_8 + var_320_0
					end

					if var_320_3.prefab_name ~= "" and arg_317_1.actors_[var_320_3.prefab_name] ~= nil then
						local var_320_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_317_1.actors_[var_320_3.prefab_name].transform, "story_v_out_113191", "113191076", "story_v_out_113191.awb")

						arg_317_1:RecordAudio("113191076", var_320_9)
						arg_317_1:RecordAudio("113191076", var_320_9)
					else
						arg_317_1:AudioAction("play", "voice", "story_v_out_113191", "113191076", "story_v_out_113191.awb")
					end

					arg_317_1:RecordHistoryTalkVoice("story_v_out_113191", "113191076", "story_v_out_113191.awb")
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
	Play113191077 = function(arg_321_0, arg_321_1)
		arg_321_1.time_ = 0
		arg_321_1.frameCnt_ = 0
		arg_321_1.state_ = "playing"
		arg_321_1.curTalkId_ = 113191077
		arg_321_1.duration_ = 15.033

		local var_321_0 = {
			ja = 11.766,
			ko = 8.966,
			zh = 13.5,
			en = 15.033
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
				arg_321_0:Play113191078(arg_321_1)
			end
		end

		function arg_321_1.onSingleLineUpdate_(arg_324_0)
			local var_324_0 = 0
			local var_324_1 = 0.75

			if var_324_0 < arg_321_1.time_ and arg_321_1.time_ <= var_324_0 + arg_324_0 then
				arg_321_1.talkMaxDuration = 0
				arg_321_1.dialogCg_.alpha = 1

				arg_321_1.dialog_:SetActive(true)
				SetActive(arg_321_1.leftNameGo_, true)

				local var_324_2 = arg_321_1:FormatText(StoryNameCfg[226].name)

				arg_321_1.leftNameTxt_.text = var_324_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_321_1.leftNameTxt_.transform)

				arg_321_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_321_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_321_1:RecordName(arg_321_1.leftNameTxt_.text)
				SetActive(arg_321_1.iconTrs_.gameObject, false)
				arg_321_1.callingController_:SetSelectedState("normal")

				local var_324_3 = arg_321_1:GetWordFromCfg(113191077)
				local var_324_4 = arg_321_1:FormatText(var_324_3.content)

				arg_321_1.text_.text = var_324_4

				LuaForUtil.ClearLinePrefixSymbol(arg_321_1.text_)

				local var_324_5 = 30
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191077", "story_v_out_113191.awb") ~= 0 then
					local var_324_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191077", "story_v_out_113191.awb") / 1000

					if var_324_8 + var_324_0 > arg_321_1.duration_ then
						arg_321_1.duration_ = var_324_8 + var_324_0
					end

					if var_324_3.prefab_name ~= "" and arg_321_1.actors_[var_324_3.prefab_name] ~= nil then
						local var_324_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_321_1.actors_[var_324_3.prefab_name].transform, "story_v_out_113191", "113191077", "story_v_out_113191.awb")

						arg_321_1:RecordAudio("113191077", var_324_9)
						arg_321_1:RecordAudio("113191077", var_324_9)
					else
						arg_321_1:AudioAction("play", "voice", "story_v_out_113191", "113191077", "story_v_out_113191.awb")
					end

					arg_321_1:RecordHistoryTalkVoice("story_v_out_113191", "113191077", "story_v_out_113191.awb")
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
	Play113191078 = function(arg_325_0, arg_325_1)
		arg_325_1.time_ = 0
		arg_325_1.frameCnt_ = 0
		arg_325_1.state_ = "playing"
		arg_325_1.curTalkId_ = 113191078
		arg_325_1.duration_ = 2.533

		local var_325_0 = {
			ja = 2.533,
			ko = 1.433,
			zh = 1.566,
			en = 1.433
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
				arg_325_0:Play113191079(arg_325_1)
			end
		end

		function arg_325_1.onSingleLineUpdate_(arg_328_0)
			local var_328_0 = 0
			local var_328_1 = 0.075

			if var_328_0 < arg_325_1.time_ and arg_325_1.time_ <= var_328_0 + arg_328_0 then
				arg_325_1.talkMaxDuration = 0
				arg_325_1.dialogCg_.alpha = 1

				arg_325_1.dialog_:SetActive(true)
				SetActive(arg_325_1.leftNameGo_, true)

				local var_328_2 = arg_325_1:FormatText(StoryNameCfg[208].name)

				arg_325_1.leftNameTxt_.text = var_328_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_325_1.leftNameTxt_.transform)

				arg_325_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_325_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_325_1:RecordName(arg_325_1.leftNameTxt_.text)
				SetActive(arg_325_1.iconTrs_.gameObject, false)
				arg_325_1.callingController_:SetSelectedState("normal")

				local var_328_3 = arg_325_1:GetWordFromCfg(113191078)
				local var_328_4 = arg_325_1:FormatText(var_328_3.content)

				arg_325_1.text_.text = var_328_4

				LuaForUtil.ClearLinePrefixSymbol(arg_325_1.text_)

				local var_328_5 = 3
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191078", "story_v_out_113191.awb") ~= 0 then
					local var_328_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191078", "story_v_out_113191.awb") / 1000

					if var_328_8 + var_328_0 > arg_325_1.duration_ then
						arg_325_1.duration_ = var_328_8 + var_328_0
					end

					if var_328_3.prefab_name ~= "" and arg_325_1.actors_[var_328_3.prefab_name] ~= nil then
						local var_328_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_325_1.actors_[var_328_3.prefab_name].transform, "story_v_out_113191", "113191078", "story_v_out_113191.awb")

						arg_325_1:RecordAudio("113191078", var_328_9)
						arg_325_1:RecordAudio("113191078", var_328_9)
					else
						arg_325_1:AudioAction("play", "voice", "story_v_out_113191", "113191078", "story_v_out_113191.awb")
					end

					arg_325_1:RecordHistoryTalkVoice("story_v_out_113191", "113191078", "story_v_out_113191.awb")
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
	Play113191079 = function(arg_329_0, arg_329_1)
		arg_329_1.time_ = 0
		arg_329_1.frameCnt_ = 0
		arg_329_1.state_ = "playing"
		arg_329_1.curTalkId_ = 113191079
		arg_329_1.duration_ = 20.1

		local var_329_0 = {
			ja = 16.4,
			ko = 11.966,
			zh = 13.633,
			en = 20.1
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
				arg_329_0:Play113191080(arg_329_1)
			end
		end

		function arg_329_1.onSingleLineUpdate_(arg_332_0)
			local var_332_0 = 0
			local var_332_1 = 0.9

			if var_332_0 < arg_329_1.time_ and arg_329_1.time_ <= var_332_0 + arg_332_0 then
				arg_329_1.talkMaxDuration = 0
				arg_329_1.dialogCg_.alpha = 1

				arg_329_1.dialog_:SetActive(true)
				SetActive(arg_329_1.leftNameGo_, true)

				local var_332_2 = arg_329_1:FormatText(StoryNameCfg[226].name)

				arg_329_1.leftNameTxt_.text = var_332_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_329_1.leftNameTxt_.transform)

				arg_329_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_329_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_329_1:RecordName(arg_329_1.leftNameTxt_.text)
				SetActive(arg_329_1.iconTrs_.gameObject, false)
				arg_329_1.callingController_:SetSelectedState("normal")

				local var_332_3 = arg_329_1:GetWordFromCfg(113191079)
				local var_332_4 = arg_329_1:FormatText(var_332_3.content)

				arg_329_1.text_.text = var_332_4

				LuaForUtil.ClearLinePrefixSymbol(arg_329_1.text_)

				local var_332_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191079", "story_v_out_113191.awb") ~= 0 then
					local var_332_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191079", "story_v_out_113191.awb") / 1000

					if var_332_8 + var_332_0 > arg_329_1.duration_ then
						arg_329_1.duration_ = var_332_8 + var_332_0
					end

					if var_332_3.prefab_name ~= "" and arg_329_1.actors_[var_332_3.prefab_name] ~= nil then
						local var_332_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_329_1.actors_[var_332_3.prefab_name].transform, "story_v_out_113191", "113191079", "story_v_out_113191.awb")

						arg_329_1:RecordAudio("113191079", var_332_9)
						arg_329_1:RecordAudio("113191079", var_332_9)
					else
						arg_329_1:AudioAction("play", "voice", "story_v_out_113191", "113191079", "story_v_out_113191.awb")
					end

					arg_329_1:RecordHistoryTalkVoice("story_v_out_113191", "113191079", "story_v_out_113191.awb")
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
	Play113191080 = function(arg_333_0, arg_333_1)
		arg_333_1.time_ = 0
		arg_333_1.frameCnt_ = 0
		arg_333_1.state_ = "playing"
		arg_333_1.curTalkId_ = 113191080
		arg_333_1.duration_ = 23.9

		local var_333_0 = {
			ja = 20.566,
			ko = 16,
			zh = 23.9,
			en = 22.4
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
				arg_333_0:Play113191081(arg_333_1)
			end
		end

		function arg_333_1.onSingleLineUpdate_(arg_336_0)
			local var_336_0 = 0
			local var_336_1 = 1.225

			if var_336_0 < arg_333_1.time_ and arg_333_1.time_ <= var_336_0 + arg_336_0 then
				arg_333_1.talkMaxDuration = 0
				arg_333_1.dialogCg_.alpha = 1

				arg_333_1.dialog_:SetActive(true)
				SetActive(arg_333_1.leftNameGo_, true)

				local var_336_2 = arg_333_1:FormatText(StoryNameCfg[226].name)

				arg_333_1.leftNameTxt_.text = var_336_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_333_1.leftNameTxt_.transform)

				arg_333_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_333_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_333_1:RecordName(arg_333_1.leftNameTxt_.text)
				SetActive(arg_333_1.iconTrs_.gameObject, false)
				arg_333_1.callingController_:SetSelectedState("normal")

				local var_336_3 = arg_333_1:GetWordFromCfg(113191080)
				local var_336_4 = arg_333_1:FormatText(var_336_3.content)

				arg_333_1.text_.text = var_336_4

				LuaForUtil.ClearLinePrefixSymbol(arg_333_1.text_)

				local var_336_5 = 49
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191080", "story_v_out_113191.awb") ~= 0 then
					local var_336_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191080", "story_v_out_113191.awb") / 1000

					if var_336_8 + var_336_0 > arg_333_1.duration_ then
						arg_333_1.duration_ = var_336_8 + var_336_0
					end

					if var_336_3.prefab_name ~= "" and arg_333_1.actors_[var_336_3.prefab_name] ~= nil then
						local var_336_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_333_1.actors_[var_336_3.prefab_name].transform, "story_v_out_113191", "113191080", "story_v_out_113191.awb")

						arg_333_1:RecordAudio("113191080", var_336_9)
						arg_333_1:RecordAudio("113191080", var_336_9)
					else
						arg_333_1:AudioAction("play", "voice", "story_v_out_113191", "113191080", "story_v_out_113191.awb")
					end

					arg_333_1:RecordHistoryTalkVoice("story_v_out_113191", "113191080", "story_v_out_113191.awb")
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
	Play113191081 = function(arg_337_0, arg_337_1)
		arg_337_1.time_ = 0
		arg_337_1.frameCnt_ = 0
		arg_337_1.state_ = "playing"
		arg_337_1.curTalkId_ = 113191081
		arg_337_1.duration_ = 25.866

		local var_337_0 = {
			ja = 17.466,
			ko = 13.133,
			zh = 22.666,
			en = 25.866
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
				arg_337_0:Play113191082(arg_337_1)
			end
		end

		function arg_337_1.onSingleLineUpdate_(arg_340_0)
			local var_340_0 = 0
			local var_340_1 = 1.125

			if var_340_0 < arg_337_1.time_ and arg_337_1.time_ <= var_340_0 + arg_340_0 then
				arg_337_1.talkMaxDuration = 0
				arg_337_1.dialogCg_.alpha = 1

				arg_337_1.dialog_:SetActive(true)
				SetActive(arg_337_1.leftNameGo_, true)

				local var_340_2 = arg_337_1:FormatText(StoryNameCfg[226].name)

				arg_337_1.leftNameTxt_.text = var_340_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_337_1.leftNameTxt_.transform)

				arg_337_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_337_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_337_1:RecordName(arg_337_1.leftNameTxt_.text)
				SetActive(arg_337_1.iconTrs_.gameObject, false)
				arg_337_1.callingController_:SetSelectedState("normal")

				local var_340_3 = arg_337_1:GetWordFromCfg(113191081)
				local var_340_4 = arg_337_1:FormatText(var_340_3.content)

				arg_337_1.text_.text = var_340_4

				LuaForUtil.ClearLinePrefixSymbol(arg_337_1.text_)

				local var_340_5 = 45
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191081", "story_v_out_113191.awb") ~= 0 then
					local var_340_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191081", "story_v_out_113191.awb") / 1000

					if var_340_8 + var_340_0 > arg_337_1.duration_ then
						arg_337_1.duration_ = var_340_8 + var_340_0
					end

					if var_340_3.prefab_name ~= "" and arg_337_1.actors_[var_340_3.prefab_name] ~= nil then
						local var_340_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_337_1.actors_[var_340_3.prefab_name].transform, "story_v_out_113191", "113191081", "story_v_out_113191.awb")

						arg_337_1:RecordAudio("113191081", var_340_9)
						arg_337_1:RecordAudio("113191081", var_340_9)
					else
						arg_337_1:AudioAction("play", "voice", "story_v_out_113191", "113191081", "story_v_out_113191.awb")
					end

					arg_337_1:RecordHistoryTalkVoice("story_v_out_113191", "113191081", "story_v_out_113191.awb")
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
	Play113191082 = function(arg_341_0, arg_341_1)
		arg_341_1.time_ = 0
		arg_341_1.frameCnt_ = 0
		arg_341_1.state_ = "playing"
		arg_341_1.curTalkId_ = 113191082
		arg_341_1.duration_ = 11.466

		local var_341_0 = {
			ja = 8.3,
			ko = 9.666,
			zh = 11.466,
			en = 10.6
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
				arg_341_0:Play113191083(arg_341_1)
			end
		end

		function arg_341_1.onSingleLineUpdate_(arg_344_0)
			local var_344_0 = 0
			local var_344_1 = 0.775

			if var_344_0 < arg_341_1.time_ and arg_341_1.time_ <= var_344_0 + arg_344_0 then
				arg_341_1.talkMaxDuration = 0
				arg_341_1.dialogCg_.alpha = 1

				arg_341_1.dialog_:SetActive(true)
				SetActive(arg_341_1.leftNameGo_, true)

				local var_344_2 = arg_341_1:FormatText(StoryNameCfg[226].name)

				arg_341_1.leftNameTxt_.text = var_344_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_341_1.leftNameTxt_.transform)

				arg_341_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_341_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_341_1:RecordName(arg_341_1.leftNameTxt_.text)
				SetActive(arg_341_1.iconTrs_.gameObject, false)
				arg_341_1.callingController_:SetSelectedState("normal")

				local var_344_3 = arg_341_1:GetWordFromCfg(113191082)
				local var_344_4 = arg_341_1:FormatText(var_344_3.content)

				arg_341_1.text_.text = var_344_4

				LuaForUtil.ClearLinePrefixSymbol(arg_341_1.text_)

				local var_344_5 = 31
				local var_344_6 = utf8.len(var_344_4)
				local var_344_7 = var_344_5 <= 0 and var_344_1 or var_344_1 * (var_344_6 / var_344_5)

				if var_344_7 > 0 and var_344_1 < var_344_7 then
					arg_341_1.talkMaxDuration = var_344_7

					if var_344_7 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_7 + var_344_0
					end
				end

				arg_341_1.text_.text = var_344_4
				arg_341_1.typewritter.percent = 0

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191082", "story_v_out_113191.awb") ~= 0 then
					local var_344_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191082", "story_v_out_113191.awb") / 1000

					if var_344_8 + var_344_0 > arg_341_1.duration_ then
						arg_341_1.duration_ = var_344_8 + var_344_0
					end

					if var_344_3.prefab_name ~= "" and arg_341_1.actors_[var_344_3.prefab_name] ~= nil then
						local var_344_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_341_1.actors_[var_344_3.prefab_name].transform, "story_v_out_113191", "113191082", "story_v_out_113191.awb")

						arg_341_1:RecordAudio("113191082", var_344_9)
						arg_341_1:RecordAudio("113191082", var_344_9)
					else
						arg_341_1:AudioAction("play", "voice", "story_v_out_113191", "113191082", "story_v_out_113191.awb")
					end

					arg_341_1:RecordHistoryTalkVoice("story_v_out_113191", "113191082", "story_v_out_113191.awb")
				end

				arg_341_1:RecordContent(arg_341_1.text_.text)
			end

			local var_344_10 = math.max(var_344_1, arg_341_1.talkMaxDuration)

			if var_344_0 <= arg_341_1.time_ and arg_341_1.time_ < var_344_0 + var_344_10 then
				arg_341_1.typewritter.percent = (arg_341_1.time_ - var_344_0) / var_344_10

				arg_341_1.typewritter:SetDirty()
			end

			if arg_341_1.time_ >= var_344_0 + var_344_10 and arg_341_1.time_ < var_344_0 + var_344_10 + arg_344_0 then
				arg_341_1.typewritter.percent = 1

				arg_341_1.typewritter:SetDirty()
				arg_341_1:ShowNextGo(true)
			end
		end
	end,
	Play113191083 = function(arg_345_0, arg_345_1)
		arg_345_1.time_ = 0
		arg_345_1.frameCnt_ = 0
		arg_345_1.state_ = "playing"
		arg_345_1.curTalkId_ = 113191083
		arg_345_1.duration_ = 17.5

		local var_345_0 = {
			ja = 5.333,
			ko = 9.5,
			zh = 9.2,
			en = 17.5
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
				arg_345_0:Play113191084(arg_345_1)
			end
		end

		function arg_345_1.onSingleLineUpdate_(arg_348_0)
			local var_348_0 = 0
			local var_348_1 = 0.8

			if var_348_0 < arg_345_1.time_ and arg_345_1.time_ <= var_348_0 + arg_348_0 then
				arg_345_1.talkMaxDuration = 0
				arg_345_1.dialogCg_.alpha = 1

				arg_345_1.dialog_:SetActive(true)
				SetActive(arg_345_1.leftNameGo_, true)

				local var_348_2 = arg_345_1:FormatText(StoryNameCfg[226].name)

				arg_345_1.leftNameTxt_.text = var_348_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_345_1.leftNameTxt_.transform)

				arg_345_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_345_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_345_1:RecordName(arg_345_1.leftNameTxt_.text)
				SetActive(arg_345_1.iconTrs_.gameObject, false)
				arg_345_1.callingController_:SetSelectedState("normal")

				local var_348_3 = arg_345_1:GetWordFromCfg(113191083)
				local var_348_4 = arg_345_1:FormatText(var_348_3.content)

				arg_345_1.text_.text = var_348_4

				LuaForUtil.ClearLinePrefixSymbol(arg_345_1.text_)

				local var_348_5 = 32
				local var_348_6 = utf8.len(var_348_4)
				local var_348_7 = var_348_5 <= 0 and var_348_1 or var_348_1 * (var_348_6 / var_348_5)

				if var_348_7 > 0 and var_348_1 < var_348_7 then
					arg_345_1.talkMaxDuration = var_348_7

					if var_348_7 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_7 + var_348_0
					end
				end

				arg_345_1.text_.text = var_348_4
				arg_345_1.typewritter.percent = 0

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191083", "story_v_out_113191.awb") ~= 0 then
					local var_348_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191083", "story_v_out_113191.awb") / 1000

					if var_348_8 + var_348_0 > arg_345_1.duration_ then
						arg_345_1.duration_ = var_348_8 + var_348_0
					end

					if var_348_3.prefab_name ~= "" and arg_345_1.actors_[var_348_3.prefab_name] ~= nil then
						local var_348_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_345_1.actors_[var_348_3.prefab_name].transform, "story_v_out_113191", "113191083", "story_v_out_113191.awb")

						arg_345_1:RecordAudio("113191083", var_348_9)
						arg_345_1:RecordAudio("113191083", var_348_9)
					else
						arg_345_1:AudioAction("play", "voice", "story_v_out_113191", "113191083", "story_v_out_113191.awb")
					end

					arg_345_1:RecordHistoryTalkVoice("story_v_out_113191", "113191083", "story_v_out_113191.awb")
				end

				arg_345_1:RecordContent(arg_345_1.text_.text)
			end

			local var_348_10 = math.max(var_348_1, arg_345_1.talkMaxDuration)

			if var_348_0 <= arg_345_1.time_ and arg_345_1.time_ < var_348_0 + var_348_10 then
				arg_345_1.typewritter.percent = (arg_345_1.time_ - var_348_0) / var_348_10

				arg_345_1.typewritter:SetDirty()
			end

			if arg_345_1.time_ >= var_348_0 + var_348_10 and arg_345_1.time_ < var_348_0 + var_348_10 + arg_348_0 then
				arg_345_1.typewritter.percent = 1

				arg_345_1.typewritter:SetDirty()
				arg_345_1:ShowNextGo(true)
			end
		end
	end,
	Play113191084 = function(arg_349_0, arg_349_1)
		arg_349_1.time_ = 0
		arg_349_1.frameCnt_ = 0
		arg_349_1.state_ = "playing"
		arg_349_1.curTalkId_ = 113191084
		arg_349_1.duration_ = 17.133

		local var_349_0 = {
			ja = 13.9,
			ko = 11.5,
			zh = 13.833,
			en = 17.133
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
				arg_349_0:Play113191085(arg_349_1)
			end
		end

		function arg_349_1.onSingleLineUpdate_(arg_352_0)
			local var_352_0 = 0
			local var_352_1 = 1.05

			if var_352_0 < arg_349_1.time_ and arg_349_1.time_ <= var_352_0 + arg_352_0 then
				arg_349_1.talkMaxDuration = 0
				arg_349_1.dialogCg_.alpha = 1

				arg_349_1.dialog_:SetActive(true)
				SetActive(arg_349_1.leftNameGo_, true)

				local var_352_2 = arg_349_1:FormatText(StoryNameCfg[226].name)

				arg_349_1.leftNameTxt_.text = var_352_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_349_1.leftNameTxt_.transform)

				arg_349_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_349_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_349_1:RecordName(arg_349_1.leftNameTxt_.text)
				SetActive(arg_349_1.iconTrs_.gameObject, false)
				arg_349_1.callingController_:SetSelectedState("normal")

				local var_352_3 = arg_349_1:GetWordFromCfg(113191084)
				local var_352_4 = arg_349_1:FormatText(var_352_3.content)

				arg_349_1.text_.text = var_352_4

				LuaForUtil.ClearLinePrefixSymbol(arg_349_1.text_)

				local var_352_5 = 42
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191084", "story_v_out_113191.awb") ~= 0 then
					local var_352_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191084", "story_v_out_113191.awb") / 1000

					if var_352_8 + var_352_0 > arg_349_1.duration_ then
						arg_349_1.duration_ = var_352_8 + var_352_0
					end

					if var_352_3.prefab_name ~= "" and arg_349_1.actors_[var_352_3.prefab_name] ~= nil then
						local var_352_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_349_1.actors_[var_352_3.prefab_name].transform, "story_v_out_113191", "113191084", "story_v_out_113191.awb")

						arg_349_1:RecordAudio("113191084", var_352_9)
						arg_349_1:RecordAudio("113191084", var_352_9)
					else
						arg_349_1:AudioAction("play", "voice", "story_v_out_113191", "113191084", "story_v_out_113191.awb")
					end

					arg_349_1:RecordHistoryTalkVoice("story_v_out_113191", "113191084", "story_v_out_113191.awb")
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
	Play113191085 = function(arg_353_0, arg_353_1)
		arg_353_1.time_ = 0
		arg_353_1.frameCnt_ = 0
		arg_353_1.state_ = "playing"
		arg_353_1.curTalkId_ = 113191085
		arg_353_1.duration_ = 20.633

		local var_353_0 = {
			ja = 16.833,
			ko = 11.1,
			zh = 16.5,
			en = 20.633
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
				arg_353_0:Play113191086(arg_353_1)
			end
		end

		function arg_353_1.onSingleLineUpdate_(arg_356_0)
			local var_356_0 = 0
			local var_356_1 = 1.275

			if var_356_0 < arg_353_1.time_ and arg_353_1.time_ <= var_356_0 + arg_356_0 then
				arg_353_1.talkMaxDuration = 0
				arg_353_1.dialogCg_.alpha = 1

				arg_353_1.dialog_:SetActive(true)
				SetActive(arg_353_1.leftNameGo_, true)

				local var_356_2 = arg_353_1:FormatText(StoryNameCfg[226].name)

				arg_353_1.leftNameTxt_.text = var_356_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_353_1.leftNameTxt_.transform)

				arg_353_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_353_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_353_1:RecordName(arg_353_1.leftNameTxt_.text)
				SetActive(arg_353_1.iconTrs_.gameObject, false)
				arg_353_1.callingController_:SetSelectedState("normal")

				local var_356_3 = arg_353_1:GetWordFromCfg(113191085)
				local var_356_4 = arg_353_1:FormatText(var_356_3.content)

				arg_353_1.text_.text = var_356_4

				LuaForUtil.ClearLinePrefixSymbol(arg_353_1.text_)

				local var_356_5 = 51
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191085", "story_v_out_113191.awb") ~= 0 then
					local var_356_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191085", "story_v_out_113191.awb") / 1000

					if var_356_8 + var_356_0 > arg_353_1.duration_ then
						arg_353_1.duration_ = var_356_8 + var_356_0
					end

					if var_356_3.prefab_name ~= "" and arg_353_1.actors_[var_356_3.prefab_name] ~= nil then
						local var_356_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_353_1.actors_[var_356_3.prefab_name].transform, "story_v_out_113191", "113191085", "story_v_out_113191.awb")

						arg_353_1:RecordAudio("113191085", var_356_9)
						arg_353_1:RecordAudio("113191085", var_356_9)
					else
						arg_353_1:AudioAction("play", "voice", "story_v_out_113191", "113191085", "story_v_out_113191.awb")
					end

					arg_353_1:RecordHistoryTalkVoice("story_v_out_113191", "113191085", "story_v_out_113191.awb")
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
	Play113191086 = function(arg_357_0, arg_357_1)
		arg_357_1.time_ = 0
		arg_357_1.frameCnt_ = 0
		arg_357_1.state_ = "playing"
		arg_357_1.curTalkId_ = 113191086
		arg_357_1.duration_ = 19.333

		local var_357_0 = {
			ja = 19.333,
			ko = 10.3,
			zh = 16.066,
			en = 18.5
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
				arg_357_0:Play113191087(arg_357_1)
			end
		end

		function arg_357_1.onSingleLineUpdate_(arg_360_0)
			local var_360_0 = 0
			local var_360_1 = 0.9

			if var_360_0 < arg_357_1.time_ and arg_357_1.time_ <= var_360_0 + arg_360_0 then
				arg_357_1.talkMaxDuration = 0
				arg_357_1.dialogCg_.alpha = 1

				arg_357_1.dialog_:SetActive(true)
				SetActive(arg_357_1.leftNameGo_, true)

				local var_360_2 = arg_357_1:FormatText(StoryNameCfg[226].name)

				arg_357_1.leftNameTxt_.text = var_360_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_357_1.leftNameTxt_.transform)

				arg_357_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_357_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_357_1:RecordName(arg_357_1.leftNameTxt_.text)
				SetActive(arg_357_1.iconTrs_.gameObject, false)
				arg_357_1.callingController_:SetSelectedState("normal")

				local var_360_3 = arg_357_1:GetWordFromCfg(113191086)
				local var_360_4 = arg_357_1:FormatText(var_360_3.content)

				arg_357_1.text_.text = var_360_4

				LuaForUtil.ClearLinePrefixSymbol(arg_357_1.text_)

				local var_360_5 = 36
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191086", "story_v_out_113191.awb") ~= 0 then
					local var_360_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191086", "story_v_out_113191.awb") / 1000

					if var_360_8 + var_360_0 > arg_357_1.duration_ then
						arg_357_1.duration_ = var_360_8 + var_360_0
					end

					if var_360_3.prefab_name ~= "" and arg_357_1.actors_[var_360_3.prefab_name] ~= nil then
						local var_360_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_357_1.actors_[var_360_3.prefab_name].transform, "story_v_out_113191", "113191086", "story_v_out_113191.awb")

						arg_357_1:RecordAudio("113191086", var_360_9)
						arg_357_1:RecordAudio("113191086", var_360_9)
					else
						arg_357_1:AudioAction("play", "voice", "story_v_out_113191", "113191086", "story_v_out_113191.awb")
					end

					arg_357_1:RecordHistoryTalkVoice("story_v_out_113191", "113191086", "story_v_out_113191.awb")
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
	Play113191087 = function(arg_361_0, arg_361_1)
		arg_361_1.time_ = 0
		arg_361_1.frameCnt_ = 0
		arg_361_1.state_ = "playing"
		arg_361_1.curTalkId_ = 113191087
		arg_361_1.duration_ = 4

		local var_361_0 = {
			ja = 4,
			ko = 3.433,
			zh = 3.266,
			en = 3.033
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
				arg_361_0:Play113191088(arg_361_1)
			end
		end

		function arg_361_1.onSingleLineUpdate_(arg_364_0)
			local var_364_0 = 0
			local var_364_1 = 0.175

			if var_364_0 < arg_361_1.time_ and arg_361_1.time_ <= var_364_0 + arg_364_0 then
				arg_361_1.talkMaxDuration = 0
				arg_361_1.dialogCg_.alpha = 1

				arg_361_1.dialog_:SetActive(true)
				SetActive(arg_361_1.leftNameGo_, true)

				local var_364_2 = arg_361_1:FormatText(StoryNameCfg[208].name)

				arg_361_1.leftNameTxt_.text = var_364_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_361_1.leftNameTxt_.transform)

				arg_361_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_361_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_361_1:RecordName(arg_361_1.leftNameTxt_.text)
				SetActive(arg_361_1.iconTrs_.gameObject, false)
				arg_361_1.callingController_:SetSelectedState("normal")

				local var_364_3 = arg_361_1:GetWordFromCfg(113191087)
				local var_364_4 = arg_361_1:FormatText(var_364_3.content)

				arg_361_1.text_.text = var_364_4

				LuaForUtil.ClearLinePrefixSymbol(arg_361_1.text_)

				local var_364_5 = 7
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

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191087", "story_v_out_113191.awb") ~= 0 then
					local var_364_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191087", "story_v_out_113191.awb") / 1000

					if var_364_8 + var_364_0 > arg_361_1.duration_ then
						arg_361_1.duration_ = var_364_8 + var_364_0
					end

					if var_364_3.prefab_name ~= "" and arg_361_1.actors_[var_364_3.prefab_name] ~= nil then
						local var_364_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_361_1.actors_[var_364_3.prefab_name].transform, "story_v_out_113191", "113191087", "story_v_out_113191.awb")

						arg_361_1:RecordAudio("113191087", var_364_9)
						arg_361_1:RecordAudio("113191087", var_364_9)
					else
						arg_361_1:AudioAction("play", "voice", "story_v_out_113191", "113191087", "story_v_out_113191.awb")
					end

					arg_361_1:RecordHistoryTalkVoice("story_v_out_113191", "113191087", "story_v_out_113191.awb")
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
	Play113191088 = function(arg_365_0, arg_365_1)
		arg_365_1.time_ = 0
		arg_365_1.frameCnt_ = 0
		arg_365_1.state_ = "playing"
		arg_365_1.curTalkId_ = 113191088
		arg_365_1.duration_ = 13.5

		local var_365_0 = {
			ja = 9.566,
			ko = 5.533,
			zh = 13.5,
			en = 8.5
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
				arg_365_0:Play113191089(arg_365_1)
			end
		end

		function arg_365_1.onSingleLineUpdate_(arg_368_0)
			local var_368_0 = 0
			local var_368_1 = 0.425

			if var_368_0 < arg_365_1.time_ and arg_365_1.time_ <= var_368_0 + arg_368_0 then
				arg_365_1.talkMaxDuration = 0
				arg_365_1.dialogCg_.alpha = 1

				arg_365_1.dialog_:SetActive(true)
				SetActive(arg_365_1.leftNameGo_, true)

				local var_368_2 = arg_365_1:FormatText(StoryNameCfg[226].name)

				arg_365_1.leftNameTxt_.text = var_368_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_365_1.leftNameTxt_.transform)

				arg_365_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_365_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_365_1:RecordName(arg_365_1.leftNameTxt_.text)
				SetActive(arg_365_1.iconTrs_.gameObject, false)
				arg_365_1.callingController_:SetSelectedState("normal")

				local var_368_3 = arg_365_1:GetWordFromCfg(113191088)
				local var_368_4 = arg_365_1:FormatText(var_368_3.content)

				arg_365_1.text_.text = var_368_4

				LuaForUtil.ClearLinePrefixSymbol(arg_365_1.text_)

				local var_368_5 = 17
				local var_368_6 = utf8.len(var_368_4)
				local var_368_7 = var_368_5 <= 0 and var_368_1 or var_368_1 * (var_368_6 / var_368_5)

				if var_368_7 > 0 and var_368_1 < var_368_7 then
					arg_365_1.talkMaxDuration = var_368_7

					if var_368_7 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_7 + var_368_0
					end
				end

				arg_365_1.text_.text = var_368_4
				arg_365_1.typewritter.percent = 0

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191088", "story_v_out_113191.awb") ~= 0 then
					local var_368_8 = manager.audio:GetVoiceLength("story_v_out_113191", "113191088", "story_v_out_113191.awb") / 1000

					if var_368_8 + var_368_0 > arg_365_1.duration_ then
						arg_365_1.duration_ = var_368_8 + var_368_0
					end

					if var_368_3.prefab_name ~= "" and arg_365_1.actors_[var_368_3.prefab_name] ~= nil then
						local var_368_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_365_1.actors_[var_368_3.prefab_name].transform, "story_v_out_113191", "113191088", "story_v_out_113191.awb")

						arg_365_1:RecordAudio("113191088", var_368_9)
						arg_365_1:RecordAudio("113191088", var_368_9)
					else
						arg_365_1:AudioAction("play", "voice", "story_v_out_113191", "113191088", "story_v_out_113191.awb")
					end

					arg_365_1:RecordHistoryTalkVoice("story_v_out_113191", "113191088", "story_v_out_113191.awb")
				end

				arg_365_1:RecordContent(arg_365_1.text_.text)
			end

			local var_368_10 = math.max(var_368_1, arg_365_1.talkMaxDuration)

			if var_368_0 <= arg_365_1.time_ and arg_365_1.time_ < var_368_0 + var_368_10 then
				arg_365_1.typewritter.percent = (arg_365_1.time_ - var_368_0) / var_368_10

				arg_365_1.typewritter:SetDirty()
			end

			if arg_365_1.time_ >= var_368_0 + var_368_10 and arg_365_1.time_ < var_368_0 + var_368_10 + arg_368_0 then
				arg_365_1.typewritter.percent = 1

				arg_365_1.typewritter:SetDirty()
				arg_365_1:ShowNextGo(true)
			end
		end
	end,
	Play113191089 = function(arg_369_0, arg_369_1)
		arg_369_1.time_ = 0
		arg_369_1.frameCnt_ = 0
		arg_369_1.state_ = "playing"
		arg_369_1.curTalkId_ = 113191089
		arg_369_1.duration_ = 1.866

		local var_369_0 = {
			ja = 1.566,
			ko = 1.866,
			zh = 1.8,
			en = 1.6
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
				arg_369_0:Play113191090(arg_369_1)
			end
		end

		function arg_369_1.onSingleLineUpdate_(arg_372_0)
			local var_372_0 = 0
			local var_372_1 = 1

			if var_372_0 < arg_369_1.time_ and arg_369_1.time_ <= var_372_0 + arg_372_0 then
				local var_372_2 = "play"
				local var_372_3 = "music"

				arg_369_1:AudioAction(var_372_2, var_372_3, "ui_battle", "ui_battle_stopbgm", "")
			end

			local var_372_4 = 0
			local var_372_5 = 0.1

			if var_372_4 < arg_369_1.time_ and arg_369_1.time_ <= var_372_4 + arg_372_0 then
				arg_369_1.talkMaxDuration = 0
				arg_369_1.dialogCg_.alpha = 1

				arg_369_1.dialog_:SetActive(true)
				SetActive(arg_369_1.leftNameGo_, true)

				local var_372_6 = arg_369_1:FormatText(StoryNameCfg[208].name)

				arg_369_1.leftNameTxt_.text = var_372_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_369_1.leftNameTxt_.transform)

				arg_369_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_369_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_369_1:RecordName(arg_369_1.leftNameTxt_.text)
				SetActive(arg_369_1.iconTrs_.gameObject, false)
				arg_369_1.callingController_:SetSelectedState("normal")

				local var_372_7 = arg_369_1:GetWordFromCfg(113191089)
				local var_372_8 = arg_369_1:FormatText(var_372_7.content)

				arg_369_1.text_.text = var_372_8

				LuaForUtil.ClearLinePrefixSymbol(arg_369_1.text_)

				local var_372_9 = 4
				local var_372_10 = utf8.len(var_372_8)
				local var_372_11 = var_372_9 <= 0 and var_372_5 or var_372_5 * (var_372_10 / var_372_9)

				if var_372_11 > 0 and var_372_5 < var_372_11 then
					arg_369_1.talkMaxDuration = var_372_11

					if var_372_11 + var_372_4 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_11 + var_372_4
					end
				end

				arg_369_1.text_.text = var_372_8
				arg_369_1.typewritter.percent = 0

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191089", "story_v_out_113191.awb") ~= 0 then
					local var_372_12 = manager.audio:GetVoiceLength("story_v_out_113191", "113191089", "story_v_out_113191.awb") / 1000

					if var_372_12 + var_372_4 > arg_369_1.duration_ then
						arg_369_1.duration_ = var_372_12 + var_372_4
					end

					if var_372_7.prefab_name ~= "" and arg_369_1.actors_[var_372_7.prefab_name] ~= nil then
						local var_372_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_369_1.actors_[var_372_7.prefab_name].transform, "story_v_out_113191", "113191089", "story_v_out_113191.awb")

						arg_369_1:RecordAudio("113191089", var_372_13)
						arg_369_1:RecordAudio("113191089", var_372_13)
					else
						arg_369_1:AudioAction("play", "voice", "story_v_out_113191", "113191089", "story_v_out_113191.awb")
					end

					arg_369_1:RecordHistoryTalkVoice("story_v_out_113191", "113191089", "story_v_out_113191.awb")
				end

				arg_369_1:RecordContent(arg_369_1.text_.text)
			end

			local var_372_14 = math.max(var_372_5, arg_369_1.talkMaxDuration)

			if var_372_4 <= arg_369_1.time_ and arg_369_1.time_ < var_372_4 + var_372_14 then
				arg_369_1.typewritter.percent = (arg_369_1.time_ - var_372_4) / var_372_14

				arg_369_1.typewritter:SetDirty()
			end

			if arg_369_1.time_ >= var_372_4 + var_372_14 and arg_369_1.time_ < var_372_4 + var_372_14 + arg_372_0 then
				arg_369_1.typewritter.percent = 1

				arg_369_1.typewritter:SetDirty()
				arg_369_1:ShowNextGo(true)
			end
		end
	end,
	Play113191090 = function(arg_373_0, arg_373_1)
		arg_373_1.time_ = 0
		arg_373_1.frameCnt_ = 0
		arg_373_1.state_ = "playing"
		arg_373_1.curTalkId_ = 113191090
		arg_373_1.duration_ = 7.9

		local var_373_0 = {
			ja = 7.1,
			ko = 6.533,
			zh = 7.9,
			en = 7.866
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
				arg_373_0:Play113191091(arg_373_1)
			end
		end

		function arg_373_1.onSingleLineUpdate_(arg_376_0)
			local var_376_0 = 2

			if var_376_0 < arg_373_1.time_ and arg_373_1.time_ <= var_376_0 + arg_376_0 then
				arg_373_1.mask_.enabled = true
				arg_373_1.mask_.raycastTarget = true

				arg_373_1:SetGaussion(false)
			end

			local var_376_1 = 2

			if var_376_0 <= arg_373_1.time_ and arg_373_1.time_ < var_376_0 + var_376_1 then
				local var_376_2 = (arg_373_1.time_ - var_376_0) / var_376_1
				local var_376_3 = Color.New(0, 0, 0)

				var_376_3.a = Mathf.Lerp(1, 0, var_376_2)
				arg_373_1.mask_.color = var_376_3
			end

			if arg_373_1.time_ >= var_376_0 + var_376_1 and arg_373_1.time_ < var_376_0 + var_376_1 + arg_376_0 then
				local var_376_4 = Color.New(0, 0, 0)
				local var_376_5 = 0

				arg_373_1.mask_.enabled = false
				var_376_4.a = var_376_5
				arg_373_1.mask_.color = var_376_4
			end

			local var_376_6 = 0

			if var_376_6 < arg_373_1.time_ and arg_373_1.time_ <= var_376_6 + arg_376_0 then
				arg_373_1.mask_.enabled = true
				arg_373_1.mask_.raycastTarget = true

				arg_373_1:SetGaussion(false)
			end

			local var_376_7 = 2

			if var_376_6 <= arg_373_1.time_ and arg_373_1.time_ < var_376_6 + var_376_7 then
				local var_376_8 = (arg_373_1.time_ - var_376_6) / var_376_7
				local var_376_9 = Color.New(0, 0, 0)

				var_376_9.a = Mathf.Lerp(0, 1, var_376_8)
				arg_373_1.mask_.color = var_376_9
			end

			if arg_373_1.time_ >= var_376_6 + var_376_7 and arg_373_1.time_ < var_376_6 + var_376_7 + arg_376_0 then
				local var_376_10 = Color.New(0, 0, 0)

				var_376_10.a = 1
				arg_373_1.mask_.color = var_376_10
			end

			local var_376_11 = 2

			if var_376_11 < arg_373_1.time_ and arg_373_1.time_ <= var_376_11 + arg_376_0 then
				local var_376_12 = manager.ui.mainCamera.transform.localPosition
				local var_376_13 = Vector3.New(0, 0, 10) + Vector3.New(var_376_12.x, var_376_12.y, 0)
				local var_376_14 = arg_373_1.bgs_.F03b

				var_376_14.transform.localPosition = var_376_13
				var_376_14.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_376_15 = var_376_14:GetComponent("SpriteRenderer")

				if var_376_15 and var_376_15.sprite then
					local var_376_16 = (var_376_14.transform.localPosition - var_376_12).z
					local var_376_17 = manager.ui.mainCameraCom_
					local var_376_18 = 2 * var_376_16 * Mathf.Tan(var_376_17.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_376_19 = var_376_18 * var_376_17.aspect
					local var_376_20 = var_376_15.sprite.bounds.size.x
					local var_376_21 = var_376_15.sprite.bounds.size.y
					local var_376_22 = var_376_19 / var_376_20
					local var_376_23 = var_376_18 / var_376_21
					local var_376_24 = var_376_23 < var_376_22 and var_376_22 or var_376_23

					var_376_14.transform.localScale = Vector3.New(var_376_24, var_376_24, 0)
				end

				for iter_376_0, iter_376_1 in pairs(arg_373_1.bgs_) do
					if iter_376_0 ~= "F03b" then
						iter_376_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_376_25 = arg_373_1.actors_["1041ui_story"].transform
			local var_376_26 = 3.8

			if var_376_26 < arg_373_1.time_ and arg_373_1.time_ <= var_376_26 + arg_376_0 then
				arg_373_1.var_.moveOldPos1041ui_story = var_376_25.localPosition
			end

			local var_376_27 = 0.001

			if var_376_26 <= arg_373_1.time_ and arg_373_1.time_ < var_376_26 + var_376_27 then
				local var_376_28 = (arg_373_1.time_ - var_376_26) / var_376_27
				local var_376_29 = Vector3.New(0, -1.11, -5.9)

				var_376_25.localPosition = Vector3.Lerp(arg_373_1.var_.moveOldPos1041ui_story, var_376_29, var_376_28)

				local var_376_30 = manager.ui.mainCamera.transform.position - var_376_25.position

				var_376_25.forward = Vector3.New(var_376_30.x, var_376_30.y, var_376_30.z)

				local var_376_31 = var_376_25.localEulerAngles

				var_376_31.z = 0
				var_376_31.x = 0
				var_376_25.localEulerAngles = var_376_31
			end

			if arg_373_1.time_ >= var_376_26 + var_376_27 and arg_373_1.time_ < var_376_26 + var_376_27 + arg_376_0 then
				var_376_25.localPosition = Vector3.New(0, -1.11, -5.9)

				local var_376_32 = manager.ui.mainCamera.transform.position - var_376_25.position

				var_376_25.forward = Vector3.New(var_376_32.x, var_376_32.y, var_376_32.z)

				local var_376_33 = var_376_25.localEulerAngles

				var_376_33.z = 0
				var_376_33.x = 0
				var_376_25.localEulerAngles = var_376_33
			end

			local var_376_34 = 3.8

			if var_376_34 < arg_373_1.time_ and arg_373_1.time_ <= var_376_34 + arg_376_0 then
				arg_373_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action7_1")
			end

			local var_376_35 = 3.8

			if var_376_35 < arg_373_1.time_ and arg_373_1.time_ <= var_376_35 + arg_376_0 then
				arg_373_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0204cva")
			end

			local var_376_36 = arg_373_1.actors_["1041ui_story"]
			local var_376_37 = 3.8

			if var_376_37 < arg_373_1.time_ and arg_373_1.time_ <= var_376_37 + arg_376_0 and arg_373_1.var_.characterEffect1041ui_story == nil then
				arg_373_1.var_.characterEffect1041ui_story = var_376_36:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_376_38 = 0.2

			if var_376_37 <= arg_373_1.time_ and arg_373_1.time_ < var_376_37 + var_376_38 then
				local var_376_39 = (arg_373_1.time_ - var_376_37) / var_376_38

				if arg_373_1.var_.characterEffect1041ui_story then
					arg_373_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_373_1.time_ >= var_376_37 + var_376_38 and arg_373_1.time_ < var_376_37 + var_376_38 + arg_376_0 and arg_373_1.var_.characterEffect1041ui_story then
				arg_373_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			if arg_373_1.frameCnt_ <= 1 then
				arg_373_1.dialog_:SetActive(false)
			end

			local var_376_40 = 4
			local var_376_41 = 0.2

			if var_376_40 < arg_373_1.time_ and arg_373_1.time_ <= var_376_40 + arg_376_0 then
				arg_373_1.talkMaxDuration = 0

				arg_373_1.dialog_:SetActive(true)

				local var_376_42 = LeanTween.value(arg_373_1.dialog_, 0, 1, 0.3)

				var_376_42:setOnUpdate(LuaHelper.FloatAction(function(arg_377_0)
					arg_373_1.dialogCg_.alpha = arg_377_0
				end))
				var_376_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_373_1.dialog_)
					var_376_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_373_1.duration_ = arg_373_1.duration_ + 0.3

				SetActive(arg_373_1.leftNameGo_, true)

				local var_376_43 = arg_373_1:FormatText(StoryNameCfg[208].name)

				arg_373_1.leftNameTxt_.text = var_376_43

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_373_1.leftNameTxt_.transform)

				arg_373_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_373_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_373_1:RecordName(arg_373_1.leftNameTxt_.text)
				SetActive(arg_373_1.iconTrs_.gameObject, false)
				arg_373_1.callingController_:SetSelectedState("normal")

				local var_376_44 = arg_373_1:GetWordFromCfg(113191090)
				local var_376_45 = arg_373_1:FormatText(var_376_44.content)

				arg_373_1.text_.text = var_376_45

				LuaForUtil.ClearLinePrefixSymbol(arg_373_1.text_)

				local var_376_46 = 8
				local var_376_47 = utf8.len(var_376_45)
				local var_376_48 = var_376_46 <= 0 and var_376_41 or var_376_41 * (var_376_47 / var_376_46)

				if var_376_48 > 0 and var_376_41 < var_376_48 then
					arg_373_1.talkMaxDuration = var_376_48
					var_376_40 = var_376_40 + 0.3

					if var_376_48 + var_376_40 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_48 + var_376_40
					end
				end

				arg_373_1.text_.text = var_376_45
				arg_373_1.typewritter.percent = 0

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191090", "story_v_out_113191.awb") ~= 0 then
					local var_376_49 = manager.audio:GetVoiceLength("story_v_out_113191", "113191090", "story_v_out_113191.awb") / 1000

					if var_376_49 + var_376_40 > arg_373_1.duration_ then
						arg_373_1.duration_ = var_376_49 + var_376_40
					end

					if var_376_44.prefab_name ~= "" and arg_373_1.actors_[var_376_44.prefab_name] ~= nil then
						local var_376_50 = LuaForUtil.PlayVoiceWithCriLipsync(arg_373_1.actors_[var_376_44.prefab_name].transform, "story_v_out_113191", "113191090", "story_v_out_113191.awb")

						arg_373_1:RecordAudio("113191090", var_376_50)
						arg_373_1:RecordAudio("113191090", var_376_50)
					else
						arg_373_1:AudioAction("play", "voice", "story_v_out_113191", "113191090", "story_v_out_113191.awb")
					end

					arg_373_1:RecordHistoryTalkVoice("story_v_out_113191", "113191090", "story_v_out_113191.awb")
				end

				arg_373_1:RecordContent(arg_373_1.text_.text)
			end

			local var_376_51 = var_376_40 + 0.3
			local var_376_52 = math.max(var_376_41, arg_373_1.talkMaxDuration)

			if var_376_51 <= arg_373_1.time_ and arg_373_1.time_ < var_376_51 + var_376_52 then
				arg_373_1.typewritter.percent = (arg_373_1.time_ - var_376_51) / var_376_52

				arg_373_1.typewritter:SetDirty()
			end

			if arg_373_1.time_ >= var_376_51 + var_376_52 and arg_373_1.time_ < var_376_51 + var_376_52 + arg_376_0 then
				arg_373_1.typewritter.percent = 1

				arg_373_1.typewritter:SetDirty()
				arg_373_1:ShowNextGo(true)
			end
		end
	end,
	Play113191091 = function(arg_379_0, arg_379_1)
		arg_379_1.time_ = 0
		arg_379_1.frameCnt_ = 0
		arg_379_1.state_ = "playing"
		arg_379_1.curTalkId_ = 113191091
		arg_379_1.duration_ = 13.533

		local var_379_0 = {
			ja = 13.2,
			ko = 10.3,
			zh = 13.533,
			en = 12.1
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
				arg_379_0:Play113191092(arg_379_1)
			end
		end

		function arg_379_1.onSingleLineUpdate_(arg_382_0)
			local var_382_0 = 0

			if var_382_0 < arg_379_1.time_ and arg_379_1.time_ <= var_382_0 + arg_382_0 then
				arg_379_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3104cva")
			end

			local var_382_1 = 0
			local var_382_2 = 1

			if var_382_1 < arg_379_1.time_ and arg_379_1.time_ <= var_382_1 + arg_382_0 then
				arg_379_1.talkMaxDuration = 0
				arg_379_1.dialogCg_.alpha = 1

				arg_379_1.dialog_:SetActive(true)
				SetActive(arg_379_1.leftNameGo_, true)

				local var_382_3 = arg_379_1:FormatText(StoryNameCfg[208].name)

				arg_379_1.leftNameTxt_.text = var_382_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_379_1.leftNameTxt_.transform)

				arg_379_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_379_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_379_1:RecordName(arg_379_1.leftNameTxt_.text)
				SetActive(arg_379_1.iconTrs_.gameObject, false)
				arg_379_1.callingController_:SetSelectedState("normal")

				local var_382_4 = arg_379_1:GetWordFromCfg(113191091)
				local var_382_5 = arg_379_1:FormatText(var_382_4.content)

				arg_379_1.text_.text = var_382_5

				LuaForUtil.ClearLinePrefixSymbol(arg_379_1.text_)

				local var_382_6 = 40
				local var_382_7 = utf8.len(var_382_5)
				local var_382_8 = var_382_6 <= 0 and var_382_2 or var_382_2 * (var_382_7 / var_382_6)

				if var_382_8 > 0 and var_382_2 < var_382_8 then
					arg_379_1.talkMaxDuration = var_382_8

					if var_382_8 + var_382_1 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_8 + var_382_1
					end
				end

				arg_379_1.text_.text = var_382_5
				arg_379_1.typewritter.percent = 0

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191091", "story_v_out_113191.awb") ~= 0 then
					local var_382_9 = manager.audio:GetVoiceLength("story_v_out_113191", "113191091", "story_v_out_113191.awb") / 1000

					if var_382_9 + var_382_1 > arg_379_1.duration_ then
						arg_379_1.duration_ = var_382_9 + var_382_1
					end

					if var_382_4.prefab_name ~= "" and arg_379_1.actors_[var_382_4.prefab_name] ~= nil then
						local var_382_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_379_1.actors_[var_382_4.prefab_name].transform, "story_v_out_113191", "113191091", "story_v_out_113191.awb")

						arg_379_1:RecordAudio("113191091", var_382_10)
						arg_379_1:RecordAudio("113191091", var_382_10)
					else
						arg_379_1:AudioAction("play", "voice", "story_v_out_113191", "113191091", "story_v_out_113191.awb")
					end

					arg_379_1:RecordHistoryTalkVoice("story_v_out_113191", "113191091", "story_v_out_113191.awb")
				end

				arg_379_1:RecordContent(arg_379_1.text_.text)
			end

			local var_382_11 = math.max(var_382_2, arg_379_1.talkMaxDuration)

			if var_382_1 <= arg_379_1.time_ and arg_379_1.time_ < var_382_1 + var_382_11 then
				arg_379_1.typewritter.percent = (arg_379_1.time_ - var_382_1) / var_382_11

				arg_379_1.typewritter:SetDirty()
			end

			if arg_379_1.time_ >= var_382_1 + var_382_11 and arg_379_1.time_ < var_382_1 + var_382_11 + arg_382_0 then
				arg_379_1.typewritter.percent = 1

				arg_379_1.typewritter:SetDirty()
				arg_379_1:ShowNextGo(true)
			end
		end
	end,
	Play113191092 = function(arg_383_0, arg_383_1)
		arg_383_1.time_ = 0
		arg_383_1.frameCnt_ = 0
		arg_383_1.state_ = "playing"
		arg_383_1.curTalkId_ = 113191092
		arg_383_1.duration_ = 5

		SetActive(arg_383_1.tipsGo_, false)

		function arg_383_1.onSingleLineFinish_()
			arg_383_1.onSingleLineUpdate_ = nil
			arg_383_1.onSingleLineFinish_ = nil
			arg_383_1.state_ = "waiting"
		end

		function arg_383_1.playNext_(arg_385_0)
			if arg_385_0 == 1 then
				arg_383_0:Play113191093(arg_383_1)
			end
		end

		function arg_383_1.onSingleLineUpdate_(arg_386_0)
			local var_386_0 = arg_383_1.actors_["1041ui_story"].transform
			local var_386_1 = 0

			if var_386_1 < arg_383_1.time_ and arg_383_1.time_ <= var_386_1 + arg_386_0 then
				arg_383_1.var_.moveOldPos1041ui_story = var_386_0.localPosition
			end

			local var_386_2 = 0.001

			if var_386_1 <= arg_383_1.time_ and arg_383_1.time_ < var_386_1 + var_386_2 then
				local var_386_3 = (arg_383_1.time_ - var_386_1) / var_386_2
				local var_386_4 = Vector3.New(0, 100, 0)

				var_386_0.localPosition = Vector3.Lerp(arg_383_1.var_.moveOldPos1041ui_story, var_386_4, var_386_3)

				local var_386_5 = manager.ui.mainCamera.transform.position - var_386_0.position

				var_386_0.forward = Vector3.New(var_386_5.x, var_386_5.y, var_386_5.z)

				local var_386_6 = var_386_0.localEulerAngles

				var_386_6.z = 0
				var_386_6.x = 0
				var_386_0.localEulerAngles = var_386_6
			end

			if arg_383_1.time_ >= var_386_1 + var_386_2 and arg_383_1.time_ < var_386_1 + var_386_2 + arg_386_0 then
				var_386_0.localPosition = Vector3.New(0, 100, 0)

				local var_386_7 = manager.ui.mainCamera.transform.position - var_386_0.position

				var_386_0.forward = Vector3.New(var_386_7.x, var_386_7.y, var_386_7.z)

				local var_386_8 = var_386_0.localEulerAngles

				var_386_8.z = 0
				var_386_8.x = 0
				var_386_0.localEulerAngles = var_386_8
			end

			local var_386_9 = 0
			local var_386_10 = 0.575

			if var_386_9 < arg_383_1.time_ and arg_383_1.time_ <= var_386_9 + arg_386_0 then
				arg_383_1.talkMaxDuration = 0
				arg_383_1.dialogCg_.alpha = 1

				arg_383_1.dialog_:SetActive(true)
				SetActive(arg_383_1.leftNameGo_, false)

				arg_383_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_383_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_383_1:RecordName(arg_383_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_383_1.iconTrs_.gameObject, false)
				arg_383_1.callingController_:SetSelectedState("normal")

				local var_386_11 = arg_383_1:GetWordFromCfg(113191092)
				local var_386_12 = arg_383_1:FormatText(var_386_11.content)

				arg_383_1.text_.text = var_386_12

				LuaForUtil.ClearLinePrefixSymbol(arg_383_1.text_)

				local var_386_13 = 23
				local var_386_14 = utf8.len(var_386_12)
				local var_386_15 = var_386_13 <= 0 and var_386_10 or var_386_10 * (var_386_14 / var_386_13)

				if var_386_15 > 0 and var_386_10 < var_386_15 then
					arg_383_1.talkMaxDuration = var_386_15

					if var_386_15 + var_386_9 > arg_383_1.duration_ then
						arg_383_1.duration_ = var_386_15 + var_386_9
					end
				end

				arg_383_1.text_.text = var_386_12
				arg_383_1.typewritter.percent = 0

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(false)
				arg_383_1:RecordContent(arg_383_1.text_.text)
			end

			local var_386_16 = math.max(var_386_10, arg_383_1.talkMaxDuration)

			if var_386_9 <= arg_383_1.time_ and arg_383_1.time_ < var_386_9 + var_386_16 then
				arg_383_1.typewritter.percent = (arg_383_1.time_ - var_386_9) / var_386_16

				arg_383_1.typewritter:SetDirty()
			end

			if arg_383_1.time_ >= var_386_9 + var_386_16 and arg_383_1.time_ < var_386_9 + var_386_16 + arg_386_0 then
				arg_383_1.typewritter.percent = 1

				arg_383_1.typewritter:SetDirty()
				arg_383_1:ShowNextGo(true)
			end
		end
	end,
	Play113191093 = function(arg_387_0, arg_387_1)
		arg_387_1.time_ = 0
		arg_387_1.frameCnt_ = 0
		arg_387_1.state_ = "playing"
		arg_387_1.curTalkId_ = 113191093
		arg_387_1.duration_ = 3.1

		local var_387_0 = {
			ja = 3.1,
			ko = 1.999999999999,
			zh = 1.999999999999,
			en = 2.966
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
				arg_387_0:Play113191094(arg_387_1)
			end
		end

		function arg_387_1.onSingleLineUpdate_(arg_390_0)
			local var_390_0 = arg_387_1.actors_["1038ui_story"].transform
			local var_390_1 = 0

			if var_390_1 < arg_387_1.time_ and arg_387_1.time_ <= var_390_1 + arg_390_0 then
				arg_387_1.var_.moveOldPos1038ui_story = var_390_0.localPosition
			end

			local var_390_2 = 0.001

			if var_390_1 <= arg_387_1.time_ and arg_387_1.time_ < var_390_1 + var_390_2 then
				local var_390_3 = (arg_387_1.time_ - var_390_1) / var_390_2
				local var_390_4 = Vector3.New(-0.7, -1.11, -5.9)

				var_390_0.localPosition = Vector3.Lerp(arg_387_1.var_.moveOldPos1038ui_story, var_390_4, var_390_3)

				local var_390_5 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_5.x, var_390_5.y, var_390_5.z)

				local var_390_6 = var_390_0.localEulerAngles

				var_390_6.z = 0
				var_390_6.x = 0
				var_390_0.localEulerAngles = var_390_6
			end

			if arg_387_1.time_ >= var_390_1 + var_390_2 and arg_387_1.time_ < var_390_1 + var_390_2 + arg_390_0 then
				var_390_0.localPosition = Vector3.New(-0.7, -1.11, -5.9)

				local var_390_7 = manager.ui.mainCamera.transform.position - var_390_0.position

				var_390_0.forward = Vector3.New(var_390_7.x, var_390_7.y, var_390_7.z)

				local var_390_8 = var_390_0.localEulerAngles

				var_390_8.z = 0
				var_390_8.x = 0
				var_390_0.localEulerAngles = var_390_8
			end

			local var_390_9 = 0

			if var_390_9 < arg_387_1.time_ and arg_387_1.time_ <= var_390_9 + arg_390_0 then
				arg_387_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038action/1038action5_1")
			end

			local var_390_10 = arg_387_1.actors_["1038ui_story"]
			local var_390_11 = 0

			if var_390_11 < arg_387_1.time_ and arg_387_1.time_ <= var_390_11 + arg_390_0 and arg_387_1.var_.characterEffect1038ui_story == nil then
				arg_387_1.var_.characterEffect1038ui_story = var_390_10:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_390_12 = 0.2

			if var_390_11 <= arg_387_1.time_ and arg_387_1.time_ < var_390_11 + var_390_12 then
				local var_390_13 = (arg_387_1.time_ - var_390_11) / var_390_12

				if arg_387_1.var_.characterEffect1038ui_story then
					arg_387_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_387_1.time_ >= var_390_11 + var_390_12 and arg_387_1.time_ < var_390_11 + var_390_12 + arg_390_0 and arg_387_1.var_.characterEffect1038ui_story then
				arg_387_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_390_14 = 0

			if var_390_14 < arg_387_1.time_ and arg_387_1.time_ <= var_390_14 + arg_390_0 then
				arg_387_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_390_15 = 0
			local var_390_16 = 0.1

			if var_390_15 < arg_387_1.time_ and arg_387_1.time_ <= var_390_15 + arg_390_0 then
				arg_387_1.talkMaxDuration = 0
				arg_387_1.dialogCg_.alpha = 1

				arg_387_1.dialog_:SetActive(true)
				SetActive(arg_387_1.leftNameGo_, true)

				local var_390_17 = arg_387_1:FormatText(StoryNameCfg[94].name)

				arg_387_1.leftNameTxt_.text = var_390_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_387_1.leftNameTxt_.transform)

				arg_387_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_387_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_387_1:RecordName(arg_387_1.leftNameTxt_.text)
				SetActive(arg_387_1.iconTrs_.gameObject, false)
				arg_387_1.callingController_:SetSelectedState("normal")

				local var_390_18 = arg_387_1:GetWordFromCfg(113191093)
				local var_390_19 = arg_387_1:FormatText(var_390_18.content)

				arg_387_1.text_.text = var_390_19

				LuaForUtil.ClearLinePrefixSymbol(arg_387_1.text_)

				local var_390_20 = 4
				local var_390_21 = utf8.len(var_390_19)
				local var_390_22 = var_390_20 <= 0 and var_390_16 or var_390_16 * (var_390_21 / var_390_20)

				if var_390_22 > 0 and var_390_16 < var_390_22 then
					arg_387_1.talkMaxDuration = var_390_22

					if var_390_22 + var_390_15 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_22 + var_390_15
					end
				end

				arg_387_1.text_.text = var_390_19
				arg_387_1.typewritter.percent = 0

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191093", "story_v_out_113191.awb") ~= 0 then
					local var_390_23 = manager.audio:GetVoiceLength("story_v_out_113191", "113191093", "story_v_out_113191.awb") / 1000

					if var_390_23 + var_390_15 > arg_387_1.duration_ then
						arg_387_1.duration_ = var_390_23 + var_390_15
					end

					if var_390_18.prefab_name ~= "" and arg_387_1.actors_[var_390_18.prefab_name] ~= nil then
						local var_390_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_387_1.actors_[var_390_18.prefab_name].transform, "story_v_out_113191", "113191093", "story_v_out_113191.awb")

						arg_387_1:RecordAudio("113191093", var_390_24)
						arg_387_1:RecordAudio("113191093", var_390_24)
					else
						arg_387_1:AudioAction("play", "voice", "story_v_out_113191", "113191093", "story_v_out_113191.awb")
					end

					arg_387_1:RecordHistoryTalkVoice("story_v_out_113191", "113191093", "story_v_out_113191.awb")
				end

				arg_387_1:RecordContent(arg_387_1.text_.text)
			end

			local var_390_25 = math.max(var_390_16, arg_387_1.talkMaxDuration)

			if var_390_15 <= arg_387_1.time_ and arg_387_1.time_ < var_390_15 + var_390_25 then
				arg_387_1.typewritter.percent = (arg_387_1.time_ - var_390_15) / var_390_25

				arg_387_1.typewritter:SetDirty()
			end

			if arg_387_1.time_ >= var_390_15 + var_390_25 and arg_387_1.time_ < var_390_15 + var_390_25 + arg_390_0 then
				arg_387_1.typewritter.percent = 1

				arg_387_1.typewritter:SetDirty()
				arg_387_1:ShowNextGo(true)
			end
		end
	end,
	Play113191094 = function(arg_391_0, arg_391_1)
		arg_391_1.time_ = 0
		arg_391_1.frameCnt_ = 0
		arg_391_1.state_ = "playing"
		arg_391_1.curTalkId_ = 113191094
		arg_391_1.duration_ = 4

		local var_391_0 = {
			ja = 4,
			ko = 3.4,
			zh = 3.666,
			en = 2.833
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
				arg_391_0:Play113191095(arg_391_1)
			end
		end

		function arg_391_1.onSingleLineUpdate_(arg_394_0)
			local var_394_0 = arg_391_1.actors_["1038ui_story"]
			local var_394_1 = 0

			if var_394_1 < arg_391_1.time_ and arg_391_1.time_ <= var_394_1 + arg_394_0 and arg_391_1.var_.characterEffect1038ui_story == nil then
				arg_391_1.var_.characterEffect1038ui_story = var_394_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_2 = 0.2

			if var_394_1 <= arg_391_1.time_ and arg_391_1.time_ < var_394_1 + var_394_2 then
				local var_394_3 = (arg_391_1.time_ - var_394_1) / var_394_2

				if arg_391_1.var_.characterEffect1038ui_story then
					local var_394_4 = Mathf.Lerp(0, 0.5, var_394_3)

					arg_391_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_391_1.var_.characterEffect1038ui_story.fillRatio = var_394_4
				end
			end

			if arg_391_1.time_ >= var_394_1 + var_394_2 and arg_391_1.time_ < var_394_1 + var_394_2 + arg_394_0 and arg_391_1.var_.characterEffect1038ui_story then
				local var_394_5 = 0.5

				arg_391_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_391_1.var_.characterEffect1038ui_story.fillRatio = var_394_5
			end

			local var_394_6 = arg_391_1.actors_["1041ui_story"].transform
			local var_394_7 = 0

			if var_394_7 < arg_391_1.time_ and arg_391_1.time_ <= var_394_7 + arg_394_0 then
				arg_391_1.var_.moveOldPos1041ui_story = var_394_6.localPosition
			end

			local var_394_8 = 0.001

			if var_394_7 <= arg_391_1.time_ and arg_391_1.time_ < var_394_7 + var_394_8 then
				local var_394_9 = (arg_391_1.time_ - var_394_7) / var_394_8
				local var_394_10 = Vector3.New(0.7, -1.11, -5.9)

				var_394_6.localPosition = Vector3.Lerp(arg_391_1.var_.moveOldPos1041ui_story, var_394_10, var_394_9)

				local var_394_11 = manager.ui.mainCamera.transform.position - var_394_6.position

				var_394_6.forward = Vector3.New(var_394_11.x, var_394_11.y, var_394_11.z)

				local var_394_12 = var_394_6.localEulerAngles

				var_394_12.z = 0
				var_394_12.x = 0
				var_394_6.localEulerAngles = var_394_12
			end

			if arg_391_1.time_ >= var_394_7 + var_394_8 and arg_391_1.time_ < var_394_7 + var_394_8 + arg_394_0 then
				var_394_6.localPosition = Vector3.New(0.7, -1.11, -5.9)

				local var_394_13 = manager.ui.mainCamera.transform.position - var_394_6.position

				var_394_6.forward = Vector3.New(var_394_13.x, var_394_13.y, var_394_13.z)

				local var_394_14 = var_394_6.localEulerAngles

				var_394_14.z = 0
				var_394_14.x = 0
				var_394_6.localEulerAngles = var_394_14
			end

			local var_394_15 = 0

			if var_394_15 < arg_391_1.time_ and arg_391_1.time_ <= var_394_15 + arg_394_0 then
				arg_391_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/1041/1041action/1041action1_1")
			end

			local var_394_16 = 0

			if var_394_16 < arg_391_1.time_ and arg_391_1.time_ <= var_394_16 + arg_394_0 then
				arg_391_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_394_17 = arg_391_1.actors_["1041ui_story"]
			local var_394_18 = 0

			if var_394_18 < arg_391_1.time_ and arg_391_1.time_ <= var_394_18 + arg_394_0 and arg_391_1.var_.characterEffect1041ui_story == nil then
				arg_391_1.var_.characterEffect1041ui_story = var_394_17:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_394_19 = 0.2

			if var_394_18 <= arg_391_1.time_ and arg_391_1.time_ < var_394_18 + var_394_19 then
				local var_394_20 = (arg_391_1.time_ - var_394_18) / var_394_19

				if arg_391_1.var_.characterEffect1041ui_story then
					arg_391_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_391_1.time_ >= var_394_18 + var_394_19 and arg_391_1.time_ < var_394_18 + var_394_19 + arg_394_0 and arg_391_1.var_.characterEffect1041ui_story then
				arg_391_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_394_21 = 0
			local var_394_22 = 0.25

			if var_394_21 < arg_391_1.time_ and arg_391_1.time_ <= var_394_21 + arg_394_0 then
				arg_391_1.talkMaxDuration = 0
				arg_391_1.dialogCg_.alpha = 1

				arg_391_1.dialog_:SetActive(true)
				SetActive(arg_391_1.leftNameGo_, true)

				local var_394_23 = arg_391_1:FormatText(StoryNameCfg[208].name)

				arg_391_1.leftNameTxt_.text = var_394_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_391_1.leftNameTxt_.transform)

				arg_391_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_391_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_391_1:RecordName(arg_391_1.leftNameTxt_.text)
				SetActive(arg_391_1.iconTrs_.gameObject, false)
				arg_391_1.callingController_:SetSelectedState("normal")

				local var_394_24 = arg_391_1:GetWordFromCfg(113191094)
				local var_394_25 = arg_391_1:FormatText(var_394_24.content)

				arg_391_1.text_.text = var_394_25

				LuaForUtil.ClearLinePrefixSymbol(arg_391_1.text_)

				local var_394_26 = 10
				local var_394_27 = utf8.len(var_394_25)
				local var_394_28 = var_394_26 <= 0 and var_394_22 or var_394_22 * (var_394_27 / var_394_26)

				if var_394_28 > 0 and var_394_22 < var_394_28 then
					arg_391_1.talkMaxDuration = var_394_28

					if var_394_28 + var_394_21 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_28 + var_394_21
					end
				end

				arg_391_1.text_.text = var_394_25
				arg_391_1.typewritter.percent = 0

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191094", "story_v_out_113191.awb") ~= 0 then
					local var_394_29 = manager.audio:GetVoiceLength("story_v_out_113191", "113191094", "story_v_out_113191.awb") / 1000

					if var_394_29 + var_394_21 > arg_391_1.duration_ then
						arg_391_1.duration_ = var_394_29 + var_394_21
					end

					if var_394_24.prefab_name ~= "" and arg_391_1.actors_[var_394_24.prefab_name] ~= nil then
						local var_394_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_391_1.actors_[var_394_24.prefab_name].transform, "story_v_out_113191", "113191094", "story_v_out_113191.awb")

						arg_391_1:RecordAudio("113191094", var_394_30)
						arg_391_1:RecordAudio("113191094", var_394_30)
					else
						arg_391_1:AudioAction("play", "voice", "story_v_out_113191", "113191094", "story_v_out_113191.awb")
					end

					arg_391_1:RecordHistoryTalkVoice("story_v_out_113191", "113191094", "story_v_out_113191.awb")
				end

				arg_391_1:RecordContent(arg_391_1.text_.text)
			end

			local var_394_31 = math.max(var_394_22, arg_391_1.talkMaxDuration)

			if var_394_21 <= arg_391_1.time_ and arg_391_1.time_ < var_394_21 + var_394_31 then
				arg_391_1.typewritter.percent = (arg_391_1.time_ - var_394_21) / var_394_31

				arg_391_1.typewritter:SetDirty()
			end

			if arg_391_1.time_ >= var_394_21 + var_394_31 and arg_391_1.time_ < var_394_21 + var_394_31 + arg_394_0 then
				arg_391_1.typewritter.percent = 1

				arg_391_1.typewritter:SetDirty()
				arg_391_1:ShowNextGo(true)
			end
		end
	end,
	Play113191095 = function(arg_395_0, arg_395_1)
		arg_395_1.time_ = 0
		arg_395_1.frameCnt_ = 0
		arg_395_1.state_ = "playing"
		arg_395_1.curTalkId_ = 113191095
		arg_395_1.duration_ = 6.366

		local var_395_0 = {
			ja = 5.2,
			ko = 5.6,
			zh = 4.6,
			en = 6.366
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
				arg_395_0:Play113191096(arg_395_1)
			end
		end

		function arg_395_1.onSingleLineUpdate_(arg_398_0)
			local var_398_0 = arg_395_1.actors_["1038ui_story"]
			local var_398_1 = 0

			if var_398_1 < arg_395_1.time_ and arg_395_1.time_ <= var_398_1 + arg_398_0 and arg_395_1.var_.characterEffect1038ui_story == nil then
				arg_395_1.var_.characterEffect1038ui_story = var_398_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_2 = 0.2

			if var_398_1 <= arg_395_1.time_ and arg_395_1.time_ < var_398_1 + var_398_2 then
				local var_398_3 = (arg_395_1.time_ - var_398_1) / var_398_2

				if arg_395_1.var_.characterEffect1038ui_story then
					arg_395_1.var_.characterEffect1038ui_story.fillFlat = false
				end
			end

			if arg_395_1.time_ >= var_398_1 + var_398_2 and arg_395_1.time_ < var_398_1 + var_398_2 + arg_398_0 and arg_395_1.var_.characterEffect1038ui_story then
				arg_395_1.var_.characterEffect1038ui_story.fillFlat = false
			end

			local var_398_4 = arg_395_1.actors_["1041ui_story"]
			local var_398_5 = 0

			if var_398_5 < arg_395_1.time_ and arg_395_1.time_ <= var_398_5 + arg_398_0 and arg_395_1.var_.characterEffect1041ui_story == nil then
				arg_395_1.var_.characterEffect1041ui_story = var_398_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_398_6 = 0.2

			if var_398_5 <= arg_395_1.time_ and arg_395_1.time_ < var_398_5 + var_398_6 then
				local var_398_7 = (arg_395_1.time_ - var_398_5) / var_398_6

				if arg_395_1.var_.characterEffect1041ui_story then
					local var_398_8 = Mathf.Lerp(0, 0.5, var_398_7)

					arg_395_1.var_.characterEffect1041ui_story.fillFlat = true
					arg_395_1.var_.characterEffect1041ui_story.fillRatio = var_398_8
				end
			end

			if arg_395_1.time_ >= var_398_5 + var_398_6 and arg_395_1.time_ < var_398_5 + var_398_6 + arg_398_0 and arg_395_1.var_.characterEffect1041ui_story then
				local var_398_9 = 0.5

				arg_395_1.var_.characterEffect1041ui_story.fillFlat = true
				arg_395_1.var_.characterEffect1041ui_story.fillRatio = var_398_9
			end

			local var_398_10 = 0

			if var_398_10 < arg_395_1.time_ and arg_395_1.time_ <= var_398_10 + arg_398_0 then
				arg_395_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0104cva")
			end

			local var_398_11 = 0

			if var_398_11 < arg_395_1.time_ and arg_395_1.time_ <= var_398_11 + arg_398_0 then
				arg_395_1:PlayTimeline("1038ui_story", "StoryTimeline/CharAction/1038/1038actionlink/1038action456")
			end

			local var_398_12 = 0
			local var_398_13 = 0.525

			if var_398_12 < arg_395_1.time_ and arg_395_1.time_ <= var_398_12 + arg_398_0 then
				arg_395_1.talkMaxDuration = 0
				arg_395_1.dialogCg_.alpha = 1

				arg_395_1.dialog_:SetActive(true)
				SetActive(arg_395_1.leftNameGo_, true)

				local var_398_14 = arg_395_1:FormatText(StoryNameCfg[94].name)

				arg_395_1.leftNameTxt_.text = var_398_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_395_1.leftNameTxt_.transform)

				arg_395_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_395_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_395_1:RecordName(arg_395_1.leftNameTxt_.text)
				SetActive(arg_395_1.iconTrs_.gameObject, false)
				arg_395_1.callingController_:SetSelectedState("normal")

				local var_398_15 = arg_395_1:GetWordFromCfg(113191095)
				local var_398_16 = arg_395_1:FormatText(var_398_15.content)

				arg_395_1.text_.text = var_398_16

				LuaForUtil.ClearLinePrefixSymbol(arg_395_1.text_)

				local var_398_17 = 21
				local var_398_18 = utf8.len(var_398_16)
				local var_398_19 = var_398_17 <= 0 and var_398_13 or var_398_13 * (var_398_18 / var_398_17)

				if var_398_19 > 0 and var_398_13 < var_398_19 then
					arg_395_1.talkMaxDuration = var_398_19

					if var_398_19 + var_398_12 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_19 + var_398_12
					end
				end

				arg_395_1.text_.text = var_398_16
				arg_395_1.typewritter.percent = 0

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191095", "story_v_out_113191.awb") ~= 0 then
					local var_398_20 = manager.audio:GetVoiceLength("story_v_out_113191", "113191095", "story_v_out_113191.awb") / 1000

					if var_398_20 + var_398_12 > arg_395_1.duration_ then
						arg_395_1.duration_ = var_398_20 + var_398_12
					end

					if var_398_15.prefab_name ~= "" and arg_395_1.actors_[var_398_15.prefab_name] ~= nil then
						local var_398_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_395_1.actors_[var_398_15.prefab_name].transform, "story_v_out_113191", "113191095", "story_v_out_113191.awb")

						arg_395_1:RecordAudio("113191095", var_398_21)
						arg_395_1:RecordAudio("113191095", var_398_21)
					else
						arg_395_1:AudioAction("play", "voice", "story_v_out_113191", "113191095", "story_v_out_113191.awb")
					end

					arg_395_1:RecordHistoryTalkVoice("story_v_out_113191", "113191095", "story_v_out_113191.awb")
				end

				arg_395_1:RecordContent(arg_395_1.text_.text)
			end

			local var_398_22 = math.max(var_398_13, arg_395_1.talkMaxDuration)

			if var_398_12 <= arg_395_1.time_ and arg_395_1.time_ < var_398_12 + var_398_22 then
				arg_395_1.typewritter.percent = (arg_395_1.time_ - var_398_12) / var_398_22

				arg_395_1.typewritter:SetDirty()
			end

			if arg_395_1.time_ >= var_398_12 + var_398_22 and arg_395_1.time_ < var_398_12 + var_398_22 + arg_398_0 then
				arg_395_1.typewritter.percent = 1

				arg_395_1.typewritter:SetDirty()
				arg_395_1:ShowNextGo(true)
			end
		end
	end,
	Play113191096 = function(arg_399_0, arg_399_1)
		arg_399_1.time_ = 0
		arg_399_1.frameCnt_ = 0
		arg_399_1.state_ = "playing"
		arg_399_1.curTalkId_ = 113191096
		arg_399_1.duration_ = 6

		local var_399_0 = {
			ja = 3.9,
			ko = 4,
			zh = 6,
			en = 2.833
		}
		local var_399_1 = manager.audio:GetLocalizationFlag()

		if var_399_0[var_399_1] ~= nil then
			arg_399_1.duration_ = var_399_0[var_399_1]
		end

		SetActive(arg_399_1.tipsGo_, false)

		function arg_399_1.onSingleLineFinish_()
			arg_399_1.onSingleLineUpdate_ = nil
			arg_399_1.onSingleLineFinish_ = nil
			arg_399_1.state_ = "waiting"
		end

		function arg_399_1.playNext_(arg_401_0)
			if arg_401_0 == 1 then
				arg_399_0:Play113191097(arg_399_1)
			end
		end

		function arg_399_1.onSingleLineUpdate_(arg_402_0)
			local var_402_0 = 0

			if var_402_0 < arg_399_1.time_ and arg_399_1.time_ <= var_402_0 + arg_402_0 then
				arg_399_1:PlayTimeline("1041ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_402_1 = arg_399_1.actors_["1041ui_story"]
			local var_402_2 = 0

			if var_402_2 < arg_399_1.time_ and arg_399_1.time_ <= var_402_2 + arg_402_0 and arg_399_1.var_.characterEffect1041ui_story == nil then
				arg_399_1.var_.characterEffect1041ui_story = var_402_1:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_3 = 0.2

			if var_402_2 <= arg_399_1.time_ and arg_399_1.time_ < var_402_2 + var_402_3 then
				local var_402_4 = (arg_399_1.time_ - var_402_2) / var_402_3

				if arg_399_1.var_.characterEffect1041ui_story then
					arg_399_1.var_.characterEffect1041ui_story.fillFlat = false
				end
			end

			if arg_399_1.time_ >= var_402_2 + var_402_3 and arg_399_1.time_ < var_402_2 + var_402_3 + arg_402_0 and arg_399_1.var_.characterEffect1041ui_story then
				arg_399_1.var_.characterEffect1041ui_story.fillFlat = false
			end

			local var_402_5 = arg_399_1.actors_["1038ui_story"]
			local var_402_6 = 0

			if var_402_6 < arg_399_1.time_ and arg_399_1.time_ <= var_402_6 + arg_402_0 and arg_399_1.var_.characterEffect1038ui_story == nil then
				arg_399_1.var_.characterEffect1038ui_story = var_402_5:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_402_7 = 0.2

			if var_402_6 <= arg_399_1.time_ and arg_399_1.time_ < var_402_6 + var_402_7 then
				local var_402_8 = (arg_399_1.time_ - var_402_6) / var_402_7

				if arg_399_1.var_.characterEffect1038ui_story then
					local var_402_9 = Mathf.Lerp(0, 0.5, var_402_8)

					arg_399_1.var_.characterEffect1038ui_story.fillFlat = true
					arg_399_1.var_.characterEffect1038ui_story.fillRatio = var_402_9
				end
			end

			if arg_399_1.time_ >= var_402_6 + var_402_7 and arg_399_1.time_ < var_402_6 + var_402_7 + arg_402_0 and arg_399_1.var_.characterEffect1038ui_story then
				local var_402_10 = 0.5

				arg_399_1.var_.characterEffect1038ui_story.fillFlat = true
				arg_399_1.var_.characterEffect1038ui_story.fillRatio = var_402_10
			end

			local var_402_11 = 0
			local var_402_12 = 0.25

			if var_402_11 < arg_399_1.time_ and arg_399_1.time_ <= var_402_11 + arg_402_0 then
				arg_399_1.talkMaxDuration = 0
				arg_399_1.dialogCg_.alpha = 1

				arg_399_1.dialog_:SetActive(true)
				SetActive(arg_399_1.leftNameGo_, true)

				local var_402_13 = arg_399_1:FormatText(StoryNameCfg[208].name)

				arg_399_1.leftNameTxt_.text = var_402_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_399_1.leftNameTxt_.transform)

				arg_399_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_399_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_399_1:RecordName(arg_399_1.leftNameTxt_.text)
				SetActive(arg_399_1.iconTrs_.gameObject, false)
				arg_399_1.callingController_:SetSelectedState("normal")

				local var_402_14 = arg_399_1:GetWordFromCfg(113191096)
				local var_402_15 = arg_399_1:FormatText(var_402_14.content)

				arg_399_1.text_.text = var_402_15

				LuaForUtil.ClearLinePrefixSymbol(arg_399_1.text_)

				local var_402_16 = 10
				local var_402_17 = utf8.len(var_402_15)
				local var_402_18 = var_402_16 <= 0 and var_402_12 or var_402_12 * (var_402_17 / var_402_16)

				if var_402_18 > 0 and var_402_12 < var_402_18 then
					arg_399_1.talkMaxDuration = var_402_18

					if var_402_18 + var_402_11 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_18 + var_402_11
					end
				end

				arg_399_1.text_.text = var_402_15
				arg_399_1.typewritter.percent = 0

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191096", "story_v_out_113191.awb") ~= 0 then
					local var_402_19 = manager.audio:GetVoiceLength("story_v_out_113191", "113191096", "story_v_out_113191.awb") / 1000

					if var_402_19 + var_402_11 > arg_399_1.duration_ then
						arg_399_1.duration_ = var_402_19 + var_402_11
					end

					if var_402_14.prefab_name ~= "" and arg_399_1.actors_[var_402_14.prefab_name] ~= nil then
						local var_402_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_399_1.actors_[var_402_14.prefab_name].transform, "story_v_out_113191", "113191096", "story_v_out_113191.awb")

						arg_399_1:RecordAudio("113191096", var_402_20)
						arg_399_1:RecordAudio("113191096", var_402_20)
					else
						arg_399_1:AudioAction("play", "voice", "story_v_out_113191", "113191096", "story_v_out_113191.awb")
					end

					arg_399_1:RecordHistoryTalkVoice("story_v_out_113191", "113191096", "story_v_out_113191.awb")
				end

				arg_399_1:RecordContent(arg_399_1.text_.text)
			end

			local var_402_21 = math.max(var_402_12, arg_399_1.talkMaxDuration)

			if var_402_11 <= arg_399_1.time_ and arg_399_1.time_ < var_402_11 + var_402_21 then
				arg_399_1.typewritter.percent = (arg_399_1.time_ - var_402_11) / var_402_21

				arg_399_1.typewritter:SetDirty()
			end

			if arg_399_1.time_ >= var_402_11 + var_402_21 and arg_399_1.time_ < var_402_11 + var_402_21 + arg_402_0 then
				arg_399_1.typewritter.percent = 1

				arg_399_1.typewritter:SetDirty()
				arg_399_1:ShowNextGo(true)
			end
		end
	end,
	Play113191097 = function(arg_403_0, arg_403_1)
		arg_403_1.time_ = 0
		arg_403_1.frameCnt_ = 0
		arg_403_1.state_ = "playing"
		arg_403_1.curTalkId_ = 113191097
		arg_403_1.duration_ = 8.433

		local var_403_0 = {
			ja = 5.3,
			ko = 8.433,
			zh = 5.933,
			en = 6.233
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
				arg_403_0:Play113191098(arg_403_1)
			end
		end

		function arg_403_1.onSingleLineUpdate_(arg_406_0)
			local var_406_0 = arg_403_1.actors_["1041ui_story"].transform
			local var_406_1 = 0

			if var_406_1 < arg_403_1.time_ and arg_403_1.time_ <= var_406_1 + arg_406_0 then
				arg_403_1.var_.moveOldPos1041ui_story = var_406_0.localPosition
			end

			local var_406_2 = 0.001

			if var_406_1 <= arg_403_1.time_ and arg_403_1.time_ < var_406_1 + var_406_2 then
				local var_406_3 = (arg_403_1.time_ - var_406_1) / var_406_2
				local var_406_4 = Vector3.New(0, 100, 0)

				var_406_0.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1041ui_story, var_406_4, var_406_3)

				local var_406_5 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_5.x, var_406_5.y, var_406_5.z)

				local var_406_6 = var_406_0.localEulerAngles

				var_406_6.z = 0
				var_406_6.x = 0
				var_406_0.localEulerAngles = var_406_6
			end

			if arg_403_1.time_ >= var_406_1 + var_406_2 and arg_403_1.time_ < var_406_1 + var_406_2 + arg_406_0 then
				var_406_0.localPosition = Vector3.New(0, 100, 0)

				local var_406_7 = manager.ui.mainCamera.transform.position - var_406_0.position

				var_406_0.forward = Vector3.New(var_406_7.x, var_406_7.y, var_406_7.z)

				local var_406_8 = var_406_0.localEulerAngles

				var_406_8.z = 0
				var_406_8.x = 0
				var_406_0.localEulerAngles = var_406_8
			end

			local var_406_9 = arg_403_1.actors_["1038ui_story"].transform
			local var_406_10 = 0

			if var_406_10 < arg_403_1.time_ and arg_403_1.time_ <= var_406_10 + arg_406_0 then
				arg_403_1.var_.moveOldPos1038ui_story = var_406_9.localPosition
			end

			local var_406_11 = 0.001

			if var_406_10 <= arg_403_1.time_ and arg_403_1.time_ < var_406_10 + var_406_11 then
				local var_406_12 = (arg_403_1.time_ - var_406_10) / var_406_11
				local var_406_13 = Vector3.New(0, 100, 0)

				var_406_9.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1038ui_story, var_406_13, var_406_12)

				local var_406_14 = manager.ui.mainCamera.transform.position - var_406_9.position

				var_406_9.forward = Vector3.New(var_406_14.x, var_406_14.y, var_406_14.z)

				local var_406_15 = var_406_9.localEulerAngles

				var_406_15.z = 0
				var_406_15.x = 0
				var_406_9.localEulerAngles = var_406_15
			end

			if arg_403_1.time_ >= var_406_10 + var_406_11 and arg_403_1.time_ < var_406_10 + var_406_11 + arg_406_0 then
				var_406_9.localPosition = Vector3.New(0, 100, 0)

				local var_406_16 = manager.ui.mainCamera.transform.position - var_406_9.position

				var_406_9.forward = Vector3.New(var_406_16.x, var_406_16.y, var_406_16.z)

				local var_406_17 = var_406_9.localEulerAngles

				var_406_17.z = 0
				var_406_17.x = 0
				var_406_9.localEulerAngles = var_406_17
			end

			local var_406_18 = arg_403_1.actors_["1084ui_story"].transform
			local var_406_19 = 0

			if var_406_19 < arg_403_1.time_ and arg_403_1.time_ <= var_406_19 + arg_406_0 then
				arg_403_1.var_.moveOldPos1084ui_story = var_406_18.localPosition
			end

			local var_406_20 = 0.001

			if var_406_19 <= arg_403_1.time_ and arg_403_1.time_ < var_406_19 + var_406_20 then
				local var_406_21 = (arg_403_1.time_ - var_406_19) / var_406_20
				local var_406_22 = Vector3.New(-0.7, -0.97, -6)

				var_406_18.localPosition = Vector3.Lerp(arg_403_1.var_.moveOldPos1084ui_story, var_406_22, var_406_21)

				local var_406_23 = manager.ui.mainCamera.transform.position - var_406_18.position

				var_406_18.forward = Vector3.New(var_406_23.x, var_406_23.y, var_406_23.z)

				local var_406_24 = var_406_18.localEulerAngles

				var_406_24.z = 0
				var_406_24.x = 0
				var_406_18.localEulerAngles = var_406_24
			end

			if arg_403_1.time_ >= var_406_19 + var_406_20 and arg_403_1.time_ < var_406_19 + var_406_20 + arg_406_0 then
				var_406_18.localPosition = Vector3.New(-0.7, -0.97, -6)

				local var_406_25 = manager.ui.mainCamera.transform.position - var_406_18.position

				var_406_18.forward = Vector3.New(var_406_25.x, var_406_25.y, var_406_25.z)

				local var_406_26 = var_406_18.localEulerAngles

				var_406_26.z = 0
				var_406_26.x = 0
				var_406_18.localEulerAngles = var_406_26
			end

			local var_406_27 = 0

			if var_406_27 < arg_403_1.time_ and arg_403_1.time_ <= var_406_27 + arg_406_0 then
				arg_403_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/1084/1084action/1084action12_1")
			end

			local var_406_28 = 0

			if var_406_28 < arg_403_1.time_ and arg_403_1.time_ <= var_406_28 + arg_406_0 then
				arg_403_1:PlayTimeline("1084ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1204cva")
			end

			local var_406_29 = arg_403_1.actors_["1084ui_story"]
			local var_406_30 = 0

			if var_406_30 < arg_403_1.time_ and arg_403_1.time_ <= var_406_30 + arg_406_0 and arg_403_1.var_.characterEffect1084ui_story == nil then
				arg_403_1.var_.characterEffect1084ui_story = var_406_29:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_406_31 = 0.2

			if var_406_30 <= arg_403_1.time_ and arg_403_1.time_ < var_406_30 + var_406_31 then
				local var_406_32 = (arg_403_1.time_ - var_406_30) / var_406_31

				if arg_403_1.var_.characterEffect1084ui_story then
					arg_403_1.var_.characterEffect1084ui_story.fillFlat = false
				end
			end

			if arg_403_1.time_ >= var_406_30 + var_406_31 and arg_403_1.time_ < var_406_30 + var_406_31 + arg_406_0 and arg_403_1.var_.characterEffect1084ui_story then
				arg_403_1.var_.characterEffect1084ui_story.fillFlat = false
			end

			local var_406_33 = 0
			local var_406_34 = 0.825

			if var_406_33 < arg_403_1.time_ and arg_403_1.time_ <= var_406_33 + arg_406_0 then
				arg_403_1.talkMaxDuration = 0
				arg_403_1.dialogCg_.alpha = 1

				arg_403_1.dialog_:SetActive(true)
				SetActive(arg_403_1.leftNameGo_, true)

				local var_406_35 = arg_403_1:FormatText(StoryNameCfg[6].name)

				arg_403_1.leftNameTxt_.text = var_406_35

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_403_1.leftNameTxt_.transform)

				arg_403_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_403_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_403_1:RecordName(arg_403_1.leftNameTxt_.text)
				SetActive(arg_403_1.iconTrs_.gameObject, false)
				arg_403_1.callingController_:SetSelectedState("normal")

				local var_406_36 = arg_403_1:GetWordFromCfg(113191097)
				local var_406_37 = arg_403_1:FormatText(var_406_36.content)

				arg_403_1.text_.text = var_406_37

				LuaForUtil.ClearLinePrefixSymbol(arg_403_1.text_)

				local var_406_38 = 33
				local var_406_39 = utf8.len(var_406_37)
				local var_406_40 = var_406_38 <= 0 and var_406_34 or var_406_34 * (var_406_39 / var_406_38)

				if var_406_40 > 0 and var_406_34 < var_406_40 then
					arg_403_1.talkMaxDuration = var_406_40

					if var_406_40 + var_406_33 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_40 + var_406_33
					end
				end

				arg_403_1.text_.text = var_406_37
				arg_403_1.typewritter.percent = 0

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191097", "story_v_out_113191.awb") ~= 0 then
					local var_406_41 = manager.audio:GetVoiceLength("story_v_out_113191", "113191097", "story_v_out_113191.awb") / 1000

					if var_406_41 + var_406_33 > arg_403_1.duration_ then
						arg_403_1.duration_ = var_406_41 + var_406_33
					end

					if var_406_36.prefab_name ~= "" and arg_403_1.actors_[var_406_36.prefab_name] ~= nil then
						local var_406_42 = LuaForUtil.PlayVoiceWithCriLipsync(arg_403_1.actors_[var_406_36.prefab_name].transform, "story_v_out_113191", "113191097", "story_v_out_113191.awb")

						arg_403_1:RecordAudio("113191097", var_406_42)
						arg_403_1:RecordAudio("113191097", var_406_42)
					else
						arg_403_1:AudioAction("play", "voice", "story_v_out_113191", "113191097", "story_v_out_113191.awb")
					end

					arg_403_1:RecordHistoryTalkVoice("story_v_out_113191", "113191097", "story_v_out_113191.awb")
				end

				arg_403_1:RecordContent(arg_403_1.text_.text)
			end

			local var_406_43 = math.max(var_406_34, arg_403_1.talkMaxDuration)

			if var_406_33 <= arg_403_1.time_ and arg_403_1.time_ < var_406_33 + var_406_43 then
				arg_403_1.typewritter.percent = (arg_403_1.time_ - var_406_33) / var_406_43

				arg_403_1.typewritter:SetDirty()
			end

			if arg_403_1.time_ >= var_406_33 + var_406_43 and arg_403_1.time_ < var_406_33 + var_406_43 + arg_406_0 then
				arg_403_1.typewritter.percent = 1

				arg_403_1.typewritter:SetDirty()
				arg_403_1:ShowNextGo(true)
			end
		end
	end,
	Play113191098 = function(arg_407_0, arg_407_1)
		arg_407_1.time_ = 0
		arg_407_1.frameCnt_ = 0
		arg_407_1.state_ = "playing"
		arg_407_1.curTalkId_ = 113191098
		arg_407_1.duration_ = 0.199999999999

		SetActive(arg_407_1.tipsGo_, false)

		function arg_407_1.onSingleLineFinish_()
			arg_407_1.onSingleLineUpdate_ = nil
			arg_407_1.onSingleLineFinish_ = nil
			arg_407_1.state_ = "waiting"

			SetActive(arg_407_1.choicesGo_, true)

			for iter_408_0, iter_408_1 in ipairs(arg_407_1.choices_) do
				local var_408_0 = iter_408_0 <= 1

				SetActive(iter_408_1.go, var_408_0)
			end

			arg_407_1.choices_[1].txt.text = arg_407_1:FormatText(StoryChoiceCfg[202].name)
		end

		function arg_407_1.playNext_(arg_409_0)
			if arg_409_0 == 1 then
				arg_407_0:Play113191099(arg_407_1)
			end
		end

		function arg_407_1.onSingleLineUpdate_(arg_410_0)
			local var_410_0 = arg_407_1.actors_["1084ui_story"]
			local var_410_1 = 0

			if var_410_1 < arg_407_1.time_ and arg_407_1.time_ <= var_410_1 + arg_410_0 and arg_407_1.var_.characterEffect1084ui_story == nil then
				arg_407_1.var_.characterEffect1084ui_story = var_410_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_410_2 = 0.2

			if var_410_1 <= arg_407_1.time_ and arg_407_1.time_ < var_410_1 + var_410_2 then
				local var_410_3 = (arg_407_1.time_ - var_410_1) / var_410_2

				if arg_407_1.var_.characterEffect1084ui_story then
					local var_410_4 = Mathf.Lerp(0, 0.5, var_410_3)

					arg_407_1.var_.characterEffect1084ui_story.fillFlat = true
					arg_407_1.var_.characterEffect1084ui_story.fillRatio = var_410_4
				end
			end

			if arg_407_1.time_ >= var_410_1 + var_410_2 and arg_407_1.time_ < var_410_1 + var_410_2 + arg_410_0 and arg_407_1.var_.characterEffect1084ui_story then
				local var_410_5 = 0.5

				arg_407_1.var_.characterEffect1084ui_story.fillFlat = true
				arg_407_1.var_.characterEffect1084ui_story.fillRatio = var_410_5
			end
		end
	end,
	Play113191099 = function(arg_411_0, arg_411_1)
		arg_411_1.time_ = 0
		arg_411_1.frameCnt_ = 0
		arg_411_1.state_ = "playing"
		arg_411_1.curTalkId_ = 113191099
		arg_411_1.duration_ = 9.366

		local var_411_0 = {
			ja = 7.766,
			ko = 9.366,
			zh = 5.533,
			en = 8.266
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
			arg_411_1.auto_ = false
		end

		function arg_411_1.playNext_(arg_413_0)
			arg_411_1.onStoryFinished_()
		end

		function arg_411_1.onSingleLineUpdate_(arg_414_0)
			local var_414_0 = arg_411_1.actors_["1097ui_story"].transform
			local var_414_1 = 0

			if var_414_1 < arg_411_1.time_ and arg_411_1.time_ <= var_414_1 + arg_414_0 then
				arg_411_1.var_.moveOldPos1097ui_story = var_414_0.localPosition
			end

			local var_414_2 = 0.001

			if var_414_1 <= arg_411_1.time_ and arg_411_1.time_ < var_414_1 + var_414_2 then
				local var_414_3 = (arg_411_1.time_ - var_414_1) / var_414_2
				local var_414_4 = Vector3.New(0.7, -0.54, -6.3)

				var_414_0.localPosition = Vector3.Lerp(arg_411_1.var_.moveOldPos1097ui_story, var_414_4, var_414_3)

				local var_414_5 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_5.x, var_414_5.y, var_414_5.z)

				local var_414_6 = var_414_0.localEulerAngles

				var_414_6.z = 0
				var_414_6.x = 0
				var_414_0.localEulerAngles = var_414_6
			end

			if arg_411_1.time_ >= var_414_1 + var_414_2 and arg_411_1.time_ < var_414_1 + var_414_2 + arg_414_0 then
				var_414_0.localPosition = Vector3.New(0.7, -0.54, -6.3)

				local var_414_7 = manager.ui.mainCamera.transform.position - var_414_0.position

				var_414_0.forward = Vector3.New(var_414_7.x, var_414_7.y, var_414_7.z)

				local var_414_8 = var_414_0.localEulerAngles

				var_414_8.z = 0
				var_414_8.x = 0
				var_414_0.localEulerAngles = var_414_8
			end

			local var_414_9 = 0

			if var_414_9 < arg_411_1.time_ and arg_411_1.time_ <= var_414_9 + arg_414_0 then
				arg_411_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/1097/1097action/1097action6_1")
			end

			local var_414_10 = 0

			if var_414_10 < arg_411_1.time_ and arg_411_1.time_ <= var_414_10 + arg_414_0 then
				arg_411_1:PlayTimeline("1097ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface1104cva")
			end

			local var_414_11 = arg_411_1.actors_["1097ui_story"]
			local var_414_12 = 0

			if var_414_12 < arg_411_1.time_ and arg_411_1.time_ <= var_414_12 + arg_414_0 and arg_411_1.var_.characterEffect1097ui_story == nil then
				arg_411_1.var_.characterEffect1097ui_story = var_414_11:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_414_13 = 0.2

			if var_414_12 <= arg_411_1.time_ and arg_411_1.time_ < var_414_12 + var_414_13 then
				local var_414_14 = (arg_411_1.time_ - var_414_12) / var_414_13

				if arg_411_1.var_.characterEffect1097ui_story then
					arg_411_1.var_.characterEffect1097ui_story.fillFlat = false
				end
			end

			if arg_411_1.time_ >= var_414_12 + var_414_13 and arg_411_1.time_ < var_414_12 + var_414_13 + arg_414_0 and arg_411_1.var_.characterEffect1097ui_story then
				arg_411_1.var_.characterEffect1097ui_story.fillFlat = false
			end

			local var_414_15 = 0
			local var_414_16 = 0.55

			if var_414_15 < arg_411_1.time_ and arg_411_1.time_ <= var_414_15 + arg_414_0 then
				arg_411_1.talkMaxDuration = 0
				arg_411_1.dialogCg_.alpha = 1

				arg_411_1.dialog_:SetActive(true)
				SetActive(arg_411_1.leftNameGo_, true)

				local var_414_17 = arg_411_1:FormatText(StoryNameCfg[216].name)

				arg_411_1.leftNameTxt_.text = var_414_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_411_1.leftNameTxt_.transform)

				arg_411_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_411_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_411_1:RecordName(arg_411_1.leftNameTxt_.text)
				SetActive(arg_411_1.iconTrs_.gameObject, false)
				arg_411_1.callingController_:SetSelectedState("normal")

				local var_414_18 = arg_411_1:GetWordFromCfg(113191099)
				local var_414_19 = arg_411_1:FormatText(var_414_18.content)

				arg_411_1.text_.text = var_414_19

				LuaForUtil.ClearLinePrefixSymbol(arg_411_1.text_)

				local var_414_20 = 22
				local var_414_21 = utf8.len(var_414_19)
				local var_414_22 = var_414_20 <= 0 and var_414_16 or var_414_16 * (var_414_21 / var_414_20)

				if var_414_22 > 0 and var_414_16 < var_414_22 then
					arg_411_1.talkMaxDuration = var_414_22

					if var_414_22 + var_414_15 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_22 + var_414_15
					end
				end

				arg_411_1.text_.text = var_414_19
				arg_411_1.typewritter.percent = 0

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_113191", "113191099", "story_v_out_113191.awb") ~= 0 then
					local var_414_23 = manager.audio:GetVoiceLength("story_v_out_113191", "113191099", "story_v_out_113191.awb") / 1000

					if var_414_23 + var_414_15 > arg_411_1.duration_ then
						arg_411_1.duration_ = var_414_23 + var_414_15
					end

					if var_414_18.prefab_name ~= "" and arg_411_1.actors_[var_414_18.prefab_name] ~= nil then
						local var_414_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_411_1.actors_[var_414_18.prefab_name].transform, "story_v_out_113191", "113191099", "story_v_out_113191.awb")

						arg_411_1:RecordAudio("113191099", var_414_24)
						arg_411_1:RecordAudio("113191099", var_414_24)
					else
						arg_411_1:AudioAction("play", "voice", "story_v_out_113191", "113191099", "story_v_out_113191.awb")
					end

					arg_411_1:RecordHistoryTalkVoice("story_v_out_113191", "113191099", "story_v_out_113191.awb")
				end

				arg_411_1:RecordContent(arg_411_1.text_.text)
			end

			local var_414_25 = math.max(var_414_16, arg_411_1.talkMaxDuration)

			if var_414_15 <= arg_411_1.time_ and arg_411_1.time_ < var_414_15 + var_414_25 then
				arg_411_1.typewritter.percent = (arg_411_1.time_ - var_414_15) / var_414_25

				arg_411_1.typewritter:SetDirty()
			end

			if arg_411_1.time_ >= var_414_15 + var_414_25 and arg_411_1.time_ < var_414_15 + var_414_25 + arg_414_0 then
				arg_411_1.typewritter.percent = 1

				arg_411_1.typewritter:SetDirty()
				arg_411_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0106",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0103",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0105",
		"Assets/UIResources/UI_AB/TextureConfig/Background/F03b",
		"Assets/UIResources/UI_AB/TextureConfig/Background/OM0107"
	},
	voices = {
		"story_v_out_113191.awb"
	}
}
