return {
	Play319301001 = function(arg_1_0, arg_1_1)
		arg_1_1.time_ = 0
		arg_1_1.frameCnt_ = 0
		arg_1_1.state_ = "playing"
		arg_1_1.curTalkId_ = 319301001
		arg_1_1.duration_ = 7

		SetActive(arg_1_1.tipsGo_, false)

		function arg_1_1.onSingleLineFinish_()
			arg_1_1.onSingleLineUpdate_ = nil
			arg_1_1.onSingleLineFinish_ = nil
			arg_1_1.state_ = "waiting"
		end

		function arg_1_1.playNext_(arg_3_0)
			if arg_3_0 == 1 then
				arg_1_0:Play319301002(arg_1_1)
			end
		end

		function arg_1_1.onSingleLineUpdate_(arg_4_0)
			local var_4_0 = "A08f"

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
				local var_4_5 = arg_1_1.bgs_.A08f

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
					if iter_4_0 ~= "A08f" then
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
				local var_4_25 = "effect"

				arg_1_1:AudioAction(var_4_24, var_4_25, "se_story_9", "se_story_9_monster03", "")
			end

			local var_4_26 = 0
			local var_4_27 = 1

			if var_4_26 < arg_1_1.time_ and arg_1_1.time_ <= var_4_26 + arg_4_0 then
				local var_4_28 = "play"
				local var_4_29 = "effect"

				arg_1_1:AudioAction(var_4_28, var_4_29, "se_story_126_01", "se_story_126_01_fight_loop", "")
			end

			local var_4_30 = 0.2
			local var_4_31 = 0.9

			if var_4_30 < arg_1_1.time_ and arg_1_1.time_ <= var_4_30 + arg_4_0 then
				local var_4_32 = "play"
				local var_4_33 = "music"

				arg_1_1:AudioAction(var_4_32, var_4_33, "bgm_activity_3_0_story_forbidden_space", "bgm_activity_3_0_story_forbidden_space", "bgm_activity_3_0_story_forbidden_space.awb")
			end

			local var_4_34 = 0
			local var_4_35 = 0.166666666666667

			if var_4_34 < arg_1_1.time_ and arg_1_1.time_ <= var_4_34 + arg_4_0 then
				local var_4_36 = "play"
				local var_4_37 = "music"

				arg_1_1:AudioAction(var_4_36, var_4_37, "ui_battle", "ui_battle_stopbgm", "")
			end

			if arg_1_1.frameCnt_ <= 1 then
				arg_1_1.dialog_:SetActive(false)
			end

			local var_4_38 = 2
			local var_4_39 = 0.725

			if var_4_38 < arg_1_1.time_ and arg_1_1.time_ <= var_4_38 + arg_4_0 then
				arg_1_1.talkMaxDuration = 0

				arg_1_1.dialog_:SetActive(true)

				local var_4_40 = LeanTween.value(arg_1_1.dialog_, 0, 1, 0.3)

				var_4_40:setOnUpdate(LuaHelper.FloatAction(function(arg_5_0)
					arg_1_1.dialogCg_.alpha = arg_5_0
				end))
				var_4_40:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_1_1.dialog_)
					var_4_40:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_1_1.duration_ = arg_1_1.duration_ + 0.3

				SetActive(arg_1_1.leftNameGo_, false)

				arg_1_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_1_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_1_1:RecordName(arg_1_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_1_1.iconTrs_.gameObject, false)
				arg_1_1.callingController_:SetSelectedState("normal")

				local var_4_41 = arg_1_1:GetWordFromCfg(319301001)
				local var_4_42 = arg_1_1:FormatText(var_4_41.content)

				arg_1_1.text_.text = var_4_42

				LuaForUtil.ClearLinePrefixSymbol(arg_1_1.text_)

				local var_4_43 = 29
				local var_4_44 = utf8.len(var_4_42)
				local var_4_45 = var_4_43 <= 0 and var_4_39 or var_4_39 * (var_4_44 / var_4_43)

				if var_4_45 > 0 and var_4_39 < var_4_45 then
					arg_1_1.talkMaxDuration = var_4_45
					var_4_38 = var_4_38 + 0.3

					if var_4_45 + var_4_38 > arg_1_1.duration_ then
						arg_1_1.duration_ = var_4_45 + var_4_38
					end
				end

				arg_1_1.text_.text = var_4_42
				arg_1_1.typewritter.percent = 0

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(false)
				arg_1_1:RecordContent(arg_1_1.text_.text)
			end

			local var_4_46 = var_4_38 + 0.3
			local var_4_47 = math.max(var_4_39, arg_1_1.talkMaxDuration)

			if var_4_46 <= arg_1_1.time_ and arg_1_1.time_ < var_4_46 + var_4_47 then
				arg_1_1.typewritter.percent = (arg_1_1.time_ - var_4_46) / var_4_47

				arg_1_1.typewritter:SetDirty()
			end

			if arg_1_1.time_ >= var_4_46 + var_4_47 and arg_1_1.time_ < var_4_46 + var_4_47 + arg_4_0 then
				arg_1_1.typewritter.percent = 1

				arg_1_1.typewritter:SetDirty()
				arg_1_1:ShowNextGo(true)
			end
		end
	end,
	Play319301002 = function(arg_7_0, arg_7_1)
		arg_7_1.time_ = 0
		arg_7_1.frameCnt_ = 0
		arg_7_1.state_ = "playing"
		arg_7_1.curTalkId_ = 319301002
		arg_7_1.duration_ = 5.56666666666667

		SetActive(arg_7_1.tipsGo_, false)

		function arg_7_1.onSingleLineFinish_()
			arg_7_1.onSingleLineUpdate_ = nil
			arg_7_1.onSingleLineFinish_ = nil
			arg_7_1.state_ = "waiting"
		end

		function arg_7_1.playNext_(arg_9_0)
			if arg_9_0 == 1 then
				arg_7_0:Play319301003(arg_7_1)
			end
		end

		function arg_7_1.onSingleLineUpdate_(arg_10_0)
			local var_10_0 = manager.ui.mainCamera.transform
			local var_10_1 = 0

			if var_10_1 < arg_7_1.time_ and arg_7_1.time_ <= var_10_1 + arg_10_0 then
				local var_10_2 = arg_7_1.var_.effect666

				if not var_10_2 then
					var_10_2 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_10_2.name = "666"
					arg_7_1.var_.effect666 = var_10_2
				end

				local var_10_3 = var_10_0:Find("")

				if var_10_3 then
					var_10_2.transform.parent = var_10_3
				else
					var_10_2.transform.parent = var_10_0
				end

				var_10_2.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_10_2.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_10_4 = manager.ui.mainCamera.transform
			local var_10_5 = 0.2

			if var_10_5 < arg_7_1.time_ and arg_7_1.time_ <= var_10_5 + arg_10_0 then
				local var_10_6 = arg_7_1.var_.effect666

				if not var_10_6 then
					var_10_6 = Object.Instantiate(Asset.Load("Effect/Scene/fx_ui_slash_01"))
					var_10_6.name = "666"
					arg_7_1.var_.effect666 = var_10_6
				end

				local var_10_7 = var_10_4:Find("")

				if var_10_7 then
					var_10_6.transform.parent = var_10_7
				else
					var_10_6.transform.parent = var_10_4
				end

				var_10_6.transform.localPosition = Vector3.New(0, 0, 0.44)
				var_10_6.transform.localRotation = Quaternion.Euler(0, 0, 0)
			end

			local var_10_8 = manager.ui.mainCamera.transform
			local var_10_9 = 0.4

			if var_10_9 < arg_7_1.time_ and arg_7_1.time_ <= var_10_9 + arg_10_0 then
				local var_10_10 = arg_7_1.var_.effect666

				if var_10_10 then
					Object.Destroy(var_10_10)

					arg_7_1.var_.effect666 = nil
				end
			end

			local var_10_11 = 0

			if var_10_11 < arg_7_1.time_ and arg_7_1.time_ <= var_10_11 + arg_10_0 then
				arg_7_1.allBtn_.enabled = false
			end

			local var_10_12 = 0.6

			if arg_7_1.time_ >= var_10_11 + var_10_12 and arg_7_1.time_ < var_10_11 + var_10_12 + arg_10_0 then
				arg_7_1.allBtn_.enabled = true
			end

			local var_10_13 = manager.ui.mainCamera.transform
			local var_10_14 = 0

			if var_10_14 < arg_7_1.time_ and arg_7_1.time_ <= var_10_14 + arg_10_0 then
				arg_7_1.var_.shakeOldPos = var_10_13.localPosition
			end

			local var_10_15 = 0.6

			if var_10_14 <= arg_7_1.time_ and arg_7_1.time_ < var_10_14 + var_10_15 then
				local var_10_16 = (arg_7_1.time_ - var_10_14) / 0.066
				local var_10_17, var_10_18 = math.modf(var_10_16)

				var_10_13.localPosition = Vector3.New(var_10_18 * 0.13, var_10_18 * 0.13, var_10_18 * 0.13) + arg_7_1.var_.shakeOldPos
			end

			if arg_7_1.time_ >= var_10_14 + var_10_15 and arg_7_1.time_ < var_10_14 + var_10_15 + arg_10_0 then
				var_10_13.localPosition = arg_7_1.var_.shakeOldPos
			end

			local var_10_19 = 0.566666666666667
			local var_10_20 = 1.05

			if var_10_19 < arg_7_1.time_ and arg_7_1.time_ <= var_10_19 + arg_10_0 then
				arg_7_1.talkMaxDuration = 0
				arg_7_1.dialogCg_.alpha = 1

				arg_7_1.dialog_:SetActive(true)
				SetActive(arg_7_1.leftNameGo_, false)

				arg_7_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_7_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_7_1:RecordName(arg_7_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_7_1.iconTrs_.gameObject, false)
				arg_7_1.callingController_:SetSelectedState("normal")

				local var_10_21 = arg_7_1:GetWordFromCfg(319301002)
				local var_10_22 = arg_7_1:FormatText(var_10_21.content)

				arg_7_1.text_.text = var_10_22

				LuaForUtil.ClearLinePrefixSymbol(arg_7_1.text_)

				local var_10_23 = 42
				local var_10_24 = utf8.len(var_10_22)
				local var_10_25 = var_10_23 <= 0 and var_10_20 or var_10_20 * (var_10_24 / var_10_23)

				if var_10_25 > 0 and var_10_20 < var_10_25 then
					arg_7_1.talkMaxDuration = var_10_25

					if var_10_25 + var_10_19 > arg_7_1.duration_ then
						arg_7_1.duration_ = var_10_25 + var_10_19
					end
				end

				arg_7_1.text_.text = var_10_22
				arg_7_1.typewritter.percent = 0

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(false)
				arg_7_1:RecordContent(arg_7_1.text_.text)
			end

			local var_10_26 = math.max(var_10_20, arg_7_1.talkMaxDuration)

			if var_10_19 <= arg_7_1.time_ and arg_7_1.time_ < var_10_19 + var_10_26 then
				arg_7_1.typewritter.percent = (arg_7_1.time_ - var_10_19) / var_10_26

				arg_7_1.typewritter:SetDirty()
			end

			if arg_7_1.time_ >= var_10_19 + var_10_26 and arg_7_1.time_ < var_10_19 + var_10_26 + arg_10_0 then
				arg_7_1.typewritter.percent = 1

				arg_7_1.typewritter:SetDirty()
				arg_7_1:ShowNextGo(true)
			end
		end
	end,
	Play319301003 = function(arg_11_0, arg_11_1)
		arg_11_1.time_ = 0
		arg_11_1.frameCnt_ = 0
		arg_11_1.state_ = "playing"
		arg_11_1.curTalkId_ = 319301003
		arg_11_1.duration_ = 5.066

		local var_11_0 = {
			zh = 2.866,
			ja = 5.066
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
				arg_11_0:Play319301004(arg_11_1)
			end
		end

		function arg_11_1.onSingleLineUpdate_(arg_14_0)
			local var_14_0 = 0
			local var_14_1 = 1

			if var_14_0 < arg_11_1.time_ and arg_11_1.time_ <= var_14_0 + arg_14_0 then
				local var_14_2 = "stop"
				local var_14_3 = "effect"

				arg_11_1:AudioAction(var_14_2, var_14_3, "se_story_126_01", "se_story_126_01_fight_loop", "")
			end

			local var_14_4 = manager.ui.mainCamera.transform
			local var_14_5 = 0

			if var_14_5 < arg_11_1.time_ and arg_11_1.time_ <= var_14_5 + arg_14_0 then
				local var_14_6 = arg_11_1.var_.effect666

				if var_14_6 then
					Object.Destroy(var_14_6)

					arg_11_1.var_.effect666 = nil
				end
			end

			local var_14_7 = 0
			local var_14_8 = 0.35

			if var_14_7 < arg_11_1.time_ and arg_11_1.time_ <= var_14_7 + arg_14_0 then
				arg_11_1.talkMaxDuration = 0
				arg_11_1.dialogCg_.alpha = 1

				arg_11_1.dialog_:SetActive(true)
				SetActive(arg_11_1.leftNameGo_, true)

				local var_14_9 = arg_11_1:FormatText(StoryNameCfg[643].name)

				arg_11_1.leftNameTxt_.text = var_14_9

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_11_1.leftNameTxt_.transform)

				arg_11_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_11_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_11_1:RecordName(arg_11_1.leftNameTxt_.text)
				SetActive(arg_11_1.iconTrs_.gameObject, true)
				arg_11_1.iconController_:SetSelectedState("hero")

				arg_11_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_11_1.callingController_:SetSelectedState("normal")

				local var_14_10 = arg_11_1:GetWordFromCfg(319301003)
				local var_14_11 = arg_11_1:FormatText(var_14_10.content)

				arg_11_1.text_.text = var_14_11

				LuaForUtil.ClearLinePrefixSymbol(arg_11_1.text_)

				local var_14_12 = 14
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301003", "story_v_out_319301.awb") ~= 0 then
					local var_14_15 = manager.audio:GetVoiceLength("story_v_out_319301", "319301003", "story_v_out_319301.awb") / 1000

					if var_14_15 + var_14_7 > arg_11_1.duration_ then
						arg_11_1.duration_ = var_14_15 + var_14_7
					end

					if var_14_10.prefab_name ~= "" and arg_11_1.actors_[var_14_10.prefab_name] ~= nil then
						local var_14_16 = LuaForUtil.PlayVoiceWithCriLipsync(arg_11_1.actors_[var_14_10.prefab_name].transform, "story_v_out_319301", "319301003", "story_v_out_319301.awb")

						arg_11_1:RecordAudio("319301003", var_14_16)
						arg_11_1:RecordAudio("319301003", var_14_16)
					else
						arg_11_1:AudioAction("play", "voice", "story_v_out_319301", "319301003", "story_v_out_319301.awb")
					end

					arg_11_1:RecordHistoryTalkVoice("story_v_out_319301", "319301003", "story_v_out_319301.awb")
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
	Play319301004 = function(arg_15_0, arg_15_1)
		arg_15_1.time_ = 0
		arg_15_1.frameCnt_ = 0
		arg_15_1.state_ = "playing"
		arg_15_1.curTalkId_ = 319301004
		arg_15_1.duration_ = 6.5

		local var_15_0 = {
			zh = 3.5,
			ja = 6.5
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
				arg_15_0:Play319301005(arg_15_1)
			end
		end

		function arg_15_1.onSingleLineUpdate_(arg_18_0)
			local var_18_0 = 0
			local var_18_1 = 0.425

			if var_18_0 < arg_15_1.time_ and arg_15_1.time_ <= var_18_0 + arg_18_0 then
				arg_15_1.talkMaxDuration = 0
				arg_15_1.dialogCg_.alpha = 1

				arg_15_1.dialog_:SetActive(true)
				SetActive(arg_15_1.leftNameGo_, true)

				local var_18_2 = arg_15_1:FormatText(StoryNameCfg[643].name)

				arg_15_1.leftNameTxt_.text = var_18_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_15_1.leftNameTxt_.transform)

				arg_15_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_15_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_15_1:RecordName(arg_15_1.leftNameTxt_.text)
				SetActive(arg_15_1.iconTrs_.gameObject, true)
				arg_15_1.iconController_:SetSelectedState("hero")

				arg_15_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_15_1.callingController_:SetSelectedState("normal")

				local var_18_3 = arg_15_1:GetWordFromCfg(319301004)
				local var_18_4 = arg_15_1:FormatText(var_18_3.content)

				arg_15_1.text_.text = var_18_4

				LuaForUtil.ClearLinePrefixSymbol(arg_15_1.text_)

				local var_18_5 = 17
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301004", "story_v_out_319301.awb") ~= 0 then
					local var_18_8 = manager.audio:GetVoiceLength("story_v_out_319301", "319301004", "story_v_out_319301.awb") / 1000

					if var_18_8 + var_18_0 > arg_15_1.duration_ then
						arg_15_1.duration_ = var_18_8 + var_18_0
					end

					if var_18_3.prefab_name ~= "" and arg_15_1.actors_[var_18_3.prefab_name] ~= nil then
						local var_18_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_15_1.actors_[var_18_3.prefab_name].transform, "story_v_out_319301", "319301004", "story_v_out_319301.awb")

						arg_15_1:RecordAudio("319301004", var_18_9)
						arg_15_1:RecordAudio("319301004", var_18_9)
					else
						arg_15_1:AudioAction("play", "voice", "story_v_out_319301", "319301004", "story_v_out_319301.awb")
					end

					arg_15_1:RecordHistoryTalkVoice("story_v_out_319301", "319301004", "story_v_out_319301.awb")
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
	Play319301005 = function(arg_19_0, arg_19_1)
		arg_19_1.time_ = 0
		arg_19_1.frameCnt_ = 0
		arg_19_1.state_ = "playing"
		arg_19_1.curTalkId_ = 319301005
		arg_19_1.duration_ = 11.266

		local var_19_0 = {
			zh = 4.766,
			ja = 11.266
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
				arg_19_0:Play319301006(arg_19_1)
			end
		end

		function arg_19_1.onSingleLineUpdate_(arg_22_0)
			local var_22_0 = "1095ui_story"

			if arg_19_1.actors_[var_22_0] == nil then
				local var_22_1 = Object.Instantiate(Asset.Load("Char/" .. var_22_0), arg_19_1.stage_.transform)

				var_22_1.name = var_22_0
				var_22_1.transform.localPosition = Vector3.New(0, 100, 0)
				arg_19_1.actors_[var_22_0] = var_22_1

				local var_22_2 = var_22_1:GetComponentInChildren(typeof(CharacterEffect))

				var_22_2.enabled = true

				local var_22_3 = GameObjectTools.GetOrAddComponent(var_22_1, typeof(DynamicBoneHelper))

				if var_22_3 then
					var_22_3:EnableDynamicBone(false)
				end

				arg_19_1:ShowWeapon(var_22_2.transform, false)

				arg_19_1.var_[var_22_0 .. "Animator"] = var_22_2.gameObject:GetComponent(typeof(UnityEngine.Animator))
				arg_19_1.var_[var_22_0 .. "Animator"].applyRootMotion = true
				arg_19_1.var_[var_22_0 .. "LipSync"] = var_22_2.gameObject:GetComponentInChildren(typeof(RogoDigital.Lipsync.LipSync))
			end

			local var_22_4 = arg_19_1.actors_["1095ui_story"].transform
			local var_22_5 = 0

			if var_22_5 < arg_19_1.time_ and arg_19_1.time_ <= var_22_5 + arg_22_0 then
				arg_19_1.var_.moveOldPos1095ui_story = var_22_4.localPosition
			end

			local var_22_6 = 0.001

			if var_22_5 <= arg_19_1.time_ and arg_19_1.time_ < var_22_5 + var_22_6 then
				local var_22_7 = (arg_19_1.time_ - var_22_5) / var_22_6
				local var_22_8 = Vector3.New(0, -0.98, -6.1)

				var_22_4.localPosition = Vector3.Lerp(arg_19_1.var_.moveOldPos1095ui_story, var_22_8, var_22_7)

				local var_22_9 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_9.x, var_22_9.y, var_22_9.z)

				local var_22_10 = var_22_4.localEulerAngles

				var_22_10.z = 0
				var_22_10.x = 0
				var_22_4.localEulerAngles = var_22_10
			end

			if arg_19_1.time_ >= var_22_5 + var_22_6 and arg_19_1.time_ < var_22_5 + var_22_6 + arg_22_0 then
				var_22_4.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_22_11 = manager.ui.mainCamera.transform.position - var_22_4.position

				var_22_4.forward = Vector3.New(var_22_11.x, var_22_11.y, var_22_11.z)

				local var_22_12 = var_22_4.localEulerAngles

				var_22_12.z = 0
				var_22_12.x = 0
				var_22_4.localEulerAngles = var_22_12
			end

			local var_22_13 = arg_19_1.actors_["1095ui_story"]
			local var_22_14 = 0

			if var_22_14 < arg_19_1.time_ and arg_19_1.time_ <= var_22_14 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story == nil then
				arg_19_1.var_.characterEffect1095ui_story = var_22_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_22_15 = 0.200000002980232

			if var_22_14 <= arg_19_1.time_ and arg_19_1.time_ < var_22_14 + var_22_15 then
				local var_22_16 = (arg_19_1.time_ - var_22_14) / var_22_15

				if arg_19_1.var_.characterEffect1095ui_story then
					arg_19_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_19_1.time_ >= var_22_14 + var_22_15 and arg_19_1.time_ < var_22_14 + var_22_15 + arg_22_0 and arg_19_1.var_.characterEffect1095ui_story then
				arg_19_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_22_17 = 0

			if var_22_17 < arg_19_1.time_ and arg_19_1.time_ <= var_22_17 + arg_22_0 then
				arg_19_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_22_18 = 0

			if var_22_18 < arg_19_1.time_ and arg_19_1.time_ <= var_22_18 + arg_22_0 then
				arg_19_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_22_19 = 0
			local var_22_20 = 0.575

			if var_22_19 < arg_19_1.time_ and arg_19_1.time_ <= var_22_19 + arg_22_0 then
				arg_19_1.talkMaxDuration = 0
				arg_19_1.dialogCg_.alpha = 1

				arg_19_1.dialog_:SetActive(true)
				SetActive(arg_19_1.leftNameGo_, true)

				local var_22_21 = arg_19_1:FormatText(StoryNameCfg[471].name)

				arg_19_1.leftNameTxt_.text = var_22_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_19_1.leftNameTxt_.transform)

				arg_19_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_19_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_19_1:RecordName(arg_19_1.leftNameTxt_.text)
				SetActive(arg_19_1.iconTrs_.gameObject, false)
				arg_19_1.callingController_:SetSelectedState("normal")

				local var_22_22 = arg_19_1:GetWordFromCfg(319301005)
				local var_22_23 = arg_19_1:FormatText(var_22_22.content)

				arg_19_1.text_.text = var_22_23

				LuaForUtil.ClearLinePrefixSymbol(arg_19_1.text_)

				local var_22_24 = 23
				local var_22_25 = utf8.len(var_22_23)
				local var_22_26 = var_22_24 <= 0 and var_22_20 or var_22_20 * (var_22_25 / var_22_24)

				if var_22_26 > 0 and var_22_20 < var_22_26 then
					arg_19_1.talkMaxDuration = var_22_26

					if var_22_26 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_26 + var_22_19
					end
				end

				arg_19_1.text_.text = var_22_23
				arg_19_1.typewritter.percent = 0

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301005", "story_v_out_319301.awb") ~= 0 then
					local var_22_27 = manager.audio:GetVoiceLength("story_v_out_319301", "319301005", "story_v_out_319301.awb") / 1000

					if var_22_27 + var_22_19 > arg_19_1.duration_ then
						arg_19_1.duration_ = var_22_27 + var_22_19
					end

					if var_22_22.prefab_name ~= "" and arg_19_1.actors_[var_22_22.prefab_name] ~= nil then
						local var_22_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_19_1.actors_[var_22_22.prefab_name].transform, "story_v_out_319301", "319301005", "story_v_out_319301.awb")

						arg_19_1:RecordAudio("319301005", var_22_28)
						arg_19_1:RecordAudio("319301005", var_22_28)
					else
						arg_19_1:AudioAction("play", "voice", "story_v_out_319301", "319301005", "story_v_out_319301.awb")
					end

					arg_19_1:RecordHistoryTalkVoice("story_v_out_319301", "319301005", "story_v_out_319301.awb")
				end

				arg_19_1:RecordContent(arg_19_1.text_.text)
			end

			local var_22_29 = math.max(var_22_20, arg_19_1.talkMaxDuration)

			if var_22_19 <= arg_19_1.time_ and arg_19_1.time_ < var_22_19 + var_22_29 then
				arg_19_1.typewritter.percent = (arg_19_1.time_ - var_22_19) / var_22_29

				arg_19_1.typewritter:SetDirty()
			end

			if arg_19_1.time_ >= var_22_19 + var_22_29 and arg_19_1.time_ < var_22_19 + var_22_29 + arg_22_0 then
				arg_19_1.typewritter.percent = 1

				arg_19_1.typewritter:SetDirty()
				arg_19_1:ShowNextGo(true)
			end
		end
	end,
	Play319301006 = function(arg_23_0, arg_23_1)
		arg_23_1.time_ = 0
		arg_23_1.frameCnt_ = 0
		arg_23_1.state_ = "playing"
		arg_23_1.curTalkId_ = 319301006
		arg_23_1.duration_ = 0.999999999999

		SetActive(arg_23_1.tipsGo_, false)

		function arg_23_1.onSingleLineFinish_()
			arg_23_1.onSingleLineUpdate_ = nil
			arg_23_1.onSingleLineFinish_ = nil
			arg_23_1.state_ = "waiting"
		end

		function arg_23_1.playNext_(arg_25_0)
			if arg_25_0 == 1 then
				arg_23_0:Play319301007(arg_23_1)
			end
		end

		function arg_23_1.onSingleLineUpdate_(arg_26_0)
			local var_26_0 = arg_23_1.actors_["1095ui_story"]
			local var_26_1 = 0

			if var_26_1 < arg_23_1.time_ and arg_23_1.time_ <= var_26_1 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story == nil then
				arg_23_1.var_.characterEffect1095ui_story = var_26_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_26_2 = 0.200000002980232

			if var_26_1 <= arg_23_1.time_ and arg_23_1.time_ < var_26_1 + var_26_2 then
				local var_26_3 = (arg_23_1.time_ - var_26_1) / var_26_2

				if arg_23_1.var_.characterEffect1095ui_story then
					local var_26_4 = Mathf.Lerp(0, 0.5, var_26_3)

					arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_4
				end
			end

			if arg_23_1.time_ >= var_26_1 + var_26_2 and arg_23_1.time_ < var_26_1 + var_26_2 + arg_26_0 and arg_23_1.var_.characterEffect1095ui_story then
				local var_26_5 = 0.5

				arg_23_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_23_1.var_.characterEffect1095ui_story.fillRatio = var_26_5
			end

			local var_26_6 = 0
			local var_26_7 = 0.05

			if var_26_6 < arg_23_1.time_ and arg_23_1.time_ <= var_26_6 + arg_26_0 then
				arg_23_1.talkMaxDuration = 0
				arg_23_1.dialogCg_.alpha = 1

				arg_23_1.dialog_:SetActive(true)
				SetActive(arg_23_1.leftNameGo_, true)

				local var_26_8 = arg_23_1:FormatText(StoryNameCfg[643].name)

				arg_23_1.leftNameTxt_.text = var_26_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_23_1.leftNameTxt_.transform)

				arg_23_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_23_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_23_1:RecordName(arg_23_1.leftNameTxt_.text)
				SetActive(arg_23_1.iconTrs_.gameObject, true)
				arg_23_1.iconController_:SetSelectedState("hero")

				arg_23_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_23_1.callingController_:SetSelectedState("normal")

				local var_26_9 = arg_23_1:GetWordFromCfg(319301006)
				local var_26_10 = arg_23_1:FormatText(var_26_9.content)

				arg_23_1.text_.text = var_26_10

				LuaForUtil.ClearLinePrefixSymbol(arg_23_1.text_)

				local var_26_11 = 2
				local var_26_12 = utf8.len(var_26_10)
				local var_26_13 = var_26_11 <= 0 and var_26_7 or var_26_7 * (var_26_12 / var_26_11)

				if var_26_13 > 0 and var_26_7 < var_26_13 then
					arg_23_1.talkMaxDuration = var_26_13

					if var_26_13 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_13 + var_26_6
					end
				end

				arg_23_1.text_.text = var_26_10
				arg_23_1.typewritter.percent = 0

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301006", "story_v_out_319301.awb") ~= 0 then
					local var_26_14 = manager.audio:GetVoiceLength("story_v_out_319301", "319301006", "story_v_out_319301.awb") / 1000

					if var_26_14 + var_26_6 > arg_23_1.duration_ then
						arg_23_1.duration_ = var_26_14 + var_26_6
					end

					if var_26_9.prefab_name ~= "" and arg_23_1.actors_[var_26_9.prefab_name] ~= nil then
						local var_26_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_23_1.actors_[var_26_9.prefab_name].transform, "story_v_out_319301", "319301006", "story_v_out_319301.awb")

						arg_23_1:RecordAudio("319301006", var_26_15)
						arg_23_1:RecordAudio("319301006", var_26_15)
					else
						arg_23_1:AudioAction("play", "voice", "story_v_out_319301", "319301006", "story_v_out_319301.awb")
					end

					arg_23_1:RecordHistoryTalkVoice("story_v_out_319301", "319301006", "story_v_out_319301.awb")
				end

				arg_23_1:RecordContent(arg_23_1.text_.text)
			end

			local var_26_16 = math.max(var_26_7, arg_23_1.talkMaxDuration)

			if var_26_6 <= arg_23_1.time_ and arg_23_1.time_ < var_26_6 + var_26_16 then
				arg_23_1.typewritter.percent = (arg_23_1.time_ - var_26_6) / var_26_16

				arg_23_1.typewritter:SetDirty()
			end

			if arg_23_1.time_ >= var_26_6 + var_26_16 and arg_23_1.time_ < var_26_6 + var_26_16 + arg_26_0 then
				arg_23_1.typewritter.percent = 1

				arg_23_1.typewritter:SetDirty()
				arg_23_1:ShowNextGo(true)
			end
		end
	end,
	Play319301007 = function(arg_27_0, arg_27_1)
		arg_27_1.time_ = 0
		arg_27_1.frameCnt_ = 0
		arg_27_1.state_ = "playing"
		arg_27_1.curTalkId_ = 319301007
		arg_27_1.duration_ = 5

		SetActive(arg_27_1.tipsGo_, false)

		function arg_27_1.onSingleLineFinish_()
			arg_27_1.onSingleLineUpdate_ = nil
			arg_27_1.onSingleLineFinish_ = nil
			arg_27_1.state_ = "waiting"
		end

		function arg_27_1.playNext_(arg_29_0)
			if arg_29_0 == 1 then
				arg_27_0:Play319301008(arg_27_1)
			end
		end

		function arg_27_1.onSingleLineUpdate_(arg_30_0)
			local var_30_0 = 0
			local var_30_1 = 1

			if var_30_0 < arg_27_1.time_ and arg_27_1.time_ <= var_30_0 + arg_30_0 then
				arg_27_1.talkMaxDuration = 0
				arg_27_1.dialogCg_.alpha = 1

				arg_27_1.dialog_:SetActive(true)
				SetActive(arg_27_1.leftNameGo_, false)

				arg_27_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_27_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_27_1:RecordName(arg_27_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_27_1.iconTrs_.gameObject, false)
				arg_27_1.callingController_:SetSelectedState("normal")

				local var_30_2 = arg_27_1:GetWordFromCfg(319301007)
				local var_30_3 = arg_27_1:FormatText(var_30_2.content)

				arg_27_1.text_.text = var_30_3

				LuaForUtil.ClearLinePrefixSymbol(arg_27_1.text_)

				local var_30_4 = 40
				local var_30_5 = utf8.len(var_30_3)
				local var_30_6 = var_30_4 <= 0 and var_30_1 or var_30_1 * (var_30_5 / var_30_4)

				if var_30_6 > 0 and var_30_1 < var_30_6 then
					arg_27_1.talkMaxDuration = var_30_6

					if var_30_6 + var_30_0 > arg_27_1.duration_ then
						arg_27_1.duration_ = var_30_6 + var_30_0
					end
				end

				arg_27_1.text_.text = var_30_3
				arg_27_1.typewritter.percent = 0

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(false)
				arg_27_1:RecordContent(arg_27_1.text_.text)
			end

			local var_30_7 = math.max(var_30_1, arg_27_1.talkMaxDuration)

			if var_30_0 <= arg_27_1.time_ and arg_27_1.time_ < var_30_0 + var_30_7 then
				arg_27_1.typewritter.percent = (arg_27_1.time_ - var_30_0) / var_30_7

				arg_27_1.typewritter:SetDirty()
			end

			if arg_27_1.time_ >= var_30_0 + var_30_7 and arg_27_1.time_ < var_30_0 + var_30_7 + arg_30_0 then
				arg_27_1.typewritter.percent = 1

				arg_27_1.typewritter:SetDirty()
				arg_27_1:ShowNextGo(true)
			end
		end
	end,
	Play319301008 = function(arg_31_0, arg_31_1)
		arg_31_1.time_ = 0
		arg_31_1.frameCnt_ = 0
		arg_31_1.state_ = "playing"
		arg_31_1.curTalkId_ = 319301008
		arg_31_1.duration_ = 9.833

		local var_31_0 = {
			zh = 6.7,
			ja = 9.833
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
				arg_31_0:Play319301009(arg_31_1)
			end
		end

		function arg_31_1.onSingleLineUpdate_(arg_34_0)
			local var_34_0 = 0
			local var_34_1 = 0.775

			if var_34_0 < arg_31_1.time_ and arg_31_1.time_ <= var_34_0 + arg_34_0 then
				arg_31_1.talkMaxDuration = 0
				arg_31_1.dialogCg_.alpha = 1

				arg_31_1.dialog_:SetActive(true)
				SetActive(arg_31_1.leftNameGo_, true)

				local var_34_2 = arg_31_1:FormatText(StoryNameCfg[643].name)

				arg_31_1.leftNameTxt_.text = var_34_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_31_1.leftNameTxt_.transform)

				arg_31_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_31_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_31_1:RecordName(arg_31_1.leftNameTxt_.text)
				SetActive(arg_31_1.iconTrs_.gameObject, true)
				arg_31_1.iconController_:SetSelectedState("hero")

				arg_31_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_31_1.callingController_:SetSelectedState("normal")

				local var_34_3 = arg_31_1:GetWordFromCfg(319301008)
				local var_34_4 = arg_31_1:FormatText(var_34_3.content)

				arg_31_1.text_.text = var_34_4

				LuaForUtil.ClearLinePrefixSymbol(arg_31_1.text_)

				local var_34_5 = 31
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301008", "story_v_out_319301.awb") ~= 0 then
					local var_34_8 = manager.audio:GetVoiceLength("story_v_out_319301", "319301008", "story_v_out_319301.awb") / 1000

					if var_34_8 + var_34_0 > arg_31_1.duration_ then
						arg_31_1.duration_ = var_34_8 + var_34_0
					end

					if var_34_3.prefab_name ~= "" and arg_31_1.actors_[var_34_3.prefab_name] ~= nil then
						local var_34_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_31_1.actors_[var_34_3.prefab_name].transform, "story_v_out_319301", "319301008", "story_v_out_319301.awb")

						arg_31_1:RecordAudio("319301008", var_34_9)
						arg_31_1:RecordAudio("319301008", var_34_9)
					else
						arg_31_1:AudioAction("play", "voice", "story_v_out_319301", "319301008", "story_v_out_319301.awb")
					end

					arg_31_1:RecordHistoryTalkVoice("story_v_out_319301", "319301008", "story_v_out_319301.awb")
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
	Play319301009 = function(arg_35_0, arg_35_1)
		arg_35_1.time_ = 0
		arg_35_1.frameCnt_ = 0
		arg_35_1.state_ = "playing"
		arg_35_1.curTalkId_ = 319301009
		arg_35_1.duration_ = 6.466

		local var_35_0 = {
			zh = 1.933,
			ja = 6.466
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
				arg_35_0:Play319301010(arg_35_1)
			end
		end

		function arg_35_1.onSingleLineUpdate_(arg_38_0)
			local var_38_0 = arg_35_1.actors_["1095ui_story"]
			local var_38_1 = 0

			if var_38_1 < arg_35_1.time_ and arg_35_1.time_ <= var_38_1 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story == nil then
				arg_35_1.var_.characterEffect1095ui_story = var_38_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_38_2 = 0.200000002980232

			if var_38_1 <= arg_35_1.time_ and arg_35_1.time_ < var_38_1 + var_38_2 then
				local var_38_3 = (arg_35_1.time_ - var_38_1) / var_38_2

				if arg_35_1.var_.characterEffect1095ui_story then
					arg_35_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_35_1.time_ >= var_38_1 + var_38_2 and arg_35_1.time_ < var_38_1 + var_38_2 + arg_38_0 and arg_35_1.var_.characterEffect1095ui_story then
				arg_35_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_38_4 = 0
			local var_38_5 = 0.3

			if var_38_4 < arg_35_1.time_ and arg_35_1.time_ <= var_38_4 + arg_38_0 then
				arg_35_1.talkMaxDuration = 0
				arg_35_1.dialogCg_.alpha = 1

				arg_35_1.dialog_:SetActive(true)
				SetActive(arg_35_1.leftNameGo_, true)

				local var_38_6 = arg_35_1:FormatText(StoryNameCfg[471].name)

				arg_35_1.leftNameTxt_.text = var_38_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_35_1.leftNameTxt_.transform)

				arg_35_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_35_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_35_1:RecordName(arg_35_1.leftNameTxt_.text)
				SetActive(arg_35_1.iconTrs_.gameObject, false)
				arg_35_1.callingController_:SetSelectedState("normal")

				local var_38_7 = arg_35_1:GetWordFromCfg(319301009)
				local var_38_8 = arg_35_1:FormatText(var_38_7.content)

				arg_35_1.text_.text = var_38_8

				LuaForUtil.ClearLinePrefixSymbol(arg_35_1.text_)

				local var_38_9 = 12
				local var_38_10 = utf8.len(var_38_8)
				local var_38_11 = var_38_9 <= 0 and var_38_5 or var_38_5 * (var_38_10 / var_38_9)

				if var_38_11 > 0 and var_38_5 < var_38_11 then
					arg_35_1.talkMaxDuration = var_38_11

					if var_38_11 + var_38_4 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_11 + var_38_4
					end
				end

				arg_35_1.text_.text = var_38_8
				arg_35_1.typewritter.percent = 0

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301009", "story_v_out_319301.awb") ~= 0 then
					local var_38_12 = manager.audio:GetVoiceLength("story_v_out_319301", "319301009", "story_v_out_319301.awb") / 1000

					if var_38_12 + var_38_4 > arg_35_1.duration_ then
						arg_35_1.duration_ = var_38_12 + var_38_4
					end

					if var_38_7.prefab_name ~= "" and arg_35_1.actors_[var_38_7.prefab_name] ~= nil then
						local var_38_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_35_1.actors_[var_38_7.prefab_name].transform, "story_v_out_319301", "319301009", "story_v_out_319301.awb")

						arg_35_1:RecordAudio("319301009", var_38_13)
						arg_35_1:RecordAudio("319301009", var_38_13)
					else
						arg_35_1:AudioAction("play", "voice", "story_v_out_319301", "319301009", "story_v_out_319301.awb")
					end

					arg_35_1:RecordHistoryTalkVoice("story_v_out_319301", "319301009", "story_v_out_319301.awb")
				end

				arg_35_1:RecordContent(arg_35_1.text_.text)
			end

			local var_38_14 = math.max(var_38_5, arg_35_1.talkMaxDuration)

			if var_38_4 <= arg_35_1.time_ and arg_35_1.time_ < var_38_4 + var_38_14 then
				arg_35_1.typewritter.percent = (arg_35_1.time_ - var_38_4) / var_38_14

				arg_35_1.typewritter:SetDirty()
			end

			if arg_35_1.time_ >= var_38_4 + var_38_14 and arg_35_1.time_ < var_38_4 + var_38_14 + arg_38_0 then
				arg_35_1.typewritter.percent = 1

				arg_35_1.typewritter:SetDirty()
				arg_35_1:ShowNextGo(true)
			end
		end
	end,
	Play319301010 = function(arg_39_0, arg_39_1)
		arg_39_1.time_ = 0
		arg_39_1.frameCnt_ = 0
		arg_39_1.state_ = "playing"
		arg_39_1.curTalkId_ = 319301010
		arg_39_1.duration_ = 7.233

		local var_39_0 = {
			zh = 4.8,
			ja = 7.233
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
				arg_39_0:Play319301011(arg_39_1)
			end
		end

		function arg_39_1.onSingleLineUpdate_(arg_42_0)
			local var_42_0 = arg_39_1.actors_["1095ui_story"]
			local var_42_1 = 0

			if var_42_1 < arg_39_1.time_ and arg_39_1.time_ <= var_42_1 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story == nil then
				arg_39_1.var_.characterEffect1095ui_story = var_42_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_42_2 = 0.200000002980232

			if var_42_1 <= arg_39_1.time_ and arg_39_1.time_ < var_42_1 + var_42_2 then
				local var_42_3 = (arg_39_1.time_ - var_42_1) / var_42_2

				if arg_39_1.var_.characterEffect1095ui_story then
					local var_42_4 = Mathf.Lerp(0, 0.5, var_42_3)

					arg_39_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_39_1.var_.characterEffect1095ui_story.fillRatio = var_42_4
				end
			end

			if arg_39_1.time_ >= var_42_1 + var_42_2 and arg_39_1.time_ < var_42_1 + var_42_2 + arg_42_0 and arg_39_1.var_.characterEffect1095ui_story then
				local var_42_5 = 0.5

				arg_39_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_39_1.var_.characterEffect1095ui_story.fillRatio = var_42_5
			end

			local var_42_6 = 0
			local var_42_7 = 0.425

			if var_42_6 < arg_39_1.time_ and arg_39_1.time_ <= var_42_6 + arg_42_0 then
				arg_39_1.talkMaxDuration = 0
				arg_39_1.dialogCg_.alpha = 1

				arg_39_1.dialog_:SetActive(true)
				SetActive(arg_39_1.leftNameGo_, true)

				local var_42_8 = arg_39_1:FormatText(StoryNameCfg[643].name)

				arg_39_1.leftNameTxt_.text = var_42_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_39_1.leftNameTxt_.transform)

				arg_39_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_39_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_39_1:RecordName(arg_39_1.leftNameTxt_.text)
				SetActive(arg_39_1.iconTrs_.gameObject, true)
				arg_39_1.iconController_:SetSelectedState("hero")

				arg_39_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_39_1.callingController_:SetSelectedState("normal")

				local var_42_9 = arg_39_1:GetWordFromCfg(319301010)
				local var_42_10 = arg_39_1:FormatText(var_42_9.content)

				arg_39_1.text_.text = var_42_10

				LuaForUtil.ClearLinePrefixSymbol(arg_39_1.text_)

				local var_42_11 = 17
				local var_42_12 = utf8.len(var_42_10)
				local var_42_13 = var_42_11 <= 0 and var_42_7 or var_42_7 * (var_42_12 / var_42_11)

				if var_42_13 > 0 and var_42_7 < var_42_13 then
					arg_39_1.talkMaxDuration = var_42_13

					if var_42_13 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_13 + var_42_6
					end
				end

				arg_39_1.text_.text = var_42_10
				arg_39_1.typewritter.percent = 0

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301010", "story_v_out_319301.awb") ~= 0 then
					local var_42_14 = manager.audio:GetVoiceLength("story_v_out_319301", "319301010", "story_v_out_319301.awb") / 1000

					if var_42_14 + var_42_6 > arg_39_1.duration_ then
						arg_39_1.duration_ = var_42_14 + var_42_6
					end

					if var_42_9.prefab_name ~= "" and arg_39_1.actors_[var_42_9.prefab_name] ~= nil then
						local var_42_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_39_1.actors_[var_42_9.prefab_name].transform, "story_v_out_319301", "319301010", "story_v_out_319301.awb")

						arg_39_1:RecordAudio("319301010", var_42_15)
						arg_39_1:RecordAudio("319301010", var_42_15)
					else
						arg_39_1:AudioAction("play", "voice", "story_v_out_319301", "319301010", "story_v_out_319301.awb")
					end

					arg_39_1:RecordHistoryTalkVoice("story_v_out_319301", "319301010", "story_v_out_319301.awb")
				end

				arg_39_1:RecordContent(arg_39_1.text_.text)
			end

			local var_42_16 = math.max(var_42_7, arg_39_1.talkMaxDuration)

			if var_42_6 <= arg_39_1.time_ and arg_39_1.time_ < var_42_6 + var_42_16 then
				arg_39_1.typewritter.percent = (arg_39_1.time_ - var_42_6) / var_42_16

				arg_39_1.typewritter:SetDirty()
			end

			if arg_39_1.time_ >= var_42_6 + var_42_16 and arg_39_1.time_ < var_42_6 + var_42_16 + arg_42_0 then
				arg_39_1.typewritter.percent = 1

				arg_39_1.typewritter:SetDirty()
				arg_39_1:ShowNextGo(true)
			end
		end
	end,
	Play319301011 = function(arg_43_0, arg_43_1)
		arg_43_1.time_ = 0
		arg_43_1.frameCnt_ = 0
		arg_43_1.state_ = "playing"
		arg_43_1.curTalkId_ = 319301011
		arg_43_1.duration_ = 6.9

		local var_43_0 = {
			zh = 2.233,
			ja = 6.9
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
				arg_43_0:Play319301012(arg_43_1)
			end
		end

		function arg_43_1.onSingleLineUpdate_(arg_46_0)
			local var_46_0 = arg_43_1.actors_["1095ui_story"].transform
			local var_46_1 = 0

			if var_46_1 < arg_43_1.time_ and arg_43_1.time_ <= var_46_1 + arg_46_0 then
				arg_43_1.var_.moveOldPos1095ui_story = var_46_0.localPosition
			end

			local var_46_2 = 0.001

			if var_46_1 <= arg_43_1.time_ and arg_43_1.time_ < var_46_1 + var_46_2 then
				local var_46_3 = (arg_43_1.time_ - var_46_1) / var_46_2
				local var_46_4 = Vector3.New(0, -0.98, -6.1)

				var_46_0.localPosition = Vector3.Lerp(arg_43_1.var_.moveOldPos1095ui_story, var_46_4, var_46_3)

				local var_46_5 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_5.x, var_46_5.y, var_46_5.z)

				local var_46_6 = var_46_0.localEulerAngles

				var_46_6.z = 0
				var_46_6.x = 0
				var_46_0.localEulerAngles = var_46_6
			end

			if arg_43_1.time_ >= var_46_1 + var_46_2 and arg_43_1.time_ < var_46_1 + var_46_2 + arg_46_0 then
				var_46_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_46_7 = manager.ui.mainCamera.transform.position - var_46_0.position

				var_46_0.forward = Vector3.New(var_46_7.x, var_46_7.y, var_46_7.z)

				local var_46_8 = var_46_0.localEulerAngles

				var_46_8.z = 0
				var_46_8.x = 0
				var_46_0.localEulerAngles = var_46_8
			end

			local var_46_9 = arg_43_1.actors_["1095ui_story"]
			local var_46_10 = 0

			if var_46_10 < arg_43_1.time_ and arg_43_1.time_ <= var_46_10 + arg_46_0 and arg_43_1.var_.characterEffect1095ui_story == nil then
				arg_43_1.var_.characterEffect1095ui_story = var_46_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_46_11 = 0.200000002980232

			if var_46_10 <= arg_43_1.time_ and arg_43_1.time_ < var_46_10 + var_46_11 then
				local var_46_12 = (arg_43_1.time_ - var_46_10) / var_46_11

				if arg_43_1.var_.characterEffect1095ui_story then
					arg_43_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_43_1.time_ >= var_46_10 + var_46_11 and arg_43_1.time_ < var_46_10 + var_46_11 + arg_46_0 and arg_43_1.var_.characterEffect1095ui_story then
				arg_43_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_46_13 = 0

			if var_46_13 < arg_43_1.time_ and arg_43_1.time_ <= var_46_13 + arg_46_0 then
				arg_43_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_1")
			end

			local var_46_14 = 0

			if var_46_14 < arg_43_1.time_ and arg_43_1.time_ <= var_46_14 + arg_46_0 then
				arg_43_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_46_15 = 0
			local var_46_16 = 0.225

			if var_46_15 < arg_43_1.time_ and arg_43_1.time_ <= var_46_15 + arg_46_0 then
				arg_43_1.talkMaxDuration = 0
				arg_43_1.dialogCg_.alpha = 1

				arg_43_1.dialog_:SetActive(true)
				SetActive(arg_43_1.leftNameGo_, true)

				local var_46_17 = arg_43_1:FormatText(StoryNameCfg[471].name)

				arg_43_1.leftNameTxt_.text = var_46_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_43_1.leftNameTxt_.transform)

				arg_43_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_43_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_43_1:RecordName(arg_43_1.leftNameTxt_.text)
				SetActive(arg_43_1.iconTrs_.gameObject, false)
				arg_43_1.callingController_:SetSelectedState("normal")

				local var_46_18 = arg_43_1:GetWordFromCfg(319301011)
				local var_46_19 = arg_43_1:FormatText(var_46_18.content)

				arg_43_1.text_.text = var_46_19

				LuaForUtil.ClearLinePrefixSymbol(arg_43_1.text_)

				local var_46_20 = 9
				local var_46_21 = utf8.len(var_46_19)
				local var_46_22 = var_46_20 <= 0 and var_46_16 or var_46_16 * (var_46_21 / var_46_20)

				if var_46_22 > 0 and var_46_16 < var_46_22 then
					arg_43_1.talkMaxDuration = var_46_22

					if var_46_22 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_22 + var_46_15
					end
				end

				arg_43_1.text_.text = var_46_19
				arg_43_1.typewritter.percent = 0

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301011", "story_v_out_319301.awb") ~= 0 then
					local var_46_23 = manager.audio:GetVoiceLength("story_v_out_319301", "319301011", "story_v_out_319301.awb") / 1000

					if var_46_23 + var_46_15 > arg_43_1.duration_ then
						arg_43_1.duration_ = var_46_23 + var_46_15
					end

					if var_46_18.prefab_name ~= "" and arg_43_1.actors_[var_46_18.prefab_name] ~= nil then
						local var_46_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_43_1.actors_[var_46_18.prefab_name].transform, "story_v_out_319301", "319301011", "story_v_out_319301.awb")

						arg_43_1:RecordAudio("319301011", var_46_24)
						arg_43_1:RecordAudio("319301011", var_46_24)
					else
						arg_43_1:AudioAction("play", "voice", "story_v_out_319301", "319301011", "story_v_out_319301.awb")
					end

					arg_43_1:RecordHistoryTalkVoice("story_v_out_319301", "319301011", "story_v_out_319301.awb")
				end

				arg_43_1:RecordContent(arg_43_1.text_.text)
			end

			local var_46_25 = math.max(var_46_16, arg_43_1.talkMaxDuration)

			if var_46_15 <= arg_43_1.time_ and arg_43_1.time_ < var_46_15 + var_46_25 then
				arg_43_1.typewritter.percent = (arg_43_1.time_ - var_46_15) / var_46_25

				arg_43_1.typewritter:SetDirty()
			end

			if arg_43_1.time_ >= var_46_15 + var_46_25 and arg_43_1.time_ < var_46_15 + var_46_25 + arg_46_0 then
				arg_43_1.typewritter.percent = 1

				arg_43_1.typewritter:SetDirty()
				arg_43_1:ShowNextGo(true)
			end
		end
	end,
	Play319301012 = function(arg_47_0, arg_47_1)
		arg_47_1.time_ = 0
		arg_47_1.frameCnt_ = 0
		arg_47_1.state_ = "playing"
		arg_47_1.curTalkId_ = 319301012
		arg_47_1.duration_ = 4.8

		local var_47_0 = {
			zh = 4.8,
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
				arg_47_0:Play319301013(arg_47_1)
			end
		end

		function arg_47_1.onSingleLineUpdate_(arg_50_0)
			local var_50_0 = arg_47_1.actors_["1095ui_story"]
			local var_50_1 = 0

			if var_50_1 < arg_47_1.time_ and arg_47_1.time_ <= var_50_1 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story == nil then
				arg_47_1.var_.characterEffect1095ui_story = var_50_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_50_2 = 0.200000002980232

			if var_50_1 <= arg_47_1.time_ and arg_47_1.time_ < var_50_1 + var_50_2 then
				local var_50_3 = (arg_47_1.time_ - var_50_1) / var_50_2

				if arg_47_1.var_.characterEffect1095ui_story then
					local var_50_4 = Mathf.Lerp(0, 0.5, var_50_3)

					arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_4
				end
			end

			if arg_47_1.time_ >= var_50_1 + var_50_2 and arg_47_1.time_ < var_50_1 + var_50_2 + arg_50_0 and arg_47_1.var_.characterEffect1095ui_story then
				local var_50_5 = 0.5

				arg_47_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_47_1.var_.characterEffect1095ui_story.fillRatio = var_50_5
			end

			local var_50_6 = 0
			local var_50_7 = 0.425

			if var_50_6 < arg_47_1.time_ and arg_47_1.time_ <= var_50_6 + arg_50_0 then
				arg_47_1.talkMaxDuration = 0
				arg_47_1.dialogCg_.alpha = 1

				arg_47_1.dialog_:SetActive(true)
				SetActive(arg_47_1.leftNameGo_, true)

				local var_50_8 = arg_47_1:FormatText(StoryNameCfg[643].name)

				arg_47_1.leftNameTxt_.text = var_50_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_47_1.leftNameTxt_.transform)

				arg_47_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_47_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_47_1:RecordName(arg_47_1.leftNameTxt_.text)
				SetActive(arg_47_1.iconTrs_.gameObject, true)
				arg_47_1.iconController_:SetSelectedState("hero")

				arg_47_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_47_1.callingController_:SetSelectedState("normal")

				local var_50_9 = arg_47_1:GetWordFromCfg(319301012)
				local var_50_10 = arg_47_1:FormatText(var_50_9.content)

				arg_47_1.text_.text = var_50_10

				LuaForUtil.ClearLinePrefixSymbol(arg_47_1.text_)

				local var_50_11 = 17
				local var_50_12 = utf8.len(var_50_10)
				local var_50_13 = var_50_11 <= 0 and var_50_7 or var_50_7 * (var_50_12 / var_50_11)

				if var_50_13 > 0 and var_50_7 < var_50_13 then
					arg_47_1.talkMaxDuration = var_50_13

					if var_50_13 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_13 + var_50_6
					end
				end

				arg_47_1.text_.text = var_50_10
				arg_47_1.typewritter.percent = 0

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301012", "story_v_out_319301.awb") ~= 0 then
					local var_50_14 = manager.audio:GetVoiceLength("story_v_out_319301", "319301012", "story_v_out_319301.awb") / 1000

					if var_50_14 + var_50_6 > arg_47_1.duration_ then
						arg_47_1.duration_ = var_50_14 + var_50_6
					end

					if var_50_9.prefab_name ~= "" and arg_47_1.actors_[var_50_9.prefab_name] ~= nil then
						local var_50_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_47_1.actors_[var_50_9.prefab_name].transform, "story_v_out_319301", "319301012", "story_v_out_319301.awb")

						arg_47_1:RecordAudio("319301012", var_50_15)
						arg_47_1:RecordAudio("319301012", var_50_15)
					else
						arg_47_1:AudioAction("play", "voice", "story_v_out_319301", "319301012", "story_v_out_319301.awb")
					end

					arg_47_1:RecordHistoryTalkVoice("story_v_out_319301", "319301012", "story_v_out_319301.awb")
				end

				arg_47_1:RecordContent(arg_47_1.text_.text)
			end

			local var_50_16 = math.max(var_50_7, arg_47_1.talkMaxDuration)

			if var_50_6 <= arg_47_1.time_ and arg_47_1.time_ < var_50_6 + var_50_16 then
				arg_47_1.typewritter.percent = (arg_47_1.time_ - var_50_6) / var_50_16

				arg_47_1.typewritter:SetDirty()
			end

			if arg_47_1.time_ >= var_50_6 + var_50_16 and arg_47_1.time_ < var_50_6 + var_50_16 + arg_50_0 then
				arg_47_1.typewritter.percent = 1

				arg_47_1.typewritter:SetDirty()
				arg_47_1:ShowNextGo(true)
			end
		end
	end,
	Play319301013 = function(arg_51_0, arg_51_1)
		arg_51_1.time_ = 0
		arg_51_1.frameCnt_ = 0
		arg_51_1.state_ = "playing"
		arg_51_1.curTalkId_ = 319301013
		arg_51_1.duration_ = 13.933

		local var_51_0 = {
			zh = 5.366,
			ja = 13.933
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
				arg_51_0:Play319301014(arg_51_1)
			end
		end

		function arg_51_1.onSingleLineUpdate_(arg_54_0)
			local var_54_0 = arg_51_1.actors_["1095ui_story"]
			local var_54_1 = 0

			if var_54_1 < arg_51_1.time_ and arg_51_1.time_ <= var_54_1 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story == nil then
				arg_51_1.var_.characterEffect1095ui_story = var_54_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_54_2 = 0.200000002980232

			if var_54_1 <= arg_51_1.time_ and arg_51_1.time_ < var_54_1 + var_54_2 then
				local var_54_3 = (arg_51_1.time_ - var_54_1) / var_54_2

				if arg_51_1.var_.characterEffect1095ui_story then
					arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_51_1.time_ >= var_54_1 + var_54_2 and arg_51_1.time_ < var_54_1 + var_54_2 + arg_54_0 and arg_51_1.var_.characterEffect1095ui_story then
				arg_51_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_54_4 = 0
			local var_54_5 = 0.7

			if var_54_4 < arg_51_1.time_ and arg_51_1.time_ <= var_54_4 + arg_54_0 then
				arg_51_1.talkMaxDuration = 0
				arg_51_1.dialogCg_.alpha = 1

				arg_51_1.dialog_:SetActive(true)
				SetActive(arg_51_1.leftNameGo_, true)

				local var_54_6 = arg_51_1:FormatText(StoryNameCfg[471].name)

				arg_51_1.leftNameTxt_.text = var_54_6

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_51_1.leftNameTxt_.transform)

				arg_51_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_51_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_51_1:RecordName(arg_51_1.leftNameTxt_.text)
				SetActive(arg_51_1.iconTrs_.gameObject, false)
				arg_51_1.callingController_:SetSelectedState("normal")

				local var_54_7 = arg_51_1:GetWordFromCfg(319301013)
				local var_54_8 = arg_51_1:FormatText(var_54_7.content)

				arg_51_1.text_.text = var_54_8

				LuaForUtil.ClearLinePrefixSymbol(arg_51_1.text_)

				local var_54_9 = 28
				local var_54_10 = utf8.len(var_54_8)
				local var_54_11 = var_54_9 <= 0 and var_54_5 or var_54_5 * (var_54_10 / var_54_9)

				if var_54_11 > 0 and var_54_5 < var_54_11 then
					arg_51_1.talkMaxDuration = var_54_11

					if var_54_11 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_11 + var_54_4
					end
				end

				arg_51_1.text_.text = var_54_8
				arg_51_1.typewritter.percent = 0

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301013", "story_v_out_319301.awb") ~= 0 then
					local var_54_12 = manager.audio:GetVoiceLength("story_v_out_319301", "319301013", "story_v_out_319301.awb") / 1000

					if var_54_12 + var_54_4 > arg_51_1.duration_ then
						arg_51_1.duration_ = var_54_12 + var_54_4
					end

					if var_54_7.prefab_name ~= "" and arg_51_1.actors_[var_54_7.prefab_name] ~= nil then
						local var_54_13 = LuaForUtil.PlayVoiceWithCriLipsync(arg_51_1.actors_[var_54_7.prefab_name].transform, "story_v_out_319301", "319301013", "story_v_out_319301.awb")

						arg_51_1:RecordAudio("319301013", var_54_13)
						arg_51_1:RecordAudio("319301013", var_54_13)
					else
						arg_51_1:AudioAction("play", "voice", "story_v_out_319301", "319301013", "story_v_out_319301.awb")
					end

					arg_51_1:RecordHistoryTalkVoice("story_v_out_319301", "319301013", "story_v_out_319301.awb")
				end

				arg_51_1:RecordContent(arg_51_1.text_.text)
			end

			local var_54_14 = math.max(var_54_5, arg_51_1.talkMaxDuration)

			if var_54_4 <= arg_51_1.time_ and arg_51_1.time_ < var_54_4 + var_54_14 then
				arg_51_1.typewritter.percent = (arg_51_1.time_ - var_54_4) / var_54_14

				arg_51_1.typewritter:SetDirty()
			end

			if arg_51_1.time_ >= var_54_4 + var_54_14 and arg_51_1.time_ < var_54_4 + var_54_14 + arg_54_0 then
				arg_51_1.typewritter.percent = 1

				arg_51_1.typewritter:SetDirty()
				arg_51_1:ShowNextGo(true)
			end
		end
	end,
	Play319301014 = function(arg_55_0, arg_55_1)
		arg_55_1.time_ = 0
		arg_55_1.frameCnt_ = 0
		arg_55_1.state_ = "playing"
		arg_55_1.curTalkId_ = 319301014
		arg_55_1.duration_ = 7.266

		local var_55_0 = {
			zh = 3.9,
			ja = 7.266
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
				arg_55_0:Play319301015(arg_55_1)
			end
		end

		function arg_55_1.onSingleLineUpdate_(arg_58_0)
			local var_58_0 = arg_55_1.actors_["1095ui_story"].transform
			local var_58_1 = 0

			if var_58_1 < arg_55_1.time_ and arg_55_1.time_ <= var_58_1 + arg_58_0 then
				arg_55_1.var_.moveOldPos1095ui_story = var_58_0.localPosition
			end

			local var_58_2 = 0.001

			if var_58_1 <= arg_55_1.time_ and arg_55_1.time_ < var_58_1 + var_58_2 then
				local var_58_3 = (arg_55_1.time_ - var_58_1) / var_58_2
				local var_58_4 = Vector3.New(0, -0.98, -6.1)

				var_58_0.localPosition = Vector3.Lerp(arg_55_1.var_.moveOldPos1095ui_story, var_58_4, var_58_3)

				local var_58_5 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_5.x, var_58_5.y, var_58_5.z)

				local var_58_6 = var_58_0.localEulerAngles

				var_58_6.z = 0
				var_58_6.x = 0
				var_58_0.localEulerAngles = var_58_6
			end

			if arg_55_1.time_ >= var_58_1 + var_58_2 and arg_55_1.time_ < var_58_1 + var_58_2 + arg_58_0 then
				var_58_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_58_7 = manager.ui.mainCamera.transform.position - var_58_0.position

				var_58_0.forward = Vector3.New(var_58_7.x, var_58_7.y, var_58_7.z)

				local var_58_8 = var_58_0.localEulerAngles

				var_58_8.z = 0
				var_58_8.x = 0
				var_58_0.localEulerAngles = var_58_8
			end

			local var_58_9 = arg_55_1.actors_["1095ui_story"]
			local var_58_10 = 0

			if var_58_10 < arg_55_1.time_ and arg_55_1.time_ <= var_58_10 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story == nil then
				arg_55_1.var_.characterEffect1095ui_story = var_58_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_58_11 = 0.200000002980232

			if var_58_10 <= arg_55_1.time_ and arg_55_1.time_ < var_58_10 + var_58_11 then
				local var_58_12 = (arg_55_1.time_ - var_58_10) / var_58_11

				if arg_55_1.var_.characterEffect1095ui_story then
					arg_55_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_55_1.time_ >= var_58_10 + var_58_11 and arg_55_1.time_ < var_58_10 + var_58_11 + arg_58_0 and arg_55_1.var_.characterEffect1095ui_story then
				arg_55_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_58_13 = 0

			if var_58_13 < arg_55_1.time_ and arg_55_1.time_ <= var_58_13 + arg_58_0 then
				arg_55_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action2_2")
			end

			local var_58_14 = 0
			local var_58_15 = 0.575

			if var_58_14 < arg_55_1.time_ and arg_55_1.time_ <= var_58_14 + arg_58_0 then
				arg_55_1.talkMaxDuration = 0
				arg_55_1.dialogCg_.alpha = 1

				arg_55_1.dialog_:SetActive(true)
				SetActive(arg_55_1.leftNameGo_, true)

				local var_58_16 = arg_55_1:FormatText(StoryNameCfg[471].name)

				arg_55_1.leftNameTxt_.text = var_58_16

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_55_1.leftNameTxt_.transform)

				arg_55_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_55_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_55_1:RecordName(arg_55_1.leftNameTxt_.text)
				SetActive(arg_55_1.iconTrs_.gameObject, false)
				arg_55_1.callingController_:SetSelectedState("normal")

				local var_58_17 = arg_55_1:GetWordFromCfg(319301014)
				local var_58_18 = arg_55_1:FormatText(var_58_17.content)

				arg_55_1.text_.text = var_58_18

				LuaForUtil.ClearLinePrefixSymbol(arg_55_1.text_)

				local var_58_19 = 23
				local var_58_20 = utf8.len(var_58_18)
				local var_58_21 = var_58_19 <= 0 and var_58_15 or var_58_15 * (var_58_20 / var_58_19)

				if var_58_21 > 0 and var_58_15 < var_58_21 then
					arg_55_1.talkMaxDuration = var_58_21

					if var_58_21 + var_58_14 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_21 + var_58_14
					end
				end

				arg_55_1.text_.text = var_58_18
				arg_55_1.typewritter.percent = 0

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301014", "story_v_out_319301.awb") ~= 0 then
					local var_58_22 = manager.audio:GetVoiceLength("story_v_out_319301", "319301014", "story_v_out_319301.awb") / 1000

					if var_58_22 + var_58_14 > arg_55_1.duration_ then
						arg_55_1.duration_ = var_58_22 + var_58_14
					end

					if var_58_17.prefab_name ~= "" and arg_55_1.actors_[var_58_17.prefab_name] ~= nil then
						local var_58_23 = LuaForUtil.PlayVoiceWithCriLipsync(arg_55_1.actors_[var_58_17.prefab_name].transform, "story_v_out_319301", "319301014", "story_v_out_319301.awb")

						arg_55_1:RecordAudio("319301014", var_58_23)
						arg_55_1:RecordAudio("319301014", var_58_23)
					else
						arg_55_1:AudioAction("play", "voice", "story_v_out_319301", "319301014", "story_v_out_319301.awb")
					end

					arg_55_1:RecordHistoryTalkVoice("story_v_out_319301", "319301014", "story_v_out_319301.awb")
				end

				arg_55_1:RecordContent(arg_55_1.text_.text)
			end

			local var_58_24 = math.max(var_58_15, arg_55_1.talkMaxDuration)

			if var_58_14 <= arg_55_1.time_ and arg_55_1.time_ < var_58_14 + var_58_24 then
				arg_55_1.typewritter.percent = (arg_55_1.time_ - var_58_14) / var_58_24

				arg_55_1.typewritter:SetDirty()
			end

			if arg_55_1.time_ >= var_58_14 + var_58_24 and arg_55_1.time_ < var_58_14 + var_58_24 + arg_58_0 then
				arg_55_1.typewritter.percent = 1

				arg_55_1.typewritter:SetDirty()
				arg_55_1:ShowNextGo(true)
			end
		end
	end,
	Play319301015 = function(arg_59_0, arg_59_1)
		arg_59_1.time_ = 0
		arg_59_1.frameCnt_ = 0
		arg_59_1.state_ = "playing"
		arg_59_1.curTalkId_ = 319301015
		arg_59_1.duration_ = 9

		SetActive(arg_59_1.tipsGo_, false)

		function arg_59_1.onSingleLineFinish_()
			arg_59_1.onSingleLineUpdate_ = nil
			arg_59_1.onSingleLineFinish_ = nil
			arg_59_1.state_ = "waiting"
		end

		function arg_59_1.playNext_(arg_61_0)
			if arg_61_0 == 1 then
				arg_59_0:Play319301016(arg_59_1)
			end
		end

		function arg_59_1.onSingleLineUpdate_(arg_62_0)
			local var_62_0 = 2

			if var_62_0 < arg_59_1.time_ and arg_59_1.time_ <= var_62_0 + arg_62_0 then
				local var_62_1 = manager.ui.mainCamera.transform.localPosition
				local var_62_2 = Vector3.New(0, 0, 10) + Vector3.New(var_62_1.x, var_62_1.y, 0)
				local var_62_3 = arg_59_1.bgs_.A08f

				var_62_3.transform.localPosition = var_62_2
				var_62_3.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_62_4 = var_62_3:GetComponent("SpriteRenderer")

				if var_62_4 and var_62_4.sprite then
					local var_62_5 = (var_62_3.transform.localPosition - var_62_1).z
					local var_62_6 = manager.ui.mainCameraCom_
					local var_62_7 = 2 * var_62_5 * Mathf.Tan(var_62_6.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_62_8 = var_62_7 * var_62_6.aspect
					local var_62_9 = var_62_4.sprite.bounds.size.x
					local var_62_10 = var_62_4.sprite.bounds.size.y
					local var_62_11 = var_62_8 / var_62_9
					local var_62_12 = var_62_7 / var_62_10
					local var_62_13 = var_62_12 < var_62_11 and var_62_11 or var_62_12

					var_62_3.transform.localScale = Vector3.New(var_62_13, var_62_13, 0)
				end

				for iter_62_0, iter_62_1 in pairs(arg_59_1.bgs_) do
					if iter_62_0 ~= "A08f" then
						iter_62_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_62_14 = 0

			if var_62_14 < arg_59_1.time_ and arg_59_1.time_ <= var_62_14 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_15 = 2

			if var_62_14 <= arg_59_1.time_ and arg_59_1.time_ < var_62_14 + var_62_15 then
				local var_62_16 = (arg_59_1.time_ - var_62_14) / var_62_15
				local var_62_17 = Color.New(0, 0, 0)

				var_62_17.a = Mathf.Lerp(0, 1, var_62_16)
				arg_59_1.mask_.color = var_62_17
			end

			if arg_59_1.time_ >= var_62_14 + var_62_15 and arg_59_1.time_ < var_62_14 + var_62_15 + arg_62_0 then
				local var_62_18 = Color.New(0, 0, 0)

				var_62_18.a = 1
				arg_59_1.mask_.color = var_62_18
			end

			local var_62_19 = 2

			if var_62_19 < arg_59_1.time_ and arg_59_1.time_ <= var_62_19 + arg_62_0 then
				arg_59_1.mask_.enabled = true
				arg_59_1.mask_.raycastTarget = true

				arg_59_1:SetGaussion(false)
			end

			local var_62_20 = 2

			if var_62_19 <= arg_59_1.time_ and arg_59_1.time_ < var_62_19 + var_62_20 then
				local var_62_21 = (arg_59_1.time_ - var_62_19) / var_62_20
				local var_62_22 = Color.New(0, 0, 0)

				var_62_22.a = Mathf.Lerp(1, 0, var_62_21)
				arg_59_1.mask_.color = var_62_22
			end

			if arg_59_1.time_ >= var_62_19 + var_62_20 and arg_59_1.time_ < var_62_19 + var_62_20 + arg_62_0 then
				local var_62_23 = Color.New(0, 0, 0)
				local var_62_24 = 0

				arg_59_1.mask_.enabled = false
				var_62_23.a = var_62_24
				arg_59_1.mask_.color = var_62_23
			end

			local var_62_25 = arg_59_1.actors_["1095ui_story"]
			local var_62_26 = 2

			if var_62_26 < arg_59_1.time_ and arg_59_1.time_ <= var_62_26 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story == nil then
				arg_59_1.var_.characterEffect1095ui_story = var_62_25:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_62_27 = 0.200000002980232

			if var_62_26 <= arg_59_1.time_ and arg_59_1.time_ < var_62_26 + var_62_27 then
				local var_62_28 = (arg_59_1.time_ - var_62_26) / var_62_27

				if arg_59_1.var_.characterEffect1095ui_story then
					local var_62_29 = Mathf.Lerp(0, 0.5, var_62_28)

					arg_59_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_59_1.var_.characterEffect1095ui_story.fillRatio = var_62_29
				end
			end

			if arg_59_1.time_ >= var_62_26 + var_62_27 and arg_59_1.time_ < var_62_26 + var_62_27 + arg_62_0 and arg_59_1.var_.characterEffect1095ui_story then
				local var_62_30 = 0.5

				arg_59_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_59_1.var_.characterEffect1095ui_story.fillRatio = var_62_30
			end

			local var_62_31 = arg_59_1.actors_["1095ui_story"].transform
			local var_62_32 = 2

			if var_62_32 < arg_59_1.time_ and arg_59_1.time_ <= var_62_32 + arg_62_0 then
				arg_59_1.var_.moveOldPos1095ui_story = var_62_31.localPosition
			end

			local var_62_33 = 0.001

			if var_62_32 <= arg_59_1.time_ and arg_59_1.time_ < var_62_32 + var_62_33 then
				local var_62_34 = (arg_59_1.time_ - var_62_32) / var_62_33
				local var_62_35 = Vector3.New(0, 100, 0)

				var_62_31.localPosition = Vector3.Lerp(arg_59_1.var_.moveOldPos1095ui_story, var_62_35, var_62_34)

				local var_62_36 = manager.ui.mainCamera.transform.position - var_62_31.position

				var_62_31.forward = Vector3.New(var_62_36.x, var_62_36.y, var_62_36.z)

				local var_62_37 = var_62_31.localEulerAngles

				var_62_37.z = 0
				var_62_37.x = 0
				var_62_31.localEulerAngles = var_62_37
			end

			if arg_59_1.time_ >= var_62_32 + var_62_33 and arg_59_1.time_ < var_62_32 + var_62_33 + arg_62_0 then
				var_62_31.localPosition = Vector3.New(0, 100, 0)

				local var_62_38 = manager.ui.mainCamera.transform.position - var_62_31.position

				var_62_31.forward = Vector3.New(var_62_38.x, var_62_38.y, var_62_38.z)

				local var_62_39 = var_62_31.localEulerAngles

				var_62_39.z = 0
				var_62_39.x = 0
				var_62_31.localEulerAngles = var_62_39
			end

			if arg_59_1.frameCnt_ <= 1 then
				arg_59_1.dialog_:SetActive(false)
			end

			local var_62_40 = 4
			local var_62_41 = 1.15

			if var_62_40 < arg_59_1.time_ and arg_59_1.time_ <= var_62_40 + arg_62_0 then
				arg_59_1.talkMaxDuration = 0

				arg_59_1.dialog_:SetActive(true)

				local var_62_42 = LeanTween.value(arg_59_1.dialog_, 0, 1, 0.3)

				var_62_42:setOnUpdate(LuaHelper.FloatAction(function(arg_63_0)
					arg_59_1.dialogCg_.alpha = arg_63_0
				end))
				var_62_42:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_59_1.dialog_)
					var_62_42:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_59_1.duration_ = arg_59_1.duration_ + 0.3

				SetActive(arg_59_1.leftNameGo_, false)

				arg_59_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_59_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_59_1:RecordName(arg_59_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_59_1.iconTrs_.gameObject, false)
				arg_59_1.callingController_:SetSelectedState("normal")

				local var_62_43 = arg_59_1:GetWordFromCfg(319301015)
				local var_62_44 = arg_59_1:FormatText(var_62_43.content)

				arg_59_1.text_.text = var_62_44

				LuaForUtil.ClearLinePrefixSymbol(arg_59_1.text_)

				local var_62_45 = 46
				local var_62_46 = utf8.len(var_62_44)
				local var_62_47 = var_62_45 <= 0 and var_62_41 or var_62_41 * (var_62_46 / var_62_45)

				if var_62_47 > 0 and var_62_41 < var_62_47 then
					arg_59_1.talkMaxDuration = var_62_47
					var_62_40 = var_62_40 + 0.3

					if var_62_47 + var_62_40 > arg_59_1.duration_ then
						arg_59_1.duration_ = var_62_47 + var_62_40
					end
				end

				arg_59_1.text_.text = var_62_44
				arg_59_1.typewritter.percent = 0

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(false)
				arg_59_1:RecordContent(arg_59_1.text_.text)
			end

			local var_62_48 = var_62_40 + 0.3
			local var_62_49 = math.max(var_62_41, arg_59_1.talkMaxDuration)

			if var_62_48 <= arg_59_1.time_ and arg_59_1.time_ < var_62_48 + var_62_49 then
				arg_59_1.typewritter.percent = (arg_59_1.time_ - var_62_48) / var_62_49

				arg_59_1.typewritter:SetDirty()
			end

			if arg_59_1.time_ >= var_62_48 + var_62_49 and arg_59_1.time_ < var_62_48 + var_62_49 + arg_62_0 then
				arg_59_1.typewritter.percent = 1

				arg_59_1.typewritter:SetDirty()
				arg_59_1:ShowNextGo(true)
			end
		end
	end,
	Play319301016 = function(arg_65_0, arg_65_1)
		arg_65_1.time_ = 0
		arg_65_1.frameCnt_ = 0
		arg_65_1.state_ = "playing"
		arg_65_1.curTalkId_ = 319301016
		arg_65_1.duration_ = 5

		SetActive(arg_65_1.tipsGo_, false)

		function arg_65_1.onSingleLineFinish_()
			arg_65_1.onSingleLineUpdate_ = nil
			arg_65_1.onSingleLineFinish_ = nil
			arg_65_1.state_ = "waiting"
		end

		function arg_65_1.playNext_(arg_67_0)
			if arg_67_0 == 1 then
				arg_65_0:Play319301017(arg_65_1)
			end
		end

		function arg_65_1.onSingleLineUpdate_(arg_68_0)
			local var_68_0 = 0
			local var_68_1 = 1.65

			if var_68_0 < arg_65_1.time_ and arg_65_1.time_ <= var_68_0 + arg_68_0 then
				arg_65_1.talkMaxDuration = 0
				arg_65_1.dialogCg_.alpha = 1

				arg_65_1.dialog_:SetActive(true)
				SetActive(arg_65_1.leftNameGo_, false)

				arg_65_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_65_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_65_1:RecordName(arg_65_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_65_1.iconTrs_.gameObject, false)
				arg_65_1.callingController_:SetSelectedState("normal")

				local var_68_2 = arg_65_1:GetWordFromCfg(319301016)
				local var_68_3 = arg_65_1:FormatText(var_68_2.content)

				arg_65_1.text_.text = var_68_3

				LuaForUtil.ClearLinePrefixSymbol(arg_65_1.text_)

				local var_68_4 = 66
				local var_68_5 = utf8.len(var_68_3)
				local var_68_6 = var_68_4 <= 0 and var_68_1 or var_68_1 * (var_68_5 / var_68_4)

				if var_68_6 > 0 and var_68_1 < var_68_6 then
					arg_65_1.talkMaxDuration = var_68_6

					if var_68_6 + var_68_0 > arg_65_1.duration_ then
						arg_65_1.duration_ = var_68_6 + var_68_0
					end
				end

				arg_65_1.text_.text = var_68_3
				arg_65_1.typewritter.percent = 0

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(false)
				arg_65_1:RecordContent(arg_65_1.text_.text)
			end

			local var_68_7 = math.max(var_68_1, arg_65_1.talkMaxDuration)

			if var_68_0 <= arg_65_1.time_ and arg_65_1.time_ < var_68_0 + var_68_7 then
				arg_65_1.typewritter.percent = (arg_65_1.time_ - var_68_0) / var_68_7

				arg_65_1.typewritter:SetDirty()
			end

			if arg_65_1.time_ >= var_68_0 + var_68_7 and arg_65_1.time_ < var_68_0 + var_68_7 + arg_68_0 then
				arg_65_1.typewritter.percent = 1

				arg_65_1.typewritter:SetDirty()
				arg_65_1:ShowNextGo(true)
			end
		end
	end,
	Play319301017 = function(arg_69_0, arg_69_1)
		arg_69_1.time_ = 0
		arg_69_1.frameCnt_ = 0
		arg_69_1.state_ = "playing"
		arg_69_1.curTalkId_ = 319301017
		arg_69_1.duration_ = 7.3

		local var_69_0 = {
			zh = 6.366,
			ja = 7.3
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
				arg_69_0:Play319301018(arg_69_1)
			end
		end

		function arg_69_1.onSingleLineUpdate_(arg_72_0)
			local var_72_0 = arg_69_1.actors_["1095ui_story"].transform
			local var_72_1 = 0

			if var_72_1 < arg_69_1.time_ and arg_69_1.time_ <= var_72_1 + arg_72_0 then
				arg_69_1.var_.moveOldPos1095ui_story = var_72_0.localPosition
			end

			local var_72_2 = 0.001

			if var_72_1 <= arg_69_1.time_ and arg_69_1.time_ < var_72_1 + var_72_2 then
				local var_72_3 = (arg_69_1.time_ - var_72_1) / var_72_2
				local var_72_4 = Vector3.New(0, -0.98, -6.1)

				var_72_0.localPosition = Vector3.Lerp(arg_69_1.var_.moveOldPos1095ui_story, var_72_4, var_72_3)

				local var_72_5 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_5.x, var_72_5.y, var_72_5.z)

				local var_72_6 = var_72_0.localEulerAngles

				var_72_6.z = 0
				var_72_6.x = 0
				var_72_0.localEulerAngles = var_72_6
			end

			if arg_69_1.time_ >= var_72_1 + var_72_2 and arg_69_1.time_ < var_72_1 + var_72_2 + arg_72_0 then
				var_72_0.localPosition = Vector3.New(0, -0.98, -6.1)

				local var_72_7 = manager.ui.mainCamera.transform.position - var_72_0.position

				var_72_0.forward = Vector3.New(var_72_7.x, var_72_7.y, var_72_7.z)

				local var_72_8 = var_72_0.localEulerAngles

				var_72_8.z = 0
				var_72_8.x = 0
				var_72_0.localEulerAngles = var_72_8
			end

			local var_72_9 = arg_69_1.actors_["1095ui_story"]
			local var_72_10 = 0

			if var_72_10 < arg_69_1.time_ and arg_69_1.time_ <= var_72_10 + arg_72_0 and arg_69_1.var_.characterEffect1095ui_story == nil then
				arg_69_1.var_.characterEffect1095ui_story = var_72_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_72_11 = 0.200000002980232

			if var_72_10 <= arg_69_1.time_ and arg_69_1.time_ < var_72_10 + var_72_11 then
				local var_72_12 = (arg_69_1.time_ - var_72_10) / var_72_11

				if arg_69_1.var_.characterEffect1095ui_story then
					arg_69_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_69_1.time_ >= var_72_10 + var_72_11 and arg_69_1.time_ < var_72_10 + var_72_11 + arg_72_0 and arg_69_1.var_.characterEffect1095ui_story then
				arg_69_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_72_13 = 0

			if var_72_13 < arg_69_1.time_ and arg_69_1.time_ <= var_72_13 + arg_72_0 then
				arg_69_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action1_1")
			end

			local var_72_14 = 0

			if var_72_14 < arg_69_1.time_ and arg_69_1.time_ <= var_72_14 + arg_72_0 then
				arg_69_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_72_15 = 0
			local var_72_16 = 0.775

			if var_72_15 < arg_69_1.time_ and arg_69_1.time_ <= var_72_15 + arg_72_0 then
				arg_69_1.talkMaxDuration = 0
				arg_69_1.dialogCg_.alpha = 1

				arg_69_1.dialog_:SetActive(true)
				SetActive(arg_69_1.leftNameGo_, true)

				local var_72_17 = arg_69_1:FormatText(StoryNameCfg[471].name)

				arg_69_1.leftNameTxt_.text = var_72_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_69_1.leftNameTxt_.transform)

				arg_69_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_69_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_69_1:RecordName(arg_69_1.leftNameTxt_.text)
				SetActive(arg_69_1.iconTrs_.gameObject, false)
				arg_69_1.callingController_:SetSelectedState("normal")

				local var_72_18 = arg_69_1:GetWordFromCfg(319301017)
				local var_72_19 = arg_69_1:FormatText(var_72_18.content)

				arg_69_1.text_.text = var_72_19

				LuaForUtil.ClearLinePrefixSymbol(arg_69_1.text_)

				local var_72_20 = 31
				local var_72_21 = utf8.len(var_72_19)
				local var_72_22 = var_72_20 <= 0 and var_72_16 or var_72_16 * (var_72_21 / var_72_20)

				if var_72_22 > 0 and var_72_16 < var_72_22 then
					arg_69_1.talkMaxDuration = var_72_22

					if var_72_22 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_22 + var_72_15
					end
				end

				arg_69_1.text_.text = var_72_19
				arg_69_1.typewritter.percent = 0

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301017", "story_v_out_319301.awb") ~= 0 then
					local var_72_23 = manager.audio:GetVoiceLength("story_v_out_319301", "319301017", "story_v_out_319301.awb") / 1000

					if var_72_23 + var_72_15 > arg_69_1.duration_ then
						arg_69_1.duration_ = var_72_23 + var_72_15
					end

					if var_72_18.prefab_name ~= "" and arg_69_1.actors_[var_72_18.prefab_name] ~= nil then
						local var_72_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_69_1.actors_[var_72_18.prefab_name].transform, "story_v_out_319301", "319301017", "story_v_out_319301.awb")

						arg_69_1:RecordAudio("319301017", var_72_24)
						arg_69_1:RecordAudio("319301017", var_72_24)
					else
						arg_69_1:AudioAction("play", "voice", "story_v_out_319301", "319301017", "story_v_out_319301.awb")
					end

					arg_69_1:RecordHistoryTalkVoice("story_v_out_319301", "319301017", "story_v_out_319301.awb")
				end

				arg_69_1:RecordContent(arg_69_1.text_.text)
			end

			local var_72_25 = math.max(var_72_16, arg_69_1.talkMaxDuration)

			if var_72_15 <= arg_69_1.time_ and arg_69_1.time_ < var_72_15 + var_72_25 then
				arg_69_1.typewritter.percent = (arg_69_1.time_ - var_72_15) / var_72_25

				arg_69_1.typewritter:SetDirty()
			end

			if arg_69_1.time_ >= var_72_15 + var_72_25 and arg_69_1.time_ < var_72_15 + var_72_25 + arg_72_0 then
				arg_69_1.typewritter.percent = 1

				arg_69_1.typewritter:SetDirty()
				arg_69_1:ShowNextGo(true)
			end
		end
	end,
	Play319301018 = function(arg_73_0, arg_73_1)
		arg_73_1.time_ = 0
		arg_73_1.frameCnt_ = 0
		arg_73_1.state_ = "playing"
		arg_73_1.curTalkId_ = 319301018
		arg_73_1.duration_ = 10.766

		local var_73_0 = {
			zh = 5.733,
			ja = 10.766
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
				arg_73_0:Play319301019(arg_73_1)
			end
		end

		function arg_73_1.onSingleLineUpdate_(arg_76_0)
			local var_76_0 = "10079ui_story"

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

			local var_76_4 = arg_73_1.actors_["10079ui_story"].transform
			local var_76_5 = 0

			if var_76_5 < arg_73_1.time_ and arg_73_1.time_ <= var_76_5 + arg_76_0 then
				arg_73_1.var_.moveOldPos10079ui_story = var_76_4.localPosition
			end

			local var_76_6 = 0.001

			if var_76_5 <= arg_73_1.time_ and arg_73_1.time_ < var_76_5 + var_76_6 then
				local var_76_7 = (arg_73_1.time_ - var_76_5) / var_76_6
				local var_76_8 = Vector3.New(0.7, -0.95, -6.05)

				var_76_4.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos10079ui_story, var_76_8, var_76_7)

				local var_76_9 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_9.x, var_76_9.y, var_76_9.z)

				local var_76_10 = var_76_4.localEulerAngles

				var_76_10.z = 0
				var_76_10.x = 0
				var_76_4.localEulerAngles = var_76_10
			end

			if arg_73_1.time_ >= var_76_5 + var_76_6 and arg_73_1.time_ < var_76_5 + var_76_6 + arg_76_0 then
				var_76_4.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_76_11 = manager.ui.mainCamera.transform.position - var_76_4.position

				var_76_4.forward = Vector3.New(var_76_11.x, var_76_11.y, var_76_11.z)

				local var_76_12 = var_76_4.localEulerAngles

				var_76_12.z = 0
				var_76_12.x = 0
				var_76_4.localEulerAngles = var_76_12
			end

			local var_76_13 = arg_73_1.actors_["10079ui_story"]
			local var_76_14 = 0

			if var_76_14 < arg_73_1.time_ and arg_73_1.time_ <= var_76_14 + arg_76_0 and arg_73_1.var_.characterEffect10079ui_story == nil then
				arg_73_1.var_.characterEffect10079ui_story = var_76_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_15 = 0.200000002980232

			if var_76_14 <= arg_73_1.time_ and arg_73_1.time_ < var_76_14 + var_76_15 then
				local var_76_16 = (arg_73_1.time_ - var_76_14) / var_76_15

				if arg_73_1.var_.characterEffect10079ui_story then
					arg_73_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_73_1.time_ >= var_76_14 + var_76_15 and arg_73_1.time_ < var_76_14 + var_76_15 + arg_76_0 and arg_73_1.var_.characterEffect10079ui_story then
				arg_73_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_76_17 = 0

			if var_76_17 < arg_73_1.time_ and arg_73_1.time_ <= var_76_17 + arg_76_0 then
				arg_73_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_1")
			end

			local var_76_18 = 0

			if var_76_18 < arg_73_1.time_ and arg_73_1.time_ <= var_76_18 + arg_76_0 then
				arg_73_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_76_19 = arg_73_1.actors_["1095ui_story"].transform
			local var_76_20 = 0

			if var_76_20 < arg_73_1.time_ and arg_73_1.time_ <= var_76_20 + arg_76_0 then
				arg_73_1.var_.moveOldPos1095ui_story = var_76_19.localPosition
			end

			local var_76_21 = 0.001

			if var_76_20 <= arg_73_1.time_ and arg_73_1.time_ < var_76_20 + var_76_21 then
				local var_76_22 = (arg_73_1.time_ - var_76_20) / var_76_21
				local var_76_23 = Vector3.New(-0.7, -0.98, -6.1)

				var_76_19.localPosition = Vector3.Lerp(arg_73_1.var_.moveOldPos1095ui_story, var_76_23, var_76_22)

				local var_76_24 = manager.ui.mainCamera.transform.position - var_76_19.position

				var_76_19.forward = Vector3.New(var_76_24.x, var_76_24.y, var_76_24.z)

				local var_76_25 = var_76_19.localEulerAngles

				var_76_25.z = 0
				var_76_25.x = 0
				var_76_19.localEulerAngles = var_76_25
			end

			if arg_73_1.time_ >= var_76_20 + var_76_21 and arg_73_1.time_ < var_76_20 + var_76_21 + arg_76_0 then
				var_76_19.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_76_26 = manager.ui.mainCamera.transform.position - var_76_19.position

				var_76_19.forward = Vector3.New(var_76_26.x, var_76_26.y, var_76_26.z)

				local var_76_27 = var_76_19.localEulerAngles

				var_76_27.z = 0
				var_76_27.x = 0
				var_76_19.localEulerAngles = var_76_27
			end

			local var_76_28 = arg_73_1.actors_["1095ui_story"]
			local var_76_29 = 0

			if var_76_29 < arg_73_1.time_ and arg_73_1.time_ <= var_76_29 + arg_76_0 and arg_73_1.var_.characterEffect1095ui_story == nil then
				arg_73_1.var_.characterEffect1095ui_story = var_76_28:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_76_30 = 0.200000002980232

			if var_76_29 <= arg_73_1.time_ and arg_73_1.time_ < var_76_29 + var_76_30 then
				local var_76_31 = (arg_73_1.time_ - var_76_29) / var_76_30

				if arg_73_1.var_.characterEffect1095ui_story then
					local var_76_32 = Mathf.Lerp(0, 0.5, var_76_31)

					arg_73_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_73_1.var_.characterEffect1095ui_story.fillRatio = var_76_32
				end
			end

			if arg_73_1.time_ >= var_76_29 + var_76_30 and arg_73_1.time_ < var_76_29 + var_76_30 + arg_76_0 and arg_73_1.var_.characterEffect1095ui_story then
				local var_76_33 = 0.5

				arg_73_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_73_1.var_.characterEffect1095ui_story.fillRatio = var_76_33
			end

			local var_76_34 = 0
			local var_76_35 = 0.45

			if var_76_34 < arg_73_1.time_ and arg_73_1.time_ <= var_76_34 + arg_76_0 then
				arg_73_1.talkMaxDuration = 0
				arg_73_1.dialogCg_.alpha = 1

				arg_73_1.dialog_:SetActive(true)
				SetActive(arg_73_1.leftNameGo_, true)

				local var_76_36 = arg_73_1:FormatText(StoryNameCfg[6].name)

				arg_73_1.leftNameTxt_.text = var_76_36

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_73_1.leftNameTxt_.transform)

				arg_73_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_73_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_73_1:RecordName(arg_73_1.leftNameTxt_.text)
				SetActive(arg_73_1.iconTrs_.gameObject, false)
				arg_73_1.callingController_:SetSelectedState("normal")

				local var_76_37 = arg_73_1:GetWordFromCfg(319301018)
				local var_76_38 = arg_73_1:FormatText(var_76_37.content)

				arg_73_1.text_.text = var_76_38

				LuaForUtil.ClearLinePrefixSymbol(arg_73_1.text_)

				local var_76_39 = 18
				local var_76_40 = utf8.len(var_76_38)
				local var_76_41 = var_76_39 <= 0 and var_76_35 or var_76_35 * (var_76_40 / var_76_39)

				if var_76_41 > 0 and var_76_35 < var_76_41 then
					arg_73_1.talkMaxDuration = var_76_41

					if var_76_41 + var_76_34 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_41 + var_76_34
					end
				end

				arg_73_1.text_.text = var_76_38
				arg_73_1.typewritter.percent = 0

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301018", "story_v_out_319301.awb") ~= 0 then
					local var_76_42 = manager.audio:GetVoiceLength("story_v_out_319301", "319301018", "story_v_out_319301.awb") / 1000

					if var_76_42 + var_76_34 > arg_73_1.duration_ then
						arg_73_1.duration_ = var_76_42 + var_76_34
					end

					if var_76_37.prefab_name ~= "" and arg_73_1.actors_[var_76_37.prefab_name] ~= nil then
						local var_76_43 = LuaForUtil.PlayVoiceWithCriLipsync(arg_73_1.actors_[var_76_37.prefab_name].transform, "story_v_out_319301", "319301018", "story_v_out_319301.awb")

						arg_73_1:RecordAudio("319301018", var_76_43)
						arg_73_1:RecordAudio("319301018", var_76_43)
					else
						arg_73_1:AudioAction("play", "voice", "story_v_out_319301", "319301018", "story_v_out_319301.awb")
					end

					arg_73_1:RecordHistoryTalkVoice("story_v_out_319301", "319301018", "story_v_out_319301.awb")
				end

				arg_73_1:RecordContent(arg_73_1.text_.text)
			end

			local var_76_44 = math.max(var_76_35, arg_73_1.talkMaxDuration)

			if var_76_34 <= arg_73_1.time_ and arg_73_1.time_ < var_76_34 + var_76_44 then
				arg_73_1.typewritter.percent = (arg_73_1.time_ - var_76_34) / var_76_44

				arg_73_1.typewritter:SetDirty()
			end

			if arg_73_1.time_ >= var_76_34 + var_76_44 and arg_73_1.time_ < var_76_34 + var_76_44 + arg_76_0 then
				arg_73_1.typewritter.percent = 1

				arg_73_1.typewritter:SetDirty()
				arg_73_1:ShowNextGo(true)
			end
		end
	end,
	Play319301019 = function(arg_77_0, arg_77_1)
		arg_77_1.time_ = 0
		arg_77_1.frameCnt_ = 0
		arg_77_1.state_ = "playing"
		arg_77_1.curTalkId_ = 319301019
		arg_77_1.duration_ = 6.6

		local var_77_0 = {
			zh = 1.366,
			ja = 6.6
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
				arg_77_0:Play319301020(arg_77_1)
			end
		end

		function arg_77_1.onSingleLineUpdate_(arg_80_0)
			local var_80_0 = arg_77_1.actors_["10079ui_story"]
			local var_80_1 = 0

			if var_80_1 < arg_77_1.time_ and arg_77_1.time_ <= var_80_1 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story == nil then
				arg_77_1.var_.characterEffect10079ui_story = var_80_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_2 = 0.200000002980232

			if var_80_1 <= arg_77_1.time_ and arg_77_1.time_ < var_80_1 + var_80_2 then
				local var_80_3 = (arg_77_1.time_ - var_80_1) / var_80_2

				if arg_77_1.var_.characterEffect10079ui_story then
					local var_80_4 = Mathf.Lerp(0, 0.5, var_80_3)

					arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_4
				end
			end

			if arg_77_1.time_ >= var_80_1 + var_80_2 and arg_77_1.time_ < var_80_1 + var_80_2 + arg_80_0 and arg_77_1.var_.characterEffect10079ui_story then
				local var_80_5 = 0.5

				arg_77_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_77_1.var_.characterEffect10079ui_story.fillRatio = var_80_5
			end

			local var_80_6 = arg_77_1.actors_["1095ui_story"]
			local var_80_7 = 0

			if var_80_7 < arg_77_1.time_ and arg_77_1.time_ <= var_80_7 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story == nil then
				arg_77_1.var_.characterEffect1095ui_story = var_80_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_80_8 = 0.200000002980232

			if var_80_7 <= arg_77_1.time_ and arg_77_1.time_ < var_80_7 + var_80_8 then
				local var_80_9 = (arg_77_1.time_ - var_80_7) / var_80_8

				if arg_77_1.var_.characterEffect1095ui_story then
					arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_77_1.time_ >= var_80_7 + var_80_8 and arg_77_1.time_ < var_80_7 + var_80_8 + arg_80_0 and arg_77_1.var_.characterEffect1095ui_story then
				arg_77_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_80_10 = 0
			local var_80_11 = 0.175

			if var_80_10 < arg_77_1.time_ and arg_77_1.time_ <= var_80_10 + arg_80_0 then
				arg_77_1.talkMaxDuration = 0
				arg_77_1.dialogCg_.alpha = 1

				arg_77_1.dialog_:SetActive(true)
				SetActive(arg_77_1.leftNameGo_, true)

				local var_80_12 = arg_77_1:FormatText(StoryNameCfg[471].name)

				arg_77_1.leftNameTxt_.text = var_80_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_77_1.leftNameTxt_.transform)

				arg_77_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_77_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_77_1:RecordName(arg_77_1.leftNameTxt_.text)
				SetActive(arg_77_1.iconTrs_.gameObject, false)
				arg_77_1.callingController_:SetSelectedState("normal")

				local var_80_13 = arg_77_1:GetWordFromCfg(319301019)
				local var_80_14 = arg_77_1:FormatText(var_80_13.content)

				arg_77_1.text_.text = var_80_14

				LuaForUtil.ClearLinePrefixSymbol(arg_77_1.text_)

				local var_80_15 = 7
				local var_80_16 = utf8.len(var_80_14)
				local var_80_17 = var_80_15 <= 0 and var_80_11 or var_80_11 * (var_80_16 / var_80_15)

				if var_80_17 > 0 and var_80_11 < var_80_17 then
					arg_77_1.talkMaxDuration = var_80_17

					if var_80_17 + var_80_10 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_17 + var_80_10
					end
				end

				arg_77_1.text_.text = var_80_14
				arg_77_1.typewritter.percent = 0

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301019", "story_v_out_319301.awb") ~= 0 then
					local var_80_18 = manager.audio:GetVoiceLength("story_v_out_319301", "319301019", "story_v_out_319301.awb") / 1000

					if var_80_18 + var_80_10 > arg_77_1.duration_ then
						arg_77_1.duration_ = var_80_18 + var_80_10
					end

					if var_80_13.prefab_name ~= "" and arg_77_1.actors_[var_80_13.prefab_name] ~= nil then
						local var_80_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_77_1.actors_[var_80_13.prefab_name].transform, "story_v_out_319301", "319301019", "story_v_out_319301.awb")

						arg_77_1:RecordAudio("319301019", var_80_19)
						arg_77_1:RecordAudio("319301019", var_80_19)
					else
						arg_77_1:AudioAction("play", "voice", "story_v_out_319301", "319301019", "story_v_out_319301.awb")
					end

					arg_77_1:RecordHistoryTalkVoice("story_v_out_319301", "319301019", "story_v_out_319301.awb")
				end

				arg_77_1:RecordContent(arg_77_1.text_.text)
			end

			local var_80_20 = math.max(var_80_11, arg_77_1.talkMaxDuration)

			if var_80_10 <= arg_77_1.time_ and arg_77_1.time_ < var_80_10 + var_80_20 then
				arg_77_1.typewritter.percent = (arg_77_1.time_ - var_80_10) / var_80_20

				arg_77_1.typewritter:SetDirty()
			end

			if arg_77_1.time_ >= var_80_10 + var_80_20 and arg_77_1.time_ < var_80_10 + var_80_20 + arg_80_0 then
				arg_77_1.typewritter.percent = 1

				arg_77_1.typewritter:SetDirty()
				arg_77_1:ShowNextGo(true)
			end
		end
	end,
	Play319301020 = function(arg_81_0, arg_81_1)
		arg_81_1.time_ = 0
		arg_81_1.frameCnt_ = 0
		arg_81_1.state_ = "playing"
		arg_81_1.curTalkId_ = 319301020
		arg_81_1.duration_ = 12.666

		local var_81_0 = {
			zh = 7.766,
			ja = 12.666
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
				arg_81_0:Play319301021(arg_81_1)
			end
		end

		function arg_81_1.onSingleLineUpdate_(arg_84_0)
			local var_84_0 = arg_81_1.actors_["10079ui_story"]
			local var_84_1 = 0

			if var_84_1 < arg_81_1.time_ and arg_81_1.time_ <= var_84_1 + arg_84_0 and arg_81_1.var_.characterEffect10079ui_story == nil then
				arg_81_1.var_.characterEffect10079ui_story = var_84_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_2 = 0.200000002980232

			if var_84_1 <= arg_81_1.time_ and arg_81_1.time_ < var_84_1 + var_84_2 then
				local var_84_3 = (arg_81_1.time_ - var_84_1) / var_84_2

				if arg_81_1.var_.characterEffect10079ui_story then
					arg_81_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_81_1.time_ >= var_84_1 + var_84_2 and arg_81_1.time_ < var_84_1 + var_84_2 + arg_84_0 and arg_81_1.var_.characterEffect10079ui_story then
				arg_81_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_84_4 = arg_81_1.actors_["1095ui_story"]
			local var_84_5 = 0

			if var_84_5 < arg_81_1.time_ and arg_81_1.time_ <= var_84_5 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story == nil then
				arg_81_1.var_.characterEffect1095ui_story = var_84_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_84_6 = 0.200000002980232

			if var_84_5 <= arg_81_1.time_ and arg_81_1.time_ < var_84_5 + var_84_6 then
				local var_84_7 = (arg_81_1.time_ - var_84_5) / var_84_6

				if arg_81_1.var_.characterEffect1095ui_story then
					local var_84_8 = Mathf.Lerp(0, 0.5, var_84_7)

					arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_8
				end
			end

			if arg_81_1.time_ >= var_84_5 + var_84_6 and arg_81_1.time_ < var_84_5 + var_84_6 + arg_84_0 and arg_81_1.var_.characterEffect1095ui_story then
				local var_84_9 = 0.5

				arg_81_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_81_1.var_.characterEffect1095ui_story.fillRatio = var_84_9
			end

			local var_84_10 = 0
			local var_84_11 = 0.85

			if var_84_10 < arg_81_1.time_ and arg_81_1.time_ <= var_84_10 + arg_84_0 then
				arg_81_1.talkMaxDuration = 0
				arg_81_1.dialogCg_.alpha = 1

				arg_81_1.dialog_:SetActive(true)
				SetActive(arg_81_1.leftNameGo_, true)

				local var_84_12 = arg_81_1:FormatText(StoryNameCfg[6].name)

				arg_81_1.leftNameTxt_.text = var_84_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_81_1.leftNameTxt_.transform)

				arg_81_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_81_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_81_1:RecordName(arg_81_1.leftNameTxt_.text)
				SetActive(arg_81_1.iconTrs_.gameObject, false)
				arg_81_1.callingController_:SetSelectedState("normal")

				local var_84_13 = arg_81_1:GetWordFromCfg(319301020)
				local var_84_14 = arg_81_1:FormatText(var_84_13.content)

				arg_81_1.text_.text = var_84_14

				LuaForUtil.ClearLinePrefixSymbol(arg_81_1.text_)

				local var_84_15 = 34
				local var_84_16 = utf8.len(var_84_14)
				local var_84_17 = var_84_15 <= 0 and var_84_11 or var_84_11 * (var_84_16 / var_84_15)

				if var_84_17 > 0 and var_84_11 < var_84_17 then
					arg_81_1.talkMaxDuration = var_84_17

					if var_84_17 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_17 + var_84_10
					end
				end

				arg_81_1.text_.text = var_84_14
				arg_81_1.typewritter.percent = 0

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301020", "story_v_out_319301.awb") ~= 0 then
					local var_84_18 = manager.audio:GetVoiceLength("story_v_out_319301", "319301020", "story_v_out_319301.awb") / 1000

					if var_84_18 + var_84_10 > arg_81_1.duration_ then
						arg_81_1.duration_ = var_84_18 + var_84_10
					end

					if var_84_13.prefab_name ~= "" and arg_81_1.actors_[var_84_13.prefab_name] ~= nil then
						local var_84_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_81_1.actors_[var_84_13.prefab_name].transform, "story_v_out_319301", "319301020", "story_v_out_319301.awb")

						arg_81_1:RecordAudio("319301020", var_84_19)
						arg_81_1:RecordAudio("319301020", var_84_19)
					else
						arg_81_1:AudioAction("play", "voice", "story_v_out_319301", "319301020", "story_v_out_319301.awb")
					end

					arg_81_1:RecordHistoryTalkVoice("story_v_out_319301", "319301020", "story_v_out_319301.awb")
				end

				arg_81_1:RecordContent(arg_81_1.text_.text)
			end

			local var_84_20 = math.max(var_84_11, arg_81_1.talkMaxDuration)

			if var_84_10 <= arg_81_1.time_ and arg_81_1.time_ < var_84_10 + var_84_20 then
				arg_81_1.typewritter.percent = (arg_81_1.time_ - var_84_10) / var_84_20

				arg_81_1.typewritter:SetDirty()
			end

			if arg_81_1.time_ >= var_84_10 + var_84_20 and arg_81_1.time_ < var_84_10 + var_84_20 + arg_84_0 then
				arg_81_1.typewritter.percent = 1

				arg_81_1.typewritter:SetDirty()
				arg_81_1:ShowNextGo(true)
			end
		end
	end,
	Play319301021 = function(arg_85_0, arg_85_1)
		arg_85_1.time_ = 0
		arg_85_1.frameCnt_ = 0
		arg_85_1.state_ = "playing"
		arg_85_1.curTalkId_ = 319301021
		arg_85_1.duration_ = 11.233

		local var_85_0 = {
			zh = 10.066,
			ja = 11.233
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
				arg_85_0:Play319301022(arg_85_1)
			end
		end

		function arg_85_1.onSingleLineUpdate_(arg_88_0)
			local var_88_0 = 0

			if var_88_0 < arg_85_1.time_ and arg_85_1.time_ <= var_88_0 + arg_88_0 then
				arg_85_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_88_1 = 0
			local var_88_2 = 1.125

			if var_88_1 < arg_85_1.time_ and arg_85_1.time_ <= var_88_1 + arg_88_0 then
				arg_85_1.talkMaxDuration = 0
				arg_85_1.dialogCg_.alpha = 1

				arg_85_1.dialog_:SetActive(true)
				SetActive(arg_85_1.leftNameGo_, true)

				local var_88_3 = arg_85_1:FormatText(StoryNameCfg[6].name)

				arg_85_1.leftNameTxt_.text = var_88_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_85_1.leftNameTxt_.transform)

				arg_85_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_85_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_85_1:RecordName(arg_85_1.leftNameTxt_.text)
				SetActive(arg_85_1.iconTrs_.gameObject, false)
				arg_85_1.callingController_:SetSelectedState("normal")

				local var_88_4 = arg_85_1:GetWordFromCfg(319301021)
				local var_88_5 = arg_85_1:FormatText(var_88_4.content)

				arg_85_1.text_.text = var_88_5

				LuaForUtil.ClearLinePrefixSymbol(arg_85_1.text_)

				local var_88_6 = 45
				local var_88_7 = utf8.len(var_88_5)
				local var_88_8 = var_88_6 <= 0 and var_88_2 or var_88_2 * (var_88_7 / var_88_6)

				if var_88_8 > 0 and var_88_2 < var_88_8 then
					arg_85_1.talkMaxDuration = var_88_8

					if var_88_8 + var_88_1 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_8 + var_88_1
					end
				end

				arg_85_1.text_.text = var_88_5
				arg_85_1.typewritter.percent = 0

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301021", "story_v_out_319301.awb") ~= 0 then
					local var_88_9 = manager.audio:GetVoiceLength("story_v_out_319301", "319301021", "story_v_out_319301.awb") / 1000

					if var_88_9 + var_88_1 > arg_85_1.duration_ then
						arg_85_1.duration_ = var_88_9 + var_88_1
					end

					if var_88_4.prefab_name ~= "" and arg_85_1.actors_[var_88_4.prefab_name] ~= nil then
						local var_88_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_85_1.actors_[var_88_4.prefab_name].transform, "story_v_out_319301", "319301021", "story_v_out_319301.awb")

						arg_85_1:RecordAudio("319301021", var_88_10)
						arg_85_1:RecordAudio("319301021", var_88_10)
					else
						arg_85_1:AudioAction("play", "voice", "story_v_out_319301", "319301021", "story_v_out_319301.awb")
					end

					arg_85_1:RecordHistoryTalkVoice("story_v_out_319301", "319301021", "story_v_out_319301.awb")
				end

				arg_85_1:RecordContent(arg_85_1.text_.text)
			end

			local var_88_11 = math.max(var_88_2, arg_85_1.talkMaxDuration)

			if var_88_1 <= arg_85_1.time_ and arg_85_1.time_ < var_88_1 + var_88_11 then
				arg_85_1.typewritter.percent = (arg_85_1.time_ - var_88_1) / var_88_11

				arg_85_1.typewritter:SetDirty()
			end

			if arg_85_1.time_ >= var_88_1 + var_88_11 and arg_85_1.time_ < var_88_1 + var_88_11 + arg_88_0 then
				arg_85_1.typewritter.percent = 1

				arg_85_1.typewritter:SetDirty()
				arg_85_1:ShowNextGo(true)
			end
		end
	end,
	Play319301022 = function(arg_89_0, arg_89_1)
		arg_89_1.time_ = 0
		arg_89_1.frameCnt_ = 0
		arg_89_1.state_ = "playing"
		arg_89_1.curTalkId_ = 319301022
		arg_89_1.duration_ = 9.033

		local var_89_0 = {
			zh = 5.933,
			ja = 9.033
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
				arg_89_0:Play319301023(arg_89_1)
			end
		end

		function arg_89_1.onSingleLineUpdate_(arg_92_0)
			local var_92_0 = arg_89_1.actors_["10079ui_story"]
			local var_92_1 = 0

			if var_92_1 < arg_89_1.time_ and arg_89_1.time_ <= var_92_1 + arg_92_0 and arg_89_1.var_.characterEffect10079ui_story == nil then
				arg_89_1.var_.characterEffect10079ui_story = var_92_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_2 = 0.200000002980232

			if var_92_1 <= arg_89_1.time_ and arg_89_1.time_ < var_92_1 + var_92_2 then
				local var_92_3 = (arg_89_1.time_ - var_92_1) / var_92_2

				if arg_89_1.var_.characterEffect10079ui_story then
					local var_92_4 = Mathf.Lerp(0, 0.5, var_92_3)

					arg_89_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_89_1.var_.characterEffect10079ui_story.fillRatio = var_92_4
				end
			end

			if arg_89_1.time_ >= var_92_1 + var_92_2 and arg_89_1.time_ < var_92_1 + var_92_2 + arg_92_0 and arg_89_1.var_.characterEffect10079ui_story then
				local var_92_5 = 0.5

				arg_89_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_89_1.var_.characterEffect10079ui_story.fillRatio = var_92_5
			end

			local var_92_6 = arg_89_1.actors_["1095ui_story"]
			local var_92_7 = 0

			if var_92_7 < arg_89_1.time_ and arg_89_1.time_ <= var_92_7 + arg_92_0 and arg_89_1.var_.characterEffect1095ui_story == nil then
				arg_89_1.var_.characterEffect1095ui_story = var_92_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_92_8 = 0.200000002980232

			if var_92_7 <= arg_89_1.time_ and arg_89_1.time_ < var_92_7 + var_92_8 then
				local var_92_9 = (arg_89_1.time_ - var_92_7) / var_92_8

				if arg_89_1.var_.characterEffect1095ui_story then
					arg_89_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_89_1.time_ >= var_92_7 + var_92_8 and arg_89_1.time_ < var_92_7 + var_92_8 + arg_92_0 and arg_89_1.var_.characterEffect1095ui_story then
				arg_89_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_92_10 = 0

			if var_92_10 < arg_89_1.time_ and arg_89_1.time_ <= var_92_10 + arg_92_0 then
				arg_89_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_92_11 = 0

			if var_92_11 < arg_89_1.time_ and arg_89_1.time_ <= var_92_11 + arg_92_0 then
				arg_89_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_92_12 = 0
			local var_92_13 = 0.55

			if var_92_12 < arg_89_1.time_ and arg_89_1.time_ <= var_92_12 + arg_92_0 then
				arg_89_1.talkMaxDuration = 0
				arg_89_1.dialogCg_.alpha = 1

				arg_89_1.dialog_:SetActive(true)
				SetActive(arg_89_1.leftNameGo_, true)

				local var_92_14 = arg_89_1:FormatText(StoryNameCfg[471].name)

				arg_89_1.leftNameTxt_.text = var_92_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_89_1.leftNameTxt_.transform)

				arg_89_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_89_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_89_1:RecordName(arg_89_1.leftNameTxt_.text)
				SetActive(arg_89_1.iconTrs_.gameObject, false)
				arg_89_1.callingController_:SetSelectedState("normal")

				local var_92_15 = arg_89_1:GetWordFromCfg(319301022)
				local var_92_16 = arg_89_1:FormatText(var_92_15.content)

				arg_89_1.text_.text = var_92_16

				LuaForUtil.ClearLinePrefixSymbol(arg_89_1.text_)

				local var_92_17 = 22
				local var_92_18 = utf8.len(var_92_16)
				local var_92_19 = var_92_17 <= 0 and var_92_13 or var_92_13 * (var_92_18 / var_92_17)

				if var_92_19 > 0 and var_92_13 < var_92_19 then
					arg_89_1.talkMaxDuration = var_92_19

					if var_92_19 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_19 + var_92_12
					end
				end

				arg_89_1.text_.text = var_92_16
				arg_89_1.typewritter.percent = 0

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301022", "story_v_out_319301.awb") ~= 0 then
					local var_92_20 = manager.audio:GetVoiceLength("story_v_out_319301", "319301022", "story_v_out_319301.awb") / 1000

					if var_92_20 + var_92_12 > arg_89_1.duration_ then
						arg_89_1.duration_ = var_92_20 + var_92_12
					end

					if var_92_15.prefab_name ~= "" and arg_89_1.actors_[var_92_15.prefab_name] ~= nil then
						local var_92_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_89_1.actors_[var_92_15.prefab_name].transform, "story_v_out_319301", "319301022", "story_v_out_319301.awb")

						arg_89_1:RecordAudio("319301022", var_92_21)
						arg_89_1:RecordAudio("319301022", var_92_21)
					else
						arg_89_1:AudioAction("play", "voice", "story_v_out_319301", "319301022", "story_v_out_319301.awb")
					end

					arg_89_1:RecordHistoryTalkVoice("story_v_out_319301", "319301022", "story_v_out_319301.awb")
				end

				arg_89_1:RecordContent(arg_89_1.text_.text)
			end

			local var_92_22 = math.max(var_92_13, arg_89_1.talkMaxDuration)

			if var_92_12 <= arg_89_1.time_ and arg_89_1.time_ < var_92_12 + var_92_22 then
				arg_89_1.typewritter.percent = (arg_89_1.time_ - var_92_12) / var_92_22

				arg_89_1.typewritter:SetDirty()
			end

			if arg_89_1.time_ >= var_92_12 + var_92_22 and arg_89_1.time_ < var_92_12 + var_92_22 + arg_92_0 then
				arg_89_1.typewritter.percent = 1

				arg_89_1.typewritter:SetDirty()
				arg_89_1:ShowNextGo(true)
			end
		end
	end,
	Play319301023 = function(arg_93_0, arg_93_1)
		arg_93_1.time_ = 0
		arg_93_1.frameCnt_ = 0
		arg_93_1.state_ = "playing"
		arg_93_1.curTalkId_ = 319301023
		arg_93_1.duration_ = 6.2

		local var_93_0 = {
			zh = 3.9,
			ja = 6.2
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
				arg_93_0:Play319301024(arg_93_1)
			end
		end

		function arg_93_1.onSingleLineUpdate_(arg_96_0)
			local var_96_0 = arg_93_1.actors_["10079ui_story"]
			local var_96_1 = 0

			if var_96_1 < arg_93_1.time_ and arg_93_1.time_ <= var_96_1 + arg_96_0 and arg_93_1.var_.characterEffect10079ui_story == nil then
				arg_93_1.var_.characterEffect10079ui_story = var_96_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_2 = 0.200000002980232

			if var_96_1 <= arg_93_1.time_ and arg_93_1.time_ < var_96_1 + var_96_2 then
				local var_96_3 = (arg_93_1.time_ - var_96_1) / var_96_2

				if arg_93_1.var_.characterEffect10079ui_story then
					arg_93_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_93_1.time_ >= var_96_1 + var_96_2 and arg_93_1.time_ < var_96_1 + var_96_2 + arg_96_0 and arg_93_1.var_.characterEffect10079ui_story then
				arg_93_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_96_4 = arg_93_1.actors_["1095ui_story"]
			local var_96_5 = 0

			if var_96_5 < arg_93_1.time_ and arg_93_1.time_ <= var_96_5 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story == nil then
				arg_93_1.var_.characterEffect1095ui_story = var_96_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_96_6 = 0.200000002980232

			if var_96_5 <= arg_93_1.time_ and arg_93_1.time_ < var_96_5 + var_96_6 then
				local var_96_7 = (arg_93_1.time_ - var_96_5) / var_96_6

				if arg_93_1.var_.characterEffect1095ui_story then
					local var_96_8 = Mathf.Lerp(0, 0.5, var_96_7)

					arg_93_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_93_1.var_.characterEffect1095ui_story.fillRatio = var_96_8
				end
			end

			if arg_93_1.time_ >= var_96_5 + var_96_6 and arg_93_1.time_ < var_96_5 + var_96_6 + arg_96_0 and arg_93_1.var_.characterEffect1095ui_story then
				local var_96_9 = 0.5

				arg_93_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_93_1.var_.characterEffect1095ui_story.fillRatio = var_96_9
			end

			local var_96_10 = 0

			if var_96_10 < arg_93_1.time_ and arg_93_1.time_ <= var_96_10 + arg_96_0 then
				arg_93_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action7_2")
			end

			local var_96_11 = 0

			if var_96_11 < arg_93_1.time_ and arg_93_1.time_ <= var_96_11 + arg_96_0 then
				arg_93_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_96_12 = 0
			local var_96_13 = 0.7

			if var_96_12 < arg_93_1.time_ and arg_93_1.time_ <= var_96_12 + arg_96_0 then
				arg_93_1.talkMaxDuration = 0
				arg_93_1.dialogCg_.alpha = 1

				arg_93_1.dialog_:SetActive(true)
				SetActive(arg_93_1.leftNameGo_, true)

				local var_96_14 = arg_93_1:FormatText(StoryNameCfg[6].name)

				arg_93_1.leftNameTxt_.text = var_96_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_93_1.leftNameTxt_.transform)

				arg_93_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_93_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_93_1:RecordName(arg_93_1.leftNameTxt_.text)
				SetActive(arg_93_1.iconTrs_.gameObject, false)
				arg_93_1.callingController_:SetSelectedState("normal")

				local var_96_15 = arg_93_1:GetWordFromCfg(319301023)
				local var_96_16 = arg_93_1:FormatText(var_96_15.content)

				arg_93_1.text_.text = var_96_16

				LuaForUtil.ClearLinePrefixSymbol(arg_93_1.text_)

				local var_96_17 = 28
				local var_96_18 = utf8.len(var_96_16)
				local var_96_19 = var_96_17 <= 0 and var_96_13 or var_96_13 * (var_96_18 / var_96_17)

				if var_96_19 > 0 and var_96_13 < var_96_19 then
					arg_93_1.talkMaxDuration = var_96_19

					if var_96_19 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_19 + var_96_12
					end
				end

				arg_93_1.text_.text = var_96_16
				arg_93_1.typewritter.percent = 0

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301023", "story_v_out_319301.awb") ~= 0 then
					local var_96_20 = manager.audio:GetVoiceLength("story_v_out_319301", "319301023", "story_v_out_319301.awb") / 1000

					if var_96_20 + var_96_12 > arg_93_1.duration_ then
						arg_93_1.duration_ = var_96_20 + var_96_12
					end

					if var_96_15.prefab_name ~= "" and arg_93_1.actors_[var_96_15.prefab_name] ~= nil then
						local var_96_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_93_1.actors_[var_96_15.prefab_name].transform, "story_v_out_319301", "319301023", "story_v_out_319301.awb")

						arg_93_1:RecordAudio("319301023", var_96_21)
						arg_93_1:RecordAudio("319301023", var_96_21)
					else
						arg_93_1:AudioAction("play", "voice", "story_v_out_319301", "319301023", "story_v_out_319301.awb")
					end

					arg_93_1:RecordHistoryTalkVoice("story_v_out_319301", "319301023", "story_v_out_319301.awb")
				end

				arg_93_1:RecordContent(arg_93_1.text_.text)
			end

			local var_96_22 = math.max(var_96_13, arg_93_1.talkMaxDuration)

			if var_96_12 <= arg_93_1.time_ and arg_93_1.time_ < var_96_12 + var_96_22 then
				arg_93_1.typewritter.percent = (arg_93_1.time_ - var_96_12) / var_96_22

				arg_93_1.typewritter:SetDirty()
			end

			if arg_93_1.time_ >= var_96_12 + var_96_22 and arg_93_1.time_ < var_96_12 + var_96_22 + arg_96_0 then
				arg_93_1.typewritter.percent = 1

				arg_93_1.typewritter:SetDirty()
				arg_93_1:ShowNextGo(true)
			end
		end
	end,
	Play319301024 = function(arg_97_0, arg_97_1)
		arg_97_1.time_ = 0
		arg_97_1.frameCnt_ = 0
		arg_97_1.state_ = "playing"
		arg_97_1.curTalkId_ = 319301024
		arg_97_1.duration_ = 8.866

		local var_97_0 = {
			zh = 8.166,
			ja = 8.866
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
				arg_97_0:Play319301025(arg_97_1)
			end
		end

		function arg_97_1.onSingleLineUpdate_(arg_100_0)
			local var_100_0 = arg_97_1.actors_["1095ui_story"].transform
			local var_100_1 = 0

			if var_100_1 < arg_97_1.time_ and arg_97_1.time_ <= var_100_1 + arg_100_0 then
				arg_97_1.var_.moveOldPos1095ui_story = var_100_0.localPosition
			end

			local var_100_2 = 0.001

			if var_100_1 <= arg_97_1.time_ and arg_97_1.time_ < var_100_1 + var_100_2 then
				local var_100_3 = (arg_97_1.time_ - var_100_1) / var_100_2
				local var_100_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_100_0.localPosition = Vector3.Lerp(arg_97_1.var_.moveOldPos1095ui_story, var_100_4, var_100_3)

				local var_100_5 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_5.x, var_100_5.y, var_100_5.z)

				local var_100_6 = var_100_0.localEulerAngles

				var_100_6.z = 0
				var_100_6.x = 0
				var_100_0.localEulerAngles = var_100_6
			end

			if arg_97_1.time_ >= var_100_1 + var_100_2 and arg_97_1.time_ < var_100_1 + var_100_2 + arg_100_0 then
				var_100_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_100_7 = manager.ui.mainCamera.transform.position - var_100_0.position

				var_100_0.forward = Vector3.New(var_100_7.x, var_100_7.y, var_100_7.z)

				local var_100_8 = var_100_0.localEulerAngles

				var_100_8.z = 0
				var_100_8.x = 0
				var_100_0.localEulerAngles = var_100_8
			end

			local var_100_9 = arg_97_1.actors_["1095ui_story"]
			local var_100_10 = 0

			if var_100_10 < arg_97_1.time_ and arg_97_1.time_ <= var_100_10 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story == nil then
				arg_97_1.var_.characterEffect1095ui_story = var_100_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_11 = 0.200000002980232

			if var_100_10 <= arg_97_1.time_ and arg_97_1.time_ < var_100_10 + var_100_11 then
				local var_100_12 = (arg_97_1.time_ - var_100_10) / var_100_11

				if arg_97_1.var_.characterEffect1095ui_story then
					arg_97_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_97_1.time_ >= var_100_10 + var_100_11 and arg_97_1.time_ < var_100_10 + var_100_11 + arg_100_0 and arg_97_1.var_.characterEffect1095ui_story then
				arg_97_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_100_13 = arg_97_1.actors_["10079ui_story"]
			local var_100_14 = 0

			if var_100_14 < arg_97_1.time_ and arg_97_1.time_ <= var_100_14 + arg_100_0 and arg_97_1.var_.characterEffect10079ui_story == nil then
				arg_97_1.var_.characterEffect10079ui_story = var_100_13:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_100_15 = 0.200000002980232

			if var_100_14 <= arg_97_1.time_ and arg_97_1.time_ < var_100_14 + var_100_15 then
				local var_100_16 = (arg_97_1.time_ - var_100_14) / var_100_15

				if arg_97_1.var_.characterEffect10079ui_story then
					local var_100_17 = Mathf.Lerp(0, 0.5, var_100_16)

					arg_97_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_97_1.var_.characterEffect10079ui_story.fillRatio = var_100_17
				end
			end

			if arg_97_1.time_ >= var_100_14 + var_100_15 and arg_97_1.time_ < var_100_14 + var_100_15 + arg_100_0 and arg_97_1.var_.characterEffect10079ui_story then
				local var_100_18 = 0.5

				arg_97_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_97_1.var_.characterEffect10079ui_story.fillRatio = var_100_18
			end

			local var_100_19 = 0
			local var_100_20 = 0.85

			if var_100_19 < arg_97_1.time_ and arg_97_1.time_ <= var_100_19 + arg_100_0 then
				arg_97_1.talkMaxDuration = 0
				arg_97_1.dialogCg_.alpha = 1

				arg_97_1.dialog_:SetActive(true)
				SetActive(arg_97_1.leftNameGo_, true)

				local var_100_21 = arg_97_1:FormatText(StoryNameCfg[471].name)

				arg_97_1.leftNameTxt_.text = var_100_21

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_97_1.leftNameTxt_.transform)

				arg_97_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_97_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_97_1:RecordName(arg_97_1.leftNameTxt_.text)
				SetActive(arg_97_1.iconTrs_.gameObject, false)
				arg_97_1.callingController_:SetSelectedState("normal")

				local var_100_22 = arg_97_1:GetWordFromCfg(319301024)
				local var_100_23 = arg_97_1:FormatText(var_100_22.content)

				arg_97_1.text_.text = var_100_23

				LuaForUtil.ClearLinePrefixSymbol(arg_97_1.text_)

				local var_100_24 = 34
				local var_100_25 = utf8.len(var_100_23)
				local var_100_26 = var_100_24 <= 0 and var_100_20 or var_100_20 * (var_100_25 / var_100_24)

				if var_100_26 > 0 and var_100_20 < var_100_26 then
					arg_97_1.talkMaxDuration = var_100_26

					if var_100_26 + var_100_19 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_26 + var_100_19
					end
				end

				arg_97_1.text_.text = var_100_23
				arg_97_1.typewritter.percent = 0

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301024", "story_v_out_319301.awb") ~= 0 then
					local var_100_27 = manager.audio:GetVoiceLength("story_v_out_319301", "319301024", "story_v_out_319301.awb") / 1000

					if var_100_27 + var_100_19 > arg_97_1.duration_ then
						arg_97_1.duration_ = var_100_27 + var_100_19
					end

					if var_100_22.prefab_name ~= "" and arg_97_1.actors_[var_100_22.prefab_name] ~= nil then
						local var_100_28 = LuaForUtil.PlayVoiceWithCriLipsync(arg_97_1.actors_[var_100_22.prefab_name].transform, "story_v_out_319301", "319301024", "story_v_out_319301.awb")

						arg_97_1:RecordAudio("319301024", var_100_28)
						arg_97_1:RecordAudio("319301024", var_100_28)
					else
						arg_97_1:AudioAction("play", "voice", "story_v_out_319301", "319301024", "story_v_out_319301.awb")
					end

					arg_97_1:RecordHistoryTalkVoice("story_v_out_319301", "319301024", "story_v_out_319301.awb")
				end

				arg_97_1:RecordContent(arg_97_1.text_.text)
			end

			local var_100_29 = math.max(var_100_20, arg_97_1.talkMaxDuration)

			if var_100_19 <= arg_97_1.time_ and arg_97_1.time_ < var_100_19 + var_100_29 then
				arg_97_1.typewritter.percent = (arg_97_1.time_ - var_100_19) / var_100_29

				arg_97_1.typewritter:SetDirty()
			end

			if arg_97_1.time_ >= var_100_19 + var_100_29 and arg_97_1.time_ < var_100_19 + var_100_29 + arg_100_0 then
				arg_97_1.typewritter.percent = 1

				arg_97_1.typewritter:SetDirty()
				arg_97_1:ShowNextGo(true)
			end
		end
	end,
	Play319301025 = function(arg_101_0, arg_101_1)
		arg_101_1.time_ = 0
		arg_101_1.frameCnt_ = 0
		arg_101_1.state_ = "playing"
		arg_101_1.curTalkId_ = 319301025
		arg_101_1.duration_ = 8.366

		local var_101_0 = {
			zh = 8.366,
			ja = 6.166
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
				arg_101_0:Play319301026(arg_101_1)
			end
		end

		function arg_101_1.onSingleLineUpdate_(arg_104_0)
			local var_104_0 = arg_101_1.actors_["10079ui_story"].transform
			local var_104_1 = 0

			if var_104_1 < arg_101_1.time_ and arg_101_1.time_ <= var_104_1 + arg_104_0 then
				arg_101_1.var_.moveOldPos10079ui_story = var_104_0.localPosition
			end

			local var_104_2 = 0.001

			if var_104_1 <= arg_101_1.time_ and arg_101_1.time_ < var_104_1 + var_104_2 then
				local var_104_3 = (arg_101_1.time_ - var_104_1) / var_104_2
				local var_104_4 = Vector3.New(0.7, -0.95, -6.05)

				var_104_0.localPosition = Vector3.Lerp(arg_101_1.var_.moveOldPos10079ui_story, var_104_4, var_104_3)

				local var_104_5 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_5.x, var_104_5.y, var_104_5.z)

				local var_104_6 = var_104_0.localEulerAngles

				var_104_6.z = 0
				var_104_6.x = 0
				var_104_0.localEulerAngles = var_104_6
			end

			if arg_101_1.time_ >= var_104_1 + var_104_2 and arg_101_1.time_ < var_104_1 + var_104_2 + arg_104_0 then
				var_104_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_104_7 = manager.ui.mainCamera.transform.position - var_104_0.position

				var_104_0.forward = Vector3.New(var_104_7.x, var_104_7.y, var_104_7.z)

				local var_104_8 = var_104_0.localEulerAngles

				var_104_8.z = 0
				var_104_8.x = 0
				var_104_0.localEulerAngles = var_104_8
			end

			local var_104_9 = arg_101_1.actors_["10079ui_story"]
			local var_104_10 = 0

			if var_104_10 < arg_101_1.time_ and arg_101_1.time_ <= var_104_10 + arg_104_0 and arg_101_1.var_.characterEffect10079ui_story == nil then
				arg_101_1.var_.characterEffect10079ui_story = var_104_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_11 = 0.200000002980232

			if var_104_10 <= arg_101_1.time_ and arg_101_1.time_ < var_104_10 + var_104_11 then
				local var_104_12 = (arg_101_1.time_ - var_104_10) / var_104_11

				if arg_101_1.var_.characterEffect10079ui_story then
					arg_101_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_101_1.time_ >= var_104_10 + var_104_11 and arg_101_1.time_ < var_104_10 + var_104_11 + arg_104_0 and arg_101_1.var_.characterEffect10079ui_story then
				arg_101_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_104_13 = 0

			if var_104_13 < arg_101_1.time_ and arg_101_1.time_ <= var_104_13 + arg_104_0 then
				arg_101_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action1_1")
			end

			local var_104_14 = 0

			if var_104_14 < arg_101_1.time_ and arg_101_1.time_ <= var_104_14 + arg_104_0 then
				arg_101_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_104_15 = arg_101_1.actors_["1095ui_story"]
			local var_104_16 = 0

			if var_104_16 < arg_101_1.time_ and arg_101_1.time_ <= var_104_16 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story == nil then
				arg_101_1.var_.characterEffect1095ui_story = var_104_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_104_17 = 0.200000002980232

			if var_104_16 <= arg_101_1.time_ and arg_101_1.time_ < var_104_16 + var_104_17 then
				local var_104_18 = (arg_101_1.time_ - var_104_16) / var_104_17

				if arg_101_1.var_.characterEffect1095ui_story then
					local var_104_19 = Mathf.Lerp(0, 0.5, var_104_18)

					arg_101_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_101_1.var_.characterEffect1095ui_story.fillRatio = var_104_19
				end
			end

			if arg_101_1.time_ >= var_104_16 + var_104_17 and arg_101_1.time_ < var_104_16 + var_104_17 + arg_104_0 and arg_101_1.var_.characterEffect1095ui_story then
				local var_104_20 = 0.5

				arg_101_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_101_1.var_.characterEffect1095ui_story.fillRatio = var_104_20
			end

			local var_104_21 = 0
			local var_104_22 = 0.85

			if var_104_21 < arg_101_1.time_ and arg_101_1.time_ <= var_104_21 + arg_104_0 then
				arg_101_1.talkMaxDuration = 0
				arg_101_1.dialogCg_.alpha = 1

				arg_101_1.dialog_:SetActive(true)
				SetActive(arg_101_1.leftNameGo_, true)

				local var_104_23 = arg_101_1:FormatText(StoryNameCfg[6].name)

				arg_101_1.leftNameTxt_.text = var_104_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_101_1.leftNameTxt_.transform)

				arg_101_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_101_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_101_1:RecordName(arg_101_1.leftNameTxt_.text)
				SetActive(arg_101_1.iconTrs_.gameObject, false)
				arg_101_1.callingController_:SetSelectedState("normal")

				local var_104_24 = arg_101_1:GetWordFromCfg(319301025)
				local var_104_25 = arg_101_1:FormatText(var_104_24.content)

				arg_101_1.text_.text = var_104_25

				LuaForUtil.ClearLinePrefixSymbol(arg_101_1.text_)

				local var_104_26 = 34
				local var_104_27 = utf8.len(var_104_25)
				local var_104_28 = var_104_26 <= 0 and var_104_22 or var_104_22 * (var_104_27 / var_104_26)

				if var_104_28 > 0 and var_104_22 < var_104_28 then
					arg_101_1.talkMaxDuration = var_104_28

					if var_104_28 + var_104_21 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_28 + var_104_21
					end
				end

				arg_101_1.text_.text = var_104_25
				arg_101_1.typewritter.percent = 0

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301025", "story_v_out_319301.awb") ~= 0 then
					local var_104_29 = manager.audio:GetVoiceLength("story_v_out_319301", "319301025", "story_v_out_319301.awb") / 1000

					if var_104_29 + var_104_21 > arg_101_1.duration_ then
						arg_101_1.duration_ = var_104_29 + var_104_21
					end

					if var_104_24.prefab_name ~= "" and arg_101_1.actors_[var_104_24.prefab_name] ~= nil then
						local var_104_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_101_1.actors_[var_104_24.prefab_name].transform, "story_v_out_319301", "319301025", "story_v_out_319301.awb")

						arg_101_1:RecordAudio("319301025", var_104_30)
						arg_101_1:RecordAudio("319301025", var_104_30)
					else
						arg_101_1:AudioAction("play", "voice", "story_v_out_319301", "319301025", "story_v_out_319301.awb")
					end

					arg_101_1:RecordHistoryTalkVoice("story_v_out_319301", "319301025", "story_v_out_319301.awb")
				end

				arg_101_1:RecordContent(arg_101_1.text_.text)
			end

			local var_104_31 = math.max(var_104_22, arg_101_1.talkMaxDuration)

			if var_104_21 <= arg_101_1.time_ and arg_101_1.time_ < var_104_21 + var_104_31 then
				arg_101_1.typewritter.percent = (arg_101_1.time_ - var_104_21) / var_104_31

				arg_101_1.typewritter:SetDirty()
			end

			if arg_101_1.time_ >= var_104_21 + var_104_31 and arg_101_1.time_ < var_104_21 + var_104_31 + arg_104_0 then
				arg_101_1.typewritter.percent = 1

				arg_101_1.typewritter:SetDirty()
				arg_101_1:ShowNextGo(true)
			end
		end
	end,
	Play319301026 = function(arg_105_0, arg_105_1)
		arg_105_1.time_ = 0
		arg_105_1.frameCnt_ = 0
		arg_105_1.state_ = "playing"
		arg_105_1.curTalkId_ = 319301026
		arg_105_1.duration_ = 11.3

		local var_105_0 = {
			zh = 6.666,
			ja = 11.3
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
				arg_105_0:Play319301027(arg_105_1)
			end
		end

		function arg_105_1.onSingleLineUpdate_(arg_108_0)
			local var_108_0 = 0
			local var_108_1 = 0.775

			if var_108_0 < arg_105_1.time_ and arg_105_1.time_ <= var_108_0 + arg_108_0 then
				arg_105_1.talkMaxDuration = 0
				arg_105_1.dialogCg_.alpha = 1

				arg_105_1.dialog_:SetActive(true)
				SetActive(arg_105_1.leftNameGo_, true)

				local var_108_2 = arg_105_1:FormatText(StoryNameCfg[6].name)

				arg_105_1.leftNameTxt_.text = var_108_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_105_1.leftNameTxt_.transform)

				arg_105_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_105_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_105_1:RecordName(arg_105_1.leftNameTxt_.text)
				SetActive(arg_105_1.iconTrs_.gameObject, false)
				arg_105_1.callingController_:SetSelectedState("normal")

				local var_108_3 = arg_105_1:GetWordFromCfg(319301026)
				local var_108_4 = arg_105_1:FormatText(var_108_3.content)

				arg_105_1.text_.text = var_108_4

				LuaForUtil.ClearLinePrefixSymbol(arg_105_1.text_)

				local var_108_5 = 31
				local var_108_6 = utf8.len(var_108_4)
				local var_108_7 = var_108_5 <= 0 and var_108_1 or var_108_1 * (var_108_6 / var_108_5)

				if var_108_7 > 0 and var_108_1 < var_108_7 then
					arg_105_1.talkMaxDuration = var_108_7

					if var_108_7 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_7 + var_108_0
					end
				end

				arg_105_1.text_.text = var_108_4
				arg_105_1.typewritter.percent = 0

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301026", "story_v_out_319301.awb") ~= 0 then
					local var_108_8 = manager.audio:GetVoiceLength("story_v_out_319301", "319301026", "story_v_out_319301.awb") / 1000

					if var_108_8 + var_108_0 > arg_105_1.duration_ then
						arg_105_1.duration_ = var_108_8 + var_108_0
					end

					if var_108_3.prefab_name ~= "" and arg_105_1.actors_[var_108_3.prefab_name] ~= nil then
						local var_108_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_105_1.actors_[var_108_3.prefab_name].transform, "story_v_out_319301", "319301026", "story_v_out_319301.awb")

						arg_105_1:RecordAudio("319301026", var_108_9)
						arg_105_1:RecordAudio("319301026", var_108_9)
					else
						arg_105_1:AudioAction("play", "voice", "story_v_out_319301", "319301026", "story_v_out_319301.awb")
					end

					arg_105_1:RecordHistoryTalkVoice("story_v_out_319301", "319301026", "story_v_out_319301.awb")
				end

				arg_105_1:RecordContent(arg_105_1.text_.text)
			end

			local var_108_10 = math.max(var_108_1, arg_105_1.talkMaxDuration)

			if var_108_0 <= arg_105_1.time_ and arg_105_1.time_ < var_108_0 + var_108_10 then
				arg_105_1.typewritter.percent = (arg_105_1.time_ - var_108_0) / var_108_10

				arg_105_1.typewritter:SetDirty()
			end

			if arg_105_1.time_ >= var_108_0 + var_108_10 and arg_105_1.time_ < var_108_0 + var_108_10 + arg_108_0 then
				arg_105_1.typewritter.percent = 1

				arg_105_1.typewritter:SetDirty()
				arg_105_1:ShowNextGo(true)
			end
		end
	end,
	Play319301027 = function(arg_109_0, arg_109_1)
		arg_109_1.time_ = 0
		arg_109_1.frameCnt_ = 0
		arg_109_1.state_ = "playing"
		arg_109_1.curTalkId_ = 319301027
		arg_109_1.duration_ = 10.866

		local var_109_0 = {
			zh = 7.266,
			ja = 10.866
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
				arg_109_0:Play319301028(arg_109_1)
			end
		end

		function arg_109_1.onSingleLineUpdate_(arg_112_0)
			local var_112_0 = 0

			if var_112_0 < arg_109_1.time_ and arg_109_1.time_ <= var_112_0 + arg_112_0 then
				arg_109_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_112_1 = 0

			if var_112_1 < arg_109_1.time_ and arg_109_1.time_ <= var_112_1 + arg_112_0 then
				arg_109_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_1")
			end

			local var_112_2 = 0
			local var_112_3 = 0.9

			if var_112_2 < arg_109_1.time_ and arg_109_1.time_ <= var_112_2 + arg_112_0 then
				arg_109_1.talkMaxDuration = 0
				arg_109_1.dialogCg_.alpha = 1

				arg_109_1.dialog_:SetActive(true)
				SetActive(arg_109_1.leftNameGo_, true)

				local var_112_4 = arg_109_1:FormatText(StoryNameCfg[6].name)

				arg_109_1.leftNameTxt_.text = var_112_4

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_109_1.leftNameTxt_.transform)

				arg_109_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_109_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_109_1:RecordName(arg_109_1.leftNameTxt_.text)
				SetActive(arg_109_1.iconTrs_.gameObject, false)
				arg_109_1.callingController_:SetSelectedState("normal")

				local var_112_5 = arg_109_1:GetWordFromCfg(319301027)
				local var_112_6 = arg_109_1:FormatText(var_112_5.content)

				arg_109_1.text_.text = var_112_6

				LuaForUtil.ClearLinePrefixSymbol(arg_109_1.text_)

				local var_112_7 = 36
				local var_112_8 = utf8.len(var_112_6)
				local var_112_9 = var_112_7 <= 0 and var_112_3 or var_112_3 * (var_112_8 / var_112_7)

				if var_112_9 > 0 and var_112_3 < var_112_9 then
					arg_109_1.talkMaxDuration = var_112_9

					if var_112_9 + var_112_2 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_9 + var_112_2
					end
				end

				arg_109_1.text_.text = var_112_6
				arg_109_1.typewritter.percent = 0

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301027", "story_v_out_319301.awb") ~= 0 then
					local var_112_10 = manager.audio:GetVoiceLength("story_v_out_319301", "319301027", "story_v_out_319301.awb") / 1000

					if var_112_10 + var_112_2 > arg_109_1.duration_ then
						arg_109_1.duration_ = var_112_10 + var_112_2
					end

					if var_112_5.prefab_name ~= "" and arg_109_1.actors_[var_112_5.prefab_name] ~= nil then
						local var_112_11 = LuaForUtil.PlayVoiceWithCriLipsync(arg_109_1.actors_[var_112_5.prefab_name].transform, "story_v_out_319301", "319301027", "story_v_out_319301.awb")

						arg_109_1:RecordAudio("319301027", var_112_11)
						arg_109_1:RecordAudio("319301027", var_112_11)
					else
						arg_109_1:AudioAction("play", "voice", "story_v_out_319301", "319301027", "story_v_out_319301.awb")
					end

					arg_109_1:RecordHistoryTalkVoice("story_v_out_319301", "319301027", "story_v_out_319301.awb")
				end

				arg_109_1:RecordContent(arg_109_1.text_.text)
			end

			local var_112_12 = math.max(var_112_3, arg_109_1.talkMaxDuration)

			if var_112_2 <= arg_109_1.time_ and arg_109_1.time_ < var_112_2 + var_112_12 then
				arg_109_1.typewritter.percent = (arg_109_1.time_ - var_112_2) / var_112_12

				arg_109_1.typewritter:SetDirty()
			end

			if arg_109_1.time_ >= var_112_2 + var_112_12 and arg_109_1.time_ < var_112_2 + var_112_12 + arg_112_0 then
				arg_109_1.typewritter.percent = 1

				arg_109_1.typewritter:SetDirty()
				arg_109_1:ShowNextGo(true)
			end
		end
	end,
	Play319301028 = function(arg_113_0, arg_113_1)
		arg_113_1.time_ = 0
		arg_113_1.frameCnt_ = 0
		arg_113_1.state_ = "playing"
		arg_113_1.curTalkId_ = 319301028
		arg_113_1.duration_ = 5

		SetActive(arg_113_1.tipsGo_, false)

		function arg_113_1.onSingleLineFinish_()
			arg_113_1.onSingleLineUpdate_ = nil
			arg_113_1.onSingleLineFinish_ = nil
			arg_113_1.state_ = "waiting"
		end

		function arg_113_1.playNext_(arg_115_0)
			if arg_115_0 == 1 then
				arg_113_0:Play319301029(arg_113_1)
			end
		end

		function arg_113_1.onSingleLineUpdate_(arg_116_0)
			local var_116_0 = 0
			local var_116_1 = 1

			if var_116_0 < arg_113_1.time_ and arg_113_1.time_ <= var_116_0 + arg_116_0 then
				local var_116_2 = "play"
				local var_116_3 = "effect"

				arg_113_1:AudioAction(var_116_2, var_116_3, "se_story_side_1199", "se_story_1199_whooshfinsh", "")
			end

			local var_116_4 = arg_113_1.actors_["10079ui_story"].transform
			local var_116_5 = 0

			if var_116_5 < arg_113_1.time_ and arg_113_1.time_ <= var_116_5 + arg_116_0 then
				arg_113_1.var_.moveOldPos10079ui_story = var_116_4.localPosition
			end

			local var_116_6 = 0.001

			if var_116_5 <= arg_113_1.time_ and arg_113_1.time_ < var_116_5 + var_116_6 then
				local var_116_7 = (arg_113_1.time_ - var_116_5) / var_116_6
				local var_116_8 = Vector3.New(0, 100, 0)

				var_116_4.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos10079ui_story, var_116_8, var_116_7)

				local var_116_9 = manager.ui.mainCamera.transform.position - var_116_4.position

				var_116_4.forward = Vector3.New(var_116_9.x, var_116_9.y, var_116_9.z)

				local var_116_10 = var_116_4.localEulerAngles

				var_116_10.z = 0
				var_116_10.x = 0
				var_116_4.localEulerAngles = var_116_10
			end

			if arg_113_1.time_ >= var_116_5 + var_116_6 and arg_113_1.time_ < var_116_5 + var_116_6 + arg_116_0 then
				var_116_4.localPosition = Vector3.New(0, 100, 0)

				local var_116_11 = manager.ui.mainCamera.transform.position - var_116_4.position

				var_116_4.forward = Vector3.New(var_116_11.x, var_116_11.y, var_116_11.z)

				local var_116_12 = var_116_4.localEulerAngles

				var_116_12.z = 0
				var_116_12.x = 0
				var_116_4.localEulerAngles = var_116_12
			end

			local var_116_13 = arg_113_1.actors_["1095ui_story"].transform
			local var_116_14 = 0

			if var_116_14 < arg_113_1.time_ and arg_113_1.time_ <= var_116_14 + arg_116_0 then
				arg_113_1.var_.moveOldPos1095ui_story = var_116_13.localPosition
			end

			local var_116_15 = 0.001

			if var_116_14 <= arg_113_1.time_ and arg_113_1.time_ < var_116_14 + var_116_15 then
				local var_116_16 = (arg_113_1.time_ - var_116_14) / var_116_15
				local var_116_17 = Vector3.New(0, 100, 0)

				var_116_13.localPosition = Vector3.Lerp(arg_113_1.var_.moveOldPos1095ui_story, var_116_17, var_116_16)

				local var_116_18 = manager.ui.mainCamera.transform.position - var_116_13.position

				var_116_13.forward = Vector3.New(var_116_18.x, var_116_18.y, var_116_18.z)

				local var_116_19 = var_116_13.localEulerAngles

				var_116_19.z = 0
				var_116_19.x = 0
				var_116_13.localEulerAngles = var_116_19
			end

			if arg_113_1.time_ >= var_116_14 + var_116_15 and arg_113_1.time_ < var_116_14 + var_116_15 + arg_116_0 then
				var_116_13.localPosition = Vector3.New(0, 100, 0)

				local var_116_20 = manager.ui.mainCamera.transform.position - var_116_13.position

				var_116_13.forward = Vector3.New(var_116_20.x, var_116_20.y, var_116_20.z)

				local var_116_21 = var_116_13.localEulerAngles

				var_116_21.z = 0
				var_116_21.x = 0
				var_116_13.localEulerAngles = var_116_21
			end

			local var_116_22 = 0
			local var_116_23 = 1.125

			if var_116_22 < arg_113_1.time_ and arg_113_1.time_ <= var_116_22 + arg_116_0 then
				arg_113_1.talkMaxDuration = 0
				arg_113_1.dialogCg_.alpha = 1

				arg_113_1.dialog_:SetActive(true)
				SetActive(arg_113_1.leftNameGo_, false)

				arg_113_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_113_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_113_1:RecordName(arg_113_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_113_1.iconTrs_.gameObject, false)
				arg_113_1.callingController_:SetSelectedState("normal")

				local var_116_24 = arg_113_1:GetWordFromCfg(319301028)
				local var_116_25 = arg_113_1:FormatText(var_116_24.content)

				arg_113_1.text_.text = var_116_25

				LuaForUtil.ClearLinePrefixSymbol(arg_113_1.text_)

				local var_116_26 = 45
				local var_116_27 = utf8.len(var_116_25)
				local var_116_28 = var_116_26 <= 0 and var_116_23 or var_116_23 * (var_116_27 / var_116_26)

				if var_116_28 > 0 and var_116_23 < var_116_28 then
					arg_113_1.talkMaxDuration = var_116_28

					if var_116_28 + var_116_22 > arg_113_1.duration_ then
						arg_113_1.duration_ = var_116_28 + var_116_22
					end
				end

				arg_113_1.text_.text = var_116_25
				arg_113_1.typewritter.percent = 0

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(false)
				arg_113_1:RecordContent(arg_113_1.text_.text)
			end

			local var_116_29 = math.max(var_116_23, arg_113_1.talkMaxDuration)

			if var_116_22 <= arg_113_1.time_ and arg_113_1.time_ < var_116_22 + var_116_29 then
				arg_113_1.typewritter.percent = (arg_113_1.time_ - var_116_22) / var_116_29

				arg_113_1.typewritter:SetDirty()
			end

			if arg_113_1.time_ >= var_116_22 + var_116_29 and arg_113_1.time_ < var_116_22 + var_116_29 + arg_116_0 then
				arg_113_1.typewritter.percent = 1

				arg_113_1.typewritter:SetDirty()
				arg_113_1:ShowNextGo(true)
			end
		end
	end,
	Play319301029 = function(arg_117_0, arg_117_1)
		arg_117_1.time_ = 0
		arg_117_1.frameCnt_ = 0
		arg_117_1.state_ = "playing"
		arg_117_1.curTalkId_ = 319301029
		arg_117_1.duration_ = 5

		SetActive(arg_117_1.tipsGo_, false)

		function arg_117_1.onSingleLineFinish_()
			arg_117_1.onSingleLineUpdate_ = nil
			arg_117_1.onSingleLineFinish_ = nil
			arg_117_1.state_ = "waiting"
		end

		function arg_117_1.playNext_(arg_119_0)
			if arg_119_0 == 1 then
				arg_117_0:Play319301030(arg_117_1)
			end
		end

		function arg_117_1.onSingleLineUpdate_(arg_120_0)
			local var_120_0 = 0
			local var_120_1 = 1

			if var_120_0 < arg_117_1.time_ and arg_117_1.time_ <= var_120_0 + arg_120_0 then
				local var_120_2 = "play"
				local var_120_3 = "effect"

				arg_117_1:AudioAction(var_120_2, var_120_3, "se_story_6", "se_story_6_split_flash", "")
			end

			local var_120_4 = manager.ui.mainCamera.transform
			local var_120_5 = 0

			if var_120_5 < arg_117_1.time_ and arg_117_1.time_ <= var_120_5 + arg_120_0 then
				arg_117_1.var_.shakeOldPos = var_120_4.localPosition
			end

			local var_120_6 = 1.5

			if var_120_5 <= arg_117_1.time_ and arg_117_1.time_ < var_120_5 + var_120_6 then
				local var_120_7 = (arg_117_1.time_ - var_120_5) / 0.066
				local var_120_8, var_120_9 = math.modf(var_120_7)

				var_120_4.localPosition = Vector3.New(var_120_9 * 0.13, var_120_9 * 0.13, var_120_9 * 0.13) + arg_117_1.var_.shakeOldPos
			end

			if arg_117_1.time_ >= var_120_5 + var_120_6 and arg_117_1.time_ < var_120_5 + var_120_6 + arg_120_0 then
				var_120_4.localPosition = arg_117_1.var_.shakeOldPos
			end

			local var_120_10 = 0

			if var_120_10 < arg_117_1.time_ and arg_117_1.time_ <= var_120_10 + arg_120_0 then
				arg_117_1.allBtn_.enabled = false
			end

			local var_120_11 = 1.5

			if arg_117_1.time_ >= var_120_10 + var_120_11 and arg_117_1.time_ < var_120_10 + var_120_11 + arg_120_0 then
				arg_117_1.allBtn_.enabled = true
			end

			local var_120_12 = 0
			local var_120_13 = 1.15

			if var_120_12 < arg_117_1.time_ and arg_117_1.time_ <= var_120_12 + arg_120_0 then
				arg_117_1.talkMaxDuration = 0
				arg_117_1.dialogCg_.alpha = 1

				arg_117_1.dialog_:SetActive(true)
				SetActive(arg_117_1.leftNameGo_, false)

				arg_117_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_117_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_117_1:RecordName(arg_117_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_117_1.iconTrs_.gameObject, false)
				arg_117_1.callingController_:SetSelectedState("normal")

				local var_120_14 = arg_117_1:GetWordFromCfg(319301029)
				local var_120_15 = arg_117_1:FormatText(var_120_14.content)

				arg_117_1.text_.text = var_120_15

				LuaForUtil.ClearLinePrefixSymbol(arg_117_1.text_)

				local var_120_16 = 46
				local var_120_17 = utf8.len(var_120_15)
				local var_120_18 = var_120_16 <= 0 and var_120_13 or var_120_13 * (var_120_17 / var_120_16)

				if var_120_18 > 0 and var_120_13 < var_120_18 then
					arg_117_1.talkMaxDuration = var_120_18

					if var_120_18 + var_120_12 > arg_117_1.duration_ then
						arg_117_1.duration_ = var_120_18 + var_120_12
					end
				end

				arg_117_1.text_.text = var_120_15
				arg_117_1.typewritter.percent = 0

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(false)
				arg_117_1:RecordContent(arg_117_1.text_.text)
			end

			local var_120_19 = math.max(var_120_13, arg_117_1.talkMaxDuration)

			if var_120_12 <= arg_117_1.time_ and arg_117_1.time_ < var_120_12 + var_120_19 then
				arg_117_1.typewritter.percent = (arg_117_1.time_ - var_120_12) / var_120_19

				arg_117_1.typewritter:SetDirty()
			end

			if arg_117_1.time_ >= var_120_12 + var_120_19 and arg_117_1.time_ < var_120_12 + var_120_19 + arg_120_0 then
				arg_117_1.typewritter.percent = 1

				arg_117_1.typewritter:SetDirty()
				arg_117_1:ShowNextGo(true)
			end
		end
	end,
	Play319301030 = function(arg_121_0, arg_121_1)
		arg_121_1.time_ = 0
		arg_121_1.frameCnt_ = 0
		arg_121_1.state_ = "playing"
		arg_121_1.curTalkId_ = 319301030
		arg_121_1.duration_ = 5

		SetActive(arg_121_1.tipsGo_, false)

		function arg_121_1.onSingleLineFinish_()
			arg_121_1.onSingleLineUpdate_ = nil
			arg_121_1.onSingleLineFinish_ = nil
			arg_121_1.state_ = "waiting"
		end

		function arg_121_1.playNext_(arg_123_0)
			if arg_123_0 == 1 then
				arg_121_0:Play319301031(arg_121_1)
			end
		end

		function arg_121_1.onSingleLineUpdate_(arg_124_0)
			local var_124_0 = 0
			local var_124_1 = 0.25

			if var_124_0 < arg_121_1.time_ and arg_121_1.time_ <= var_124_0 + arg_124_0 then
				arg_121_1.talkMaxDuration = 0
				arg_121_1.dialogCg_.alpha = 1

				arg_121_1.dialog_:SetActive(true)
				SetActive(arg_121_1.leftNameGo_, false)

				arg_121_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_121_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_121_1:RecordName(arg_121_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_121_1.iconTrs_.gameObject, false)
				arg_121_1.callingController_:SetSelectedState("normal")

				local var_124_2 = arg_121_1:GetWordFromCfg(319301030)
				local var_124_3 = arg_121_1:FormatText(var_124_2.content)

				arg_121_1.text_.text = var_124_3

				LuaForUtil.ClearLinePrefixSymbol(arg_121_1.text_)

				local var_124_4 = 10
				local var_124_5 = utf8.len(var_124_3)
				local var_124_6 = var_124_4 <= 0 and var_124_1 or var_124_1 * (var_124_5 / var_124_4)

				if var_124_6 > 0 and var_124_1 < var_124_6 then
					arg_121_1.talkMaxDuration = var_124_6

					if var_124_6 + var_124_0 > arg_121_1.duration_ then
						arg_121_1.duration_ = var_124_6 + var_124_0
					end
				end

				arg_121_1.text_.text = var_124_3
				arg_121_1.typewritter.percent = 0

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(false)
				arg_121_1:RecordContent(arg_121_1.text_.text)
			end

			local var_124_7 = math.max(var_124_1, arg_121_1.talkMaxDuration)

			if var_124_0 <= arg_121_1.time_ and arg_121_1.time_ < var_124_0 + var_124_7 then
				arg_121_1.typewritter.percent = (arg_121_1.time_ - var_124_0) / var_124_7

				arg_121_1.typewritter:SetDirty()
			end

			if arg_121_1.time_ >= var_124_0 + var_124_7 and arg_121_1.time_ < var_124_0 + var_124_7 + arg_124_0 then
				arg_121_1.typewritter.percent = 1

				arg_121_1.typewritter:SetDirty()
				arg_121_1:ShowNextGo(true)
			end
		end
	end,
	Play319301031 = function(arg_125_0, arg_125_1)
		arg_125_1.time_ = 0
		arg_125_1.frameCnt_ = 0
		arg_125_1.state_ = "playing"
		arg_125_1.curTalkId_ = 319301031
		arg_125_1.duration_ = 4.833

		local var_125_0 = {
			zh = 4.333,
			ja = 4.833
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
				arg_125_0:Play319301032(arg_125_1)
			end
		end

		function arg_125_1.onSingleLineUpdate_(arg_128_0)
			local var_128_0 = arg_125_1.actors_["10079ui_story"]
			local var_128_1 = 0

			if var_128_1 < arg_125_1.time_ and arg_125_1.time_ <= var_128_1 + arg_128_0 and arg_125_1.var_.characterEffect10079ui_story == nil then
				arg_125_1.var_.characterEffect10079ui_story = var_128_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_128_2 = 0.200000002980232

			if var_128_1 <= arg_125_1.time_ and arg_125_1.time_ < var_128_1 + var_128_2 then
				local var_128_3 = (arg_125_1.time_ - var_128_1) / var_128_2

				if arg_125_1.var_.characterEffect10079ui_story then
					arg_125_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_125_1.time_ >= var_128_1 + var_128_2 and arg_125_1.time_ < var_128_1 + var_128_2 + arg_128_0 and arg_125_1.var_.characterEffect10079ui_story then
				arg_125_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_128_4 = arg_125_1.actors_["10079ui_story"].transform
			local var_128_5 = 0

			if var_128_5 < arg_125_1.time_ and arg_125_1.time_ <= var_128_5 + arg_128_0 then
				arg_125_1.var_.moveOldPos10079ui_story = var_128_4.localPosition

				local var_128_6 = "10079ui_story"

				arg_125_1:ShowWeapon(arg_125_1.var_[var_128_6 .. "Animator"].transform, false)
			end

			local var_128_7 = 0.001

			if var_128_5 <= arg_125_1.time_ and arg_125_1.time_ < var_128_5 + var_128_7 then
				local var_128_8 = (arg_125_1.time_ - var_128_5) / var_128_7
				local var_128_9 = Vector3.New(0, -0.95, -6.05)

				var_128_4.localPosition = Vector3.Lerp(arg_125_1.var_.moveOldPos10079ui_story, var_128_9, var_128_8)

				local var_128_10 = manager.ui.mainCamera.transform.position - var_128_4.position

				var_128_4.forward = Vector3.New(var_128_10.x, var_128_10.y, var_128_10.z)

				local var_128_11 = var_128_4.localEulerAngles

				var_128_11.z = 0
				var_128_11.x = 0
				var_128_4.localEulerAngles = var_128_11
			end

			if arg_125_1.time_ >= var_128_5 + var_128_7 and arg_125_1.time_ < var_128_5 + var_128_7 + arg_128_0 then
				var_128_4.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_128_12 = manager.ui.mainCamera.transform.position - var_128_4.position

				var_128_4.forward = Vector3.New(var_128_12.x, var_128_12.y, var_128_12.z)

				local var_128_13 = var_128_4.localEulerAngles

				var_128_13.z = 0
				var_128_13.x = 0
				var_128_4.localEulerAngles = var_128_13
			end

			local var_128_14 = 0

			if var_128_14 < arg_125_1.time_ and arg_125_1.time_ <= var_128_14 + arg_128_0 then
				arg_125_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface3201cva")
			end

			local var_128_15 = 0
			local var_128_16 = 0.425

			if var_128_15 < arg_125_1.time_ and arg_125_1.time_ <= var_128_15 + arg_128_0 then
				arg_125_1.talkMaxDuration = 0
				arg_125_1.dialogCg_.alpha = 1

				arg_125_1.dialog_:SetActive(true)
				SetActive(arg_125_1.leftNameGo_, true)

				local var_128_17 = arg_125_1:FormatText(StoryNameCfg[6].name)

				arg_125_1.leftNameTxt_.text = var_128_17

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_125_1.leftNameTxt_.transform)

				arg_125_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_125_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_125_1:RecordName(arg_125_1.leftNameTxt_.text)
				SetActive(arg_125_1.iconTrs_.gameObject, false)
				arg_125_1.callingController_:SetSelectedState("normal")

				local var_128_18 = arg_125_1:GetWordFromCfg(319301031)
				local var_128_19 = arg_125_1:FormatText(var_128_18.content)

				arg_125_1.text_.text = var_128_19

				LuaForUtil.ClearLinePrefixSymbol(arg_125_1.text_)

				local var_128_20 = 17
				local var_128_21 = utf8.len(var_128_19)
				local var_128_22 = var_128_20 <= 0 and var_128_16 or var_128_16 * (var_128_21 / var_128_20)

				if var_128_22 > 0 and var_128_16 < var_128_22 then
					arg_125_1.talkMaxDuration = var_128_22

					if var_128_22 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_22 + var_128_15
					end
				end

				arg_125_1.text_.text = var_128_19
				arg_125_1.typewritter.percent = 0

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301031", "story_v_out_319301.awb") ~= 0 then
					local var_128_23 = manager.audio:GetVoiceLength("story_v_out_319301", "319301031", "story_v_out_319301.awb") / 1000

					if var_128_23 + var_128_15 > arg_125_1.duration_ then
						arg_125_1.duration_ = var_128_23 + var_128_15
					end

					if var_128_18.prefab_name ~= "" and arg_125_1.actors_[var_128_18.prefab_name] ~= nil then
						local var_128_24 = LuaForUtil.PlayVoiceWithCriLipsync(arg_125_1.actors_[var_128_18.prefab_name].transform, "story_v_out_319301", "319301031", "story_v_out_319301.awb")

						arg_125_1:RecordAudio("319301031", var_128_24)
						arg_125_1:RecordAudio("319301031", var_128_24)
					else
						arg_125_1:AudioAction("play", "voice", "story_v_out_319301", "319301031", "story_v_out_319301.awb")
					end

					arg_125_1:RecordHistoryTalkVoice("story_v_out_319301", "319301031", "story_v_out_319301.awb")
				end

				arg_125_1:RecordContent(arg_125_1.text_.text)
			end

			local var_128_25 = math.max(var_128_16, arg_125_1.talkMaxDuration)

			if var_128_15 <= arg_125_1.time_ and arg_125_1.time_ < var_128_15 + var_128_25 then
				arg_125_1.typewritter.percent = (arg_125_1.time_ - var_128_15) / var_128_25

				arg_125_1.typewritter:SetDirty()
			end

			if arg_125_1.time_ >= var_128_15 + var_128_25 and arg_125_1.time_ < var_128_15 + var_128_25 + arg_128_0 then
				arg_125_1.typewritter.percent = 1

				arg_125_1.typewritter:SetDirty()
				arg_125_1:ShowNextGo(true)
			end
		end
	end,
	Play319301032 = function(arg_129_0, arg_129_1)
		arg_129_1.time_ = 0
		arg_129_1.frameCnt_ = 0
		arg_129_1.state_ = "playing"
		arg_129_1.curTalkId_ = 319301032
		arg_129_1.duration_ = 2.3

		local var_129_0 = {
			zh = 1.999999999999,
			ja = 2.3
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
				arg_129_0:Play319301033(arg_129_1)
			end
		end

		function arg_129_1.onSingleLineUpdate_(arg_132_0)
			local var_132_0 = arg_129_1.actors_["1095ui_story"]
			local var_132_1 = 0

			if var_132_1 < arg_129_1.time_ and arg_129_1.time_ <= var_132_1 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story == nil then
				arg_129_1.var_.characterEffect1095ui_story = var_132_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_2 = 0.200000002980232

			if var_132_1 <= arg_129_1.time_ and arg_129_1.time_ < var_132_1 + var_132_2 then
				local var_132_3 = (arg_129_1.time_ - var_132_1) / var_132_2

				if arg_129_1.var_.characterEffect1095ui_story then
					arg_129_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_129_1.time_ >= var_132_1 + var_132_2 and arg_129_1.time_ < var_132_1 + var_132_2 + arg_132_0 and arg_129_1.var_.characterEffect1095ui_story then
				arg_129_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_132_4 = arg_129_1.actors_["10079ui_story"]
			local var_132_5 = 0

			if var_132_5 < arg_129_1.time_ and arg_129_1.time_ <= var_132_5 + arg_132_0 and arg_129_1.var_.characterEffect10079ui_story == nil then
				arg_129_1.var_.characterEffect10079ui_story = var_132_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_132_6 = 0.200000002980232

			if var_132_5 <= arg_129_1.time_ and arg_129_1.time_ < var_132_5 + var_132_6 then
				local var_132_7 = (arg_129_1.time_ - var_132_5) / var_132_6

				if arg_129_1.var_.characterEffect10079ui_story then
					local var_132_8 = Mathf.Lerp(0, 0.5, var_132_7)

					arg_129_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_129_1.var_.characterEffect10079ui_story.fillRatio = var_132_8
				end
			end

			if arg_129_1.time_ >= var_132_5 + var_132_6 and arg_129_1.time_ < var_132_5 + var_132_6 + arg_132_0 and arg_129_1.var_.characterEffect10079ui_story then
				local var_132_9 = 0.5

				arg_129_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_129_1.var_.characterEffect10079ui_story.fillRatio = var_132_9
			end

			local var_132_10 = 0

			if var_132_10 < arg_129_1.time_ and arg_129_1.time_ <= var_132_10 + arg_132_0 then
				arg_129_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_2")
			end

			local var_132_11 = 0

			if var_132_11 < arg_129_1.time_ and arg_129_1.time_ <= var_132_11 + arg_132_0 then
				arg_129_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_132_12 = arg_129_1.actors_["10079ui_story"].transform
			local var_132_13 = 0

			if var_132_13 < arg_129_1.time_ and arg_129_1.time_ <= var_132_13 + arg_132_0 then
				arg_129_1.var_.moveOldPos10079ui_story = var_132_12.localPosition
			end

			local var_132_14 = 0.001

			if var_132_13 <= arg_129_1.time_ and arg_129_1.time_ < var_132_13 + var_132_14 then
				local var_132_15 = (arg_129_1.time_ - var_132_13) / var_132_14
				local var_132_16 = Vector3.New(0.7, -0.95, -6.05)

				var_132_12.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos10079ui_story, var_132_16, var_132_15)

				local var_132_17 = manager.ui.mainCamera.transform.position - var_132_12.position

				var_132_12.forward = Vector3.New(var_132_17.x, var_132_17.y, var_132_17.z)

				local var_132_18 = var_132_12.localEulerAngles

				var_132_18.z = 0
				var_132_18.x = 0
				var_132_12.localEulerAngles = var_132_18
			end

			if arg_129_1.time_ >= var_132_13 + var_132_14 and arg_129_1.time_ < var_132_13 + var_132_14 + arg_132_0 then
				var_132_12.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_132_19 = manager.ui.mainCamera.transform.position - var_132_12.position

				var_132_12.forward = Vector3.New(var_132_19.x, var_132_19.y, var_132_19.z)

				local var_132_20 = var_132_12.localEulerAngles

				var_132_20.z = 0
				var_132_20.x = 0
				var_132_12.localEulerAngles = var_132_20
			end

			local var_132_21 = arg_129_1.actors_["1095ui_story"].transform
			local var_132_22 = 0

			if var_132_22 < arg_129_1.time_ and arg_129_1.time_ <= var_132_22 + arg_132_0 then
				arg_129_1.var_.moveOldPos1095ui_story = var_132_21.localPosition
			end

			local var_132_23 = 0.001

			if var_132_22 <= arg_129_1.time_ and arg_129_1.time_ < var_132_22 + var_132_23 then
				local var_132_24 = (arg_129_1.time_ - var_132_22) / var_132_23
				local var_132_25 = Vector3.New(-0.7, -0.98, -6.1)

				var_132_21.localPosition = Vector3.Lerp(arg_129_1.var_.moveOldPos1095ui_story, var_132_25, var_132_24)

				local var_132_26 = manager.ui.mainCamera.transform.position - var_132_21.position

				var_132_21.forward = Vector3.New(var_132_26.x, var_132_26.y, var_132_26.z)

				local var_132_27 = var_132_21.localEulerAngles

				var_132_27.z = 0
				var_132_27.x = 0
				var_132_21.localEulerAngles = var_132_27
			end

			if arg_129_1.time_ >= var_132_22 + var_132_23 and arg_129_1.time_ < var_132_22 + var_132_23 + arg_132_0 then
				var_132_21.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_132_28 = manager.ui.mainCamera.transform.position - var_132_21.position

				var_132_21.forward = Vector3.New(var_132_28.x, var_132_28.y, var_132_28.z)

				local var_132_29 = var_132_21.localEulerAngles

				var_132_29.z = 0
				var_132_29.x = 0
				var_132_21.localEulerAngles = var_132_29
			end

			local var_132_30 = 0
			local var_132_31 = 0.2

			if var_132_30 < arg_129_1.time_ and arg_129_1.time_ <= var_132_30 + arg_132_0 then
				arg_129_1.talkMaxDuration = 0
				arg_129_1.dialogCg_.alpha = 1

				arg_129_1.dialog_:SetActive(true)
				SetActive(arg_129_1.leftNameGo_, true)

				local var_132_32 = arg_129_1:FormatText(StoryNameCfg[471].name)

				arg_129_1.leftNameTxt_.text = var_132_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_129_1.leftNameTxt_.transform)

				arg_129_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_129_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_129_1:RecordName(arg_129_1.leftNameTxt_.text)
				SetActive(arg_129_1.iconTrs_.gameObject, false)
				arg_129_1.callingController_:SetSelectedState("normal")

				local var_132_33 = arg_129_1:GetWordFromCfg(319301032)
				local var_132_34 = arg_129_1:FormatText(var_132_33.content)

				arg_129_1.text_.text = var_132_34

				LuaForUtil.ClearLinePrefixSymbol(arg_129_1.text_)

				local var_132_35 = 8
				local var_132_36 = utf8.len(var_132_34)
				local var_132_37 = var_132_35 <= 0 and var_132_31 or var_132_31 * (var_132_36 / var_132_35)

				if var_132_37 > 0 and var_132_31 < var_132_37 then
					arg_129_1.talkMaxDuration = var_132_37

					if var_132_37 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_37 + var_132_30
					end
				end

				arg_129_1.text_.text = var_132_34
				arg_129_1.typewritter.percent = 0

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301032", "story_v_out_319301.awb") ~= 0 then
					local var_132_38 = manager.audio:GetVoiceLength("story_v_out_319301", "319301032", "story_v_out_319301.awb") / 1000

					if var_132_38 + var_132_30 > arg_129_1.duration_ then
						arg_129_1.duration_ = var_132_38 + var_132_30
					end

					if var_132_33.prefab_name ~= "" and arg_129_1.actors_[var_132_33.prefab_name] ~= nil then
						local var_132_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_129_1.actors_[var_132_33.prefab_name].transform, "story_v_out_319301", "319301032", "story_v_out_319301.awb")

						arg_129_1:RecordAudio("319301032", var_132_39)
						arg_129_1:RecordAudio("319301032", var_132_39)
					else
						arg_129_1:AudioAction("play", "voice", "story_v_out_319301", "319301032", "story_v_out_319301.awb")
					end

					arg_129_1:RecordHistoryTalkVoice("story_v_out_319301", "319301032", "story_v_out_319301.awb")
				end

				arg_129_1:RecordContent(arg_129_1.text_.text)
			end

			local var_132_40 = math.max(var_132_31, arg_129_1.talkMaxDuration)

			if var_132_30 <= arg_129_1.time_ and arg_129_1.time_ < var_132_30 + var_132_40 then
				arg_129_1.typewritter.percent = (arg_129_1.time_ - var_132_30) / var_132_40

				arg_129_1.typewritter:SetDirty()
			end

			if arg_129_1.time_ >= var_132_30 + var_132_40 and arg_129_1.time_ < var_132_30 + var_132_40 + arg_132_0 then
				arg_129_1.typewritter.percent = 1

				arg_129_1.typewritter:SetDirty()
				arg_129_1:ShowNextGo(true)
			end
		end
	end,
	Play319301033 = function(arg_133_0, arg_133_1)
		arg_133_1.time_ = 0
		arg_133_1.frameCnt_ = 0
		arg_133_1.state_ = "playing"
		arg_133_1.curTalkId_ = 319301033
		arg_133_1.duration_ = 3.866

		local var_133_0 = {
			zh = 2.4,
			ja = 3.866
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
				arg_133_0:Play319301034(arg_133_1)
			end
		end

		function arg_133_1.onSingleLineUpdate_(arg_136_0)
			local var_136_0 = arg_133_1.actors_["1095ui_story"]
			local var_136_1 = 0

			if var_136_1 < arg_133_1.time_ and arg_133_1.time_ <= var_136_1 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story == nil then
				arg_133_1.var_.characterEffect1095ui_story = var_136_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_2 = 0.200000002980232

			if var_136_1 <= arg_133_1.time_ and arg_133_1.time_ < var_136_1 + var_136_2 then
				local var_136_3 = (arg_133_1.time_ - var_136_1) / var_136_2

				if arg_133_1.var_.characterEffect1095ui_story then
					local var_136_4 = Mathf.Lerp(0, 0.5, var_136_3)

					arg_133_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_133_1.var_.characterEffect1095ui_story.fillRatio = var_136_4
				end
			end

			if arg_133_1.time_ >= var_136_1 + var_136_2 and arg_133_1.time_ < var_136_1 + var_136_2 + arg_136_0 and arg_133_1.var_.characterEffect1095ui_story then
				local var_136_5 = 0.5

				arg_133_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_133_1.var_.characterEffect1095ui_story.fillRatio = var_136_5
			end

			local var_136_6 = arg_133_1.actors_["10079ui_story"]
			local var_136_7 = 0

			if var_136_7 < arg_133_1.time_ and arg_133_1.time_ <= var_136_7 + arg_136_0 and arg_133_1.var_.characterEffect10079ui_story == nil then
				arg_133_1.var_.characterEffect10079ui_story = var_136_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_136_8 = 0.200000002980232

			if var_136_7 <= arg_133_1.time_ and arg_133_1.time_ < var_136_7 + var_136_8 then
				local var_136_9 = (arg_133_1.time_ - var_136_7) / var_136_8

				if arg_133_1.var_.characterEffect10079ui_story then
					arg_133_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_133_1.time_ >= var_136_7 + var_136_8 and arg_133_1.time_ < var_136_7 + var_136_8 + arg_136_0 and arg_133_1.var_.characterEffect10079ui_story then
				arg_133_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_136_10 = 0

			if var_136_10 < arg_133_1.time_ and arg_133_1.time_ <= var_136_10 + arg_136_0 then
				arg_133_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_136_11 = 0
			local var_136_12 = 0.25

			if var_136_11 < arg_133_1.time_ and arg_133_1.time_ <= var_136_11 + arg_136_0 then
				arg_133_1.talkMaxDuration = 0
				arg_133_1.dialogCg_.alpha = 1

				arg_133_1.dialog_:SetActive(true)
				SetActive(arg_133_1.leftNameGo_, true)

				local var_136_13 = arg_133_1:FormatText(StoryNameCfg[6].name)

				arg_133_1.leftNameTxt_.text = var_136_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_133_1.leftNameTxt_.transform)

				arg_133_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_133_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_133_1:RecordName(arg_133_1.leftNameTxt_.text)
				SetActive(arg_133_1.iconTrs_.gameObject, false)
				arg_133_1.callingController_:SetSelectedState("normal")

				local var_136_14 = arg_133_1:GetWordFromCfg(319301033)
				local var_136_15 = arg_133_1:FormatText(var_136_14.content)

				arg_133_1.text_.text = var_136_15

				LuaForUtil.ClearLinePrefixSymbol(arg_133_1.text_)

				local var_136_16 = 10
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301033", "story_v_out_319301.awb") ~= 0 then
					local var_136_19 = manager.audio:GetVoiceLength("story_v_out_319301", "319301033", "story_v_out_319301.awb") / 1000

					if var_136_19 + var_136_11 > arg_133_1.duration_ then
						arg_133_1.duration_ = var_136_19 + var_136_11
					end

					if var_136_14.prefab_name ~= "" and arg_133_1.actors_[var_136_14.prefab_name] ~= nil then
						local var_136_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_133_1.actors_[var_136_14.prefab_name].transform, "story_v_out_319301", "319301033", "story_v_out_319301.awb")

						arg_133_1:RecordAudio("319301033", var_136_20)
						arg_133_1:RecordAudio("319301033", var_136_20)
					else
						arg_133_1:AudioAction("play", "voice", "story_v_out_319301", "319301033", "story_v_out_319301.awb")
					end

					arg_133_1:RecordHistoryTalkVoice("story_v_out_319301", "319301033", "story_v_out_319301.awb")
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
	Play319301034 = function(arg_137_0, arg_137_1)
		arg_137_1.time_ = 0
		arg_137_1.frameCnt_ = 0
		arg_137_1.state_ = "playing"
		arg_137_1.curTalkId_ = 319301034
		arg_137_1.duration_ = 3.766

		local var_137_0 = {
			zh = 2.6,
			ja = 3.766
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
				arg_137_0:Play319301035(arg_137_1)
			end
		end

		function arg_137_1.onSingleLineUpdate_(arg_140_0)
			local var_140_0 = arg_137_1.actors_["10079ui_story"]
			local var_140_1 = 0

			if var_140_1 < arg_137_1.time_ and arg_137_1.time_ <= var_140_1 + arg_140_0 and arg_137_1.var_.characterEffect10079ui_story == nil then
				arg_137_1.var_.characterEffect10079ui_story = var_140_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_2 = 0.200000002980232

			if var_140_1 <= arg_137_1.time_ and arg_137_1.time_ < var_140_1 + var_140_2 then
				local var_140_3 = (arg_137_1.time_ - var_140_1) / var_140_2

				if arg_137_1.var_.characterEffect10079ui_story then
					local var_140_4 = Mathf.Lerp(0, 0.5, var_140_3)

					arg_137_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_137_1.var_.characterEffect10079ui_story.fillRatio = var_140_4
				end
			end

			if arg_137_1.time_ >= var_140_1 + var_140_2 and arg_137_1.time_ < var_140_1 + var_140_2 + arg_140_0 and arg_137_1.var_.characterEffect10079ui_story then
				local var_140_5 = 0.5

				arg_137_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_137_1.var_.characterEffect10079ui_story.fillRatio = var_140_5
			end

			local var_140_6 = arg_137_1.actors_["1095ui_story"]
			local var_140_7 = 0

			if var_140_7 < arg_137_1.time_ and arg_137_1.time_ <= var_140_7 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story == nil then
				arg_137_1.var_.characterEffect1095ui_story = var_140_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_140_8 = 0.200000002980232

			if var_140_7 <= arg_137_1.time_ and arg_137_1.time_ < var_140_7 + var_140_8 then
				local var_140_9 = (arg_137_1.time_ - var_140_7) / var_140_8

				if arg_137_1.var_.characterEffect1095ui_story then
					arg_137_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_137_1.time_ >= var_140_7 + var_140_8 and arg_137_1.time_ < var_140_7 + var_140_8 + arg_140_0 and arg_137_1.var_.characterEffect1095ui_story then
				arg_137_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_140_10 = 0
			local var_140_11 = 0.275

			if var_140_10 < arg_137_1.time_ and arg_137_1.time_ <= var_140_10 + arg_140_0 then
				arg_137_1.talkMaxDuration = 0
				arg_137_1.dialogCg_.alpha = 1

				arg_137_1.dialog_:SetActive(true)
				SetActive(arg_137_1.leftNameGo_, true)

				local var_140_12 = arg_137_1:FormatText(StoryNameCfg[471].name)

				arg_137_1.leftNameTxt_.text = var_140_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_137_1.leftNameTxt_.transform)

				arg_137_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_137_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_137_1:RecordName(arg_137_1.leftNameTxt_.text)
				SetActive(arg_137_1.iconTrs_.gameObject, false)
				arg_137_1.callingController_:SetSelectedState("normal")

				local var_140_13 = arg_137_1:GetWordFromCfg(319301034)
				local var_140_14 = arg_137_1:FormatText(var_140_13.content)

				arg_137_1.text_.text = var_140_14

				LuaForUtil.ClearLinePrefixSymbol(arg_137_1.text_)

				local var_140_15 = 11
				local var_140_16 = utf8.len(var_140_14)
				local var_140_17 = var_140_15 <= 0 and var_140_11 or var_140_11 * (var_140_16 / var_140_15)

				if var_140_17 > 0 and var_140_11 < var_140_17 then
					arg_137_1.talkMaxDuration = var_140_17

					if var_140_17 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_17 + var_140_10
					end
				end

				arg_137_1.text_.text = var_140_14
				arg_137_1.typewritter.percent = 0

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301034", "story_v_out_319301.awb") ~= 0 then
					local var_140_18 = manager.audio:GetVoiceLength("story_v_out_319301", "319301034", "story_v_out_319301.awb") / 1000

					if var_140_18 + var_140_10 > arg_137_1.duration_ then
						arg_137_1.duration_ = var_140_18 + var_140_10
					end

					if var_140_13.prefab_name ~= "" and arg_137_1.actors_[var_140_13.prefab_name] ~= nil then
						local var_140_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_137_1.actors_[var_140_13.prefab_name].transform, "story_v_out_319301", "319301034", "story_v_out_319301.awb")

						arg_137_1:RecordAudio("319301034", var_140_19)
						arg_137_1:RecordAudio("319301034", var_140_19)
					else
						arg_137_1:AudioAction("play", "voice", "story_v_out_319301", "319301034", "story_v_out_319301.awb")
					end

					arg_137_1:RecordHistoryTalkVoice("story_v_out_319301", "319301034", "story_v_out_319301.awb")
				end

				arg_137_1:RecordContent(arg_137_1.text_.text)
			end

			local var_140_20 = math.max(var_140_11, arg_137_1.talkMaxDuration)

			if var_140_10 <= arg_137_1.time_ and arg_137_1.time_ < var_140_10 + var_140_20 then
				arg_137_1.typewritter.percent = (arg_137_1.time_ - var_140_10) / var_140_20

				arg_137_1.typewritter:SetDirty()
			end

			if arg_137_1.time_ >= var_140_10 + var_140_20 and arg_137_1.time_ < var_140_10 + var_140_20 + arg_140_0 then
				arg_137_1.typewritter.percent = 1

				arg_137_1.typewritter:SetDirty()
				arg_137_1:ShowNextGo(true)
			end
		end
	end,
	Play319301035 = function(arg_141_0, arg_141_1)
		arg_141_1.time_ = 0
		arg_141_1.frameCnt_ = 0
		arg_141_1.state_ = "playing"
		arg_141_1.curTalkId_ = 319301035
		arg_141_1.duration_ = 5.866

		local var_141_0 = {
			zh = 3.633,
			ja = 5.866
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
				arg_141_0:Play319301036(arg_141_1)
			end
		end

		function arg_141_1.onSingleLineUpdate_(arg_144_0)
			local var_144_0 = arg_141_1.actors_["10079ui_story"].transform
			local var_144_1 = 0

			if var_144_1 < arg_141_1.time_ and arg_141_1.time_ <= var_144_1 + arg_144_0 then
				arg_141_1.var_.moveOldPos10079ui_story = var_144_0.localPosition
			end

			local var_144_2 = 0.001

			if var_144_1 <= arg_141_1.time_ and arg_141_1.time_ < var_144_1 + var_144_2 then
				local var_144_3 = (arg_141_1.time_ - var_144_1) / var_144_2
				local var_144_4 = Vector3.New(0.7, -0.95, -6.05)

				var_144_0.localPosition = Vector3.Lerp(arg_141_1.var_.moveOldPos10079ui_story, var_144_4, var_144_3)

				local var_144_5 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_5.x, var_144_5.y, var_144_5.z)

				local var_144_6 = var_144_0.localEulerAngles

				var_144_6.z = 0
				var_144_6.x = 0
				var_144_0.localEulerAngles = var_144_6
			end

			if arg_141_1.time_ >= var_144_1 + var_144_2 and arg_141_1.time_ < var_144_1 + var_144_2 + arg_144_0 then
				var_144_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_144_7 = manager.ui.mainCamera.transform.position - var_144_0.position

				var_144_0.forward = Vector3.New(var_144_7.x, var_144_7.y, var_144_7.z)

				local var_144_8 = var_144_0.localEulerAngles

				var_144_8.z = 0
				var_144_8.x = 0
				var_144_0.localEulerAngles = var_144_8
			end

			local var_144_9 = arg_141_1.actors_["10079ui_story"]
			local var_144_10 = 0

			if var_144_10 < arg_141_1.time_ and arg_141_1.time_ <= var_144_10 + arg_144_0 and arg_141_1.var_.characterEffect10079ui_story == nil then
				arg_141_1.var_.characterEffect10079ui_story = var_144_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_11 = 0.200000002980232

			if var_144_10 <= arg_141_1.time_ and arg_141_1.time_ < var_144_10 + var_144_11 then
				local var_144_12 = (arg_141_1.time_ - var_144_10) / var_144_11

				if arg_141_1.var_.characterEffect10079ui_story then
					arg_141_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_141_1.time_ >= var_144_10 + var_144_11 and arg_141_1.time_ < var_144_10 + var_144_11 + arg_144_0 and arg_141_1.var_.characterEffect10079ui_story then
				arg_141_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_144_13 = 0

			if var_144_13 < arg_141_1.time_ and arg_141_1.time_ <= var_144_13 + arg_144_0 then
				arg_141_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action5_2")
			end

			local var_144_14 = 0

			if var_144_14 < arg_141_1.time_ and arg_141_1.time_ <= var_144_14 + arg_144_0 then
				arg_141_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2102cva")
			end

			local var_144_15 = arg_141_1.actors_["1095ui_story"]
			local var_144_16 = 0

			if var_144_16 < arg_141_1.time_ and arg_141_1.time_ <= var_144_16 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story == nil then
				arg_141_1.var_.characterEffect1095ui_story = var_144_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_144_17 = 0.200000002980232

			if var_144_16 <= arg_141_1.time_ and arg_141_1.time_ < var_144_16 + var_144_17 then
				local var_144_18 = (arg_141_1.time_ - var_144_16) / var_144_17

				if arg_141_1.var_.characterEffect1095ui_story then
					local var_144_19 = Mathf.Lerp(0, 0.5, var_144_18)

					arg_141_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_141_1.var_.characterEffect1095ui_story.fillRatio = var_144_19
				end
			end

			if arg_141_1.time_ >= var_144_16 + var_144_17 and arg_141_1.time_ < var_144_16 + var_144_17 + arg_144_0 and arg_141_1.var_.characterEffect1095ui_story then
				local var_144_20 = 0.5

				arg_141_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_141_1.var_.characterEffect1095ui_story.fillRatio = var_144_20
			end

			local var_144_21 = 0
			local var_144_22 = 0.3

			if var_144_21 < arg_141_1.time_ and arg_141_1.time_ <= var_144_21 + arg_144_0 then
				arg_141_1.talkMaxDuration = 0
				arg_141_1.dialogCg_.alpha = 1

				arg_141_1.dialog_:SetActive(true)
				SetActive(arg_141_1.leftNameGo_, true)

				local var_144_23 = arg_141_1:FormatText(StoryNameCfg[6].name)

				arg_141_1.leftNameTxt_.text = var_144_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_141_1.leftNameTxt_.transform)

				arg_141_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_141_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_141_1:RecordName(arg_141_1.leftNameTxt_.text)
				SetActive(arg_141_1.iconTrs_.gameObject, false)
				arg_141_1.callingController_:SetSelectedState("normal")

				local var_144_24 = arg_141_1:GetWordFromCfg(319301035)
				local var_144_25 = arg_141_1:FormatText(var_144_24.content)

				arg_141_1.text_.text = var_144_25

				LuaForUtil.ClearLinePrefixSymbol(arg_141_1.text_)

				local var_144_26 = 12
				local var_144_27 = utf8.len(var_144_25)
				local var_144_28 = var_144_26 <= 0 and var_144_22 or var_144_22 * (var_144_27 / var_144_26)

				if var_144_28 > 0 and var_144_22 < var_144_28 then
					arg_141_1.talkMaxDuration = var_144_28

					if var_144_28 + var_144_21 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_28 + var_144_21
					end
				end

				arg_141_1.text_.text = var_144_25
				arg_141_1.typewritter.percent = 0

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301035", "story_v_out_319301.awb") ~= 0 then
					local var_144_29 = manager.audio:GetVoiceLength("story_v_out_319301", "319301035", "story_v_out_319301.awb") / 1000

					if var_144_29 + var_144_21 > arg_141_1.duration_ then
						arg_141_1.duration_ = var_144_29 + var_144_21
					end

					if var_144_24.prefab_name ~= "" and arg_141_1.actors_[var_144_24.prefab_name] ~= nil then
						local var_144_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_141_1.actors_[var_144_24.prefab_name].transform, "story_v_out_319301", "319301035", "story_v_out_319301.awb")

						arg_141_1:RecordAudio("319301035", var_144_30)
						arg_141_1:RecordAudio("319301035", var_144_30)
					else
						arg_141_1:AudioAction("play", "voice", "story_v_out_319301", "319301035", "story_v_out_319301.awb")
					end

					arg_141_1:RecordHistoryTalkVoice("story_v_out_319301", "319301035", "story_v_out_319301.awb")
				end

				arg_141_1:RecordContent(arg_141_1.text_.text)
			end

			local var_144_31 = math.max(var_144_22, arg_141_1.talkMaxDuration)

			if var_144_21 <= arg_141_1.time_ and arg_141_1.time_ < var_144_21 + var_144_31 then
				arg_141_1.typewritter.percent = (arg_141_1.time_ - var_144_21) / var_144_31

				arg_141_1.typewritter:SetDirty()
			end

			if arg_141_1.time_ >= var_144_21 + var_144_31 and arg_141_1.time_ < var_144_21 + var_144_31 + arg_144_0 then
				arg_141_1.typewritter.percent = 1

				arg_141_1.typewritter:SetDirty()
				arg_141_1:ShowNextGo(true)
			end
		end
	end,
	Play319301036 = function(arg_145_0, arg_145_1)
		arg_145_1.time_ = 0
		arg_145_1.frameCnt_ = 0
		arg_145_1.state_ = "playing"
		arg_145_1.curTalkId_ = 319301036
		arg_145_1.duration_ = 7.666

		local var_145_0 = {
			zh = 3.6,
			ja = 7.666
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
				arg_145_0:Play319301037(arg_145_1)
			end
		end

		function arg_145_1.onSingleLineUpdate_(arg_148_0)
			local var_148_0 = arg_145_1.actors_["10079ui_story"]
			local var_148_1 = 0

			if var_148_1 < arg_145_1.time_ and arg_145_1.time_ <= var_148_1 + arg_148_0 and arg_145_1.var_.characterEffect10079ui_story == nil then
				arg_145_1.var_.characterEffect10079ui_story = var_148_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_2 = 0.200000002980232

			if var_148_1 <= arg_145_1.time_ and arg_145_1.time_ < var_148_1 + var_148_2 then
				local var_148_3 = (arg_145_1.time_ - var_148_1) / var_148_2

				if arg_145_1.var_.characterEffect10079ui_story then
					local var_148_4 = Mathf.Lerp(0, 0.5, var_148_3)

					arg_145_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_145_1.var_.characterEffect10079ui_story.fillRatio = var_148_4
				end
			end

			if arg_145_1.time_ >= var_148_1 + var_148_2 and arg_145_1.time_ < var_148_1 + var_148_2 + arg_148_0 and arg_145_1.var_.characterEffect10079ui_story then
				local var_148_5 = 0.5

				arg_145_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_145_1.var_.characterEffect10079ui_story.fillRatio = var_148_5
			end

			local var_148_6 = arg_145_1.actors_["1095ui_story"]
			local var_148_7 = 0

			if var_148_7 < arg_145_1.time_ and arg_145_1.time_ <= var_148_7 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story == nil then
				arg_145_1.var_.characterEffect1095ui_story = var_148_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_148_8 = 0.200000002980232

			if var_148_7 <= arg_145_1.time_ and arg_145_1.time_ < var_148_7 + var_148_8 then
				local var_148_9 = (arg_145_1.time_ - var_148_7) / var_148_8

				if arg_145_1.var_.characterEffect1095ui_story then
					arg_145_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_145_1.time_ >= var_148_7 + var_148_8 and arg_145_1.time_ < var_148_7 + var_148_8 + arg_148_0 and arg_145_1.var_.characterEffect1095ui_story then
				arg_145_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_148_10 = 0

			if var_148_10 < arg_145_1.time_ and arg_145_1.time_ <= var_148_10 + arg_148_0 then
				arg_145_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_1")
			end

			local var_148_11 = 0

			if var_148_11 < arg_145_1.time_ and arg_145_1.time_ <= var_148_11 + arg_148_0 then
				arg_145_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_148_12 = 0
			local var_148_13 = 0.5

			if var_148_12 < arg_145_1.time_ and arg_145_1.time_ <= var_148_12 + arg_148_0 then
				arg_145_1.talkMaxDuration = 0
				arg_145_1.dialogCg_.alpha = 1

				arg_145_1.dialog_:SetActive(true)
				SetActive(arg_145_1.leftNameGo_, true)

				local var_148_14 = arg_145_1:FormatText(StoryNameCfg[471].name)

				arg_145_1.leftNameTxt_.text = var_148_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_145_1.leftNameTxt_.transform)

				arg_145_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_145_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_145_1:RecordName(arg_145_1.leftNameTxt_.text)
				SetActive(arg_145_1.iconTrs_.gameObject, false)
				arg_145_1.callingController_:SetSelectedState("normal")

				local var_148_15 = arg_145_1:GetWordFromCfg(319301036)
				local var_148_16 = arg_145_1:FormatText(var_148_15.content)

				arg_145_1.text_.text = var_148_16

				LuaForUtil.ClearLinePrefixSymbol(arg_145_1.text_)

				local var_148_17 = 20
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301036", "story_v_out_319301.awb") ~= 0 then
					local var_148_20 = manager.audio:GetVoiceLength("story_v_out_319301", "319301036", "story_v_out_319301.awb") / 1000

					if var_148_20 + var_148_12 > arg_145_1.duration_ then
						arg_145_1.duration_ = var_148_20 + var_148_12
					end

					if var_148_15.prefab_name ~= "" and arg_145_1.actors_[var_148_15.prefab_name] ~= nil then
						local var_148_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_145_1.actors_[var_148_15.prefab_name].transform, "story_v_out_319301", "319301036", "story_v_out_319301.awb")

						arg_145_1:RecordAudio("319301036", var_148_21)
						arg_145_1:RecordAudio("319301036", var_148_21)
					else
						arg_145_1:AudioAction("play", "voice", "story_v_out_319301", "319301036", "story_v_out_319301.awb")
					end

					arg_145_1:RecordHistoryTalkVoice("story_v_out_319301", "319301036", "story_v_out_319301.awb")
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
	Play319301037 = function(arg_149_0, arg_149_1)
		arg_149_1.time_ = 0
		arg_149_1.frameCnt_ = 0
		arg_149_1.state_ = "playing"
		arg_149_1.curTalkId_ = 319301037
		arg_149_1.duration_ = 9.066

		local var_149_0 = {
			zh = 4.6,
			ja = 9.066
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
				arg_149_0:Play319301038(arg_149_1)
			end
		end

		function arg_149_1.onSingleLineUpdate_(arg_152_0)
			local var_152_0 = 0

			if var_152_0 < arg_149_1.time_ and arg_149_1.time_ <= var_152_0 + arg_152_0 then
				arg_149_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action6_2")
			end

			local var_152_1 = 0
			local var_152_2 = 0.6

			if var_152_1 < arg_149_1.time_ and arg_149_1.time_ <= var_152_1 + arg_152_0 then
				arg_149_1.talkMaxDuration = 0
				arg_149_1.dialogCg_.alpha = 1

				arg_149_1.dialog_:SetActive(true)
				SetActive(arg_149_1.leftNameGo_, true)

				local var_152_3 = arg_149_1:FormatText(StoryNameCfg[471].name)

				arg_149_1.leftNameTxt_.text = var_152_3

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_149_1.leftNameTxt_.transform)

				arg_149_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_149_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_149_1:RecordName(arg_149_1.leftNameTxt_.text)
				SetActive(arg_149_1.iconTrs_.gameObject, false)
				arg_149_1.callingController_:SetSelectedState("normal")

				local var_152_4 = arg_149_1:GetWordFromCfg(319301037)
				local var_152_5 = arg_149_1:FormatText(var_152_4.content)

				arg_149_1.text_.text = var_152_5

				LuaForUtil.ClearLinePrefixSymbol(arg_149_1.text_)

				local var_152_6 = 24
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301037", "story_v_out_319301.awb") ~= 0 then
					local var_152_9 = manager.audio:GetVoiceLength("story_v_out_319301", "319301037", "story_v_out_319301.awb") / 1000

					if var_152_9 + var_152_1 > arg_149_1.duration_ then
						arg_149_1.duration_ = var_152_9 + var_152_1
					end

					if var_152_4.prefab_name ~= "" and arg_149_1.actors_[var_152_4.prefab_name] ~= nil then
						local var_152_10 = LuaForUtil.PlayVoiceWithCriLipsync(arg_149_1.actors_[var_152_4.prefab_name].transform, "story_v_out_319301", "319301037", "story_v_out_319301.awb")

						arg_149_1:RecordAudio("319301037", var_152_10)
						arg_149_1:RecordAudio("319301037", var_152_10)
					else
						arg_149_1:AudioAction("play", "voice", "story_v_out_319301", "319301037", "story_v_out_319301.awb")
					end

					arg_149_1:RecordHistoryTalkVoice("story_v_out_319301", "319301037", "story_v_out_319301.awb")
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
	Play319301038 = function(arg_153_0, arg_153_1)
		arg_153_1.time_ = 0
		arg_153_1.frameCnt_ = 0
		arg_153_1.state_ = "playing"
		arg_153_1.curTalkId_ = 319301038
		arg_153_1.duration_ = 3.2

		local var_153_0 = {
			zh = 1.999999999999,
			ja = 3.2
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
				arg_153_0:Play319301039(arg_153_1)
			end
		end

		function arg_153_1.onSingleLineUpdate_(arg_156_0)
			local var_156_0 = arg_153_1.actors_["10079ui_story"]
			local var_156_1 = 0

			if var_156_1 < arg_153_1.time_ and arg_153_1.time_ <= var_156_1 + arg_156_0 and arg_153_1.var_.characterEffect10079ui_story == nil then
				arg_153_1.var_.characterEffect10079ui_story = var_156_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_2 = 0.200000002980232

			if var_156_1 <= arg_153_1.time_ and arg_153_1.time_ < var_156_1 + var_156_2 then
				local var_156_3 = (arg_153_1.time_ - var_156_1) / var_156_2

				if arg_153_1.var_.characterEffect10079ui_story then
					arg_153_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_153_1.time_ >= var_156_1 + var_156_2 and arg_153_1.time_ < var_156_1 + var_156_2 + arg_156_0 and arg_153_1.var_.characterEffect10079ui_story then
				arg_153_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_156_4 = arg_153_1.actors_["1095ui_story"]
			local var_156_5 = 0

			if var_156_5 < arg_153_1.time_ and arg_153_1.time_ <= var_156_5 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story == nil then
				arg_153_1.var_.characterEffect1095ui_story = var_156_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_156_6 = 0.200000002980232

			if var_156_5 <= arg_153_1.time_ and arg_153_1.time_ < var_156_5 + var_156_6 then
				local var_156_7 = (arg_153_1.time_ - var_156_5) / var_156_6

				if arg_153_1.var_.characterEffect1095ui_story then
					local var_156_8 = Mathf.Lerp(0, 0.5, var_156_7)

					arg_153_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_153_1.var_.characterEffect1095ui_story.fillRatio = var_156_8
				end
			end

			if arg_153_1.time_ >= var_156_5 + var_156_6 and arg_153_1.time_ < var_156_5 + var_156_6 + arg_156_0 and arg_153_1.var_.characterEffect1095ui_story then
				local var_156_9 = 0.5

				arg_153_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_153_1.var_.characterEffect1095ui_story.fillRatio = var_156_9
			end

			local var_156_10 = 0

			if var_156_10 < arg_153_1.time_ and arg_153_1.time_ <= var_156_10 + arg_156_0 then
				arg_153_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_156_11 = 0
			local var_156_12 = 0.175

			if var_156_11 < arg_153_1.time_ and arg_153_1.time_ <= var_156_11 + arg_156_0 then
				arg_153_1.talkMaxDuration = 0
				arg_153_1.dialogCg_.alpha = 1

				arg_153_1.dialog_:SetActive(true)
				SetActive(arg_153_1.leftNameGo_, true)

				local var_156_13 = arg_153_1:FormatText(StoryNameCfg[6].name)

				arg_153_1.leftNameTxt_.text = var_156_13

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_153_1.leftNameTxt_.transform)

				arg_153_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_153_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_153_1:RecordName(arg_153_1.leftNameTxt_.text)
				SetActive(arg_153_1.iconTrs_.gameObject, false)
				arg_153_1.callingController_:SetSelectedState("normal")

				local var_156_14 = arg_153_1:GetWordFromCfg(319301038)
				local var_156_15 = arg_153_1:FormatText(var_156_14.content)

				arg_153_1.text_.text = var_156_15

				LuaForUtil.ClearLinePrefixSymbol(arg_153_1.text_)

				local var_156_16 = 7
				local var_156_17 = utf8.len(var_156_15)
				local var_156_18 = var_156_16 <= 0 and var_156_12 or var_156_12 * (var_156_17 / var_156_16)

				if var_156_18 > 0 and var_156_12 < var_156_18 then
					arg_153_1.talkMaxDuration = var_156_18

					if var_156_18 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_18 + var_156_11
					end
				end

				arg_153_1.text_.text = var_156_15
				arg_153_1.typewritter.percent = 0

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301038", "story_v_out_319301.awb") ~= 0 then
					local var_156_19 = manager.audio:GetVoiceLength("story_v_out_319301", "319301038", "story_v_out_319301.awb") / 1000

					if var_156_19 + var_156_11 > arg_153_1.duration_ then
						arg_153_1.duration_ = var_156_19 + var_156_11
					end

					if var_156_14.prefab_name ~= "" and arg_153_1.actors_[var_156_14.prefab_name] ~= nil then
						local var_156_20 = LuaForUtil.PlayVoiceWithCriLipsync(arg_153_1.actors_[var_156_14.prefab_name].transform, "story_v_out_319301", "319301038", "story_v_out_319301.awb")

						arg_153_1:RecordAudio("319301038", var_156_20)
						arg_153_1:RecordAudio("319301038", var_156_20)
					else
						arg_153_1:AudioAction("play", "voice", "story_v_out_319301", "319301038", "story_v_out_319301.awb")
					end

					arg_153_1:RecordHistoryTalkVoice("story_v_out_319301", "319301038", "story_v_out_319301.awb")
				end

				arg_153_1:RecordContent(arg_153_1.text_.text)
			end

			local var_156_21 = math.max(var_156_12, arg_153_1.talkMaxDuration)

			if var_156_11 <= arg_153_1.time_ and arg_153_1.time_ < var_156_11 + var_156_21 then
				arg_153_1.typewritter.percent = (arg_153_1.time_ - var_156_11) / var_156_21

				arg_153_1.typewritter:SetDirty()
			end

			if arg_153_1.time_ >= var_156_11 + var_156_21 and arg_153_1.time_ < var_156_11 + var_156_21 + arg_156_0 then
				arg_153_1.typewritter.percent = 1

				arg_153_1.typewritter:SetDirty()
				arg_153_1:ShowNextGo(true)
			end
		end
	end,
	Play319301039 = function(arg_157_0, arg_157_1)
		arg_157_1.time_ = 0
		arg_157_1.frameCnt_ = 0
		arg_157_1.state_ = "playing"
		arg_157_1.curTalkId_ = 319301039
		arg_157_1.duration_ = 5

		SetActive(arg_157_1.tipsGo_, false)

		function arg_157_1.onSingleLineFinish_()
			arg_157_1.onSingleLineUpdate_ = nil
			arg_157_1.onSingleLineFinish_ = nil
			arg_157_1.state_ = "waiting"
		end

		function arg_157_1.playNext_(arg_159_0)
			if arg_159_0 == 1 then
				arg_157_0:Play319301040(arg_157_1)
			end
		end

		function arg_157_1.onSingleLineUpdate_(arg_160_0)
			local var_160_0 = arg_157_1.actors_["10079ui_story"].transform
			local var_160_1 = 0

			if var_160_1 < arg_157_1.time_ and arg_157_1.time_ <= var_160_1 + arg_160_0 then
				arg_157_1.var_.moveOldPos10079ui_story = var_160_0.localPosition
			end

			local var_160_2 = 0.001

			if var_160_1 <= arg_157_1.time_ and arg_157_1.time_ < var_160_1 + var_160_2 then
				local var_160_3 = (arg_157_1.time_ - var_160_1) / var_160_2
				local var_160_4 = Vector3.New(0, 100, 0)

				var_160_0.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos10079ui_story, var_160_4, var_160_3)

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

			local var_160_9 = arg_157_1.actors_["1095ui_story"].transform
			local var_160_10 = 0

			if var_160_10 < arg_157_1.time_ and arg_157_1.time_ <= var_160_10 + arg_160_0 then
				arg_157_1.var_.moveOldPos1095ui_story = var_160_9.localPosition
			end

			local var_160_11 = 0.001

			if var_160_10 <= arg_157_1.time_ and arg_157_1.time_ < var_160_10 + var_160_11 then
				local var_160_12 = (arg_157_1.time_ - var_160_10) / var_160_11
				local var_160_13 = Vector3.New(0, 100, 0)

				var_160_9.localPosition = Vector3.Lerp(arg_157_1.var_.moveOldPos1095ui_story, var_160_13, var_160_12)

				local var_160_14 = manager.ui.mainCamera.transform.position - var_160_9.position

				var_160_9.forward = Vector3.New(var_160_14.x, var_160_14.y, var_160_14.z)

				local var_160_15 = var_160_9.localEulerAngles

				var_160_15.z = 0
				var_160_15.x = 0
				var_160_9.localEulerAngles = var_160_15
			end

			if arg_157_1.time_ >= var_160_10 + var_160_11 and arg_157_1.time_ < var_160_10 + var_160_11 + arg_160_0 then
				var_160_9.localPosition = Vector3.New(0, 100, 0)

				local var_160_16 = manager.ui.mainCamera.transform.position - var_160_9.position

				var_160_9.forward = Vector3.New(var_160_16.x, var_160_16.y, var_160_16.z)

				local var_160_17 = var_160_9.localEulerAngles

				var_160_17.z = 0
				var_160_17.x = 0
				var_160_9.localEulerAngles = var_160_17
			end

			local var_160_18 = 0
			local var_160_19 = 1.175

			if var_160_18 < arg_157_1.time_ and arg_157_1.time_ <= var_160_18 + arg_160_0 then
				arg_157_1.talkMaxDuration = 0
				arg_157_1.dialogCg_.alpha = 1

				arg_157_1.dialog_:SetActive(true)
				SetActive(arg_157_1.leftNameGo_, false)

				arg_157_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_157_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_157_1:RecordName(arg_157_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_157_1.iconTrs_.gameObject, false)
				arg_157_1.callingController_:SetSelectedState("normal")

				local var_160_20 = arg_157_1:GetWordFromCfg(319301039)
				local var_160_21 = arg_157_1:FormatText(var_160_20.content)

				arg_157_1.text_.text = var_160_21

				LuaForUtil.ClearLinePrefixSymbol(arg_157_1.text_)

				local var_160_22 = 47
				local var_160_23 = utf8.len(var_160_21)
				local var_160_24 = var_160_22 <= 0 and var_160_19 or var_160_19 * (var_160_23 / var_160_22)

				if var_160_24 > 0 and var_160_19 < var_160_24 then
					arg_157_1.talkMaxDuration = var_160_24

					if var_160_24 + var_160_18 > arg_157_1.duration_ then
						arg_157_1.duration_ = var_160_24 + var_160_18
					end
				end

				arg_157_1.text_.text = var_160_21
				arg_157_1.typewritter.percent = 0

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(false)
				arg_157_1:RecordContent(arg_157_1.text_.text)
			end

			local var_160_25 = math.max(var_160_19, arg_157_1.talkMaxDuration)

			if var_160_18 <= arg_157_1.time_ and arg_157_1.time_ < var_160_18 + var_160_25 then
				arg_157_1.typewritter.percent = (arg_157_1.time_ - var_160_18) / var_160_25

				arg_157_1.typewritter:SetDirty()
			end

			if arg_157_1.time_ >= var_160_18 + var_160_25 and arg_157_1.time_ < var_160_18 + var_160_25 + arg_160_0 then
				arg_157_1.typewritter.percent = 1

				arg_157_1.typewritter:SetDirty()
				arg_157_1:ShowNextGo(true)
			end
		end
	end,
	Play319301040 = function(arg_161_0, arg_161_1)
		arg_161_1.time_ = 0
		arg_161_1.frameCnt_ = 0
		arg_161_1.state_ = "playing"
		arg_161_1.curTalkId_ = 319301040
		arg_161_1.duration_ = 5

		SetActive(arg_161_1.tipsGo_, false)

		function arg_161_1.onSingleLineFinish_()
			arg_161_1.onSingleLineUpdate_ = nil
			arg_161_1.onSingleLineFinish_ = nil
			arg_161_1.state_ = "waiting"
		end

		function arg_161_1.playNext_(arg_163_0)
			if arg_163_0 == 1 then
				arg_161_0:Play319301041(arg_161_1)
			end
		end

		function arg_161_1.onSingleLineUpdate_(arg_164_0)
			local var_164_0 = 0
			local var_164_1 = 0.775

			if var_164_0 < arg_161_1.time_ and arg_161_1.time_ <= var_164_0 + arg_164_0 then
				arg_161_1.talkMaxDuration = 0
				arg_161_1.dialogCg_.alpha = 1

				arg_161_1.dialog_:SetActive(true)
				SetActive(arg_161_1.leftNameGo_, false)

				arg_161_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_161_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_161_1:RecordName(arg_161_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_161_1.iconTrs_.gameObject, false)
				arg_161_1.callingController_:SetSelectedState("normal")

				local var_164_2 = arg_161_1:GetWordFromCfg(319301040)
				local var_164_3 = arg_161_1:FormatText(var_164_2.content)

				arg_161_1.text_.text = var_164_3

				LuaForUtil.ClearLinePrefixSymbol(arg_161_1.text_)

				local var_164_4 = 31
				local var_164_5 = utf8.len(var_164_3)
				local var_164_6 = var_164_4 <= 0 and var_164_1 or var_164_1 * (var_164_5 / var_164_4)

				if var_164_6 > 0 and var_164_1 < var_164_6 then
					arg_161_1.talkMaxDuration = var_164_6

					if var_164_6 + var_164_0 > arg_161_1.duration_ then
						arg_161_1.duration_ = var_164_6 + var_164_0
					end
				end

				arg_161_1.text_.text = var_164_3
				arg_161_1.typewritter.percent = 0

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(false)
				arg_161_1:RecordContent(arg_161_1.text_.text)
			end

			local var_164_7 = math.max(var_164_1, arg_161_1.talkMaxDuration)

			if var_164_0 <= arg_161_1.time_ and arg_161_1.time_ < var_164_0 + var_164_7 then
				arg_161_1.typewritter.percent = (arg_161_1.time_ - var_164_0) / var_164_7

				arg_161_1.typewritter:SetDirty()
			end

			if arg_161_1.time_ >= var_164_0 + var_164_7 and arg_161_1.time_ < var_164_0 + var_164_7 + arg_164_0 then
				arg_161_1.typewritter.percent = 1

				arg_161_1.typewritter:SetDirty()
				arg_161_1:ShowNextGo(true)
			end
		end
	end,
	Play319301041 = function(arg_165_0, arg_165_1)
		arg_165_1.time_ = 0
		arg_165_1.frameCnt_ = 0
		arg_165_1.state_ = "playing"
		arg_165_1.curTalkId_ = 319301041
		arg_165_1.duration_ = 20.1

		local var_165_0 = {
			zh = 11.8,
			ja = 20.1
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
				arg_165_0:Play319301042(arg_165_1)
			end
		end

		function arg_165_1.onSingleLineUpdate_(arg_168_0)
			local var_168_0 = arg_165_1.actors_["10079ui_story"].transform
			local var_168_1 = 3

			if var_168_1 < arg_165_1.time_ and arg_165_1.time_ <= var_168_1 + arg_168_0 then
				arg_165_1.var_.moveOldPos10079ui_story = var_168_0.localPosition

				local var_168_2 = "10079ui_story"

				arg_165_1:ShowWeapon(arg_165_1.var_[var_168_2 .. "Animator"].transform, false)
			end

			local var_168_3 = 0.001

			if var_168_1 <= arg_165_1.time_ and arg_165_1.time_ < var_168_1 + var_168_3 then
				local var_168_4 = (arg_165_1.time_ - var_168_1) / var_168_3
				local var_168_5 = Vector3.New(0, -0.95, -6.05)

				var_168_0.localPosition = Vector3.Lerp(arg_165_1.var_.moveOldPos10079ui_story, var_168_5, var_168_4)

				local var_168_6 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_6.x, var_168_6.y, var_168_6.z)

				local var_168_7 = var_168_0.localEulerAngles

				var_168_7.z = 0
				var_168_7.x = 0
				var_168_0.localEulerAngles = var_168_7
			end

			if arg_165_1.time_ >= var_168_1 + var_168_3 and arg_165_1.time_ < var_168_1 + var_168_3 + arg_168_0 then
				var_168_0.localPosition = Vector3.New(0, -0.95, -6.05)

				local var_168_8 = manager.ui.mainCamera.transform.position - var_168_0.position

				var_168_0.forward = Vector3.New(var_168_8.x, var_168_8.y, var_168_8.z)

				local var_168_9 = var_168_0.localEulerAngles

				var_168_9.z = 0
				var_168_9.x = 0
				var_168_0.localEulerAngles = var_168_9
			end

			local var_168_10 = 0

			if var_168_10 < arg_165_1.time_ and arg_165_1.time_ <= var_168_10 + arg_168_0 then
				local var_168_11 = manager.ui.mainCamera.transform.localPosition
				local var_168_12 = Vector3.New(0, 0, 10) + Vector3.New(var_168_11.x, var_168_11.y, 0)
				local var_168_13 = arg_165_1.bgs_.A08f

				var_168_13.transform.localPosition = var_168_12
				var_168_13.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_168_14 = var_168_13:GetComponent("SpriteRenderer")

				if var_168_14 and var_168_14.sprite then
					local var_168_15 = (var_168_13.transform.localPosition - var_168_11).z
					local var_168_16 = manager.ui.mainCameraCom_
					local var_168_17 = 2 * var_168_15 * Mathf.Tan(var_168_16.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_168_18 = var_168_17 * var_168_16.aspect
					local var_168_19 = var_168_14.sprite.bounds.size.x
					local var_168_20 = var_168_14.sprite.bounds.size.y
					local var_168_21 = var_168_18 / var_168_19
					local var_168_22 = var_168_17 / var_168_20
					local var_168_23 = var_168_22 < var_168_21 and var_168_21 or var_168_22

					var_168_13.transform.localScale = Vector3.New(var_168_23, var_168_23, 0)
				end

				for iter_168_0, iter_168_1 in pairs(arg_165_1.bgs_) do
					if iter_168_0 ~= "A08f" then
						iter_168_1.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_168_24 = 1

			if var_168_24 < arg_165_1.time_ and arg_165_1.time_ <= var_168_24 + arg_168_0 then
				local var_168_25 = manager.ui.mainCamera.transform.localPosition
				local var_168_26 = Vector3.New(0, 0, 10) + Vector3.New(var_168_25.x, var_168_25.y, 0)
				local var_168_27 = arg_165_1.bgs_.A08f

				var_168_27.transform.localPosition = var_168_26
				var_168_27.transform.localEulerAngles = Vector3(0, 0, 0)

				local var_168_28 = var_168_27:GetComponent("SpriteRenderer")

				if var_168_28 and var_168_28.sprite then
					local var_168_29 = (var_168_27.transform.localPosition - var_168_25).z
					local var_168_30 = manager.ui.mainCameraCom_
					local var_168_31 = 2 * var_168_29 * Mathf.Tan(var_168_30.fieldOfView * 0.5 * Mathf.Deg2Rad)
					local var_168_32 = var_168_31 * var_168_30.aspect
					local var_168_33 = var_168_28.sprite.bounds.size.x
					local var_168_34 = var_168_28.sprite.bounds.size.y
					local var_168_35 = var_168_32 / var_168_33
					local var_168_36 = var_168_31 / var_168_34
					local var_168_37 = var_168_36 < var_168_35 and var_168_35 or var_168_36

					var_168_27.transform.localScale = Vector3.New(var_168_37, var_168_37, 0)
				end

				for iter_168_2, iter_168_3 in pairs(arg_165_1.bgs_) do
					if iter_168_2 ~= "A08f" then
						iter_168_3.transform.localPosition = Vector3.New(0, 100, 0)
					end
				end
			end

			local var_168_38 = 0

			if var_168_38 < arg_165_1.time_ and arg_165_1.time_ <= var_168_38 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_39 = 1

			if var_168_38 <= arg_165_1.time_ and arg_165_1.time_ < var_168_38 + var_168_39 then
				local var_168_40 = (arg_165_1.time_ - var_168_38) / var_168_39
				local var_168_41 = Color.New(0, 0, 0)

				var_168_41.a = Mathf.Lerp(0, 1, var_168_40)
				arg_165_1.mask_.color = var_168_41
			end

			if arg_165_1.time_ >= var_168_38 + var_168_39 and arg_165_1.time_ < var_168_38 + var_168_39 + arg_168_0 then
				local var_168_42 = Color.New(0, 0, 0)

				var_168_42.a = 1
				arg_165_1.mask_.color = var_168_42
			end

			local var_168_43 = 1

			if var_168_43 < arg_165_1.time_ and arg_165_1.time_ <= var_168_43 + arg_168_0 then
				arg_165_1.mask_.enabled = true
				arg_165_1.mask_.raycastTarget = true

				arg_165_1:SetGaussion(false)
			end

			local var_168_44 = 2

			if var_168_43 <= arg_165_1.time_ and arg_165_1.time_ < var_168_43 + var_168_44 then
				local var_168_45 = (arg_165_1.time_ - var_168_43) / var_168_44
				local var_168_46 = Color.New(0, 0, 0)

				var_168_46.a = Mathf.Lerp(1, 0, var_168_45)
				arg_165_1.mask_.color = var_168_46
			end

			if arg_165_1.time_ >= var_168_43 + var_168_44 and arg_165_1.time_ < var_168_43 + var_168_44 + arg_168_0 then
				local var_168_47 = Color.New(0, 0, 0)
				local var_168_48 = 0

				arg_165_1.mask_.enabled = false
				var_168_47.a = var_168_48
				arg_165_1.mask_.color = var_168_47
			end

			local var_168_49 = 3

			if var_168_49 < arg_165_1.time_ and arg_165_1.time_ <= var_168_49 + arg_168_0 then
				arg_165_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_1")
			end

			local var_168_50 = 3

			if var_168_50 < arg_165_1.time_ and arg_165_1.time_ <= var_168_50 + arg_168_0 then
				arg_165_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			if arg_165_1.frameCnt_ <= 1 then
				arg_165_1.dialog_:SetActive(false)
			end

			local var_168_51 = 3
			local var_168_52 = 1.05

			if var_168_51 < arg_165_1.time_ and arg_165_1.time_ <= var_168_51 + arg_168_0 then
				arg_165_1.talkMaxDuration = 0

				arg_165_1.dialog_:SetActive(true)

				local var_168_53 = LeanTween.value(arg_165_1.dialog_, 0, 1, 0.3)

				var_168_53:setOnUpdate(LuaHelper.FloatAction(function(arg_169_0)
					arg_165_1.dialogCg_.alpha = arg_169_0
				end))
				var_168_53:setOnComplete(System.Action(function()
					LeanTween.cancel(arg_165_1.dialog_)
					var_168_53:setOnUpdate(nil):setOnComplete(nil)
				end))

				arg_165_1.duration_ = arg_165_1.duration_ + 0.3

				SetActive(arg_165_1.leftNameGo_, true)

				local var_168_54 = arg_165_1:FormatText(StoryNameCfg[6].name)

				arg_165_1.leftNameTxt_.text = var_168_54

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_165_1.leftNameTxt_.transform)

				arg_165_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_165_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_165_1:RecordName(arg_165_1.leftNameTxt_.text)
				SetActive(arg_165_1.iconTrs_.gameObject, false)
				arg_165_1.callingController_:SetSelectedState("normal")

				local var_168_55 = arg_165_1:GetWordFromCfg(319301041)
				local var_168_56 = arg_165_1:FormatText(var_168_55.content)

				arg_165_1.text_.text = var_168_56

				LuaForUtil.ClearLinePrefixSymbol(arg_165_1.text_)

				local var_168_57 = 42
				local var_168_58 = utf8.len(var_168_56)
				local var_168_59 = var_168_57 <= 0 and var_168_52 or var_168_52 * (var_168_58 / var_168_57)

				if var_168_59 > 0 and var_168_52 < var_168_59 then
					arg_165_1.talkMaxDuration = var_168_59
					var_168_51 = var_168_51 + 0.3

					if var_168_59 + var_168_51 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_59 + var_168_51
					end
				end

				arg_165_1.text_.text = var_168_56
				arg_165_1.typewritter.percent = 0

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301041", "story_v_out_319301.awb") ~= 0 then
					local var_168_60 = manager.audio:GetVoiceLength("story_v_out_319301", "319301041", "story_v_out_319301.awb") / 1000

					if var_168_60 + var_168_51 > arg_165_1.duration_ then
						arg_165_1.duration_ = var_168_60 + var_168_51
					end

					if var_168_55.prefab_name ~= "" and arg_165_1.actors_[var_168_55.prefab_name] ~= nil then
						local var_168_61 = LuaForUtil.PlayVoiceWithCriLipsync(arg_165_1.actors_[var_168_55.prefab_name].transform, "story_v_out_319301", "319301041", "story_v_out_319301.awb")

						arg_165_1:RecordAudio("319301041", var_168_61)
						arg_165_1:RecordAudio("319301041", var_168_61)
					else
						arg_165_1:AudioAction("play", "voice", "story_v_out_319301", "319301041", "story_v_out_319301.awb")
					end

					arg_165_1:RecordHistoryTalkVoice("story_v_out_319301", "319301041", "story_v_out_319301.awb")
				end

				arg_165_1:RecordContent(arg_165_1.text_.text)
			end

			local var_168_62 = var_168_51 + 0.3
			local var_168_63 = math.max(var_168_52, arg_165_1.talkMaxDuration)

			if var_168_62 <= arg_165_1.time_ and arg_165_1.time_ < var_168_62 + var_168_63 then
				arg_165_1.typewritter.percent = (arg_165_1.time_ - var_168_62) / var_168_63

				arg_165_1.typewritter:SetDirty()
			end

			if arg_165_1.time_ >= var_168_62 + var_168_63 and arg_165_1.time_ < var_168_62 + var_168_63 + arg_168_0 then
				arg_165_1.typewritter.percent = 1

				arg_165_1.typewritter:SetDirty()
				arg_165_1:ShowNextGo(true)
			end
		end
	end,
	Play319301042 = function(arg_171_0, arg_171_1)
		arg_171_1.time_ = 0
		arg_171_1.frameCnt_ = 0
		arg_171_1.state_ = "playing"
		arg_171_1.curTalkId_ = 319301042
		arg_171_1.duration_ = 10.566

		local var_171_0 = {
			zh = 8.033,
			ja = 10.566
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
				arg_171_0:Play319301043(arg_171_1)
			end
		end

		function arg_171_1.onSingleLineUpdate_(arg_174_0)
			local var_174_0 = 0
			local var_174_1 = 0.825

			if var_174_0 < arg_171_1.time_ and arg_171_1.time_ <= var_174_0 + arg_174_0 then
				arg_171_1.talkMaxDuration = 0
				arg_171_1.dialogCg_.alpha = 1

				arg_171_1.dialog_:SetActive(true)
				SetActive(arg_171_1.leftNameGo_, true)

				local var_174_2 = arg_171_1:FormatText(StoryNameCfg[6].name)

				arg_171_1.leftNameTxt_.text = var_174_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_171_1.leftNameTxt_.transform)

				arg_171_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_171_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_171_1:RecordName(arg_171_1.leftNameTxt_.text)
				SetActive(arg_171_1.iconTrs_.gameObject, false)
				arg_171_1.callingController_:SetSelectedState("normal")

				local var_174_3 = arg_171_1:GetWordFromCfg(319301042)
				local var_174_4 = arg_171_1:FormatText(var_174_3.content)

				arg_171_1.text_.text = var_174_4

				LuaForUtil.ClearLinePrefixSymbol(arg_171_1.text_)

				local var_174_5 = 33
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301042", "story_v_out_319301.awb") ~= 0 then
					local var_174_8 = manager.audio:GetVoiceLength("story_v_out_319301", "319301042", "story_v_out_319301.awb") / 1000

					if var_174_8 + var_174_0 > arg_171_1.duration_ then
						arg_171_1.duration_ = var_174_8 + var_174_0
					end

					if var_174_3.prefab_name ~= "" and arg_171_1.actors_[var_174_3.prefab_name] ~= nil then
						local var_174_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_171_1.actors_[var_174_3.prefab_name].transform, "story_v_out_319301", "319301042", "story_v_out_319301.awb")

						arg_171_1:RecordAudio("319301042", var_174_9)
						arg_171_1:RecordAudio("319301042", var_174_9)
					else
						arg_171_1:AudioAction("play", "voice", "story_v_out_319301", "319301042", "story_v_out_319301.awb")
					end

					arg_171_1:RecordHistoryTalkVoice("story_v_out_319301", "319301042", "story_v_out_319301.awb")
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
	Play319301043 = function(arg_175_0, arg_175_1)
		arg_175_1.time_ = 0
		arg_175_1.frameCnt_ = 0
		arg_175_1.state_ = "playing"
		arg_175_1.curTalkId_ = 319301043
		arg_175_1.duration_ = 5

		SetActive(arg_175_1.tipsGo_, false)

		function arg_175_1.onSingleLineFinish_()
			arg_175_1.onSingleLineUpdate_ = nil
			arg_175_1.onSingleLineFinish_ = nil
			arg_175_1.state_ = "waiting"
		end

		function arg_175_1.playNext_(arg_177_0)
			if arg_177_0 == 1 then
				arg_175_0:Play319301044(arg_175_1)
			end
		end

		function arg_175_1.onSingleLineUpdate_(arg_178_0)
			local var_178_0 = arg_175_1.actors_["10079ui_story"]
			local var_178_1 = 0

			if var_178_1 < arg_175_1.time_ and arg_175_1.time_ <= var_178_1 + arg_178_0 and arg_175_1.var_.characterEffect10079ui_story == nil then
				arg_175_1.var_.characterEffect10079ui_story = var_178_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_178_2 = 0.200000002980232

			if var_178_1 <= arg_175_1.time_ and arg_175_1.time_ < var_178_1 + var_178_2 then
				local var_178_3 = (arg_175_1.time_ - var_178_1) / var_178_2

				if arg_175_1.var_.characterEffect10079ui_story then
					local var_178_4 = Mathf.Lerp(0, 0.5, var_178_3)

					arg_175_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_175_1.var_.characterEffect10079ui_story.fillRatio = var_178_4
				end
			end

			if arg_175_1.time_ >= var_178_1 + var_178_2 and arg_175_1.time_ < var_178_1 + var_178_2 + arg_178_0 and arg_175_1.var_.characterEffect10079ui_story then
				local var_178_5 = 0.5

				arg_175_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_175_1.var_.characterEffect10079ui_story.fillRatio = var_178_5
			end

			local var_178_6 = 0

			if var_178_6 < arg_175_1.time_ and arg_175_1.time_ <= var_178_6 + arg_178_0 then
				arg_175_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2104cva")
			end

			local var_178_7 = 0
			local var_178_8 = 1.425

			if var_178_7 < arg_175_1.time_ and arg_175_1.time_ <= var_178_7 + arg_178_0 then
				arg_175_1.talkMaxDuration = 0
				arg_175_1.dialogCg_.alpha = 1

				arg_175_1.dialog_:SetActive(true)
				SetActive(arg_175_1.leftNameGo_, false)

				arg_175_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_175_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_175_1:RecordName(arg_175_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_175_1.iconTrs_.gameObject, false)
				arg_175_1.callingController_:SetSelectedState("normal")

				local var_178_9 = arg_175_1:GetWordFromCfg(319301043)
				local var_178_10 = arg_175_1:FormatText(var_178_9.content)

				arg_175_1.text_.text = var_178_10

				LuaForUtil.ClearLinePrefixSymbol(arg_175_1.text_)

				local var_178_11 = 57
				local var_178_12 = utf8.len(var_178_10)
				local var_178_13 = var_178_11 <= 0 and var_178_8 or var_178_8 * (var_178_12 / var_178_11)

				if var_178_13 > 0 and var_178_8 < var_178_13 then
					arg_175_1.talkMaxDuration = var_178_13

					if var_178_13 + var_178_7 > arg_175_1.duration_ then
						arg_175_1.duration_ = var_178_13 + var_178_7
					end
				end

				arg_175_1.text_.text = var_178_10
				arg_175_1.typewritter.percent = 0

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(false)
				arg_175_1:RecordContent(arg_175_1.text_.text)
			end

			local var_178_14 = math.max(var_178_8, arg_175_1.talkMaxDuration)

			if var_178_7 <= arg_175_1.time_ and arg_175_1.time_ < var_178_7 + var_178_14 then
				arg_175_1.typewritter.percent = (arg_175_1.time_ - var_178_7) / var_178_14

				arg_175_1.typewritter:SetDirty()
			end

			if arg_175_1.time_ >= var_178_7 + var_178_14 and arg_175_1.time_ < var_178_7 + var_178_14 + arg_178_0 then
				arg_175_1.typewritter.percent = 1

				arg_175_1.typewritter:SetDirty()
				arg_175_1:ShowNextGo(true)
			end
		end
	end,
	Play319301044 = function(arg_179_0, arg_179_1)
		arg_179_1.time_ = 0
		arg_179_1.frameCnt_ = 0
		arg_179_1.state_ = "playing"
		arg_179_1.curTalkId_ = 319301044
		arg_179_1.duration_ = 11.066

		local var_179_0 = {
			zh = 5.7,
			ja = 11.066
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
				arg_179_0:Play319301045(arg_179_1)
			end
		end

		function arg_179_1.onSingleLineUpdate_(arg_182_0)
			local var_182_0 = arg_179_1.actors_["1095ui_story"]
			local var_182_1 = 0

			if var_182_1 < arg_179_1.time_ and arg_179_1.time_ <= var_182_1 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story == nil then
				arg_179_1.var_.characterEffect1095ui_story = var_182_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_2 = 0.200000002980232

			if var_182_1 <= arg_179_1.time_ and arg_179_1.time_ < var_182_1 + var_182_2 then
				local var_182_3 = (arg_179_1.time_ - var_182_1) / var_182_2

				if arg_179_1.var_.characterEffect1095ui_story then
					arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_179_1.time_ >= var_182_1 + var_182_2 and arg_179_1.time_ < var_182_1 + var_182_2 + arg_182_0 and arg_179_1.var_.characterEffect1095ui_story then
				arg_179_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_182_4 = arg_179_1.actors_["10079ui_story"]
			local var_182_5 = 0

			if var_182_5 < arg_179_1.time_ and arg_179_1.time_ <= var_182_5 + arg_182_0 and arg_179_1.var_.characterEffect10079ui_story == nil then
				arg_179_1.var_.characterEffect10079ui_story = var_182_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_182_6 = 0.200000002980232

			if var_182_5 <= arg_179_1.time_ and arg_179_1.time_ < var_182_5 + var_182_6 then
				local var_182_7 = (arg_179_1.time_ - var_182_5) / var_182_6

				if arg_179_1.var_.characterEffect10079ui_story then
					local var_182_8 = Mathf.Lerp(0, 0.5, var_182_7)

					arg_179_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_179_1.var_.characterEffect10079ui_story.fillRatio = var_182_8
				end
			end

			if arg_179_1.time_ >= var_182_5 + var_182_6 and arg_179_1.time_ < var_182_5 + var_182_6 + arg_182_0 and arg_179_1.var_.characterEffect10079ui_story then
				local var_182_9 = 0.5

				arg_179_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_179_1.var_.characterEffect10079ui_story.fillRatio = var_182_9
			end

			local var_182_10 = 0

			if var_182_10 < arg_179_1.time_ and arg_179_1.time_ <= var_182_10 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095actionlink/1095action467")
			end

			local var_182_11 = 0

			if var_182_11 < arg_179_1.time_ and arg_179_1.time_ <= var_182_11 + arg_182_0 then
				arg_179_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_182_12 = arg_179_1.actors_["1095ui_story"].transform
			local var_182_13 = 0

			if var_182_13 < arg_179_1.time_ and arg_179_1.time_ <= var_182_13 + arg_182_0 then
				arg_179_1.var_.moveOldPos1095ui_story = var_182_12.localPosition
			end

			local var_182_14 = 0.001

			if var_182_13 <= arg_179_1.time_ and arg_179_1.time_ < var_182_13 + var_182_14 then
				local var_182_15 = (arg_179_1.time_ - var_182_13) / var_182_14
				local var_182_16 = Vector3.New(-0.7, -0.98, -6.1)

				var_182_12.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos1095ui_story, var_182_16, var_182_15)

				local var_182_17 = manager.ui.mainCamera.transform.position - var_182_12.position

				var_182_12.forward = Vector3.New(var_182_17.x, var_182_17.y, var_182_17.z)

				local var_182_18 = var_182_12.localEulerAngles

				var_182_18.z = 0
				var_182_18.x = 0
				var_182_12.localEulerAngles = var_182_18
			end

			if arg_179_1.time_ >= var_182_13 + var_182_14 and arg_179_1.time_ < var_182_13 + var_182_14 + arg_182_0 then
				var_182_12.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_182_19 = manager.ui.mainCamera.transform.position - var_182_12.position

				var_182_12.forward = Vector3.New(var_182_19.x, var_182_19.y, var_182_19.z)

				local var_182_20 = var_182_12.localEulerAngles

				var_182_20.z = 0
				var_182_20.x = 0
				var_182_12.localEulerAngles = var_182_20
			end

			local var_182_21 = arg_179_1.actors_["10079ui_story"].transform
			local var_182_22 = 0

			if var_182_22 < arg_179_1.time_ and arg_179_1.time_ <= var_182_22 + arg_182_0 then
				arg_179_1.var_.moveOldPos10079ui_story = var_182_21.localPosition
			end

			local var_182_23 = 0.001

			if var_182_22 <= arg_179_1.time_ and arg_179_1.time_ < var_182_22 + var_182_23 then
				local var_182_24 = (arg_179_1.time_ - var_182_22) / var_182_23
				local var_182_25 = Vector3.New(0.7, -0.95, -6.05)

				var_182_21.localPosition = Vector3.Lerp(arg_179_1.var_.moveOldPos10079ui_story, var_182_25, var_182_24)

				local var_182_26 = manager.ui.mainCamera.transform.position - var_182_21.position

				var_182_21.forward = Vector3.New(var_182_26.x, var_182_26.y, var_182_26.z)

				local var_182_27 = var_182_21.localEulerAngles

				var_182_27.z = 0
				var_182_27.x = 0
				var_182_21.localEulerAngles = var_182_27
			end

			if arg_179_1.time_ >= var_182_22 + var_182_23 and arg_179_1.time_ < var_182_22 + var_182_23 + arg_182_0 then
				var_182_21.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_182_28 = manager.ui.mainCamera.transform.position - var_182_21.position

				var_182_21.forward = Vector3.New(var_182_28.x, var_182_28.y, var_182_28.z)

				local var_182_29 = var_182_21.localEulerAngles

				var_182_29.z = 0
				var_182_29.x = 0
				var_182_21.localEulerAngles = var_182_29
			end

			local var_182_30 = 0
			local var_182_31 = 0.775

			if var_182_30 < arg_179_1.time_ and arg_179_1.time_ <= var_182_30 + arg_182_0 then
				arg_179_1.talkMaxDuration = 0
				arg_179_1.dialogCg_.alpha = 1

				arg_179_1.dialog_:SetActive(true)
				SetActive(arg_179_1.leftNameGo_, true)

				local var_182_32 = arg_179_1:FormatText(StoryNameCfg[471].name)

				arg_179_1.leftNameTxt_.text = var_182_32

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_179_1.leftNameTxt_.transform)

				arg_179_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_179_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_179_1:RecordName(arg_179_1.leftNameTxt_.text)
				SetActive(arg_179_1.iconTrs_.gameObject, false)
				arg_179_1.callingController_:SetSelectedState("normal")

				local var_182_33 = arg_179_1:GetWordFromCfg(319301044)
				local var_182_34 = arg_179_1:FormatText(var_182_33.content)

				arg_179_1.text_.text = var_182_34

				LuaForUtil.ClearLinePrefixSymbol(arg_179_1.text_)

				local var_182_35 = 31
				local var_182_36 = utf8.len(var_182_34)
				local var_182_37 = var_182_35 <= 0 and var_182_31 or var_182_31 * (var_182_36 / var_182_35)

				if var_182_37 > 0 and var_182_31 < var_182_37 then
					arg_179_1.talkMaxDuration = var_182_37

					if var_182_37 + var_182_30 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_37 + var_182_30
					end
				end

				arg_179_1.text_.text = var_182_34
				arg_179_1.typewritter.percent = 0

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301044", "story_v_out_319301.awb") ~= 0 then
					local var_182_38 = manager.audio:GetVoiceLength("story_v_out_319301", "319301044", "story_v_out_319301.awb") / 1000

					if var_182_38 + var_182_30 > arg_179_1.duration_ then
						arg_179_1.duration_ = var_182_38 + var_182_30
					end

					if var_182_33.prefab_name ~= "" and arg_179_1.actors_[var_182_33.prefab_name] ~= nil then
						local var_182_39 = LuaForUtil.PlayVoiceWithCriLipsync(arg_179_1.actors_[var_182_33.prefab_name].transform, "story_v_out_319301", "319301044", "story_v_out_319301.awb")

						arg_179_1:RecordAudio("319301044", var_182_39)
						arg_179_1:RecordAudio("319301044", var_182_39)
					else
						arg_179_1:AudioAction("play", "voice", "story_v_out_319301", "319301044", "story_v_out_319301.awb")
					end

					arg_179_1:RecordHistoryTalkVoice("story_v_out_319301", "319301044", "story_v_out_319301.awb")
				end

				arg_179_1:RecordContent(arg_179_1.text_.text)
			end

			local var_182_40 = math.max(var_182_31, arg_179_1.talkMaxDuration)

			if var_182_30 <= arg_179_1.time_ and arg_179_1.time_ < var_182_30 + var_182_40 then
				arg_179_1.typewritter.percent = (arg_179_1.time_ - var_182_30) / var_182_40

				arg_179_1.typewritter:SetDirty()
			end

			if arg_179_1.time_ >= var_182_30 + var_182_40 and arg_179_1.time_ < var_182_30 + var_182_40 + arg_182_0 then
				arg_179_1.typewritter.percent = 1

				arg_179_1.typewritter:SetDirty()
				arg_179_1:ShowNextGo(true)
			end
		end
	end,
	Play319301045 = function(arg_183_0, arg_183_1)
		arg_183_1.time_ = 0
		arg_183_1.frameCnt_ = 0
		arg_183_1.state_ = "playing"
		arg_183_1.curTalkId_ = 319301045
		arg_183_1.duration_ = 3.266

		local var_183_0 = {
			zh = 2.166,
			ja = 3.266
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
				arg_183_0:Play319301046(arg_183_1)
			end
		end

		function arg_183_1.onSingleLineUpdate_(arg_186_0)
			local var_186_0 = arg_183_1.actors_["10079ui_story"].transform
			local var_186_1 = 0

			if var_186_1 < arg_183_1.time_ and arg_183_1.time_ <= var_186_1 + arg_186_0 then
				arg_183_1.var_.moveOldPos10079ui_story = var_186_0.localPosition
			end

			local var_186_2 = 0.001

			if var_186_1 <= arg_183_1.time_ and arg_183_1.time_ < var_186_1 + var_186_2 then
				local var_186_3 = (arg_183_1.time_ - var_186_1) / var_186_2
				local var_186_4 = Vector3.New(0.7, -0.95, -6.05)

				var_186_0.localPosition = Vector3.Lerp(arg_183_1.var_.moveOldPos10079ui_story, var_186_4, var_186_3)

				local var_186_5 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_5.x, var_186_5.y, var_186_5.z)

				local var_186_6 = var_186_0.localEulerAngles

				var_186_6.z = 0
				var_186_6.x = 0
				var_186_0.localEulerAngles = var_186_6
			end

			if arg_183_1.time_ >= var_186_1 + var_186_2 and arg_183_1.time_ < var_186_1 + var_186_2 + arg_186_0 then
				var_186_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_186_7 = manager.ui.mainCamera.transform.position - var_186_0.position

				var_186_0.forward = Vector3.New(var_186_7.x, var_186_7.y, var_186_7.z)

				local var_186_8 = var_186_0.localEulerAngles

				var_186_8.z = 0
				var_186_8.x = 0
				var_186_0.localEulerAngles = var_186_8
			end

			local var_186_9 = arg_183_1.actors_["10079ui_story"]
			local var_186_10 = 0

			if var_186_10 < arg_183_1.time_ and arg_183_1.time_ <= var_186_10 + arg_186_0 and arg_183_1.var_.characterEffect10079ui_story == nil then
				arg_183_1.var_.characterEffect10079ui_story = var_186_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_11 = 0.200000002980232

			if var_186_10 <= arg_183_1.time_ and arg_183_1.time_ < var_186_10 + var_186_11 then
				local var_186_12 = (arg_183_1.time_ - var_186_10) / var_186_11

				if arg_183_1.var_.characterEffect10079ui_story then
					arg_183_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_183_1.time_ >= var_186_10 + var_186_11 and arg_183_1.time_ < var_186_10 + var_186_11 + arg_186_0 and arg_183_1.var_.characterEffect10079ui_story then
				arg_183_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_186_13 = 0

			if var_186_13 < arg_183_1.time_ and arg_183_1.time_ <= var_186_13 + arg_186_0 then
				arg_183_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action8_2")
			end

			local var_186_14 = 0

			if var_186_14 < arg_183_1.time_ and arg_183_1.time_ <= var_186_14 + arg_186_0 then
				arg_183_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_186_15 = arg_183_1.actors_["1095ui_story"]
			local var_186_16 = 0

			if var_186_16 < arg_183_1.time_ and arg_183_1.time_ <= var_186_16 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story == nil then
				arg_183_1.var_.characterEffect1095ui_story = var_186_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_186_17 = 0.200000002980232

			if var_186_16 <= arg_183_1.time_ and arg_183_1.time_ < var_186_16 + var_186_17 then
				local var_186_18 = (arg_183_1.time_ - var_186_16) / var_186_17

				if arg_183_1.var_.characterEffect1095ui_story then
					local var_186_19 = Mathf.Lerp(0, 0.5, var_186_18)

					arg_183_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_183_1.var_.characterEffect1095ui_story.fillRatio = var_186_19
				end
			end

			if arg_183_1.time_ >= var_186_16 + var_186_17 and arg_183_1.time_ < var_186_16 + var_186_17 + arg_186_0 and arg_183_1.var_.characterEffect1095ui_story then
				local var_186_20 = 0.5

				arg_183_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_183_1.var_.characterEffect1095ui_story.fillRatio = var_186_20
			end

			local var_186_21 = 0
			local var_186_22 = 0.15

			if var_186_21 < arg_183_1.time_ and arg_183_1.time_ <= var_186_21 + arg_186_0 then
				arg_183_1.talkMaxDuration = 0
				arg_183_1.dialogCg_.alpha = 1

				arg_183_1.dialog_:SetActive(true)
				SetActive(arg_183_1.leftNameGo_, true)

				local var_186_23 = arg_183_1:FormatText(StoryNameCfg[6].name)

				arg_183_1.leftNameTxt_.text = var_186_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_183_1.leftNameTxt_.transform)

				arg_183_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_183_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_183_1:RecordName(arg_183_1.leftNameTxt_.text)
				SetActive(arg_183_1.iconTrs_.gameObject, false)
				arg_183_1.callingController_:SetSelectedState("normal")

				local var_186_24 = arg_183_1:GetWordFromCfg(319301045)
				local var_186_25 = arg_183_1:FormatText(var_186_24.content)

				arg_183_1.text_.text = var_186_25

				LuaForUtil.ClearLinePrefixSymbol(arg_183_1.text_)

				local var_186_26 = 6
				local var_186_27 = utf8.len(var_186_25)
				local var_186_28 = var_186_26 <= 0 and var_186_22 or var_186_22 * (var_186_27 / var_186_26)

				if var_186_28 > 0 and var_186_22 < var_186_28 then
					arg_183_1.talkMaxDuration = var_186_28

					if var_186_28 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_28 + var_186_21
					end
				end

				arg_183_1.text_.text = var_186_25
				arg_183_1.typewritter.percent = 0

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301045", "story_v_out_319301.awb") ~= 0 then
					local var_186_29 = manager.audio:GetVoiceLength("story_v_out_319301", "319301045", "story_v_out_319301.awb") / 1000

					if var_186_29 + var_186_21 > arg_183_1.duration_ then
						arg_183_1.duration_ = var_186_29 + var_186_21
					end

					if var_186_24.prefab_name ~= "" and arg_183_1.actors_[var_186_24.prefab_name] ~= nil then
						local var_186_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_183_1.actors_[var_186_24.prefab_name].transform, "story_v_out_319301", "319301045", "story_v_out_319301.awb")

						arg_183_1:RecordAudio("319301045", var_186_30)
						arg_183_1:RecordAudio("319301045", var_186_30)
					else
						arg_183_1:AudioAction("play", "voice", "story_v_out_319301", "319301045", "story_v_out_319301.awb")
					end

					arg_183_1:RecordHistoryTalkVoice("story_v_out_319301", "319301045", "story_v_out_319301.awb")
				end

				arg_183_1:RecordContent(arg_183_1.text_.text)
			end

			local var_186_31 = math.max(var_186_22, arg_183_1.talkMaxDuration)

			if var_186_21 <= arg_183_1.time_ and arg_183_1.time_ < var_186_21 + var_186_31 then
				arg_183_1.typewritter.percent = (arg_183_1.time_ - var_186_21) / var_186_31

				arg_183_1.typewritter:SetDirty()
			end

			if arg_183_1.time_ >= var_186_21 + var_186_31 and arg_183_1.time_ < var_186_21 + var_186_31 + arg_186_0 then
				arg_183_1.typewritter.percent = 1

				arg_183_1.typewritter:SetDirty()
				arg_183_1:ShowNextGo(true)
			end
		end
	end,
	Play319301046 = function(arg_187_0, arg_187_1)
		arg_187_1.time_ = 0
		arg_187_1.frameCnt_ = 0
		arg_187_1.state_ = "playing"
		arg_187_1.curTalkId_ = 319301046
		arg_187_1.duration_ = 7.866

		local var_187_0 = {
			zh = 5.566,
			ja = 7.866
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
				arg_187_0:Play319301047(arg_187_1)
			end
		end

		function arg_187_1.onSingleLineUpdate_(arg_190_0)
			local var_190_0 = arg_187_1.actors_["10079ui_story"]
			local var_190_1 = 0

			if var_190_1 < arg_187_1.time_ and arg_187_1.time_ <= var_190_1 + arg_190_0 and arg_187_1.var_.characterEffect10079ui_story == nil then
				arg_187_1.var_.characterEffect10079ui_story = var_190_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_2 = 0.200000002980232

			if var_190_1 <= arg_187_1.time_ and arg_187_1.time_ < var_190_1 + var_190_2 then
				local var_190_3 = (arg_187_1.time_ - var_190_1) / var_190_2

				if arg_187_1.var_.characterEffect10079ui_story then
					local var_190_4 = Mathf.Lerp(0, 0.5, var_190_3)

					arg_187_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_187_1.var_.characterEffect10079ui_story.fillRatio = var_190_4
				end
			end

			if arg_187_1.time_ >= var_190_1 + var_190_2 and arg_187_1.time_ < var_190_1 + var_190_2 + arg_190_0 and arg_187_1.var_.characterEffect10079ui_story then
				local var_190_5 = 0.5

				arg_187_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_187_1.var_.characterEffect10079ui_story.fillRatio = var_190_5
			end

			local var_190_6 = arg_187_1.actors_["1095ui_story"]
			local var_190_7 = 0

			if var_190_7 < arg_187_1.time_ and arg_187_1.time_ <= var_190_7 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story == nil then
				arg_187_1.var_.characterEffect1095ui_story = var_190_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_190_8 = 0.200000002980232

			if var_190_7 <= arg_187_1.time_ and arg_187_1.time_ < var_190_7 + var_190_8 then
				local var_190_9 = (arg_187_1.time_ - var_190_7) / var_190_8

				if arg_187_1.var_.characterEffect1095ui_story then
					arg_187_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_187_1.time_ >= var_190_7 + var_190_8 and arg_187_1.time_ < var_190_7 + var_190_8 + arg_190_0 and arg_187_1.var_.characterEffect1095ui_story then
				arg_187_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_190_10 = 0
			local var_190_11 = 0.7

			if var_190_10 < arg_187_1.time_ and arg_187_1.time_ <= var_190_10 + arg_190_0 then
				arg_187_1.talkMaxDuration = 0
				arg_187_1.dialogCg_.alpha = 1

				arg_187_1.dialog_:SetActive(true)
				SetActive(arg_187_1.leftNameGo_, true)

				local var_190_12 = arg_187_1:FormatText(StoryNameCfg[471].name)

				arg_187_1.leftNameTxt_.text = var_190_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_187_1.leftNameTxt_.transform)

				arg_187_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_187_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_187_1:RecordName(arg_187_1.leftNameTxt_.text)
				SetActive(arg_187_1.iconTrs_.gameObject, false)
				arg_187_1.callingController_:SetSelectedState("normal")

				local var_190_13 = arg_187_1:GetWordFromCfg(319301046)
				local var_190_14 = arg_187_1:FormatText(var_190_13.content)

				arg_187_1.text_.text = var_190_14

				LuaForUtil.ClearLinePrefixSymbol(arg_187_1.text_)

				local var_190_15 = 28
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301046", "story_v_out_319301.awb") ~= 0 then
					local var_190_18 = manager.audio:GetVoiceLength("story_v_out_319301", "319301046", "story_v_out_319301.awb") / 1000

					if var_190_18 + var_190_10 > arg_187_1.duration_ then
						arg_187_1.duration_ = var_190_18 + var_190_10
					end

					if var_190_13.prefab_name ~= "" and arg_187_1.actors_[var_190_13.prefab_name] ~= nil then
						local var_190_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_187_1.actors_[var_190_13.prefab_name].transform, "story_v_out_319301", "319301046", "story_v_out_319301.awb")

						arg_187_1:RecordAudio("319301046", var_190_19)
						arg_187_1:RecordAudio("319301046", var_190_19)
					else
						arg_187_1:AudioAction("play", "voice", "story_v_out_319301", "319301046", "story_v_out_319301.awb")
					end

					arg_187_1:RecordHistoryTalkVoice("story_v_out_319301", "319301046", "story_v_out_319301.awb")
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
	Play319301047 = function(arg_191_0, arg_191_1)
		arg_191_1.time_ = 0
		arg_191_1.frameCnt_ = 0
		arg_191_1.state_ = "playing"
		arg_191_1.curTalkId_ = 319301047
		arg_191_1.duration_ = 5.033

		local var_191_0 = {
			zh = 3,
			ja = 5.033
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
				arg_191_0:Play319301048(arg_191_1)
			end
		end

		function arg_191_1.onSingleLineUpdate_(arg_194_0)
			local var_194_0 = arg_191_1.actors_["1095ui_story"].transform
			local var_194_1 = 0

			if var_194_1 < arg_191_1.time_ and arg_191_1.time_ <= var_194_1 + arg_194_0 then
				arg_191_1.var_.moveOldPos1095ui_story = var_194_0.localPosition
			end

			local var_194_2 = 0.001

			if var_194_1 <= arg_191_1.time_ and arg_191_1.time_ < var_194_1 + var_194_2 then
				local var_194_3 = (arg_191_1.time_ - var_194_1) / var_194_2
				local var_194_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_194_0.localPosition = Vector3.Lerp(arg_191_1.var_.moveOldPos1095ui_story, var_194_4, var_194_3)

				local var_194_5 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_5.x, var_194_5.y, var_194_5.z)

				local var_194_6 = var_194_0.localEulerAngles

				var_194_6.z = 0
				var_194_6.x = 0
				var_194_0.localEulerAngles = var_194_6
			end

			if arg_191_1.time_ >= var_194_1 + var_194_2 and arg_191_1.time_ < var_194_1 + var_194_2 + arg_194_0 then
				var_194_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_194_7 = manager.ui.mainCamera.transform.position - var_194_0.position

				var_194_0.forward = Vector3.New(var_194_7.x, var_194_7.y, var_194_7.z)

				local var_194_8 = var_194_0.localEulerAngles

				var_194_8.z = 0
				var_194_8.x = 0
				var_194_0.localEulerAngles = var_194_8
			end

			local var_194_9 = arg_191_1.actors_["1095ui_story"]
			local var_194_10 = 0

			if var_194_10 < arg_191_1.time_ and arg_191_1.time_ <= var_194_10 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story == nil then
				arg_191_1.var_.characterEffect1095ui_story = var_194_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_194_11 = 0.200000002980232

			if var_194_10 <= arg_191_1.time_ and arg_191_1.time_ < var_194_10 + var_194_11 then
				local var_194_12 = (arg_191_1.time_ - var_194_10) / var_194_11

				if arg_191_1.var_.characterEffect1095ui_story then
					arg_191_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_191_1.time_ >= var_194_10 + var_194_11 and arg_191_1.time_ < var_194_10 + var_194_11 + arg_194_0 and arg_191_1.var_.characterEffect1095ui_story then
				arg_191_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_194_13 = 0
			local var_194_14 = 0.4

			if var_194_13 < arg_191_1.time_ and arg_191_1.time_ <= var_194_13 + arg_194_0 then
				arg_191_1.talkMaxDuration = 0
				arg_191_1.dialogCg_.alpha = 1

				arg_191_1.dialog_:SetActive(true)
				SetActive(arg_191_1.leftNameGo_, true)

				local var_194_15 = arg_191_1:FormatText(StoryNameCfg[471].name)

				arg_191_1.leftNameTxt_.text = var_194_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_191_1.leftNameTxt_.transform)

				arg_191_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_191_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_191_1:RecordName(arg_191_1.leftNameTxt_.text)
				SetActive(arg_191_1.iconTrs_.gameObject, false)
				arg_191_1.callingController_:SetSelectedState("normal")

				local var_194_16 = arg_191_1:GetWordFromCfg(319301047)
				local var_194_17 = arg_191_1:FormatText(var_194_16.content)

				arg_191_1.text_.text = var_194_17

				LuaForUtil.ClearLinePrefixSymbol(arg_191_1.text_)

				local var_194_18 = 16
				local var_194_19 = utf8.len(var_194_17)
				local var_194_20 = var_194_18 <= 0 and var_194_14 or var_194_14 * (var_194_19 / var_194_18)

				if var_194_20 > 0 and var_194_14 < var_194_20 then
					arg_191_1.talkMaxDuration = var_194_20

					if var_194_20 + var_194_13 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_20 + var_194_13
					end
				end

				arg_191_1.text_.text = var_194_17
				arg_191_1.typewritter.percent = 0

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301047", "story_v_out_319301.awb") ~= 0 then
					local var_194_21 = manager.audio:GetVoiceLength("story_v_out_319301", "319301047", "story_v_out_319301.awb") / 1000

					if var_194_21 + var_194_13 > arg_191_1.duration_ then
						arg_191_1.duration_ = var_194_21 + var_194_13
					end

					if var_194_16.prefab_name ~= "" and arg_191_1.actors_[var_194_16.prefab_name] ~= nil then
						local var_194_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_191_1.actors_[var_194_16.prefab_name].transform, "story_v_out_319301", "319301047", "story_v_out_319301.awb")

						arg_191_1:RecordAudio("319301047", var_194_22)
						arg_191_1:RecordAudio("319301047", var_194_22)
					else
						arg_191_1:AudioAction("play", "voice", "story_v_out_319301", "319301047", "story_v_out_319301.awb")
					end

					arg_191_1:RecordHistoryTalkVoice("story_v_out_319301", "319301047", "story_v_out_319301.awb")
				end

				arg_191_1:RecordContent(arg_191_1.text_.text)
			end

			local var_194_23 = math.max(var_194_14, arg_191_1.talkMaxDuration)

			if var_194_13 <= arg_191_1.time_ and arg_191_1.time_ < var_194_13 + var_194_23 then
				arg_191_1.typewritter.percent = (arg_191_1.time_ - var_194_13) / var_194_23

				arg_191_1.typewritter:SetDirty()
			end

			if arg_191_1.time_ >= var_194_13 + var_194_23 and arg_191_1.time_ < var_194_13 + var_194_23 + arg_194_0 then
				arg_191_1.typewritter.percent = 1

				arg_191_1.typewritter:SetDirty()
				arg_191_1:ShowNextGo(true)
			end
		end
	end,
	Play319301048 = function(arg_195_0, arg_195_1)
		arg_195_1.time_ = 0
		arg_195_1.frameCnt_ = 0
		arg_195_1.state_ = "playing"
		arg_195_1.curTalkId_ = 319301048
		arg_195_1.duration_ = 4.966

		local var_195_0 = {
			zh = 2.733,
			ja = 4.966
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
				arg_195_0:Play319301049(arg_195_1)
			end
		end

		function arg_195_1.onSingleLineUpdate_(arg_198_0)
			local var_198_0 = arg_195_1.actors_["1095ui_story"]
			local var_198_1 = 0

			if var_198_1 < arg_195_1.time_ and arg_195_1.time_ <= var_198_1 + arg_198_0 and arg_195_1.var_.characterEffect1095ui_story == nil then
				arg_195_1.var_.characterEffect1095ui_story = var_198_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_2 = 0.200000002980232

			if var_198_1 <= arg_195_1.time_ and arg_195_1.time_ < var_198_1 + var_198_2 then
				local var_198_3 = (arg_195_1.time_ - var_198_1) / var_198_2

				if arg_195_1.var_.characterEffect1095ui_story then
					local var_198_4 = Mathf.Lerp(0, 0.5, var_198_3)

					arg_195_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_195_1.var_.characterEffect1095ui_story.fillRatio = var_198_4
				end
			end

			if arg_195_1.time_ >= var_198_1 + var_198_2 and arg_195_1.time_ < var_198_1 + var_198_2 + arg_198_0 and arg_195_1.var_.characterEffect1095ui_story then
				local var_198_5 = 0.5

				arg_195_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_195_1.var_.characterEffect1095ui_story.fillRatio = var_198_5
			end

			local var_198_6 = arg_195_1.actors_["10079ui_story"]
			local var_198_7 = 0

			if var_198_7 < arg_195_1.time_ and arg_195_1.time_ <= var_198_7 + arg_198_0 and arg_195_1.var_.characterEffect10079ui_story == nil then
				arg_195_1.var_.characterEffect10079ui_story = var_198_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_198_8 = 0.200000002980232

			if var_198_7 <= arg_195_1.time_ and arg_195_1.time_ < var_198_7 + var_198_8 then
				local var_198_9 = (arg_195_1.time_ - var_198_7) / var_198_8

				if arg_195_1.var_.characterEffect10079ui_story then
					arg_195_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_195_1.time_ >= var_198_7 + var_198_8 and arg_195_1.time_ < var_198_7 + var_198_8 + arg_198_0 and arg_195_1.var_.characterEffect10079ui_story then
				arg_195_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_198_10 = 0

			if var_198_10 < arg_195_1.time_ and arg_195_1.time_ <= var_198_10 + arg_198_0 then
				arg_195_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_1")
			end

			local var_198_11 = 0

			if var_198_11 < arg_195_1.time_ and arg_195_1.time_ <= var_198_11 + arg_198_0 then
				arg_195_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface2101cva")
			end

			local var_198_12 = 0
			local var_198_13 = 0.15

			if var_198_12 < arg_195_1.time_ and arg_195_1.time_ <= var_198_12 + arg_198_0 then
				arg_195_1.talkMaxDuration = 0
				arg_195_1.dialogCg_.alpha = 1

				arg_195_1.dialog_:SetActive(true)
				SetActive(arg_195_1.leftNameGo_, true)

				local var_198_14 = arg_195_1:FormatText(StoryNameCfg[6].name)

				arg_195_1.leftNameTxt_.text = var_198_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_195_1.leftNameTxt_.transform)

				arg_195_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_195_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_195_1:RecordName(arg_195_1.leftNameTxt_.text)
				SetActive(arg_195_1.iconTrs_.gameObject, false)
				arg_195_1.callingController_:SetSelectedState("normal")

				local var_198_15 = arg_195_1:GetWordFromCfg(319301048)
				local var_198_16 = arg_195_1:FormatText(var_198_15.content)

				arg_195_1.text_.text = var_198_16

				LuaForUtil.ClearLinePrefixSymbol(arg_195_1.text_)

				local var_198_17 = 6
				local var_198_18 = utf8.len(var_198_16)
				local var_198_19 = var_198_17 <= 0 and var_198_13 or var_198_13 * (var_198_18 / var_198_17)

				if var_198_19 > 0 and var_198_13 < var_198_19 then
					arg_195_1.talkMaxDuration = var_198_19

					if var_198_19 + var_198_12 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_19 + var_198_12
					end
				end

				arg_195_1.text_.text = var_198_16
				arg_195_1.typewritter.percent = 0

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301048", "story_v_out_319301.awb") ~= 0 then
					local var_198_20 = manager.audio:GetVoiceLength("story_v_out_319301", "319301048", "story_v_out_319301.awb") / 1000

					if var_198_20 + var_198_12 > arg_195_1.duration_ then
						arg_195_1.duration_ = var_198_20 + var_198_12
					end

					if var_198_15.prefab_name ~= "" and arg_195_1.actors_[var_198_15.prefab_name] ~= nil then
						local var_198_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_195_1.actors_[var_198_15.prefab_name].transform, "story_v_out_319301", "319301048", "story_v_out_319301.awb")

						arg_195_1:RecordAudio("319301048", var_198_21)
						arg_195_1:RecordAudio("319301048", var_198_21)
					else
						arg_195_1:AudioAction("play", "voice", "story_v_out_319301", "319301048", "story_v_out_319301.awb")
					end

					arg_195_1:RecordHistoryTalkVoice("story_v_out_319301", "319301048", "story_v_out_319301.awb")
				end

				arg_195_1:RecordContent(arg_195_1.text_.text)
			end

			local var_198_22 = math.max(var_198_13, arg_195_1.talkMaxDuration)

			if var_198_12 <= arg_195_1.time_ and arg_195_1.time_ < var_198_12 + var_198_22 then
				arg_195_1.typewritter.percent = (arg_195_1.time_ - var_198_12) / var_198_22

				arg_195_1.typewritter:SetDirty()
			end

			if arg_195_1.time_ >= var_198_12 + var_198_22 and arg_195_1.time_ < var_198_12 + var_198_22 + arg_198_0 then
				arg_195_1.typewritter.percent = 1

				arg_195_1.typewritter:SetDirty()
				arg_195_1:ShowNextGo(true)
			end
		end
	end,
	Play319301049 = function(arg_199_0, arg_199_1)
		arg_199_1.time_ = 0
		arg_199_1.frameCnt_ = 0
		arg_199_1.state_ = "playing"
		arg_199_1.curTalkId_ = 319301049
		arg_199_1.duration_ = 4.8

		local var_199_0 = {
			zh = 2.466,
			ja = 4.8
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
				arg_199_0:Play319301050(arg_199_1)
			end
		end

		function arg_199_1.onSingleLineUpdate_(arg_202_0)
			local var_202_0 = arg_199_1.actors_["10079ui_story"]
			local var_202_1 = 0

			if var_202_1 < arg_199_1.time_ and arg_199_1.time_ <= var_202_1 + arg_202_0 and arg_199_1.var_.characterEffect10079ui_story == nil then
				arg_199_1.var_.characterEffect10079ui_story = var_202_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_202_2 = 0.200000002980232

			if var_202_1 <= arg_199_1.time_ and arg_199_1.time_ < var_202_1 + var_202_2 then
				local var_202_3 = (arg_199_1.time_ - var_202_1) / var_202_2

				if arg_199_1.var_.characterEffect10079ui_story then
					local var_202_4 = Mathf.Lerp(0, 0.5, var_202_3)

					arg_199_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_199_1.var_.characterEffect10079ui_story.fillRatio = var_202_4
				end
			end

			if arg_199_1.time_ >= var_202_1 + var_202_2 and arg_199_1.time_ < var_202_1 + var_202_2 + arg_202_0 and arg_199_1.var_.characterEffect10079ui_story then
				local var_202_5 = 0.5

				arg_199_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_199_1.var_.characterEffect10079ui_story.fillRatio = var_202_5
			end

			local var_202_6 = 0
			local var_202_7 = 0.3

			if var_202_6 < arg_199_1.time_ and arg_199_1.time_ <= var_202_6 + arg_202_0 then
				arg_199_1.talkMaxDuration = 0
				arg_199_1.dialogCg_.alpha = 1

				arg_199_1.dialog_:SetActive(true)
				SetActive(arg_199_1.leftNameGo_, true)

				local var_202_8 = arg_199_1:FormatText(StoryNameCfg[643].name)

				arg_199_1.leftNameTxt_.text = var_202_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_199_1.leftNameTxt_.transform)

				arg_199_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_199_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_199_1:RecordName(arg_199_1.leftNameTxt_.text)
				SetActive(arg_199_1.iconTrs_.gameObject, true)
				arg_199_1.iconController_:SetSelectedState("hero")

				arg_199_1.icon_.sprite = getSpriteWithoutAtlas("TextureConfig/Story/Character/" .. "story_2078")

				arg_199_1.callingController_:SetSelectedState("normal")

				local var_202_9 = arg_199_1:GetWordFromCfg(319301049)
				local var_202_10 = arg_199_1:FormatText(var_202_9.content)

				arg_199_1.text_.text = var_202_10

				LuaForUtil.ClearLinePrefixSymbol(arg_199_1.text_)

				local var_202_11 = 12
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301049", "story_v_out_319301.awb") ~= 0 then
					local var_202_14 = manager.audio:GetVoiceLength("story_v_out_319301", "319301049", "story_v_out_319301.awb") / 1000

					if var_202_14 + var_202_6 > arg_199_1.duration_ then
						arg_199_1.duration_ = var_202_14 + var_202_6
					end

					if var_202_9.prefab_name ~= "" and arg_199_1.actors_[var_202_9.prefab_name] ~= nil then
						local var_202_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_199_1.actors_[var_202_9.prefab_name].transform, "story_v_out_319301", "319301049", "story_v_out_319301.awb")

						arg_199_1:RecordAudio("319301049", var_202_15)
						arg_199_1:RecordAudio("319301049", var_202_15)
					else
						arg_199_1:AudioAction("play", "voice", "story_v_out_319301", "319301049", "story_v_out_319301.awb")
					end

					arg_199_1:RecordHistoryTalkVoice("story_v_out_319301", "319301049", "story_v_out_319301.awb")
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
	Play319301050 = function(arg_203_0, arg_203_1)
		arg_203_1.time_ = 0
		arg_203_1.frameCnt_ = 0
		arg_203_1.state_ = "playing"
		arg_203_1.curTalkId_ = 319301050
		arg_203_1.duration_ = 6.1

		local var_203_0 = {
			zh = 2,
			ja = 6.1
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
				arg_203_0:Play319301051(arg_203_1)
			end
		end

		function arg_203_1.onSingleLineUpdate_(arg_206_0)
			local var_206_0 = arg_203_1.actors_["1095ui_story"]
			local var_206_1 = 0

			if var_206_1 < arg_203_1.time_ and arg_203_1.time_ <= var_206_1 + arg_206_0 and arg_203_1.var_.characterEffect1095ui_story == nil then
				arg_203_1.var_.characterEffect1095ui_story = var_206_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_206_2 = 0.200000002980232

			if var_206_1 <= arg_203_1.time_ and arg_203_1.time_ < var_206_1 + var_206_2 then
				local var_206_3 = (arg_203_1.time_ - var_206_1) / var_206_2

				if arg_203_1.var_.characterEffect1095ui_story then
					arg_203_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_203_1.time_ >= var_206_1 + var_206_2 and arg_203_1.time_ < var_206_1 + var_206_2 + arg_206_0 and arg_203_1.var_.characterEffect1095ui_story then
				arg_203_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_206_4 = 0

			if var_206_4 < arg_203_1.time_ and arg_203_1.time_ <= var_206_4 + arg_206_0 then
				arg_203_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_206_5 = 0

			if var_206_5 < arg_203_1.time_ and arg_203_1.time_ <= var_206_5 + arg_206_0 then
				arg_203_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action7_2")
			end

			local var_206_6 = 0
			local var_206_7 = 0.225

			if var_206_6 < arg_203_1.time_ and arg_203_1.time_ <= var_206_6 + arg_206_0 then
				arg_203_1.talkMaxDuration = 0
				arg_203_1.dialogCg_.alpha = 1

				arg_203_1.dialog_:SetActive(true)
				SetActive(arg_203_1.leftNameGo_, true)

				local var_206_8 = arg_203_1:FormatText(StoryNameCfg[471].name)

				arg_203_1.leftNameTxt_.text = var_206_8

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_203_1.leftNameTxt_.transform)

				arg_203_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_203_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_203_1:RecordName(arg_203_1.leftNameTxt_.text)
				SetActive(arg_203_1.iconTrs_.gameObject, false)
				arg_203_1.callingController_:SetSelectedState("normal")

				local var_206_9 = arg_203_1:GetWordFromCfg(319301050)
				local var_206_10 = arg_203_1:FormatText(var_206_9.content)

				arg_203_1.text_.text = var_206_10

				LuaForUtil.ClearLinePrefixSymbol(arg_203_1.text_)

				local var_206_11 = 9
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301050", "story_v_out_319301.awb") ~= 0 then
					local var_206_14 = manager.audio:GetVoiceLength("story_v_out_319301", "319301050", "story_v_out_319301.awb") / 1000

					if var_206_14 + var_206_6 > arg_203_1.duration_ then
						arg_203_1.duration_ = var_206_14 + var_206_6
					end

					if var_206_9.prefab_name ~= "" and arg_203_1.actors_[var_206_9.prefab_name] ~= nil then
						local var_206_15 = LuaForUtil.PlayVoiceWithCriLipsync(arg_203_1.actors_[var_206_9.prefab_name].transform, "story_v_out_319301", "319301050", "story_v_out_319301.awb")

						arg_203_1:RecordAudio("319301050", var_206_15)
						arg_203_1:RecordAudio("319301050", var_206_15)
					else
						arg_203_1:AudioAction("play", "voice", "story_v_out_319301", "319301050", "story_v_out_319301.awb")
					end

					arg_203_1:RecordHistoryTalkVoice("story_v_out_319301", "319301050", "story_v_out_319301.awb")
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
	Play319301051 = function(arg_207_0, arg_207_1)
		arg_207_1.time_ = 0
		arg_207_1.frameCnt_ = 0
		arg_207_1.state_ = "playing"
		arg_207_1.curTalkId_ = 319301051
		arg_207_1.duration_ = 10.633

		local var_207_0 = {
			zh = 9.466,
			ja = 10.633
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
				arg_207_0:Play319301052(arg_207_1)
			end
		end

		function arg_207_1.onSingleLineUpdate_(arg_210_0)
			local var_210_0 = 0
			local var_210_1 = 1.1

			if var_210_0 < arg_207_1.time_ and arg_207_1.time_ <= var_210_0 + arg_210_0 then
				arg_207_1.talkMaxDuration = 0
				arg_207_1.dialogCg_.alpha = 1

				arg_207_1.dialog_:SetActive(true)
				SetActive(arg_207_1.leftNameGo_, true)

				local var_210_2 = arg_207_1:FormatText(StoryNameCfg[471].name)

				arg_207_1.leftNameTxt_.text = var_210_2

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_207_1.leftNameTxt_.transform)

				arg_207_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_207_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_207_1:RecordName(arg_207_1.leftNameTxt_.text)
				SetActive(arg_207_1.iconTrs_.gameObject, false)
				arg_207_1.callingController_:SetSelectedState("normal")

				local var_210_3 = arg_207_1:GetWordFromCfg(319301051)
				local var_210_4 = arg_207_1:FormatText(var_210_3.content)

				arg_207_1.text_.text = var_210_4

				LuaForUtil.ClearLinePrefixSymbol(arg_207_1.text_)

				local var_210_5 = 44
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301051", "story_v_out_319301.awb") ~= 0 then
					local var_210_8 = manager.audio:GetVoiceLength("story_v_out_319301", "319301051", "story_v_out_319301.awb") / 1000

					if var_210_8 + var_210_0 > arg_207_1.duration_ then
						arg_207_1.duration_ = var_210_8 + var_210_0
					end

					if var_210_3.prefab_name ~= "" and arg_207_1.actors_[var_210_3.prefab_name] ~= nil then
						local var_210_9 = LuaForUtil.PlayVoiceWithCriLipsync(arg_207_1.actors_[var_210_3.prefab_name].transform, "story_v_out_319301", "319301051", "story_v_out_319301.awb")

						arg_207_1:RecordAudio("319301051", var_210_9)
						arg_207_1:RecordAudio("319301051", var_210_9)
					else
						arg_207_1:AudioAction("play", "voice", "story_v_out_319301", "319301051", "story_v_out_319301.awb")
					end

					arg_207_1:RecordHistoryTalkVoice("story_v_out_319301", "319301051", "story_v_out_319301.awb")
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
	Play319301052 = function(arg_211_0, arg_211_1)
		arg_211_1.time_ = 0
		arg_211_1.frameCnt_ = 0
		arg_211_1.state_ = "playing"
		arg_211_1.curTalkId_ = 319301052
		arg_211_1.duration_ = 3.533

		local var_211_0 = {
			zh = 1.333,
			ja = 3.533
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
				arg_211_0:Play319301053(arg_211_1)
			end
		end

		function arg_211_1.onSingleLineUpdate_(arg_214_0)
			local var_214_0 = arg_211_1.actors_["10079ui_story"]
			local var_214_1 = 0

			if var_214_1 < arg_211_1.time_ and arg_211_1.time_ <= var_214_1 + arg_214_0 and arg_211_1.var_.characterEffect10079ui_story == nil then
				arg_211_1.var_.characterEffect10079ui_story = var_214_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_2 = 0.200000002980232

			if var_214_1 <= arg_211_1.time_ and arg_211_1.time_ < var_214_1 + var_214_2 then
				local var_214_3 = (arg_211_1.time_ - var_214_1) / var_214_2

				if arg_211_1.var_.characterEffect10079ui_story then
					arg_211_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_211_1.time_ >= var_214_1 + var_214_2 and arg_211_1.time_ < var_214_1 + var_214_2 + arg_214_0 and arg_211_1.var_.characterEffect10079ui_story then
				arg_211_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_214_4 = arg_211_1.actors_["1095ui_story"]
			local var_214_5 = 0

			if var_214_5 < arg_211_1.time_ and arg_211_1.time_ <= var_214_5 + arg_214_0 and arg_211_1.var_.characterEffect1095ui_story == nil then
				arg_211_1.var_.characterEffect1095ui_story = var_214_4:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_214_6 = 0.200000002980232

			if var_214_5 <= arg_211_1.time_ and arg_211_1.time_ < var_214_5 + var_214_6 then
				local var_214_7 = (arg_211_1.time_ - var_214_5) / var_214_6

				if arg_211_1.var_.characterEffect1095ui_story then
					local var_214_8 = Mathf.Lerp(0, 0.5, var_214_7)

					arg_211_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_211_1.var_.characterEffect1095ui_story.fillRatio = var_214_8
				end
			end

			if arg_211_1.time_ >= var_214_5 + var_214_6 and arg_211_1.time_ < var_214_5 + var_214_6 + arg_214_0 and arg_211_1.var_.characterEffect1095ui_story then
				local var_214_9 = 0.5

				arg_211_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_211_1.var_.characterEffect1095ui_story.fillRatio = var_214_9
			end

			local var_214_10 = 0
			local var_214_11 = 0.1

			if var_214_10 < arg_211_1.time_ and arg_211_1.time_ <= var_214_10 + arg_214_0 then
				arg_211_1.talkMaxDuration = 0
				arg_211_1.dialogCg_.alpha = 1

				arg_211_1.dialog_:SetActive(true)
				SetActive(arg_211_1.leftNameGo_, true)

				local var_214_12 = arg_211_1:FormatText(StoryNameCfg[6].name)

				arg_211_1.leftNameTxt_.text = var_214_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_211_1.leftNameTxt_.transform)

				arg_211_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_211_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_211_1:RecordName(arg_211_1.leftNameTxt_.text)
				SetActive(arg_211_1.iconTrs_.gameObject, false)
				arg_211_1.callingController_:SetSelectedState("normal")

				local var_214_13 = arg_211_1:GetWordFromCfg(319301052)
				local var_214_14 = arg_211_1:FormatText(var_214_13.content)

				arg_211_1.text_.text = var_214_14

				LuaForUtil.ClearLinePrefixSymbol(arg_211_1.text_)

				local var_214_15 = 4
				local var_214_16 = utf8.len(var_214_14)
				local var_214_17 = var_214_15 <= 0 and var_214_11 or var_214_11 * (var_214_16 / var_214_15)

				if var_214_17 > 0 and var_214_11 < var_214_17 then
					arg_211_1.talkMaxDuration = var_214_17

					if var_214_17 + var_214_10 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_17 + var_214_10
					end
				end

				arg_211_1.text_.text = var_214_14
				arg_211_1.typewritter.percent = 0

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301052", "story_v_out_319301.awb") ~= 0 then
					local var_214_18 = manager.audio:GetVoiceLength("story_v_out_319301", "319301052", "story_v_out_319301.awb") / 1000

					if var_214_18 + var_214_10 > arg_211_1.duration_ then
						arg_211_1.duration_ = var_214_18 + var_214_10
					end

					if var_214_13.prefab_name ~= "" and arg_211_1.actors_[var_214_13.prefab_name] ~= nil then
						local var_214_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_211_1.actors_[var_214_13.prefab_name].transform, "story_v_out_319301", "319301052", "story_v_out_319301.awb")

						arg_211_1:RecordAudio("319301052", var_214_19)
						arg_211_1:RecordAudio("319301052", var_214_19)
					else
						arg_211_1:AudioAction("play", "voice", "story_v_out_319301", "319301052", "story_v_out_319301.awb")
					end

					arg_211_1:RecordHistoryTalkVoice("story_v_out_319301", "319301052", "story_v_out_319301.awb")
				end

				arg_211_1:RecordContent(arg_211_1.text_.text)
			end

			local var_214_20 = math.max(var_214_11, arg_211_1.talkMaxDuration)

			if var_214_10 <= arg_211_1.time_ and arg_211_1.time_ < var_214_10 + var_214_20 then
				arg_211_1.typewritter.percent = (arg_211_1.time_ - var_214_10) / var_214_20

				arg_211_1.typewritter:SetDirty()
			end

			if arg_211_1.time_ >= var_214_10 + var_214_20 and arg_211_1.time_ < var_214_10 + var_214_20 + arg_214_0 then
				arg_211_1.typewritter.percent = 1

				arg_211_1.typewritter:SetDirty()
				arg_211_1:ShowNextGo(true)
			end
		end
	end,
	Play319301053 = function(arg_215_0, arg_215_1)
		arg_215_1.time_ = 0
		arg_215_1.frameCnt_ = 0
		arg_215_1.state_ = "playing"
		arg_215_1.curTalkId_ = 319301053
		arg_215_1.duration_ = 9

		local var_215_0 = {
			zh = 5.766,
			ja = 9
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
				arg_215_0:Play319301054(arg_215_1)
			end
		end

		function arg_215_1.onSingleLineUpdate_(arg_218_0)
			local var_218_0 = arg_215_1.actors_["10079ui_story"]
			local var_218_1 = 0

			if var_218_1 < arg_215_1.time_ and arg_215_1.time_ <= var_218_1 + arg_218_0 and arg_215_1.var_.characterEffect10079ui_story == nil then
				arg_215_1.var_.characterEffect10079ui_story = var_218_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_2 = 0.200000002980232

			if var_218_1 <= arg_215_1.time_ and arg_215_1.time_ < var_218_1 + var_218_2 then
				local var_218_3 = (arg_215_1.time_ - var_218_1) / var_218_2

				if arg_215_1.var_.characterEffect10079ui_story then
					local var_218_4 = Mathf.Lerp(0, 0.5, var_218_3)

					arg_215_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_215_1.var_.characterEffect10079ui_story.fillRatio = var_218_4
				end
			end

			if arg_215_1.time_ >= var_218_1 + var_218_2 and arg_215_1.time_ < var_218_1 + var_218_2 + arg_218_0 and arg_215_1.var_.characterEffect10079ui_story then
				local var_218_5 = 0.5

				arg_215_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_215_1.var_.characterEffect10079ui_story.fillRatio = var_218_5
			end

			local var_218_6 = arg_215_1.actors_["1095ui_story"]
			local var_218_7 = 0

			if var_218_7 < arg_215_1.time_ and arg_215_1.time_ <= var_218_7 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story == nil then
				arg_215_1.var_.characterEffect1095ui_story = var_218_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_218_8 = 0.200000002980232

			if var_218_7 <= arg_215_1.time_ and arg_215_1.time_ < var_218_7 + var_218_8 then
				local var_218_9 = (arg_215_1.time_ - var_218_7) / var_218_8

				if arg_215_1.var_.characterEffect1095ui_story then
					arg_215_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_215_1.time_ >= var_218_7 + var_218_8 and arg_215_1.time_ < var_218_7 + var_218_8 + arg_218_0 and arg_215_1.var_.characterEffect1095ui_story then
				arg_215_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_218_10 = 0
			local var_218_11 = 0.65

			if var_218_10 < arg_215_1.time_ and arg_215_1.time_ <= var_218_10 + arg_218_0 then
				arg_215_1.talkMaxDuration = 0
				arg_215_1.dialogCg_.alpha = 1

				arg_215_1.dialog_:SetActive(true)
				SetActive(arg_215_1.leftNameGo_, true)

				local var_218_12 = arg_215_1:FormatText(StoryNameCfg[471].name)

				arg_215_1.leftNameTxt_.text = var_218_12

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_215_1.leftNameTxt_.transform)

				arg_215_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_215_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_215_1:RecordName(arg_215_1.leftNameTxt_.text)
				SetActive(arg_215_1.iconTrs_.gameObject, false)
				arg_215_1.callingController_:SetSelectedState("normal")

				local var_218_13 = arg_215_1:GetWordFromCfg(319301053)
				local var_218_14 = arg_215_1:FormatText(var_218_13.content)

				arg_215_1.text_.text = var_218_14

				LuaForUtil.ClearLinePrefixSymbol(arg_215_1.text_)

				local var_218_15 = 26
				local var_218_16 = utf8.len(var_218_14)
				local var_218_17 = var_218_15 <= 0 and var_218_11 or var_218_11 * (var_218_16 / var_218_15)

				if var_218_17 > 0 and var_218_11 < var_218_17 then
					arg_215_1.talkMaxDuration = var_218_17

					if var_218_17 + var_218_10 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_17 + var_218_10
					end
				end

				arg_215_1.text_.text = var_218_14
				arg_215_1.typewritter.percent = 0

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301053", "story_v_out_319301.awb") ~= 0 then
					local var_218_18 = manager.audio:GetVoiceLength("story_v_out_319301", "319301053", "story_v_out_319301.awb") / 1000

					if var_218_18 + var_218_10 > arg_215_1.duration_ then
						arg_215_1.duration_ = var_218_18 + var_218_10
					end

					if var_218_13.prefab_name ~= "" and arg_215_1.actors_[var_218_13.prefab_name] ~= nil then
						local var_218_19 = LuaForUtil.PlayVoiceWithCriLipsync(arg_215_1.actors_[var_218_13.prefab_name].transform, "story_v_out_319301", "319301053", "story_v_out_319301.awb")

						arg_215_1:RecordAudio("319301053", var_218_19)
						arg_215_1:RecordAudio("319301053", var_218_19)
					else
						arg_215_1:AudioAction("play", "voice", "story_v_out_319301", "319301053", "story_v_out_319301.awb")
					end

					arg_215_1:RecordHistoryTalkVoice("story_v_out_319301", "319301053", "story_v_out_319301.awb")
				end

				arg_215_1:RecordContent(arg_215_1.text_.text)
			end

			local var_218_20 = math.max(var_218_11, arg_215_1.talkMaxDuration)

			if var_218_10 <= arg_215_1.time_ and arg_215_1.time_ < var_218_10 + var_218_20 then
				arg_215_1.typewritter.percent = (arg_215_1.time_ - var_218_10) / var_218_20

				arg_215_1.typewritter:SetDirty()
			end

			if arg_215_1.time_ >= var_218_10 + var_218_20 and arg_215_1.time_ < var_218_10 + var_218_20 + arg_218_0 then
				arg_215_1.typewritter.percent = 1

				arg_215_1.typewritter:SetDirty()
				arg_215_1:ShowNextGo(true)
			end
		end
	end,
	Play319301054 = function(arg_219_0, arg_219_1)
		arg_219_1.time_ = 0
		arg_219_1.frameCnt_ = 0
		arg_219_1.state_ = "playing"
		arg_219_1.curTalkId_ = 319301054
		arg_219_1.duration_ = 8.4

		local var_219_0 = {
			zh = 7.033,
			ja = 8.4
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
				arg_219_0:Play319301055(arg_219_1)
			end
		end

		function arg_219_1.onSingleLineUpdate_(arg_222_0)
			local var_222_0 = arg_219_1.actors_["1095ui_story"].transform
			local var_222_1 = 0

			if var_222_1 < arg_219_1.time_ and arg_219_1.time_ <= var_222_1 + arg_222_0 then
				arg_219_1.var_.moveOldPos1095ui_story = var_222_0.localPosition
			end

			local var_222_2 = 0.001

			if var_222_1 <= arg_219_1.time_ and arg_219_1.time_ < var_222_1 + var_222_2 then
				local var_222_3 = (arg_219_1.time_ - var_222_1) / var_222_2
				local var_222_4 = Vector3.New(-0.7, -0.98, -6.1)

				var_222_0.localPosition = Vector3.Lerp(arg_219_1.var_.moveOldPos1095ui_story, var_222_4, var_222_3)

				local var_222_5 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_5.x, var_222_5.y, var_222_5.z)

				local var_222_6 = var_222_0.localEulerAngles

				var_222_6.z = 0
				var_222_6.x = 0
				var_222_0.localEulerAngles = var_222_6
			end

			if arg_219_1.time_ >= var_222_1 + var_222_2 and arg_219_1.time_ < var_222_1 + var_222_2 + arg_222_0 then
				var_222_0.localPosition = Vector3.New(-0.7, -0.98, -6.1)

				local var_222_7 = manager.ui.mainCamera.transform.position - var_222_0.position

				var_222_0.forward = Vector3.New(var_222_7.x, var_222_7.y, var_222_7.z)

				local var_222_8 = var_222_0.localEulerAngles

				var_222_8.z = 0
				var_222_8.x = 0
				var_222_0.localEulerAngles = var_222_8
			end

			local var_222_9 = arg_219_1.actors_["1095ui_story"]
			local var_222_10 = 0

			if var_222_10 < arg_219_1.time_ and arg_219_1.time_ <= var_222_10 + arg_222_0 and arg_219_1.var_.characterEffect1095ui_story == nil then
				arg_219_1.var_.characterEffect1095ui_story = var_222_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_222_11 = 0.200000002980232

			if var_222_10 <= arg_219_1.time_ and arg_219_1.time_ < var_222_10 + var_222_11 then
				local var_222_12 = (arg_219_1.time_ - var_222_10) / var_222_11

				if arg_219_1.var_.characterEffect1095ui_story then
					arg_219_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_219_1.time_ >= var_222_10 + var_222_11 and arg_219_1.time_ < var_222_10 + var_222_11 + arg_222_0 and arg_219_1.var_.characterEffect1095ui_story then
				arg_219_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_222_13 = 0
			local var_222_14 = 0.875

			if var_222_13 < arg_219_1.time_ and arg_219_1.time_ <= var_222_13 + arg_222_0 then
				arg_219_1.talkMaxDuration = 0
				arg_219_1.dialogCg_.alpha = 1

				arg_219_1.dialog_:SetActive(true)
				SetActive(arg_219_1.leftNameGo_, true)

				local var_222_15 = arg_219_1:FormatText(StoryNameCfg[471].name)

				arg_219_1.leftNameTxt_.text = var_222_15

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_219_1.leftNameTxt_.transform)

				arg_219_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_219_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_219_1:RecordName(arg_219_1.leftNameTxt_.text)
				SetActive(arg_219_1.iconTrs_.gameObject, false)
				arg_219_1.callingController_:SetSelectedState("normal")

				local var_222_16 = arg_219_1:GetWordFromCfg(319301054)
				local var_222_17 = arg_219_1:FormatText(var_222_16.content)

				arg_219_1.text_.text = var_222_17

				LuaForUtil.ClearLinePrefixSymbol(arg_219_1.text_)

				local var_222_18 = 35
				local var_222_19 = utf8.len(var_222_17)
				local var_222_20 = var_222_18 <= 0 and var_222_14 or var_222_14 * (var_222_19 / var_222_18)

				if var_222_20 > 0 and var_222_14 < var_222_20 then
					arg_219_1.talkMaxDuration = var_222_20

					if var_222_20 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_20 + var_222_13
					end
				end

				arg_219_1.text_.text = var_222_17
				arg_219_1.typewritter.percent = 0

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301054", "story_v_out_319301.awb") ~= 0 then
					local var_222_21 = manager.audio:GetVoiceLength("story_v_out_319301", "319301054", "story_v_out_319301.awb") / 1000

					if var_222_21 + var_222_13 > arg_219_1.duration_ then
						arg_219_1.duration_ = var_222_21 + var_222_13
					end

					if var_222_16.prefab_name ~= "" and arg_219_1.actors_[var_222_16.prefab_name] ~= nil then
						local var_222_22 = LuaForUtil.PlayVoiceWithCriLipsync(arg_219_1.actors_[var_222_16.prefab_name].transform, "story_v_out_319301", "319301054", "story_v_out_319301.awb")

						arg_219_1:RecordAudio("319301054", var_222_22)
						arg_219_1:RecordAudio("319301054", var_222_22)
					else
						arg_219_1:AudioAction("play", "voice", "story_v_out_319301", "319301054", "story_v_out_319301.awb")
					end

					arg_219_1:RecordHistoryTalkVoice("story_v_out_319301", "319301054", "story_v_out_319301.awb")
				end

				arg_219_1:RecordContent(arg_219_1.text_.text)
			end

			local var_222_23 = math.max(var_222_14, arg_219_1.talkMaxDuration)

			if var_222_13 <= arg_219_1.time_ and arg_219_1.time_ < var_222_13 + var_222_23 then
				arg_219_1.typewritter.percent = (arg_219_1.time_ - var_222_13) / var_222_23

				arg_219_1.typewritter:SetDirty()
			end

			if arg_219_1.time_ >= var_222_13 + var_222_23 and arg_219_1.time_ < var_222_13 + var_222_23 + arg_222_0 then
				arg_219_1.typewritter.percent = 1

				arg_219_1.typewritter:SetDirty()
				arg_219_1:ShowNextGo(true)
			end
		end
	end,
	Play319301055 = function(arg_223_0, arg_223_1)
		arg_223_1.time_ = 0
		arg_223_1.frameCnt_ = 0
		arg_223_1.state_ = "playing"
		arg_223_1.curTalkId_ = 319301055
		arg_223_1.duration_ = 3.9

		local var_223_0 = {
			zh = 3.066,
			ja = 3.9
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
				arg_223_0:Play319301056(arg_223_1)
			end
		end

		function arg_223_1.onSingleLineUpdate_(arg_226_0)
			local var_226_0 = arg_223_1.actors_["10079ui_story"].transform
			local var_226_1 = 0

			if var_226_1 < arg_223_1.time_ and arg_223_1.time_ <= var_226_1 + arg_226_0 then
				arg_223_1.var_.moveOldPos10079ui_story = var_226_0.localPosition
			end

			local var_226_2 = 0.001

			if var_226_1 <= arg_223_1.time_ and arg_223_1.time_ < var_226_1 + var_226_2 then
				local var_226_3 = (arg_223_1.time_ - var_226_1) / var_226_2
				local var_226_4 = Vector3.New(0.7, -0.95, -6.05)

				var_226_0.localPosition = Vector3.Lerp(arg_223_1.var_.moveOldPos10079ui_story, var_226_4, var_226_3)

				local var_226_5 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_5.x, var_226_5.y, var_226_5.z)

				local var_226_6 = var_226_0.localEulerAngles

				var_226_6.z = 0
				var_226_6.x = 0
				var_226_0.localEulerAngles = var_226_6
			end

			if arg_223_1.time_ >= var_226_1 + var_226_2 and arg_223_1.time_ < var_226_1 + var_226_2 + arg_226_0 then
				var_226_0.localPosition = Vector3.New(0.7, -0.95, -6.05)

				local var_226_7 = manager.ui.mainCamera.transform.position - var_226_0.position

				var_226_0.forward = Vector3.New(var_226_7.x, var_226_7.y, var_226_7.z)

				local var_226_8 = var_226_0.localEulerAngles

				var_226_8.z = 0
				var_226_8.x = 0
				var_226_0.localEulerAngles = var_226_8
			end

			local var_226_9 = arg_223_1.actors_["10079ui_story"]
			local var_226_10 = 0

			if var_226_10 < arg_223_1.time_ and arg_223_1.time_ <= var_226_10 + arg_226_0 and arg_223_1.var_.characterEffect10079ui_story == nil then
				arg_223_1.var_.characterEffect10079ui_story = var_226_9:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_11 = 0.200000002980232

			if var_226_10 <= arg_223_1.time_ and arg_223_1.time_ < var_226_10 + var_226_11 then
				local var_226_12 = (arg_223_1.time_ - var_226_10) / var_226_11

				if arg_223_1.var_.characterEffect10079ui_story then
					arg_223_1.var_.characterEffect10079ui_story.fillFlat = false
				end
			end

			if arg_223_1.time_ >= var_226_10 + var_226_11 and arg_223_1.time_ < var_226_10 + var_226_11 + arg_226_0 and arg_223_1.var_.characterEffect10079ui_story then
				arg_223_1.var_.characterEffect10079ui_story.fillFlat = false
			end

			local var_226_13 = 0

			if var_226_13 < arg_223_1.time_ and arg_223_1.time_ <= var_226_13 + arg_226_0 then
				arg_223_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/1084/1084action/1084action3_2")
			end

			local var_226_14 = 0

			if var_226_14 < arg_223_1.time_ and arg_223_1.time_ <= var_226_14 + arg_226_0 then
				arg_223_1:PlayTimeline("10079ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0102cva")
			end

			local var_226_15 = arg_223_1.actors_["1095ui_story"]
			local var_226_16 = 0

			if var_226_16 < arg_223_1.time_ and arg_223_1.time_ <= var_226_16 + arg_226_0 and arg_223_1.var_.characterEffect1095ui_story == nil then
				arg_223_1.var_.characterEffect1095ui_story = var_226_15:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_226_17 = 0.200000002980232

			if var_226_16 <= arg_223_1.time_ and arg_223_1.time_ < var_226_16 + var_226_17 then
				local var_226_18 = (arg_223_1.time_ - var_226_16) / var_226_17

				if arg_223_1.var_.characterEffect1095ui_story then
					local var_226_19 = Mathf.Lerp(0, 0.5, var_226_18)

					arg_223_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_223_1.var_.characterEffect1095ui_story.fillRatio = var_226_19
				end
			end

			if arg_223_1.time_ >= var_226_16 + var_226_17 and arg_223_1.time_ < var_226_16 + var_226_17 + arg_226_0 and arg_223_1.var_.characterEffect1095ui_story then
				local var_226_20 = 0.5

				arg_223_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_223_1.var_.characterEffect1095ui_story.fillRatio = var_226_20
			end

			local var_226_21 = 0
			local var_226_22 = 0.375

			if var_226_21 < arg_223_1.time_ and arg_223_1.time_ <= var_226_21 + arg_226_0 then
				arg_223_1.talkMaxDuration = 0
				arg_223_1.dialogCg_.alpha = 1

				arg_223_1.dialog_:SetActive(true)
				SetActive(arg_223_1.leftNameGo_, true)

				local var_226_23 = arg_223_1:FormatText(StoryNameCfg[6].name)

				arg_223_1.leftNameTxt_.text = var_226_23

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_223_1.leftNameTxt_.transform)

				arg_223_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_223_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_223_1:RecordName(arg_223_1.leftNameTxt_.text)
				SetActive(arg_223_1.iconTrs_.gameObject, false)
				arg_223_1.callingController_:SetSelectedState("normal")

				local var_226_24 = arg_223_1:GetWordFromCfg(319301055)
				local var_226_25 = arg_223_1:FormatText(var_226_24.content)

				arg_223_1.text_.text = var_226_25

				LuaForUtil.ClearLinePrefixSymbol(arg_223_1.text_)

				local var_226_26 = 15
				local var_226_27 = utf8.len(var_226_25)
				local var_226_28 = var_226_26 <= 0 and var_226_22 or var_226_22 * (var_226_27 / var_226_26)

				if var_226_28 > 0 and var_226_22 < var_226_28 then
					arg_223_1.talkMaxDuration = var_226_28

					if var_226_28 + var_226_21 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_28 + var_226_21
					end
				end

				arg_223_1.text_.text = var_226_25
				arg_223_1.typewritter.percent = 0

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(false)

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301055", "story_v_out_319301.awb") ~= 0 then
					local var_226_29 = manager.audio:GetVoiceLength("story_v_out_319301", "319301055", "story_v_out_319301.awb") / 1000

					if var_226_29 + var_226_21 > arg_223_1.duration_ then
						arg_223_1.duration_ = var_226_29 + var_226_21
					end

					if var_226_24.prefab_name ~= "" and arg_223_1.actors_[var_226_24.prefab_name] ~= nil then
						local var_226_30 = LuaForUtil.PlayVoiceWithCriLipsync(arg_223_1.actors_[var_226_24.prefab_name].transform, "story_v_out_319301", "319301055", "story_v_out_319301.awb")

						arg_223_1:RecordAudio("319301055", var_226_30)
						arg_223_1:RecordAudio("319301055", var_226_30)
					else
						arg_223_1:AudioAction("play", "voice", "story_v_out_319301", "319301055", "story_v_out_319301.awb")
					end

					arg_223_1:RecordHistoryTalkVoice("story_v_out_319301", "319301055", "story_v_out_319301.awb")
				end

				arg_223_1:RecordContent(arg_223_1.text_.text)
			end

			local var_226_31 = math.max(var_226_22, arg_223_1.talkMaxDuration)

			if var_226_21 <= arg_223_1.time_ and arg_223_1.time_ < var_226_21 + var_226_31 then
				arg_223_1.typewritter.percent = (arg_223_1.time_ - var_226_21) / var_226_31

				arg_223_1.typewritter:SetDirty()
			end

			if arg_223_1.time_ >= var_226_21 + var_226_31 and arg_223_1.time_ < var_226_21 + var_226_31 + arg_226_0 then
				arg_223_1.typewritter.percent = 1

				arg_223_1.typewritter:SetDirty()
				arg_223_1:ShowNextGo(true)
			end
		end
	end,
	Play319301056 = function(arg_227_0, arg_227_1)
		arg_227_1.time_ = 0
		arg_227_1.frameCnt_ = 0
		arg_227_1.state_ = "playing"
		arg_227_1.curTalkId_ = 319301056
		arg_227_1.duration_ = 5.633

		local var_227_0 = {
			zh = 5.633,
			ja = 4.6
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
				arg_227_0:Play319301057(arg_227_1)
			end
		end

		function arg_227_1.onSingleLineUpdate_(arg_230_0)
			local var_230_0 = arg_227_1.actors_["10079ui_story"]
			local var_230_1 = 0

			if var_230_1 < arg_227_1.time_ and arg_227_1.time_ <= var_230_1 + arg_230_0 and arg_227_1.var_.characterEffect10079ui_story == nil then
				arg_227_1.var_.characterEffect10079ui_story = var_230_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_2 = 0.200000002980232

			if var_230_1 <= arg_227_1.time_ and arg_227_1.time_ < var_230_1 + var_230_2 then
				local var_230_3 = (arg_227_1.time_ - var_230_1) / var_230_2

				if arg_227_1.var_.characterEffect10079ui_story then
					local var_230_4 = Mathf.Lerp(0, 0.5, var_230_3)

					arg_227_1.var_.characterEffect10079ui_story.fillFlat = true
					arg_227_1.var_.characterEffect10079ui_story.fillRatio = var_230_4
				end
			end

			if arg_227_1.time_ >= var_230_1 + var_230_2 and arg_227_1.time_ < var_230_1 + var_230_2 + arg_230_0 and arg_227_1.var_.characterEffect10079ui_story then
				local var_230_5 = 0.5

				arg_227_1.var_.characterEffect10079ui_story.fillFlat = true
				arg_227_1.var_.characterEffect10079ui_story.fillRatio = var_230_5
			end

			local var_230_6 = arg_227_1.actors_["1095ui_story"]
			local var_230_7 = 0

			if var_230_7 < arg_227_1.time_ and arg_227_1.time_ <= var_230_7 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story == nil then
				arg_227_1.var_.characterEffect1095ui_story = var_230_6:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_230_8 = 0.200000002980232

			if var_230_7 <= arg_227_1.time_ and arg_227_1.time_ < var_230_7 + var_230_8 then
				local var_230_9 = (arg_227_1.time_ - var_230_7) / var_230_8

				if arg_227_1.var_.characterEffect1095ui_story then
					arg_227_1.var_.characterEffect1095ui_story.fillFlat = false
				end
			end

			if arg_227_1.time_ >= var_230_7 + var_230_8 and arg_227_1.time_ < var_230_7 + var_230_8 + arg_230_0 and arg_227_1.var_.characterEffect1095ui_story then
				arg_227_1.var_.characterEffect1095ui_story.fillFlat = false
			end

			local var_230_10 = 0

			if var_230_10 < arg_227_1.time_ and arg_227_1.time_ <= var_230_10 + arg_230_0 then
				arg_227_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/public_expression/public_lipsync/publicface0101cva")
			end

			local var_230_11 = 0

			if var_230_11 < arg_227_1.time_ and arg_227_1.time_ <= var_230_11 + arg_230_0 then
				arg_227_1:PlayTimeline("1095ui_story", "StoryTimeline/CharAction/story1095/story1095action/1095action3_1")
			end

			local var_230_12 = 0
			local var_230_13 = 0.675

			if var_230_12 < arg_227_1.time_ and arg_227_1.time_ <= var_230_12 + arg_230_0 then
				arg_227_1.talkMaxDuration = 0
				arg_227_1.dialogCg_.alpha = 1

				arg_227_1.dialog_:SetActive(true)
				SetActive(arg_227_1.leftNameGo_, true)

				local var_230_14 = arg_227_1:FormatText(StoryNameCfg[471].name)

				arg_227_1.leftNameTxt_.text = var_230_14

				UnityEngine.UI.LayoutRebuilder.ForceRebuildLayoutImmediate(arg_227_1.leftNameTxt_.transform)

				arg_227_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_227_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_227_1:RecordName(arg_227_1.leftNameTxt_.text)
				SetActive(arg_227_1.iconTrs_.gameObject, false)
				arg_227_1.callingController_:SetSelectedState("normal")

				local var_230_15 = arg_227_1:GetWordFromCfg(319301056)
				local var_230_16 = arg_227_1:FormatText(var_230_15.content)

				arg_227_1.text_.text = var_230_16

				LuaForUtil.ClearLinePrefixSymbol(arg_227_1.text_)

				local var_230_17 = 27
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

				if manager.audio:GetVoiceLength("story_v_out_319301", "319301056", "story_v_out_319301.awb") ~= 0 then
					local var_230_20 = manager.audio:GetVoiceLength("story_v_out_319301", "319301056", "story_v_out_319301.awb") / 1000

					if var_230_20 + var_230_12 > arg_227_1.duration_ then
						arg_227_1.duration_ = var_230_20 + var_230_12
					end

					if var_230_15.prefab_name ~= "" and arg_227_1.actors_[var_230_15.prefab_name] ~= nil then
						local var_230_21 = LuaForUtil.PlayVoiceWithCriLipsync(arg_227_1.actors_[var_230_15.prefab_name].transform, "story_v_out_319301", "319301056", "story_v_out_319301.awb")

						arg_227_1:RecordAudio("319301056", var_230_21)
						arg_227_1:RecordAudio("319301056", var_230_21)
					else
						arg_227_1:AudioAction("play", "voice", "story_v_out_319301", "319301056", "story_v_out_319301.awb")
					end

					arg_227_1:RecordHistoryTalkVoice("story_v_out_319301", "319301056", "story_v_out_319301.awb")
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
	Play319301057 = function(arg_231_0, arg_231_1)
		arg_231_1.time_ = 0
		arg_231_1.frameCnt_ = 0
		arg_231_1.state_ = "playing"
		arg_231_1.curTalkId_ = 319301057
		arg_231_1.duration_ = 5

		SetActive(arg_231_1.tipsGo_, false)

		function arg_231_1.onSingleLineFinish_()
			arg_231_1.onSingleLineUpdate_ = nil
			arg_231_1.onSingleLineFinish_ = nil
			arg_231_1.state_ = "waiting"
			arg_231_1.auto_ = false
		end

		function arg_231_1.playNext_(arg_233_0)
			arg_231_1.onStoryFinished_()
		end

		function arg_231_1.onSingleLineUpdate_(arg_234_0)
			local var_234_0 = arg_231_1.actors_["1095ui_story"]
			local var_234_1 = 0

			if var_234_1 < arg_231_1.time_ and arg_231_1.time_ <= var_234_1 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story == nil then
				arg_231_1.var_.characterEffect1095ui_story = var_234_0:GetComponentInChildren(typeof(CharacterEffect))
			end

			local var_234_2 = 0.200000002980232

			if var_234_1 <= arg_231_1.time_ and arg_231_1.time_ < var_234_1 + var_234_2 then
				local var_234_3 = (arg_231_1.time_ - var_234_1) / var_234_2

				if arg_231_1.var_.characterEffect1095ui_story then
					local var_234_4 = Mathf.Lerp(0, 0.5, var_234_3)

					arg_231_1.var_.characterEffect1095ui_story.fillFlat = true
					arg_231_1.var_.characterEffect1095ui_story.fillRatio = var_234_4
				end
			end

			if arg_231_1.time_ >= var_234_1 + var_234_2 and arg_231_1.time_ < var_234_1 + var_234_2 + arg_234_0 and arg_231_1.var_.characterEffect1095ui_story then
				local var_234_5 = 0.5

				arg_231_1.var_.characterEffect1095ui_story.fillFlat = true
				arg_231_1.var_.characterEffect1095ui_story.fillRatio = var_234_5
			end

			local var_234_6 = 0
			local var_234_7 = 1.1

			if var_234_6 < arg_231_1.time_ and arg_231_1.time_ <= var_234_6 + arg_234_0 then
				arg_231_1.talkMaxDuration = 0
				arg_231_1.dialogCg_.alpha = 1

				arg_231_1.dialog_:SetActive(true)
				SetActive(arg_231_1.leftNameGo_, false)

				arg_231_1.contentImage_.sprite = getSpriteWithoutAtlas("TextureConfig/Common/board_dialogue_narrator")
				arg_231_1.contentRectCom_.sizeDelta = Vector2(1644, 265)

				arg_231_1:RecordName(arg_231_1:FormatText(GetTips("TIP_NARRATOR")))
				SetActive(arg_231_1.iconTrs_.gameObject, false)
				arg_231_1.callingController_:SetSelectedState("normal")

				local var_234_8 = arg_231_1:GetWordFromCfg(319301057)
				local var_234_9 = arg_231_1:FormatText(var_234_8.content)

				arg_231_1.text_.text = var_234_9

				LuaForUtil.ClearLinePrefixSymbol(arg_231_1.text_)

				local var_234_10 = 44
				local var_234_11 = utf8.len(var_234_9)
				local var_234_12 = var_234_10 <= 0 and var_234_7 or var_234_7 * (var_234_11 / var_234_10)

				if var_234_12 > 0 and var_234_7 < var_234_12 then
					arg_231_1.talkMaxDuration = var_234_12

					if var_234_12 + var_234_6 > arg_231_1.duration_ then
						arg_231_1.duration_ = var_234_12 + var_234_6
					end
				end

				arg_231_1.text_.text = var_234_9
				arg_231_1.typewritter.percent = 0

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(false)
				arg_231_1:RecordContent(arg_231_1.text_.text)
			end

			local var_234_13 = math.max(var_234_7, arg_231_1.talkMaxDuration)

			if var_234_6 <= arg_231_1.time_ and arg_231_1.time_ < var_234_6 + var_234_13 then
				arg_231_1.typewritter.percent = (arg_231_1.time_ - var_234_6) / var_234_13

				arg_231_1.typewritter:SetDirty()
			end

			if arg_231_1.time_ >= var_234_6 + var_234_13 and arg_231_1.time_ < var_234_6 + var_234_13 + arg_234_0 then
				arg_231_1.typewritter.percent = 1

				arg_231_1.typewritter:SetDirty()
				arg_231_1:ShowNextGo(true)
			end
		end
	end,
	assets = {
		"Assets/UIResources/UI_AB/TextureConfig/Background/A08f"
	},
	voices = {
		"story_v_out_319301.awb"
	}
}
